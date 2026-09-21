Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013010.outbound.protection.outlook.com [40.93.196.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61F546EC84;
	Mon, 21 Sep 2026 12:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993332; cv=fail; b=p2oqF/Mq+V//Z+UuhFUGTEd+/Cmb1Qef9aH5cUr+pOTrfPGLgW+9K5m1+7I9/WCQtT3+6ISZW+fkQKEGwqgQIcdI1tkJmqewgNwT3qh435F6p93tTQY+eCZFMUPeTK1QZPFTeXfCcLcjXyFC/vyYjDWVww/pHOFdLeZbZkIqbrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993332; c=relaxed/simple;
	bh=wkJrt9g9r7QfUWflBswEYcNGoQpOIPadS1RaVsDPcwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=T3tctH0JKe9k92cglJ8v7T/hKuwszV9oDZVhBjKhmMpQBsrgkQY+FGSpqteMf3H9fhYyfxvWGrNyF/6nXaAkX7x5hgKBJe8NSbCHfcGk/173JAs3vM7yybsuGu/kl7AXoJ+XuHR3QkQv3RCRto41xMByYBGS3X9cEqNcf/Z98dM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S7pkqAK7; arc=fail smtp.client-ip=40.93.196.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S7pkqAK7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ljYHmcdMhpHtYWcY3duIEdHVPELMilEzNwB+bqDT0U25PMVmbcK+5Ss2o+57v8FF1UrYzJD+QWRcrtK2nw2Ct9Znz06kNjGMRlJkPtfoK5+Okc6dlgL4TMO4NaJX4Gmw4YHAii20hzr/2Wx1SvjvYdjbFU+qbgtCWTRDsETu2MFzMdvszaheMbL/hIyVnymDFyh5Pu1N465rHqkbjBf+gsdZqLOBBCjV48Ir6BfaZ91C9+GIbNK7UMgeJmXPhArRCM33YkHZmEoWM0GcjrU2+NVKYusHs3EA4kpJ156HKT8cd36Bb5cBnbS6QtI8VcMapQRGN+WktK+wpsuS/KIspQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OeJeotQjDwPrPe3f0CzBtluFSlAbIo8er1IHcT/EyDo=;
 b=Hx0t2tD4GMqZ/XCJItGzFXMQ7hpWePvcmJ6T2I/TDPKjicBYThQ17zOuDH8C1ySWa501QWBB6mG2wPbh777PgBogQEvyPLYyKbi9aS1Zv7envdq1RwftDa8T1j3oioxJLzC5dpTZvabnQGOSnBwo5Zq1EmAhmgpX6fOnIjN+jbqptNzkvYRexE/WVx+zhcML+/5zp3wwWSAG5OFsr3N76R135gkvg81PgT2/jHqw9YlQMC/bCn/ya2e8DoOVFwEPnOIKWWlgGqWByY/zwuli8kkeM/XJWdbtEcWeZpq2P6HTRZGXYYkjgwh/IJEm9slRMEVBSxOqIwjag0t8xBDa+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OeJeotQjDwPrPe3f0CzBtluFSlAbIo8er1IHcT/EyDo=;
 b=S7pkqAK7Nwe4Tgona9H79ZsRbM8uIZnANO5+PTud3W977OyM7yMh0L2hANlAdFzsueWv0c1WEaIk28K4Ee86B3oiKsbuHTsOes7hCOKINSOOMV6AytPlfz6qg85LhcL6vRe/aOBSV9zo8pI1Ub9pXYncPxaMkTivnCU4XNzzv6SlsTkTyvwIL3ez8RJB7uxWPi835Fhr8McRi9OecCAcPDpBlQreFgPP3lrnExKhb++4jlru24vgpwNwueralNuUKq2GZCSNfDs/KAggk5N7pKrcsDwA2SnML0lSD3iNUyiX9R3ofYu152KpNm5F//vJsCc7okBFQA9koKM0k173iw==
Received: from PH7P220CA0163.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::24)
 by SJ1PR12MB6219.namprd12.prod.outlook.com (2603:10b6:a03:456::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Mon, 21 Sep
 2026 12:20:03 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:510:33b:cafe::85) by PH7P220CA0163.outlook.office365.com
 (2603:10b6:510:33b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon,
 21 Sep 2026 12:20:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 12:20:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 05:19:46 -0700
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 05:19:42 -0700
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 21 Sep 2026 13:19:09 +0100
Subject: [PATCH 9/9] usb: gadget: tegra-xudc: Add support for Tegra264
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260921-tegra-usb-v1-9-74a925a35d82@nvidia.com>
References: <20260921-tegra-usb-v1-0-74a925a35d82@nvidia.com>
In-Reply-To: <20260921-tegra-usb-v1-0-74a925a35d82@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, "Nagarjuna
 Kristam" <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>, Mathias Nyman
	<mathias.nyman@intel.com>
CC: Thierry Reding <thierry.reding@gmail.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Thierry Reding
	<treding@nvidia.com>, Wayne Chang <waynec@nvidia.com>, Jon Hunter
	<jonathanh@nvidia.com>
X-Mailer: b4 0.16.1-dev
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|SJ1PR12MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: caa8b0ef-d9e5-43ee-bffd-08df17daa9ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|7416014|376014|10067099003|6133799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+N2nG4G0LqQLQ2HuzsC6zdyywf8tDsjMo7Si6Qhie3/bbjudLRfzbkEdQz12TAWb8+/OBtrUS5KctjfJ5D8DrNk62Nn/t+dlg9b1YDYGFThjXo4c2tDHTAgj2rxLNYRX/EWRPDUFMERyTtpJDcZEcylw8L/2a5CAweYIBNsmm7mzXtEXxg5B73da3d411TLbtf56fSpmV70THiquv7obij5YlspuuwyuEfBS9UMhnDHVb323Sd8/9sQ4gV4Z5Fx+ke9W3mC+u/KCKDsp5uaawc2d/liGZPZDBhxZxKmM5PaZvWZOGFqsK+Hz2jR2RdOPSBdzRCNq+JhzWfoLplqcPdzrhWfotdKB8gZqnd+IhUKlKwMKuUPGuSHyWQbejG8a3z2FR6WBd7eq2VU765rHTr3s0QU8hC4DNVATA76ezGJPoXzsqjszVrCkxXtIrq4F0dCI0YwKNJmerSRxedz9zzMCn407WIkaFFDIH/XABfaCphJ20Gh+HSD7+VRzny1UfaL88QWeW1X4KOw50HLiGF7TgbF2Emofas8GEsIreNN5gZvmIM0nN6lnKiRuDYXfBYJDW0X//OcPsZAzZ6/t0JXKMYpzWSJoxmvRP449fGRyL9IkRg5bwS612+tbdkhT9QsqITIQIKjS1vSK3Xp3WqyH6FEzBsUkwbS3LLE7b+RypxBT87wv33XPiXrbORZbVVTkdIixN9ws0/9FzPtzvg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(7416014)(376014)(10067099003)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	S6zwsq2WaJWcLvMnHdq/ClUL41277BGS7Prl2DqaKEPio52R/kH9REemEpiA1NyJJi1wN7VNtTm+KjxioAuvw2NTHB7eovMLNHyKdloA+jvXFSIAYR4zSu4NDAH7ZWphPHtcsE/Mn4T8WHhXthlBSvVDZT/dkj2PaLb3RMxj2BRhbdMlVdCIQbBYCWNpPCifoiqJ/RBwe+6bRJgKEWkMZ4+GseUjuhpFzs12+yXDPCtYg2xBgXriOpkqauc6MEoTBoccS2/34BMX1YxUTLb8VMbF9hAh3wdGvSk6vya+jGL2QABrXh7//IXZsm3WA8cOGYpLjNGw7iQmsZnBR6VKa6h6W7oEADjeVrW51Bos1afDhgK75rtpzOxErzFYjGf56na0Btff9b96yHC8A8YV38+PL++W57Sa8iT9q6oR3kfXnad0M4mcFmoxaHDBJmHP
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 12:20:03.0461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: caa8b0ef-d9e5-43ee-bffd-08df17daa9ec
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6219

Add support for the Tegra264 XUDC by adding the device-tree compatible
string, SoC data and additional registers that need to be configured for
Tegra264. The LMP ITP timer mask in the SSPX_CORE_CNT30 register is
different for Tegra264 and so move the mask into the SoC data.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 60 +++++++++++++++++++++++++++++++++----
 1 file changed, 55 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 56585c350cab..cbbdcd00e9b9 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -146,10 +146,15 @@
 #define SSPX_CORE_CNT0 0x10
 #define  SSPX_CORE_CNT0_PING_TBURST_MASK GENMASK(7, 0)
 #define  SSPX_CORE_CNT0_PING_TBURST(x) ((x) & SSPX_CORE_CNT0_PING_TBURST_MASK)
+#define SSPX_CORE_CNT13 0x44
+#define  SSPX_CORE_CNT13_CRDTHP_TIMER_MASK GENMASK(11, 0)
+#define  SSPX_CORE_CNT13_CRDTHP_TIMER(x) ((x) & \
+				SSPX_CORE_CNT13_CRDTHP_TIMER_MASK)
+#define SSPX_CORE_CNT27 0x7c
+#define  SSPX_CORE_CNT27_PING_LFPS_TRPT_MASK GENMASK(29, 0)
+#define  SSPX_CORE_CNT27_PING_LFPS_TRPT(x) ((x) & \
+				SSPX_CORE_CNT27_PING_LFPS_TRPT_MASK)
 #define SSPX_CORE_CNT30 0x88
