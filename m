Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010024.outbound.protection.outlook.com [52.101.56.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80203484235;
	Thu, 10 Sep 2026 14:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052033; cv=fail; b=Ee7UZmNI9vbvloIUcTtv07sbNsqUoW4JtVedbASerlq1WwHOO2JWoXdgRSHOACZmqR8gxSTEm24cooMM6kOUioXRH3K1KmVpeKnGff+4hdnZqrlh/Au2i2Jffa6DEp1JSNN+6m8rJ2SqmXtPhB/yF+wqkaXarUC/Q8nCG/MIWF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052033; c=relaxed/simple;
	bh=7MrpzwNhM4vIMXhY8mzEiWiusJ3483AGMz6w7ohSF0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=sShsYdYsy8WHjlN5q+qxht7gHoPNd6034GCqXLGmb599spMowTLpEB623jfPuw7pqf7S+HD8RBgACCpRE7GlG5jXvPxiWtriIK6nwNqXN18g18ZKp1wRHehbUsx8iV4ZwVBWhFPt/ZR9r8/FhiiPO5PqVSZRdgqAm5uN8vom5XA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=f73lMds6; arc=fail smtp.client-ip=52.101.56.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="f73lMds6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VYaMj4gZwgZyq5rwQNS93xFkAGYRukfIS1+H1ld7zNFWt/GwhbBHCGZFpGx1vtg1FV/T+O8OBsHE4n8RgARDFYzJiros2zoR3HemO86PFGD8KLuKm111O/A7Ti3KUQ7406hCdVl8XCrOqibztc31h45po38i/nfQ8JFsCZSVDy8gcRhx6qETyOgSuh55e7Yz5Xi51E7X3DZb3orgoSZoHKqfJacEBm8EMi0ZsnUfCEg7P7z+t+oCroj2TwIcLc1Go5Vvl9QIYeei0KzGz4KQ93LbKmuSyZUaDBfBELF0KzrY2sFDuU9kzO0dNrLfn074EkGyAYR2bajo+6Z06jafPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiCsWrXULLF1qgN5eD2w3BNqIwTKHG1mFSloFwNXO8A=;
 b=EvZA0K5164ICH+YRW5OF5KLAMQVH2c5yStZLqvtxRN1a+5OylrAEbWQEi+VlGskp/rz91fAh8yvs64m0/JTmvm+Z/4w9o6vYgI4/7IQazZ+hdotJeOUNsB5JN+GpzO0P5V24i9NLRGmTDs4bVS+j4X3ovESHcFyYbFmJDrDnizwJI7PapK5lTVbcbiIaeAPKlCDlqC+16bb6HNAjzbNxQGxrZ4OZShvcwFq2jKHFZ/S5fRs55L86VayWtSGHHkZ7dUHRh9c4OuFpJWVfL5OalR+ZtNBvGHq6zgOvphle0rXpwLChxXEgfBnsqZ/7slJYHOd8P2JXc9tPjhHPzKYUPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qiCsWrXULLF1qgN5eD2w3BNqIwTKHG1mFSloFwNXO8A=;
 b=f73lMds6J3grHlGOPgbGYCh34dkna1IyvaNCQwxigNa55U+Wmoox5FEwFL2YyfsLBvAIq3WLN+SFUagcYA0isQMgDlxBAEpcb5y5+JJUHyX0UVSbBxFBBtzhZXx56XrorvibJyVwwREzpXyAspGP9ZdcqdIqHWSMPnTtnwM1D/upuxcFWkgJX7+ovq2y1LG+0ejyo9P9wGO+RzHlNngHMasJX3bkPCByl4frg8cyN/GLWW4TFvaoydMINRC8Ba0wKlLSWgZGtoA83TOcuXfvn37PvwXb2bkK9s09t7QDDRe7ZDXRRFuA4/sgaWag7m891/GPLgqYoEV0oskwIwOHJQ==
Received: from PH5P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::14)
 by SN7PR12MB8145.namprd12.prod.outlook.com (2603:10b6:806:350::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 14:53:44 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:510:34a:cafe::2d) by PH5P220CA0009.outlook.office365.com
 (2603:10b6:510:34a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 14:53:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 14:53:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 07:53:15 -0700
Received: from [127.0.1.1] (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 07:53:13 -0700
From: Jon Hunter <jonathanh@nvidia.com>
Date: Thu, 10 Sep 2026 15:52:59 +0100
Subject: [PATCH] arm64: tegra: Add the USB Type-C controller for IGX Orin
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260910-tegra-for-7-4-arm64-dt-v1-1-52e7bc535489@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAErEomoC/x3MTQqAIBBA4avErBuwEMuuEi20RptFP4wRQXj3p
 OW3eO+FRMKUYKheELo58bEXNHUF8+r2SMhLMbSqNco2Ci+K4jAcgh1qdLIZjcuFpJ2x3gdPoYc
 Sn0KBn388Tjl/HuSqoGgAAAA=
X-Change-ID: 20260910-tegra-for-7-4-arm64-dt-e4a69bbfbef8
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
X-Mailer: b4 0.16.1-dev
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|SN7PR12MB8145:EE_
X-MS-Office365-Filtering-Correlation-Id: 0751ac20-9f4d-4bbe-cd78-08df0f4b4f98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	eLutpXazWmf5Ki6KLxANxUNjaOfild5tCsbK+lakcgVVVoaYAa3Pr1s0xOzwn2lqnlmT+dEBfFfAVeZ1zdIPHMnn3LOWpdfRXG3sJGy9BnpbJyMpSoI2YqxEXuwq3tXgVXAUGR71kZEJPTpti73I+wKHzhI+re9r8ncQAB/yTx2szVl+e2QVMVCOPcJfh/Gtj6RzOVCTcizrwIZ7H6POi7qF2Ne5GFdzivPgOMvH44HBBekhJctZF78dGq/HeMCt1h19UQvsro489hLiwrhRFBoV/SVJaEd4OR8JWK1i7gyUkWQ80T00mlqhIcFyaITMKBQLtDEfawm1jDGr2TqyvF72gxXQ1dOa247OyAF+toe1qAXdPzwkFItr1Rk0io1gG0A41Z2RUDH/NOFNy8b1InicsNvTr2HbTdJa4RrQwI1ahFCHcGXThB0nmBiIRE4X/WS4ayNanE8FnrzPTlwTyHSssz/zGjbAeIdCdyHlMONJNG+x2tLFObK6gSp84IMFJznvihfez6Srlm6MC1/7eFDGWIGKE7jLqfz62z1UxyKlgsE489xsg9ST4zGFBSAVjUTREgBoyi0aXqhDRBTEdfLXrRtp7gqcjwmUDqKw8xG1znU7c1qt77ECvCAqZP2cO2rfZRmfHzuQHeqbM+f0kYpadZSH+OKX5s9QrOXL84oR86hHfAgEqwFYxaZXvPfb+Pl66lFfna/0lUN2ee/MHg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/agfKG2YhwSu8D3mWqkpV0/0x7Y4vkjHrhDPhk3Hvajj+iXvjo2AP4UxNm6Jco1aRysQNDotc/PuenyMp7RWdNoOqpilQV9MWjPJBwj0a5DctfCMg/UDb0mzov1UwVa200YJcy5m6lYvcINWH3G9m9rdM5Ve4fj883fIrfmfu6wZVAFYB5A0yISl+388EpGzsu9iRQGh2s/+8ZhmHuju2+SiNI9vAoZ4wAGeybu8wx9Tc1n1Z4eoMhSZVucrn9J5yS6B0BH0bTyFvD2V0gA4odQwQB86jcBiMASFjAOc+YO3VuhK5K/oIYdGQ0enCDXBpR9IPcJp1Jcs/y0ADzZHxqiPpu2Ihs5V84vYltj3sEDqxG8Rnvp01eNpsFpSTy1jo5ShuiKEj01D0FpZASx6BK1bfpTpH5y4qRyZTsUKIkdiYJtdMzayHu72aNsySKZF
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 14:53:44.0779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0751ac20-9f4d-4bbe-cd78-08df0f4b4f98
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8145

Add the USB Type-C controller that is present on the NVIDIA IGX Orin
platform and hook up the Type-C controller connector to the USB2 OTG
port on the Orin SoC. The vdd-supply for the Type-C controller is
provided by fixed voltage 5V regulator and so populate this regulator
for the IGX platform too.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../dts/nvidia/tegra234-p3740-0002+p3701-0008.dts  | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
index 97cede1fcb70..a4ddffb16d85 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
@@ -93,6 +93,29 @@ rt5640_ep: endpoint {
 				};
 			};
 
+			typec@28 {
+				compatible = "st,stusb1600";
+				reg = <0x28>;
+				interrupt-parent = <&gpio>;
+				interrupts = <TEGRA234_MAIN_GPIO(K, 6) IRQ_TYPE_LEVEL_LOW>;
+				vdd-supply = <&vdd_5v_sys>;
+				vsys-supply = <&vdd_3v3_sys>;
+
+				connector {
+					compatible = "usb-c-connector";
+					label = "USB-C";
+					data-role = "dual";
+					power-role = "dual";
+					typec-power-opmode = "default";
+
+					port {
+						typec_con_ep: endpoint {
+							remote-endpoint = <&usb_role_switch0>;
+						};
+					};
+				};
+			};
+
 			/* carrier board ID EEPROM */
 			eeprom@55 {
 				compatible = "atmel,24c02";
@@ -173,6 +196,12 @@ usb2-0 {
 					mode = "otg";
 					usb-role-switch;
 					status = "okay";
+
+					port {
+						usb_role_switch0: endpoint {
+							remote-endpoint = <&typec_con_ep>;
+						};
+					};
 				};
 
 				usb2-1 {
@@ -473,4 +502,11 @@ vdd_3v3_wifi: regulator-vdd-3v3-wifi {
 		regulator-boot-on;
 		enable-active-high;
 	};
+
+	vdd_5v_sys: regulator-vdd-5v-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-5v-sys";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
 };

---
base-commit: c68a982815dcce5464e3bf2a31ac94f5146c04ca
change-id: 20260910-tegra-for-7-4-arm64-dt-e4a69bbfbef8

Best regards,
--  
Jon Hunter <jonathanh@nvidia.com>

