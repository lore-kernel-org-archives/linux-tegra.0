Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010058.outbound.protection.outlook.com [52.101.61.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C546423A78;
	Tue, 16 Jun 2026 09:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603802; cv=fail; b=M5ARL1Wgxv9k+UVc9Q8qZcXeN8IgCTwjKB5mj9dfhRNgy7vLYS1L8CrLo/CnbCSqa8ggc9rt4uOZI/PSuUomEVvthPFqxs+me296Wby8bODF4eB7pKIYhlC+Iv0Z0w/oAXVmdlenPWhQZbYEsojUKF3+rnx47nIBHno/BAN0pCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603802; c=relaxed/simple;
	bh=mPsG9vfAjeoKh6l+g79FzvRq8qEUUPRoYbr3jhxyRBY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TT/4NpEsJsnHYWrM3l9m15IJ20Uae4qtxTSIMsY5QnYCuZAdVv23Kwkt/RycjbzzAObcsXkQz2aYQrW6JvfrWb1Vankxad0tO8VgOm6bvK9kGqkbQpUitDUjJRNjeKmdjRt1e77qjNynL5Eyk77uxj59vziDi9r8FETBXkAe6N8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Na5Ez5Q3; arc=fail smtp.client-ip=52.101.61.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Na5Ez5Q3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WUceq3/cRk4uT97jbOSLs/aofeTOmHWgMF6wSHkJpFh6Hvy/sPgxk/YMQGXyisQQTH9L1NFn2KOXQBUXGNYt563bGAuBNAouAgDnbtOsxcYSNBk25sdzL8Wl+iRleCAL6LPjt2uZjb/etZVtNriG2x+G8oHLXGzajQyWpGauImuJGqcrGArClZtdj5iiiF4t2jRh6J4yopB/bVTxbE++yMHex0BbGH/rpdfxWoMZ8GmoUa/9A3Tdq9C7LMRQfPp3zcK41sIZjZgbOYsW4uioogETkqiZ/CIj69H0fZr7Yv8JQ0tf/W3b5aiUdYfEEVWiwIBdaV4d0TcvOUhzTsl5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwdL+5rTtteKzyafBTz4PX4XNhgBn7ui2Mr+aUQzgWc=;
 b=WtqsNI3gzmEifLkMMgoS3QT1kwIttBNT2g13EbQo7DwFGnKqdG7fzGIfAvMTIOytMg0oFp0dxK/DHi5BOOXhG0AIuOEb2nq99I82kdu34RRsfl1Vc2YgDyik/wxj9YWe/iLM90G77xV6KXGlFtwb415Uden9WFa5TKxMTgrsvYoYVp788xvPutcbP/yyRz+GvX1MaSQL14sn+UkbtAVFpkhKMQTjBINtIuhuqWcX82HynJd8rqpoeNJSnEpQUlYbqYgEPOxzHXThr+763UnFY6hORfGNer5/6r00eilOIOM6eQxoIUE9GGKe9eeMGEeo/UXEMYe3zr0Mr2SgTkStug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwdL+5rTtteKzyafBTz4PX4XNhgBn7ui2Mr+aUQzgWc=;
 b=Na5Ez5Q3UGO31Qf33+vEGcOlOk9+LJVX2S3sR/0lx268bRHSIH/cY4Wevvh2RvY0H48SWc1Bmn0id3KN0aADiVZ57kkFyBUveL5jxxZIU3sAxv5XRSw9mhWqqomwXqNqFmF0p2v5tvHSKBbuGb9vlcrm+7AHc214K1NhVWLspXIHZ15YGc161A/U0v3X8IgWEJLdyQT3E+MITm3alR9U+Pj2Hlj6e/OAMpPTX4jrFsYbXYL7pCp6tlyDC6ApHNsADA5vNGe5AXeKO10SsbSLEwtvaWpFaiN6GG9l/e7HjeNOHa8EobOwZqWQzN/X6AaRK3UH5zxdjM6ZSHajULXd0w==
Received: from SN7PR04CA0118.namprd04.prod.outlook.com (2603:10b6:806:122::33)
 by CY3PR12MB9631.namprd12.prod.outlook.com (2603:10b6:930:ff::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Tue, 16 Jun
 2026 09:56:32 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:122:cafe::72) by SN7PR04CA0118.outlook.office365.com
 (2603:10b6:806:122::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 09:56:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 09:56:31 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Jun
 2026 02:56:23 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 16 Jun 2026 02:56:23 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 16 Jun 2026 02:56:18 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>, Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Akhil R
	<akhilrajeev@nvidia.com>
Subject: [PATCH v4 07/12] i3c: dw-i3c-master: Add SETAASA as supported CCC
Date: Tue, 16 Jun 2026 09:54:21 +0000
Message-ID: <20260616095429.3947205-8-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|CY3PR12MB9631:EE_
X-MS-Office365-Filtering-Correlation-Id: 454d0894-197f-4eb7-5aa0-08decb8d8b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|23010399003|1800799024|56012099006|3023799007|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eOPBw8OVXD3ny+5Ng5jEgdNYx9guv/RXaHtTOSsdaWf0hVD836GyJXNDwISUnCX3LwHs6c7xuo0fT7HEwXAtAyYTMr4dDcsUCzn9HFJYHR8B8lI7HEwNqQQhpELmcH/8jePxMpCgr7TiL62DPjAHROAh5JJZXDBOMmPYcwfIG++xFPQNclHZRFqf6+uwhfESaKKxPuaQtSzBmuC/dx083LA4nnM0+yPhJuilryH/o7eszS6+EgF90Z/p685FFakTKZyONQKe5PZi/DnJsp+Ig0e2g2/NdFp4C2hiBHIX5VhIPfgXAu1l5l20AT7XWtF+k1+6O76zxVqYPbDB1vfZmoGeepEedZ4jVZ+b9U/IlA3G3VPW57Kmhoo8se+ybqvB6SfGRFoleIa4XMV7SR3/Ko1ksxUXXXJD2th4SBI6/XPfGV2UH8nEUFVA6iFf/bxIiuaZRKr5B+b+/JymsooChlGXKkbIm/E3ZS0ho2rmMnF9thinVRWU4fQiki0U+vfrgpKryaXcu8iDhm4Z/eX0ZqOtF/kJV307NC5ursG+Kyg0CIUzKN9wrukRXr5u/6rnA8OiWqKAOj8pKomRiOHiOUF/4OR6/l8OzfhfomhVFa4jDnSfPBFT1X/JIGyJbIqDbsV9G9+iLcjFpMHjsCySmdziNRMTh4RhZj4BJoo+/nnmJiZaclkHFwbZYjw6J1bnwWVIx76hQSkjglgQ/BDWOD32diuTMi5VJt+A+R32EYg=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(23010399003)(1800799024)(56012099006)(3023799007)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IMgB2WhfkjuFhcszPtSBHBDraS1d2U5HL+vbKV5B9z/wotbzzmz2YGs8aWLNvCsEJXaFy1KIa5aUuKas7bFmRVSukIxyVrlfMrDuWy3ZWHDBbdCZf/lRRLmIEbvWFiQ+XTyaGIsQtGzYC+8edUtFtP5v366Mj+WczGWrL/PG3oGfzY0haclc9UMELD/rzcaZY0aO+UIxEIx7qdvghE2Fdgwx3pHyxk2wBGvFmBPt11tJEBfp7WOHPEuiWxbEllv8IGWDILlmn1K5s0VaMbbfFnxsn9ou0dw2cecK9v7WFMtd/VFq5aYW1yQb10FeGIEMan2EjDPEd1XExwPW1LA66Uw4sglHCfJ2hMdCbaqclQqcxgL8BPYwME0stIdEa6Rp58Kz/MvFVn1udabQNp1CaSUDfu6ZCckV2bn5RqDWdpngB++nyJMVWBbEV4nwUYxB
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 09:56:31.5026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 454d0894-197f-4eb7-5aa0-08decb8d8b04
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9631

Add SETAASA and SETHID to the supported list of CCC commands for
DesignWare I3C host controller.

SETAASA is a broadcast command that assigns predefined static addresses
to all I3C devices on the bus.

SETHID is to stop HID bit flipping by the SPD Hub to which the SPD devices
are connected. It is a prerequisite command to be sent before SETAASA as
recommended by JESD300-5 and JESD403 sideband bus specifications.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master/dw-i3c-master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 971b429b76bc..3e510fddf06c 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -309,6 +309,8 @@ static bool dw_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
 	case I3C_CCC_GETSTATUS:
 	case I3C_CCC_GETMXDS:
 	case I3C_CCC_GETHDRCAP:
+	case I3C_CCC_SETAASA:
+	case I3C_CCC_VENDOR(0, true): /* SETHID */
 		return true;
 	default:
 		return false;
-- 
2.43.0

