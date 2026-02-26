Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010045.outbound.protection.outlook.com [40.93.198.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D7B477999;
	Thu, 26 Feb 2026 16:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772123527; cv=fail; b=mGev2zGHXV0qRYuk7TG5WFvJFT05oC6oAIPsckWiI9p3tI4ViAY3TTisko7C5bLgRMK/vABaJkk1ES4SGrv+mDHsRDIhpb4Oxr2XB+bwCMfvy3jTp4bQnYs3Sahahw+Bnb8y4/PTXHyU0OopKOaniMDdtmCBO5Y9GCXq5Wbpp6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772123527; c=relaxed/simple;
	bh=LoYQY5WEQZjQna69JQ3tIwOcXuYsnyrT3VPVHNzh2IQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VUArRVdtZH3ubi/URV0kLA/WmIp4J/v0KRtYhDpfD/eS9R3Nsk0MX0WKPe5heRp/KGREzb2F5Ipw3DRPjwNiCa1jm+qor5jSZLeNVxlZuxiviADoY5ffujtkLMf1JDIxOKioVzwilKfKx6vkkkDtemwnqCyR/6a+drez9zeC+hE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r6xS0VSb; arc=fail smtp.client-ip=40.93.198.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r6xS0VSb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jntWufXbe/58LlNUQoovSPXdTl/iHVJSczwi7oTFiGD2zhX1Q5RmAJjiCscL3DQQVHb4OU4PZIJ6sq3Nxh4lhNLSUAPCJxi4D2t9c2x0+nrR/wV3PUJqRiAs4b/aCS1+hWdakI2tCiUmSgu2Q2C1r1Dv4s1OjLOVH3DmM/RpN34r5oczPfO9lDa1fh1tRmr0BJkNQmaSa0jjijT0GYrg/Fs8v9LMC1YNzgrugK/bnc38qDZb62BmAwc1JCuEh/F1g1vOFjHusGm4CPTAXwHb6lzzEgmcvhVZPbVe7Dx9W71h0FJzGRmZL4b/kiL2fxDZdy9EV5GU7dvTcT4freRxCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqJDRRz4Qzli2wj0bahz86j1I29Hx7ktEEBjbY04s3U=;
 b=yKX6lzRuIKdx+H8dpNyvYsJKk69KqJub0j1gken/cdUe8JUf7/Dz6c0iwTLRTfq+RUMn4F7G1YDJUWXaoWXSS4VCdF87G/uKHgZfKkVqkR29Q1o4KVwC2GuaT66bu0zySfDyzjxhJnfT1icGcj64ki1yimdD45Tk2PP6xJvsfHXwIXrmNd/VKcZ020hQR2EapDZ+WkYYP3kpEk6rDwgf5VeMV+p1QMymrp/oAyQLKRBlNiq1pnZIi/9448HzUJmZ/7uSzdCJkWKAdCRuexwPDgyTTrSEZbIlCdtX9vHAtYW/Ky5WcY3i5MzefFJzpBzqJ36Fq+xGI5AluSKDCKLmvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqJDRRz4Qzli2wj0bahz86j1I29Hx7ktEEBjbY04s3U=;
 b=r6xS0VSbFS9PYH5eaSAnYVHslbfZteVZsL7ybocfxnxvBqgNP3E99XKBvPUlTkP3ZrJ4h1qWn9fzqHccbNQM8SEHVWIp0PUQq6Rrxz+jJmHvGqoP9QtFs3G3fHcsrZGrF1jM5c8sFFAU1DEa+D9nZnysAEfTp50HiHquMQ7NkZqM+aCuXB9sBqqoHO3umqUY+dyW1k7UKeH5jrJT+9U92ty99ug/jJdn2x+hpVZXonBJAFnzPI/b04uDcZbYTJk1OFHfxfL3MtsgmgkAIhGAb9QmwlUw+H2FKJhzbnxqVgqkU8gCAgDXJ27B8qVkouA9lkXwkCI9z8qAfcmpL63C6A==
Received: from SA1P222CA0110.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c5::22)
 by CY8PR12MB8243.namprd12.prod.outlook.com (2603:10b6:930:78::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 16:32:00 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:806:3c5:cafe::5e) by SA1P222CA0110.outlook.office365.com
 (2603:10b6:806:3c5::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 16:32:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 16:32:00 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 08:31:40 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 08:31:40 -0800
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 26 Feb 2026 08:31:40 -0800
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v7 3/6] memory: tegra: Add support for multiple IRQs
Date: Thu, 26 Feb 2026 16:31:12 +0000
Message-ID: <20260226163115.1152181-4-ketanp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260226163115.1152181-1-ketanp@nvidia.com>
References: <20260226163115.1152181-1-ketanp@nvidia.com>
X-NVConfidentiality: public
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|CY8PR12MB8243:EE_
X-MS-Office365-Filtering-Correlation-Id: 7befab44-d1ae-44d6-5d9f-08de755490fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	nruHTIbWHZiDH8s22vOgknNUU1nBzngGPqXcb5Uqm6cLTUDrqJnG2f8KMxMc6Uzbaf/YFFEY99gmqzmb4MYHAQ7nLzOhgteQTzf2qct9SpfrqOvDJa2VfKAmt8l3uV0wgnCU7HkLdm/0/70+bDhDioYe7bNQD5fIZGiw3J/ifW1Z43CW8fQgdvLkfrliHhOxbloBYcSpyl+bb9I43TOtwewgeW1EzIUKGfOW/6LgmQJrGez8KcfmLxHEP48qxsBIx9qrMJyZFqKzKq/nF4+PRHE8l1ZA++DsLrRZEkGtrIPXhE1CQRoF8BinVE5NT381wQmrDvtQd7a8+RHke9LQKHD3zhisd/8TZolPCtlmeNEUYnqpiqc9k+4uN+2i4eAd4ycVNdn8qH3ZjsyRDfYjqtru9QzS4B/c8O5bh88yqjiEGP+pBSK4QLfDbNXk0od5uT+fK3x/COQYosn3JtFxYiPsZH3Emwepf+dMk3CRsgOejf5EcaeO3qYIY/Po4/4YWMFXDc7QwhnaX0F56GIHDoLPWNRqd/hDMEil+8s3AR6jMtYwZsw5SgoINar4eSJiYeeC9T4Z9szuJS2Y5WA9aHiUqMKLmBIJKNCPcpcP+v5hmZ9p+KEyowLHdszMKRus1F+FuOLqlPF5bb8Rp65EbP1KVNzrNm1FuzlThj/65ZStQsapHGDAHuUsmoN+jt/yRkvD2ROTgtm+sR6Fl/bj2ZpZqWKkZruEAZS9VB3BQH1zubuSRgXGH7mJGm+MjIZQweCvgwubh+Q9YGNk+YCQJZ3iawvyM4X30Hj9d4t4bu/88GUFfbzFH7AclQ1Q5UkEq32raF3RWZcQSzgbX4MC9g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Hv5cuODPbRQpeylHKeZ/3KKaO8DnXSbfyEwMQzhw1y5IhlFMAXvlhCr4s8iYaBQH6zuIhZ9MzbJk0K5Cu2dAsZO//Hpa94MrMKdI7vIyx03dHm0Bmr04SllCkC3S6KYjMV/sf2rZhtniFx6PXS7bj8ICB8dtC1HF8mU8boJQyUc3ApViOwXdBame7y4rFU99ByiS8m0I5We0RGr9IRxJcoyu8GzzudUULYd/T9ICHm4142mmn16a07p9VJJjy8J5JWA5VvxF+dPtDJafmJvES8orSRKtEgbljK3WeVaGs690U71InNosiozX3SydFKoPJvcFQt9U/yZUcEk+7Rv6Gp1kdchhYiwe/UhhKevzNs8264sHpiVxZmU1zTK1LaBGV3ZvBjA7jJlzq3yuj3ei0Q4Y2AgmR9hxE4cko/ZHRTvh4+Jrky2eyNnWpwivlYHV
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 16:32:00.1895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7befab44-d1ae-44d6-5d9f-08de755490fe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8243

