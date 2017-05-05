From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] firmware: tegra: fix locking bugs in bpmp
Date: Fri, 5 May 2017 08:37:23 +0300
Message-ID: <20170505053723.53qi4ob3df4ri2v4@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

There are a bunch of error paths were we don't unlock the bpmp->threaded
lock.  Also if __tegra_bpmp_channel_write() fails then we returned
success instead of an error code.

Fixes: 983de5f97169 ("firmware: tegra: Add BPMP support")
Signed-off-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 84e4c9a58a0c..dffdfb4e9da0 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -211,14 +211,17 @@ static ssize_t tegra_bpmp_channel_read(struct tegra_bpmp_channel *channel,
 	int index;
 
 	index = tegra_bpmp_channel_get_thread_index(channel);
-	if (index < 0)
-		return index;
+	if (index < 0) {
+		err = index;
+		goto unlock;
+	}
 
 	spin_lock_irqsave(&bpmp->lock, flags);
 	err = __tegra_bpmp_channel_read(channel, data, size);
 	clear_bit(index, bpmp->threaded.allocated);
 	spin_unlock_irqrestore(&bpmp->lock, flags);
 
+unlock:
 	up(&bpmp->threaded.lock);
 
 	return err;
@@ -256,35 +259,40 @@ tegra_bpmp_write_threaded(struct tegra_bpmp *bpmp, unsigned int mrq,
 
 	index = find_first_zero_bit(bpmp->threaded.allocated, count);
 	if (index == count) {
-		channel = ERR_PTR(-EBUSY);
-		goto unlock;
+		err = -EBUSY;
+		goto err_unlock;
 	}
 
 	channel = tegra_bpmp_channel_get_thread(bpmp, index);
 	if (!channel) {
-		channel = ERR_PTR(-EINVAL);
-		goto unlock;
+		err = -EINVAL;
+		goto err_unlock;
 	}
 
 	if (!tegra_bpmp_master_free(channel)) {
-		channel = ERR_PTR(-EBUSY);
-		goto unlock;
+		err = -EBUSY;
+		goto err_unlock;
 	}
 
 	set_bit(index, bpmp->threaded.allocated);
 
 	err = __tegra_bpmp_channel_write(channel, mrq, MSG_ACK | MSG_RING,
 					 data, size);
-	if (err < 0) {
-		clear_bit(index, bpmp->threaded.allocated);
-		goto unlock;
-	}
+	if (err < 0)
+		goto err_clear_allocated;
 
 	set_bit(index, bpmp->threaded.busy);
 
-unlock:
 	spin_unlock_irqrestore(&bpmp->lock, flags);
 	return channel;
+
+err_clear_allocated:
+	clear_bit(index, bpmp->threaded.allocated);
+err_unlock:
+	spin_unlock_irqrestore(&bpmp->lock, flags);
+	up(&bpmp->threaded.lock);
+
+	return ERR_PTR(err);
 }
 
 static ssize_t tegra_bpmp_channel_write(struct tegra_bpmp_channel *channel,
