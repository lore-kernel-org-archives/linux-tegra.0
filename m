Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CAB1A01B4;
	Tue, 27 Aug 2024 11:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724758697; cv=none; b=hy5oTXrS84jIxtnLkshxKj5fMYYlRg6HbGcenh4jiLiPIAJCU3wBJ1kQsHm1i3bR4rr3xFZiONPm/TwVajo7ktoU18FObvDkdXeyFRMPgP4qrF9ufePFwBExTbMh4xUCgn3Oij4pw+rW7r1z963sybaYfAslQiZYwz4YBbOqHTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724758697; c=relaxed/simple;
	bh=E82EEo1RXaB/IvSNxJ2EOBRliN4y/HoIl73diV6vg7Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VCMu3gZqfQnse/vgAyn+ZqXTO4XMBuqVqh1gcXBt2tUqap9sC7uo/GVQWXPqJjBaNq+PMPM46ZHNKkjvHHoKNH8lWFn+bCrLMWkg9rkp87JWmMyprGPXljaU4RzOh8ftIzwrEONHgWcIm61oqadM7l75NFCm+CoC3RBmjl5JbNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WtQQr3KRVz20mN6;
	Tue, 27 Aug 2024 19:33:24 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id B66FB180019;
	Tue, 27 Aug 2024 19:38:12 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Aug
 2024 19:38:11 +0800
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
Subject: [PATCH -next 1/8] soc: fsl: cpm1: Simplify with scoped for each OF child loop
Date: Tue, 27 Aug 2024 19:46:00 +0800
Message-ID: <20240827114607.4019972-2-ruanjinjie@huawei.com>
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

Use scoped for_each_available_child_of_node_scoped when iterating
over device nodes to make code a bit simpler.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/soc/fsl/qe/tsa.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
index 6c5741cf5e9d..7fa399b7a47c 100644
--- a/drivers/soc/fsl/qe/tsa.c
+++ b/drivers/soc/fsl/qe/tsa.c
@@ -441,7 +441,6 @@ static inline int tsa_of_parse_tdm_tx_route(struct tsa *tsa,
 
 static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 {
-	struct device_node *tdm_np;
 	struct tsa_tdm *tdm;
 	struct clk *clk;
 	u32 tdm_id, val;
@@ -452,11 +451,10 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 	tsa->tdm[0].is_enable = false;
 	tsa->tdm[1].is_enable = false;
 
-	for_each_available_child_of_node(np, tdm_np) {
+	for_each_available_child_of_node_scoped(np, tdm_np) {
 		ret = of_property_read_u32(tdm_np, "reg", &tdm_id);
 		if (ret) {
 			dev_err(tsa->dev, "%pOF: failed to read reg\n", tdm_np);
-			of_node_put(tdm_np);
 			return ret;
 		}
 		switch (tdm_id) {
@@ -469,16 +467,14 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 		default:
 			dev_err(tsa->dev, "%pOF: Invalid tdm_id (%u)\n", tdm_np,
 				tdm_id);
-			of_node_put(tdm_np);
 			return -EINVAL;
 		}
 	}
 
-	for_each_available_child_of_node(np, tdm_np) {
+	for_each_available_child_of_node_scoped(np, tdm_np) {
 		ret = of_property_read_u32(tdm_np, "reg", &tdm_id);
 		if (ret) {
 			dev_err(tsa->dev, "%pOF: failed to read reg\n", tdm_np);
-			of_node_put(tdm_np);
 			return ret;
 		}
 
@@ -492,14 +488,12 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 			dev_err(tsa->dev,
 				"%pOF: failed to read fsl,rx-frame-sync-delay-bits\n",
 				tdm_np);
-			of_node_put(tdm_np);
 			return ret;
 		}
 		if (val > 3) {
 			dev_err(tsa->dev,
 				"%pOF: Invalid fsl,rx-frame-sync-delay-bits (%u)\n",
 				tdm_np, val);
-			of_node_put(tdm_np);
 			return -EINVAL;
 		}
 		tdm->simode_tdm |= TSA_SIMODE_TDM_RFSD(val);
@@ -511,14 +505,12 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 			dev_err(tsa->dev,
 				"%pOF: failed to read fsl,tx-frame-sync-delay-bits\n",
 				tdm_np);
-			of_node_put(tdm_np);
 			return ret;
 		}
 		if (val > 3) {
 			dev_err(tsa->dev,
 				"%pOF: Invalid fsl,tx-frame-sync-delay-bits (%u)\n",
 				tdm_np, val);
-			of_node_put(tdm_np);
 			return -EINVAL;
 		}
 		tdm->simode_tdm |= TSA_SIMODE_TDM_TFSD(val);
@@ -538,13 +530,11 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 		clk = of_clk_get_by_name(tdm_np, "l1rsync");
 		if (IS_ERR(clk)) {
 			ret = PTR_ERR(clk);
-			of_node_put(tdm_np);
 			goto err;
 		}
 		ret = clk_prepare_enable(clk);
 		if (ret) {
 			clk_put(clk);
-			of_node_put(tdm_np);
 			goto err;
 		}
 		tdm->l1rsync_clk = clk;
@@ -552,13 +542,11 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 		clk = of_clk_get_by_name(tdm_np, "l1rclk");
 		if (IS_ERR(clk)) {
 			ret = PTR_ERR(clk);
-			of_node_put(tdm_np);
 			goto err;
 		}
 		ret = clk_prepare_enable(clk);
 		if (ret) {
 			clk_put(clk);
-			of_node_put(tdm_np);
 			goto err;
 		}
 		tdm->l1rclk_clk = clk;
@@ -567,13 +555,11 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 			clk = of_clk_get_by_name(tdm_np, "l1tsync");
 			if (IS_ERR(clk)) {
 				ret = PTR_ERR(clk);
-				of_node_put(tdm_np);
 				goto err;
 			}
 			ret = clk_prepare_enable(clk);
 			if (ret) {
 				clk_put(clk);
-				of_node_put(tdm_np);
 				goto err;
 			}
 			tdm->l1tsync_clk = clk;
@@ -581,29 +567,23 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 			clk = of_clk_get_by_name(tdm_np, "l1tclk");
 			if (IS_ERR(clk)) {
 				ret = PTR_ERR(clk);
-				of_node_put(tdm_np);
 				goto err;
 			}
 			ret = clk_prepare_enable(clk);
 			if (ret) {
 				clk_put(clk);
-				of_node_put(tdm_np);
 				goto err;
 			}
 			tdm->l1tclk_clk = clk;
 		}
 
 		ret = tsa_of_parse_tdm_rx_route(tsa, tdm_np, tsa->tdms, tdm_id);
-		if (ret) {
-			of_node_put(tdm_np);
+		if (ret)
 			goto err;
-		}
 
 		ret = tsa_of_parse_tdm_tx_route(tsa, tdm_np, tsa->tdms, tdm_id);
-		if (ret) {
-			of_node_put(tdm_np);
+		if (ret)
 			goto err;
-		}
 
 		tdm->is_enable = true;
 	}
-- 
2.34.1

