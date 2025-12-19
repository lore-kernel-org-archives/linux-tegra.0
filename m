Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011066.outbound.protection.outlook.com [40.93.194.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA7E3002B6;
	Fri, 19 Dec 2025 11:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144669; cv=fail; b=U6sxdBd+Ti1i8I3yimyWePGkKKepmKjVIH2w5QWFO1ocZWcgrRxjLI64V+SZU4zWT4kBqp+aYVkqmI8WRg6ryXCchm6fUnlnHNXHXCdd5K8s9vEjV6FzDwC6sW53uX2zEc9mpsIoMVc4vpPG1givoVNaEDUyvSnAVS4Ur/kgj+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144669; c=relaxed/simple;
	bh=Q3wx6rjRl+Zf3JIEdtjsoKBHgDkBpJBRK3wLp90SRbo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bR9JMQ7sFvkECFa1CT3NubROZbvx3zMCucHBtMzktRGwyFJbCsIHzi8c5xzY7yMrHBSPJv1drCWB8sdSciXfmffc1O5N0zCTQKC6Pp3L9HR1Zr480i1J5kjVrROpWuEyRK0HCcV4IK4ZdK7IjcuKlitaRnttHOj2YM0LAQfUYL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=fail (0-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HZfWx108 reason="key not found in DNS"; arc=fail smtp.client-ip=40.93.194.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HZfWx108"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TkG55meGLnDayQzQDb3l+YgF9eQ6rHk/quCymufa+0V5os6e08bJWt5+6EFqKLMDVqYlopmQk1S6gb9EDdwtAN4ge7cXBuGZP0hJdpNvR72jjRaTS7MM1LDBjdykQM1ubJGwu1NlWMk8pe6O1/X9Arrs482BhWDUU6Ob7oFeMWakXeNouF6yfhDxB+AQkAUvZK1zAsUaoWbQVAXo3aNMiKXObsoeculpOlXHUc3VmaFEeCJXTC77lZjmLgsRPaHTnJPSMkPIyLREeBQhgNgKPX5tAJuosTUmPv87iiI5RwQWXalK485DyRzpACOj+UmwmPQ6zD98a0sUdWCtMcY+Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KbgzuVUmTsKXlLV4Ni2Yjs5LAHQG/+wSOywwaFgrD74=;
 b=diFyI4UXjLXcABMabv2fbpMW6D7cOvk9y45fYRxjLvJY+qabcfIbfhPJhNIoyEHab0I5/wDal4w26mpCgYFu0854u5l6e6TYc0+4hw4FYx/Vkgtf7I10Ry30K6PXtRlCQGzEZykn8k1BB9ylsz363wD9/Nkyz3Zs4oU3t4QqowdylRpZZXFc2G1H2y4b9Q1iyyglh/P3kBNxn87lyZl+kXOg2nHyARZoiPHLQEvanon7AsTrT+t+KskddxoP/UOJZOXkNPxxG3HCnnzOA4dN1ZNk+ubDRKx7CSBtmCKwnzpJak3ino42s/VYTTwBJ25D14IVIbPZaSryrsXZHn5ADw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbgzuVUmTsKXlLV4Ni2Yjs5LAHQG/+wSOywwaFgrD74=;
 b=HZfWx108OFITjJihxZ73ONlZs6ZxBLzmt3N29qZlcRpNMSE76hyJjCE4COw0bRkB3WB/XSEeSUTn3IgY3lNzVAK/Lv4nGano1AwID7JRsJJVv0rTJv+KBQSmTt4EH6QNJ0s9OLgV6G1PU2m5F7/kPn3l1++dGJKLM/8fYDPmal3+YOhppED7htWqI9oiuSKtyCR7yClHLFfAOEkVb6LEHPSLvxevuUi6ZyfW6iIVBe5oFI6q+8uHNw2vFdNgS79rz1lJs7Z2JE+vdzq1C817FgZNKAVqFCTpXkh2AfWnxxxs20du9fWxu21+Db0XBQRfd5+fDrSVZtdbKbvzHR9ckg==
Received: from SJ0PR03CA0258.namprd03.prod.outlook.com (2603:10b6:a03:3a0::23)
 by IA1PR12MB8519.namprd12.prod.outlook.com (2603:10b6:208:44c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 11:44:20 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::1e) by SJ0PR03CA0258.outlook.office365.com
 (2603:10b6:a03:3a0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 11:44:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 11:44:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 03:44:11 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 03:44:11 -0800
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Fri, 19 Dec 2025 03:44:11 -0800
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v5 3/4] memory: tegra: Add support for multiple irqs
Date: Fri, 19 Dec 2025 11:43:53 +0000
Message-ID: <20251219114354.2727906-4-ketanp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251219114354.2727906-1-ketanp@nvidia.com>
References: <20251219114354.2727906-1-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|IA1PR12MB8519:EE_
X-MS-Office365-Filtering-Correlation-Id: bfab8836-3df1-405f-eeef-08de3ef3f2de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?789f2HGPcgMvW5D4smozTPxm0BQYkkJxrF8pdMm8pZ+cuf4KoBBNGqFgFCLu?=
 =?us-ascii?Q?llR3i91iAM6sSkj/C0+rAy/OTGWWYjMKJHjrCZpiKYrrESvBYZVBw/ucb+GX?=
 =?us-ascii?Q?F3kXJCeL9kpadxp7H9g6zStSbwsAH5rdE8kYnJoNXfHoY+wyAN/G/RDvIMPS?=
 =?us-ascii?Q?KsWUhkAo0kgoMmgJvUlw5LEBFmhkuBywj+cvLo5Ji7XeFX3Vhv1rFITahT22?=
 =?us-ascii?Q?NsVuhWk37KxalLseYV2axGXZtvH9MezTFT/LhFKrURCJ1NnhEyNA2GkUAxbY?=
 =?us-ascii?Q?wB+lQbkjMWaqVqEzJXnjo9IiTDUzF9WrHxjuBL6+/pwoePbJ9/BqhWZJmo/c?=
 =?us-ascii?Q?POKmbEAzB+6xZSKqwOyv//sJSxCuOfpVw2D7JFbJuZPIC+lnArlQsA/z1Lcw?=
 =?us-ascii?Q?mt//jxVxyA+ZQh4jFyz+cBKiC4ERXnPFiBDckld59QC3HyPhgi4bfuE5eCQv?=
 =?us-ascii?Q?yGfdF63i9Bb9OsgtS/8iy7AozlXcTuQniM7OQ/eP01ZJMhJJa6hMZEs95+NY?=
 =?us-ascii?Q?Akk9Hdpj9LI5GwkuF7PifbEj98DxSk25QqwbXAel0FdVFEpKgi32qPgaHe/Q?=
 =?us-ascii?Q?K51hJbJZF7lN18WjPCH0SWOxm+3DLvAvd9PPMmKvgaFYl1nACwawn1J5R4bD?=
 =?us-ascii?Q?ntU24pqV7md762l51wuMxdnehmx+glJ9Q+3G+Vr/1v+3vHRXVB2QDsjN+VmL?=
 =?us-ascii?Q?bCVDy8en8m+8AhvwC2vgo/GQyQEQrvg8IU0mk4uyeNmPYIBnPotJxnrMSvH8?=
 =?us-ascii?Q?hrBUVbqbyKzi1UPnCGNhXXEqpe6yCfiBsW1vluyt9cXBHirUW4hWqevhUhsf?=
 =?us-ascii?Q?neG2eaaHm3Hg27GTd8VsmM6t6Tpmw+CPaXVz2U410pH/8mbxw1Ewgh44lHMe?=
 =?us-ascii?Q?d9QDxl7rvNi4bJkGNDwCMXOtnF821IAOLr64qAfSlAo1TUYHO3OSh9vIf5PD?=
 =?us-ascii?Q?1LdVqZfeSRl2/NK2NoZbvFxpuu+/N4kbDJKf6t6OKK1N89489YAPR+Uo+6yj?=
 =?us-ascii?Q?mnkQYIUfnxHNSF9O+ZgC5QB4c9o+pmGo0TVHIA1ZjsYhDIroV8Dr71aRhRS8?=
 =?us-ascii?Q?PJ9m+BdqcophUhl9goRXV7ptDlc07OUQy+wgmxmpnnf998EW4zIyG6ORITb9?=
 =?us-ascii?Q?xfJdhdHnOR7/t/I6LQKxqXxIXotaZ73qSxPZk6hEBsQC4/DE92xc6TAQqfaT?=
 =?us-ascii?Q?wqZN0cdDQHHQRpg3YTdeeTDO5hcV4ajJosEWzRv1pE7soJ8zoDcwtG1mrQ2g?=
 =?us-ascii?Q?PjgFtO/mZpwyypKKyWvWSGlFDFXqgC2xKS4o+OSUNB5m0W0/PcBEYlm2D8GF?=
 =?us-ascii?Q?u0eo3wlKzUopPu608eQSnVpCPklhKrr7cjjJimoPip9nhQ1s+QEw4IhzoDK6?=
 =?us-ascii?Q?A4a3X7niNtbbYSqCbdrnw/7SeVM8PqHPaVFqA7ZRrdtvvtIQpnb6I8fsxdhf?=
 =?us-ascii?Q?QP0U4E8RK9FiHiYCpvtOPbE5CE5KJECe8TOD+00bSok5WsABqhiUtVfZBdZe?=
 =?us-ascii?Q?6oBNcK1+d9He65Yfcz0OkOCvaoC2NkRPerB7xqGY8l74O9dsH/IpZLEWEL2s?=
 =?us-ascii?Q?GfhMv8pDCw4Cj5GTClg=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 11:44:20.5585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfab8836-3df1-405f-eeef-08de3ef3f2de
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8519

Add support to handle multiple MC interrupts lines as Tegra264 supports
multiple MC interrupt lines. So make the necessary changes to the Tegra
MC driver to support devices with more than one interrupt line.
Add field to specify the number of interrupts and iterate over the
number of interrupts to register handler for each interrupt.

Signed-off-by: Ketan Patil <ketanp@nvidia.com>
---
 drivers/memory/tegra/mc.c       | 35 +++++++++++++++++++++------------
 drivers/memory/tegra/mc.h       |  1 +
 drivers/memory/tegra/tegra186.c |  3 ++-
 drivers/memory/tegra/tegra20.c  |  7 ++++++-
 include/soc/tegra/mc.h          |  4 +++-
 5 files changed, 34 insertions(+), 16 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 6c1578b25a61..82a81ae3c50d 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -551,10 +551,15 @@ int tegra30_mc_probe(struct tegra_mc *mc)
 
 const struct tegra_mc_ops tegra30_mc_ops = {
 	.probe = tegra30_mc_probe,
-	.handle_irq = tegra30_mc_handle_irq,
+	.handle_irq = tegra30_mc_irq_handlers,
+	.num_interrupts = 1,
 };
 #endif
 
+const irq_handler_t tegra30_mc_irq_handlers[] = {
+	tegra30_mc_handle_irq
+};
+
 static int mc_global_intstatus_to_channel(const struct tegra_mc *mc, u32 status,
 					  unsigned int *mc_channel)
 {
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

