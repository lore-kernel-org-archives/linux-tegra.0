Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E8020AF66;
	Thu, 13 Feb 2025 11:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739445158; cv=fail; b=fLsNL6zW4LA9a7O518FoxXdkauGynt1tF+tdlqi03t8ctY2qDl7qcUHIjbO8ptsz6wf/dQcJShrLTFKpGOD8fNU10wQvi51ImB/8x/ghTDtf7BglgwjPpHX3dDr8z2btsRfLMB5n9PkA/GhTmhBSGmGOJMTVg2QfwS4L64zRIg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739445158; c=relaxed/simple;
	bh=GqwUhh4gOU0idU8+SBUHdFqWRAicHzMRQpYg83Fohj8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SH+fAPOUk5blHC/sXirK+0L4D4t1kOY8CGUvdl3BVRJTyOmAXfO26SWVZD2/vbh5mjOuXkcbD5VK4zn8Zw7/HmaP9delPtc4/CXW/8HsEOZCIJ3eJ4D3hLG8/MD1zk8EITB37lpNfqHAah5eshMjTAkH6TM9pHEopyeadxIjX/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ss27Kx4F; arc=fail smtp.client-ip=40.107.94.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ss27Kx4F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ACQ9+eZdBlNtv4uRjJBg55iyDpSH+GAoupsBXxIzCJjGhJ9rR4tr9IJaC6jOLFvNTDE5lVmhcoZE7vipCH6DlhO7CEqW2iVlmBrfRHuki6Z/fu91oM0yC0nfDcGsvKMbKuriC6nzCQf6k35XcEscJwOHsSkB2Ov9r2cLes9jqM52HMXiZv1+yBKmXzQ95B3O1i2B4y2Ksh1aVDW37t3vuESD+W1pE0GRB4Gt5CRwleL0fj1AbNnl+dxNKFNzVgExVILWY1aLkp/ZPDzVzxaOnfwlf9BTOLD9o++XUmiDyYSEOTX6nmBbSF9rLAXcBnhbcIvs4bHCNmZK1rrsxjx7CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6bV9v+Ga4zFngowc1KRlcoXz5D9Ak6rIRssBSLCDE4=;
 b=dtysn7UfoAKw0w0KbFd9GTpmDIimCIv312O5IPFpOH+txlP+6X6EI/sl62ZYZOxTh2tzF/3Frwhr6zjHFM0QCEnDnh3j5I+3+WYtnPNcwhizAuw/rCV7FcUOUBS/tDf2gtwtMNveBX+aQCoKY28OA1aOdnbCbNOjOYJ4oBraNse2J+xFnC8/t/QrN9Y/fI8GOhkQejoqBb7rJioD6CYuywbJPP480E1shh6st6EqPgDSNILMfOb/Zp/9B8FV/J0HgwYZuRGDNpztGoOGXjpju3PiwgYdlwHhvS1UUBsBo2oCqA4S4O2CzPx6xMkhxcXyNk90xV32TvPDe2Cn0iUaVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6bV9v+Ga4zFngowc1KRlcoXz5D9Ak6rIRssBSLCDE4=;
 b=Ss27Kx4FSoitwxl8GyjbMVDapGgLMdky92pjfNg9U6mQHvPOEu/co75tTsbm4egBZ8SuN7+/KvviAtwjXo4YSj2t7Xxrh/bikOjCNrfi7ZG8QJGBBYO87H810wFzPyDuXeqmphBbcYe0lKSw3c2+Pls7P5szRaXO/zNPtfEg6762dvP+5AJlpf/t+Gq/uhN5f6m+atfsRlejNUhAmkiBoed05pZHHWDPbykwNNYkHE+3RoSt/DRcYWZb5w6trP+jrNUMzdn9ndlZHIO0yy/cA+ROJ87ad1pD3DLsa3/v/ZWrqcLbx/5Qit8d6xPiw3hAtkfxULWBic2bHKzMys/86Q==