-#define  SSPX_CORE_CNT30_LMPITP_TIMER_MASK GENMASK(19, 0)
-#define  SSPX_CORE_CNT30_LMPITP_TIMER(x) ((x) & \
-					SSPX_CORE_CNT30_LMPITP_TIMER_MASK)
 #define SSPX_CORE_CNT32 0x90
 #define  SSPX_CORE_CNT32_POLL_TBURST_MAX_MASK GENMASK(7, 0)
 #define  SSPX_CORE_CNT32_POLL_TBURST_MAX(x) ((x) & \
@@ -549,9 +554,12 @@ struct tegra_xudc_soc {
 	unsigned int num_clks;
 	unsigned int num_phys;
 	unsigned int sspx_offset;
+	unsigned int crdthp_timer;
 	unsigned int lfps_ping;
+	unsigned int lfps_ping_trpt;
 	unsigned int lfps_poll;
 	unsigned int lmpitp_timer;
+	unsigned int lmpitp_timer_mask;
 	unsigned int u3_timeout;
 	bool u1_enable;
 	bool u2_enable;
@@ -3429,11 +3437,25 @@ static void tegra_xudc_device_params_init(struct tegra_xudc *xudc)
 		xudc_writel(xudc, val, offset + SSPX_CORE_CNT0);
 	}
 
