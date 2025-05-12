Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B31255223;
	Mon, 12 May 2025 05:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747027112; cv=fail; b=pHyosyfjQO2QflXxYIbLzx9kjsrjqtHUMI6THZP4CmyK9+r5ZjpKkr0v9UmpC3oqgO3vHvc98BrqxTHWdPyik9TTL/eNPEfWJBZAlWYhKsOJVtemZqxd3JcSaMm8JzDvqoU7qtxeb893kYzivUDmB1mhHjPOdD0Hj+NpHG/IcjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747027112; c=relaxed/simple;
	bh=km1KW2y5vHOaXURLioQDNIbGHf9Wz4/XCCfjy4KPLw8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pO3zyCoKZ1puVeKhiG4S/mrlu2FFAdyI7b7UCLdCmFEZwpN/r+RSzbw/qJIo5bHEj9d0JmFzUtjxgWoOT7K423qRU9roz1GsGwOSMXqG3WifIZHB22cyKq6IXE+KXPoFFAs6ohad56WV+lYe80xQ3hC78XrSXursWI8gQ5PHX38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gnIo1I8z; arc=fail smtp.client-ip=40.107.243.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gnIo1I8z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBeC6TYdtGntQJMh2IFk98iStvJDaX5aEUs7hTDfe82d4zHVjMBJ6smoj8jmFERWrTJ8TnMG71p25S7bX6GLT7iLfLI/zA0PW/zZ4N1zzydYDVlcAGYXNslHXGUmEjyHjHn9y9K1AfQJAghR1avOJ/n5eR18xJY9WKh0LeFiwy27yiEmWyms9DgoIHTzCbRANEiYJ8V883Efr4JevkRltqTAIPgVlW5rmRsaFAEIXCFUMqrs7JRYzOETuOyMvSe52SuKjXAwzhXL9h9PvmtA4dVSJ3HOlYd+zcvt5yS+QMUbOcUnjfkMr4oqF1Pp5/gEortsJByfpYu80osCvC3v5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7QYfabra6tsNbowm7gGnCg31c71crGJ4yp4BdOwwHg=;
 b=qeiQP6+uVYNxy8E3oeXfLc5rfK/hwikZlTwqV2CVrSCGgbCAjj+/n8+HVEyOIb97Hr4xIZnRFUxI9gP0SEJNaDelR42xR/djhy6XqnHxXx9QYv6o3cV4E85xG2hn3p8nM49Etyu99llgrTjw5w8QlqDQRvopBGUk1OpLeuSz4c/ZZ72Ov0lmCtVkgoe3voMlyfmkraozTOc+6FLpKtDrxwhE2XYbJvFXFeEXge5hGpzTZhPbmediWTGdXd0BXMk7U25FhWAiffAQkW1O8WF0iTpQWNLyN78/6wEmE9jbz4Q2DHCeBXld1DALAvP5mhU2gPG9oqR+2RaTSUgONETs2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7QYfabra6tsNbowm7gGnCg31c71crGJ4yp4BdOwwHg=;
 b=gnIo1I8z5DnI8R7d68Z9xxXOxFu0uSM8BtRLHCVdlXSY+YyeN0OS4GP8VFw3WJ39WB6cU1ri9kxguOvHxy5aa6hc3IQP7jQZF5I7N6GRTQP7YoxYMC+tmJcOMYLEOK/opi8r5QizwEYat6LlCAIziZdy8DeFE0ZTZCuUPHabek0h/g+zBA20OlnSd8R7vQN2viyZENYMVXhm/eABptdzIE1h8bH/5Vk9olPRjhZuHIRNxHRXPaETn7iNnh0l+QPPPCE7adMpCJ+11SGtll09xHVwxhwPk0ydW5RZFszTA2u4A//MmIJkwejQfKJPRbtcJrnTAxG+wg8/nkH+j/GGCw==
