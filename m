Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C851315FCE5;
	Fri, 12 Jul 2024 13:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720790457; cv=fail; b=nECZ0Fh6hnDoJTBrDuGhOwEX0/HisGova+Br58jI7N2RuhDwbs3JhDm9wU046S1mUNQiXqsNqIJApiSnOflSobaqXHVeChK4HAks0PWZgs1snB2y9VnVt0w8SPJwVHgS7DadU68GK901A8rkRO6rQSblsjBLpXaWgFtNa3wFYoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720790457; c=relaxed/simple;
	bh=S61dU/JcLcdRRHQd7kjwWe+UGm0bwhiNk4+U+dZTB6Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pvxHIBDkzJTt1UxKaaQAXyDr9kSmATlVfRgclkP5EyybHryAPdEAm/BzUghODX2OQ35JWrPZEsaKBd6DCPSoe5eRD1DtHzgJ8Mpld7U0Ep2G4i0JQH0hUVDbumLGjwlWrNaipic4FdjAEyxDx+QoqVudM9gDXzkowgIBXkjSRAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZvrAX+6m; arc=fail smtp.client-ip=40.107.237.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZvrAX+6m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFEXvDl4xJYL0A2lAjFwWo+kFKkr+oGFKvu79L0vld1eGVFY5K+kFSpRMnmPaSz4ffLVfwnOeMxYy4VBsUf4JnJnMbxffNLhbF5I8/zpN2MXFmxMP2UT1Cqm9Cz/Hds+tHC+xmoU7/u5lsxWsm1d3E3aWpIRhGv/RlJXEWK0MjrxGKQ0dZWb9BPBya7us+z84iLsqwt244+WpPFc4qpPvtGywyT2aKGo0h1V147+zA8T2s73JKNbhF+7fpTmiZGX8irb69UNXQziJgr+pT+5jWTLbbLTo4C6fVwV3gUzRdUUdhpiFsT4qgmC2ojWz3PJI0/ksne2s7FjW+GGUoql3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UzFfsBOmsAaCbPgEyIYRN7GohAnc/z2MtFSZNzT/ps=;
 b=PeZHtVCbHVTiAeoL5MjCUu4nTP5hyGuYH4rPAdxlEa1DfuXPPivVFyNx3bNq1/urB/+hRB5om1vqOyys/QNuN6vJVYjCBkUyNW0PcHGNwo57rPQBB9ZlCTNW5k5RZB2BmewD0W1lsirXUjnQcIZCFAG08wWDFjWTvT9WLmdFb/npbHHjGg3NIpEmqHIAl80PDq4Zn4xaLUuyiW38HkBEjOwMZ4rBqf1yat6GQYbRptjYF6px/onRuqlAGZpA9XfOR5HB/9kPE/87XCW6KApq5oomV/phgcIqkFEK1t8AJWo9gJVzyAMgo71MuOzN2K9JGTTWiDNUQhJcOWblzbezNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UzFfsBOmsAaCbPgEyIYRN7GohAnc/z2MtFSZNzT/ps=;
 b=ZvrAX+6m3914dGrAeG1/GQsFYLtUGpdyG6+mCwiv+k0/u1p7BYzdszbMmErFLmHS3NzEQa+a4tgrmxNQprZBtQkpyJXs3wFCs5oMrsJfVrhpUJkKUu/b8Mwr5gUQuHVXaS7qz2HRNtuK4Xr7W0TMWa1L2DAl7ZKehMWXt5PRe90bQPABO3D9WeN5dwiTSC49/dJER1nVAkapOwjupjHapquVfS0WbmjYCg93gnn8pUaDiycxf9MpHs4K7H3nJnzBR+//pnIezG3uoCwiOI8MT5m6RQEeQGfuDUI52jFpEo+/IS3qEg7ecgIlJK3BM1VI+ou2h399ihXlG1aw3oN6fQ==
