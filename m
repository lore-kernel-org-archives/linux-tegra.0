Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FB12550BB;
	Mon, 12 May 2025 05:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747027113; cv=fail; b=VPXc7usax4lX2jS7e62LkNmJAS+lVMkUBQEItxHYf8zN2N7x45nSljUo471j4jR8I88EMQWVMyHaLqpF4weVb8/54+4IsvwSn/MInONuP1msvXwhS3qE6Bwn7XJP/shs2qjlaVjzwTr9Ghnb1XuXM73+SE8OLoDY6ZPjHCxs8uc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747027113; c=relaxed/simple;
	bh=6ma1KPAFf6YCjuFiyo9yd3Cwy5c/TYEEtNA3CmwSUV4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ky6Pe1PEA61EJI6IDEURb3LLWC2IUXGeNV7o9CIj9I6VizSTeggOoN3DlF0eO1w1ZL/qDYkWoalYJxuC4XGd5R3lFvfl+OCe+2fBHucKybW35IObt+GMgtj6fIvJ31ET9YnCRIdrgxZAfoa40Dly2tkPIzuGuEyQJRW4JTfx278=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oKPPUfVm; arc=fail smtp.client-ip=40.107.237.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oKPPUfVm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QKWjMG533KW3BPWAIHbZcPfyMndbCsd5V9VcpvaIZAKnZ2HTAR8Dm+TokIohNZCsr2Jldl1wweFv8Z5CYhMLN4fU1JqVvDMCHQIXzwjyh24htU7JLlUr3JhZf9dSvshs5o3QOQyBXuZxOLWOpxBk6VapYSP0Enw3jxCerRkXqblmvlPKxux5/vaZn0DXL7IrOX9WzsR/vz3JJCj06mS+LU/VrKZEGa/JV0DYJ6Gn/EkUr36hL6tWOAXN+bzmzcrCASzDcYu2CTKl2ekDfHcQoPO8YBpvW/TDVSa/atoQiJAiJC97FPHRo+HgocGhTk4ZfuaLQN79845QzqAPbx17Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgEyMYf7I6v/l/5B7JlqFu0k53BfeaeVnOCMgNLBXxg=;
 b=cgZQ2FNKEDEc2VDOMz/Cep/zCpopGM+aJ5AekmKX7qlUWa0bogGRz4+8n3+65xrWkiVXzBupZp4tUHYosWy5z6vp9cgAMjaQa44Ex+HTmX8uLnxzCC3yTYHlf+jiQsiaA5qR+mIfyLFXW0YAz99ti64xEY8pMctAybNLejXbQLkmQbWvtrCt9ycDLRkEdttdMSsrs5p9k3iaCw0TTzyl2rvreYizvHMrGHEp44TgJv6VQwUjkd/dgMphx80eZQ5o44o9a8nBP3vm8tBTicA1zSswNLAjtsIjO08rjy9MLT/jjl5d+abn0mkANSFQvg2pZcbhWETmIuNheM4RfcNcnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgEyMYf7I6v/l/5B7JlqFu0k53BfeaeVnOCMgNLBXxg=;
 b=oKPPUfVmqss6LuD5BnMzxOCE5EQHtLUhDWdXvGs7YLctPUhYwBV5fg0g1XqaHw6ysCjzG9wo21RAfwW5bH4CT9ovDlvfFUUZj6jc7v3EmkCoBz48mBrYbPkUghlDJR7Yg0+wfbq7DjeZvvgpgazgISeamIBNtVszXUcwRudFMEp1J7B+QckW3SNOzrO03E4JquqlomruVtHicLE1KU1/9mFRv8w84fhPCFgYo7nqpux/FAAEjiT/s/nw4I/Pc6yaK3jX/pPluhZ+BM4WpRUxUjYrr6N12m1x12aYJ9Helfh4zuddlTG73go08/QQt3cCfg/uZ5soRJ+UX/G0T+Wx1Q==
