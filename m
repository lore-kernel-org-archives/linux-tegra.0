Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011050.outbound.protection.outlook.com [52.101.62.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF92C3EF65C;
	Tue, 19 May 2026 08:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180469; cv=fail; b=s/J3Ynli3jQ/aWT1mfLaP7KbDNvYe+WbSTZY9oTsRZdmr6PPpIP/qha+7OF40dKkNAjfsHn76+w28feg/VuLX3BltfG6/haBgP0U/S8htBzTCHssxvAR+rwFJDxCPpmymSzroz99H49QjXOkBXchMvocdDQAFPVFrzsVuBeDY1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180469; c=relaxed/simple;
	bh=vFDnV/jPmm+1rFr83lPBH43LN4q7jrOG+blKo5Jd0tc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CqGXWcnW3NLqkdk75aIEQbXek9j2oRbAy2p6i/66eU4GhsOF8FjQfJ9XI09KUsmcoWYgXO0W6NbpUUMgbL/CYwKGKjvmomGjR8jaUtPU3tlCr8/vIvqapa+ystrm7ThRx+fm5+W0DCqmf5l6/QT6LTRsQRKrd8EPupT0svQnSfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CzR1yNRC; arc=fail smtp.client-ip=52.101.62.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CzR1yNRC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U92FePNcQx9iQm6EnPMK1MYFITv4wJFDxE96jHneY1gss8FDK98fKr+VbcKNp+ISoFRA+BZOCVipK+XQq9B7Vz7mEcbckNi/LOg+2cWJiRRaBdE+Xpb7mgTkSvQcOJ6lIjON9e6XUqlGvOalLJMJID64M/8ZlHhtC2GOBOqgNcGdfpfmvEJbp2Z4xL4U7EtpDEo3SZQNrWBDAaCK7Dewn53mzmoSzHAASbrqh0sbZ+B5LTTh23P2lL7zJLt7pkXc7G1Tp/VAOt/KWFz+UFfmHovTffonEkGoY4GTPS4rJr3b5j6CCM2dhvH4WptCQ1fQc8yUPBeJ327Psb8IKCmsWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwVMwzUUN8LmscbdnS+jHzBY2S4EzHZC1mbeTyfl2yk=;
 b=YGYwY/OOV/uM9CaxkkpCHVlkEMKs/JPZ2uHxSp2gNN09bBRZqZhcYRiUoGExxDC4ZaXQzupRgcPe+2pLJUndqYOXYrcfNNaymgp2Xf2CyjjNACnIfYlCRJF/X1tUPRJfPg7XzAMeeSbjZJp7oNTqk35qW1+mN2emxHUHGVMWML63dAR1r0A18QYtf2KRAECGzlFUuId060xNvTNdMOUqUqecLiZVzeAI6Gy8anpblfPr2fhsmK8CTWQshh4v8A9H7R6FciF9N4MSEebGGVyg5JVwtPG8QXkoozheYW0KI70Whm3veN9+vaNm08R27voaaDPx9gRuqrTDewAjE8pEJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwVMwzUUN8LmscbdnS+jHzBY2S4EzHZC1mbeTyfl2yk=;
 b=CzR1yNRCNX7py4+uCSC5siKVXCakvKtWJuj5gfRSSE4vYdrt7YXOS9aIw7lryujVU7aS36hYczY+p0Ym8ShI8BW3Jh6BoLd9ofeOGNuh2MvxH2H+rSSSjb64RTHQUbuCr7Hnx5630fs4PQoI/qWHlKuplOq3T1gNH5B0PAWWoG20jsNlxyz7yvD9/FoLi3MROoDr/T9euuCJHtieNniRK6Bgr9K5DlYTXYIRlukzht63ZkZ8l/jYsaG/pfxWzOlbckM4muCr7qoqjpZ+ERX59IMqkYs0S4N0Z5VbAIhJmMIpt1HNc4777g8RE6icKQTIKCXQnXdTZ1UsQlelbn9SGw==
Received: from BN9PR03CA0247.namprd03.prod.outlook.com (2603:10b6:408:ff::12)
 by LV8PR12MB9692.namprd12.prod.outlook.com (2603:10b6:408:295::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 08:47:44 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:408:ff:cafe::7d) by BN9PR03CA0247.outlook.office365.com
 (2603:10b6:408:ff::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Tue, 19
 May 2026 08:47:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.0 via Frontend Transport; Tue, 19 May 2026 08:47:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 19 May
 2026 01:47:27 -0700
Received: from moonraker.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 19 May
 2026 01:47:25 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
Subject: [PATCH 1/2] arm64: tegra: Fix address of Tegra264 main GPIO controller
Date: Tue, 19 May 2026 09:47:06 +0100
Message-ID: <20260519084707.773214-1-jonathanh@nvidia.com>
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
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|LV8PR12MB9692:EE_
X-MS-Office365-Filtering-Correlation-Id: c2336119-cb15-4966-4a4e-08deb5834b69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	daAdGC78erJG0p6UINMLjl7Nrurr5HTfKcXfMwML/huhGJ9uh/9Y7K5NDdk7yCZFdaCPqJ/H91QXlr3Aij5JaW+r4AH8Wy8Cb3OX6quUx5XdldSpi/i7x4yc31WGQp41j+Xd5TxGHJTT/ivuWu4Z1TaQKvsNMsz7SLW7F5SUaMq/KXdXbn9fE+kQtBoXVcV8jq4izW+EBZ9bPccS98TYfXzcibgDco3WZgutD790dUxWC0YJeLW2pyWGv39NjMy4AmVoXhSVPzUXrh65QXO3HtQjYLSiQ8LJI80O162j8iGqaOCf7xLGCfKlYicMMvRysBVfj31ElWOpjo3zillgwf+XlV0hyljI4oUDDqVxmrdVLWlO8X5bH7C7o6NkY0zaau9b0TEHc3pyldaWAECuACx4UB0qFlcswtXaq2LfGUqHvL7PuA+ju74GkoIKf2ipRhAHPk7m84bc45DrXywIaJmRS9ido+N3XWvZfdggpq7PU9ESePjs1n3/OPestdchiJfYe0S6+cJlLi+JjmeR7AEJ/JrVRlakx02ZHo+Itb35NfQJ5axi5OryqhmLf0wY3uZmmd3dOAAMo1TrjyQgXcw/vnBqcbqQpFeiIrWndHyobPylYOpbrJg0T+NDxJxQBDnIxWVN7e2YOwDxM5xkZ6ZxYMhxtJn2/2r58Rv5R5ZM/7Ts2S600n/Jnvf6pSGIrQbSzVUzzEOjbgYWqvC+tpKDL/ZZ9oC46XXq9KOSwLw=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rETgGm86bbo1B3Fwdk9rPVwHlS6e3Q/C/E3gnsbWGAgSDB5bMIFVv66vX0rTPYNzzOvGfQQNhv17g0XVOVV5JWFIvXdHOW7mI4kpc8FwFoSfFPAEQ7NDjgJG9dcqFMa6/c0iIpRQRzs9m3snLpuSkio4zbwU2dEY5A8IsnwwTqjWB1ySTTX59FGcqZb52B6w2mDsnk4iOoyhr0Tb20Qx9Do79R5iVTn0tWmH7YJzWUF1kyqPhJrPiTOIfhcFu7mDHIqaNhRemtJk08lZXiyaWBEUjmRfuO4w/vSbAzMqM8ypj77f7zwx9IZU0tEegdLP0KTJVEzGJli+b7QiFHJw/iVneMFgT3ccwmFjuFgulgtq1QA1BGYqOPfwTR6pdaCDaEwjEmaJI38jo36f+wX1vcS+cjXCbPwhI4aFCe7IdO2AIFFaM5rh8pJO6kPBodOI
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 08:47:44.1918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2336119-cb15-4966-4a4e-08deb5834b69
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9692

The 64-bit address of the main GPIO controller on Tegra264 is
0x810c300000. The main GPIO controller was incorrectly added under the
bus@0 node instead of the bus@8100000000 node breaking the boot on
Tegra264. Fix this by moving to main GPIO controller node under
bus@8100000000.

Fixes: c70e6bc11d20 ("arm64: tegra: Add Tegra264 GPIO controllers")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 88 ++++++++++++------------
 1 file changed, 44 insertions(+), 44 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index 06d8357bdf52..2d8e7e37830f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -3277,50 +3277,6 @@ rtc: rtc@c2c0000 {
 			status = "disabled";
 		};
 
-		gpio_main: gpio@c300000 {
-			compatible = "nvidia,tegra264-gpio";
-			reg = <0x00 0x0c300000 0x0 0x4000>,
-			      <0x00 0x0c310000 0x0 0x4000>;
-			reg-names = "security", "gpio";
-			wakeup-parent = <&pmc>;
-			interrupts =  <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
-				      <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
 		serial@c4e0000 {
 			compatible = "nvidia,tegra264-utc";
 			reg = <0x0 0x0c4e0000 0x0 0x8000>,
@@ -3586,6 +3542,50 @@ pci@c000000 {
 			status = "disabled";
 		};
 
+		gpio_main: gpio@c300000 {
+			compatible = "nvidia,tegra264-gpio";
+			reg = <0x00 0x0c300000 0x0 0x4000>,
+			      <0x00 0x0c310000 0x0 0x4000>;
+			reg-names = "security", "gpio";
+			wakeup-parent = <&pmc>;
+			interrupts =  <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
 		i2c14: i2c@c410000 {
 			compatible = "nvidia,tegra264-i2c";
 			reg = <0x00 0x0c410000 0x0 0x10000>;
-- 
2.43.0

