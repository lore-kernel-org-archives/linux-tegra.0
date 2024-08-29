Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC03B18C923
	for <linux-tegra@vger.kernel.org>; Thu, 29 Aug 2024 13:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724939007; cv=fail; b=hQoPbr02TcfGtQRnq2T3wnVaDNnrfVXaD1XPu8DvOdkFagmiLd3LgJ6wQEXge1d6G1uu2ytMohI7TEyurcxalIRlGP/9eV1ipKRqb21iD0iaPpZR4EVazb2Ggi49Ski5XFOUcfEZyyV2kzl3i5WkknCmuQT9Sq4eu9Na/HUwPrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724939007; c=relaxed/simple;
	bh=M1+nBuJ+NlovRYIAops2rr5QVljK6o1/T3Ya94JR4Kc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tGn8tU1OQoYyXWNDN4pUR6BSCT2xoR/W7gbDthnX6gl6QzP1xy72A7RgzkJm4G2VmDP/UBigNuPGLseH8SX6BTH3nomLEQC3oHf73L5Fd22c3ngJQ8PrUbrY+sUrBzRCA4CchU+uCqnLep2XidJcKgGxbjKF97N1PsjLpB+xUII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i0AvLksx; arc=fail smtp.client-ip=40.107.220.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i0AvLksx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAEEM4ElEfB9hF9Z5LrRBG9b7rzSQW3sgM06+Avv7fMWeaF8h8Q7j2uQGWEaRESNQl5i95lJD43eSTGGwibnFpVvCEkh9G7XTWd+3vW4b8vi+2QOsCqxmF0uIWHsIkQUvB16hEZQYmFsWMmiK8+lFe0UX5Puox52x2Ul2v5/VFTQMP6UwwYGwdCWPJrAPRZGZ7gOukQ0Ea1+uac0lMScCP12GXL/mxCsGpmI/6g/2F/yVpaoN501ieif8rtdzYs1alZddikEK5NMZIk0isJIi5J2DGijDbgaViJguVV7Aksh1R8PoB/OHvxKBcljcuga85FvOW6kxgOTU8eQ4RJG4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzuugLmsPCOBGlxt+WCKnmg7wnYemc2zQhFRNP9/Jis=;
 b=plANo330vD4rtm5Nph8TB871/rA6L+Qwj+hv1cCt4isxvWNlqhUtOtcwSP+d7xlCFH8/8G+D8R6l8Pj24iK0AgZnJL5eCk5mfn5m+hDt23pNi/RLS2g/rmQrII1P1P22uBmCUZUl0VSbVU0TBuKntydRGvn5hKz+iVqfW6lelJPvW60wNmYZwOz6KKrkueo9viQ0vUDshEw5da6ioHT4eiLy6c6n1+6/F/RZzDilAfPwM1tpNEXS3QTLPTiEOME8w0xbHmI2mOKMB41NnE6W4CLbjgUVhdNr2vhXc3Fyfnh1qVXrBV2EWD76NwOZ0wX9rMoqzlr9vHOaYKG8h+BHZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzuugLmsPCOBGlxt+WCKnmg7wnYemc2zQhFRNP9/Jis=;
 b=i0AvLksxqw0+yE5ytc5drItxLbn5PgJquzDx3R8zhwG8wx2wgHBY1jtayal1lyIP7t9mWsyEhCopqkBrALK6CHSjuoJ+238HDrslLumHTayuDKarQh8VqpqTZZKke+GafLsoKwSPJT2kEKwaIu/pRrGRLxRbyEPOHxhqZgIGnQh2BFSBzPPzaRFd7w8cEiv4N3usGcRQcsgiCUZrpJx/CFxE6RLxk9rzXKhwjYXe0pkK2VyehPKIq+8oCBqPh7S90aofVomdMZGW4HQHSnLg+JLK7tXwdI8FifF2oGQVw6jSccUyNcC/EZy795zZOiOv7a7sWtMRCY7ZkqGzsxPAIw==