+	if (xudc->soc->crdthp_timer) {
+		val = xudc_readl(xudc, offset + SSPX_CORE_CNT13);
+		val &= ~(SSPX_CORE_CNT13_CRDTHP_TIMER_MASK);
+		val |= SSPX_CORE_CNT13_CRDTHP_TIMER(xudc->soc->crdthp_timer);
+		xudc_writel(xudc, val, offset + SSPX_CORE_CNT13);
+	}
+
+	if (xudc->soc->lfps_ping_trpt) {
+		val = xudc_readl(xudc, offset + SSPX_CORE_CNT27);
+		val &= ~(SSPX_CORE_CNT27_PING_LFPS_TRPT_MASK);
+		val |= SSPX_CORE_CNT27_PING_LFPS_TRPT(xudc->soc->lfps_ping_trpt);
+		xudc_writel(xudc, val, offset + SSPX_CORE_CNT27);
+	}
+
 	if (xudc->soc->lmpitp_timer) {
 		/* Default tPortConfiguration timeout is too small. */
 		val = xudc_readl(xudc, offset + SSPX_CORE_CNT30);
-		val &= ~(SSPX_CORE_CNT30_LMPITP_TIMER_MASK);
-		val |= SSPX_CORE_CNT30_LMPITP_TIMER(xudc->soc->lmpitp_timer);
+		val &= ~(xudc->soc->lmpitp_timer_mask);
+		val |= xudc->soc->lmpitp_timer & xudc->soc->lmpitp_timer_mask;
 		xudc_writel(xudc, val, offset + SSPX_CORE_CNT30);
 	}
 
