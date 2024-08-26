Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB99194096;
	Mon, 26 Aug 2024 16:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724690881; cv=fail; b=TEH9n4POm7IkYRMYjDnVQUWS5cYqPy72Asw5WHMxv1JQENqaw2kdO6v3OdRGQe13GPDJiQ+0o/Y8zrPTDALS4QBy277kRRG3ZXRbcxrbsbLnibCVF5h5DgWLZmASzMFvKWxnH0T9wTTacWbhv/OPELh7UdM1hnrDE+1kN5fTgdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724690881; c=relaxed/simple;
	bh=s7UUmoW7e1A2qce3pYzVTRCHusCt5dkhWGRarbpIPl8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HR5pvdbGpnsrbKmiygdF/+cF4DkQZdIaWIyUOUkgkx/wN80QqUvL5eYOTSOXRJHRR+SSVeTnHQeEixK6E2+lLMnH+7vjOPHhXvDOy6bV1/vcFgQNRTqLXyilicLkDNg81dI9QqF5NdIZ9pDUBDF6kOYUCBkoq9/uk2zFzLFwQAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZTuEChyR; arc=fail smtp.client-ip=40.107.244.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZTuEChyR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yPfNQOq20WGeMfWmT8b8VNMKskPwNhAKfmY9UrywwePDJ+htMRF77o2sqAQ/6+LKiVEF/Dw7KP7P0gOUoZyrr46oL20wn2VLqRzmkcxfPGMUfwhWxKf0kFPW3wqhoqtXAvC4BdtrlMhyOio+ZLaol49Or4c8CzCPJdK4YKVBwFHtcpIWF1tewjtwfLBUL5DDsjGW4gwzk5Scm1DUeevxye2nB9VgYoBUdQWKox66nD54jD85wdn/et52nbL+KVkBZM0apNYBN6MDWgo9P6++cDF1TI76FYQDZuvxTIPMtXk6UricHRzETOahesN5KjE8eDkE2ZfTF4dgZ4iQ/4YLbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+b5fkYtnEkgRVv8YHjBoIe6/FeTjNHa0OHzDx+9uiM=;
 b=DtyqS6R/BClicA0CS0Uim5Jkhmn3BPa5ehAAAWz5tGQu9oivj5hzeqm56wLie4DNw6VyoSgEpgLbxT03qvuTIPGtnUKQXSuphcpU3DaJfBbKNazNq/8daiGB2Znddm0OOG8llKVWFEwTsyzz0oqlK8q7HZlQnUcLiaJp9ZD/8+HnT8MpGTuHVmICQe3n7PN0nn9f5DT1YDUH4wuw3joEUof/gwckaRi36hcpZjAeBzf3e/7fwmlRRlPAsOLGrfzPaB06I6jRxXGsZvCd37KBURBaPigr0BePnrRwMBEbjk5n//xH+MxPW2JZFVLjowuzQxqwDSn1qsDIzO/XRKwCOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+b5fkYtnEkgRVv8YHjBoIe6/FeTjNHa0OHzDx+9uiM=;
 b=ZTuEChyRXmvQ/QR7r9cJaDh6ayzAfIgM8cCmfuESBYU+GSGtnh/DJJ/cGbrs3p7n8HsrK6nM2q+6ljY352fPG0+VHBegVFDkknDQdbVlmOCJMUx7hD/GSLw5dAz7pWKonF5guWvjcU5GIcTkiJf744ush4xiYh3q3P+4t95OUb8AL07aDvdIji9ZDB8Y0a7/xEgoKuXQQyH9UrXOwHaa3ZLgDH/u3qZU+3Squ2LVSoATsZdqH0DV8C3zHCvhfn9OZmMjFd3AnXoI+YFFXA78xAb3sM3JqGr65emBGuYrACURWG3t5HI/qQCH/eyupbaK0pfl430Xtdwf/BRkKEMr9g==
