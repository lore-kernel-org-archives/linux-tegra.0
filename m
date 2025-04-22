Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9004A2080C8;
	Tue, 22 Apr 2025 09:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745314722; cv=fail; b=HxKet1ivYf6SFcIJu0ZIRTs9O6IRh1rc819wJZGVwvJ0gXnQw6z4pxdvib1Bk0eliYrClGhYnPkdKzKKL5ez6lP19YFlRJwtI6zdKXbrcHfW6M2P51tbWCTk51mgyxVwWswGOZj5Rn1yRVg4GDbXyL0G/kiW+4hwacygu+DG7oo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745314722; c=relaxed/simple;
	bh=bSdqxctK09d8IR3fggIeb2jBcnWQs+FAVOFPL2xQE1U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qypcevIVOwlKqGo1UhEV1vKGfQKlJZI9xL7BKhf7q16tKI2zMIPITWHV1bcn3skiMHSZA8/FwwPiyfJQehduyvuSkL2zvU32TkcQGah/PFoZFR/O9grL18JHo3+bLQdszBJS8cJnwjwdRq7ZNgOZE4yxIx+u7MctYBUxh1eFlTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=R/Api/ut; arc=fail smtp.client-ip=40.107.237.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="R/Api/ut"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqQSvWWOk0PrYqCPspfIrBQJ4ssaZwkGvaAy3MJM7hLjNuRQzjVhHtNBwsYtT/PkJW/c5CYMXJ9kmLLybUOID4gPC2zv+Hh53bWXjMEtBUew6MpjOvmEdFiGtOubduBdWMw08zSyZEogiFqzEeVPc95TN1i5exgchSjz6KxxKHwCEb8cjBrK1OUwueR59drBy3L5gGAJeNTs7tkJIwYW/h0Iuv767EsD+gQ/CzlbZfkfwIzeJ8x2AooUTTNkNZaMub4aRpmYmUjKBgiHOVoLwU7ZHJxFruD8wt7tT6smzHH0Seb9pk0fgiPIEMzI1Phy/W4c8KbBZELq74q5T+dGWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xs1+7/aKc/9fBgWTLn5YfUUQafY54KHXc1O71vqvswM=;
 b=Dkw3WiCWA4hx/HUhYYSQ49H7QHfFgBg3emnrOMaaLuSRn+xwGq1j+GHWJkoC5PrhxkY9eGeU0BHt9PnyzrjmXDQPIjbR3V4HscsAIwrAXxoEj/rgNOppbuM6QAPnIoOww1uNXqjaDapjbSXXiYICabbsw4hVw4SVk+5raFxndVZoyAidAGp7+HpBygkWQQdRRMY18rnLlVojGTy5K3+JTuUy/76uAcbVEVX/cYz5Oeektbo+xn2njodpXGs1W/PxteodI86YT/7mydfOuUFwkkTNXk6oVyB3dYtuvE/SashgziNyty6VaFN3BN8ymEo8rwBUQwIitlsg2O52ypO8jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xs1+7/aKc/9fBgWTLn5YfUUQafY54KHXc1O71vqvswM=;
 b=R/Api/ut+wYOqBUuZK03uHHvbSxYHQgHeiqkDYDFzw7dUA/WrLhY2aYXHJwqp/BJqIJW1/vW2iOG4s3j/F1PECSwPJa8wkqEXSDGZW/w1XmHHYJ+0ydp+Oz91R2YUTlR4Gp5vAir7Ay6YXj1aNkZRJR265QprmWFbEZXc87YLvb57kEfBVx9rDm0MduWnf/EyE4SRcSa1VMC+xaKFeYZhehGzW1mxBKykQNGsUVkWFMU/LbRtbvafI6+CPml6ERvZY0mgVc62DqmdP0NSVrzz78vqLXmuADBk7xdQkKJ1x+wHTP3u0Vp2vvt//69lpj3rASU4msgaQgQ61iH/+eVTg==
