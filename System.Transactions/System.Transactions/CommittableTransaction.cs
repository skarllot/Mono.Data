//
// CommittableTransaction.cs
//
// Author:
//	Atsushi Enomoto  <atsushi@ximian.com>
//	Ankit Jain	 <JAnkit@novell.com>
//
// (C)2005 Novell Inc,
// (C)2006 Novell Inc,
//

#if NET_2_0
using System.Threading;

namespace System.Transactions
{
    public sealed class CommittableTransaction : Transaction,
                                                 IDisposable, System.IAsyncResult
    {
        private TransactionOptions options;

        private AsyncCallback callback;
        private object user_defined_state;

        private IAsyncResult asyncResult;

        public CommittableTransaction()
            : this(new TransactionOptions())
        {
        }

        public CommittableTransaction(TimeSpan timeout)
        {
            options = new TransactionOptions();
            options.Timeout = timeout;
        }

        public CommittableTransaction(TransactionOptions options)
        {
            this.options = options;
        }

        public IAsyncResult BeginCommit(AsyncCallback callback,
                                        object user_defined_state)
        {
            this.callback = callback;
            this.user_defined_state = user_defined_state;

            AsyncCallback cb = null;
            if (callback != null)
                cb = new AsyncCallback(CommitCallback);

            asyncResult = BeginCommitInternal(cb);
            return this;
        }

        public void EndCommit(IAsyncResult ar)
        {
            if (ar != this)
                throw new ArgumentException(
                    "The IAsyncResult parameter must be the same parameter as returned by BeginCommit.", "asyncResult");

            EndCommitInternal(asyncResult);
        }

        private void CommitCallback(IAsyncResult ar)
        {
            if (asyncResult == null && ar.CompletedSynchronously)
                asyncResult = ar;
            callback(this);
        }

        public void Commit()
        {
            CommitInternal();
        }

        object IAsyncResult.AsyncState
        {
            get { return user_defined_state; }
        }

        WaitHandle IAsyncResult.AsyncWaitHandle
        {
            get { return asyncResult.AsyncWaitHandle; }
        }

        bool IAsyncResult.CompletedSynchronously
        {
            get { return asyncResult.CompletedSynchronously; }
        }

        bool IAsyncResult.IsCompleted
        {
            get { return asyncResult.IsCompleted; }
        }
    }
}

#endif