Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B825079941;
	Fri, 16 Feb 2024 12:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708086514; cv=fail; b=j7PWVdC4vlOetijBEBNwTJuda9+l1083Z1V3pf1sjJ2CquQ6Yv82UX9W6TpTyudUFJuB4JO31USSsTcgDE6E6v9PPz4M4YkLGYl/A98UkJei+LEPenEW2Kzob1+pJjKFhCdM8Py8kwr/l5uOY5Wucff36HleTbVGVzlNf9vyEdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708086514; c=relaxed/simple;
	bh=9deSuKE4ATWSNCuLMScqkQCo7faUjjxjtQ/OKbtkCV4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cKdlb1Tc6zwKkWz5qo70OhiNZaBUTz1/g/nA222Di4tJT6NTsEccVsLtiCX4NnAYbTbGwo2ouOcJt0NcKopS0ZWaFEHLZpv0W0QSl60Yuktfjv3Za7mdbiIqIgy2qY7SVCq88NCWbKWqane+/hvU8upnoi/Kj128+Hl54+2uiGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QObrhIvb; arc=fail smtp.client-ip=40.107.93.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QObrhIvb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7d9cA/l6ZenEYHaTH2EpCnhD4kXnJh7YZnH19YA0I4XdAmYDt1vWqRBO7Cz4tM43MuGxLraAre6rMjNgmO6f8XVEbA8FLF014XOPesjv+W85xPUFRa+JfVx7/XuLfhnQgP9hGYT2DmtiW13VcHgN763pMitr5zq5ybpdX9p5osdepaw5U6+g3rh+bqioJMYVH78j4dnCb9t5cM2Qbp3J7KGHcah3r2x/Cf3DliQz1WleoWp49dfFCh9i6pQDPR5R8jlR+FniBXsbla89zJTvTxbbA5o5oMv/0sGuqCgPFAb86c1uEEPkvWBUGj7b5SkSPU5dx8xiwZjgU4hN7XQ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSah5M0K1FNnltHMK9u7Ja2uU/lFUh99XWHaAOkM9SM=;
 b=CPpnncY7FKU5ABB4hrWtgIoOGRl4n0LlHuU5ikFd1/kh+ye3y4JqmkDaKLv/6IRqZJ3oi36Rs+apxrpmquvbiYJcctSn6XFgaLVSC+ihj5L/d5NoxpHb3kB3cS9b+lawYThEU0Ux1gr4kTHbtVq4LLtl9jC+JNU9dW+gZrcO1AT0MihpRTioYyQKC5nZyd4bpOXsxa+zFG1d7ENRLJ/Ex56n1jLyRvecX1dCSMHA69bFI0geKClZI1Tq9Fo782chEOEWqookLxwZYOb490+o5Y6SeEWPj41PQ6whVgaAyQCZpPWwPCSpVUYw77l3tzv/xxQ6J/N3YsdUGtpIJCgQRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSah5M0K1FNnltHMK9u7Ja2uU/lFUh99XWHaAOkM9SM=;
 b=QObrhIvbIUitw1H0BHKW30RrDKB5NqA+n6y0WQUD1fT8Bc3kahxsVgzSOtLA53nmrClff6ENKhVQwyeA67+poUriSRRJL6FVKvLrGqdizJW0Bsm5Uwz+D10mqpRQjwJdTfKkCr3iok/M6W/2G29GNJ4EiBL6NKOYfjdcNhyEO+/v8ranxqbauE2zbufIAwcQtMkU++KyLCuOVnSs7ld7J7nH8ZdbB9BWWWl5RD6HUiSf7CbZHMWGN5HBoDhBq0L8H2/kAj6qagElfnFdWWfWsaHX8Dr11RYTypj8Evrr6Hw5El9aqBttRjEZDk1ry90hXnujUA4/8GiaoRWVmRsJlg==
