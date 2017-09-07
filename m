From: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/4] clk: tegra: check BPMP response return code
Date: Thu, 7 Sep 2017 12:31:02 +0300
Message-ID: <6a69e270519fd1c7a12a335053bf59671abc3c4b.1504776489.git.talho@nvidia.com>
References: <cover.1504776489.git.talho@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1504776489.git.talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Check return code in BPMP response message(s). The typical error case
is when clock operation is attempted with invalid clock identifier.

Also remove error print from call to clk_get_info() as the
implementation loops through range of all possible identifier, but the
operation is expected error out when the clock id is unused.

Signed-off-by: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-bpmp.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
index 638ace6..a896692 100644
--- a/drivers/clk/tegra/clk-bpmp.c
+++ b/drivers/clk/tegra/clk-bpmp.c
@@ -55,6 +55,7 @@ struct tegra_bpmp_clk_message {
 	struct {
 		void *data;
 		size_t size;
+		int ret;
 	} rx;
 };
 
@@ -64,6 +65,7 @@ static int tegra_bpmp_clk_transfer(struct tegra_bpmp *bpmp,
 	struct mrq_clk_request request;
 	struct tegra_bpmp_message msg;
 	void *req = &request;
+	int err;
 
 	memset(&request, 0, sizeof(request));
 	request.cmd_and_id = (clk->cmd << 24) | clk->id;
@@ -84,7 +86,13 @@ static int tegra_bpmp_clk_transfer(struct tegra_bpmp *bpmp,
 	msg.rx.data = clk->rx.data;
 	msg.rx.size = clk->rx.size;
 
-	return tegra_bpmp_transfer(bpmp, &msg);
+	err = tegra_bpmp_transfer(bpmp, &msg);
+	if (err < 0)
+		return err;
+	else if (msg.rx.ret < 0)
+		return -EINVAL;
+
+	return 0;
 }
 
 static int tegra_bpmp_clk_prepare(struct clk_hw *hw)
@@ -414,11 +422,8 @@ static int tegra_bpmp_probe_clocks(struct tegra_bpmp *bpmp,
 		struct tegra_bpmp_clk_info *info = &clocks[count];
 
 		err = tegra_bpmp_clk_get_info(bpmp, id, info);
-		if (err < 0) {
-			dev_err(bpmp->dev, "failed to query clock %u: %d\n",
-				id, err);
+		if (err < 0)
 			continue;
-		}
 
 		if (info->num_parents >= U8_MAX) {
 			dev_err(bpmp->dev,
-- 
2.7.4
