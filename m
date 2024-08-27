Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934191A01CB;
	Tue, 27 Aug 2024 11:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724758698; cv=none; b=R8Ylgstd7oeMSELamooc0GyPQX1Y/MseFLaarVM5IWpO3fceOf4BB1ndz8S7R41OCZxntKD6tteLY1x9dTD5Ne2iwKmTFG2bU4q9clr69b3cMAnfvkJlN7KH3DFT9NVAGajtp49DEPDfebOcdCuw2pvvOZobVERtvj3DeVqloLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724758698; c=relaxed/simple;
	bh=0OsIjZBiIDPwp42ZSvEs5x8nOcpXmg1GP8c8AxGaHiQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GDf3cYVL1Gr2EWO4zK1CBDzaTi1CWbm1slFTg9c+VON+BcqCaS91vzromXy7JDBu/ddN61mceoJapEK8Tagcy7vsGvNjPP7K9mybxPj7t72wrSJ6Y73EA0nJQR//MxvfPxolMDgsiXJqIaCHd/UdGMY6qyflQcOyvK70ohZ4PsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WtQXD0CCYz2Cnkc;
	Tue, 27 Aug 2024 19:38:04 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 16C9A180019;
	Tue, 27 Aug 2024 19:38:14 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Aug
 2024 19:38:13 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <andrew@lunn.ch>, <sebastian.hesselbarth@gmail.com>,
	<gregory.clement@bootlin.com>, <herve.codina@bootlin.com>,
	<qiang.zhao@nxp.com>, <christophe.leroy@csgroup.eu>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <nm@ti.com>,
	<ssantosh@kernel.org>, <petlozup@nvidia.com>, <pshete@nvidia.com>,
	<ruanjinjie@huawei.com>, <christophe.jaillet@wanadoo.fr>,
	<ulf.hansson@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-tegra@vger.kernel.org>, <krzk@kernel.org>, <jic23@kernel.org>
Subject: [PATCH -next 3/8] soc: fsl: cpm1: qmc: Simplify with scoped for each OF child
Date: Tue, 27 Aug 2024 19:46:02 +0800
Message-ID: <20240827114607.4019972-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240827114607.4019972-1-ruanjinjie@huawei.com>
References: <20240827114607.4019972-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Use scoped for_each_available_child_of_node_scoped() when iterating
over device nodes to make code a bit simpler.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/soc/fsl/qe/qmc.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 76bb496305a0..d5937b5b5f15 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -1174,31 +1174,26 @@ static unsigned int qmc_nb_chans(struct qmc *qmc)
 
 static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 {
-	struct device_node *chan_np;
 	struct qmc_chan *chan;
 	const char *mode;
 	u32 chan_id;
 	u64 ts_mask;
 	int ret;
 
-	for_each_available_child_of_node(np, chan_np) {
+	for_each_available_child_of_node_scoped(np, chan_np) {
 		ret = of_property_read_u32(chan_np, "reg", &chan_id);
 		if (ret) {
 			dev_err(qmc->dev, "%pOF: failed to read reg\n", chan_np);
-			of_node_put(chan_np);
 			return ret;
 		}
 		if (chan_id > 63) {
 			dev_err(qmc->dev, "%pOF: Invalid chan_id\n", chan_np);
-			of_node_put(chan_np);
 			return -EINVAL;
 		}
 
 		chan = devm_kzalloc(qmc->dev, sizeof(*chan), GFP_KERNEL);
-		if (!chan) {
-			of_node_put(chan_np);
+		if (!chan)
 			return -ENOMEM;
-		}
 
 		chan->id = chan_id;
 		spin_lock_init(&chan->ts_lock);
@@ -1209,7 +1204,6 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 		if (ret) {
 			dev_err(qmc->dev, "%pOF: failed to read fsl,tx-ts-mask\n",
 				chan_np);
-			of_node_put(chan_np);
 			return ret;
 		}
 		chan->tx_ts_mask_avail = ts_mask;
@@ -1219,7 +1213,6 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 		if (ret) {
 			dev_err(qmc->dev, "%pOF: failed to read fsl,rx-ts-mask\n",
 				chan_np);
-			of_node_put(chan_np);
 			return ret;
 		}
 		chan->rx_ts_mask_avail = ts_mask;
@@ -1230,7 +1223,6 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 		if (ret && ret != -EINVAL) {
 			dev_err(qmc->dev, "%pOF: failed to read fsl,operational-mode\n",
 				chan_np);
-			of_node_put(chan_np);
 			return ret;
 		}
 		if (!strcmp(mode, "transparent")) {
@@ -1240,7 +1232,6 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 		} else {
 			dev_err(qmc->dev, "%pOF: Invalid fsl,operational-mode (%s)\n",
 				chan_np, mode);
-			of_node_put(chan_np);
 			return -EINVAL;
 		}
 
-- 
2.34.1

