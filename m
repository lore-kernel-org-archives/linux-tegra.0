Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3411F92A;
	Tue, 22 Apr 2025 07:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745306928; cv=fail; b=Gb334pILWNkalXuPa8zR3IXJy+4DmdjkpsjhP+D0JPJoDOxI+zePCmkljewexJuq3Ec36x+y6LchjEo1dA0gqnZr+dKj+ABFVC7g5FZPHKLxyjTydKX2RMkkIMZ2G7QU53YFCEI9oEKlOmLOHOAlCr1wNcZ4wrTTS8ZHbQx7GYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745306928; c=relaxed/simple;
	bh=bSdqxctK09d8IR3fggIeb2jBcnWQs+FAVOFPL2xQE1U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fj+SqO631z6rd6EHxsb1bYI0MwEhPXFyk4waf4R5Q3hU3/PMkFNt5plT82xw4T+0Csi7kiS0R8RsxJ1V19bqgCL9yfYT1nhFJ84DVmJZ+khxwCJ0gaIBWw85NWJaQcbXOwkd4wO79/DNwbXxtTyC111JaFGNvg/trjPhKQRQ1zI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HiWPrmwK; arc=fail smtp.client-ip=40.107.92.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HiWPrmwK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYN2cdwk3JuN74s4HJIYiVwsxbrT7McTH1JlW/g5+VSn04Iq7hjF67mCRapgtljelL/Hv8i4m+pA46q06ZeEdlmcYibSPTG3ElmyUGeWUfhphTS6VbnZAF5lekFQ0a8YUkU1Uzx5yJ7rCuEtfVyjFa1nQWBmtHIVLJk3p/CDi+alJ8qUfJSCrNiYcay5dT0uGqiwPLAgIsHWkg/xvqaLAqKQyUoil5Vw4eDlIt3q0K9GvU/UfhI9PA8loMe3rr3bzdkJspM0pq1DkZSjs+tNCo1Ayyk596csWd6SiGJNXlYbup49I/BF9kJ3y4Qq6ZRgYGcRu+I6LMclc7vmHGdMpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xs1+7/aKc/9fBgWTLn5YfUUQafY54KHXc1O71vqvswM=;
 b=Dfgyekvz7FbrOZbWpzgTaax1jSRRya7o5/bfDjja6hZ6SpgWfojcbhV0P959ipBYKNixgvJNAsvQtxBnvXxNXTOuNPU3w0JwTzsll8Zqr03Q8mDkK1rwThzPaS2COu+5TVFiSKigszJESgv1s5K7Tz6AM1lUNuVVJu6qgfSPVTUjIjOma0JHP34cmdzS/BeCBFQkBQ9Y70yZVWHSyAtqArFdMXGT26S7H69jK80u1C/VZOzZ94cJGlVTRoytVh1nVnK9zN04NIr0hfbhtxejzAdXPHgfThzktSkUuYzLhdqw6m+cNyl3Hk9OTCuu8uP4Y+DZuouWVVAMUIGQJydqGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xs1+7/aKc/9fBgWTLn5YfUUQafY54KHXc1O71vqvswM=;
 b=HiWPrmwK6HgxTNUArBQVdpjwPOuuDdr1y5rrDpVz/uezkM+5G5ZN4PJtefzGw0aGWs6Z9NL3lo3+J7hO2B9qTPfLq3/I6ePHsWnNOf78Vsqx0wM+llIbCK4rThSPAZZt2Xj76htZPB7VMjkVPkoppTH31lJjX5s6sGUQuapMY8fssEmzBLeqw3EqhZNkV5citZWly/zZ5/HBM2EKPfCaIwiDbAj0ZllfakVWSsWsyekNEQmBcOvSw75I/Hui6mme2dChaZooA9WUnw/m5tlJqTbyApLhKc5Z4R6nf5fqVojXlqoE65TwoxCtl5VjFnodH4Z+fURo3LBc2Uo9OxXKNA==
Received: from CH0PR04CA0031.namprd04.prod.outlook.com (2603:10b6:610:77::6)
 by SA5PPF8BD1FB094.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 07:28:41 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::75) by CH0PR04CA0031.outlook.office365.com
 (2603:10b6:610:77::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Tue,
 22 Apr 2025 07:28:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 07:28:41 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 22 Apr
 2025 00:28:24 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 22 Apr
 2025 00:28:24 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 22 Apr 2025 00:28:24 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<jonathanh@nvidia.com>, <thierry.reding@gmail.com>, <mkumard@nvidia.com>,
	<spujar@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH 01/10] dt-bindings: ASoC: Document Tegra264 APE support
