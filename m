Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793966618;
	b=qVBrFRbp5NMgyJYcSYvi2g7A6RLwq/rOQU3Gcqq+Aj4l27z5Fu999PzgzbLgysk9sWu6
	 2cgOxTo86Z7J2N/IkOf/83gf2svP3iGZ/4STvC+2+InCnkoLqstqpHC/yP5ehGl+cRVSY
	 7qfl0/OeLn0WlX/kcJSnb0HHBlL43GY68mMinHk/5rO2vkfOKPudPAUpD5R26y0oNfp/7
	 7j1hyEztiJ05CpmK0EoU6ijoXM6WZEZ8QAG2Pvn+VjXw1AIF/E4ST9wMtF+OEzOxTvSJU
	 D+bxptX2dT2LJ4H5UbOVfxI43tBz6PwhUzKIzBKwY4HU8bYa4TIFtKuODUgHJAtrsrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966618;
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
	bh=37BfEa50Wq6kXHq9n0yC9RyAQ7rtoll3DH3b6wNwnMA=;
	b=zkRa/FYnNxyC/2hmoquNOdvV7HCZgI3DbNhqKE57aXET6qwyXEGLpz6mcc9qoJUxFM3R
	 DXA3uCT5MTtOdZi8nkaHDhk5Met4YQAFjopteK8UvKZDpi6ArROPE+Vmytkdz3WpoXTql
	 JI7J6AuC+9zAGTZLl9yB3mTcaVyB/7ko9pTGWTV4NZcvaFW0XFOTSXRWSoCYOOzZMg9nc
	 sbF3PLB8/3c0lbMZbSp+qZyh0mpPVYNVl6dM2QGpL5A6lQNbcNrls6AWpgH+E746VFbUi
	 czWaok8dkjqsTgxQKaSU+1HkqJAVJ2ddWEafN4TNe+JA5f+Otbmb5gG+G5IXrNC00pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ISeKmIns;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.34
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011034.outbound.protection.outlook.com [40.93.194.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D7A606A32F;
	Fri,  6 Nov 2026 12:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16D7A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ISeKmIns
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qC7QoAu99lekWlLkivgTMqAOhemi9CE7KpY1FvQyrEaFU3EPm843ekS/eK8ES8PPW6WAZUrR2qXg2SSVEHNpL8w7uR2WRjKRbXspBgdjfo3hhgZdGiFfRFTIaDZEpw2RwtCxFPH8q6I7+fMdltkyuuqbfPA6GfjfbCi+CtlY9rEeOy0DO7T+xlWRKu11Dz++KTCCJeHoVfFQSlYYLuUJ4jIkRoqZGFCYtsM5gt6USnAjT0pevt8iOwx9X5Z54l+xSQS9y90UmSKcgeN2mqHrrbbrB1+5K/lU+XX4naGNRPdTEDfR99fC7A1QslQXvVW64Ac9dQmeH0tgEYiHHg1ekQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37BfEa50Wq6kXHq9n0yC9RyAQ7rtoll3DH3b6wNwnMA=;
 b=EGLhzmelc48+VI+fAhbZbqraKbHZvgI0eoFB9qUKsCH4CU20cpu7P8cCzPO99HjJKJhjqjdl3QgKlJlAPCCbDN8Av5JUj8THF/0fAy+WmBfQzi7fJjQZj4Uf8dHuutlxYsXb6U9EbXVPpSh6MKsyBZb7XrUEWbVLZTwp3LmECmRsp2p35PPm6Y/PJ4vtpwIkOErvTPTNf7MA7AgrQ7GtljycP496qgJMduop5uekiJjNg2F6ax4IaAxr4QACqa9+goaSyxE58R/XKLYmlcnPHV0s64NNGCG4lx2j/78ILfyGHpzQmqaS9Zo1O18BMQpXgIPhIYBryK9sIS/m1N491g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37BfEa50Wq6kXHq9n0yC9RyAQ7rtoll3DH3b6wNwnMA=;
 b=ISeKmInsfSQcyLvYKZTqLrLrP/7a13W3JYPzup1py3DCe6LYCAmO9Vj5CBZnShEDl+VPKxINwUgofWMq0Exu/79+VJ+lT91ObZ/3EOyITnLQqgngmPxHJ4NJ/KtNMghAX68bIFWC3IipFUxo3YiCM31Doj2WJyFT6+N0j83MZr6IxCCZf7o6/4vCSUKvdyDbZhrIQHwlCb8qmPPPPDXPzJynL2QWKxkW5p53wei6q2PPCqsJh/9axl4J+PZn67IitSmiIPFanGoWgji0bTWHnp8KZ68DzirWDUfryZvx+msHEMR1FJCoEkX5f51Vl1HbfegPF+tMgIuwgoSezIrcmw==
Received: from BN9PR03CA0250.namprd03.prod.outlook.com (2603:10b6:408:ff::15)
 by DSVPR12MB999261.namprd12.prod.outlook.com (2603:10b6:8:41b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 12:03:34 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:ff:cafe::39) by BN9PR03CA0250.outlook.office365.com
 (2603:10b6:408:ff::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 12:03:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.2 via Frontend Transport; Fri, 6 Nov 2026 12:03:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 6 Nov
 2026 04:03:14 -0800
Received: from [127.0.1.1] (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 6 Nov
 2026 04:03:12 -0800
From: Jon Hunter <jonathanh@nvidia.com>
Date: Fri, 6 Nov 2026 12:02:58 +0000
Subject: [PATCH 1/3] arm64: tegra: Add regulator for Jetson AGX Thor
 thermal sensor
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
Message-ID: <20261106-tegra-for-7-3-fixes-v1-1-e62053cbda3e@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|DSVPR12MB999261:EE_
X-MS-Office365-Filtering-Correlation-Id: 15bc2286-94e5-49c8-4848-08df3bfdfbb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|18002099003|22082099003|10067099003|56012099006|11063799006|261102123227099003|261021121427099003|261021123027099003|261009223027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	NW/Wp4HNfr38XXBQ9kiKpFd1F2oVKphGpMLAYbspCERrGfcf3dS6TO7YvVbtbsYoNkL2UEiAbr6XFSxtl0qYJLAV26NOuzr7RNYF+/5pVveI6HZGnB+r7HwZMRiJPU6V+mjb72POIQz4Ap+dBev98vxJB34GNYUvZQodX6PcUfaJAhSdt7QqGMa9GGEIHyW0LsVJFiRbHF2TgMK7LGlLAAM9PWCkNgBIvf/wc4Fb6OE6kgHOb/yel924IseS959uHs0nysIq+6DANzS0c6A/61I+Fl+8BleVxoEDnyMbnbh04wo8P65nFINhZIlRNBKrVk47Lj8Jhg3HKYtuNRGJlJl54gHZ3lTMl+TY8zDVD2rj/KoGxUpoRLFJSGy4yk4c8egM8LlrXgRviE7dWrZ/m/zgcSStT8hJgfhqyfPoOtE4AWNJoiVsaPCR21ANEIqIccwjQ0A736KUyvkr5xv4vt+wIP8UeYNIerzm71E9kClaFn//9nRV6GYKP0Hi62HVv7gnbhlMMt3+bXm9ALsYwwBtJUMJTiJbw9KzCaw93Fqio/uR7Y5nOVZxadazNUxw/AZApVuojMMkBtPpwx4iHpOaNYx1yn4TSkN2pDvZpd8ttkZVaaS7xK5DdHptP3sgrk7VuzusaxsxBfo2PS+g8nOaUHMyvPTug9oblRB+1UUvWIzO+H/n1t8LWCl+ufEKOQKXXs68j37z43+THnmuPg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(261102123227099003)(261021121427099003)(261021123027099003)(261009223027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0YnDXQabQo8SfwBqUSiiFuO0xgxeCrclo6Z3zsohMVooFf+lRSmkPmITA/B84v48Qzlim7JVQ52fkCcMkrljadX6IDSenTC8dICYbCOzeXxTGD6e479yaRiA7YpYl91tY+/IfHqSodiTJnBGiLCtEyIxJ0HfYeUn7cS1yTrsKL2SxFIQ9YDfFw0vlNB0zkpfxSTIqNEgQAeXjkdE2bdLtGH0gqHU/cOb2jaCsrNnfU84AFKfln9dISUuy67mY20TYF47AT+RThajR6E/U9iN495L0cJMkBPtixXBLMZ7cicptSdzfXDiixAzqUpUvyOJpq+iD3ahlFiYbLEUr6GH+YBGWB+5671O9exkN70Q0px6BaFtZ4cmZAzVJQX89qU4Wa1DeX3Hn2rc3RFV6rbJJA/VvtW8Nik8woYjw29iSUsEiel/oQXX5kM0fIkXMyG4
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 12:03:34.4033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15bc2286-94e5-49c8-4848-08df3bfdfbb6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999261

Add the 1.8V regulator that supplies the thermal sensor on the Jetson
AGX Thor module to fix the following warning:

 WARNING KERN lm90 5-004c: supply vcc not found, using dummy regulator

Note that this 1.8V regulator is supplied by a 5.0V regulator that is
located on the carrier board for the Jetson AGX Thor platform.

Fixes: 56bb69f9b003 ("arm64: tegra: Add thermal sensor for Jetson AGX Thor")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi                | 9 +++++++++
 arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834-0008.dts | 4 ++++
 arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi     | 9 +++++++++
 3 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
index f39f33a66cd2..707e2e79efa7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
@@ -61,10 +61,19 @@ i2c {
 			thermal-sensor@4c {
 				compatible = "ti,tmp451";
 				reg = <0x4c>;
+				vcc-supply = <&vdd_1v8_ao>;
 			};
 		};
 	};
 
+	vdd_1v8_ao: regulator-vdd-1v8-ao {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_1V8_AO";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
 	thermal-zones {
 		cpu-thermal {
 			polling-delay-passive = <40>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834-0008.dts b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834-0008.dts
index 3bd4c4cf2871..d598c6925773 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834-0008.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834-0008.dts
@@ -20,4 +20,8 @@ pci@8480000 {
 			status = "okay";
 		};
 	};
+
+	regulator-vdd-1v8-ao {
+		vin-supply = <&vdd_5v0_sys>;
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
index 9295f9c81296..0ed2335ea91f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
@@ -64,6 +64,15 @@ key-power {
 		};
 	};
 
+	vdd_5v0_sys: regulator-vdd-5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "VIN_SYS_5V0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	thermal-zones {
 		tj-thermal {
 			trips {

-- 
2.43.0