Received: from PH8PR15CA0005.namprd15.prod.outlook.com (2603:10b6:510:2d2::12)
 by SN7PR12MB7178.namprd12.prod.outlook.com (2603:10b6:806:2a6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Fri, 12 Jul
 2024 13:20:43 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:510:2d2:cafe::b6) by PH8PR15CA0005.outlook.office365.com
 (2603:10b6:510:2d2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23 via Frontend
 Transport; Fri, 12 Jul 2024 13:20:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Fri, 12 Jul 2024 13:20:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 12 Jul
 2024 06:20:25 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 12 Jul
 2024 06:20:25 -0700
Received: from moonraker.home (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Fri, 12 Jul
 2024 06:20:23 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
CC: Vedant Deshpande <vedantd@nvidia.com>, Brad Griffis <bgriffis@nvidia.com>,
	<yiweiw@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2] arm64: tegra: Correct location of power-sensors for IGX Orin
Date: Fri, 12 Jul 2024 14:20:20 +0100
Message-ID: <20240712132020.235414-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240712124809.222395-1-jonathanh@nvidia.com>
References: <20240712124809.222395-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|SN7PR12MB7178:EE_
X-MS-Office365-Filtering-Correlation-Id: 08038480-5b06-43a2-ebc2-08dca2756e8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3p+5CiPqfUZ/nECcE0oS9Xt6ERFfSd4yrv+ltgfjz6edpyvqBrdO+5KP/afQ?=
 =?us-ascii?Q?VTbcRNVybyEUdsBtwcWj/WiqYAQlM4IvZgLIHIazOFmDpsfYWUNqqRfdRxiU?=
 =?us-ascii?Q?SGdcRt5kZ6uuNX0bRMt02iOyukDbRjiF3cQhBpwACGgc5JET7VHglcCjFVFI?=
 =?us-ascii?Q?caIwDT10hV46uFjgGWvjc+jpnP2T9PIx+cCJ/tQS2y7iD3nd9p+Z43CbOWAH?=
 =?us-ascii?Q?UPgQuCikcg4V2K9YnnsJBm2700eLt5dgLtlCghllTPFRmjPimHHc8VWe4Wn9?=
 =?us-ascii?Q?a/PGkRBMdGbvEt7S49kwGL0PAZThN45e/f111JmIFxtfVRGrTPOn2yH2Krl+?=
 =?us-ascii?Q?4nLHkaGLhwMjwO28shlxLTImYkR1cPEJtESBSHHcbjiQLH76i7BLMUwKbyEg?=
 =?us-ascii?Q?r9ol1Hfj0KoyZ91c8Ubc+eoUGf5PTBOt5DCfTxKlkkzBE+ZTc7vyhkoOEnRy?=
 =?us-ascii?Q?OdidDNqdCBubJgDUEg8GwIr34Ocqa6N3yXNkLagAmPLpyXCKE5BoTXn/vVxf?=
 =?us-ascii?Q?T9ildPJ5UHYUz8WF0CrhtsyEBjW6J5XDcSde9uh+M5AxAxW4kA/6iYbScl+M?=
 =?us-ascii?Q?i+6UKHYbn6vWCUG3QJWCBJoSqGzLNgR7nEXrwwgW6DFBWkCBR9cWafpEggHr?=
 =?us-ascii?Q?R4zBO2Bf2J57nfvFmAC5aF6ybMbHsvKkyrdVSHN7CyoIRrv6vS+GHMx2+Ga9?=
 =?us-ascii?Q?mCbRKh5MCVo/7nn9F0QgZgRiPJPRzweF3rLi7fGCy4tCFEvJTaQsOY1XejN8?=
 =?us-ascii?Q?i0njBjVuafhdmgzc0HvZFoz68rScpuucK33JoEmppQ+wXHhfjTFg+XYNYoBm?=
 =?us-ascii?Q?vZ+ffu/PEPPJrFHvRUkNjOr2k6Ct2noVODalsVhe5CYz3yEHKQeoNlRtBde6?=
 =?us-ascii?Q?jPiitfaNi+pCdsKS9bQnxN7vLcLuX5gVW1VtkJKHHRuoVXCQ6PPXBBHKh/2G?=
 =?us-ascii?Q?9kUyp33rpLDCX/WovgowSKlVCI4J4wL3CS/SYD7c/SAs9e4xwsZ9XU82gUNs?=
 =?us-ascii?Q?N4ih1tcEDuhKW2CVJpgSfaFBxXK+SYWdzIu9ZWj0oDzzqqVtmHSWb0Shvsba?=
 =?us-ascii?Q?pA/CxwZPg0sDDJ9eYdJdebwC1byI4Ennyov11igqZKNXMtrWWlLBIODcMAJ3?=
 =?us-ascii?Q?j52tuC7/Ik1w+pbkwQ3DmjFq5pBme0yxy3mLgEPy3CaH53CI43BAtgKjFk39?=
 =?us-ascii?Q?9gf7Wr6GtQsZDK6VOA6/4pPP7SQYxPayq644iGn/ihbsszlLkXW+akZTZ2KH?=
 =?us-ascii?Q?vqu8ZFniiqE5P8l1GUM6dSlV8t1aHOetEJDoINvX152X6W1z4YafLKl07coc?=
 =?us-ascii?Q?kkhlVLXPWwshqUEukEtuIfwRF+tYIsVxPPmC0oSzbNMsoC7j3FK2JTgtqfpl?=
 =?us-ascii?Q?Fo//MVgnBaoIm0Oylt9MAeUh87lk0NyNvDe9cSIPBboKhUtI83yFh0Po129F?=
 =?us-ascii?Q?jxG7E8B/D1EFzXWn0QMNT09kToJVFuqI?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 13:20:42.8028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08038480-5b06-43a2-ebc2-08dca2756e8d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7178

The power-sensors are located on the carrier board and not the
module board and so update the IGX Orin device-tree files to fix this.

Fixes: 9152ed09309d ("arm64: tegra: Add power-sensors for Tegra234 boards")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes since V1:
- Updated subject from "arm64: tegra: Correct location of INA219 for IGX Orin"
- Moved both the INA219 and INA3221 power-sensors

 .../boot/dts/nvidia/tegra234-p3701-0008.dtsi  | 33 -------------------
 .../boot/dts/nvidia/tegra234-p3740-0002.dtsi  | 33 +++++++++++++++++++
 2 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi
index 553fa4ba1cd4..62c4fdad0b60 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi
@@ -44,39 +44,6 @@ i2c@c240000 {
 			status = "okay";
 		};
 
-		i2c@c250000 {
-			power-sensor@41 {
-				compatible = "ti,ina3221";
-				reg = <0x41>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				input@0 {
-					reg = <0x0>;
-					label = "CVB_ATX_12V";
-					shunt-resistor-micro-ohms = <2000>;
-				};
-
-				input@1 {
-					reg = <0x1>;
-					label = "CVB_ATX_3V3";
-					shunt-resistor-micro-ohms = <2000>;
-				};
-
-				input@2 {
-					reg = <0x2>;
-					label = "CVB_ATX_5V";
-					shunt-resistor-micro-ohms = <2000>;
-				};
-			};
-
-			power-sensor@44 {
-				compatible = "ti,ina219";
-				reg = <0x44>;
-				shunt-resistor = <2000>;
-			};
-		};
-
 		rtc@c2a0000 {
 			status = "okay";
 		};
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi
index 527f2f3aee3a..377f518bd3e5 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi
@@ -183,6 +183,39 @@ usb@3610000 {
 			phy-names = "usb2-0", "usb2-1", "usb2-2", "usb2-3",
 				"usb3-0", "usb3-1", "usb3-2";
 		};
+
+		i2c@c250000 {
+			power-sensor@41 {
+				compatible = "ti,ina3221";
+				reg = <0x41>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				input@0 {
+					reg = <0x0>;
+					label = "CVB_ATX_12V";
+					shunt-resistor-micro-ohms = <2000>;
+				};
+
+				input@1 {
+					reg = <0x1>;
+					label = "CVB_ATX_3V3";
+					shunt-resistor-micro-ohms = <2000>;
+				};
+
+				input@2 {
+					reg = <0x2>;
+					label = "CVB_ATX_5V";
+					shunt-resistor-micro-ohms = <2000>;
+				};
+			};
+
+			power-sensor@44 {
+				compatible = "ti,ina219";
+				reg = <0x44>;
+				shunt-resistor = <2000>;
+			};
+		};
 	};
 
 	vdd_3v3_dp: regulator-vdd-3v3-dp {
-- 
2.34.1

