Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842718;
	b=P6X+BZnKrme9fcGoAPgEetam98p1rzVXg36xYd5UITgLsRqEw/P9zz3ikVAC/cxryYSn
	 8rdgFgwxrCyfejhQv86gNPwRu6FubBliEbNQ2Ppqalg96b7hgzTJFxKniM5n+/zW7CW5P
	 oQTzzfesvKsar98puZaKrlTdCApat5QwlEFVir9agL1Bnw3f8miFE3Mg6V/ytlsH0C8HD
	 +g2HowNYHC8wh1T8/X9vnumWwG3AONfTj36lC77cDHwPRrzncQZmenITL1YxmZh5nKQNk
	 alTnugym+6uoL/vmQKgWv6K5ldah99OjN+If/F+GP7uIBe7ilqnGPV0UzSF53znvalw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842718;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=wYOdeBASxVWpQvIEc3Z0ZYRdflSvupMwuQtTQRUmO9k=;
	b=YaKwffN/KxItbaaoxAvvHEx99fBgEHwYfkNtY0sA8dB1M2XClb4mRHYz46RMrUK2/IJ+
	 gxq7zFPBpbNGd/4Q8IYfHjjL3WdxDT/KhBV0Xf7xVj3uTE5T0YeUERQPDtKigH3U3a8uf
	 OVgeEkdz4hWs64LpfTQqTH28QqnJ5Fz5oQ7MXcv0Ic6ACbM/bgm+g7mk7HM2lf0gxjZzD
	 hEi44FBo29USlenrDPqYcqZpBO4qMN0jpXEJZTdjJ+GkvSVgV+C9P78wOSZY1ERxUtQTa
	 Hj0Hc6uwMOJBHxOIV/W/vT/u85QBb53xqloNUTxM4VCVNNc9Cz9Bl2TvxyZdN54SiUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UMI4MIMg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.41
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011041.outbound.protection.outlook.com [40.107.208.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42950606A31C;
	Mon, 16 Nov 2026 15:25:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42950606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UMI4MIMg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CL/cRjSxW+cnodduFBcmbJUQ8aJcevKo6Lb2yGJDu2mNEMDtMz27kWBN42QY87uQDMIWE5hlXYLCQzkltkRHGtMzHh4+BvXkn7OY/460AFCwBMj5p9//2RaEqI95skisS+NgS4h25hmruLW5eOVTpmWy1zGqRxEuqc89eAXkRXs8QerHxeZcM8VZuXQR9zhRqgvAykkvomd2NGB15U2icui5iXLZKeGIt5kDYdaLGjBPhbgMmNnICaFXkyMam7/cVn9t7KeiE/CjeEjqwNdJdRSDkHJQjZSgSreB5R9ugJllmWlX6ZpkDrxgKYbg9DNcsnbUFo3AQMF904+rLbZt+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYOdeBASxVWpQvIEc3Z0ZYRdflSvupMwuQtTQRUmO9k=;
 b=JfrZ12zpjk+Wlw+D8l988WxaQ519GHfAjlNlMbD8rmPWp/WnrLkC6AexZGAYSjSQl5JEwiLkXA4R2yfGw0m4Y05lmM1KVWVlrkxHEqpzQhorLbc3Qwu4YEWp9gd0fCGVdTDgkx/5ikGAAcRfO9/tnnvjGjOLsVcrC6XApwVPIwnLJAuh/srXjvCF664nKGwOF91jW94BWANeUDknmy4x4JDWCKYFqPHB/aOIvV+VGyElROa5tv1lrIjA9sYi5DOFGxGe1P1PoQPc508o0hgpONL46HBZu24XRDskiNiFKEvm6GZfOD6XtpCWIUDix6ZBzWOvUkIbl2HOnOqI5xVmMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYOdeBASxVWpQvIEc3Z0ZYRdflSvupMwuQtTQRUmO9k=;
 b=UMI4MIMgH3cqu5LBMtTKNLTJoQxyzSKdUioFMjfVHKo6emDmlPI0GaxwwzWMs1WzsSWBG+Lwm3trA3d84Nu7HY5+kOfV2Xi/1rNJPfQbMecI5FQPbVEctF9TR0z5uppZm7lJc1FlvNZ8aWW8mDaDShfkbJoFrKAfB4eso8JbszeqEyU31wE/suo/CpcJ3t7A8fgwRAMkMaCbNswiMv3x4Fvjv02hLeRzdnoK9LyAiJID/bwVXx6SozynmrSyi7WVgb4JeqSChfR4XnfgqqU2kLhazCHMx++8AN4xQDdZORDMGKNnPFV0DiVaYDCvErPdIvYyhv/0Rp+U6dfyMXZgKA==
Received: from PH8P221CA0065.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::13)
 by DSVPR12MB999125.namprd12.prod.outlook.com (2603:10b6:8:38a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 15:25:08 +0000
Received: from PH1PEPF00062F2A.namprd02.prod.outlook.com
 (2603:10b6:510:349:cafe::11) by PH8P221CA0065.outlook.office365.com
 (2603:10b6:510:349::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 15:25:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 PH1PEPF00062F2A.mail.protection.outlook.com (10.167.243.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 15:25:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 07:24:44 -0800
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 07:24:41 -0800
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 16 Nov 2026 15:24:08 +0000
Subject: [PATCH v2 11/12] usb: gadget: tegra-xudc: Add default settings to
 SoC data
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261116-tegra-usb-v2-11-42efc03a9700@nvidia.com>
References: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
In-Reply-To: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: PH1PEPF00062F2A:EE_|DSVPR12MB999125:EE_
X-MS-Office365-Filtering-Correlation-Id: 67fd4d15-3c7b-4cde-3659-08df43f5cc6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|23010399003|6133799003|261009223027099003|18002099003|22082099003|261021121427099003|261021123027099003|261022075727099003|261102123227099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	rhCkPoAfYr00/s/CehpcKnOS+MEU+IEgUJ+UdPbGhw95NjJNZF/b4kAt5LGsM9lPyvDN/u/bzh5yfYvOYT6nsOiltJwxU3hHPNciVC25elL2TmS7EOsqx5seqV0dq9gGV/RVfV2K0aa8Rs0sk5RjNl1S+sYZcfchbU5QQfitePpJcLuyLZrkKjP8VPOkTIfYq6W7SEpYqPgGCsZBA0WPsWw1WCKG9w+/QXhoXY11LpjfiIUzLXbs8XfH9pEEDLsEWPDQ7sB1wkxmZpH4YT9o745Q/E5yyUVZ53UW/V/kddmIg4VHFcdBrBAoFCuKIJCzI9en40++bUKWb6YSVvwzjGGnTGPlFSLMSf0Z4yl+KNTEdnIqFOyOQDUhIwqNIbxgxxRfzZE0CJpeyctzG6pnd6JA5x+VzD/gGGAde3PjcEvBhzfRc7EzriSf5u/kKEZuT0L0WwRDt66RnuKkfOofmxud+w9CNyxB+6f8icJDuuYgbknjgc/z2JZ6CNIh2vhWjBuvbT+q8UkPZJ1uFTGzszJ50/QagtInMdX03LzqLjRBws5wZ+K+lJ+kyOpCKocZIeRM4hVc9kqO/dp7zhhmSUebB4sMFyZmj2q6n21fVYdyvZQBRuPJ1VNBva7C/gzmajPU6QnmMTpbHGzNuSPCxtVMGriheoXBdJSQsH7lu4Z5DD6i0SAkO9WReWfXBN9GmeB2/V2cvjU/lRVf0frAmg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(23010399003)(6133799003)(261009223027099003)(18002099003)(22082099003)(261021121427099003)(261021123027099003)(261022075727099003)(261102123227099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nSlmlE+7M1qzV9d8gGfNtn55XFqECOgd6BnAkIiiC79Y2Y6xFDBWdMNQB2z3HfuS+hAaU8qri21N5zmXx23IT4Pmwuh8AgxXem+BXZXcyBRki3JWWrF6O1D0klFJGpFnnvu0NUUrqc/6yysaaK0pgjrnDGOt2LfLDzqRhtpThX2iorylylwUw7lWqKJJ1KWAr1CkuUxHGzDvgNousba0X9Lp+kzwO+QUoOb3UbzJWOzT6GddlUhO306MtDe2IdkL/AzmMuhEg/8BxISsfbaLTIaevFRqR0KUyp9PC901Y1Z6ol5aXAFBm8pyN2LfRwpA2IGAup2m1HI+bfUXZ0bpG+uAZ717xrwaFLmGCgYs/FVv+MV0JmsxfkmVac9HCC4/bZWRceKy8q+PTMwVui/CDTsiRDAibEYR1z+7lI3duAgG/vYA71crEo9gUTY2viEL
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 15:25:08.4662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67fd4d15-3c7b-4cde-3659-08df43f5cc6c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH1PEPF00062F2A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999125

Some of the default settings that need to be programmed into the
SuperSpeed Port (SSPX) registers differ for Tegra264. In preparation for
adding support for Tegra264 move the necessary register settings into
the SoC data so that different values can be programmed for Tegra264.
Note that for Tegra264 not all of the SSPX registers programmed for
existing Tegra devices are programmed and so only write these registers
if there is a non-zero value in the SoC data.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 80 ++++++++++++++++++++++++++-----------
 1 file changed, 56 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index d11c2f5069f2..caf437d6b754 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -552,6 +552,10 @@ struct tegra_xudc_soc {
 	unsigned int num_clks;
 	unsigned int num_phys;
 	unsigned int sspx_offset;
+	unsigned int lfps_ping;
+	unsigned int lfps_poll;
+	unsigned int lmpitp_timer;
+	unsigned int u3_timeout;
 	bool u1_enable;
 	bool u2_enable;
 	bool lpm_enable;
@@ -3395,7 +3399,7 @@ static void tegra_xudc_fpci_ipfs_init(struct tegra_xudc *xudc)
 
 static void tegra_xudc_device_params_init(struct tegra_xudc *xudc)
 {
-	u32 val, imod;
+	u32 val, imod, offset = xudc->soc->sspx_offset;
 
 	val = xudc_readl(xudc, BLCG);
 	if (xudc->soc->has_ipfs) {
@@ -3413,23 +3417,29 @@ static void tegra_xudc_device_params_init(struct tegra_xudc *xudc)
 	if (xudc->soc->port_speed_quirk)
 		tegra_xudc_limit_port_speed(xudc);
 
-	/* Set a reasonable U3 exit timer value. */
-	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_PADCTL4);
-	val &= ~(SSPX_CORE_PADCTL4_RXDAT_VLD_TIMEOUT_U3_MASK);
-	val |= SSPX_CORE_PADCTL4_RXDAT_VLD_TIMEOUT_U3(0x5dc0);
-	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_PADCTL4);
+	if (xudc->soc->u3_timeout) {
+		/* Set U3 exit timer value. */
+		val = xudc_readl(xudc, offset + SSPX_CORE_PADCTL4);
+		val &= ~(SSPX_CORE_PADCTL4_RXDAT_VLD_TIMEOUT_U3_MASK);
+		val |= SSPX_CORE_PADCTL4_RXDAT_VLD_TIMEOUT_U3(xudc->soc->u3_timeout);
+		xudc_writel(xudc, val, offset + SSPX_CORE_PADCTL4);
+	}
 
-	/* Default ping LFPS tBurst is too large. */
-	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT0);
-	val &= ~(SSPX_CORE_CNT0_PING_TBURST_MASK);
-	val |= SSPX_CORE_CNT0_PING_TBURST(0xa);
-	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT0);
+	if (xudc->soc->lfps_ping) {
+		/* Default ping LFPS tBurst is too large. */
+		val = xudc_readl(xudc, offset + SSPX_CORE_CNT0);
+		val &= ~(SSPX_CORE_CNT0_PING_TBURST_MASK);
+		val |= SSPX_CORE_CNT0_PING_TBURST(xudc->soc->lfps_ping);
+		xudc_writel(xudc, val, offset + SSPX_CORE_CNT0);
+	}
 
-	/* Default tPortConfiguration timeout is too small. */
-	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT30);
-	val &= ~(SSPX_CORE_CNT30_LMPITP_TIMER_MASK);
-	val |= SSPX_CORE_CNT30_LMPITP_TIMER(0x978);
-	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT30);
+	if (xudc->soc->lmpitp_timer) {
+		/* Default tPortConfiguration timeout is too small. */
+		val = xudc_readl(xudc, offset + SSPX_CORE_CNT30);
+		val &= ~(SSPX_CORE_CNT30_LMPITP_TIMER_MASK);
+		val |= SSPX_CORE_CNT30_LMPITP_TIMER(xudc->soc->lmpitp_timer);
+		xudc_writel(xudc, val, offset + SSPX_CORE_CNT30);
+	}
 
 	if (xudc->soc->lpm_enable) {
 		/* Set L1 resume duration to 95 us. */
@@ -3439,14 +3449,16 @@ static void tegra_xudc_device_params_init(struct tegra_xudc *xudc)
 		xudc_writel(xudc, val, HSFSPI_COUNT13);
 	}
 
-	/*
-	 * Compliance suite appears to be violating polling LFPS tBurst max
-	 * of 1.4us.  Send 1.45us instead.
-	 */
-	val = xudc_readl(xudc, xudc->soc->sspx_offset + SSPX_CORE_CNT32);
-	val &= ~(SSPX_CORE_CNT32_POLL_TBURST_MAX_MASK);
-	val |= SSPX_CORE_CNT32_POLL_TBURST_MAX(0xb0);
-	xudc_writel(xudc, val, xudc->soc->sspx_offset + SSPX_CORE_CNT32);
+	if (xudc->soc->lfps_poll) {
+		/*
+		 * Compliance suite appears to be violating polling LFPS tBurst
+		 * max of 1.4us.
+		 */
+		val = xudc_readl(xudc, offset + SSPX_CORE_CNT32);
+		val &= ~(SSPX_CORE_CNT32_POLL_TBURST_MAX_MASK);
+		val |= SSPX_CORE_CNT32_POLL_TBURST_MAX(xudc->soc->lfps_poll);
+		xudc_writel(xudc, val, offset + SSPX_CORE_CNT32);
+	}
 
 	/* Direct HS/FS port instance to RxDetect. */
 	val = xudc_readl(xudc, CFG_DEV_FE);
@@ -3647,6 +3659,10 @@ static struct tegra_xudc_soc tegra210_xudc_soc_data = {
 	.num_clks = ARRAY_SIZE(tegra210_xudc_clock_names),
 	.num_phys = 4,
 	.sspx_offset = 0x600,
+	.lfps_ping = 0xa,
+	.lfps_poll = 0xb0, /* 1.45us */
+	.lmpitp_timer = 0x978,
+	.u3_timeout = 0x5dc0,
 	.u1_enable = false,
 	.u2_enable = true,
 	.lpm_enable = false,
@@ -3663,6 +3679,10 @@ static struct tegra_xudc_soc tegra186_xudc_soc_data = {
 	.num_clks = ARRAY_SIZE(tegra186_xudc_clock_names),
 	.num_phys = 4,
 	.sspx_offset = 0x600,
+	.lfps_ping = 0xa,
+	.lfps_poll = 0xb0, /* 1.45us */
+	.lmpitp_timer = 0x978,
+	.u3_timeout = 0x5dc0,
 	.u1_enable = true,
 	.u2_enable = true,
 	.lpm_enable = false,
@@ -3679,6 +3699,10 @@ static struct tegra_xudc_soc tegra194_xudc_soc_data = {
 	.num_clks = ARRAY_SIZE(tegra186_xudc_clock_names),
 	.num_phys = 4,
 	.sspx_offset = 0x600,
+	.lfps_ping = 0xa,
+	.lfps_poll = 0xb0, /* 1.45us */
+	.lmpitp_timer = 0x978,
+	.u3_timeout = 0x5dc0,
 	.u1_enable = true,
 	.u2_enable = true,
 	.lpm_enable = true,
@@ -3695,6 +3719,10 @@ static struct tegra_xudc_soc tegra234_xudc_soc_data = {
 	.num_clks = ARRAY_SIZE(tegra186_xudc_clock_names),
 	.num_phys = 4,
 	.sspx_offset = 0x600,
+	.lfps_ping = 0xa,
+	.lfps_poll = 0xb0, /* 1.45us */
+	.lmpitp_timer = 0x978,
+	.u3_timeout = 0x5dc0,
 	.u1_enable = true,
 	.u2_enable = true,
 	.lpm_enable = true,
@@ -3710,6 +3738,10 @@ static struct tegra_xudc_soc tegra238_xudc_soc_data = {
 	.num_clks = ARRAY_SIZE(tegra186_xudc_clock_names),
 	.num_phys = 3,
 	.sspx_offset = 0x600,
+	.lfps_ping = 0xa,
+	.lfps_poll = 0xb0, /* 1.45us */
+	.lmpitp_timer = 0x978,
+	.u3_timeout = 0x5dc0,
 	.u1_enable = true,
 	.u2_enable = true,
 	.lpm_enable = true,

-- 
2.43.0