Received: from PH7PR03CA0021.namprd03.prod.outlook.com (2603:10b6:510:339::28)
 by MW4PR12MB7119.namprd12.prod.outlook.com (2603:10b6:303:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Mon, 12 May
 2025 05:18:25 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:510:339:cafe::10) by PH7PR03CA0021.outlook.office365.com
 (2603:10b6:510:339::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.29 via Frontend Transport; Mon,
 12 May 2025 05:18:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Mon, 12 May 2025 05:18:24 +0000
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
Subject: [PATCH v3 02/11] dt-bindings: ASoC: Document Tegra264 APE support
Date: Mon, 12 May 2025 05:17:38 +0000
Message-ID: <20250512051747.1026770-3-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|MW4PR12MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: b8c39b36-6dda-493e-d39b-08dd91146b90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y3tHI+zcU7tgejs5leN75xmEMKT+Yx1yKRX4pfbevTu9NzfYfvBae7tLLEJd?=
 =?us-ascii?Q?SLFgVlvgJuUh0ttoLtb1qSB/c3iPq+GTkrFvSzu4pxU1O5Eay18ZklCgTzTb?=
 =?us-ascii?Q?pEURTCDs/sWyP2Bhu+R1CF2Nz3GnR1mGfB1NNY5+e2QQ1UMKiCiuZBN279uo?=
 =?us-ascii?Q?Cquz9QczwXORnVwvrD7q1W6fxQG7RXwW94RuQ1aNiD9MGxu+LCtEXQvpypfb?=
 =?us-ascii?Q?+oIJw3MP6M+AOEPi1sfoO7JdXEaw/M5u34aM2qS3cfxnvEOfh5dHJj7oEvrx?=
 =?us-ascii?Q?+OgdafRv78dGX2x1NDyrN/g5AtgoJK6ukmdrYMFFu3OKf1BIrP12ENzZjWSs?=
 =?us-ascii?Q?wkqvUrCoEp4pvneK5TQ3XWSAlQsasU6n1xv/6dDkvp8p30ymY7O5YxPZlgkV?=
 =?us-ascii?Q?/7/im06G+GRUn67VOIikAmLixk4Ufw45ywwE1FmUAtbMsKz7MJlEX68gHXl4?=
 =?us-ascii?Q?iVq2hxU8kGUL+rTkttQ8OrgYp6FXRxOvxFnBWVf/xBgeCD3kyFF7XMKX2sVf?=
 =?us-ascii?Q?JEqkQkaAK296CZ0baC6dt6Sbt/tBlYSfnqjhUdEr1OLczTSqL+uKEGFG40RY?=
 =?us-ascii?Q?sFUiADzq3TGCgtoA6WkyeBo9UlVjRo32hvRydyM/sERoJ8xCHuKSCmrkDcXp?=
 =?us-ascii?Q?epEcNm9naLYHm7mwJCpLDY7ZgzhHlpwmLJI6eNovPH/e/VWuFDg3yWzAx40T?=
 =?us-ascii?Q?FV+YvDFdvCLQG6/PEplnk4kZjOtUxxjKrDuVF239axkTPju7Zr1ehPbnLyAW?=
 =?us-ascii?Q?T9S7/vbLmugmfpemYPKWdP5dRD0byrInmB5i1lKyAlyRhOnHNMLDd5jKAZaH?=
 =?us-ascii?Q?0Hht8MKev253VLfAi9y3TFP6Xyni54VbNuJfk1ycawkOqo0CMVoX/DYKYbWG?=
 =?us-ascii?Q?VojzRN3uz5qiNIwqa6XJ/uyvRCfeHXGF2TioFQOvP04lmWwNyptrhVr0RS+A?=
 =?us-ascii?Q?BS2vn+2dOSX0TDrMg98inmGMdH+Kj4uBwDDLvluOtRZVKLdShIs24k5NYHii?=
 =?us-ascii?Q?oQarbimSdNvXW3aIzPsh63z5yZq/ecBYyCy/03KgbY2TAglz/sfzaZZLg2ln?=
 =?us-ascii?Q?JFwEB9gzerb3xYicMVnHcjoTRjwhBYHCC8Mr+j9i4raCbnbVHX+4piRrKbu0?=
 =?us-ascii?Q?mYtTOXqQq777GKz+DREgvPIv7jZJmj5tGzk7tnJHPvkI5yoZwWSu6FYLig4G?=
 =?us-ascii?Q?Ms7U0jkvgF2cVqG0YbZz5hKqRI5/HX9aKKVEjENRz04vi6yC7nclx16h0Q04?=
 =?us-ascii?Q?1PHB8GLskdShPxnVxnpqZSiImL23jXiw9LCwTH0QboNA7uEiMxYX2OnC3wC1?=
 =?us-ascii?Q?QdEHM/g+1Li1Wef/J98sEwD3C5fwFnablW0v76FeQLQppQLIFFrNcPGv4A+h?=
 =?us-ascii?Q?672kMgCtNI0+cpID69F5ycfcCcJEfX5pxFIYURNXX5VVjwAj8kY9DK8IQFoR?=
 =?us-ascii?Q?NBtNMJIMWr4sJdn3NCUwdcB3cBg/w/eMc8fSfXwujpC9uxtFyYp9NvTzNgFk?=
 =?us-ascii?Q?+wghd6M2AxTRZ/dsnTuirLlxYbh1unA130s1?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 05:18:24.5315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c39b36-6dda-493e-d39b-08dd91146b90
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7119

From: Sheetal <sheetal@nvidia.com>

Add Tegra264 compatible strings to APE subsystem device bindings:
- audio-graph-card: Due to different PLL clock rate.
- admaif: Due to 32 channels supported and register offset changes.
- i2s: Due to 32 channels supported and register offset changes.
- amx/adx: Due to 32 channels supported and register offset changes.
- asrc: Due to different ARAM address.
- ahub: Due to AHUB IPs number of instances updates.
- for future proofing the T264 compatibility is added for other device
  nodes.

These bindings enable the enhanced audio features of Tegra264
while maintaining compatibility with existing platforms.

Signed-off-by: Sheetal <sheetal@nvidia.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/bus/nvidia,tegra210-aconnect.yaml   | 1 +
 .../bindings/sound/nvidia,tegra-audio-graph-card.yaml       | 1 +
 .../devicetree/bindings/sound/nvidia,tegra186-asrc.yaml     | 4 +++-
 .../devicetree/bindings/sound/nvidia,tegra186-dspk.yaml     | 1 +
 .../devicetree/bindings/sound/nvidia,tegra210-admaif.yaml   | 1 +
 .../devicetree/bindings/sound/nvidia,tegra210-adx.yaml      | 4 +++-
 .../devicetree/bindings/sound/nvidia,tegra210-ahub.yaml     | 1 +
 .../devicetree/bindings/sound/nvidia,tegra210-amx.yaml      | 6 ++++--
 .../devicetree/bindings/sound/nvidia,tegra210-dmic.yaml     | 1 +
 .../devicetree/bindings/sound/nvidia,tegra210-i2s.yaml      | 4 +++-
 .../devicetree/bindings/sound/nvidia,tegra210-mbdrc.yaml    | 1 +
 .../devicetree/bindings/sound/nvidia,tegra210-mixer.yaml    | 1 +
 .../devicetree/bindings/sound/nvidia,tegra210-mvc.yaml      | 1 +
 .../devicetree/bindings/sound/nvidia,tegra210-ope.yaml      | 1 +
 .../devicetree/bindings/sound/nvidia,tegra210-peq.yaml      | 1 +
 .../devicetree/bindings/sound/nvidia,tegra210-sfc.yaml      | 1 +
 16 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.yaml b/Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.yaml
index 26362c9006e2..81a65e9f93f1 100644
--- a/Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.yaml
+++ b/Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.yaml
@@ -21,6 +21,7 @@ properties:
       - const: nvidia,tegra210-aconnect
       - items:
           - enum:
+              - nvidia,tegra264-aconnect
               - nvidia,tegra234-aconnect
               - nvidia,tegra186-aconnect
               - nvidia,tegra194-aconnect
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
index b4bee466d67a..da89523ccf5f 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
@@ -23,6 +23,7 @@ properties:
     enum:
       - nvidia,tegra210-audio-graph-card
       - nvidia,tegra186-audio-graph-card
+      - nvidia,tegra264-audio-graph-card
 
   clocks:
     minItems: 2
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-asrc.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-asrc.yaml
index e15f387c4c29..66b56e71599b 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra186-asrc.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-asrc.yaml
@@ -31,7 +31,9 @@ properties:
 
   compatible:
     oneOf:
-      - const: nvidia,tegra186-asrc
+      - enum:
+          - nvidia,tegra186-asrc
+          - nvidia,tegra264-asrc
       - items:
           - enum:
               - nvidia,tegra234-asrc
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
index e1362c77472b..46ba167081ef 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
@@ -29,6 +29,7 @@ properties:
       - const: nvidia,tegra186-dspk
       - items:
           - enum:
+              - nvidia,tegra264-dspk
               - nvidia,tegra234-dspk
               - nvidia,tegra194-dspk
           - const: nvidia,tegra186-dspk
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
index bcecac5d9018..b32f33214ba6 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
@@ -26,6 +26,7 @@ properties:
       - enum:
           - nvidia,tegra210-admaif
           - nvidia,tegra186-admaif
+          - nvidia,tegra264-admaif
       - items:
           - enum:
               - nvidia,tegra234-admaif
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml
index e4c871797fa6..19a80929f93e 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml
@@ -27,7 +27,9 @@ properties:
 
   compatible:
     oneOf:
-      - const: nvidia,tegra210-adx
+      - enum:
+          - nvidia,tegra210-adx
+          - nvidia,tegra264-adx
       - items:
           - enum:
               - nvidia,tegra234-adx
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
index c4abac81f207..1c9f24d26819 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
@@ -27,6 +27,7 @@ properties:
           - nvidia,tegra210-ahub
           - nvidia,tegra186-ahub
           - nvidia,tegra234-ahub
+          - nvidia,tegra264-ahub
       - items:
           - const: nvidia,tegra194-ahub
           - const: nvidia,tegra186-ahub
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml
index 021b72546ba4..89712102cfdf 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml
@@ -26,11 +26,13 @@ properties:
 
   compatible:
     oneOf:
-      - const: nvidia,tegra210-amx
+      - enum:
+          - nvidia,tegra210-amx
+          - nvidia,tegra194-amx
+          - nvidia,tegra264-amx
       - items:
           - const: nvidia,tegra186-amx
           - const: nvidia,tegra210-amx
-      - const: nvidia,tegra194-amx
       - items:
           - const: nvidia,tegra234-amx
           - const: nvidia,tegra194-amx
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
index bff551c35da7..bb8088878d4b 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
@@ -28,6 +28,7 @@ properties:
       - const: nvidia,tegra210-dmic
       - items:
           - enum:
+              - nvidia,tegra264-dmic
               - nvidia,tegra234-dmic
               - nvidia,tegra194-dmic
               - nvidia,tegra186-dmic
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
index a82f11fb6c9a..903e815af8fd 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
@@ -25,7 +25,9 @@ properties:
 
   compatible:
     oneOf:
-      - const: nvidia,tegra210-i2s
+      - enum:
+          - nvidia,tegra210-i2s
+          - nvidia,tegra264-i2s
       - items:
           - enum:
               - nvidia,tegra234-i2s
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-mbdrc.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-mbdrc.yaml
index 5b9198602fc6..4c121b9cde1e 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-mbdrc.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-mbdrc.yaml
@@ -23,6 +23,7 @@ properties:
       - const: nvidia,tegra210-mbdrc
       - items:
           - enum:
+              - nvidia,tegra264-mbdrc
               - nvidia,tegra234-mbdrc
               - nvidia,tegra194-mbdrc
               - nvidia,tegra186-mbdrc
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-mixer.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-mixer.yaml
index 049898f02e85..56b4c4fc123c 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-mixer.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-mixer.yaml
@@ -28,6 +28,7 @@ properties:
       - const: nvidia,tegra210-amixer
       - items:
           - enum:
+              - nvidia,tegra264-amixer
               - nvidia,tegra234-amixer
               - nvidia,tegra194-amixer
               - nvidia,tegra186-amixer
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-mvc.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-mvc.yaml
index d0280d8aa3af..bde4ac6319b1 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-mvc.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-mvc.yaml
@@ -31,6 +31,7 @@ properties:
       - const: nvidia,tegra210-mvc
       - items:
           - enum:
+              - nvidia,tegra264-mvc
               - nvidia,tegra234-mvc
               - nvidia,tegra194-mvc
               - nvidia,tegra186-mvc
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ope.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ope.yaml
index 9017fb6d575d..756c3096a2d6 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ope.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ope.yaml
@@ -25,6 +25,7 @@ properties:
       - const: nvidia,tegra210-ope
       - items:
           - enum:
+              - nvidia,tegra264-ope
               - nvidia,tegra234-ope
               - nvidia,tegra194-ope
               - nvidia,tegra186-ope
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-peq.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-peq.yaml
index 1e373c49d639..2f11a484dc2e 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-peq.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-peq.yaml
@@ -24,6 +24,7 @@ properties:
       - const: nvidia,tegra210-peq
       - items:
           - enum:
+              - nvidia,tegra264-peq
               - nvidia,tegra234-peq
               - nvidia,tegra194-peq
               - nvidia,tegra186-peq
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-sfc.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-sfc.yaml
index 185ca0be4f02..959aa7fffdac 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-sfc.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-sfc.yaml
@@ -28,6 +28,7 @@ properties:
       - const: nvidia,tegra210-sfc
       - items:
           - enum:
+              - nvidia,tegra264-sfc
               - nvidia,tegra234-sfc
               - nvidia,tegra194-sfc
               - nvidia,tegra186-sfc
-- 
2.17.1

