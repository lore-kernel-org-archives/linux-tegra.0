Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010023.outbound.protection.outlook.com [52.101.56.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4422853F8;
	Sat,  4 Oct 2025 19:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759605108; cv=fail; b=FCSB1Zi/PL5UVFRfacbApZ4XiA5TWs0p1R68wtgZfrEDH3t86DsuWJhSn3EDooGI5D9Oe7VY7oGYGQTAp+7XB7mqlNqOhMd1crGaoPy5aZ3b7GGvMXg83UOBmdD0ojJv4T2rR0x38aud2VVYDma5qxJ0IObJS5a4Vr9u+EMa6E4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759605108; c=relaxed/simple;
	bh=buKBpFaLYWB+ffFa8TOEJ2ERS/f/7hA829POHah/NkA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HWrqyuax4Bcj9r6QWtkeH8E18v3QKPZwxD8peSuj0fsHEUx139mvB4C5INOLGdyH6V7/j4jSVIff+Qxx6RBSW0Ga436WexDqOs55B14ZSoXzrf/HskiFHlv+V0S+C5tzsse/HcM9QT65hMAu2HM9KEqMe/k/gwqUoDKelPUhUL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YaQTvJ8W; arc=fail smtp.client-ip=52.101.56.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YaQTvJ8W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D054tx9vvUC9slVEnh6Y0sWN5ekf6ZyD0kWv/MyKXvr9gAuorARr8KdxvwR3v42PPK7/cjS/2sxhyeDMJ78BT53xlDKL115XG/IEaaXwyxvvnR80carY0e/NBI+kbmMyf/tTG28pjDlekwDXIVld0LhmVcneu1gRPGkiUrq1FYWLSrQ9A3WkYlqnxTW7gpzWu3kLIJmEiETGF171XwlYfy5GCaKvekxVG/FZzL2wDz5GZySJeJYmJ/75VOqDTBnmBYsb8aF5oZes97X7PW64aP9y07ej+KMKbvJQ2S7zhNAKPq65QeTM+fDzK/RbEbXv7/7yjI1BUgsR6v+AIIxwcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPpuFjpTfYdVetB/FDesZGu0paIKVyL7PcOYYFU4A4M=;
 b=H6sjml5X3AJ7b5FQksO72Ya713kYg1wnn+PrSwuX3K28DyMnyhuZBtYBWATyPhzq3FyCOh1QPq6i01LAzIzkhFSSmVURKGNu89gDQKOsGj3PZ30IZWQZC2HERqyfx9YJ//+h8Vf78O7UBhI8RUpG76zv2p4fIro37hIuJqAM/EUORre6a3njxhyfYKofCzzjBZA7Ebw99RvMpucM5SN198puLmGSGIyjtTEwlukPW6e8MsdIS686jdJjrkECO/ynmBSc9nUTz2ZguMI47NBIM5sI5D7MtGnO2+b40Ay+M1+LN+NqHNpekjA+bLTaDeaVpqVZwVOyyFnFgK5UwBlUmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPpuFjpTfYdVetB/FDesZGu0paIKVyL7PcOYYFU4A4M=;
 b=YaQTvJ8WBPWliQMhcuL8UmcJGnBv1TgjLAMP4WSu/jaPnkHQnNTZTgJ1F2Xpc2CPf/9fljE9rYpR0UWhngGvJDvM8aveiYMiu1bzl0ZaMVKvedX8X+x1mCns5vS0kZ3u0Y8dG9NGo0aoRAZjvIY7n94AZhqScTlPT8BV1vIwfJ8k9ufRQQB3CFJ0cJGzKnynm5Up4YAxwLe8dOysUZt7zpQ7lP+86yjb9kr/p1alma9cMGOBkZ8CzE23kQMg6MXX0K1FhUUUkS3SDyOa3zfksMIk9NLFuX3L/bqHzpB11X6Bo+2sT3ZkMYvxTf4dHXG6UyYvsA76euhAajy3yBOjnw==
Received: from DM6PR07CA0074.namprd07.prod.outlook.com (2603:10b6:5:337::7) by
 CH2PR12MB4232.namprd12.prod.outlook.com (2603:10b6:610:a4::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.17; Sat, 4 Oct 2025 19:11:42 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:337:cafe::ad) by DM6PR07CA0074.outlook.office365.com
 (2603:10b6:5:337::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.16 via Frontend Transport; Sat,
 4 Oct 2025 19:11:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Sat, 4 Oct 2025 19:11:41 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sat, 4 Oct
 2025 12:11:41 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Sat, 4 Oct 2025 12:11:40 -0700
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Sat, 4 Oct 2025 12:11:40 -0700
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v3 3/4] memory: tegra: Add support for multiple irqs
Date: Sat, 4 Oct 2025 19:11:22 +0000
Message-ID: <20251004191123.2145307-4-ketanp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251004191123.2145307-1-ketanp@nvidia.com>
References: <20251004191123.2145307-1-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|CH2PR12MB4232:EE_
X-MS-Office365-Filtering-Correlation-Id: ba58cafd-2d36-46c5-8bd1-08de0379da2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7H3++BRNYrV+lprOEpmiIgQzYutaldWncWJnlA+eY0xM7ChgaLg55wuajsJq?=
 =?us-ascii?Q?DYzDN94C283ZH7CsS+DL7QsGiwzjkaFMcYBsXQtcvjKyV7v4p55YrhJkfpiJ?=
 =?us-ascii?Q?Re0VZN/0Liq/M33JBtMlTQQlwv8RIIO7vMEA5pG2lah8bkJ9XHsYgDOvNG1p?=
 =?us-ascii?Q?L+Hgfk/FyKzXbk4eXrqqHWGS/fLJp2VtSlh5n3zCgOJ4ZI1erGoFhYsPUCTG?=
 =?us-ascii?Q?g34yicQNlTMev7OVP1LQZcaxp9BTPBnIQMNYMnVf8cDKCpYskPZqMhD83JQb?=
 =?us-ascii?Q?osk0RCQhVQ/lb4a+23WA1BcuHQWWgvYZEg4xJEqucuHBeIlkzY9/xPPMKmbJ?=
 =?us-ascii?Q?JHv8zXPwODPig30XjbxSgmxt8YEFdUeLJrLhBitDdFLHpQKxqA8C7ADXq9wo?=
 =?us-ascii?Q?8Xof08QOfA0h2Eu/dEsVraLGTU4OkAMU61Q5BicvXBN+sA+0Z9Ml1avekhVa?=
 =?us-ascii?Q?DdvXJC4TiI80FiCHpdLA0Otmp8+NgU8ZAEXWqR7Pldfp3bV8o3Tsjnwp7L9d?=
 =?us-ascii?Q?1BTkW8clb8+oMrd6KdhAXDW++YSacigtOVP4K+zr1MJcAZH14IBn0DUK2LZa?=
 =?us-ascii?Q?ab+HSF+pKWi4UUusJdqqRmHjZkKvPSPwPwA/ESiRM8yt7ahFYgQGxVrVwXZT?=
 =?us-ascii?Q?1pLgDHY8EE6F+Ct2z/lOsKu1O/AciizswX5CFmLlupZncuLdneH8bFbcBAt2?=
 =?us-ascii?Q?/npAggfwZz9yQLJQKOXJH1MDBCyYJG9XgzsC7t3K4DwoYNxSP1o4qvEFJY3v?=
 =?us-ascii?Q?yRI0MJOED6eBoJbSeY0K8HbbXhAJNodIPuhtGmof/PbOObPf79Gl/vWemCkx?=
 =?us-ascii?Q?nTBbtZ7u3R5GfKKvS8wIRo0Ks06Na9GDlo0AHSy249ePkeP8yp8TTgPEnM1f?=
 =?us-ascii?Q?6nf/8gs8s3+BUWZ4Ftv9o8rCWo5Y94EdLpqM6oz1XFhzJm7zhqXpiNFCRRkg?=
 =?us-ascii?Q?mTnyvkqTzPC9Rd3tNwom8kRPv1GiRO8dAu+J/k3phVuJMCh34Ei8Tzu/HDRt?=
 =?us-ascii?Q?kgyjTj+8wCtStCbPQZbi5PuAuU9gEGZL/4ZGLMUERsVVJ2JKIutS5dhM/Iiq?=
 =?us-ascii?Q?L8Jw8DhPecAma0p/UbdwpJzxg8Spm3U2a6y1AVufoM9IGJ5pI1EoRv5v4F3+?=
 =?us-ascii?Q?yoD2kP2XFtvMs7AE8TbEKHQ+EZ38p2wi5R51DFQ/ioC7ndiJM5H+Hx0Vlw5A?=
 =?us-ascii?Q?JnFzexCDZBkq7tlbifO8/Dy8DQ7kRLHFjc2UfDiazbeCoBT0AxuZrz2Tjamk?=
 =?us-ascii?Q?f8xddelDPcb3owOceRBm1+0NYIwGXfwBWnuMrr+qr+bgMYFejYixJ1paOJSM?=
 =?us-ascii?Q?UUDJAcyvMzh561MuLdo7vOjxbfQoRCQ79t05CVukbx+lZLHd6/+GJ+SzI2TM?=
 =?us-ascii?Q?md70LEitUqCLxGjGebY+Lb/1kkAZusAk6HyP1CBJSHVcDxkoJ89bpE6Hvk9O?=
 =?us-ascii?Q?ghlefriGmqdV/fXCsu8G9Hel9genZAVjbR6raEQJYOl8v4+KAl7wiXUJ/RfL?=
 =?us-ascii?Q?vme6FjAzwhq9VKwjY3zLf0bfkpk3Qp26BX8DWI2vv+Fm7sFuCAHkiv0GAATT?=
 =?us-ascii?Q?M1wIic+bBejjRiMQffA=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2025 19:11:41.8098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba58cafd-2d36-46c5-8bd1-08de0379da2a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4232

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

