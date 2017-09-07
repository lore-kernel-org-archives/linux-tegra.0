From: Timo Alho <talho@nvidia.com>
Subject: [PATCH 4/4] soc/tegra: bpmp: check BPMP response return code
Date: Thu, 7 Sep 2017 12:31:04 +0300
Message-ID: <8be4357544ffb9a60e116bc0a666189b93951c91.1504776489.git.talho@nvidia.com>
References: <cover.1504776489.git.talho@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1504776489.git.talho@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Timo Alho <talho@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add checks for return code in BPMP response message.

Signed-off-by: Timo Alho <talho@nvidia.com>
---
 drivers/soc/tegra/powergate-bpmp.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/powergate-bpmp.c b/drivers/soc/tegra/powergate-bpmp.c
index 8fc3560..82c7e27 100644
--- a/drivers/soc/tegra/powergate-bpmp.c
+++ b/drivers/soc/tegra/powergate-bpmp.c
@@ -42,6 +42,7 @@ static int tegra_bpmp_powergate_set_state(struct tegra_bpmp *bpmp,
 {
 	struct mrq_pg_request request;
 	struct tegra_bpmp_message msg;
+	int err;
 
 	memset(&request, 0, sizeof(request));
 	request.cmd = CMD_PG_SET_STATE;
@@ -53,7 +54,13 @@ static int tegra_bpmp_powergate_set_state(struct tegra_bpmp *bpmp,
 	msg.tx.data = &request;
 	msg.tx.size = sizeof(request);
 
-	return tegra_bpmp_transfer(bpmp, &msg);
+	err = tegra_bpmp_transfer(bpmp, &msg);
+	if (err < 0)
+		return err;
+	else if (msg.rx.ret < 0)
+		return -EINVAL;
+
+	return 0;
 }
 
 static int tegra_bpmp_powergate_get_state(struct tegra_bpmp *bpmp,
@@ -80,6 +87,8 @@ static int tegra_bpmp_powergate_get_state(struct tegra_bpmp *bpmp,
 	err = tegra_bpmp_transfer(bpmp, &msg);
 	if (err < 0)
 		return PG_STATE_OFF;
+	else if (msg.rx.ret < 0)
+		return -EINVAL;
 
 	return response.get_state.state;
 }
@@ -106,6 +115,8 @@ static int tegra_bpmp_powergate_get_max_id(struct tegra_bpmp *bpmp)
 	err = tegra_bpmp_transfer(bpmp, &msg);
 	if (err < 0)
 		return err;
+	else if (msg.rx.ret < 0)
+		return -EINVAL;
 
 	return response.get_max_id.max_id;
 }
@@ -132,7 +143,7 @@ static char *tegra_bpmp_powergate_get_name(struct tegra_bpmp *bpmp,
 	msg.rx.size = sizeof(response);
 
 	err = tegra_bpmp_transfer(bpmp, &msg);
-	if (err < 0)
+	if (err < 0 || msg.rx.ret < 0)
 		return NULL;
 
 	return kstrdup(response.get_name.name, GFP_KERNEL);
-- 
2.7.4