Received: from BN0PR04CA0146.namprd04.prod.outlook.com (2603:10b6:408:ed::31)
 by CH0PR12MB8486.namprd12.prod.outlook.com (2603:10b6:610:18a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Thu, 29 Aug
 2024 13:43:22 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:ed:cafe::76) by BN0PR04CA0146.outlook.office365.com
 (2603:10b6:408:ed::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20 via Frontend
 Transport; Thu, 29 Aug 2024 13:43:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 13:43:22 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 29 Aug
 2024 06:43:07 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 29 Aug
 2024 06:43:07 -0700
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 29 Aug 2024 06:43:05 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <treding@nvidia.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	"Jon Hunter" <jonathanh@nvidia.com>
Subject: [PATCH] arm64: defconfig: Enable Tegra194 PCIe Endpoint
Date: Thu, 29 Aug 2024 14:42:52 +0100
Message-ID: <20240829134252.49661-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|CH0PR12MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: 59bf99f6-9c90-4bf9-88b7-08dcc8308c90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vaEl7b7x9AqXBI6IctT7QJSuyHZXvTxeZbOk0E1ieP9fDmEnJra+w1iAA9IZ?=
 =?us-ascii?Q?ilzA0bIb/l87dZ5PARTEO+2WIpmyg05Q/EAaEjcjODI0mZJjDCQdwNuJ6TXp?=
 =?us-ascii?Q?0QM4xEv684ZvTZqyg4vO/tJHEK+9jiqgaYGs22hC9p/yLuvY60ySvvxlFsQS?=
 =?us-ascii?Q?w4nkvS3pfahfqzEaYdkp/rZsuBMLI52Gz89wj8GfJFk0++mITs1GIpntkBYQ?=
 =?us-ascii?Q?5Px3pKUc1r6vMI0BQzHvKbgLymm+5Oa1kv9tm1YaFKxqmgZoUrxYk3mtsUBV?=
 =?us-ascii?Q?nOcnoBTYycm5FoxW45qCG56idkvzJA/N3CPZe+jH01oh4rAFrFzUE4V44jSz?=
 =?us-ascii?Q?0EPU+Mw3dk+Ikr5sQh5XAOh5nk6Frbni4wB7DFdymaMtJa/NQVtx+zKv19rY?=
 =?us-ascii?Q?8DnZ80y+q+qGfNnpY4LJhEf5eDsv599Y5T3ZWNzjKsMGvkw41zEFEOzhyBsT?=
 =?us-ascii?Q?RPqusz2PZEQ1nlpX+d3SEUciKU0odXKiIqbmRpQ+vv4Mfja6qmWv69LgfJ6R?=
 =?us-ascii?Q?/ATbIvGRWowagJ80fA12jFA4PlkZeqpDezPayOfKNoGzwQ4NdSzwKoOVUFuC?=
 =?us-ascii?Q?juHD5wpg2Byr97yj6xEUvENzf9EOdMv5f+H/9c5+R6jV/yvs3kpzmKi8aMGH?=
 =?us-ascii?Q?ClnjRrWNGhtQBZlRPQDOt+x45/LOJuZIFaYmm63emQJlFRYDXNKXKVnHwMzu?=
 =?us-ascii?Q?mJIKGYkjQFbafQRirbj4wJZlM8vq0IVy0/p1xxvxfc4kMxVgxGgg0vyuHJJd?=
 =?us-ascii?Q?LCuh9r5P8bNwYZUILOQBy8ReOwObU+jrx2pJpeVP72BpiC1DmfpFDz3cReST?=
 =?us-ascii?Q?SfZVJgptiBoPr99Sau/sdFOalq5lSjr8wK+mCKJo4eP3FYZoVFrMsNh0EgNd?=
 =?us-ascii?Q?bl7qdV59DX97WWdmTemRT7aYiMw9kWp2B4PM5xxds4kRcvEdQIW3EfZv07i6?=
 =?us-ascii?Q?bO75NTI1sN6oakqeG/xdKevTlGlN4uusX91TtrknAUEGlrNNhQ9p4WimcVOT?=
 =?us-ascii?Q?e5bJ9r8TQCBUz2j09PQzH76pE3TuIzSx+8HGUhICFGiQHgyUvBE28Mmemvjp?=
 =?us-ascii?Q?L9Mj1tODRisk9EOG5eVCw7g1M3MDFV860h3+6bcaA++FYhRAYqczjlJcFqDW?=
 =?us-ascii?Q?lHZ15UrABNJmTS0sn05SBStnubcGl7Y40FBbHnQPQpR6nhNCIqApxF7Kyz63?=
 =?us-ascii?Q?j7O7CyMybU3TPdV4YVOq6igntKWI7mKi2QTyc3Vy/RhTYqQWPn0HmYYa6EFs?=
 =?us-ascii?Q?UD474Og9/lBMXnW2wH270CBlmNFEOnZszbfWggpty4DDCHH9EtgnlxpOE4/j?=
 =?us-ascii?Q?cmummGgx5Wk9DUSyqlGO2Nwz6btAIGtr1IPeiKNrO0bvwB5t+IYVEJV0GIXk?=
 =?us-ascii?Q?BgBvN7xxLgTWKWowdYxVADMGOC8c1L7MdHShYDKCO5d50Qgnz/JZtPSQxJdc?=
 =?us-ascii?Q?EwWQe9F5SWBjlTPBY5kXbdd5jPwBxnWt?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 13:43:22.0005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59bf99f6-9c90-4bf9-88b7-08dcc8308c90
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8486

Build the Tegra194 PCIe Endpoint driver as a module by default for
ARM64.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 967738a65805..1e65d6c0fbdc 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -232,6 +232,7 @@ CONFIG_PCIE_KIRIN=y
 CONFIG_PCIE_HISI_STB=y
 CONFIG_PCIE_ARMADA_8K=y
 CONFIG_PCIE_TEGRA194_HOST=m
+CONFIG_PCIE_TEGRA194_EP=m
 CONFIG_PCIE_QCOM=y
 CONFIG_PCIE_RCAR_GEN4_HOST=m
 CONFIG_PCIE_RCAR_GEN4_EP=m
-- 
2.34.1

