Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2058.outbound.protection.outlook.com [40.107.96.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9518767E6E;
	Tue, 20 Feb 2024 12:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708431486; cv=fail; b=C4AfVgpNJgokdk3BeSbKMw/OnlUrxcOszoX9KjdHdV4/Rkto4RD8V9xw5cC0MGT4h/rnKI63zRlZUIRgNrDsUkzNMG8iNJL65gpW/o+ZyKqkcoahTtLHJNsHQEDMoUIRiExSBi8Su+D8Y7T2Ewyz/Unw7W0S/N/UxEYK8WuETPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708431486; c=relaxed/simple;
	bh=7xkrhV5Vkt0mmKMFASVlALL+7fspZJJdgeyfShma/sQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KKujbo5RtqaPNaxtplYd3CloJtsFMK2i0GGCgpXbCbj1XjwM0XOF5paz30qhXdJt+CCc4L2A149wBlwGhWJECOZmUpDCplseAD1VtLLwEKNLdVd10WRFSEFpCVnLVOFg8F7oJxMggzmZzmwI3epNCgtD2WgkWZ8rZSsV2q7ysgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I44EqVgW; arc=fail smtp.client-ip=40.107.96.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I44EqVgW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofqTEBGCPLKFTpRigyXpVF6w3wU1Kowk8bRheAg2TDUGIpmbUybuiakwDYxsjWIVM8UP5SR3hU2IME1qsQ1eiDPtJqUwUvFmavQ/7ZImzcd5ifemkJ2OVfveRQKvDuCg3LWvModyp9FIflHO+GutSf2641seuGnY5GCeqoG/lKvTPGroQ4GZRbd2gekLVFJcaxW9lMOFxqcHZUK8+oVTv4Dmj/TFfwIzh0EeaklbwGhNrZWbdLy/QNZ5MdWbni64O51csYYPzMpTsdT02IZmMHHnwC0y1cXc58lq6yQMe+RS6nqe6fRb/IrkRe5y4Zmq5S8ZV3SyiYEXqkIuy4uBxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fF7wnuVzVTsXHSdg3eWPFa6skD+go7P1N4eBfiS+0Ao=;
 b=UtKxqJUpYBj9SnQTgN/hTz/AEtPzVBinpOVAOIdeOwW2ExkEs3m8HoBmQWQxux+xCiLcp0a9kCHZ4/cAYwLP5pfcGiQiOSa3XL1000zFim6zkVQ7fGmyUWm2QldCm8zFUsqmcf/oz6W4Zk6eZgu4zfQH+/1a4sKbnlCaYVfTQ9QjuEr2YeY2lM2QZTwQciDaHtqqq8ksiuKA4aLIXTyeDTRPKgVApdEJgbrow/kz/0N8+ocSOH1oay9RPPbxgN6zzhz6egau2QDm2SDcoViJco88iwNRApXfJnaPojhTePniG4C3O3p2bzKke7TcMkIbjU8Zv/yW/UwHThmgqsLmCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fF7wnuVzVTsXHSdg3eWPFa6skD+go7P1N4eBfiS+0Ao=;
 b=I44EqVgWGS9aJa+GbbkH20SYEZBqjYVL2nJbXv7wSpPaaY5Inv5EFwHg2JVBNaepQQ6n5zt0XRzwWvmp7IJf0u+9J/ydXnRLrLWy1aPdvKWsvg0nT1nu3D86+thUsNPizSBdbX9HwptXc/924BH7zFj3kYkBKzdFlGBCjY1JXcvQjtqIIJ2cuRvj4rY6DeWYxklRnTX9svRhuMfiM+0LmCWNch5FaTIFqQrjqxwxhFB16ZKm50DNrAxWNWCHieVnEBrssKwR35feBSE1chS6WnmFvJ67y2gr4vATRq6zAJS3//MJ+9EAeLlN8iA44DpgoUrUW1qcR4CPz7R73x3Bpw==
Received: from BN9PR03CA0356.namprd03.prod.outlook.com (2603:10b6:408:f6::31)
 by SN7PR12MB6983.namprd12.prod.outlook.com (2603:10b6:806:261::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.17; Tue, 20 Feb
 2024 12:17:59 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:408:f6:cafe::8c) by BN9PR03CA0356.outlook.office365.com
 (2603:10b6:408:f6::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.40 via Frontend
 Transport; Tue, 20 Feb 2024 12:17:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Tue, 20 Feb 2024 12:17:58 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 20 Feb
 2024 04:17:39 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 20 Feb
 2024 04:17:38 -0800
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 20 Feb 2024 04:17:37 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
Subject: [PATCH V2 1/3] arm64: tegra: Add current monitors for Jetson Xavier
Date: Tue, 20 Feb 2024 12:17:12 +0000
Message-ID: <20240220121714.16543-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240220121714.16543-1-jonathanh@nvidia.com>
References: <20240220121714.16543-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|SN7PR12MB6983:EE_
X-MS-Office365-Filtering-Correlation-Id: f77f339e-36d1-4c9d-9cae-08dc320dfa03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CGPIh+kKsCjFuN43m/X/FzgcgvO9H5PQC3k+QJok44rhBcHYChs6plaSUE32ixHaBClRTtoZPsIlAW7sYGhOgXVhg+l6yznGRu6DyfDlhkoCvG33kt/FvfuO5XG1lk7HbI7RvuMIFVFxZEZe8rotGTjRbt43SHcAx5T95PmAXuc/Qlx0HV9tCcc3wD2YmLNXykCSrskw5sMxVqpPqlPE8AD+j+AD8FeAyBm8oTZ4QNmIYXa7ZMxqKtgH8VMBEW44+Vs0VZJ5Kr/V6XWm9vUvXOUupkakBVSjKDuu4xnkjqOh4F4aL661oThSyD+lWtah121GXxBzehN55Q7nByLBSqVoMZeuMxa105OFHwYHK6dVei6Z/iQu8m/o6JWBg2KgQ+Vk3jlddhS2CI1G5VoHcJW13Jpd2UoCxilN8R6azPcona12TwWKtf7IT7Pm2I/sOr0NyhkPsX+SeWeQI5izjoFJERg2oAVL77sCzl7aaCrN5TAHXsBuQcqqNYZs5XJKnKn/Owe9uaAvlj9EZnZ34c6nMGvrs0arR9eHYMH+7fcAN6dIgLz8RllALYtrLkN+wOY+WNpM/9CBgXCz39Y4tpoujzGGObzdxEOpo5cnUIuXHyR+9ip//LDii0wtLQ1HlxHwdwf5YfPB0B39tf5u+fXj/oroLnA1UHlDQnZcreI=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(36860700004)(40470700004)(46966006);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 12:17:58.6834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f77f339e-36d1-4c9d-9cae-08dc320dfa03
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6983

Add the INA3221 current monitors that are present on the Jetson AGX
Xavier and Jetson Xavier NX boards.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 50 +++++++++++++++++++
 .../arm64/boot/dts/nvidia/tegra194-p3668.dtsi | 27 ++++++++++
 2 files changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index 5b59c1986e9b..e8b296d9e0d3 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -53,6 +53,56 @@ memory-controller@2c00000 {
 			status = "okay";
 		};
 
+		i2c@c240000 {
+			status = "okay";
+
+			power-sensor@40 {
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
+			power-sensor@41 {
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
index 58f190b0f868..59860d19f0f6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
@@ -50,6 +50,33 @@ memory-controller@2c00000 {
 			status = "okay";
 		};
 
+		i2c@c250000 {
+			status = "okay";
+
+			power-sensor@40 {
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

