Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013049.outbound.protection.outlook.com [40.93.201.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFE933C503;
	Wed, 19 Nov 2025 09:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763545080; cv=fail; b=o+bKNLj6o8veD9viU7DqC0gCPP2LwCuG37U1sjwvArbvZ4zaGTMarV10jzxeH2shem5s4+Fnea5nJbj3oqiNAYP0jvvSqYwxdofvlntEJLYIySFResaLGRFhA5QAxoLo5gABN5SWw1zCKbtcxld65Bc4rCMrmJNw33UmHz5OWRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763545080; c=relaxed/simple;
	bh=aCOBqUU1efCXMJ3T8DEPdt23kVnxmyAWCrU5l2GunD0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mRrD+A8EuV5O3Fp4uHx7+r/EM8UkKqCrWZKYWZ72ebgY+vk2+WcZQgPorohEp7soYCYQYzUJNGUlgwUL0lIZUDFLvu+2fsB7S/C+VLuyWXsY4bJGnNQfuSxV/FFPzPlLEnD9dGf4F9ZVLDVMB8mSmZUs+oNZnxowsSyqmwbHwA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sVRfcVAc; arc=fail smtp.client-ip=40.93.201.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sVRfcVAc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uxvb/R1eofLmxtLnOuo5klt55606nIQmNvOpfHJQwf+2IZxpNVJNLFh43p9RDHW01lJrjX4qXWajxv9PxTBtvJZpzKsn0mgPtgu9qpbPkEUEK+P5ib4GBsN9FPRWiTwWJvMjrZwVbBUfPUSI/91/aKlioiDCsKJa0dj2nkeqsg5Se+oceAgXgz+XQhunb0Wr6r8dlgwF8mRVeRQ7FmCBdQvDlMVLUIGAftIQ5qqypUQn82BKvq+Rjy8wsm2M4pd3p9FkTmt2hrF5YjLwEYtksrj0nUx/3bIxeQ/BO6LwlCN4BXI83vGL9YuP1Wzer6S3V0eDLvLytAof4VqB/Mzm5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pf/+Hffe0TGw7zEITfY/Y6JogUnX9tfMgq3LHKPrw2o=;
 b=wnOXYM9sdiBFLbBovdRo5hiWIYdxHhfPa9v+m5VQ1PxpJgM5abK+CQAE00cmNxq0LTXEbC5GserLbJD9/r+Vc5SldTga8dAzKfth/zIN4LnQiwZD09vXePlMBaFZPFQMg65S/DNmFay5nWbyC6LXx4tbioVJ0viGUcuy6/CfHTBvbMNS9BTjV9CCcw9sMVWEOZwd9A/27JoD8LEWVxNYrAo+xeDq+rRHBfsH3bqx+ybgXK2v2pLCdC/hU42soPoQddgPV6lQSX13MDF4wuVbpAnYe/e25CuSTOxocBvf3v9ZYuYy/DxkxMAGdZNZnVVYlR8i+YuSbFeJX1VR91vfwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pf/+Hffe0TGw7zEITfY/Y6JogUnX9tfMgq3LHKPrw2o=;
 b=sVRfcVAcWitDjch/vCO/ghcJbbZoxCJU9epfhrURDrJYD290cvC3eB56qNkNMa851rji1fVRqHg9XEdTov8lo7QgXtyhkiK/b6+sbWwRjhM2j5oljylSbWZ5gtzwCvIdOcTLSxG2pEVm5InBt4cdQW77ZU/hd9btwl75u+gfPevtN66ucn1TIb5FfA6ZPB1LNv3HYdS3BiN+0KYOZPqXpWQQAXCV/0df6+n7u+Guoc9ZJDp9RT+pE4cBkSMJjGQpgeaKj5Sv4IZE9tE17NVDb3JJme54C852a/XqJtnxe0Bpt0TcmDDr9UXZyhpTFX3DHew54JVPlhbqGBwu5oEaUQ==
Received: from BYAPR02CA0025.namprd02.prod.outlook.com (2603:10b6:a02:ee::38)
 by LV0PR12MB999070.namprd12.prod.outlook.com (2603:10b6:408:32a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 09:37:56 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a02:ee:cafe::6e) by BYAPR02CA0025.outlook.office365.com
 (2603:10b6:a02:ee::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 09:37:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 09:37:55 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 01:37:44 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 19 Nov 2025 01:37:43 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 01:37:42 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>, Prathamesh Shete <pshete@nvidia.com>
Subject: [PATCH V2 1/2] dt-bindings: tegra: pmc: Update aotag as an optional aperture
Date: Wed, 19 Nov 2025 09:37:28 +0000
Message-ID: <20251119093729.441654-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|LV0PR12MB999070:EE_
X-MS-Office365-Filtering-Correlation-Id: 184d6458-b779-442a-9840-08de274f5176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AhFh8cIdxNclcNOCrFcMaMmi2xd4LQCXx1lus1vr7i7RIaxRcUEvMaC2J8Nr?=
 =?us-ascii?Q?yKPFJTWCAQupHANmj4wtVlHsaaRBhLzmESeWCww+QvgI8Eh9ipcjLlpa3NRf?=
 =?us-ascii?Q?zSVkTmt/Z7nfG2Ma+UjGG+VgzW/3dT8Uym+gVJ2qdQQTeCzEM6zi3xpQyZwK?=
 =?us-ascii?Q?wVrJ1huxWFXQv1BxAwP1Zmuub3ZImnE6SerdUcNZ5r3ZxMWDTodh/gBP4WEf?=
 =?us-ascii?Q?eYJ7UoGcO4i0cvywfJNFIq0cYswa+PY2Zr/88zvlhVB+VzC7yYTKeBMVuPof?=
 =?us-ascii?Q?ImLsDHrXcEsDvE/0zK6qhCgrf7DxrhsnC6Ct7qiYW4uCl+4J+T90AjLgQ+XM?=
 =?us-ascii?Q?quV3OhL/yu6set0XQosoBGb8Nv6J8IVvOCtYMtoAu+1UbXbW3Kv7bPeg4ir/?=
 =?us-ascii?Q?6SgD1Kfnijtq7kTI6itbm7RF3z2hdpKZMC1FboDj7zMoj1xdxSyqAcHqEliv?=
 =?us-ascii?Q?XbUbo4FJpS+O0fRoOI9BLwUWIlzNSkYghvO6CIWBrQtyv+7Xx6P1dYEGqaoR?=
 =?us-ascii?Q?14YfuyaMluBivbmEv+aeGzBsdBr1jjmQiwzKpS+WcShHMV+niOsy3F6/B9t7?=
 =?us-ascii?Q?6iJmS4NqxCa57UmeoBSmV+ldjc/Voo2udNYstqoKh/3tiJAQb+ioWaBUfdtN?=
 =?us-ascii?Q?OdV8tdY/CpmR/05t3/MRGVKZjo3meKtcMG7HNDyf2UsdkjmzWAesiHz3zI9x?=
 =?us-ascii?Q?zSWpzRDlNW3iFMuzbzWfgLw4jXdB661HVnryN5P/XrPg4VSlHYsl9vV4fYcj?=
 =?us-ascii?Q?zJwj9d089F+S9Ijyd1sJZkf7ie8UgfCvLtBJFfa+s5KF6JPDRhErhSGshYYr?=
 =?us-ascii?Q?KmD83aNGdSHd4lAjwBGIB6yCyy9tvyA3MVdiLhwslSyH6ziBgjzEV7NxSvQI?=
 =?us-ascii?Q?wAeiPqS8WmL9uJo6ubI7+dKYu2a+ykOzSJ05Z1VwsvT4c/bBB5570dhUH8XJ?=
 =?us-ascii?Q?Dqj3wcKpO3KWGMypA4AKPzpp8oIFHFCs3vHzZZa2L+RzzsLZE2P+p8On01M8?=
 =?us-ascii?Q?AoA/cXTNO5bW2sZCYQUjhfWQIID4n31WdeWz+wxrVLr50ytuM8L+da1JpQzm?=
 =?us-ascii?Q?aI/QlH0VlPWWsVFXufQsNHoLAsk4EuHIreehklttmNSWF+Efm3AsuTikmN0H?=
 =?us-ascii?Q?tW9wypGBI1wXrsE17z0Sq+CldGJ7EtcG9na/+IEDdGZf597l38rOdwmXCCLb?=
 =?us-ascii?Q?ln9tDXkb7/L4Ob1jRY9m6I5KC16nQWsjOTXBBxnFN72a1rwIZZQXACa5TKCa?=
 =?us-ascii?Q?9QCJo3LSlh2aVBLIHKOQRFfkve//tij/1HuBPVMdVnbp5jaPsMN9prpGXXhf?=
 =?us-ascii?Q?dGggCkUvDY2cdCZ7Jw97IDZxunTcUOEq9jVDZsxCZeYTzH040/D1orowKmgD?=
 =?us-ascii?Q?itX5oTudwfC8qw90+W3xHuRNIgo/PYMbdrs9uzmZH7IqxK3GomAu2EiTvgJI?=
 =?us-ascii?Q?Lu0pSAjijo78bGiT2Gi56YKO4pYh3N8q58LzuXKfMkOjv7T9gMVshZgGjKg2?=
 =?us-ascii?Q?g24bTwqqJ44csplavuZ+izoZTfDIrqGwC/C9hWIttaH7F6/ovZs1fFytNltI?=
 =?us-ascii?Q?Je1HnPh2phReiL155H0=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 09:37:55.4836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 184d6458-b779-442a-9840-08de274f5176
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999070

Not all Tegra SoCs or all versions of a particular Tegra SoC may include
the AOTAG aperture. This change makes "aotag" as an optional aperture for
Tegra234 and Tegra264.

Co-developed-by: Prathamesh Shete <pshete@nvidia.com>
Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes since V1:
- Simplified reg-names handling of optional aotag range by upon
  Krzysztof's feedback.
- Dropped removal of reg modifications for tegra186 and tegra194.
- Updated reg minItems for tegra186.

 .../bindings/arm/tegra/nvidia,tegra186-pmc.yaml       | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
index be70819020c5..dcd1c5376507 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
@@ -19,15 +19,15 @@ properties:
       - nvidia,tegra264-pmc
 
   reg:
-    minItems: 4
+    minItems: 3
     maxItems: 5
 
   reg-names:
-    minItems: 4
+    minItems: 3
     items:
       - const: pmc
       - const: wake
-      - const: aotag
+      - enum: [ aotag, scratch, misc ]
       - enum: [ scratch, misc ]
       - const: misc
 
@@ -51,6 +51,7 @@ allOf:
     then:
       properties:
         reg:
+          minItems: 4
           maxItems: 4
         reg-names:
           maxItems: 4
@@ -73,7 +74,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: nvidia,tegra234-pmc
+            enum:
+              - nvidia,tegra234-pmc
+              - nvidia,tegra264-pmc
     then:
       properties:
         reg-names:
-- 
2.43.0