Received: from BY1P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::15)
 by SJ0PR12MB8615.namprd12.prod.outlook.com (2603:10b6:a03:484::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 05:18:24 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::56) by BY1P220CA0019.outlook.office365.com
 (2603:10b6:a03:5c3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.29 via Frontend Transport; Mon,
 12 May 2025 05:18:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Mon, 12 May 2025 05:18:23 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 22:18:13 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 22:18:12 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Sun, 11 May 2025 22:18:12 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>
CC: <perex@perex.cz>, <tiwai@suse.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <spujar@nvidia.com>, <mkumard@nvidia.com>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v3 01/11] dt-bindings: ASoC: admaif: Add missing properties
Date: Mon, 12 May 2025 05:17:37 +0000
Message-ID: <20250512051747.1026770-2-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250512051747.1026770-1-sheetal@nvidia.com>
References: <20250512051747.1026770-1-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|SJ0PR12MB8615:EE_
X-MS-Office365-Filtering-Correlation-Id: 1348542b-f20f-4560-1532-08dd91146b0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PpOOfEwHjgmuND+kKAtrdndHftA6eF03KuKznxeeBfvsApoMlcS9xb6+Rd7/?=
 =?us-ascii?Q?UPgKYkW2Vc7aYNY5GQypNe0Mfbqgj0RkTjtoZFkI4hSDXQPYUyL59zy3x1ta?=
 =?us-ascii?Q?g3Owf1wY5XkwbAqgdZO3kS8EyOZMt4om8LTQcZXl3atmnRe/EInSmT1mGWII?=
 =?us-ascii?Q?rvaYFC3LW48iN01/7lsETUUQO+YbParoreHmVF8+c3f0O52lYCL+iFoY2AAX?=
 =?us-ascii?Q?iTRe1fMq3muZXyZD4UiO9ObY9drIBdaxCYPHHCy+b7An+gY8a+vzbEt/u2s5?=
 =?us-ascii?Q?gJljKIRSu2T2RM4VGWQp2sDpXnXDWmrSUBbo/CWxluxUiT2clTbdu7B2HAyC?=
 =?us-ascii?Q?68q5r4b7WeaFMFWTpZ7l+3FE/xL2WU3gnlnUZOBLB/9/fmAtBqh/svw8Ub3k?=
 =?us-ascii?Q?DfypMAgHif61lVJ9s4qd5SrNE8qcjr902zw/W3/DHYDsCvohjkb0AL8mE19A?=
 =?us-ascii?Q?S6rEm1ZE0s0rW62vREBuytTG6tKMIzm5dS6CzMd1NwD040cq4zz2ZCHr1/h3?=
 =?us-ascii?Q?CBsf5ejAs66wQfzAX5UJ9ZWznQvp2V2Adg8uF7EQw3hCNhdOEqoC/7ApXAlv?=
 =?us-ascii?Q?ebItSAZonero5+tUMrAMFlUA6UJtVgryz8xuF0pBTGqeF6kCUkK8OYuoYRxY?=
 =?us-ascii?Q?5ezT1+8shCaGtnCo1SDvt4cGjWDzwQ/Nhs6COKiExbXR7po97kdka239tKTO?=
 =?us-ascii?Q?wZt/+y4rgAy5sbdUnZMFG7g1yNUEOdBpiEw2DFsF+vg8Xie6pAc8XMcHY4iv?=
 =?us-ascii?Q?GNItkG5YevUVIjfN6JhkP67F/YLegWl98kD9l42jBaH0zkroZ/NpVwWAzK7t?=
 =?us-ascii?Q?JHRMroggZuzTIQ+7kZ3kmEl0zy0/7LDvE7iS1hCarK3pWG3MPs5HjyJGS9da?=
 =?us-ascii?Q?YqYQY7uqUiCgG9P8ZGB+5hUpk/EkuQeCr8SVTwZ3GtJ+hmc21F4NmmjhRvou?=
 =?us-ascii?Q?S14/xj1lQm2Rxl9AAFxueOnxWmz3g6jH2zkVHVENSf05kxr2rFsqiOnuP22u?=
 =?us-ascii?Q?yLfOeVX/iyCYTaxWKUoQtmnwmDxW9ZQbMPah9Y2uv9PKDMRYKpELBGRlS9Pw?=
 =?us-ascii?Q?fd+HzZ2gFt2g82LfwHE+gmPHuAhaDE83uubmiX9uUV/LqjCJf+1Ak6rlXioq?=
 =?us-ascii?Q?2CSz+F/BLVKl9CQoghnLICnBoyhqbOaY5BaUW/mDPi9gY0trHIxemAg01Ifk?=
 =?us-ascii?Q?iwoKUEMhftFN6vu4jjsYzJrwHwPXUDRn+Ke6YPc58RILyaKwewP7z/byVGNQ?=
 =?us-ascii?Q?aBK755iOSwcahKBEqTEoPJ7KJYV0bzBQdsB3vQwGnOTI9GiYf7SiMFlmeJ33?=
 =?us-ascii?Q?sgFmFz68l2obhPXD8QN7ln9j0D7hqSXrj40oqWpXI3b93wvjVmc1fpNOXbaP?=
 =?us-ascii?Q?0aPldXE5sOteeaxduflN7zH1q5wecoLpOenZw0IIpDdPiRXxEkXJ46Y7Kwop?=
 =?us-ascii?Q?h12wTzU7Z5vkeJ5xc1Va0DSJ5vG8UrwejgEbE3fUHo95sORkCgkRyHGrEomS?=
 =?us-ascii?Q?dS4PSJewgr7VM3PzgzR59ccCjJzgP6PtfKRC?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 05:18:23.6644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1348542b-f20f-4560-1532-08dd91146b0b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8615

From: Sheetal <sheetal@nvidia.com>

Add optional interconnect and iommu properties to admaif yaml. These
properties are supported from Tegra186 SoC onwards.

This fixes below dtbs_check error for Tegra194 and Tegra234:
 'interconnect-names', 'interconnects', 'iommus' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 .../bindings/sound/nvidia,tegra210-admaif.yaml   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
index 15ab40aeab1e..bcecac5d9018 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
@@ -39,6 +39,19 @@ properties:
 
   dma-names: true
 
+  interconnects:
+    items:
+      - description: APE read memory client
+      - description: APE write memory client
+
+  interconnect-names:
+    items:
+      - const: dma-mem # read
+      - const: write
+
+  iommus:
+    maxItems: 1
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description: |
@@ -74,6 +87,9 @@ then:
         Should be "tx1", "tx2" ... "tx10" for DMA Tx channel
       minItems: 1
       maxItems: 20
+    interconnects: false
+    interconnect-names: false
+    iommus: false
 
 else:
   properties:
-- 
2.17.1