Received: from PH7P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::9)
 by BL1PR12MB5705.namprd12.prod.outlook.com (2603:10b6:208:384::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 26 Aug
 2024 16:47:55 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:510:32a:cafe::29) by PH7P221CA0013.outlook.office365.com
 (2603:10b6:510:32a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25 via Frontend
 Transport; Mon, 26 Aug 2024 16:47:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 16:47:54 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 26 Aug
 2024 09:47:36 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 26 Aug 2024 09:47:36 -0700
Received: from build-dstotland-20240703T000904114.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4
 via Frontend Transport; Mon, 26 Aug 2024 09:47:36 -0700
From: Dara Stotland <dstotland@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, Brad Griffis <bgriffis@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: Dara Stotland <dstotland@nvidia.com>
Subject: [PATCH v2 1/7] arm64: tegra: Add common nodes to AGX Orin module
Date: Mon, 26 Aug 2024 16:47:19 +0000
Message-ID: <20240826164725.775199-2-dstotland@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240826164725.775199-1-dstotland@nvidia.com>
References: <20240826164725.775199-1-dstotland@nvidia.com>
X-NVConfidentiality: public
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|BL1PR12MB5705:EE_
X-MS-Office365-Filtering-Correlation-Id: e46349cc-90ac-41a6-747b-08dcc5eed53b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a8dLrP0358BHTRkH6EqTtMe6Bsw3acUVIPfjK/23oj7bkyLuUi9qeihoYLet?=
 =?us-ascii?Q?EnEIgC6zuRY+Ki/4D3a14RWCDk4eluzQVUQaj6AWIYqUcINkOi+pR0PY2Shh?=
 =?us-ascii?Q?6pYOaHP2kCdzRtZAJRsHYqCjXMsJjbHFStoTWpgLzQ5EL1ZJWlq1XUA7MoAs?=
 =?us-ascii?Q?5vHtJgdcuIZTe1XcNoIW5au/HvvVIamh0tEbWUdKyfcQzOEpmNnwFzWbk4lt?=
 =?us-ascii?Q?RJkXEM9Czin4WbuWvde8ag0Rq/y2gJUPFnp/fE5wQUEERu/jtZU+QMbSpsDI?=
 =?us-ascii?Q?r3mNZe97AiXACIPyBOBtfGHOmuEbsrQkuD1K1YRNBRsFw8wCSfhrG3+Ybs5a?=
 =?us-ascii?Q?WrGEq9SkI9eNvYbgRw6nw718xl5aKI8VyRCG5JfV27ehI087fb2Eo5r5ipW8?=
 =?us-ascii?Q?AH+6k9/I9adtXLLNr6ptu0XNxj/D7bpKTaYSfim4OevuWtaycaXXOOh2UJhp?=
 =?us-ascii?Q?wdnmKAMBB2iAtIq2gg56ga0bb4J+TgDNLvkTSAgdl645KzBejuULMgadJBme?=
 =?us-ascii?Q?NTcK/0I8uhpnQryOROz4nLOTadL0woJNa2d7KGpoG5LGSkK+u05ayXmD+Suq?=
 =?us-ascii?Q?FT7jd3uY+QoDMoZmmnfoxTRlO3a8xM5RNdpqkrjwt7a16oXoolvEYzzDuBf2?=
 =?us-ascii?Q?5/SqVnOk+4J3bKspZorAhlxVdOXXMDmJtKtUDmorgSFW3s0zpdxvHI96aZjI?=
 =?us-ascii?Q?5Kr/pob54p21regUli7wcZuIPVoshyIpjCU5kszzwxQbNSPmVt9moDeg4Bg5?=
 =?us-ascii?Q?DxXf4HwZuXxHnp6i6mzHQ4HToaFYwh+EQAreMOQvSV9q3PHnl9+dR5zIEJad?=
 =?us-ascii?Q?HKQCH1qMrIb4e50cLoHRyIIRQUmAKGCxuNEfvEtDnXOyBTa41Cz3nwSVtxTG?=
 =?us-ascii?Q?qMURtSDcg3IvlzzxPqxfTdCyINKiPUkyQQdkH2TUHNtI6O30k2MzIcidmYj0?=
 =?us-ascii?Q?KIm8k1BHJNSTGiMDSAq94diEWYEwXEkiZbK9VvEnoZdt5sdhM6mCRNnf5Wjd?=
 =?us-ascii?Q?MkaAsuKAveV86oszWqfE9G/csNs4n9S2L/CjWIBhdGUpTDJ9ogGjWbQx5ioc?=
 =?us-ascii?Q?GxrOhM1gOHyTt06B9wWCQfCROs/jqpCV1ZuuEByfdDw6rLblm3trISx5net3?=
 =?us-ascii?Q?gsMtUAyFP72Wvhi6J5iPc64i/elnVSbBT90NNXxh0rk1fJHJmDDWfu1I+zN+?=
 =?us-ascii?Q?KLeNI8VMuq0KUqRgZzkMGf0l8+E7gCGeQA3EP9zEY3LJfT9qQmehmdigRBm0?=
 =?us-ascii?Q?W1Rw6Cw2UFKS1ssfMv8GavyMkkGyMMYVoZoegvsJQWeO0oH3ANdOEJbl0IzG?=
 =?us-ascii?Q?conBti2XrFAoJAOOQopej8IXXf2H6N5FRJ6h1R6PQRMJDglOLyaSeYypnhOJ?=
 =?us-ascii?Q?RDuYijT1gW2wuBI/GtmtO7yfrnBa102onfXSmhqWHBy3voqG+DshkewXHmrQ?=
 =?us-ascii?Q?ipbES0EYp7rNte7gEEMTN0oaJfjeHt0K?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 16:47:54.9005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e46349cc-90ac-41a6-747b-08dcc5eed53b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5705

The AGX Orin module boards contain common nodes that can
be moved to the included module dtsi. This eliminates
redundancy within the files and reduces lines of code.
Data from tegra234-p3701-0000 and tegra234-p3701-0008 that
is common is now in tegra234-p3701.dtsi.

Signed-off-by: Dara Stotland <dstotland@nvidia.com>
---
 .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  | 83 -----------------
 .../boot/dts/nvidia/tegra234-p3701-0008.dtsi  | 89 -------------------
 .../arm64/boot/dts/nvidia/tegra234-p3701.dtsi | 85 ++++++++++++++++++
 3 files changed, 85 insertions(+), 172 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
index cb792041fc62..ea846b879a21 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#include "tegra234.dtsi"
 #include "tegra234-p3701.dtsi"
 
 / {
@@ -8,34 +7,6 @@
 	compatible = "nvidia,p3701-0000", "nvidia,tegra234";
 
 	bus@0 {
-		i2c@3160000 {
-			status = "okay";
-
-			eeprom@50 {
-				compatible = "atmel,24c02";
-				reg = <0x50>;
-
-				label = "module";
-				vcc-supply = <&vdd_1v8_hs>;
-				address-width = <8>;
-				pagesize = <8>;
-				size = <256>;
-				read-only;
-			};
-		};
-
-		spi@3270000 {
-			status = "okay";
-
-			flash@0 {
-				compatible = "jedec,spi-nor";
-				reg = <0>;
-				spi-max-frequency = <102000000>;
-				spi-tx-bus-width = <4>;
-				spi-rx-bus-width = <4>;
-			};
-		};
-
 		mmc@3400000 {
 			status = "okay";
 			bus-width = <4>;
@@ -43,12 +14,6 @@
 			disable-wp;
 		};
 
-		mmc@3460000 {
-			status = "okay";
-			bus-width = <8>;
-			non-removable;
-		};
-
 		padctl@3520000 {
 			vclamp-usb-supply = <&vdd_1v8_ao>;
 			avdd-usb-supply = <&vdd_3v3_ao>;
@@ -72,54 +37,6 @@
 			};
 		};
 
-		rtc@c2a0000 {
-			status = "okay";
-		};
-
-		pmc@c360000 {
-			nvidia,invert-interrupt;
-		};
-	};
-
-	vdd_5v0_sys: regulator-vdd-5v0-sys {
-		compatible = "regulator-fixed";
-		regulator-name = "VIN_SYS_5V0";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	vdd_1v8_ls: regulator-vdd-1v8-ls {
-		compatible = "regulator-fixed";
-		regulator-name = "VDD_1V8_LS";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-always-on;
-	};
-
-	vdd_1v8_hs: regulator-vdd-1v8-hs {
-		compatible = "regulator-fixed";
-		regulator-name = "VDD_1V8_HS";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-always-on;
-	};
-
-	vdd_1v8_ao: regulator-vdd-1v8-ao {
-		compatible = "regulator-fixed";
-		regulator-name = "VDD_1V8_AO";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-always-on;
-	};
-
-	vdd_3v3_ao: regulator-vdd-3v3-ao {
-		compatible = "regulator-fixed";
-		regulator-name = "VDD_3V3_AO";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
 	};
 
 	vdd_3v3_pcie: regulator-vdd-3v3-pcie {
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi
index 62c4fdad0b60..9218ea8d43e6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi
@@ -1,58 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#include "tegra234.dtsi"
 #include "tegra234-p3701.dtsi"
 
 / {
 	compatible = "nvidia,p3701-0008", "nvidia,tegra234";
 
-	bus@0 {
-		i2c@3160000 {
-			status = "okay";
-
-			eeprom@50 {
-				compatible = "atmel,24c02";
-				reg = <0x50>;
-				label = "module";
-				vcc-supply = <&vdd_1v8_hs>;
-				address-width = <8>;
-				pagesize = <8>;
-				size = <256>;
-				read-only;
-			};
-		};
-
-		spi@3270000 {
-			status = "okay";
-
-			flash@0 {
-				compatible = "jedec,spi-nor";
-				reg = <0>;
-				spi-max-frequency = <102000000>;
-				spi-tx-bus-width = <4>;
-				spi-rx-bus-width = <4>;
-			};
-		};
-
-		mmc@3460000 {
-			status = "okay";
-			bus-width = <8>;
-			non-removable;
-		};
-
-		i2c@c240000 {
-			status = "okay";
-		};
-
-		rtc@c2a0000 {
-			status = "okay";
-		};
-
-		pmc@c360000 {
-			nvidia,invert-interrupt;
-		};
-	};
-
 	bpmp {
 		i2c {
 			status = "okay";
@@ -68,45 +20,4 @@
 			status = "okay";
 		};
 	};
-
-	vdd_1v8_ao: regulator-vdd-1v8-ao {
-		compatible = "regulator-fixed";
-		regulator-name = "VDD_1V8_AO";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-always-on;
-	};
-
-	vdd_1v8_hs: regulator-vdd-1v8-hs {
-		compatible = "regulator-fixed";
-		regulator-name = "VDD_1V8_HS";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-always-on;
-	};
-
-	vdd_1v8_ls: regulator-vdd-1v8-ls {
-		compatible = "regulator-fixed";
-		regulator-name = "VDD_1V8_LS";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-always-on;
-	};
-
-	vdd_3v3_ao: regulator-vdd-3v3-ao {
-		compatible = "regulator-fixed";
-		regulator-name = "vdd-AO-3v3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
-	};
-
-	vdd_5v0_sys: regulator-vdd-5v0-sys {
-		compatible = "regulator-fixed";
-		regulator-name = "VIN_SYS_5V0";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
index 320c8e9b06b4..18bd4ccb6b77 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include "tegra234.dtsi"
+
 / {
 	compatible = "nvidia,p3701", "nvidia,tegra234";
 
@@ -45,6 +47,40 @@
 			};
 		};
 
+		i2c@3160000 {
+			status = "okay";
+
+			eeprom@50 {
+				compatible = "atmel,24c02";
+				reg = <0x50>;
+
+				label = "module";
+				vcc-supply = <&vdd_1v8_hs>;
+				address-width = <8>;
+				pagesize = <8>;
+				size = <256>;
+				read-only;
+			};
+		};
+
+		spi@3270000 {
+			status = "okay";
+
+			flash@0 {
+				compatible = "jedec,spi-nor";
+				reg = <0>;
+				spi-max-frequency = <102000000>;
+				spi-tx-bus-width = <4>;
+				spi-rx-bus-width = <4>;
+			};
+		};
+
+		mmc@3460000 {
+			status = "okay";
+			bus-width = <8>;
+			non-removable;
+		};
+
 		i2c@c240000 {
 			status = "okay";
 
@@ -97,5 +133,54 @@
 				};
 			};
 		};
+
+		rtc@c2a0000 {
+			status = "okay";
+		};
+
+		pmc@c360000 {
+			nvidia,invert-interrupt;
+		};
+	};
+
+	vdd_1v8_ao: regulator-vdd-1v8-ao {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_1V8_AO";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	vdd_1v8_hs: regulator-vdd-1v8-hs {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_1V8_HS";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	vdd_1v8_ls: regulator-vdd-1v8-ls {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_1V8_LS";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	vdd_3v3_ao: regulator-vdd-3v3-ao {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_3V3_AO";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	vdd_5v0_sys: regulator-vdd-5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "VIN_SYS_5V0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
 	};
 };
-- 
2.17.1

