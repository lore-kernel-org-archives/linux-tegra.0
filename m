Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6122C264638;
	Tue, 20 May 2025 09:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732138; cv=fail; b=UXUEBjrlXZjJHUXDkC+1uKcN9SuStAttMyqmnYlKuRfjuJTjInnT3/Z4bhwkVU7a45PXlm3PqplrckrcHKZGg4lcal5PERqPJsdEuzuQBtT632KAMskTXSLJsGvvpr42DB3payA2muDjW1nBYpED2xdbACAVnQeDKoZHHPQK/lE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732138; c=relaxed/simple;
	bh=xjjF2Qi+jG03NuvmmeDKg1BEeXP2l074STILGyq43yw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KbaQhLZOdYITrKFqLcujPK6eaF1QvL2v/YChe+faF0kUr8MR9YCGO1Hy+KAmK1Y2FCRCTECvg2vvJ26M5dWMl9ArfrdeVKqJdqYjNxNpnlcfcoJRoftuzHPbUgnNGtj/8K+J6pSzlhCVnnXunLSO6dWCMHzz2sp4xNar3/p3uEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Raelo37c; arc=fail smtp.client-ip=40.107.237.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Raelo37c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0YMx1SRD6yCqbo/S1YJNO6AydQKuc00naM+VAKPLZV9QlGT6FSDaL8LjKt70j7yEUDx4kwwedx7DDh9FYbiLJg5XD9nVmorzkDRQKHFofA2HmTb95FhpeEZbRwoftBPZpEPlkhSZeIbmmJy7vppTQlDiFOGzEne4wgSEASada2ECk53vqmx606TdZ5N228hKXIzR+Cu6ZeWyZjIffC/Shf7+Y/i0DZihtRTHQZfgAnhBsgGWO3+3H7QBPIedzqHY5ZklTAttC6aYXZejCoweXqQ5BmY1nIQZMEIzYkwXwOajPiw9VsaMQjBROu8+3zzNHIZKWx2WIFj/+dADCnoFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jSedP2viiAXiUc3hF6mDKh1IMoKNKruEO89ZjoH3Y8=;
 b=XA7SyW6UwA9iv1BKp2+Sujq6FuqNgqULdKTPBG13G/8M4/ZtlHFjunnJ19kkbwMuN+NPZDFocAqTonNLbW5xjBSBIOMeF7oscxduXPfBrkewLkr0w7dALO3kg6V+qTTDQOv150KL/vgTOw+8DB9uyxO3HW57Eb61sRelaxpbYlbFS+OCBgHlwjY+gnBcknPRHiJ1TLbehjlbmFEw+Mg0T/jtYSmKkuhSvafcrn8B9cemCKy1ioT6rV5BYlAa0oMJ6+SO026iTAm+30GU/SebUogEbaSEyHPwZU/UQWnd2LSFFjRG7uq+5icuPSOyI0pdueQZt+rJV1XAQN1RsNDW7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jSedP2viiAXiUc3hF6mDKh1IMoKNKruEO89ZjoH3Y8=;
 b=Raelo37cWJF1KKLttJars7oGM8w7s7sl69zRpa18IaMoc7C5B5CFHMa6Z2kTKtIpak52yWRQs540qZts9oYY+JhKREEOcQqr58CXIj2jS2w8ajlu3is6hL6LXNECKjfpr7jD/0OkrnV7X2yfbvpmWCkfnsOV0aer5prTugAkKBM6Xb0KVl199hRFceZjfe/ru0aml/KQbAl5xZ0VShD5u0DHIEKLPR5sc1urHlqksZk3rhit+GSnWb6THnG3ODlaGZL8Kj/KueWTaA4MLBKBLesob9tg87VwVyLVhlbmEeorpA4hy0+ZwcDVPyqNmK9Pw+QeWaN/aSiB8TF4T6rE7w==
