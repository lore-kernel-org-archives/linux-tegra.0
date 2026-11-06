Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793966622;
	b=guIYqMT6wLL5gDd74rJ0tZInTYr6EOOagQbY0hDjvh5WTXgz0ux6G/LQlr4QLiQ1Upht
	 hCL01qEFMlv8j7Cg/sIPJ0jfuKlfllowF5g791fhsJwrgpq4Cm7tySzOYKUtQYu6mN3mM
	 39KoGa3Zv8W85ubNaSamzH212ec91NeiT18jOawJW3AQUiThGaxpXMMOl2H9VBrUHxLvr
	 nMGTlcDCklCdmPYghKAxngf7lv4ZrxJmqx8SbsizVod0jE1qNKV0wkCbgy8B/8E4qmLzz
	 W7E0t4VWtL+CvGvlvybgLZUT97xpNZvC7QRaxHfb1TGwW+4IUqFYTXb3q4l7ZunGZig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966622;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=qJwap62vW4ndVUKS5iXhhuZyYnjZ+OmxpXt6rVoNp3A=;
	b=GokbrNWmeZXV4lEAc5BCKPhSpxgU7Z/ObkpXbyMYeYkQpWa3Z3TcabhHqXdtaxerKRWw
	 vnfQQllMl0XjAVgIL3ENq/YdfbK5lxqvNDLPoMdLWJMlV1awZ4aLXlZBksPqGE39dPECe
	 H+eYPO0KTzBLHN/ZJDKItY/wSBnt4e7gYJ1eKSwRLEmAgxIr/QpyLqypox7vaq4p+UlpB
	 Gmeg7f+kJGZjXh15KTLsoED8Ww5s34+Ugto0MluovbQOwvNDsn/mO9znXDhCh2GHSP89p
	 bO8lbRDD2Lsw7rVJYrFGAPF9DunE6jqEQd4BijTCCX+lCk7b1Llm7fP3OeacUXu9WZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="AJgN/Kiu";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.28
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012028.outbound.protection.outlook.com [52.101.48.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD16606D81F;
	Fri,  6 Nov 2026 12:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBD16606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AJgN/Kiu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdbtbHtNGJf2aedn4bCySQpkrjIg2TeT/aLFDJ36KFjL4fzr8MDmSVzBowGfv/NhXxWfd33arzgs/hdoGIQn/n01GnSf0JK7wl++Wh1ERQsLKCT/Cm3e3LqGNlLaxp4xm74jXYXM9VEia97fjg7JAPC4dqgsh4oG2SAONN7AjFtbUTedCBVpnZyOF6quw2stnRJ6mDs1uonB2lJbStnDzPyIYuOIWLDUfP7Qjc5H8WoHUMVPw07n5A/TanR/MY5Wqdr+TGN9dJ4lv519CrQVyV9tkkh9/ruxuNvGkUMg9geawNKTKEKCxOOZF5uoeJtv13X83vfZKEHgfMqr3QTKhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJwap62vW4ndVUKS5iXhhuZyYnjZ+OmxpXt6rVoNp3A=;
 b=xoPygWwkcpw25XRBHekB2wIBL6COsVWjQ3H+IXyQkbyFKM245WsnZyLca64boVUstJ/GtHny91rNQuzlDQz/HrRuycigcejw0w8rvXVUyLS/TcW4ZGVJBl+UeOqDlLYvI37W/ES7/1tn47+yBwFTBllQiASFP8071LMyjZ7Ym43J5NFbJHv7cSAv9MrIYjXA96cRZw+MHpYO0OVXpFpk4y35a1RbcJ0XJqxM22OQWWnglrDS0sC8RyjR/1wIUVErIs9lXVq/KcbSJK7AGmyQkQHz6Q3w3z+LsXq5onWQpRao+UMJ9jy63PLIE/WGXvoRwQ+MID1yhGRimsrYaQXZ/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJwap62vW4ndVUKS5iXhhuZyYnjZ+OmxpXt6rVoNp3A=;
 b=AJgN/KiunLY/PdQJMe0SK3VzWXQU4KW/DTg747aiRC8NeKv9WSl8hHaZYPSPs+co3CrS0oGP2O+CrkkmefLkx2eOsyklPp4w3/2FCmg5/SE7ac7krMiHJJDnI94KJlFvPD7/DOA5YnRP4aOjGvIA7F0YGaJsrCnjbSwPKHVDhd25i5uQlcLh/H1H/WhFNs7BPhuAhSPcsUvlRxt2xseMGuhG2INVX3H7JlItG2Nu8XN9aTJxJC74fiunZXW/IjccXtcnrdlwBYQU4bSnzkbXA7gRdRRNF8Dk3YI//EkVwj1hBbc8qAT9QudheG2oa7FqlZFfZAEH4qAJ0N1QhfwXwQ==
Received: from BN9PR03CA0251.namprd03.prod.outlook.com (2603:10b6:408:ff::16)
 by CHAPR12MB999247.namprd12.prod.outlook.com (2603:10b6:610:2ff::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 12:03:36 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:ff:cafe::ab) by BN9PR03CA0251.outlook.office365.com
 (2603:10b6:408:ff::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 12:03:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.2 via Frontend Transport; Fri, 6 Nov 2026 12:03:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 6 Nov
 2026 04:03:17 -0800
Received: from [127.0.1.1] (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 6 Nov
 2026 04:03:14 -0800
From: Jon Hunter <jonathanh@nvidia.com>
Date: Fri, 6 Nov 2026 12:02:59 +0000
Subject: [PATCH 2/3] arm64: tegra: Add regulator for Jetson AGX Thor system
 EEPROM
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261106-tegra-for-7-3-fixes-v1-2-e62053cbda3e@nvidia.com>
References: <20261106-tegra-for-7-3-fixes-v1-0-e62053cbda3e@nvidia.com>
In-Reply-To: <20261106-tegra-for-7-3-fixes-v1-0-e62053cbda3e@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, "Jon
 Hunter" <jonathanh@nvidia.com>
X-Mailer: b4 0.16.1-dev
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|CHAPR12MB999247:EE_
X-MS-Office365-Filtering-Correlation-Id: 61a23cce-bb63-4641-4706-08df3bfdfd0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|11063799006|56012099006|261022075727099003|261021121427099003|261009223027099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JL/HfVKU77zLDfNFfyjrfdchcIVNwkr6Zwx9CzI+DhVfhNILXu2aMC3EJVdpDhY2dlYn+FzMqaHukXY+bKna3Nduc+Afx8dqSReVpgGpJ8QT16XgUMNlq6hBW+VtJKsoxPrZ8J4gXJCPZMfN75+RYkVSWFiVBQga1u8W44wC+8YBBVOknA4erHfCeaxY0xzd01MoSn1AIRdu3j0Rw7PD3wps8vn7wmzEjbRqQpeaPJiTlKEs+N6CsH1JCfBF7dzqke/5pVxkapQnTNwyYoH0QCLHGHqaz2rD+oUlmeMXUftHsFwNutwUuum8N8NzZzYMO/8IqXq3hLxqY31GynEus5CaotCaR0UtUcKLj0GWh6csFKqt5CfZXyh6CCTSDqrWp4k7bzRFQtO20UFzOjDKQRjw4fAa9qG1/AlM9ObzqdgOnKYt/jvkvoLeoIGc9+cIiFOcuk7VFrsdqfQ1n+Kwd7wyw5MRGvxwyW/xAIxRmDlJ/BO3MN6XOBc0Ts/OLltzcVrdpbPO8UBcwiLWSLOjIV8XsuBlfSuswWWpqMtsGEmJIeNBJK4hlFJbxBp8n8pqjbIbwu+zv0RDu7klEBs6HfFMSyX5zL38bIax6Tu8G1Ai4hkW1T7xsMnIa1DMlxNP53oZnDomY4/apoPklvjHWTNFY8JezWWl6uSRHWXOIgIJ4WfLglvuBaMqRc5wA18jkmdsodsTXtgyMaCP1cNSlQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261022075727099003)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uFvtWeKMGhb9EUL/Rib/DaTft9jE2yd7SsUGxZGVnrSOYQr9KzAwiuFnSkuB16oHB0HjNiqtyclFMSZx88+XsT84qjeWq55g4e1yEtMP0E16f1kSc68iE18K0XRmjPMO51ZVnQ5CSjZ/87gAnf4TX7sxwOSTt5tRO+TliZdLmigAcHWxCvTGekJTBq7f153FWfXjQly1X7Q1ZWs8OjZSDkgruGQvrYJzNw2k3DU99hrHnZv8PWUCeZOWP6dCGTK+kXYGkIqcR8EQ6jgIx15tohiompCPP39cmTIIZDSp1hcSFwYt4/+sWtLJ2g2T8KTgHcxq6tPLdEvY/CWPjEGbu03MM9ddGhF1tXNyD7wLXPPvqX8tX2gYx29SSMoXvzyKhTUnm7l59ZCFGx8SShG6R6Ygh/hPR89+d2yQ6BV7+dB2Qc4BoyVJSTQBz5QnyAVa
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 12:03:36.6502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a23cce-bb63-4641-4706-08df3bfdfd0e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR12MB999247

Add the 1.8V regulator that supplies the EEPROM on the Jetson AGX Thor
carrier board to fix the following warning:

 WARNING KERN at24 1-0056: supply vcc not found, using dummy regulator

Fixes: 6285ff371e83 ("arm64: tegra: Add NVIDIA Jetson AGX Thor system EEPROM")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
index 0ed2335ea91f..8b9108634ace 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
@@ -29,6 +29,7 @@ eeprom@56 {
 				compatible = "atmel,24c02";
 				reg = <0x56>;
 				label = "system";
+				vcc-supply = <&vdd_1v8_sys>;
 				address-width = <8>;
 				pagesize = <8>;
 				size = <256>;
@@ -64,6 +65,14 @@ key-power {
 		};
 	};
 
+	vdd_1v8_sys: regulator-vdd-1v8-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_1V8_SYS";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
 	vdd_5v0_sys: regulator-vdd-5v0-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "VIN_SYS_5V0";

-- 
2.43.0

