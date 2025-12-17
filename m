Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011051.outbound.protection.outlook.com [40.107.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDE730DEDD;
	Wed, 17 Dec 2025 14:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765981341; cv=fail; b=rfv7Oj7A3PewqqSD9H2AWk2yu+AWF8Fc0wGEk7kukFPr4Nz8xK7dqF7SASXb9z5ql46VEseJ/hsHeP+MqLffsTjTHX/Z/XAe77qJQ18IQdsdSWab9x7D2s9ddqQshvbc3RhJmF2ucf2YToZEKCp98IhvXly2/AK45Ni4uuuZOSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765981341; c=relaxed/simple;
	bh=W8WfvtsfaVTWFrS/M+cYg8ZD6jQ7vcuMuaOU2kv7QXs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gBS846xyZRchHOp8QqX1xZpDUsXOUzlyqRRLSodEyrVUTvas3eNp/Jrdc/YXmS6FfMDT47h4QBwc0wAdbSyKSVSiinRJAPosIIP4v7H4BwUJTPMTBGsH8sl3+BcpPhCGSrFhYvOIsXO19EmpU1LQdcFsgJ8bimeBSBMRNUGKd/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lavulXAg; arc=fail smtp.client-ip=40.107.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lavulXAg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wlk3oh+PeOopCRmEy5xXT1X+Afiet/DeIFlPhImq6i6uBO8LG9dxjWuwdqYH212f6bGXqiV7NQIxWXnBn15tDY/ynStGI8n/E01urNRpO0UstNJQCOY69OGVJEud2TR9UyQBaS1R5HK5wk47s4lmsKHHND3C/SAe1WWdSDKy13JnwQlXKaKYSeG/6SkzccFYvJqOFRzuLRF4MllGK5gGfcTPubJ37umQtjjn7FD8dbai9TbmigZ4/2hWPu7rlyU7WNx2l2JDqL0BgZplia4uQaDrdf7WATbY7RcBkExwp/vUFl9Mj+8+tDXUhmkZk91TvSWQVH+NkAt9N1n95R5IaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9rq47q0+agoRnLbslKqAupkQGiU8MLacFAGR5ft9ik=;
 b=xC0+/rRlI0BwCHBMDB0Vox7LDPtWqKzQAq0wwbbDIyQZYTPcvPQqbcuw9Job0VMiMRZWevGNF4ZtVAEORInc3CtErjBVZUBcMxFDcwmfQLmzyQjzNhcNOTrp12lSfn+sGKdnnlg9yjndCyCKvJwWpNBIWINNj3cvs+SFeR6lKfkQnB9ndWIIzgb4Ww+hkcWFcwxYN3yuFb6oICmAUZjbrxKYG53+AvS7Ey7JOjXRGi+j7/OUSSlqWjc4r+f9LzxgAiWt4U0gRp5PD/K1EmACjCYxbhl5YwXuN4C1cPwttAd6IBCEJ/68QDAzPKlgYjogKOT+HqvfjQt+CFH+2cHzrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9rq47q0+agoRnLbslKqAupkQGiU8MLacFAGR5ft9ik=;
 b=lavulXAgTxKqMW+5cfHwztk5NP4aiwXvATZaHJxt2sS7e8qwwnvtCKxO8pSy42E19w1mZLt8kMWn65OOTaF8mBqi+n9znxubmZC/3uEDYz1C9TVGOIz7Nn8Wxt/a6pTYBnAdV5ZzvW1l1q3R1HCKzO33ipgwwscE1Ua0gN+9Mc7lY48jkR9WTm4KW0CbCNFDITkR0euJYZa9A8uqoeTukRbhbnNTnXcQudMn09sgcr2mAmd5iJpT16o79aMSo5lwOuG0Sy6t3/VmMdE/qY/tAbu5uIT0nSCNL3bViVNDEMVmHcYYsyi2Q/XfdPpkX1D9odzLoL6pkER+jpsPMamcEg==
Received: from PH7PR17CA0047.namprd17.prod.outlook.com (2603:10b6:510:323::29)
 by DS4PR12MB9612.namprd12.prod.outlook.com (2603:10b6:8:278::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 10:48:01 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:510:323:cafe::41) by PH7PR17CA0047.outlook.office365.com
 (2603:10b6:510:323::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Wed,
 17 Dec 2025 10:48:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Wed, 17 Dec 2025 10:48:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 02:47:49 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 02:47:49 -0800
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Wed, 17
 Dec 2025 02:47:47 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, Aaron Kling <webgeek1234@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
Subject: [PATCH] Revert "arm64: tegra: Add interconnect properties for Tegra210"
Date: Wed, 17 Dec 2025 10:47:44 +0000
Message-ID: <20251217104744.184153-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|DS4PR12MB9612:EE_
X-MS-Office365-Filtering-Correlation-Id: 238a7b46-173d-4504-526e-08de3d59bf5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EdxZqRNprXkt98M3vKDE3Yu0/vTuHfMALITh0ZyKa45OeOAbTtzsMsG56II/?=
 =?us-ascii?Q?O8z9xppnLY33dhply4zgND0Mae9V0XvzUILvQQpyyJS8pO94ZIYfXFeSJhdd?=
 =?us-ascii?Q?uNg9JVT7wCJ+TdXAYDSmvWhz5gC3BV7WIPAYYMWW5Ael2e94ACAL6ekfG7b2?=
 =?us-ascii?Q?J+cV1DV1MgZvYKURt1iFZF8YpTzVHFtapAeVYKQmgBJDQHVBjkxRhfhdSlu2?=
 =?us-ascii?Q?o2Jkg44rov/mfKPuHnsf+8U8e2wBlrRlRQ/68lLspJYcr58WEIbnHOlUnXfl?=
 =?us-ascii?Q?iRNwGRlSzRxgZIbqsHBAuL4WI7zmNSshAJ7AZ7NNH6dpK5KBVnOJm4iH3JKj?=
 =?us-ascii?Q?GQRWo7VxEG8GlSRtnSYAbVsoNaknlUvn8BISVyXIVHFO3BTWLOsSZS15Q02v?=
 =?us-ascii?Q?WTJv6y1/A0hr/gUNcOUytfgMISUgMvZ2CFFhpU4FJOa6RtQKlFGnfhnk6ONZ?=
 =?us-ascii?Q?E8FvWh77Wi12V3XioMEaBRYD9L2veHF159t/u9SU+0aWSTnqfMpT7lk5y/jc?=
 =?us-ascii?Q?CUL74q9wTxrA5kaQEsMEizj0yiRqfyqtEGiatDprcRzhDLH47Yl34Fdpwd1i?=
 =?us-ascii?Q?hNUU5arMeO1x4EaL9UgI1uxdVJvGTAlChEGO3EKqVb4lFL0n0874gbZgCT2l?=
 =?us-ascii?Q?/yfgXrsBeT/I+Q66DE5zhCLTFCWE+vcgMnlktgrX0RipTCp3GCUvXLTY79IW?=
 =?us-ascii?Q?5ndH3hCp0sGboDS4fW+6jKzvz4EvrlXuE2pTDelZXOHepXey2gGvL9Ai2oLD?=
 =?us-ascii?Q?RB0JENmlYDkpOFBacRNUDUQfvDn8rewbvrUU+C6++2+p4061I8PRExiamkUV?=
 =?us-ascii?Q?jdH4ZCfdRGfxnJ3oKL/j3DIjJcuTBgM5r/oR9cYS7vDrjgmnMRAxO97rliQF?=
 =?us-ascii?Q?asHwQ+iLv8frreBnykZGt7rL2gmoQohJfnJlizES6PojRz18cclI8nhm6512?=
 =?us-ascii?Q?fbbC48hJz1s/7mwdHXiRfpCzvSoS8a7wwb32IIBRcDQepEivS75VfNrUKHnk?=
 =?us-ascii?Q?KYhBnbwfbZD7TEwxqN2oFLsmhtyE/3QuHyj7KItMxc0WnhF9vN9MFxy0HaPI?=
 =?us-ascii?Q?sXIj7Q3T1SXVhvibs4TFQFNj6NuA5OY0UzxGhmuIH/P4OfllRMIThpE0obmD?=
 =?us-ascii?Q?AwKQCIauGEs4u2pOzj2akEAt3VJdI3KqhSbobpJ3Y+nnEWw88oI1iwMhfk9C?=
 =?us-ascii?Q?pqOPjcrlTnol3J3znxCtBMC9BXFiv7oTqOV8H6cX3roNHenS298nn38OFJi1?=
 =?us-ascii?Q?bx5eLfU4Be5nH3Rb0UU2bW+iMuNZ6AiJ2ObEm8zqxul25tgWriWUSVRe/qmy?=
 =?us-ascii?Q?Gt+noTO69ysDl5FqzRJ8P1lLYfquozoEs9zvVx/2RFmFN1DBmsKe6DX7xsFW?=
 =?us-ascii?Q?14Sy4kI4m1eGKYkPUkf5N5S7Dr6LBLxA2fF0qavgA+9Z7muqEB204eYHs0YT?=
 =?us-ascii?Q?3VaFy/Fu76F871fgbcv+gtscPL7YTEU9wGG0WFcMPT17ngoxc/ZsjW6RerFq?=
 =?us-ascii?Q?55aCgL9z/lzABRPHBVfFnKzypU2zGR9NYNeVokEO+gLB6Vpx4zZJjI9A3DoF?=
 =?us-ascii?Q?bpjUdvl7s2LjMTJEXS4=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 10:48:00.3918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 238a7b46-173d-4504-526e-08de3d59bf5f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9612

Commit 59a42707a094 ("arm64: tegra: Add interconnect properties for
Tegra210") populated interconnect properties for Tegra210 and this is
preventing the Tegra DRM driver from probing successfully. The following
error is observed on boot ...

 drm drm: failed to initialize 54240000.dc: -517

For now revert this change, until a fix is available.

Fixes: 59a42707a094 ("arm64: tegra: Add interconnect properties for Tegra210")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 709da31d5785..137aa8375257 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -202,19 +202,6 @@ dc@54200000 {
 
 			nvidia,outputs = <&dsia &dsib &sor0 &sor1>;
 			nvidia,head = <0>;
-
-			interconnects = <&mc TEGRA210_MC_DISPLAY0A &emc>,
-					<&mc TEGRA210_MC_DISPLAY0B &emc>,
-					<&mc TEGRA210_MC_DISPLAY0C &emc>,
-					<&mc TEGRA210_MC_DISPLAYHC &emc>,
-					<&mc TEGRA210_MC_DISPLAYD &emc>,
-					<&mc TEGRA210_MC_DISPLAYT &emc>;
-			interconnect-names = "wina",
-					     "winb",
-					     "winc",
-					     "cursor",
-					     "wind",
-					     "wint";
 		};
 
 		dc@54240000 {
@@ -230,15 +217,6 @@ dc@54240000 {
 
 			nvidia,outputs = <&dsia &dsib &sor0 &sor1>;
 			nvidia,head = <1>;
-
-			interconnects = <&mc TEGRA210_MC_DISPLAY0AB &emc>,
-					<&mc TEGRA210_MC_DISPLAY0BB &emc>,
-					<&mc TEGRA210_MC_DISPLAY0CB &emc>,
-					<&mc TEGRA210_MC_DISPLAYHCB &emc>;
-			interconnect-names = "wina",
-					     "winb",
-					     "winc",
-					     "cursor";
 		};
 
 		dsia: dsi@54300000 {
@@ -1052,7 +1030,6 @@ mc: memory-controller@70019000 {
 
 		#iommu-cells = <1>;
 		#reset-cells = <1>;
-		#interconnect-cells = <1>;
 	};
 
 	emc: external-memory-controller@7001b000 {
@@ -1066,7 +1043,6 @@ emc: external-memory-controller@7001b000 {
 		nvidia,memory-controller = <&mc>;
 		operating-points-v2 = <&emc_icc_dvfs_opp_table>;
 
-		#interconnect-cells = <0>;
 		#cooling-cells = <2>;
 	};
 
-- 
2.43.0

