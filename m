Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2059.outbound.protection.outlook.com [40.107.101.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80B6255E20;
	Mon, 12 May 2025 06:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747032211; cv=fail; b=WoB5d+VgeY4ZdC+OSfZ/ucIV12dRy7S06DCBXno6O5pOLeE3g+w6AjXxgSR7Cfe7SEKALwwFbn+w6Kj2qrdGXbOKKLq1fnjZ8ULGCkM2iI9srnQFLL9jw5/JooOPlXTGQ8H/+gG6P3H5u2V0K1eBjNdl1Fs1PVed6Ge9+KwEdy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747032211; c=relaxed/simple;
	bh=TY4xYKrxfqHrDXuoqHbAepfkMulsorvSjfUOYasBsO0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IbMBEezPYdejL/QnfFbSKvEZa9TSQEf4DCwttMqr/4LzWvv7fxxX9qeXpLV8rva3T3s+dfPShTAXbSCnZw2HI+UB17HORxzPoOAV2zjXW4vD2w/tQWkvUg0UKeng03HEGHznE+T7SaD1d3hl+J0bPf9R+zdhI6215N0J1+4cb88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=O9NFAivc; arc=fail smtp.client-ip=40.107.101.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="O9NFAivc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5GjEYZ5ks7FRCn0pLAs4GZeABFLgJRQ6bMp+63E4fW1f7g2Q4Fdd3Fy3//U4Ztvqi4yaMzNB6i6NSuN4SVbKAsKiakVzxSZlAZE0iGeXrGUDFOgkrUjnxwAS3aYUlG2Op4LfVdYWSEBEDuE9WEKsGLNX+TQpNmFOMSaWT02qQ6VN/7GX3ZY2o0hCKVRwpFxPbNQBLIM7F8/I0Dxt5g4FWQ39oeid+yqe11jeqmPm+bR7gIqNd1yWgnFOREKiuSEN9Fnqa5ADXYQnnrkGH0Y342bsxiTTFZdf0XORAlizmR/QAjStFv/mcPDlKtHsHmzyxdx+NRR63SaTzq2cr1xkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lZay74pjZe9Ru9K0NiFlPrQEZukR5/x+S2u+/0QDeo=;
 b=gGvvH0NXUpZWCoTuqOpGgBdOQf1I1UXLx4JuGoAgCxtJ8+xJqxXqsfXOw440dSpNf5lH1+lxCrGO6u6bTHxi1JP3T7q0MJitQV32GzHBLyNOB9Y2a3FjxvLLikgU2IK0lISX9CBxZ01XYPDoRxJ8HPEdz3NbiUo7BX3ejrRBSB5x2hxbm+i1xkL7J2GPtZBeUH0LlDSc2DuKJYcXWXByG7xx3CxMQncdHlvHIlChj+bTIXST9uhykjujrl6im5SBh1CTV/ecEn3lpz3Aa1A5+c77Llko17iwRiEymvmfqqTymic+pTHTk4FFh4U/R7qa8gH3PRECMREt+YwMiIXuFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lZay74pjZe9Ru9K0NiFlPrQEZukR5/x+S2u+/0QDeo=;
 b=O9NFAivcivjg1lGrVLO3VeDfhQRDrzCnk4sIr6SpzI74a6YLjzCHDJ3W1HTfLVo4TCKY2UZSPsQxx4G0uK5G5Goolq0t7wo6ojfxJa+vubO4LvmVXn1H2PGeaP5KcS4U6/h9CYMUKSqQJiBtdkFtRUw7tOSVO1BwMBlkk8ik7EL6OasFTEFAaN7uimsueBVN/cEhVuTb4CfllVFKgEhNzt8G8hVVLyi3/pEQoehY6kNwihMCfn/9u1ElNtnix+n+Ohs1hxFpvCZrNyqcczfVdMEGmcZTMbG4O9mzhEvNkHdqCo+T6ZNqvw+u242HSHnDgAtUaBsDT7D0Qlq4uM98TQ==
Received: from DM6PR07CA0097.namprd07.prod.outlook.com (2603:10b6:5:337::30)
 by DS0PR12MB9040.namprd12.prod.outlook.com (2603:10b6:8:f5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Mon, 12 May
 2025 06:43:26 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:5:337:cafe::54) by DM6PR07CA0097.outlook.office365.com
 (2603:10b6:5:337::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.28 via Frontend Transport; Mon,
 12 May 2025 06:43:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Mon, 12 May 2025 06:43:25 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 23:43:14 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 23:43:13 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Sun, 11 May 2025 23:43:13 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <perex@perex.cz>,
	<tiwai@suse.com>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH 1/3] dt-bindings: Update Tegra194 and Tegra234 HDA bindings
Date: Mon, 12 May 2025 06:42:56 +0000
Message-ID: <20250512064258.1028331-2-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250512064258.1028331-1-sheetal@nvidia.com>
References: <20250512064258.1028331-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|DS0PR12MB9040:EE_
X-MS-Office365-Filtering-Correlation-Id: 82c79154-0c72-4844-9361-08dd91204c45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fYKmGHQJRYCjGFOYjiXx5PA94sRclr3pWElAIveD5PGsVy4MnuRZMdFy+f0w?=
 =?us-ascii?Q?/EqTy2IKz/o5OZ+gvgcx9CCam2COaeAx7tKYGuktpaITjpx+eHTLqUIhmo4g?=
 =?us-ascii?Q?lBJlsnvKdU8gyaE1hTCnjtnNy2xpiXs5lc659cCpZNg+94FY2wFiy/3StTrh?=
 =?us-ascii?Q?0AyEDT6lPdsxn3hufN6U+YFsGzUbuXE/Zi8etnhEiukN4xf7cnr/rdRj95z3?=
 =?us-ascii?Q?VU0xWQ1IEBRH7Wi4XCe7+iazbhN+FO4p05kPYC8JemVK2qQgT0xIcLES6fNE?=
 =?us-ascii?Q?yN6t8EjAb+y2LEjFkkCzF2kchqa85qHYRc0+gqROpnn4wbSwofLDwL3VgkFh?=
 =?us-ascii?Q?/HcFDM6QJrW5F2//DWtX/ByqyycRCGB4cACNFiEVE2kREHAYJ1TNnzH2XWbH?=
 =?us-ascii?Q?b1WU5w/dJ08xIpDWIUAHjBRLntfQHKW2JtxTfwqyuXd7vy5wsC+gZ3yB28Iw?=
 =?us-ascii?Q?hGg9maFHE13EBWnm566WvroKmWHDilfwlVM2qS6cmeVIhD6eDz1xBqUtXM3v?=
 =?us-ascii?Q?heeeMJ8XsTRHfTwXeZ9ohyY2hUO52d6FyygFrCWBEQCvxY0JJCKFUU++0YpG?=
 =?us-ascii?Q?8/ROPvV1PbcUs888B8LmRCgY1N7ZYsCxUvtVPXpz+j4QwRfFqriTjRSlglO7?=
 =?us-ascii?Q?Qnj6osv0y6L8hdYJnpLyKp1MCBx1OHceHZow7chxeENAV39X84lDjV06phkh?=
 =?us-ascii?Q?ySE1hSeahLFjcL4TEhwyL99cAbS+8JkkwDjE9UnFddS8b43bjG1z49MvxXUY?=
 =?us-ascii?Q?InRnhjkdEWMUCjlJcnacvfbDzmBsbY2SIuQcapNzoj4fqq+isRT3/fWob/PD?=
 =?us-ascii?Q?nhGN7ofgu9rhwaS6PUCppBaWBBi65/t4Y+LgSqGtsB7ypvY9sQueuOKZjei5?=
 =?us-ascii?Q?3/9+n7Xokj1vJhNeu20jDLyiAduk+a8Yu6Iv4ehYSk9eQjvgSjczjJPUsllq?=
 =?us-ascii?Q?CrUe0dXr7Rz0GktuPT81l1MJQ21WSzCRNCaUyVui0KI0gdpmSX7T2lJtdi60?=
 =?us-ascii?Q?6LUGScqUYHjAtXk0em+8Nbadqq68+4K204utQy28wzmoJkEczHWox8tIpF3v?=
 =?us-ascii?Q?xiik3QSoP6lw2aygjD4nQalMPhkJmlckbPKIkImScbsZDEKrrb+jkC9SAN9Z?=
 =?us-ascii?Q?RHzO7U+SGLljB5nY9IqyBzNg/ytys0leMSELQkxpHxaA+8qgoohW+uUpCl7G?=
 =?us-ascii?Q?av/KfweQibVpn/N+xLnuiIaR4iaKZsLrF1mhgRX2wxUwu05a+z1IuOuDaw1/?=
 =?us-ascii?Q?jNT+L81sg6QO+cN5ZaCLVXPvrrr+eOSRq/9sQ1D07dcrIwQDeS3T/B9U6WAk?=
 =?us-ascii?Q?OCSTHecPFzmOskNT+V2+s9F63Ci/W5ZUcAqOXSvYU94fa3Sn6ydZPqbtVlSh?=
 =?us-ascii?Q?ljdp4xDvbBwqMYkZeLIAfJ7gwk8cGcCXyB63XsKYA17SJnFoOqIt3eQQwCqN?=
 =?us-ascii?Q?kV7CThFdWhTMWw4MoK13bx6GkBUYProMB3/RznjjDEaY68LhK3QoEQS5zkdh?=
 =?us-ascii?Q?l1zWJVV6bGI8Fn2k8yZbAfy4E0eV+83h5gkm?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 06:43:25.9769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c79154-0c72-4844-9361-08dd91204c45
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9040

From: Sheetal <sheetal@nvidia.com>

- Tegra194 and Tegra234 HDA is not compatible with Tegra30, hence update
  them as standalone compatibles. Also, add necessary logic to the binding
  doc as HDA clocks and resets for Tegra194 and Tegra234 are different from
  Tegra30. This fixes below dtbs_check errors:
   - compatible: 'oneOf' conditional failed, one must be fixed:
        ['nvidia,tegra194-hda'] is too short
        'nvidia,tegra30-hda' was expected
        'nvidia,tegra132-hda' was expected
   - compatible: 'oneOf' conditional failed, one must be fixed:
	['nvidia,tegra234-hda'] is too short
	'nvidia,tegra30-hda' was expected
        'nvidia,tegra132-hda' was expected
   - hda@3510000: clock-names:1: 'hda2hdmi' was expected
   - hda@3510000: reset-names:1: 'hda2hdmi' was expected

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 .../bindings/sound/nvidia,tegra30-hda.yaml    | 83 ++++++++++++++++---
 1 file changed, 72 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
index 3ca9affb79a2..703f009862a4 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
@@ -20,11 +20,12 @@ properties:
 
   compatible:
     oneOf:
-      - const: nvidia,tegra30-hda
+      - enum:
+          - nvidia,tegra30-hda
+          - nvidia,tegra194-hda
+          - nvidia,tegra234-hda
       - items:
           - enum:
-              - nvidia,tegra234-hda
-              - nvidia,tegra194-hda
               - nvidia,tegra186-hda
               - nvidia,tegra210-hda
               - nvidia,tegra124-hda
@@ -48,10 +49,7 @@ properties:
 
   clock-names:
     minItems: 2
-    items:
-      - const: hda
-      - const: hda2hdmi
-      - const: hda2codec_2x
+    maxItems: 3
 
   resets:
     minItems: 2
@@ -59,10 +57,7 @@ properties:
 
   reset-names:
     minItems: 2
-    items:
-      - const: hda
-      - const: hda2hdmi
-      - const: hda2codec_2x
+    maxItems: 3
 
   power-domains:
     maxItems: 1
@@ -93,6 +88,72 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra30-hda
+    then:
+      properties:
+        clocks:
+          minItems: 3
+        clock-names:
+          items:
+            - const: hda
+            - const: hda2hdmi
+            - const: hda2codec_2x
+        resets:
+          minItems: 3
+        reset-names:
+          items:
+            - const: hda
+            - const: hda2hdmi
+            - const: hda2codec_2x
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra194-hda
+    then:
+      properties:
+        clocks:
+          minItems: 3
+        clock-names:
+          items:
+            - const: hda
+            - const: hda2hdmi
+            - const: hda2codec_2x
+        resets:
+          maxItems: 2
+        reset-names:
+          items:
+            - const: hda
+            - const: hda2hdmi
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra234-hda
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: hda
+            - const: hda2codec_2x
+        resets:
+          maxItems: 2
+        reset-names:
+          items:
+            - const: hda
+            - const: hda2codec_2x
+
 examples:
   - |
     #include<dt-bindings/clock/tegra124-car-common.h>
-- 
2.17.1

