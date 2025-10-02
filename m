Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012025.outbound.protection.outlook.com [52.101.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596392D7DFB;
	Thu,  2 Oct 2025 09:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759395710; cv=fail; b=lCFWGymWLegwGkvFIWv23VAnqCmWzU53pLSLY06vtdWO6oiSZ6B1h81V3W+mXuPHh1vG/AZxdIDjvZigtTSpAh4XIQKs28bjFQTqleImJ5ROZ8FrHQrscjrB3G5RWZfnLUn4mwbT03QJ2NqgMyeARUazDzFRmrjWYRh8ZltB4DY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759395710; c=relaxed/simple;
	bh=9yjWDDcvDQo2R6uHc/wHWedvJQSW1AWHLK/W5HJjRIE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GMG2q1jFOA9d8MB2y5jHYOq9Vkx35NVCJ8SGreKsxU6wmd0rr8ZQIk/KhNbdaCvESIkECr0HSH84FBxfOj+D5Yps3ZUPXUElYQdGPyvffUQrKj2I4kLFym8CiQm10/Cp0CgnFbWaUDSk+v31w9QPbhhj4DsHyDG5EHXbA7UpxJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r4VS6OFU; arc=fail smtp.client-ip=52.101.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r4VS6OFU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UixPNXWNlP+t8Nrq57yj8NvCRFiNa++fqPGoQh7tNde4Cz3PIIViWdIHcYZuu3hBoesNb74zfPtBUkAn4fuZrPEHVrS1vWE9Z6ow+tJqnuLLGf8XuPDkp+6aPNfZ8jp5CULv0yGpcxWMkYOT5a7D+r41yghWR/HKNHrbE7CKeFN5Vng8VX/gH1tWCVa6oEyI7XkrRYzqnW4tnySWigP22Gbp7xLO9jZGf9KmcUjcpL3y47l04TVxdedT19gWB6GmlUE4XL+COpHFMcF7bKigK6aHZl2arnUt4l4caww8KJgqF4qDuPSZID+W0+tUK4RdxTn0GAOtXkmxac5DbT5u7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWUsAsBYs9BdvDgs4xeIkCYfOHOdXW8NA3aSsM2vRbk=;
 b=s3sUTAPdaWB/97PVG4X3yrz+JWCDgIi1N4VXzVoXtqSR7xoFx8j7YFqzjljKqxJcqkVZnUrxYnlB0Z3KZqgwm25FXkp8fA7g154LGXUVZkQt1r9XnCNtOG7aou/my+LE5nxTnopNopV5Zh8Ufr9D7DAtCQvyppD8Dqxs0tZVWrbIZpUS+voU1NOu8TGnXrQSWy3wfBCQhu+Zf79ckMTbhHdZohsUGjhhVqeVZ4oDoul2qBe3I3t6X16VZ5XG6EUcLVB/w2oqTzkh6uBZYjcOCPuLY20q/1TLHqzJDcKacjDMHbVlIUUTIPR6QO/w0SNP7/mh0olvF5KUo7AHnRuPAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWUsAsBYs9BdvDgs4xeIkCYfOHOdXW8NA3aSsM2vRbk=;
 b=r4VS6OFUzPiQroCX4xjSjyTVKGcWHU281RW7zoE4tYlXdEf2zUjHLJcL8s1LLSA5HwhIpRD6b27KQ/oVYxMxU8aaaBWhs8kyUn8BrQyaHzx7JiK6Bzi69vRdZooecg++r1agiJou+jzaaAIGbOx6/99H+NVa1yUQYeI3u6FuIM6HICwk6dwDhJQia07iH+hK1F5sHo1UzKmBkPQbUxsvokJlgBCd6IS8SkkFXo3AACwuZ+kiBMAMOy9whD70dBD+l/uHx8s7eio96+pM/ibJ68lowxRDYCRqhOQWcD/k8AQoVe4PAJRA2qFS/ZEbQKjys3txva2DIh2ANNNBFGgpuQ==
Received: from CH0PR03CA0206.namprd03.prod.outlook.com (2603:10b6:610:e4::31)
 by SA1PR12MB6993.namprd12.prod.outlook.com (2603:10b6:806:24c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 09:01:41 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::bc) by CH0PR03CA0206.outlook.office365.com
 (2603:10b6:610:e4::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.14 via Frontend Transport; Thu,
 2 Oct 2025 09:01:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Thu, 2 Oct 2025 09:01:41 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Thu, 2 Oct
 2025 02:01:30 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Oct
 2025 02:01:30 -0700
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 2 Oct 2025 02:01:30 -0700
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v2 3/4] memory: tegra: Add support for multiple irqs
Date: Thu, 2 Oct 2025 09:00:53 +0000
Message-ID: <20251002090054.1837481-4-ketanp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251002090054.1837481-1-ketanp@nvidia.com>
References: <20251002090054.1837481-1-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|SA1PR12MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b97e459-6b98-4e1b-62c0-08de01924dc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cJoPOqwQcXrSCGu1YBEFGXU/e4emauvey7Rlmp3iB8fSP/sRb/OE3S3SHjAC?=
 =?us-ascii?Q?bM3N15BVHGBJKPQmUvr+WBdprVQap2eN6RrHEEs1hEel171LjpgI+KM7ntF8?=
 =?us-ascii?Q?ppgtePX/EaXhPMeK9U7mI0vj7iZ8d8a/BhIwUhyHYSNivwqly1ACv+SDfteA?=
 =?us-ascii?Q?vOEsT0czhJapFzBLtQ9ZiGTl8Mxr427lqA8EB85u6jd+bs5rJ8pqhskdITUM?=
 =?us-ascii?Q?1J6Cm3rOM5wSxnNoN6fhJ0CPAlCV+EUk7miXASMxWCAeORvnlega6Klflfka?=
 =?us-ascii?Q?4XZpRdpzz+fcBXhNK8R281itrOd2pdMl7cJpFVbLWUc2gJG6HSldggE+Ou/a?=
 =?us-ascii?Q?etPjZSYHLyCgD4DP92vVjLUfkT2Z0iOjqs9RLGKbIVnF2ORGuZkxcQj6w+iv?=
 =?us-ascii?Q?rfsXECmZ4Bb0mz+kw0Ra4JwVYHZ0huHbyTAvdOPxMCucb1SLbVxGKx/Gucif?=
 =?us-ascii?Q?H3pDhDWop/2vbI2mibY3byOA6sYUHLE6LEJjYY60sP8tOLfpwgTnCIMGPHtc?=
 =?us-ascii?Q?RCuFmz9sJh5c3iRlSoErsUKfD4xLaBfSjSm5r5Itc9MPq1W2Qb+FX46strlA?=
 =?us-ascii?Q?hyVQW+4Ei9K/78VdA56TDhzmF89dtVpNv/Owc9mdIavr5usDa+l1Xn5Q3Efa?=
 =?us-ascii?Q?Ewm5uXYQ4ADflujUEt1PckJYLJrx2d2cS0rq1EefcVYxWYPbwEstVO2DibId?=
 =?us-ascii?Q?gCWrzIT5t7O9OuRQlrsb+GfMEQRTW3wgu3PsRr7WN3Z9no+SI1XFq074PKmD?=
 =?us-ascii?Q?/5qhZQWyjZQTLV79eooOHLt99Ev17d08HsLg+6674h89F8d5p544LkOUCjzL?=
 =?us-ascii?Q?KD89BLnr6LsJ5lrtpsLyKmKPniAle8BgLZwcAF6HeFj8+z9e51AUYb06brRs?=
 =?us-ascii?Q?G09obmDtPU5hyYrx6mu3lAj0OdKdhBqTj2C0V/9ESadimLEJoiS7m9+lI8LA?=
 =?us-ascii?Q?FQcBf4kgswhwrFiISUsvki/LrWk7NnJ46cJK6Dxu0kxqPBftPKApB+e21xWy?=
 =?us-ascii?Q?+WIygSRUGb3zd3qX71jfXeNgcTx1VoTbkxKGiTbZQDah4ujpqUOq25Wjo/eS?=
 =?us-ascii?Q?ZXR424ji+s8ChsU34PhoCuDv6hIFL2wq+/Y0FDtNVXJx4apJcuanaOHEPKKf?=
 =?us-ascii?Q?lMdXbE4tEM9krSx/cDietGr9TVamvK1rXE55y75FIUFp30oFRDrxoN9f9aeV?=
 =?us-ascii?Q?hTVfkOaAjL0BJHBafLuqJd5wPFOHZsjBNYx6SnAOvQgnoxU55NJiZS9vKOa4?=
 =?us-ascii?Q?BF2PrvwJgU4IjG8OUvkmmyXoaBBfR3cc8N3yd9NfuHuBl5Fkfjd0I0xlVYHa?=
 =?us-ascii?Q?UkWVfrNP4iu785GQkBbtrQbb0LskH0zoljtYlYCABsOHAF3wMxfbjnwgEmRS?=
 =?us-ascii?Q?m10yvE6HYz0cIpeyrgkgNNqUPHsr4iKeqWLf8g6uGaB/XdpNoy6uFgKM7bx3?=
 =?us-ascii?Q?ERSr2JlAQ9f1KYFR8PBfqG+yxMMiL8HUjzvGNK8EbzbWGUFgq+E9reZBOtj4?=
 =?us-ascii?Q?Ij5sXmfHg2p4461BM9UDZRAI4WbDA456SUfzZU71oEm8bXpLGCsQl5VJZIIk?=
 =?us-ascii?Q?wDRR4GpfLr2gckQVqAg=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 09:01:41.3333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b97e459-6b98-4e1b-62c0-08de01924dc3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6993

Add support to handle multiple MC interrupts lines as the number of
interrupt lines could vary based upon SoC. Add field to specify the
number of interrupts and iterate over the number of interrupts to
register handler for each interrupt. SoC with multiple interrupts
will be added in subsequent patches.

Signed-off-by: Ketan Patil <ketanp@nvidia.com>
---
 drivers/memory/tegra/mc.c       | 35 +++++++++++++++++++++------------
 drivers/memory/tegra/mc.h       |  1 +
 drivers/memory/tegra/tegra186.c |  3 ++-
 drivers/memory/tegra/tegra20.c  |  7 ++++++-
 include/soc/tegra/mc.h          |  4 +++-
 5 files changed, 34 insertions(+), 16 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 6c1578b25a61..03cf49165439 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -549,9 +549,14 @@ int tegra30_mc_probe(struct tegra_mc *mc)
 	return 0;
 }
 