Received: from SA1P222CA0167.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::15)
 by PH8PR12MB7028.namprd12.prod.outlook.com (2603:10b6:510:1bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 11:12:31 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:806:3c3:cafe::88) by SA1P222CA0167.outlook.office365.com
 (2603:10b6:806:3c3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.14 via Frontend Transport; Thu,
 13 Feb 2025 11:12:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.10 via Frontend Transport; Thu, 13 Feb 2025 11:12:31 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Feb
 2025 03:12:21 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 13 Feb 2025 03:12:21 -0800
Received: from build-sheetal-bionic-20241119.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Thu, 13 Feb 2025 03:12:21 -0800
From: "Sheetal ." <sheetal@nvidia.com>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<jonathanh@nvidia.com>, <thierry.reding@gmail.com>, <mkumard@nvidia.com>,
	<spujar@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH] ASoC: tegra: Remove the isomgr_bw APIs export
Date: Thu, 13 Feb 2025 11:12:16 +0000
Message-ID: <20250213111216.1238344-1-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|PH8PR12MB7028:EE_
X-MS-Office365-Filtering-Correlation-Id: b976b7cd-8809-47c2-2631-08dd4c1f4f43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L9q+3/ldnshQ94RPSFSKU5UoF0UTTYDW4IAnK8iTXDG3KNc51oV+O7IDE2ZP?=
 =?us-ascii?Q?c24A/VFIX5m/O9AiZs6SSeXi/T14BZeibjUbGGHFxNZUMXmMGYVmVoEKPf22?=
 =?us-ascii?Q?umBuAZGaYOuNDQv29J0/Zlx2371gr6gqIC/vNlt7dt4aFueHHq2urNF8/ZG5?=
 =?us-ascii?Q?bdGnQAYKxCk1a0gY97FKKP4UFN4SfTFV6zG5rxglx50wglNRl03gUK0oFR3G?=
 =?us-ascii?Q?AW292TRDKaS7hGnYH1oAUPwbrTYt86nhs2BHNy5rWcEfjBUzjd559q9qY/0F?=
 =?us-ascii?Q?DKHdTEim4R/b3/d3C2by6hBDhyrJrufTdiVNDDz7pqSm7ZTluMCmrhM7M5KQ?=
 =?us-ascii?Q?vbvK9EcdypgrDyF1t9/yvAMkhzNU014GGvd8U4g9GIOxRaFdogIc8ASFR1CZ?=
 =?us-ascii?Q?7lBnm3h2+VFbWmOGavsyph+V/idmuYy47h+doxJfCNdB4vdo1eAi7ZEqNRcT?=
 =?us-ascii?Q?VTNxyz2gexWd9ZSshHz4HnN+q3fWuZhR6lKUdCmYSxMojOK2ejzxZlon9uGH?=
 =?us-ascii?Q?ByH8YSDmRF4VqRDsWWebmDSKEQYlXxpvE0cWzAi809AbOEydRpVD8AYl4H89?=
 =?us-ascii?Q?MmD5HrVHJ7P5uM8kKShliK3Njv/LHCBKHWusr+KC7fucp+4l6h79cLeyolII?=
 =?us-ascii?Q?2mizG6XzOQR0QaQb+eB5KQPRzVi4SCK5huKywvRapmEp+XqBriCaEqtUK72x?=
 =?us-ascii?Q?PRGZRjV+zO3K89BwBvzXJDWnw5zQjZxyoyJaXyTIFBvHKX1YMzqJ3cV5MvMJ?=
 =?us-ascii?Q?E6cqwt/pv66haEAgmAixJXQrTClHMP+i41En9FUs5SZARo+6hXHLFi1TxzEU?=
 =?us-ascii?Q?ePA70bcdqii01Z4lVEdwvF/Okye6QdkMzLtkw28sIEmhRZ7RHZIQwjtydtZg?=
 =?us-ascii?Q?Ukm+tZHVB8nfnfQfWfsxj+yNRsXifMhMHdeUzsr0XHAExtrZ9taHxiF3LmQJ?=
 =?us-ascii?Q?gIF9i/IQWcsBP8UV6VJkWM5Y6zn/eRIC0mPySgALd4Vis3u3w60vWzkB9JN8?=
 =?us-ascii?Q?nxyzLRf24UcgCsq/Zgn/Wc4LGvTt4qrRO5QMyjXRfQ/iEXVWwXLt2JM8/KyP?=
 =?us-ascii?Q?REbN8E3bYTFETydwa+EqGRgsZuFFMtp4Z5o6pD9WXKO2HAi+mtZbL8yFqRPH?=
 =?us-ascii?Q?umfqsrPGUDiLDFzTI0GcR2H/9JGF7bpS/QoQ7u/DfsX+YuZHcexXZO3kYwuO?=
 =?us-ascii?Q?wy46fO8eTI4ggy32HIeedUkEFy5BC3Xds6LKtt8oQ/IEM24/ox7NE0r4jA8L?=
 =?us-ascii?Q?eozaGmYg/dXJj+PhzNQr6SBrCWfZlTFSpZ5eTZxlvK0zvNF2tOenBRtPzmn1?=
 =?us-ascii?Q?K/rASV02MmAFZJ4zpyQVRBa0UjFQhFU/08lBCbE57UZsXa9MtFBzg4k1s7vG?=
 =?us-ascii?Q?BTOccQuV/vxL7Fp9EmWNKc6gvgNuTgNqdKFsfe7ohuMwKj1HBOR7W+2p+h33?=
 =?us-ascii?Q?wr+uoPYqHmakD5EJmJb7sF19eDzd/CYHWYFYh5DkordPt8cmtP03KYibCTBy?=
 =?us-ascii?Q?94e4QBtjH5l+YMY=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 11:12:31.2570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b976b7cd-8809-47c2-2631-08dd4c1f4f43
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7028

