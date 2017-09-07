From: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/4] firmware: tegra: propagate error code to caller
Date: Thu, 7 Sep 2017 12:31:01 +0300
Message-ID: <c349d38a8cb1d00a4dc11d6aa286fb392017bc8c.1504776489.git.talho@nvidia.com>
References: <cover.1504776489.git.talho@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1504776489.git.talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Response messages from Tegra BPMP firmware contain an error return
code as the first word of payload. The error code is used to indicate
incorrectly formatted request message or use of non-existing resource
(clk, reset, powergate) identifier. Current implementation of
tegra_bpmp_transfer() ignores this code and does not pass it to
caller. Fix this by adding an extra struct member to
tegra_bpmp_message and populate that with return code.

Signed-off-by: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/firmware/tegra/bpmp.c | 22 ++++++++++++++++------
 include/soc/tegra/bpmp.h      |  1 +
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 73ca55b..33683b5 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -194,16 +194,24 @@ static int tegra_bpmp_wait_master_free(struct tegra_bpmp_channel *channel)
 }
 
 static ssize_t __tegra_bpmp_channel_read(struct tegra_bpmp_channel *channel,
-					 void *data, size_t size)
+					 void *data, size_t size, int *ret)
 {
+	int err;
+
 	if (data && size > 0)
 		memcpy(data, channel->ib->data, size);
 
-	return tegra_ivc_read_advance(channel->ivc);
+	err = tegra_ivc_read_advance(channel->ivc);
+	if (err < 0)
+		return err;
+
+	*ret = channel->ib->code;
+
+	return 0;
 }
 
 static ssize_t tegra_bpmp_channel_read(struct tegra_bpmp_channel *channel,
-				       void *data, size_t size)
+				       void *data, size_t size, int *ret)
 {
 	struct tegra_bpmp *bpmp = channel->bpmp;
 	unsigned long flags;
@@ -217,7 +225,7 @@ static ssize_t tegra_bpmp_channel_read(struct tegra_bpmp_channel *channel,
 	}
 
 	spin_lock_irqsave(&bpmp->lock, flags);
-	err = __tegra_bpmp_channel_read(channel, data, size);
+	err = __tegra_bpmp_channel_read(channel, data, size, ret);
 	clear_bit(index, bpmp->threaded.allocated);
 	spin_unlock_irqrestore(&bpmp->lock, flags);
 
@@ -337,7 +345,8 @@ int tegra_bpmp_transfer_atomic(struct tegra_bpmp *bpmp,
 	if (err < 0)
 		return err;
 
-	return __tegra_bpmp_channel_read(channel, msg->rx.data, msg->rx.size);
+	return __tegra_bpmp_channel_read(channel, msg->rx.data, msg->rx.size,
+					 &msg->rx.ret);
 }
 EXPORT_SYMBOL_GPL(tegra_bpmp_transfer_atomic);
 
@@ -371,7 +380,8 @@ int tegra_bpmp_transfer(struct tegra_bpmp *bpmp,
 	if (err == 0)
 		return -ETIMEDOUT;
 
-	return tegra_bpmp_channel_read(channel, msg->rx.data, msg->rx.size);
+	return tegra_bpmp_channel_read(channel, msg->rx.data, msg->rx.size,
+				       &msg->rx.ret);
 }
 EXPORT_SYMBOL_GPL(tegra_bpmp_transfer);
 
diff --git a/include/soc/tegra/bpmp.h b/include/soc/tegra/bpmp.h
index 9ba6522..57519f4 100644
--- a/include/soc/tegra/bpmp.h
+++ b/include/soc/tegra/bpmp.h
@@ -110,6 +110,7 @@ struct tegra_bpmp_message {
 	struct {
 		void *data;
 		size_t size;
+		int ret;
 	} rx;
 };
 
-- 
2.7.4