+const irq_handler_t tegra30_mc_irq_handlers[] = {
+	tegra30_mc_handle_irq
+};
+
 const struct tegra_mc_ops tegra30_mc_ops = {
 	.probe = tegra30_mc_probe,
-	.handle_irq = tegra30_mc_handle_irq,
+	.handle_irq = tegra30_mc_irq_handlers,
+	.num_interrupts = 1,
 };
 #endif
 
@@ -953,25 +958,29 @@ static int tegra_mc_probe(struct platform_device *pdev)
 	tegra_mc_num_channel_enabled(mc);
 
 	if (mc->soc->ops && mc->soc->ops->handle_irq) {
-		mc->irq = platform_get_irq(pdev, 0);
-		if (mc->irq < 0)
-			return mc->irq;
-
 		WARN(!mc->soc->client_id_mask, "missing client ID mask for this SoC\n");
 
+		for (int i = 0; i < mc->soc->ops->num_interrupts; i++) {
+			int irq;
+
+			irq = platform_get_irq(pdev, i);
+			if (irq < 0)
+				return irq;
+
+			err = devm_request_irq(&pdev->dev, irq, mc->soc->ops->handle_irq[i], 0,
+					       dev_name(&pdev->dev), mc);
+			if (err < 0) {
+				dev_err(&pdev->dev, "failed to request IRQ#%u: %d\n", irq,
+					err);
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
index 482f836f7816..06ae3dd37a47 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -194,6 +194,7 @@ extern const struct tegra_mc_ops tegra186_mc_ops;
 #endif
 
 irqreturn_t tegra30_mc_handle_irq(int irq, void *data);
+extern const irq_handler_t tegra30_mc_irq_handlers[];
 extern const char * const tegra_mc_status_names[32];
 extern const char * const tegra_mc_error_names[8];
 
diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index a30158d92412..a3727fc383ac 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -174,7 +174,8 @@ const struct tegra_mc_ops tegra186_mc_ops = {
 	.remove = tegra186_mc_remove,
 	.resume = tegra186_mc_resume,
 	.probe_device = tegra186_mc_probe_device,
-	.handle_irq = tegra30_mc_handle_irq,
+	.handle_irq = tegra30_mc_irq_handlers,
+	.num_interrupts = 1,
 };
 
 #if defined(CONFIG_ARCH_TEGRA_186_SOC)
diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index 46e97bb10163..75eeb49054cc 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -761,9 +761,14 @@ static irqreturn_t tegra20_mc_handle_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static const irq_handler_t tegra20_mc_irq_handlers[] = {
+	tegra20_mc_handle_irq
+};
+
 static const struct tegra_mc_ops tegra20_mc_ops = {
 	.probe = tegra20_mc_probe,
-	.handle_irq = tegra20_mc_handle_irq,
+	.handle_irq = tegra20_mc_irq_handlers,
+	.num_interrupts = 1,
 };
 
 const struct tegra_mc_soc tegra20_mc_soc = {
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index d11dfefbe551..4a2cadbc0084 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -14,6 +14,7 @@
 #include <linux/reset-controller.h>
 #include <linux/types.h>
 #include <linux/tegra-icc.h>
+#include <linux/interrupt.h>
 
 struct clk;
 struct device;
@@ -164,8 +165,9 @@ struct tegra_mc_ops {
 	int (*probe)(struct tegra_mc *mc);
 	void (*remove)(struct tegra_mc *mc);
 	int (*resume)(struct tegra_mc *mc);
-	irqreturn_t (*handle_irq)(int irq, void *data);
+	const irq_handler_t *handle_irq;
 	int (*probe_device)(struct tegra_mc *mc, struct device *dev);
+	unsigned int num_interrupts;
 };
 
 struct tegra_mc_regs {
-- 
2.17.1