Add support to handle multiple MC interrupts lines, as supported by
Tegra264. Turn the single IRQ handler callback into a counted array to
allow specifying a separate handler for each interrupt. Move IRQ
handlers into tegra_mc_soc struct, so as to specify SoC specific
values.

Signed-off-by: Ketan Patil <ketanp@nvidia.com>
---
 drivers/memory/tegra/mc.c       | 34 ++++++++++++++++++++-------------
 drivers/memory/tegra/mc.h       |  1 +
 drivers/memory/tegra/tegra114.c |  2 ++
 drivers/memory/tegra/tegra124.c |  4 ++++
 drivers/memory/tegra/tegra186.c |  3 ++-
 drivers/memory/tegra/tegra194.c |  2 ++
 drivers/memory/tegra/tegra20.c  |  7 ++++++-
 drivers/memory/tegra/tegra210.c |  2 ++
 drivers/memory/tegra/tegra234.c |  2 ++
 drivers/memory/tegra/tegra30.c  |  2 ++
 include/soc/tegra/mc.h          |  8 +++++---
 11 files changed, 49 insertions(+), 18 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 1dacbe2aba4e..de988c312342 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -398,6 +398,10 @@ unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc)
 }
 EXPORT_SYMBOL_GPL(tegra_mc_get_emem_device_count);
 