From: Sheetal <sheetal@nvidia.com>

Commit 4a91fe4c0d683 ("ASoC: tegra: Add interconnect support") exported
tegra_isomgr_adma_setbw, tegra_isomgr_adma_register and
tegra_isomgr_adma_register APIs, but there are no users of these that
required these symbols to be exported.
Hence, remove the exporting of the symbols.

Fixes: 4a91fe4c0d683 ("ASoC: tegra: Add interconnect support")
Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra_isomgr_bw.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/tegra/tegra_isomgr_bw.c b/sound/soc/tegra/tegra_isomgr_bw.c
index 7789efe13873..18e802bca6a6 100644
--- a/sound/soc/tegra/tegra_isomgr_bw.c
+++ b/sound/soc/tegra/tegra_isomgr_bw.c
@@ -75,7 +75,6 @@ int tegra_isomgr_adma_setbw(struct snd_pcm_substream *substream,
 	return icc_set_bw(adma_isomgr->icc_path_handle,
 			  adma_isomgr->current_bandwidth, adma_isomgr->max_bw);
 }
-EXPORT_SYMBOL(tegra_isomgr_adma_setbw);
 
 int tegra_isomgr_adma_register(struct device *dev)
 {
@@ -114,7 +113,6 @@ int tegra_isomgr_adma_register(struct device *dev)
 
 	return 0;
 }
-EXPORT_SYMBOL(tegra_isomgr_adma_register);
 
 void tegra_isomgr_adma_unregister(struct device *dev)
 {
@@ -125,7 +123,6 @@ void tegra_isomgr_adma_unregister(struct device *dev)
 
 	mutex_destroy(&admaif->adma_isomgr->mutex);
 }
-EXPORT_SYMBOL(tegra_isomgr_adma_unregister);
 
 MODULE_AUTHOR("Mohan Kumar <mkumard@nvidia.com>");
 MODULE_DESCRIPTION("Tegra ADMA Bandwidth Request driver");
-- 
2.17.1

