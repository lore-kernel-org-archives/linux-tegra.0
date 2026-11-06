Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793966624;
	b=QsXxvZqBPb3F9nPr08lHE+bSL6hUsAN4P7FPgtO/HX/ShfMmb6nT1brpBV7RfM2KKhb1
	 u7Bzn1znMojDf95a0Q+MJXqOlDcFPVtaJpRcL876w3SqnMeRgEfULsbTZSTAloVzYBtuP
	 AU9qJcXMi2HZ8+DUkq/WtX/PoRIY7+nulYOwSxIJD1F2NcudjAy3iLNIs+ZyKbZxb0lzP
	 LF6nFvI+t6lVpHc1tv+F5EAs77SOc1KhawSCM4yYAj0XlJogZOLC66HhZOo3k9FCRZKdB
	 i42Dkelp+03WfqBHXRsGodEpX839Sg/pkj8Pkyg2xAVj3Na/Br6zrxJXyjDhU7sN0IQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966624;
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
	bh=53HvwZl7z5KpwfbLqerVGFO/9S22ITSxXfMwWnORnWo=;
	b=05sji9VxhJSCPvqhxQpVbSiu4EiV/3Stgzw1HsHQQ2eF1iKgdxVOWi/Si5jej07lvnS7
	 89G8aAs9/9BelbUYq9HDraeWVwdrnLjpJmQb/pHK/lhru2ax3UKe+aL+3mkL48M2YvcQS
	 oeTTnWvXkkFj1r1oEyt970oHD1/WCFpmOAzoMMkLokDh5fHYZS59KxGesDBB6tMtg7Ydg
	 C4HWuB1rjskFsK+awKd6VJOzes0mAYfFFXmGYGwgdJ5DySojAswEZYG/twLkMZYHFsasg
	 OhXypzdjG7kKVnBwYPwdXZDcQciosV9ej6kJg7nuPQ+Vkn6QBl30tDSIf0sRugFArmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Xhl50DQp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.63
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012063.outbound.protection.outlook.com [52.101.53.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E9A606D82D;
	Fri,  6 Nov 2026 12:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57E9A606D82D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Xhl50DQp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQ4hODagWhj1h1noa/7FY3tuy09oG/g+ITYKSEDAHBxLgYgBIwP3W6dQwV83pRzAghX3wcoF7EHIm6ydTpY2nFecA93SRGJxUS6VKIKO+q3PmGSiToZropSruv1Raoc4t/tLtXtfbc3iaBxWvsm7wdgzUiGz8TgL01RvZMKmDu/nWF1VbsAcEMifs40QHt/yC3TX7gWWPuEw2a9r9UifDQNorZfhC0hH2iqaeUKtWvEVggW7e9z9/l34wfoYFtZNdv1336LP+DSI1/JX2AN4BTwmEULUcP7GhpZrKgNoMyn5/HLfSyGUFmKTsDhAacbo5+zT2KhfRp/t3Nh2rXHoow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53HvwZl7z5KpwfbLqerVGFO/9S22ITSxXfMwWnORnWo=;
 b=kuCmjU7eICGyCGVtgcA2xpX12tiOFQUiJI8hWPuWLZZcq+EBLfRuYNPXhSpC/Ojaxzd+Zhw59Ml3koNztq8KwJUgyk9zRnkrhCiN/SoN2fnvAgIrE7PG8Eskc7i4XM0QQeAssnhRv46+W92wlDmhQ0m15DzYa1Qr+6b/E7lT04otsC7NB9hvwXolv8HDrrhAcCcc6v8Pi+/NVuSSzBoEh8Uu/g9cjU2H33+LhjmY6bJ1OB7cyfDyAJZYGAFN230VB4KFMbQU1w8pgdPbxzP/LCySoWMFJcaSv4Bzx2uqiNrcEIJlpxsOAVpxruofqoTIaFZr7MQCigQ2NZywqyH23g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53HvwZl7z5KpwfbLqerVGFO/9S22ITSxXfMwWnORnWo=;
 b=Xhl50DQp+yyJKm8v2RUPKJdmjfKcgmrGy/RgWgWhicDCGjxo+2uGj6EEzc1OFc+AKOLhoWbLv2kes2016okGHon8iM248peiTze6Xczv6FODgKBPNGdPz89c3GGGOqniHZRwtwPWa5OUaq9HMmzjCKHK5rAu701n6lSwwVyPlUCZ8ggQauUzgPVWI5IRH8MfJqGyw3B75k25MGkuybuZ8DXAYf2eNp58QnTPdd7louHtfa3gnB4Tsx+k6ScufVStCKjBh5pAORuUO4VcB4t2WsYI6tZHHrdl8fiztDeZ1sUQlRyOTmVh8fJw9IZQU4GpsjbsYjxVMCARxB63KGv6yg==
Received: from CH2PR19CA0023.namprd19.prod.outlook.com (2603:10b6:610:4d::33)
 by PH7PR12MB9201.namprd12.prod.outlook.com (2603:10b6:510:2e8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 12:03:39 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:610:4d:cafe::8) by CH2PR19CA0023.outlook.office365.com
 (2603:10b6:610:4d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 12:03:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.0 via Frontend Transport; Fri, 6 Nov 2026 12:03:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 6 Nov
 2026 04:03:19 -0800
Received: from [127.0.1.1] (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 6 Nov
 2026 04:03:17 -0800
From: Jon Hunter <jonathanh@nvidia.com>
Date: Fri, 6 Nov 2026 12:03:00 +0000
Subject: [PATCH 3/3] arm64: tegra: Add regulator for Jetson AGX Thor module
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
Message-ID: <20261106-tegra-for-7-3-fixes-v1-3-e62053cbda3e@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|PH7PR12MB9201:EE_
X-MS-Office365-Filtering-Correlation-Id: f1c83618-78f1-4ff2-abb0-08df3bfdfe7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|11063799006|56012099006|261022075727099003|261102123227099003|261021121427099003|261009223027099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	zTiiDASeIC/fxTNO5oHAjwb5IMTv3P+iuyjCHLABBbenyQfEUSNqJ0o+7peMjX0/h9CZytFvfhmDCHKf3QhCat2y0/2ogMo0NtG5dIwAjJLJh9coQ0Mp3uGlsshyll+FR4IDYca4HlOjj43H51OQjVRD9ec4x0S5x65dfS5u9E2JN+28+A3wTaly317eXL3X6FLYup+DdgwVFC9uqkxv3+Lrtx7p4mmeCEybI4NDI1XLxo2MAXtjS8wx7xgFQzClgldbVw6nXAJ6GJj2uKfzL0JfVNitmptzHcvofKeErLYOVK4lI5FTtO+B22yfI2gKSD9N4nCTwdXGF3Qg+/GfIRTL9tG7kbQvmsqHSWnjIKuk6367riVjmgF/Io3L6hGlXR7wRpaGC9bPE+hcvKQCG3UCa6kUlSXPiETvJW70VmUD+6sG/xqwxoPh/wvCTJ1PCk+GlA/Q5wQx8xyZAD0JAv8DqhBZ6jBi7Cbq3/XWgmiZ0qQ5FpejPjkaA2ikC/M3S7wwellAroTrq2mr0QjV/wbyqtZBhrQLBhhTbu5w+QiT7YIhNL52CObhs2pzhK6r3lAaf5eLFoQuhqf2yHjKb19SdzciW0Wgn6V/ZbhBwjH0GbNDVt6CjO7izwymV9tHvzMjxWlS8fmW4uhqBParDtgr4oUEX8nEa34i+whKK6SsjkrOcixAJjW8lCcW/iWTE7wyimLhJHMUlOh4EDpTbw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(261022075727099003)(261102123227099003)(261021121427099003)(261009223027099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AO/eQHmAAoBcjbXlsA15hUBeg+li9ZYbl94akecz/TnIIKYw2vcEhkte73FK3f+0tBG8wj3ySbgmL2dqhzoZxstjYujWtrfdKbSfZcRKcA7lwi8jfkR5IEgprfEml0apjNZVAi99mbgeASwqGlgfC42OwlmMp53SL5rIged7qhYrrqz62ocEZAt3sHc9WbMr5W0tx3WpouO246Gj9fmoizOgijfnD7lemMW2kHt+6wzWz2jctNtslabN9p5ZTbbsyWIP4xb/xv3MflCqFJJupnNpmVO9+wA0CryE37+XtOSIJPNMJGuRWzMrCkKB8mmyJPYjpfaolEiydi69rR+ZGhDbRIC1hNzxfPN5ZnqwNztNjDyk+CP118VgcKtiKPTx3VCcHKPTab2RREtCMdZ18XpMBrasIFeypSNmARt27lhzHsShPp4ac6QC4R11VSdn
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 12:03:39.0617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c83618-78f1-4ff2-abb0-08df3bfdfe7d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9201

Add the 1.8V regulator that supplies the EEPROM on the Jetson AGX Thor
module to fix the following warning:

 WARNING KERN at24 1-0050: supply vcc not found, using dummy regulator

Fixes: 056329beb73e ("arm64: tegra: Add NVIDIA Jetson AGX Thor module EEPROM")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
index 707e2e79efa7..765d1c62c597 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
@@ -46,6 +46,7 @@ eeprom@50 {
 				compatible = "atmel,24c02";
 				reg = <0x50>;
 				label = "module";
+				vcc-supply = <&vdd_1v8_ls>;
 				address-width = <8>;
 				pagesize = <8>;
 				size = <256>;
@@ -66,6 +67,15 @@ thermal-sensor@4c {
 		};
 	};
 
+	vdd_1v8_ls: regulator-vdd-1v8-ls {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_1V8_LS";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vdd_1v8_ao>;
+		regulator-always-on;
+	};
+
 	vdd_1v8_ao: regulator-vdd-1v8-ao {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_1V8_AO";

-- 
2.43.0