+const irq_handler_t tegra30_mc_irq_handlers[] = {
+	tegra30_mc_handle_irq
+};
+
 #if defined(CONFIG_ARCH_TEGRA_3x_SOC) || \
     defined(CONFIG_ARCH_TEGRA_114_SOC) || \
     defined(CONFIG_ARCH_TEGRA_124_SOC) || \
@@ -551,7 +555,6 @@ int tegra30_mc_probe(struct tegra_mc *mc)
 
 const struct tegra_mc_ops tegra30_mc_ops = {
 	.probe = tegra30_mc_probe,
-	.handle_irq = tegra30_mc_handle_irq,
 };
 #endif
 
@@ -952,26 +955,31 @@ static int tegra_mc_probe(struct platform_device *pdev)
 
 	tegra_mc_num_channel_enabled(mc);
 
-	if (mc->soc->ops && mc->soc->ops->handle_irq) {
-		mc->irq = platform_get_irq(pdev, 0);
-		if (mc->irq < 0)
-			return mc->irq;
+	if (mc->soc->handle_irq) {
+		unsigned int i;
 
 		WARN(!mc->soc->client_id_mask, "missing client ID mask for this SoC\n");
 
+		for (i = 0; i < mc->soc->num_interrupts; i++) {
+			int irq;
+
+			irq = platform_get_irq(pdev, i);
+			if (irq < 0)
+				return irq;
+
+			err = devm_request_irq(&pdev->dev, irq, mc->soc->handle_irq[i], 0,
+					       dev_name(&pdev->dev), mc);
+			if (err < 0) {
+				dev_err(&pdev->dev, "failed to request IRQ#%u: %d\n", irq, err);
+				return err;
+			}
+		}
+
 		if (mc->soc->num_channels)
 			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->intmask,
 				     MC_INTMASK);
 		else
 			mc_writel(mc, mc->soc->intmask, MC_INTMASK);
-
-		err = devm_request_irq(&pdev->dev, mc->irq, mc->soc->ops->handle_irq, 0,
-				       dev_name(&pdev->dev), mc);
-		if (err < 0) {
-			dev_err(&pdev->dev, "failed to request IRQ#%u: %d\n", mc->irq,
-				err);
-			return err;
-		}
 	}
 
 	if (mc->soc->reset_ops) {
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index 5f816d703d81..34ce03ebc51c 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -193,6 +193,7 @@ extern const struct tegra_mc_ops tegra186_mc_ops;
 #endif
 
 irqreturn_t tegra30_mc_handle_irq(int irq, void *data);
+extern const irq_handler_t tegra30_mc_irq_handlers[1];
 extern const char * const tegra_mc_status_names[32];
 extern const char * const tegra_mc_error_names[8];
 
diff --git a/drivers/memory/tegra/tegra114.c b/drivers/memory/tegra/tegra114.c
index ea7e4c7bb5f8..fffb28eea57f 100644
--- a/drivers/memory/tegra/tegra114.c
+++ b/drivers/memory/tegra/tegra114.c
@@ -1115,4 +1115,6 @@ const struct tegra_mc_soc tegra114_mc_soc = {
 	.num_resets = ARRAY_SIZE(tegra114_mc_resets),
 	.ops = &tegra30_mc_ops,
 	.regs = &tegra20_mc_regs,
+	.handle_irq = tegra30_mc_irq_handlers,
+	.num_interrupts = ARRAY_SIZE(tegra30_mc_irq_handlers),
 };
diff --git a/drivers/memory/tegra/tegra124.c b/drivers/memory/tegra/tegra124.c
index f0cfe14bb475..2cf733198782 100644
--- a/drivers/memory/tegra/tegra124.c
+++ b/drivers/memory/tegra/tegra124.c
@@ -1276,6 +1276,8 @@ const struct tegra_mc_soc tegra124_mc_soc = {
 	.icc_ops = &tegra124_mc_icc_ops,
 	.ops = &tegra30_mc_ops,
 	.regs = &tegra20_mc_regs,
+	.handle_irq = tegra30_mc_irq_handlers,
+	.num_interrupts = ARRAY_SIZE(tegra30_mc_irq_handlers),
 };
 #endif /* CONFIG_ARCH_TEGRA_124_SOC */
 
@@ -1309,5 +1311,7 @@ const struct tegra_mc_soc tegra132_mc_soc = {
 	.icc_ops = &tegra124_mc_icc_ops,
 	.ops = &tegra30_mc_ops,
 	.regs = &tegra20_mc_regs,
+	.handle_irq = tegra30_mc_irq_handlers,
+	.num_interrupts = ARRAY_SIZE(tegra30_mc_irq_handlers),
 };
 #endif /* CONFIG_ARCH_TEGRA_132_SOC */
diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index 51e2dd628fb4..eb1eaaffc79a 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -174,7 +174,6 @@ const struct tegra_mc_ops tegra186_mc_ops = {
 	.remove = tegra186_mc_remove,
 	.resume = tegra186_mc_resume,
 	.probe_device = tegra186_mc_probe_device,
-	.handle_irq = tegra30_mc_handle_irq,
 };
 
 #if defined(CONFIG_ARCH_TEGRA_186_SOC)
@@ -915,5 +914,7 @@ const struct tegra_mc_soc tegra186_mc_soc = {
 	.ch_intmask = 0x0000000f,
 	.global_intstatus_channel_shift = 0,
 	.regs = &tegra20_mc_regs,
+	.handle_irq = tegra30_mc_irq_handlers,
+	.num_interrupts = ARRAY_SIZE(tegra30_mc_irq_handlers),
 };
 #endif
diff --git a/drivers/memory/tegra/tegra194.c b/drivers/memory/tegra/tegra194.c
index 5b7ff2dd6812..cb0e7886857d 100644
--- a/drivers/memory/tegra/tegra194.c
+++ b/drivers/memory/tegra/tegra194.c
@@ -1359,4 +1359,6 @@ const struct tegra_mc_soc tegra194_mc_soc = {
 	.ch_intmask = 0x00000f00,
 	.global_intstatus_channel_shift = 8,
 	.regs = &tegra20_mc_regs,
+	.handle_irq = tegra30_mc_irq_handlers,
+	.num_interrupts = ARRAY_SIZE(tegra30_mc_irq_handlers),
 };
diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index 1b2b598ab564..6750b08d875f 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -761,9 +761,12 @@ static irqreturn_t tegra20_mc_handle_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static const irq_handler_t tegra20_mc_irq_handlers[] = {
+	tegra20_mc_handle_irq
+};
+
 static const struct tegra_mc_ops tegra20_mc_ops = {
 	.probe = tegra20_mc_probe,
-	.handle_irq = tegra20_mc_handle_irq,
 };
 
 const struct tegra_mc_soc tegra20_mc_soc = {
@@ -779,4 +782,6 @@ const struct tegra_mc_soc tegra20_mc_soc = {
 	.icc_ops = &tegra20_mc_icc_ops,
 	.ops = &tegra20_mc_ops,
 	.regs = &tegra20_mc_regs,
+	.handle_irq = tegra20_mc_irq_handlers,
+	.num_interrupts = ARRAY_SIZE(tegra20_mc_irq_handlers),
 };
diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra210.c
index e166b33848e9..8283601ab52c 100644
--- a/drivers/memory/tegra/tegra210.c
+++ b/drivers/memory/tegra/tegra210.c
@@ -1288,4 +1288,6 @@ const struct tegra_mc_soc tegra210_mc_soc = {
 	.num_resets = ARRAY_SIZE(tegra210_mc_resets),
 	.ops = &tegra30_mc_ops,
 	.regs = &tegra20_mc_regs,
+	.handle_irq = tegra30_mc_irq_handlers,
+	.num_interrupts = ARRAY_SIZE(tegra30_mc_irq_handlers),
 };
diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
index 512d054d7592..9586d7528fb7 100644
--- a/drivers/memory/tegra/tegra234.c
+++ b/drivers/memory/tegra/tegra234.c
@@ -1153,4 +1153,6 @@ const struct tegra_mc_soc tegra234_mc_soc = {
 	 */
 	.num_carveouts = 32,
 	.regs = &tegra20_mc_regs,
+	.handle_irq = tegra30_mc_irq_handlers,
+	.num_interrupts = ARRAY_SIZE(tegra30_mc_irq_handlers),
 };
diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
index 337501a30a73..ff89b9078772 100644
--- a/drivers/memory/tegra/tegra30.c
+++ b/drivers/memory/tegra/tegra30.c
@@ -1401,4 +1401,6 @@ const struct tegra_mc_soc tegra30_mc_soc = {
 	.icc_ops = &tegra30_mc_icc_ops,
 	.ops = &tegra30_mc_ops,
 	.regs = &tegra20_mc_regs,
+	.handle_irq = tegra30_mc_irq_handlers,
+	.num_interrupts = ARRAY_SIZE(tegra30_mc_irq_handlers),
 };
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 372f47e824d5..d07de04c0f33 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -10,10 +10,11 @@
 #include <linux/debugfs.h>
 #include <linux/err.h>
 #include <linux/interconnect-provider.h>
+#include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/reset-controller.h>
-#include <linux/types.h>
 #include <linux/tegra-icc.h>
+#include <linux/types.h>
 
 struct clk;
 struct device;
@@ -164,7 +165,6 @@ struct tegra_mc_ops {
 	int (*probe)(struct tegra_mc *mc);
 	void (*remove)(struct tegra_mc *mc);
 	int (*resume)(struct tegra_mc *mc);
-	irqreturn_t (*handle_irq)(int irq, void *data);
 	int (*probe_device)(struct tegra_mc *mc, struct device *dev);
 };
 
@@ -214,6 +214,9 @@ struct tegra_mc_soc {
 	const struct tegra_mc_icc_ops *icc_ops;
 	const struct tegra_mc_ops *ops;
 	const struct tegra_mc_regs *regs;
+
+	const irq_handler_t *handle_irq;
+	unsigned int num_interrupts;
 };
 
 struct tegra_mc {
@@ -224,7 +227,6 @@ struct tegra_mc {
 	void __iomem *bcast_ch_regs;
 	void __iomem **ch_regs;
 	struct clk *clk;
-	int irq;
 
 	const struct tegra_mc_soc *soc;
 	unsigned long tick;
-- 
2.17.1

