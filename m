Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011071.outbound.protection.outlook.com [52.101.52.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667E1497390;
	Mon, 21 Sep 2026 12:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993209; cv=fail; b=QEMh7CQl7obecWmXDGujK5ca7p4d7OPhrY4LpHf8wtWy9OGNtA9c/rc1GGWfLmpKFc9bbWnKKkRr5E8DsL6QQCE8P2F1iOYQXu5Jp/+WQ5gPGOU2anWpZGVJj1tGTs/+iZfv8pPuKMKAS54ThyXHJu3RToNW3gdhmys42OadLjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993209; c=relaxed/simple;
	bh=ofoihSW4U9f810+ZVSD+81ziIc3d7F66eBeBT8vM21s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZTlmeVnZgBnIBAkdOUF6veZceKPyI66LoVhSpe0g8aCS7ta+rBf2Cwb0dwwJ4ZqImfdi5KAiLAE9qY1ZqDQZ9vz5qOfJdQKKXaLcoNSC4RuD1q/ErJNEWT3/VbfjMuFr7SyCVFujrL9zbbUzO+mWGZ/uDe4/Dxz2Hv+YGS6iW34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pJwdzlX6; arc=fail smtp.client-ip=52.101.52.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pJwdzlX6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HjWmdrICVLPg+9jXbJxvfnxTMzmrox4kfNacJb/FW2RZ5Br05HZ71U5i6SrTkcTWCd3aP3HKWogXHfAfPWd4gJwm/PJmLYQbHDNT+3aQjBv5ljTBahZ1u440VFXqKu9Szum/Ih9jM4ck4Qq8dvECkcTvPcRjzzfCoqQWqQkm3X5ewq/Iw0Q8Gmboa3exnKhkbUFlGIkkXA+eAWwE1cBuiiO/NnJwSh+x0QAjCLcfUkK5WN/NKKT/lpsnxpYWSH0cq0PtR3NoCFNhaloeJmohauREzQOPcbeFFq08p/RWOaCjQ1jTt+tHX4cITvD5+S18w1hlhF9omrOJSrWC3SUU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHQsE2mQcl26zVV5eiPkqTaL1EhvmZ0/vajTiWe2DKA=;
 b=yzuYs9WeqH78fKoDnIXVL3ETZ0gVrhS8tnQtrWgfstioSno2g0K/Vb5e9lvdhGJ1UFXfD1hZeego77h92czoM8ETEzXQWJ4t5a2gTMstjxzS3tlW65LjKofcexA+ozgHtRodXP89mlWOpEJRsA3wK8K1XTilIcJCbLShAwQ7e8yQiGhtvoFymSr67MmI5Lzsx+FWgFvOY+8o9x6z+nqF5olOyUP0NUjAc6kjh+ocHgynb5NmphjiT759BUPypYSMk6FQq/qyF4bVaSCgVXYKGOJXiDnab76thFRlZgXCcYYq8sXdS/bYqyHLEPHtaqERGiE+8WHHACaPwAeWX9pegA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHQsE2mQcl26zVV5eiPkqTaL1EhvmZ0/vajTiWe2DKA=;
 b=pJwdzlX6rgGbAtAOGnFDTJk3bxXyDLwCnpybhSIB/IPVRrJhyADjo3TbQWS7EPJFEuG/VWD2ndrKK6WvzqnuqATXiTBE/1qWTUsp3eA/X3uZkRj9Xyh7rLl/h/eNFr0oza6BTSsiTx8hW2/X9/fkkjXl44iBzqlR8e3cYFbSh1SgjqnlniKSyOi1U/1IHfIJanqLyMic/obCgfR40+WwC7zs373V+MnWhtCO0KVDv/vcMaRNaec0dKK2SfG8nlou/LxqPxcarrb+WGdwJuXc5IUmSmKfYX7Pltcghc9ACV01HvkGHgAVmPlLfv/bvZhLACzUgWkg7vcbTAbq96Woag==
Received: from BN0PR04CA0065.namprd04.prod.outlook.com (2603:10b6:408:ea::10)
 by CH3PR12MB8536.namprd12.prod.outlook.com (2603:10b6:610:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 12:19:58 +0000
Received: from BN7PEPF000000AB.namprd05.prod.outlook.com
 (2603:10b6:408:ea:cafe::86) by BN0PR04CA0065.outlook.office365.com
 (2603:10b6:408:ea::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 12:19:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN7PEPF000000AB.mail.protection.outlook.com (10.167.245.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 12:19:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 05:19:42 -0700
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 05:19:38 -0700
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 21 Sep 2026 13:19:08 +0100
Subject: [PATCH 8/9] usb: gadget: tegra-xudc: Add default settings to SoC
 data
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260921-tegra-usb-v1-8-74a925a35d82@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000AB:EE_|CH3PR12MB8536:EE_
X-MS-Office365-Filtering-Correlation-Id: bc92685c-e5b4-4ec4-b20a-08df17daa712
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|36860700016|82310400026|1800799024|6133799003|56012099006|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	vZxeOIw/sMFPijipdAzcB2PXV4ue2O+6ZiWMPVtUwhA9hZcjMkLajLvNYjsJuZc2+kgsR3L31vQGux5vdat3pqTclVTNyoNwwM8IYTGtT4jEx+O2pzpvI/tolW+sGB9F/pn4CPgESsSLke67EKqDH0VEpCxc9PGBKvNjUGfrDDIbyRH8QiuDgrnhaCvVUChVBkJNCVmpFZkHijVy2Ot9TwaS6CY8h3EwjMRkmLfR5CO60nh1GobNxXxZ1Xs8U0Fcmei/pSBg/uRgWNAVCoZDh27Cz+oVrvfN+GPo78ZPlGBkhpmSaA+cnHOmKz/lH1fdhV1lPegQaOsu3Rtj/3zXUjHTNVDDXDKaWBzw7O9IpQRgSWhA0CBfpzQG3lTZD5D+J9LDUskWoERup9x4xmzfMfJYPKelAW0PtGXT8gHWV46vMePLHplKyYmlHY9iJz2H1et1Fvt+HWI/n/nnx+cpGu+Q8lvtC//uMr7g7LMqUxAqeU/12BIsI+M5yG5FCshrdKTRwnHkm6G+03PUgrpVhWo8xXcdLCLjSkK64OfS8ToXMjfgf/3JbHlGGc5V4USNg1JOiiDtst6tNg45OyvNcMrUK09gAuyOgqWHpFSjVzf9lVjUT/pjCe7o4TZTMrFrZzGviPqzWBGg0Zw9Vp1l66vKByyLHSMIzaOClZyrJQxmaMSenQUMuVV1BCznbbjz2v1uuZ2+Nx0YWfIlIxzcJQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(36860700016)(82310400026)(1800799024)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3ifiqsZvC8Uj4h1Uu735ojMxIobYVHr9YWAFcDUSzvzfA+N95Spk1V81YBgywWDqTlvkStWiPnlCrQ4+5VVvt2rrZL1Xne7jJGNFp05oB1h5eFR9eENrnQCQF7uosu5UkFai/hoqtSUtMSOmAdcgNqQNDqDJy3UjCAAqzc9s5yHeEnT45z00Q02Y9WqCifBrZ5bMFCXm83zsNc4gBiY9X5e9PkuIR1iuFVu+JA25zVRVQR3U2azlcF+KrBlQUd2SINYY6wCArm5PgL8Dq8HXw14jxkpYPHaSxtkHUEN/t2bpQq3NqLPRBcWpH5fqo/MAKq8fP8oZKylyVroWsIajANIi6NNaGrHGEdf9bMK2HT1nffJBX2s1YauMv97D5xGUQbtDewVMT6NHx74ZxCYdkU9qtOlvV9Z9twY2fcgfEpdbSzmUouHHnoS0qti7S4wn
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 12:19:58.1408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc92685c-e5b4-4ec4-b20a-08df17daa712
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000AB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8536

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
index c97cacb7e416..56585c350cab 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -549,6 +549,10 @@ struct tegra_xudc_soc {
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
@@ -3391,7 +3395,7 @@ static void tegra_xudc_fpci_ipfs_init(struct tegra_xudc *xudc)
 
 static void tegra_xudc_device_params_init(struct tegra_xudc *xudc)
 {
-	u32 val, imod;
+	u32 val, imod, offset = xudc->soc->sspx_offset;
 
 	val = xudc_readl(xudc, BLCG);
 	if (xudc->soc->has_ipfs) {
@@ -3409,23 +3413,29 @@ static void tegra_xudc_device_params_init(struct tegra_xudc *xudc)
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
@@ -3435,14 +3445,16 @@ static void tegra_xudc_device_params_init(struct tegra_xudc *xudc)
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
@@ -3643,6 +3655,10 @@ static struct tegra_xudc_soc tegra210_xudc_soc_data = {
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
@@ -3658,6 +3674,10 @@ static struct tegra_xudc_soc tegra186_xudc_soc_data = {
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
@@ -3673,6 +3693,10 @@ static struct tegra_xudc_soc tegra194_xudc_soc_data = {
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
@@ -3688,6 +3712,10 @@ static struct tegra_xudc_soc tegra234_xudc_soc_data = {
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
@@ -3702,6 +3730,10 @@ static struct tegra_xudc_soc tegra238_xudc_soc_data = {
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

