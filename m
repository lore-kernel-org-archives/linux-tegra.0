Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A7C19DF82;
	Tue, 27 Aug 2024 11:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724758698; cv=none; b=bPekWRpG4UNrSq94JOgQkF6+XC5M4PmKQcLBW+W3e5b1bOX48f1mI2/vgXz/UN8jz7Nn0+bz3qt0ik5TntxoErm71MxuXq3V3joXh/F8d7J2X9RzRYVJnKjdAQV0c0T3aPAVess3VjxV1MkLeVlfM1S+M5Sj/ynkxWjE+ydbqFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724758698; c=relaxed/simple;
	bh=YfnrL1Siqgw0CQKyY622ppIkfkCAloYHq1Xj86/hUPY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tMWxhqhDc1R+2rOSoZdYBMQ6nBWggus4gKLAaGZ9oMXq2xEOulN/obO6pYrQ2Hf9FvuO2LSjXXbuE2PCvlsN/Z69ZnwFdO5lQbDlDgcFGne7qnJnNpHFgUaN1SSEWJDnTeWq9kQASuOY+oAPzDXO6BySQd/XEMuAfgCJ6s2fBQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4WtQXB5Y2sz1S8sD;
	Tue, 27 Aug 2024 19:38:02 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 69D4C1A0188;
	Tue, 27 Aug 2024 19:38:13 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Aug
 2024 19:38:12 +0800
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
Subject: [PATCH -next 2/8] soc: fsl: cpm1: Simplify with dev_err_probe()
Date: Tue, 27 Aug 2024 19:46:01 +0800
Message-ID: <20240827114607.4019972-3-ruanjinjie@huawei.com>
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

Use the dev_err_probe() helper to simplify error handling during probe.
This also handle scenario, when EDEFER is returned and useless error
is printed.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/soc/fsl/qe/tsa.c | 62 +++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 39 deletions(-)

diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
index 7fa399b7a47c..fc37d23b746d 100644
--- a/drivers/soc/fsl/qe/tsa.c
+++ b/drivers/soc/fsl/qe/tsa.c
@@ -453,10 +453,8 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 
 	for_each_available_child_of_node_scoped(np, tdm_np) {
 		ret = of_property_read_u32(tdm_np, "reg", &tdm_id);
-		if (ret) {
-			dev_err(tsa->dev, "%pOF: failed to read reg\n", tdm_np);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(tsa->dev, ret, "%pOF: failed to read reg\n", tdm_np);
 		switch (tdm_id) {
 		case 0:
 			tsa->tdms |= BIT(TSA_TDMA);
@@ -465,18 +463,15 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 			tsa->tdms |= BIT(TSA_TDMB);
 			break;
 		default:
-			dev_err(tsa->dev, "%pOF: Invalid tdm_id (%u)\n", tdm_np,
-				tdm_id);
-			return -EINVAL;
+			return dev_err_probe(tsa->dev, -EINVAL, "%pOF: Invalid tdm_id (%u)\n",
+					     tdm_np, tdm_id);
 		}
 	}
 
 	for_each_available_child_of_node_scoped(np, tdm_np) {
 		ret = of_property_read_u32(tdm_np, "reg", &tdm_id);
-		if (ret) {
-			dev_err(tsa->dev, "%pOF: failed to read reg\n", tdm_np);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(tsa->dev, ret, "%pOF: failed to read reg\n", tdm_np);
 
 		tdm = &tsa->tdm[tdm_id];
 		tdm->simode_tdm = TSA_SIMODE_TDM_SDM_NORM;
@@ -484,35 +479,26 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 		val = 0;
 		ret = of_property_read_u32(tdm_np, "fsl,rx-frame-sync-delay-bits",
 					   &val);
-		if (ret && ret != -EINVAL) {
-			dev_err(tsa->dev,
-				"%pOF: failed to read fsl,rx-frame-sync-delay-bits\n",
-				tdm_np);
-			return ret;
-		}
-		if (val > 3) {
-			dev_err(tsa->dev,
-				"%pOF: Invalid fsl,rx-frame-sync-delay-bits (%u)\n",
-				tdm_np, val);
-			return -EINVAL;
-		}
+		if (ret && ret != -EINVAL)
+			return dev_err_probe(tsa->dev, ret,
+					     "%pOF: failed to read fsl,rx-frame-sync-delay-bits\n",
+					     tdm_np);
+		if (val > 3)
+			return dev_err_probe(tsa->dev, -EINVAL,
+					     "%pOF: Invalid fsl,rx-frame-sync-delay-bits (%u)\n",
+					     tdm_np, val);
 		tdm->simode_tdm |= TSA_SIMODE_TDM_RFSD(val);
 
 		val = 0;
 		ret = of_property_read_u32(tdm_np, "fsl,tx-frame-sync-delay-bits",
 					   &val);
-		if (ret && ret != -EINVAL) {
-			dev_err(tsa->dev,
-				"%pOF: failed to read fsl,tx-frame-sync-delay-bits\n",
-				tdm_np);
-			return ret;
-		}
-		if (val > 3) {
-			dev_err(tsa->dev,
-				"%pOF: Invalid fsl,tx-frame-sync-delay-bits (%u)\n",
-				tdm_np, val);
-			return -EINVAL;
-		}
+		if (ret && ret != -EINVAL)
+			return dev_err_probe(tsa->dev, ret,
+				"%pOF: failed to read fsl,tx-frame-sync-delay-bits\n", tdm_np);
+		if (val > 3)
+			return dev_err_probe(tsa->dev, -EINVAL,
+					     "%pOF: Invalid fsl,tx-frame-sync-delay-bits (%u)\n",
+					     tdm_np, val);
 		tdm->simode_tdm |= TSA_SIMODE_TDM_TFSD(val);
 
 		if (of_property_read_bool(tdm_np, "fsl,common-rxtx-pins"))
@@ -645,10 +631,8 @@ static int tsa_probe(struct platform_device *pdev)
 		return PTR_ERR(tsa->si_regs);
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "si_ram");
-	if (!res) {
-		dev_err(tsa->dev, "si_ram resource missing\n");
-		return -EINVAL;
-	}
+	if (!res)
+		return dev_err_probe(tsa->dev, -EINVAL, "si_ram resource missing\n");
 	tsa->si_ram_sz = resource_size(res);
 	tsa->si_ram = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(tsa->si_ram))
-- 
2.34.1

