Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2077.outbound.protection.outlook.com [40.107.96.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C949D2741C9;
	Tue, 29 Apr 2025 06:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906410; cv=fail; b=MuPA0CUgz004tBIRj6513nlS0+VFMbOB/TGV4gll6Ccaxpx+/Se+APk2p9PKICFGZ6zfZQFM67ylXkThdOCXLo55DDY8tzl69rUJx6AU3L0iOdQobrb3uGZH0L9NQuU1QZ925NyKy0dkiiZ4B8oLniQrlMH5XLdNQ4ISGdteTcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906410; c=relaxed/simple;
	bh=J/M5ZAS7fQogSiz6V4IfW1l7+PfuJvqggZnYSrjvJes=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LwJ0EzPi0fnSF056zfj+kvnrmCQ/rnFqnvwTIav+R8mkEdRzDoO9viVnuvFsId3MXbOu+1OPwAxy6R3e5L60FBd19u8zoPWgsT+hpzd9eSJgae0zBYSbTKVJVnqh5wjGn9sg8gx2rTi4apYw/UiKeNV9L2JI9r1w4uc4rgeqD2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=q90GdBkh; arc=fail smtp.client-ip=40.107.96.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="q90GdBkh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCjcr1TUteqsMZUc4PvGZG+HcV6G3svpSgFxV6OY2N/aagvj4xfO+b0B8BqVL8p4Uqt6r/+xdAAYLhlZz7K99YB+jOH3YPHf9MZvrK11xawu7ZvDudaodIdLRXlZ+N+VypR0s5RPYEbg7dx6ZXINnRwshLzYaWzEWMUtqy1hOD7JEnMe4I/i01KN2pLJgLNn8Kr25SHZVljO80vh44fh2k6n9Z1A4yYXM+PyM6nZYvSqXthDmuy1HiCZ7xwDAJ7gSUx6FKS21g09LgRh4lOLlFm1XLwaOcoIF5L5ogtfWtSDAqi32aRMIkPaDvM0Fq84aykjwkE7zdYLzSAm8ThAvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4Lq8WQ5wcgLIeQhBzprhPBUDtfXxTrGu+DgiA4ZQro=;
 b=LKDogYpyRJ5kmqLdhn+NYi9gUQovxq0micVVlp1enLybhb6724hJv3HHrKh9p12gK7KVkMtBVdt0VFIUjCRIoHaIY7tGx412ezSPtOoVMmugQVNZPh7pmdL2BGKWPrurko55C/Y3WJ2RKfutubeTlZ9haPC/XIpTe3vzJVUmViEnlmDGCIo5osK/WGUDXBBIa09H/R1eJEMsYSL7HxbjRe4M1wuXzzQJCNPRqVUFE4yftOKo48Ea1FFvdAI/9DVIcZoF4cEhAdnfejBrt7+waQqDQzwjXeol0x+ofy6DSLcVILDHqTMbczEZKzJAk1287Cruf6mSF+iWhJGaZpC3bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4Lq8WQ5wcgLIeQhBzprhPBUDtfXxTrGu+DgiA4ZQro=;
 b=q90GdBkh13p/1S1SSiU/WGItf6+DffnhZuLwmGYMtHZs7BkfqAd42DNJSrln+JjTi4802gYntCk0VvDdDZTnrnFc7atV6TRk7FuRD6yJkP+thateF+U549F5XLwurbusZj5Tg180yfnuZOz73syznFVU/2yb+o/i8UmZyeF1nG4C1BEesgB6SUHbqrxHeoovxTVw6ZPTYp8dbA2DgTRNrqO9x5OKnZhtwduLJaMwWNcJsiE2QW08K5qDd6vk6cP986vYYqQw8tRL84D1sxu3lOFMh8h6r9ppjU5ZpyqSSYeU0tkZY9kpoWaiExIvFoCqZVH6iv2z+T7DB8cufqKq8A==
Received: from DS7PR06CA0027.namprd06.prod.outlook.com (2603:10b6:8:54::6) by
 SJ2PR12MB8689.namprd12.prod.outlook.com (2603:10b6:a03:53d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 06:00:02 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:8:54:cafe::dd) by DS7PR06CA0027.outlook.office365.com
 (2603:10b6:8:54::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Tue,
 29 Apr 2025 06:00:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33 via Frontend Transport; Tue, 29 Apr 2025 06:00:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 28 Apr
 2025 22:59:44 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 28 Apr
 2025 22:59:44 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Mon, 28 Apr 2025 22:59:44 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>
CC: <perex@perex.cz>, <tiwai@suse.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <spujar@nvidia.com>, <mkumard@nvidia.com>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v2 02/11] dt-bindings: ASoC: Document Tegra264 APE support
Date: Tue, 29 Apr 2025 05:59:32 +0000
Message-ID: <20250429055941.901511-3-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250429055941.901511-1-sheetal@nvidia.com>
References: <20250429055941.901511-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|SJ2PR12MB8689:EE_
X-MS-Office365-Filtering-Correlation-Id: dbfdf357-2393-4f29-9682-08dd86e314fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LgoTykHVLDrY2XxEmzO7kdhTZPh7VclqE/N8tD+ZnrIfJMlOfJPETVKS3F8R?=
 =?us-ascii?Q?uW81IKzq2QQYXagGxnf2yfOhqp16m2SjU0Zv9lKg6hV/xJlTWOYtfo09SpPS?=
 =?us-ascii?Q?+TEp/FVgLjCuqMPDspMJTCeIaQ3B+6pXThz/VEIrJsr688DaqpHNPKRmhWnX?=
 =?us-ascii?Q?tSlzdhKFJesDGG+XTD92qUw6koBzWFnnhGJ/pYNCZ/Hz3K5EbLvasRIjxccK?=
 =?us-ascii?Q?/o9IL7dRj2rKGRrBrAMjjT9ZUHZjZGj5yMiTGy3xqOqzUeG8kZLPhDODPuSA?=
 =?us-ascii?Q?4cnhg3YT0xxzl9lkFa3PwG1rPnT7mOe6JnoUkInTD0cA/qP5dJ7WoyihCu8i?=
 =?us-ascii?Q?M/SYyqBn1LHCveM+ru67+bApiNAc+IAiG9mUoAg31xYXmf+bewNSKTsdRY0P?=
 =?us-ascii?Q?XxV85NqQecxwbvl3rAcwJay4CXE++XHr2skwVnnIlMK9PBmQHHI/kq7gRUZH?=
 =?us-ascii?Q?SU3iWiuS81nyWCHyrV9bKlOu1aKcPoAuLK9J9qJb+yB/HXhx+Al9xbGPxOD2?=
 =?us-ascii?Q?Rol8KXLRmmjbvK2xNrLVVzzHo3KvxrcwOt5b81PAW/9wOFRjODSrxRaT492e?=
 =?us-ascii?Q?1dstI5w99baEbCRHg/YHqWw9tC9uzgVGoYJzuMFtzYYcMbJofnR6jQ1ars2E?=
 =?us-ascii?Q?XE/ssOsnGoUVzlnewZyZgAN/uDJpnqy/zQqY0s4eZbt7RaXlTKqUDHzIwq8M?=
 =?us-ascii?Q?dCcjcIxr8LWrTYG9iNsaLcMluGHotOs15a2fapTdMCxabk4b988EvrRjV8mP?=
 =?us-ascii?Q?AlPki0tb7Pl3yZqzEeeO+YgVbS5m0qW+zpPBOukbBXLbz9KYHqdV3FRHoP+G?=
 =?us-ascii?Q?8gKgtHtT1608cAWLnYUNGyLi9pnu8r/NSVodjvjCLUoAPKxgoh61wILNA0uv?=
 =?us-ascii?Q?2kS2eTQ37U/Rf96pWVaDjTc8HuE5NNJU/2xMmMQvwJFmh5ydJmYIYC5GSKYd?=
 =?us-ascii?Q?dp+1tGt0UyArOcYKjxRijKIgjD+VP0W21GwVzmGtIkLQtT4S1ZAKTXIERjBy?=
 =?us-ascii?Q?WGU+XL7ZMeMmUXL+W4K5U194EAxi7k5vaIz6i55S3s9M7iDPFH7NeSHDt+JC?=
 =?us-ascii?Q?/7b8Ff1hknFVmllzTiYCeMjC4uWmBytFvn6G9EDmc9YezWzLqYFqdzYfatpp?=
 =?us-ascii?Q?pBOkgdKo1WiHkLu24FWpbl/RyfdYxav8X9JX5MgwP+XOsl6CcTyJTVizt9Iy?=
 =?us-ascii?Q?Xf92XE8jUNukolIeZnknvbegDlkNOarfIrgrp/Y9H+cU4XcP9wNkm+es+5aP?=
 =?us-ascii?Q?nbzfzXKL7fiO2Z9j2140ird8/rVkRglSdIhdFwwzmbNL+CNJnaxk5KnNHNkL?=
 =?us-ascii?Q?Wtqlxzlt4JaKRgoKEZPfCtDt6OskAzmcxXf6dN05XcJSZeLvNL0EodQJPSki?=
 =?us-ascii?Q?xsGI4FqiHaXKCK8AQC6EDH3Nn6JOy4yb+YuoArbUYGnG7FFgy7RcQTOf8ZOi?=
 =?us-ascii?Q?FWuGZ9ppoR7WtTVzOsevU9GiE0Yu+p7aOXvqtACfwiJ8ky3LBswsnlDkNgmj?=
 =?us-ascii?Q?P860/NURulbWKoODUhriVhgyxXtwvijPl9lU?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 06:00:02.3087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbfdf357-2393-4f29-9682-08dd86e314fa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8689

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
index 3008ab4c96ad..3dfe774cab05 100644
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