Received: from DM6PR04CA0015.namprd04.prod.outlook.com (2603:10b6:5:334::20)
 by DS0PR12MB7748.namprd12.prod.outlook.com (2603:10b6:8:130::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.28; Fri, 16 Feb
 2024 12:28:28 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::c6) by DM6PR04CA0015.outlook.office365.com
 (2603:10b6:5:334::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Fri, 16 Feb 2024 12:28:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 12:28:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 16 Feb
 2024 04:28:13 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 16 Feb
 2024 04:28:13 -0800
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 16 Feb 2024 04:28:12 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
Subject: [PATCH 1/3] arm64: tegra: Add current monitors for Jetson Xavier
Date: Fri, 16 Feb 2024 12:28:03 +0000
Message-ID: <20240216122805.32529-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216122805.32529-1-jonathanh@nvidia.com>
References: <20240216122805.32529-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|DS0PR12MB7748:EE_
X-MS-Office365-Filtering-Correlation-Id: b612cba5-2202-4859-3677-08dc2eeac796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RHkXarJVJhDhTZLjwml3Q1qBv4c5FDPB6MWQP993TH71UPpSZgNA7z0Cz7/GukVZUlCc3REKrDED2F3NixROYv1oBsc9nIfWrHNHiAOqcIRRQjVizZHokNbLBb/cH2e9jYjRufXRUzQV65LaNOG7mVHALzPLucRx2JOivzCD1ZuuaGV8bFit4kQyaDgIHxJFgd3Nam5dfZfmYdMRw3aEGIXj0YhzOI62eWuK5L6u0WfsHTDVbWqpxTuJyva/B4ncLA1wDFg0BprJgGdEJqv4/s5B61W9afbQOjEn/sQY2snyGfr+F2CMqB3I5ErncsCzcq5MVODO2K7PodxWgX1bAUBMESo7bj9m4c6ti8HzfChMvqWm0K7EzxFzj13UoBF3fPot3ZnhFo5tzC3MuiPwGO9mqDycTye2CJkvzEOW/t0fcNEYoQthtsbFbnx14zar2cgIy17f5dDQir/8SsMSTScLT6o5eNYq/pY9/nntf1KihAZW8+nS6WT1G23GMByYjRChwkdsBvi7iXPl20SYeXRNr49zV2bCm2zcChfghyV6ezTHLnLVirVJtEPd2zqUXuYqfkxuUUS4rOetw2rhnZULxsHo0rWqWsSjKCFM8IHMRX7dKCVLVeGqgtuKzUn7dRugHwgh4BqO7IF5SFHXqI2zKr6ci2Q0NaeYObk8p/g=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(1800799012)(36860700004)(451199024)(64100799003)(186009)(82310400011)(46966006)(40470700004)(82740400003)(86362001)(356005)(7636003)(478600001)(70586007)(1076003)(107886003)(7696005)(426003)(70206006)(110136005)(6666004)(316002)(336012)(26005)(36756003)(54906003)(2616005)(2906002)(5660300002)(8676002)(8936002)(4326008)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 12:28:28.4096
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b612cba5-2202-4859-3677-08dc2eeac796
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7748

Add the INA3221 current monitors that are present on the Jetson AGX
Xavier and Jetson Xavier NX boards.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 50 +++++++++++++++++++
 .../arm64/boot/dts/nvidia/tegra194-p3668.dtsi | 27 ++++++++++
 2 files changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index 5b59c1986e9b..7c57272af044 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -53,6 +53,56 @@ memory-controller@2c00000 {
 			status = "okay";
 		};
 
+		i2c@c240000 {
+			status = "okay";
+
+			ina3221@40 {
+				compatible = "ti,ina3221";
+				reg = <0x40>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				input@0 {
+					reg = <0x0>;
+					label = "GPU";
+					shunt-resistor-micro-ohms = <5000>;
+				};
+				input@1 {
+					reg = <0x1>;
+					label = "CPU";
+					shunt-resistor-micro-ohms = <5000>;
+				};
+				input@2 {
+					reg = <0x2>;
+					label = "SOC";
+					shunt-resistor-micro-ohms = <5000>;
+				};
+			};
+
+			ina3221@41 {
+				compatible = "ti,ina3221";
+				reg = <0x41>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				input@0 {
+					reg = <0x0>;
+					label = "CV";
+					shunt-resistor-micro-ohms = <5000>;
+				};
+				input@1 {
+					reg = <0x1>;
+					label = "VDDRQ";
+					shunt-resistor-micro-ohms = <5000>;
+				};
+				input@2 {
+					reg = <0x2>;
+					label = "SYS5V";
+					shunt-resistor-micro-ohms = <5000>;
+				};
+			};
+		};
+
 		serial@3110000 {
 			status = "okay";
 		};
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
index 58f190b0f868..6f5e9d114e2a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
@@ -50,6 +50,33 @@ memory-controller@2c00000 {
 			status = "okay";
 		};
 
+		i2c@c250000 {
+			status = "okay";
+
+			ina3221@40 {
+				compatible = "ti,ina3221";
+				reg = <0x40>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				input@0 {
+					reg = <0x0>;
+					label = "VDD_IN";
+					shunt-resistor-micro-ohms = <5000>;
+				};
+				input@1 {
+					reg = <0x1>;
+					label = "VDD_CPU_GPU_CV";
+					shunt-resistor-micro-ohms = <5000>;
+				};
+				input@2 {
+					reg = <0x2>;
+					label = "VDD_SOC";
+					shunt-resistor-micro-ohms = <5000>;
+				};
+			};
+		};
+
 		serial@3100000 {
 			status = "okay";
 		};
-- 
2.34.1

