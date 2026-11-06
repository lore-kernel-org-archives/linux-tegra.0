Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793966612;
	b=2fTVeHuco+ON14Zw/u+P1tA76HPpC677a3O5fVPGcn+QUgg4RhCsaw7NscCc5Dgnz9YA
	 nc85MVw4+XEY9U+NygS0q+lkL4Sy0g//bFchNnKfaQYMs6LKy5BxA11Bfw2FC06hVNd5z
	 8lGylFzo2NTrSOW6r4erNqn239T/hqzx9toq5hAQs8uK7ptXdg0L+dg4wPAF4DTWaLHIz
	 Tnf5qKHB/Rru7e+h3BG2B4TVRQrVd75A+VPJrq8N5hx15quXJ6eztga/9sGU72F+iYYPF
	 lLvoM/FhgSxSMucDs2H+MB9mrRT51vTOn4/DpZL1Ep9CFe8orfnTuHE+WYApF/nvE0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966612;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
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
	bh=ycpCPnE1RYB21b4rrpxlFM+G6uDI/4svYx6bTjTPlbw=;
	b=O2Ru2GB/FUZ+fgd3cUf3zJeczsHV5ATwdiPeEIfnoY2eslCQBLxu0Ir/KCeBoHsIPWJm
	 nA6Js3k1Cfh/2XvLu3NOgiyFD08rda/9yCUC/7FgIG/EMC3q8ZRxUF9Rs88GU0hCwXfp7
	 X6XwrD4zZaA3baCKqHSJrFFQcOseKRCqB0bsK8Hwmwc38ZR+LeVkeg+swYrXPfJdE1meZ
	 QS6xM6u+Z7FgMcSV/x5xGolz/IQH8qtdwEBmfoZUs4DSSZ3I3y7oBmxrfsDB+IYJU7Vb7
	 h5r58Jbkjwb5ZafeqWkIAdMjOTQWPSQRTgH3X2/IQSYl6dVmEu8KYDYaNfyAK9hquYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LCQdqO36;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.46
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011046.outbound.protection.outlook.com [52.101.52.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B7A606A32E;
	Fri,  6 Nov 2026 12:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19B7A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LCQdqO36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2Dlrc0018NeT46KQi/wA0szlYx3HXLkCSJh/iGlSBSwspbNWnevyuUb33B7RndM/lvN2YgBGKcbpD8rNkHANFoSQ+2Y8DEekkw83l1r7WJoCDw1/+aZDFHlN2hJ/iH/zJxxeONbay5AMRyVm4eBEmz/Ul9s55LNevneLx2Z3vXiyPXA4VmOyx8pYTeb1L7kTnvmHekDVEfRS6WKaT5b9S8GvHkGsmU/SpM3e208OJIsl7APzkR53Q5JeMtGftFWd84BctTKpXNgt1Te0YhU/9yLRH05IolA/T0h/sUV4egppB2PtN4aopk1Ha4OCClrufGMDBhCGrJl3eVbdMWCxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycpCPnE1RYB21b4rrpxlFM+G6uDI/4svYx6bTjTPlbw=;
 b=Ru84ciFZijF8fLcVr90lUBl35uCM/RtNs0TZtYwqYs0niqhjpZE6wv6yPgZSAkj80GHxynbe7f7hYtS25pcwC0QNAShIBFhxWHIQb/PXaBBEtfbuagxpDiZLayVC5pFUrS+QxDaC0eC13+l/selukkXpiq6roPtOV4PlFYjzytI27tuzRg6pH3ipbLhLO4jty9BPvBbOk/eQyZLBuIqT1tnPI9JpXEI8OfcH7XZL18OPRMUrngDSf9/AdISWB96N5HX3Hz8RkSeAJPtkYecJk21BTPeNG9aK+5/CGfDMTAhltf0PsrC0cYQq4Rwto2iMYJu11EdlLiE6VqTQ6e3E1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycpCPnE1RYB21b4rrpxlFM+G6uDI/4svYx6bTjTPlbw=;
 b=LCQdqO36Sqkj+LLsm7SPNir3xMxNdFB588PmU2qgaMQrRxG3aoVu1zY41o3HklXXTt5aqJZEym91JEbzGu3/KFAuWxKckd/An39F7hCvHpjQcODDywkpsNthRjx5MeOjas+mif5FApCB0DlL4YzbAiNb7Dch7sXqGESYOJcHp/qfBGR78MqAOgB1wWYUjrLfuxNFdGqcuRkLO7pYpbS5JzUzdyD4hIziJOQeyWWhW1P/v9Gc3zlxVTXGVVhWV42SJvXvWSZJJngnUY26dPrOOjQm43jYIJnaOPbMrq6XpcXldXJDbziNfLAH7438YIPEBXGW13qo4NiU5v4pmaXqww==
Received: from SJ0PR03CA0250.namprd03.prod.outlook.com (2603:10b6:a03:3a0::15)
 by MW4PR12MB7263.namprd12.prod.outlook.com (2603:10b6:303:226::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Fri, 6 Nov 2026
 12:03:26 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::3d) by SJ0PR03CA0250.outlook.office365.com
 (2603:10b6:a03:3a0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 12:03:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 12:03:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 6 Nov
 2026 04:03:12 -0800
Received: from [127.0.1.1] (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 6 Nov
 2026 04:03:09 -0800
From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 0/3] arm64: tegra: Fix missing regulator for Jetson AGX
 Thor
Date: Fri, 6 Nov 2026 12:02:57 +0000
Message-ID: <20261106-tegra-for-7-3-fixes-v1-0-e62053cbda3e@nvidia.com>
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
X-B4-Tracking: v=1; b=H4sIAPHB7WoC/x3LMQqAMAxA0atIZgPGolKvIg6tppqllVREEO9uc
 Xx8/gOZVTjDWD2gfEmWFAuormDZXdwYZS2Gtml7oqbDkzd1GJLigAaD3JzRBme98QN5slDOQ/k
 PZZzm9/0AzUa6sGUAAAA=
X-Change-ID: 20261105-tegra-for-7-3-fixes-9fa9b3b71b19
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|MW4PR12MB7263:EE_
X-MS-Office365-Filtering-Correlation-Id: d29d16e1-cfca-4629-8c41-08df3bfdf6a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|10067099003|18002099003|56012099006|11063799006|261009223027099003|261102123227099003|261021121427099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	3oHYI4NWkFQGxLe4smV2yk7P2kp+EkIQNwG882XwYiIYIjvEOYCLy/j7ksxshVvjByUu0boeEEYfbcivRSP29mqVMWyPnmNionUsatOy6xZhjX5z+WtSlwHYKiHn5xHM+he50tWPiAUAMuDZ9+xLGdyudnadu2z15BzWMe8vkoimj3va136tcZujYzhFTbOfHt4NobrbKL5gKydczobnA4/4us/WJ3S9LTgJQBwx+k0ler+M9j/FO/WHHFKBFu79NWEiZVFuF7Qm8BnaulCuKfU2BkEaJDrSW+OpgM/T6WGWM7B4gP/8UNQp9XPR6sH2VvjVfl1VlFBJdlhOuN/xQkfauiMsvy/iRvo/XdxVtlFMk3gH8ZBFdiwTduTgEpuRAVIx+WJ5gQutBOQQDnaf6kmRustzWrFi6v3HbjOFo8eTJWjmQBkw8v/46VmJ+Bo8tvA0/J7td5HXqKfDO69sIYRfKWZaELId6YhqBUPz7/0ptI9DcKBb8k64Uz3MqiYcvEUWaIeQpJdfylsZpHsbdkkOpDJ3QqxJ99sdet+STf4VZgxHKYdzNzgVuMJxVoRVTDpqox5yadU+Wt1Z5cE4c2q7MHYOhTM1BaKs7VaWvrwf+VDw6SnPXzd83oyELGJenTzn16N1i+ywTbLyXglFDVXzcpDLkfzlqYng61DzNOy6KkfpehxPc+XUsIBqqdaEiwMGBa7vdkzHbpq0hPIlPQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(10067099003)(18002099003)(56012099006)(11063799006)(261009223027099003)(261102123227099003)(261021121427099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	K1zuwsujSV/RKsHifLzZkGXaPHfFxjqRdja8BGJNmK1h+6HrlmjDmQHKqkot9TZ4EJ/HTdnk8vR1zsHJv45UMybEjoeKIeT/XPpEcVwKs97uFjBvfbg/GzS6Fw4Bmkz+8rzSxA2A4oLz/L710e3V7Fj0IW3f3PX6RzYUMm7NMqwiFbstbtYV0hTaXAsOd/+bVdSdX1DI0+OnJEYmzgwTGJwTYDGhvqB2oSa3FvCL6VHWZ1SBlm1mvl74bv+dnVMO5vTrRVmTbV0PJkSEHsHqHASMlsO93WnzFbxqlmNR/SkXOq2qNKxq9Y6lgeUxu8I5rvilt6AxQlCCcTGywJkByT0UqWw5TZLXtcAkmmDxuA+EzBTOiibOerOXSHe2pQiCGJVhigTAdIku+0LfsD/nW6j2WyvaHWPyQ3WkUlYP2Z3mhmBs6DhPCa+laR/ip8c6
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 12:03:26.0054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d29d16e1-cfca-4629-8c41-08df3bfdf6a0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7263

This series add some missing regulators for the Jetson AGX Thor board in
order to fix the following warnings:

 WARNING KERN at24 1-0050: supply vcc not found, using dummy regulator
 WARNING KERN lm90 5-004c: supply vcc not found, using dummy regulator
 WARNING KERN at24 1-0056: supply vcc not found, using dummy regulator

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Jon Hunter (3):
      arm64: tegra: Add regulator for Jetson AGX Thor thermal sensor
      arm64: tegra: Add regulator for Jetson AGX Thor system EEPROM
      arm64: tegra: Add regulator for Jetson AGX Thor module EEPROM

 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi        | 19 +++++++++++++++++++
 .../dts/nvidia/tegra264-p4071-0000+p3834-0008.dts     |  4 ++++
 .../boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi    | 18 ++++++++++++++++++
 3 files changed, 41 insertions(+)
---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261105-tegra-for-7-3-fixes-9fa9b3b71b19

Best regards,
--  
Jon Hunter <jonathanh@nvidia.com>