Date: Tue, 22 Apr 2025 07:27:56 +0000
Message-ID: <20250422072805.501152-2-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250422072805.501152-1-sheetal@nvidia.com>
References: <20250422072805.501152-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|SA5PPF8BD1FB094:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d374db0-ea77-4be2-4f84-08dd816f4e5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oJljXdkzeDo0E2eyQWLJ6YCEIa01VsW57MZI8f84wcv1GqAMVmEltWP3di6U?=
 =?us-ascii?Q?W8UBbKmh0U5myRmJvh4frcYIfALE2uzSq264FFyPTFxoS0J1WL8bz7qdtVOi?=
 =?us-ascii?Q?rDr3gTWFpOYcN5RrI03SoZmEFqxLnlJWIX9+LsLCAlRXMI9oqV2hqxRZ/lng?=
 =?us-ascii?Q?sX1jf6z0K/w5ZTzs9+YSTrAUBA4l2xGzcNYWkDGoo4UwhiFQVW5IVcjS+OzS?=
 =?us-ascii?Q?/lN179yXq8AbClrLmwHqUG438Dz+ZLu33ezEdjvV6OTrdrWIjKhXMjYQ6Jkb?=
 =?us-ascii?Q?c1yOjYylV8s4OguJWQIkgOYpz0IxqpOj0+Af4xycoezoSauttzAV/3ScSoDr?=
 =?us-ascii?Q?I1FdAXtzbspkY5rH4DLxRqLuLppI4j6D92H7gU9CxMb+2rpghGHIdmrxlFrf?=
 =?us-ascii?Q?0svocGIKy4e2ugQhyIINauY30cD3h5csRXzocndk475AHOIwgEsNFZXupUtF?=
 =?us-ascii?Q?3KgzxFjaRWXboqIPx1sxVSGAG6i3pTXNXjymANNmxHTL8DySbXqbjSxraUuw?=
 =?us-ascii?Q?l1mWVAgO2Xmfi9Dw3dVLXCj5foeh9MyhtRp6d+ssrPB3O118QW6imEs7vrtJ?=
 =?us-ascii?Q?QuF526UdbUCjSlPNa4u1SpB30nnt8HAfOOZlRp2rBzdEoz4m+k7l0bOz/Xcq?=
 =?us-ascii?Q?gzlHRsisD1uwY2gk4UzAR8ziMV5W2MUTnnCKntqYfhC+ZluWT5PWbzuv3H3m?=
 =?us-ascii?Q?lUg5ebgGlV+pq+MAI3vpi5Dln9og3YNpKf13ne7BFdr0WzSR8xkCDbJll8qS?=
 =?us-ascii?Q?R6hd18aaX7pD+2u2Hg0afB5ArRebk+CUg+ZU5Y6n1ZbDIa5kiTAMbnhr4y2K?=
 =?us-ascii?Q?yjA2VklQfQ21coMHaRgdKbKYc9m68fOuYU7gj0fHvapagHmN85we6hMeusVx?=
 =?us-ascii?Q?47jIuDR9SxHLiGreL9mFVIp28H9GH9JqODkEUqXoT1JwjDxH7aGHDXiY5AD1?=
 =?us-ascii?Q?FpWA30f/EtMS6IJhBCCYpyR1RVDGnU8FLorXUIsI4Hz5rr5YtYKWYglQr4GV?=
 =?us-ascii?Q?2fUIky6ZPUxqMsgu7yHts6GeZok/P+broKfd02iRhavdVCv7uHDtCRO0SdY6?=
 =?us-ascii?Q?qhIlKyYf1x6CfuBo1dEMjDkmQwlVgja0rT/Cy6/GmWs57nXfG9cPYQQtbse8?=
 =?us-ascii?Q?jfGa7/S/E9Nr94bPCC5KI+hqHDtw7oajm4BGEz7e+08x6SVyaxlrdfBq4bRW?=
 =?us-ascii?Q?T+TBZo9eZPwy8PaxPpbqTpc+4f8EkM7A64pxRHXIIbCSSBm1Icr+6NuYWiD6?=
 =?us-ascii?Q?i2VBr6N499QGox9p5aWIEUhV4m9+SR06wJGfknsEVmhhIEz1chE6Psb0wJfD?=
 =?us-ascii?Q?/mVKvoRvYmxO3qxBkQ1S+bSTnjKnw34szcAjhts1LOSddMJaW5+0UKtVmPmZ?=
 =?us-ascii?Q?oO6MjIe7F6x66GGPvy4xQDaaTPN8QczZacD9phEvPwrr9AJYn3BS1MosL+Wm?=
 =?us-ascii?Q?0cCg0zU8TnYh+Q4KG8E8RWKqqAMgsu5y9DJvetVgX1FEvVuyOEJlLAwGHR7D?=
 =?us-ascii?Q?4yR3M2nNRbdB+wPI0cPr4L6zfrsrlfMYW8eI?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 07:28:41.0916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d374db0-ea77-4be2-4f84-08dd816f4e5e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF8BD1FB094

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