Received: from SA9PR13CA0116.namprd13.prod.outlook.com (2603:10b6:806:24::31)
 by SJ0PR12MB7007.namprd12.prod.outlook.com (2603:10b6:a03:486::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 09:08:53 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:806:24:cafe::c4) by SA9PR13CA0116.outlook.office365.com
 (2603:10b6:806:24::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.15 via Frontend Transport; Tue,
 20 May 2025 09:08:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Tue, 20 May 2025 09:08:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 20 May
 2025 02:08:42 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 20 May
 2025 02:08:42 -0700
Received: from build-shgarg-noble-20250422.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 20 May 2025 02:08:41 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: <jonathanh@nvidia.com>, <lee@kernel.org>, <robh@kernel.org>,
	<krzk@kernel.org>, <alexandre.belloni@bootlin.com>,
	<thierry.reding@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Shubhi Garg <shgarg@nvidia.com>
Subject: [PATCH V2 5/6] arm64: defconfig: enable NVIDIA VRS PSEQ
Date: Tue, 20 May 2025 09:08:31 +0000
Message-ID: <20250520090832.3564104-6-shgarg@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520090832.3564104-1-shgarg@nvidia.com>
References: <20250520090832.3564104-1-shgarg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|SJ0PR12MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c27176a-fa5e-4546-e170-08dd977df181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QIQONVmo3eIBIOLtmGWVuW+3DCxKZl5xY3krszMJRxdFjyIJ7Om/i7m57ADD?=
 =?us-ascii?Q?MixyvhRW907MfqysUCxsx9Pk7FJUm/ezgd6jzz4QkrpRl0EboM3FbiolaTT4?=
 =?us-ascii?Q?d/i2RW6UYOl2Z72bTRpVIGin97mAru/HEE6TAnkVgU/rCNuG5fUfHjSUt9V+?=
 =?us-ascii?Q?+tnaym4izZFE11t6QCEI95DMau/crVIM1R/XPErTFrtRZyTdKA7Eh/3Q1by8?=
 =?us-ascii?Q?sGqemldMBb+iLZCO2nnmaQ3Mz+9NLLqghXkiHTn1kI5JQJMIm7G7MBW0D5LG?=
 =?us-ascii?Q?qGskLX1k5y3jzp/6VqTElv5Kqy0UP6qrQC2PUXqDMPrw8LLSQwBi5ZY9Q8ib?=
 =?us-ascii?Q?cJNyWZp/qTbqi6rZOZlYKQ3yBnFzj7gYa995d4t+X0L9hfNQ5li83bpUZoFZ?=
 =?us-ascii?Q?OrcJsIqmHWf4I9ASPPSBC2QZ8RQGIsuveuRB7kWMmM2FFPif7HbTm+OPWZfQ?=
 =?us-ascii?Q?oBW/+ehw4r8Ztjeo7IwVKbNBnd8SMOU4Kp2imEimYQRQttVG4DJawod3u3af?=
 =?us-ascii?Q?0GNgLzHE45hvaPnSXYga42jYXCQxhZP4/gmsZIl8NJHgFTxKUcD5uHAdmQ3s?=
 =?us-ascii?Q?gQuz5jDOoVE5hKcTBRMucYa3qBelU1/6sqwhQhvIbg/dWO4rYg6QBCXp+9gk?=
 =?us-ascii?Q?WeglbvJfFkcMXm/gAfWw73basU3a9G/U4bt2rSOV0o7t9rlOLJxAB4VPFJlE?=
 =?us-ascii?Q?aNvVFbVroH2u/BQF50XDml5cxzYJFrVAN779vDpFuGJq6g7xLU2jwg1r2Z58?=
 =?us-ascii?Q?RIXbPkdXRyL+b4eg9ae8XgIekIy7WdTuR5L6RDKbROeak8lR92DfB3swZJWO?=
 =?us-ascii?Q?B/pPOjuElxVNxs30XwPtbMDAlfd2DBUZ1OkwG2n5u8wy4X1ltW9/5bC+p5pS?=
 =?us-ascii?Q?GPQEPf2Z8GsjW/p5bJiyqyydyyExepSbXo3O6BFLSo1AiXrunAY9oaJRATn6?=
 =?us-ascii?Q?TlnDgRFN/ukVe/I8/fnsW2MfOjlOT6dGUwfOrK7nJ/ZD0r/GG9Srm7IEtdre?=
 =?us-ascii?Q?moph+jnzCAvNZF3amd/wdncG+qOjWyMQ2qZEeGCh2Zc2iFZBwDL0GVxUAdiO?=
 =?us-ascii?Q?ml9xGV0YM4+3shfaatl+5rc3lcF0D9TWSvPxz2Q89Btr51kf7VLRnMJlrauf?=
 =?us-ascii?Q?ESSaoa74iBvm/u8z7IcIBQFpe7wBSbych3ixx2piN3pPcxtmBk9+fIzcU664?=
 =?us-ascii?Q?LDBoacFxin5kAXwpSptkuDtpkClmwEghrqP8myvE80UKO2jFb6TTkB9qo9cs?=
 =?us-ascii?Q?faEXg1ishPicNP0lKGDTrvAhR3abZ1uKZfTXqPt/5qdChilv0WvF2sjO/3lo?=
 =?us-ascii?Q?gCOo1DMbBj1+Cxk2z7IxIVDQYGHiFszLLplJlb5bNNa436sURqVwABui/kyj?=
 =?us-ascii?Q?uQ9KcdRYjatkuN2a+MzBPShLkmWJgkzV6TrYWxS8H1EULofpaAtUZ1ipMKWf?=
 =?us-ascii?Q?brvXJppgBODvuyyUupajE8thwPxnnGNt1TkxKXz2weuiidnJb7UHT90Gj1bb?=
 =?us-ascii?Q?3/DiPkMoSovQmSH3VJoFnL3viHEdkWWPhWuM?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 09:08:53.3802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c27176a-fa5e-4546-e170-08dd977df181
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7007

Enable NVIDIA VRS (Voltage Regulator Specification) power sequencer
device modules. NVIDIA VRS PSEQ controls ON/OFF and suspend/resume
power sequencing of system power rails on Tegra234 SoC. This device
also provides 32kHz RTC support with backup battery for system timing.

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

v2:
- moved VRS RTC config to correct place

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1f3fd474911b..11b64ac4bb59 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -785,6 +785,7 @@ CONFIG_MFD_ROHM_BD718XX=y
 CONFIG_MFD_STM32_LPTIMER=m
 CONFIG_MFD_WCD934X=m
 CONFIG_MFD_KHADAS_MCU=m
+CONFIG_MFD_NVVRS_PSEQ=m
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_AXP20X=y
 CONFIG_REGULATOR_BD718XX=y
@@ -1259,6 +1260,7 @@ CONFIG_RTC_DRV_MT6397=m
 CONFIG_RTC_DRV_XGENE=y
 CONFIG_RTC_DRV_TI_K3=m
 CONFIG_RTC_DRV_RENESAS_RTCA3=m
+CONFIG_RTC_DRV_NVVRS_PSEQ=m
 CONFIG_DMADEVICES=y
 CONFIG_DMA_BCM2835=y
 CONFIG_DMA_SUN6I=m
-- 
2.43.0

