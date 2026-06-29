Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012011.outbound.protection.outlook.com [40.93.195.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1DE3EDACD;
	Mon, 29 Jun 2026 09:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725694; cv=fail; b=XObXhuTLj2481m7OcwoPewr4JKHMw6qzXHy+xQHoahgfkq9efhhUNLyUPTCWByyxqnvWwtX8MyCOOYwb031qQRIJrY25yvJauw9NVZ4wDUoNP6g6QBoi2vN8tzQVQxq5BiyHtRT2g+aHmFe1frlM0rjdosWczSTTiYR0N/AJItM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725694; c=relaxed/simple;
	bh=83S/6PUcDb9g+d0iAm2SNxUyonkUAIAVGNn/8vVdbHs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uxBR5/zdHGD0V2Ep8WtnD5CXpjDJesISg/4D2fmeATq4WZJUUGMTiBBgWUjMO6baPTjXqigtw4nEBPqMeOklMu+7wdsKiNAHYODSv1KEB9/fJPhO+4ZjevChsVBMxNZ3ixNaysBnRsajXXIACtGU5RH0da22jM+L8fcWbYgLZ4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fhzmjZBy; arc=fail smtp.client-ip=40.93.195.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fhzmjZBy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gip9ucImZe5r3qY8I5xnfyCQ3fqvVpHWR3fgr8ASE/01/Yp5+CmkQPybyZxl1s7qejN84EF3BlhRKESyIq3sOWl5L19N4VBDZFqFkTKMshCHvTx+pQjApcHEIPFuSAGvQQi/Fn6newofbdy/aAhHV2bFehmd3STXK7Rzi/6Xc58enXlbZpmL0r7bAKR7FkLXzQdfPVijzTKVC9M09jAcLS0u2aLVLVqveWKJDafEA9rqcfQ/wpLWXcYbdekvXlfO+CHz3YEN8FbIPhppXd2VgSuLtLwAnsI3pCwzjNmtTVlIk8OS+o3tcrwUNaQMwzbfanOo3HDHq+pyjwkoUVIeoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1EGbKXy8EfYAx2K9QwIeuGIutCxjyQgOpv15+Fyi3DA=;
 b=YOMkBoNa8Rrt9mG5ukz3ocqhFRECz+BrweLkYox5IoZOHdvP6JD84LUVxPHpYZCKQJnKRhqxCwfw1Z7y8DInz1+u0EzrJ3vHj+bS2bxwVbfkl0ZlRJ5vdq4rmg+UxvyWRLO9DTTkJZEp25MLf6+U2s1gCvjrClEBG8VOI1WOcLqSJzpugc0bw4dz48m0XP0ndmn7HctKje+4YaDbUTp14MqZe5o41H4LnVQMPwK83SjzPUQsuAziREFNrFgTWo5ilYSsCNuGZVImLTjiUhrtnE1QIqjH92/bE/PTajCTGapXWOtIedZHm2jD4h26uzmzCKQV97cl7l1EOiI23inmXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1EGbKXy8EfYAx2K9QwIeuGIutCxjyQgOpv15+Fyi3DA=;
 b=fhzmjZBycw36A9LKCepcD2MhILIrgLQiX6TRMFwtSOH4TqZPErkOr6t7q45BLZo6nMqRObK79d+qobsebbAeGp/fZfEJWXLf3J0GFgPVVtkGB0VrZf0fGkSm+dUnoQG45bjak6kTuWGV11xXJxrw3hZwyWZBzWYYG1jsKrzB7tBey7+0Mgxs6hzCM8H5nKD17SMAq24ewOt2Gz/xo12k4CCfv8XjZWdnOiyPGz/4UdBFm7EPRfyOJ+W0Q4pj7RDaWCOaORFR7IoKwB4u62D3Vd0KYbg8WvEWniJmSz15knM/XiiYar6ZgpX3GO9byoanFYIdZadc4CtVIzVt8CYwQA==
Received: from MN0PR05CA0018.namprd05.prod.outlook.com (2603:10b6:208:52c::30)
 by IA0PR12MB7530.namprd12.prod.outlook.com (2603:10b6:208:440::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 09:34:44 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:208:52c:cafe::15) by MN0PR05CA0018.outlook.office365.com
 (2603:10b6:208:52c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Mon, 29
 Jun 2026 09:34:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 09:34:44 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 29 Jun
 2026 02:34:33 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 29 Jun 2026 02:34:33 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 29 Jun 2026 02:34:30 -0700
From: Wayne Chang <waynec@nvidia.com>
To: <mathias.nyman@intel.com>, <vkoul@kernel.org>,
	<neil.armstrong@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <gregkh@linuxfoundation.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 3/8] arm64: tegra: Enable XUSB host function on Jetson AGX Thor
Date: Mon, 29 Jun 2026 17:34:01 +0800
Message-ID: <20260629093406.1118594-4-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260629093406.1118594-1-waynec@nvidia.com>
References: <20260629093406.1118594-1-waynec@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|IA0PR12MB7530:EE_
X-MS-Office365-Filtering-Correlation-Id: e72604a0-7547-4624-e1eb-08ded5c1a745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|7416014|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2PnsskDI795raTlXcViUehTRQCFvKrSRtyJLhEH7Dx1TKhGcQ7hLXokYBemLUapGMllvqSCecJQb9VaOMvxWc3qe/23mksT+yq5EAlSrxhz1ChGrJylNK7vx+iyLQ8ieUHmiUWnLgnk+mHl14XC9Cm6I9MVFQY38bkXbPfbUaa8gLUuzb67YHACxT2QeSpcu0HuhTkPuciEEGkeF3HVZ1HtvlzwMo3aWVj22CMVf+jY2ULkhkWJQdgJPXfToJDCMquL7ebjOVRjgSJWjSZZokpLUeJeAAEdoKmQcFKBVm4Hmn2XLBKfTCqUJZ48PxfANpT2uhuMNM0Z7exaLPLlpVAdW4L3NJplwaUlHKluUbqHCIcAdqtFjF7xEJFx2dhrvZRKBd24OWMARShWeN1N7lOReQGElus2zhjjVUr2byBnxR8cuOD6NrQqtoz+hNNWOurYIck5vltEdhs/Y1VYVoP1+3Fc97wZHaPWsmAvVLwyUYf7h1mcerji5fLbeMFSkPlGYHJLAUyXhVHzTvTVuUkz6EAPkfcD8bQ02OPmFphLGICI5Q0amVU/R9TxmrBChNlYiovGuqonFd95C5uycpSl7mYM50LN6c6GjekKXBo5/8m6EuVlQhNDJMrMRBj+coMzG41UsXievjsHg/4Wu0gTiXRvNdEAlpN2WmsSHO41kLA+mBcPRNvLYIDR1G08Ki8HIM9KMW/o9kRx4aeC/Bw==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(7416014)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HvYuj3tlWP9ByTf62K85t3trLSF2DQboze8WIjDaWm5ODYnUN7TrIWxFIrMFUp26SzgCVlQ0LEGyssWARAxk5K3L1iw3FP0E7mNX8K23L3WYXhffnmvqvM5Hvx7P3MSlv8rpk4C59K8BjnRkys9nbtcCz63P/BrCi3oyUp+AdayHrQoX0yHNSnmE+nE0bG8N+viwub8aMUHWxSMW8QWHlCmQpp04z3WnCMPiMBeJb5BDw3sJY3GvILUZK+N+J880rxs8tQ7uZL7aEJ8oKT+fqyRR1O+MsjcPM0eBJuTTUzkZa7LoqmEnZrE8T+N9h6cVdDu3WpThJvZGKkHccwN/Au3r3fZuZBx8rCj+1lQCV+BjVqbBFktBjnk6DFT36of1GY67DNPss/S2HzI79jmiHmTGo39OmO3GLePE44msHDKNoIT/gWbBRBfw4ULGqkSo
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 09:34:44.2954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e72604a0-7547-4624-e1eb-08ded5c1a745
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7530

This commit enables XUSB host and pad controller on Jetson AGX Thor.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
 .../arm64/boot/dts/nvidia/tegra264-p3834.dtsi |  50 ++++++
 .../dts/nvidia/tegra264-p4071-0000+p3834.dtsi |  95 +++++++++++
 arch/arm64/boot/dts/nvidia/tegra264.dtsi      | 154 ++++++++++++++++++
 3 files changed, 299 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
index 7e2c3e66c2ab..61802334452e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
@@ -35,4 +35,54 @@ cmdqv@6200000 {
 			status = "okay";
 		};
 	};
