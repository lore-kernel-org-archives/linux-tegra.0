Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011021.outbound.protection.outlook.com [52.101.57.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BFC2C1595;
	Tue, 16 Sep 2025 05:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757999948; cv=fail; b=ask94qRjneOAwDR9XdcX2FO0WeqnEiK9SRGy5nyqCzgN6OFchsQ/rFR6i+mIiYSmfuVu6JOiuoYRom0E8LCHk9p/BKhOdYxVac7YUYWv9KfIJSYBckel3+xflwnXfV5RMiGXMdVFeTQlRVOW5sQ4b95jJH3LeieZgNLa1wfil9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757999948; c=relaxed/simple;
	bh=7OlYkeXauU+5bt+xetlIi+y+aS6dwu818yUiLkoumsE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MUryjNf4pjg3CqHRESn2uPrHda+YWD0xt5Dk3YL/i6lixaLeiUcnETlNms61v1h6E18ilMzPO5mDcPKw6eJg/3GBfcVD7TW5MFCH+E0xjjwHufZ4j/C37e4OIsTDlxI0rJ8m80ieWAdd+3uI+LhGdkyFXwGPYZLF5fBDWbGZTGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Hlzz0owS; arc=fail smtp.client-ip=52.101.57.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Hlzz0owS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tRuOlq+TgOTh67KAr0USnKd+ozWbSA/jr+VvLt0B4AqfAvIcGu1LhSilgNBEkZucwlqeTh42/6jw9Krd/QjxtTwJOxj8gX/5fYgs5hKu6hl+b+0lwttKnb2v3HNFt6vAZg8IqNQsDyRsKrTCD0ZwCsmR+WETl1CDL6CDyRl92W5VqhYgDJKkjZtj5MnJI7bUnGIF4FIBoemKPBDHfcZ51xFuKLe16FYmH8V39QRqKKZ2k7Waj2TcOOVgWPf81dafVwwMJtaSXyTA++gawwXkYOh6QvrGyyGZuzNPlPvBeQvbPin+nPpk1y1+4CE+/DZEnMkJRRiAoV0ny76gDvb4RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7DHVX/wFoYkHypJFy0gvGGgbNISS314RNj7YCOmJdBQ=;
 b=E1MW7xanik3soEKgJxGwx+6CuXsSVilbpEqPkWHQDaOIiREQXMF3WQVKZIgIx0Bcp/66MsfASnTw6d7VeeZ9McZFpCvfnqCRIWTdj5jbKtkHnVWagYIO9E7bUHNG3ql0yWJUTkiN20O+c+Uyr7GNRlx1h5OFke2WlK9PoNYFqy7jA3T0YTCw5KRscmbAv9KnF6r6GmMeiU+TSou+YxI20EahOlnk77RTAn34yLMaFKibLMe2yN28cqoZvVLjBvNgp8NZXAwX6DKtzNoyQ/jWnQE58Lzfll+0lfonobWS/GyOwelrrr2i22kkOEPImlm1XMudghOFOwPsIwxYQUFJ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DHVX/wFoYkHypJFy0gvGGgbNISS314RNj7YCOmJdBQ=;
 b=Hlzz0owSM6VpMGTp4qhzC1Eku4nPL5q4lIN/tP7W3U2Are81ViOxWG4KarFp+GVfGH9lzaVgD1590gB3VG0UUeXkGhN/DgsOffFdgG23zyB5dPForXU+upbWDBiEQUowplqZvHxm/F2OY/t9hCaIDXmN/X3wvF3dBHj9Bx93judbgH7s0qYf+V4eaJYbXlhj+RqHdBqqchJ6a4uiuJQ+Gxw3NKh6Tf1pWThpIGGEBkioiaQXY5UZjoJaB1pjHCIb/283SNQX6q6qLJpHLmxkpmbNYr3njqBTeFm6fjIxo1voGghvenwQHh90j35XPMx0G0QYnr2f7dcRPDMbGNgnmQ==
Received: from MN0PR04CA0026.namprd04.prod.outlook.com (2603:10b6:208:52d::17)
 by IA1PR12MB8077.namprd12.prod.outlook.com (2603:10b6:208:3f4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Tue, 16 Sep
 2025 05:19:02 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:208:52d:cafe::30) by MN0PR04CA0026.outlook.office365.com
 (2603:10b6:208:52d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.22 via Frontend Transport; Tue,
 16 Sep 2025 05:19:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 16 Sep 2025 05:19:02 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 15 Sep
 2025 22:18:49 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 15 Sep 2025 22:18:49 -0700
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Mon, 15 Sep 2025 22:18:49 -0700
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH 3/4] memory: tegra: Add support for multiple irqs
Date: Tue, 16 Sep 2025 05:17:53 +0000
Message-ID: <20250916051754.39250-4-ketanp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250916051754.39250-1-ketanp@nvidia.com>
References: <20250916051754.39250-1-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|IA1PR12MB8077:EE_
X-MS-Office365-Filtering-Correlation-Id: e671161a-9769-4be5-d8b5-08ddf4e08caf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WPLgeZRNKcza1i6jP8b0Zpmg5OoA7HIpIn9lXDClqsZInzKjAQBbE8o7K6GM?=
 =?us-ascii?Q?z3n3uASQnhcR6b9RTkFl9vw99zoK878SiKJ5nUtaKUXZEP53ZQtaulq6Afwx?=
 =?us-ascii?Q?VL+ckRAUWziU2XmG5taMk6ZRiuyqTuGuwj3Z56nfgVbRfbqymN8J+RRgtYNW?=
 =?us-ascii?Q?kVLJi2QzA+EPDoeIlnwjgQsh4Ko4vo9I8hxtzDS/Ygmoz9wNf6Xz6uNSZ/oB?=
 =?us-ascii?Q?Kxt+LpwE27LjSeO9ptWyWOiXJDSlgVC5MJgvXeik538WHhIk/IlsRomlR6EM?=
 =?us-ascii?Q?1VQ87fE5e4ZUDM/YERgGnSlOq9vCgtO1XterD+JMJ3h2xYBffroXuUc4YNQG?=
 =?us-ascii?Q?/rmznXJoqJskrFrlTZM7AVDG4YtuMLBcqUNeooYFwbF1MbyfVHdkQHRbczTW?=
 =?us-ascii?Q?YxOKnWkZhwXV3x4Wxk174++mX04Drgz4KUO69UBKvF1YMsgMxf6Jfj7Krjfe?=
 =?us-ascii?Q?DhMpaYv53KPHgE8NXmA1J6JRl5Wv1NXX12slXbP8ZB+5G1uegxx3HLKriZFB?=
 =?us-ascii?Q?zlaJTYwsLYOsvdNqUiabEXm01S5OU22Cdk8K3mASPA+SMeaX+Ei43T0DrnXi?=
 =?us-ascii?Q?sQOBq8a/w73e/g39WV1m1BQsgZwoGqdgKrPUuF89SN0Bu1UX1iKBTLoWAd3Q?=
 =?us-ascii?Q?MtbTy9xg1bulWq1VkloZkJr5B5ecKrlX4ijp4T2qyg8vgRK8Gbs14CM3ralj?=
 =?us-ascii?Q?xQdIKTg63Phw+cH98xO17mmYHVVqgyGJVGtw+dKAkLgpa1KfHwofnn3WitZe?=
 =?us-ascii?Q?nDsurj1GCZiHNvQBYn5uTyggOM/Gx2LcAhwR0EKVeQkKkiLgfVsHC8xcbITK?=
 =?us-ascii?Q?WadyR0YqcbxdIqMMM9Hpt00J2BIHzmH1zM8LK/njr14CjKm28lsjjVwrjIbv?=
 =?us-ascii?Q?WOD0R6f+VqF9IFhkjp2oKJX5f1gqyxtX7u6zo6bA26OcFFCDYFFIBd4rJlMv?=
 =?us-ascii?Q?fwdB47GsH4xIqQlniTQeE1bNv0h+a9mdTv/Dn5nxKyvOvc4yeB3XgqVMJeCE?=
 =?us-ascii?Q?Mk1Tyfpx1FmBx1Ltkm5KEn0/0tH+K4QIQ1PMDTM4eDtTT3pD7C3griZoM4x0?=
 =?us-ascii?Q?ej3BNTzLg9/bR1VyHb8goQQfh4WZPRRh5jJh/U0+1CzogUSO1e8cFpcutFCX?=
 =?us-ascii?Q?LNybIodmHyiOP/Qwtm10r+V30Akfil1iUYi9YlNEJ4h0lc03gGiiOw3uzZHS?=
 =?us-ascii?Q?/QvU0Vwyd8V24gmcLP47JE7G9WYJRLD1AGJL9/Aji0nnLhhjv/eovNwCcPT3?=
 =?us-ascii?Q?3BWGeIBEMq2hP7cwm0rY/ZYLO2K/4si27B+5ISy8HWS2UlaEwvGxr86n+kwG?=
 =?us-ascii?Q?P34XG8WRvhR6JJiJTAnlNOQIyMncw1OPsinZaJEgd1JFlkyQkSMOUsc343FP?=
 =?us-ascii?Q?InC81ZRsTidhB6BdtoMrguxIIebjtkFvF9+ooyFpjh9fmNfqgj+D+Wi0L9OG?=
 =?us-ascii?Q?LzW2Cqmf2NL1i25UNs91Y3BE3GLRiCxaQ7+yfOrEuiyYJXx1uhNaQxLQ8u38?=
 =?us-ascii?Q?9erNj89jYQeDG2bRSrXDz+z8Q/OCTvLh1A29?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 05:19:02.4850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e671161a-9769-4be5-d8b5-08ddf4e08caf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8077

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
index 46e97bb10163..485814a89037 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -761,9 +761,14 @@ static irqreturn_t tegra20_mc_handle_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+const irq_handler_t tegra20_mc_irq_handlers[] = {
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

