Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2067.outbound.protection.outlook.com [40.107.101.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B701762171;
	Fri,  6 Dec 2024 10:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733482355; cv=fail; b=Ct2XN9yJksv7kRHDw4F+xmW/DuQtnj6UMG1EFGheGL9TycnVkLtq6aIbnR9WBiTFem3KBrXAwLXlYKPAFsfHjzM92l1D9j47I9AeeAUd85aTOpvFPGdOoKDL7uWBMkgUYMAbIogEubqwfjWRciHNZhFZgx6MqAnZmYQQvWH/0qY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733482355; c=relaxed/simple;
	bh=gqf5WRpOch7G2NNtN1umSVwEVpI+e/coqPtlrsTLv3g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QF05YiroI/JR9HmKx+fm73N0LsuxNDmDm/Z4dwK5BgIX1xMN7zahI1ZRz0xZ7VP7+VFTbHQW/ptK0oMZb9Y4wIn52nFeklGVHhAcjU8ymd+e+dI025cdaIhUh6Mp0SgLImZJrGYMM1xTID3ZgeRwuy7E5GQC2zLt46HWvwyMoJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=E9UPiiBT; arc=fail smtp.client-ip=40.107.101.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="E9UPiiBT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BsKsCqzZvtEbAh9OGhbgjdNpkk/zqfH3unPydgPMLGghJMkbJjOaR6qCDxAINMy57cD2gbMPi08XoJwqDKzseEnbnjOhs3JqWlHOLPG9cqy0gQjLMkc94oHrVg/NQXw0/GsppgbaGN0ZnowL3lifQWc9lyUiSolA2Ys+Pmhf7m3DVvG1aoat9ge0jjUHGgsCccmHnIHehzXAWfoGM8nn7yNITABhB5OOlfj+FO/zr25pHf9RoZRfjjLePuUbhMHVUnusG4Vz4RUjOEzZxh5jIkaxmjKu3bqzk6tiUbhq+8jA0RGT3votgAaT3zwJMkbwYvPkEoQkjtxgcfmHnUabPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcIsrmyVBp4abxJJOZ8AMnGlKQFA0tKdsFF/e30f/XY=;
 b=ujX3yLjejkyFYFIstsH4cgvzpcM2UsU1wDfo/GdYiIFoh7uIJ5IQXie09Ce6cxgZ4MY/BE1fdGfdGIl3LdqChcXXQR+pp0wtaCvCVLVtBxvGKT2EBZ+ZM1QRtKkEsqVZAsIBtYhUrJhlSdEQgOTLNPeCJ7907b1/+v1aQIvMX0C0x+ZyeCbrqrkELAljhwKhpo0jObJwJKZK7WLQaD3btmRgC/Hh3QfAOzPOGp2FFqxAUO7o8nJqzLxv0SnoEFyAMwZdoz3f678SdbiXORU+vB+G5HqzLEJZpunAF/Lb+olZUrrgk+PJ5MrNmDFa/NY++Tnc09OAUZsazbNcFxPvQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcIsrmyVBp4abxJJOZ8AMnGlKQFA0tKdsFF/e30f/XY=;
 b=E9UPiiBT7mm4LtoCUiyIr9xdNpQdsNPY02k4Nw4jCBnkVcd+EbARMtoiz6/5cGInMx3lf5d8bKEBQRpUdVX6vR/O4Djug0FUyeBqIjoWZDw6mzLtnDyci87kQwaKlO33ao7Z4ELSzwg5StHIjFM/6h2sHQYC9fPoJd52nVweZoFOQcrFub6sEY/q96Li1HCAAXf+qld5SuZkRgRcpJY53KQScP6NDSvJjH4nj8ETfwo/cjmt1hSLC5NNiUEruUuFdGjK0Mpx5JYH3El2pFtzf+SP3EBNGoPfJtDAjbW2dgPnsKfgd72nJG7kR4UftVxxSd8yRe2UZ8zUCX3hkaxnUg==
Received: from BYAPR07CA0075.namprd07.prod.outlook.com (2603:10b6:a03:12b::16)
 by DM4PR12MB6447.namprd12.prod.outlook.com (2603:10b6:8:bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.16; Fri, 6 Dec
 2024 10:52:27 +0000
Received: from SJ1PEPF00002325.namprd03.prod.outlook.com
 (2603:10b6:a03:12b:cafe::c4) by BYAPR07CA0075.outlook.office365.com
 (2603:10b6:a03:12b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.10 via Frontend Transport; Fri,
 6 Dec 2024 10:52:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002325.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Fri, 6 Dec 2024 10:52:26 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 6 Dec 2024
 02:52:12 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 6 Dec 2024
 02:52:11 -0800
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 6 Dec 2024 02:52:09 -0800
From: Akhil R <akhilrajeev@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <thierry.reding@gmail.com>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH] arm64: tegra: Fix DMA ID for SPI2
Date: Fri, 6 Dec 2024 16:22:00 +0530
Message-ID: <20241206105201.53596-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.2
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002325:EE_|DM4PR12MB6447:EE_
X-MS-Office365-Filtering-Correlation-Id: e634a412-a41a-406c-472b-08dd15e412d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aAOG93+yR0Ha5q73Cy41wAsOlrU1FRCkwBoWYYKbVF/EAOIGZDjneq/J4KSP?=
 =?us-ascii?Q?ai86jQy40h/Y+G9E+xOWuZVdIYncmDmN8kq1nJ3W6KcYUXVULBZcxPuHHI3P?=
 =?us-ascii?Q?882DySzfxMTm3B9fb4wMu5eIUfn2fibLVwJyOVrLxzAF/KXt3CyPLc0Vvq4y?=
 =?us-ascii?Q?BtK+pXOEsrU+I0WMl0KTExpkpg1MlA1xzO1PN+ZgD/PSEwBMhOPBLmSZQ0Dw?=
 =?us-ascii?Q?THV55BM/Wt2kYXIZhQULPbaojlIQBHuEif2/UpBZPNvJl2hlkiBYDRjFvX6t?=
 =?us-ascii?Q?ThREYuTVleNOxDqe8CghJdBnA+C9LD1DFEFoRywD1WvVYLM5eRKYd2H8ED7I?=
 =?us-ascii?Q?XPDwgKhPBd6jBRGu7N1uuW46E+MZvZizE3hktZ7D7H7pw8JX0+f6AyMa2LnP?=
 =?us-ascii?Q?qSixBMOc97yqh4nni8wdoX//hSKmGPtMLl9n6HfbveGZ/84C+pP/gcvqTlSw?=
 =?us-ascii?Q?LAMLrdUE+XeMqvk8ChZFkLnKRqj+/9F/qtf7R594LwQ4xMeQW0VrQB0QfPzV?=
 =?us-ascii?Q?Xi9QSVZNYE1W1chDuwm3I7tmyBNgHLhIkdf6uegygbzbq0/MPTF84qdizoP1?=
 =?us-ascii?Q?fBBq1SHBnHtZCTsBIkAM4vzkUUmdk1Bckqh5lBB7zbYXkrm3/mLBtwphx6q+?=
 =?us-ascii?Q?dhEDYdvhIc8jtY7FvLc1e84vZV6hkfKNIeVW4TJlbJTxYUGPltd49Or/M8ZY?=
 =?us-ascii?Q?tTC/eW/U63f5XNp9lRwEPew40AWo+3Lc9QZae6TMjDrXgF20AuruQsSbvz/g?=
 =?us-ascii?Q?ptl77tVqVsdjmpEiCAfIDQkYzSrjUxlWasWxU8eHtKf6cLPcQ8O5VMkeZzMu?=
 =?us-ascii?Q?sZk/SWjKRnS2ZURTOGzdgd46NouE2nXL0CfLGUkZ+T5G88SY4+i7rH2I7wDq?=
 =?us-ascii?Q?KGVgBTxkwPqHHkJUMXmyON20sbO5p2s7mBAPd/SXTYTrkBfg/ivYUNVRXPpv?=
 =?us-ascii?Q?bnQqaZ7M2VQOSDEXyvk2TBlREaj8FlbcnNyBW4uull+Zjl1HPBYgh2dh0Dgr?=
 =?us-ascii?Q?oVRhHT+P//53aOOyZrcsERcSSFnkneLL/Q0mOKcu/D3LkBQ7aqi0yIzGTFAM?=
 =?us-ascii?Q?6A5ZhDjx7mnEjg4yAsIebWF6uVEvn7Z15UiacRgnIgXYEdPY+ubvBevsWxx2?=
 =?us-ascii?Q?fKl1XMb1YH3KmzzSt5l4a9E0RBynt27lp2r9Cz7p9hJwp6eQexjgCVevAAb+?=
 =?us-ascii?Q?RRH7YCCqP/Nq2x13fEyCDLV4W4DNfpQxTVFsxiwCOpTeJv0fJIskG1YPv/qV?=
 =?us-ascii?Q?l9F5t0UGClllcU6ya9OhQifcPI75uuLwIrUDHk5ZyVK6Fg8VwN11VsMqvK6/?=
 =?us-ascii?Q?dTtn4+5S4wnnv0Vew/2YJXwiyOyN5yNW/FXDuGyu6voQhqQYNop938jPmt6s?=
 =?us-ascii?Q?Jg3IZIjHMrgAL8yjvUt5/dz074dQiG2/pEQJy+5CJrIHYXR6ZsBVw5OMcQTG?=
 =?us-ascii?Q?pGzMTFU/vkV6aSjGYABa10wLNd2qJSSR?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 10:52:26.8532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e634a412-a41a-406c-472b-08dd15e412d0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002325.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6447

DMA ID for SPI2 is '16'. Update the incorrect value in the devicetree.

Fixes: bb9667d8187b ("arm64: tegra: Add SPI device tree nodes for Tegra234")
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 984c85eab41a..570331baa09e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -3900,7 +3900,7 @@ spi@c260000 {
 			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLP_OUT0>;
 			resets = <&bpmp TEGRA234_RESET_SPI2>;
 			reset-names = "spi";
-			dmas = <&gpcdma 19>, <&gpcdma 19>;
+			dmas = <&gpcdma 16>, <&gpcdma 16>;
 			dma-names = "rx", "tx";
 			dma-coherent;
 			status = "disabled";
-- 
2.43.2