+
+	bus@a800000000 {
+		padctl@8680000 {
+			vclamp-usb-supply = <&vdd_ao_1v8>;
+			avdd-usb-supply = <&vdd_ao_3v3>;
+
+			ports {
+				usb2-0 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb2-1 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb2-2 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb2-3 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+			};
+		};
+	};
+
+	vdd_5v0_sys: regulator-vdd-5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "VIN_SYS_5V0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd_ao_1v8: regulator-vdd-1v8-ao {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-AO-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	vdd_ao_3v3: regulator-vdd-3v3-ao {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-AO-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
index 45f8df9bbfd6..9d6d0c31f881 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
@@ -9,4 +9,99 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	bus@a800000000 {
+		padctl@8680000 {
+			status = "okay";
+
+			pads {
+				usb2 {
+					lanes {
+						usb2-0 {
+							status = "okay";
+						};
+
+						usb2-1 {
+							status = "okay";
+						};
+
+						usb2-2 {
+							status = "okay";
+						};
+
+						usb2-3 {
+							status = "okay";
+						};
+					};
+				};
+
+				usb3 {
+					lanes {
+						usb3-0 {
+							status = "okay";
+						};
+
+						usb3-1 {
+							status = "okay";
+						};
+
+						usb3-2 {
+							status = "okay";
+						};
+					};
+				};
+			};
+
+			ports {
+				usb2-0 {
+					mode = "host";
+					status = "okay";
+				};
+
+				usb2-1 {
+					mode = "host";
+					status = "okay";
+				};
+
+				usb2-2 {
+					mode = "host";
+					status = "okay";
+				};
+
+				usb2-3 {
+					mode = "host";
+					status = "okay";
+				};
+
+				usb3-0 {
+					nvidia,usb2-companion = <1>;
+					status = "okay";
+				};
+
+				usb3-1 {
+					nvidia,usb2-companion = <0>;
+					status = "okay";
+				};
+
+				usb3-2 {
+					nvidia,usb2-companion = <3>;
+					status = "okay";
+				};
+			};
+		};
+
+		usb@aa10000 {
+			status = "okay";
+
+			phys = <&{/bus@a800000000/padctl@8680000/pads/usb2/lanes/usb2-0}>,
+			       <&{/bus@a800000000/padctl@8680000/pads/usb2/lanes/usb2-1}>,
+			       <&{/bus@a800000000/padctl@8680000/pads/usb2/lanes/usb2-2}>,
+			       <&{/bus@a800000000/padctl@8680000/pads/usb2/lanes/usb2-3}>,
+			       <&{/bus@a800000000/padctl@8680000/pads/usb3/lanes/usb3-0}>,
+			       <&{/bus@a800000000/padctl@8680000/pads/usb3/lanes/usb3-1}>,
+			       <&{/bus@a800000000/padctl@8680000/pads/usb3/lanes/usb3-2}>;
+			phy-names = "usb2-0", "usb2-1", "usb2-2", "usb2-3",
+				    "usb3-0", "usb3-1", "usb3-2";
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index 2d8e7e37830f..3433587dc572 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -4049,6 +4049,160 @@ pci@8480000 {
 			nvidia,bpmp = <&bpmp 5>;
 			status = "disabled";
 		};
+
+		xusb_padctl: padctl@8680000 {
+			compatible = "nvidia,tegra264-xusb-padctl";
+			reg = <0x00 0x8680000 0x00 0x20000>,
+			      <0x00 0x86a0000 0x00 0x10000>;
+			reg-names = "padctl", "ao";
+			interrupts = <GIC_SPI 4101 IRQ_TYPE_LEVEL_HIGH>;
+
+			resets = <&bpmp TEGRA264_RESET_XUSB1_PADCTL>;
+			reset-names = "padctl";
+
+			status = "disabled";
+
+			pads {
+				usb2 {
+					lanes {
+						usb2-0 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+
+						usb2-1 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+
+						usb2-2 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+
+						usb2-3 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+					};
+				};
+
+				usb3 {
+					lanes {
+						usb3-0 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+
+						usb3-1 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+
+						usb3-2 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+
+						usb3-3 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+					};
+				};
+			};
+
+			ports {
+				usb2-0 {
+					status = "disabled";
+				};
+
+				usb2-1 {
+					status = "disabled";
+				};
+
+				usb2-2 {
+					status = "disabled";
+				};
+
+				usb2-3 {
+					status = "disabled";
+				};
+
+				usb3-0 {
+					status = "disabled";
+				};
+
+				usb3-1 {
+					status = "disabled";
+				};
+
+				usb3-2 {
+					status = "disabled";
+				};
+
+				usb3-3 {
+					status = "disabled";
+				};
+			};
+		};
+
+		usb@aa10000 {
+			compatible = "nvidia,tegra264-xusb";
+			reg = <0x00 0xaa10000 0x00 0x40000>,
+			      <0x00 0xaa00000 0x00 0x10000>,
+			      <0x00 0xaa50000 0x00 0x10000>;
+			reg-names = "hcd", "fpci", "bar2";
+
+			interrupts-extended = <&gic GIC_SPI 952 IRQ_TYPE_LEVEL_HIGH>,
+						  <&gic GIC_SPI 4096 IRQ_TYPE_LEVEL_HIGH>,
+						  <&pmc 79 IRQ_TYPE_LEVEL_HIGH>,
+						  <&pmc 80 IRQ_TYPE_LEVEL_HIGH>,
+						  <&pmc 81 IRQ_TYPE_LEVEL_HIGH>,
+						  <&pmc 82 IRQ_TYPE_LEVEL_HIGH>,
+						  <&pmc 83 IRQ_TYPE_LEVEL_HIGH>,
+						  <&pmc 84 IRQ_TYPE_LEVEL_HIGH>,
+						  <&pmc 85 IRQ_TYPE_LEVEL_HIGH>,
+						  <&pmc 86 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&bpmp TEGRA264_CLK_XUSB1_CORE_HOST>,
+				<&bpmp TEGRA264_CLK_XUSB1_FALCON>,
+				<&bpmp TEGRA264_CLK_XUSB1_CORE_SUPERSPEED>,
+				<&bpmp TEGRA264_CLK_XUSB1_SS>,
+				<&bpmp TEGRA264_CLK_OSC>,
+				<&bpmp TEGRA264_CLK_XUSB1_FS>,
+				<&bpmp TEGRA264_CLK_UTMI_PLL1>,
+				<&bpmp TEGRA264_CLK_OSC>,
+				<&bpmp TEGRA264_CLK_PLLE0>;
+			clock-names = "xusb_host", "xusb_falcon_src",
+				      "xusb_ss", "xusb_ss_src", "xusb_hs_src",
+				      "xusb_fs_src", "pll_u_480m", "clk_m",
+				      "pll_e";
+			interconnects = <&mc TEGRA264_MEMORY_CLIENT_XUSB_DEVR &emc>,
+					<&mc TEGRA264_MEMORY_CLIENT_XUSB_DEVW &emc>;
+			interconnect-names = "dma-mem", "write";
+			iommus = <&smmu1 TEGRA264_SID_XUSB_DEV>,
+				<&smmu1 TEGRA264_SID_XUSB_DEV1>,
+				<&smmu1 TEGRA264_SID_XUSB_DEV2>,
+				<&smmu1 TEGRA264_SID_XUSB_DEV3>,
+				<&smmu1 TEGRA264_SID_XUSB_DEV4>;
+
+			power-domains = <&bpmp TEGRA264_POWER_DOMAIN_XUSB_HOST>,
+					<&bpmp TEGRA264_POWER_DOMAIN_XUSB_SS>;
+			power-domain-names = "xusb_host", "xusb_ss";
+
+			nvidia,xusb-padctl = <&xusb_padctl>;
+			dma-coherent;
+			status = "disabled";
+		};
 	};
 
 	cpus {
-- 
2.25.1

