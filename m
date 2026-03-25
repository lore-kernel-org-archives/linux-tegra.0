Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010012.outbound.protection.outlook.com [52.101.61.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD5C350A33
	for <linux-tegra@vger.kernel.org>; Wed, 25 Mar 2026 19:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466815; cv=fail; b=OH5dtQr0rrJdka8Thpcb+EkQ5vpKc/OmkfuPxWG+cLXTp656gWEo1BZsifCm30Z4a/thFyYKSaFs1vpVMajoyPLifqK92e/QcUsE3EyLXNJQ9G/etIg1B/LgRU7CSm93qCFgYTENWh7RAuEw4996bOW8+Ebcu32oeLdf2Dvqfxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466815; c=relaxed/simple;
	bh=Guv8UMTinJqTw+Wg+GW5o2AB+OhBIGCHMMGO7OwTKyQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o7E1eawky/t66dVHv6cCIMLor+tmYuXG/zJP0Q+L6yL+SyHgqm30G1uQv6Gnlu5xrjvhEELq67bbQ+lg1FL2s/uRJQTVjtIFmATtS2ozVYKPyub5uMQdDD2xTBSbW91AeHo+3MELCdSh07JYy/E8l96qeF5DVF5CiNITdvjuvEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n8CrJDYK; arc=fail smtp.client-ip=52.101.61.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n8CrJDYK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6aZmSNKsDgm2UZ3MNGEEmsfDfR018x8cBwtk+OJGwnSjr/ryPwWhrVftN3iIaOsL7eU1q01qbmIoLufdc06UB5fdE/kKmv6NGIBgO/7bbe9a5iXATBVULuA2KRxL6T36DEKSCFS8W+P6H2hSxtrLnmDvmvUGr7BefYME7FGxD3WcUQarbrh6IiiWrkQBBXBtTnlrTaOJQfQlfzT4ubbXS17AUf1MAB2GLb4AFndP2zqrBsHDfpD/TpDVwwkxXROolXqDXZhvxXOxf2W96Dq0T9WnIjBsPCmCd6Le2P5lcRoyQpFyXPrlfCgbZ6uHORi2lTHKtNLhOqRvyhIh3XkHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCv0sERC01iWoRLDyzsz7G4Lwy1is5kZR8GlXyZUvs8=;
 b=KNR0FHRUAIH6tDouW6M0lR5258yrE7vSRY/LbMUyM+Hvar/MWcJtVl102/UoVpkOFP7Sgizts7bp0fdHZMUQUILEgHfRhPgR3/nt5gnV2XN60FBAhs5QoxGP8e+Tv9oAegPhTDxVD2wpRCTY4M8F/V3S3/irFkaTnk7nZ3fUt2O2hLiYbcTXYIXEFF5ws3crlUwJvE/JkDKJv2Prg/91Z6Fv+v4cQE/oObPy14jTSi+oIEMkr85cYX4gVOZa97XfB0Ylc4ZrKhIbPiWyH1SiVCxZYKNvHW30+DciwhPUS0Fb2cD0O2d+IKUZAD/WJxbnfpu5mOy/IHII1/OXvzLjKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCv0sERC01iWoRLDyzsz7G4Lwy1is5kZR8GlXyZUvs8=;
 b=n8CrJDYKlSwnfh6U8xSjqLAs1BK1QhBfxmpqIgf54zbuPQfFpYn6Ksd0udwTn0WGkgY5YeqCX2WoD+ZLrTAsFtf987ZD20UggHkDnuY4dG/zLfyrDw5zKK4+fOuN3imshfWBfREpgMAK6KM0eWn6AmVpgtoco2ZDC9EA+2fdO+Ji2KqJQaNoOFpaSLcwkwnFYTkMhg1JwrPiEPN53JO3R5kNnkFYJTjH/88Txf7DPeP3SA5yaYI3R+X1pel0K0T1AVAGK07VwNSeVNTQ0LlqGUzihEZwFh6uF7CWC0nsogzaWhqG+h2r5gLDEVquiYMN0dFtEQ84dQnrvF1m10o10A==
Received: from MN2PR12CA0022.namprd12.prod.outlook.com (2603:10b6:208:a8::35)
 by SJ2PR12MB8036.namprd12.prod.outlook.com (2603:10b6:a03:4c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 19:26:49 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:208:a8:cafe::b6) by MN2PR12CA0022.outlook.office365.com
 (2603:10b6:208:a8::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 19:26:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 19:26:48 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 12:26:30 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 12:26:29 -0700
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 12:26:28 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 06/10] soc/tegra: pmc: Add AOWAKE regs for Tegra264
Date: Wed, 25 Mar 2026 19:25:56 +0000
Message-ID: <20260325192601.239554-7-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325192601.239554-1-jonathanh@nvidia.com>
References: <20260325192601.239554-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|SJ2PR12MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: 554b1c81-9649-42f0-fc43-08de8aa47586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	udTByI/RMd37A7hztEiscuqf+GFQJ5tk3dE0UqKoJkyy+aeOuAfv33AhnPhx982lzIpHCs9s70VZ5XXvGATLbFjX3jSvveAl0xtMprrUy1wIM+QZzp5KBTDN6i2rJ4HwDZpPuHRI+DArR0r/o69s3aeEaF6QQ2+S5G+1W80JOX6O4U7Kwse3rpDfQ0I+cl7nOB6k2fpIK5VaNDrkvXfztrQ7LT4zc6i2bQpF7F7kjThhr1DeYJD81cPQKfgkz/pNnFC6YaJZPdaUyg7Ui2KLrpQ7SjGW1YKu3mtaPfI5BFqZTZh144lOgkeVs4l0DyZRFQnrArXxCYVq3joLj1u4ljaEojMMvP3Cn1hxDGY6vJ7R003fAhWmSL7YXUe8ULYEnPRfYw9WmUxOGwltJv+587nGksZ61zvaxeJOgtBCZNbr9zEeAS9KwVO9QCqQJU9Ko5g+hxjfKUn6SiRB7viupOWN2Hy+RgNcYTtpew0UmK0ZaXN2BV38h1wXPHO1gWTDNt/+IA5sEon4y08ZYgpcg2uS0I7F2Pw2dkxISMGx/6qDIbZD9ZrJCwVGh8VXsncbZYuZShibAnpgjJCYXwSrZFKRm2+U6CRqaZ+p4t6qwMQkZ4G1wE2lpBDlDyLfOC9KG/jKVGfsArC63+GhqBjHSN8UCODKkDbq0D0aMzpiebz9NN3fRSzC9eQIY8uGrOeJqezBVy5HSFY6Ybau0y5jIe7/pSQeq81nq74O1JnommnYAqCS3eviccVHkFU+4E2gOGIvFGN39AVSddqK57rhdg==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x1lVGCDOd1hxBUXB+nw5MkQ8oT436M159yyj7cOsPBeAdY22asmWht38pRB0Xu2G38iquwiLhD1RaQ4ZK0//6O4jP6BhHuUPkG6a3uror/9WO4kApVTUOKejj5uVqn6n8HnI0//x2ZBxmn1lybxrXbqQpJa/0+7xIzqkBvJzhQN5w7ADxXCpRGlxJZNnKaj2uxsrvPgfMksEeoQek/A/Z+In2szhHAYCybtG+5MnSgYGlqJXZj4yp9s4Dz2BF9hPot6+fhYm0vny0N+htxJNVW2ax5fusutAl7hwOCEdrzy2zuvW9veeXu+FlW7svbrFgfNF4yGFKoD/YkXzpOm6Q48G8zdUmEBnosjm2eZGyEVPtYtThFZS7HNcbJp2F7170bYhN/DxKtQovVPqfTYc7QOqLnuGqEoVGiXL8gLFTiwxudksbx4c0Orr4c73jYss
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 19:26:48.2419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 554b1c81-9649-42f0-fc43-08de8aa47586
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8036

Populate the AOWAKE register offsets for Tegra264.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 42176abb96ea..7a5262705d69 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -4538,6 +4538,14 @@ static const struct tegra_pmc_regs tegra264_pmc_regs = {
 	.rst_source_mask = 0x1fc,
 	.rst_level_shift = 0x0,
 	.rst_level_mask = 0x3,
+	.aowake_mask_w = 0x200,
+	.aowake_status_w = 0x410,
+	.aowake_status_r = 0x610,
+	.aowake_tier2_routing = 0x660,
+	.aowake_sw_status_w = 0x624,
+	.aowake_sw_status = 0x628,
+	.aowake_latch_sw = 0x620,
+	.aowake_ctrl = 0x68c,
 };
 
 static const char * const tegra264_reset_sources[] = {
-- 
2.43.0