Received: from BL1PR13CA0346.namprd13.prod.outlook.com (2603:10b6:208:2c6::21)
 by DM6PR12MB4074.namprd12.prod.outlook.com (2603:10b6:5:218::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 09:38:34 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:208:2c6:cafe::c9) by BL1PR13CA0346.outlook.office365.com
 (2603:10b6:208:2c6::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.33 via Frontend Transport; Tue,
 22 Apr 2025 09:38:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 09:38:34 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 22 Apr
 2025 02:38:18 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 22 Apr
 2025 02:38:18 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 22 Apr 2025 02:38:17 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-sound@vger.kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<jonathanh@nvidia.com>, <thierry.reding@gmail.com>, <mkumard@nvidia.com>,
	<spujar@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [RESEND PATCH 01/10] dt-bindings: ASoC: Document Tegra264 APE support
Date: Tue, 22 Apr 2025 09:38:06 +0000
Message-ID: <20250422093815.506810-2-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250422093815.506810-1-sheetal@nvidia.com>
References: <20250422093815.506810-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|DM6PR12MB4074:EE_
X-MS-Office365-Filtering-Correlation-Id: e7284a65-981f-4efd-ad9c-08dd8181735d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AbbUYJ2/mCNNrr9vJef55pkQzyZw1nQADo8OkqnBapTtj2n8XP51XsqtBdk3?=
 =?us-ascii?Q?3LQj1hjb5lBIO6+XulX1yndsLfGAK2iGciTlw6aIB8sGXeEg4YL59d/Ej2AA?=
 =?us-ascii?Q?F6fYHHQK5GzwpjuuNhks/ZK2IgZT31AtiuV/LZC5hNe8NRPFqRqZ78YUwsF1?=
 =?us-ascii?Q?xeWUBBuxNo+HHfVH6UA93Vny26ueHYyjPNtAiP8rtuxd/tyOgD+HwRImbMZA?=
 =?us-ascii?Q?OLkZYvTpgp0f9t+GVxBCVmKrLkdGNi0l3cZM0lgzg3OMFn40ct48Jc5ZKeXu?=
 =?us-ascii?Q?yGMX5e6VI3AWItFh3EXQ3AqRB7iT6TbDM15t67a61qzNqxtkY0+Lhn9nV5sc?=
 =?us-ascii?Q?kqu3A/VT+0aIDwsNvRM5ixx/drlRTVFmaya4h1DnVRRMY5t6LQieFSRS3A0P?=
 =?us-ascii?Q?OOVRIj9zFDhCFLwLA4C9OCtvEkBSMM+HbCLOphoAoYWgwBTE/XOWpJ9zQRK6?=
 =?us-ascii?Q?JiSYE3LFOj/yaNNpWAe1dIVsYbHQWAbUFbvWL46NxJ3g4hGRQn4+UODZN2aJ?=
 =?us-ascii?Q?XI6bB/VstfqItlQ4+0wYAG9zlUaVqdfg3lpjVr5aQZgAgMUl4bwJK3uB/BLR?=
 =?us-ascii?Q?ncJ80Istx2QgXahBsh4m87mPP677jQdTz2EtWG7VhIuku2brfAq6Ww+OzYlN?=
 =?us-ascii?Q?aaif5j+SPdHPPuC6GpFsUoJZeL6a0bC7YDtOCEVtBDWk48ODxSJdWotOFIjZ?=
 =?us-ascii?Q?u9tqrzVzrJR8c3VtPPV/mW2Z5Og0XiqlJI+vmvp+LGplVBee6tBkp+vyZFEY?=
 =?us-ascii?Q?VGfR+FEnrp6B4LUzsvbSHEKTXEANnP+XjSW6bR+ZRXZDqbSCNBjujq1I7LY/?=
 =?us-ascii?Q?XGO12ufNKWCgIXImvvhTrxBk/V6pHaKS+rSIdSCvnmwB7b+LKGxzMjSsiw9f?=
 =?us-ascii?Q?QDlG8dZF6KDNZaWPtWGGxmNDl3LDsygAGgSXoM/Hq9MSAAJXq8lkS2ocaY76?=
 =?us-ascii?Q?w5/mBk+CH+LTw1yvuwAyW79x9wJjhEdDeRZP+40B9U8kW6TVwolJfMadcyPJ?=
 =?us-ascii?Q?E9nmEW0KqowyCuYNvHVUV0Zm6fm+UdC9ACecU76qFy4pzh8vRsBNShGQy3mm?=
 =?us-ascii?Q?uLcZ6E5YKb8G0jXzkmLZAI5upj/Wv+8dlDiyYGUo7VjY+OKuM8elu1Lh06cI?=
 =?us-ascii?Q?Q91IGPcNBCMpFPjmuaTmv7Z4fyeBwwCjaRh5SCv4/BS2ZjqmtJrOSR6YztGR?=
 =?us-ascii?Q?TscajeD/R9j/WgBYF5ba7eKGqvVM489hs5YXmit+jT2ZCXCS3wFTbovw2SX0?=
 =?us-ascii?Q?0z2VweB6GLmngSk7jA0ey/uTU+J1iarFPWonEkGu+rh/uFax9UE9pi9EM0mj?=
 =?us-ascii?Q?pWaji6phVdkGJ0sNJCogyy98J3wEKWeFSVIFAqdXSEEJ7CBewETX7buqJXS6?=
 =?us-ascii?Q?jpPB2WhqJ9YiyiHHO3sYQJ71FpPNUDmQ0U+k1A1TqA8a19yr3Y/lkGmUzRBx?=
 =?us-ascii?Q?8o6Hq1YFHgg/abGUjnnpQIvmgUcMPD9WlD9+1f5hOzjZq6HqskuGKJqQNsKK?=
 =?us-ascii?Q?6IQgT053ek/cDuW4SONd2NKytiRNPdEWkMRZ?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 09:38:34.0527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7284a65-981f-4efd-ad9c-08dd8181735d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4074

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
---
 .../devicetree/bindings/bus/nvidia,tegra210-aconnect.yaml     | 1 +
 .../bindings/sound/nvidia,tegra-audio-graph-card.yaml         | 1 +
 .../devicetree/bindings/sound/nvidia,tegra186-asrc.yaml       | 4 +++-
 .../devicetree/bindings/sound/nvidia,tegra186-dspk.yaml       | 1 +
 .../devicetree/bindings/sound/nvidia,tegra210-admaif.yaml     | 1 +
 .../devicetree/bindings/sound/nvidia,tegra210-adx.yaml        | 4 +++-
 .../devicetree/bindings/sound/nvidia,tegra210-ahub.yaml       | 1 +
 .../devicetree/bindings/sound/nvidia,tegra210-amx.yaml        | 4 +++-
 .../devicetree/bindings/sound/nvidia,tegra210-dmic.yaml       | 1 +
 .../devicetree/bindings/sound/nvidia,tegra210-i2s.yaml        | 4 +++-
 .../devicetree/bindings/sound/nvidia,tegra210-mbdrc.yaml      | 1 +
 .../devicetree/bindings/sound/nvidia,tegra210-mixer.yaml      | 1 +
 .../devicetree/bindings/sound/nvidia,tegra210-mvc.yaml        | 1 +
 .../devicetree/bindings/sound/nvidia,tegra210-ope.yaml        | 1 +
 .../devicetree/bindings/sound/nvidia,tegra210-peq.yaml        | 1 +
 .../devicetree/bindings/sound/nvidia,tegra210-sfc.yaml        | 1 +
 16 files changed, 24 insertions(+), 4 deletions(-)

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
index b4bee466d67a..ee33f056b125 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
@@ -21,6 +21,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - nvidia,tegra264-audio-graph-card
       - nvidia,tegra210-audio-graph-card
       - nvidia,tegra186-audio-graph-card
 
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-asrc.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-asrc.yaml
index e15f387c4c29..26e1ed7ec7a7 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra186-asrc.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-asrc.yaml
@@ -31,7 +31,9 @@ properties:
 
   compatible:
     oneOf:
-      - const: nvidia,tegra186-asrc
+      - enum:
+          - nvidia,tegra264-asrc
+          - nvidia,tegra186-asrc
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
index 15ab40aeab1e..e5a8741ec2fe 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
@@ -24,6 +24,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - nvidia,tegra264-admaif
           - nvidia,tegra210-admaif
           - nvidia,tegra186-admaif
       - items:
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml
index e4c871797fa6..ab9f8585fc60 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml
@@ -27,7 +27,9 @@ properties:
 
   compatible:
     oneOf:
-      - const: nvidia,tegra210-adx
+      - enum:
+          - nvidia,tegra264-adx
+          - nvidia,tegra210-adx
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
index 021b72546ba4..325d4072b6e6 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml
@@ -26,7 +26,9 @@ properties:
 
   compatible:
     oneOf:
-      - const: nvidia,tegra210-amx
+      - enum:
+          - nvidia,tegra210-amx
+          - nvidia,tegra264-amx
       - items:
           - const: nvidia,tegra186-amx
           - const: nvidia,tegra210-amx
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