@@ -3658,6 +3680,7 @@ static struct tegra_xudc_soc tegra210_xudc_soc_data = {
 	.lfps_ping = 0xa,
 	.lfps_poll = 0xb0, /* 1.45us */
 	.lmpitp_timer = 0x978,
+	.lmpitp_timer_mask = GENMASK(19, 0),
 	.u3_timeout = 0x5dc0,
 	.u1_enable = false,
 	.u2_enable = true,
@@ -3677,6 +3700,7 @@ static struct tegra_xudc_soc tegra186_xudc_soc_data = {
 	.lfps_ping = 0xa,
 	.lfps_poll = 0xb0, /* 1.45us */
 	.lmpitp_timer = 0x978,
+	.lmpitp_timer_mask = GENMASK(19, 0),
 	.u3_timeout = 0x5dc0,
 	.u1_enable = true,
 	.u2_enable = true,
@@ -3696,6 +3720,7 @@ static struct tegra_xudc_soc tegra194_xudc_soc_data = {
 	.lfps_ping = 0xa,
 	.lfps_poll = 0xb0, /* 1.45us */
 	.lmpitp_timer = 0x978,
+	.lmpitp_timer_mask = GENMASK(19, 0),
 	.u3_timeout = 0x5dc0,
 	.u1_enable = true,
 	.u2_enable = true,
@@ -3715,6 +3740,7 @@ static struct tegra_xudc_soc tegra234_xudc_soc_data = {
 	.lfps_ping = 0xa,
 	.lfps_poll = 0xb0, /* 1.45us */
 	.lmpitp_timer = 0x978,
+	.lmpitp_timer_mask = GENMASK(19, 0),
 	.u3_timeout = 0x5dc0,
 	.u1_enable = true,
 	.u2_enable = true,
@@ -3733,6 +3759,7 @@ static struct tegra_xudc_soc tegra238_xudc_soc_data = {
 	.lfps_ping = 0xa,
 	.lfps_poll = 0xb0, /* 1.45us */
 	.lmpitp_timer = 0x978,
+	.lmpitp_timer_mask = GENMASK(19, 0),
 	.u3_timeout = 0x5dc0,
 	.u1_enable = true,
 	.u2_enable = true,
@@ -3743,6 +3770,25 @@ static struct tegra_xudc_soc tegra238_xudc_soc_data = {
 	.has_ipfs = false,
 };
 
+static struct tegra_xudc_soc tegra264_xudc_soc_data = {
+	.clock_names = tegra186_xudc_clock_names,
+	.num_clks = ARRAY_SIZE(tegra186_xudc_clock_names),
+	.num_phys = 4,
+	.sspx_offset = 0x4000,
+	.crdthp_timer = 0x33,
+	.lfps_ping_trpt = 0x7a1200,
+	.lfps_poll = 0x3b, /* 1.466us */
+	.lmpitp_timer = 0xc9,
+	.lmpitp_timer_mask = GENMASK(11, 0),
+	.u1_enable = true,
+	.u2_enable = true,
+	.lpm_enable = true,
+	.invalid_seq_num = false,
+	.pls_quirk = false,
+	.port_reset_quirk = false,
+	.has_ipfs = false,
+};
+
 static const struct of_device_id tegra_xudc_of_match[] = {
 	{
 		.compatible = "nvidia,tegra210-xudc",
@@ -3764,6 +3810,10 @@ static const struct of_device_id tegra_xudc_of_match[] = {
 		.compatible = "nvidia,tegra238-xudc",
 		.data = &tegra238_xudc_soc_data
 	},
+	{
+		.compatible = "nvidia,tegra264-xudc",
+		.data = &tegra264_xudc_soc_data
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tegra_xudc_of_match);

-- 
2.43.0

