Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012001.outbound.protection.outlook.com [40.107.209.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F95126E173;
	Fri, 14 Nov 2025 16:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763137081; cv=fail; b=rpz1tfFdsdEuG8a5Ow4BYaT+LpGt28lUJmmEJtEGRTGRauDfpSrzIZPWt4zk35N8rs2VaXE80/Arsjq6pOEnZlJJpblGdyw5sqNOoKfFRBW0fsnsJ8MvlXbIfFcQNpASkC9PTZv9yEyUCj1BzLmdzau75MTAkZtZUNyw5sDXN7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763137081; c=relaxed/simple;
	bh=3T9eWNyDa6xec6cJ98SOKwxoe8pZjaOwX8yZnQ4QRpo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qkd0CqlNe3fd5c3iaEV6Y0MxpRfkt2Wizjr51N4sYcWEyifprAOlUVIIp4MzKhg0PBljU0NPXCMELpjKAGDQPg2U8DtCjcOYAvtE9y+LzAu/katvk7OzM776BM27QCKY5sKvwkvHLxy8EnMlxHr7mtxBToSgqtsnn5qXnpqBrRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eGLEZPnT; arc=fail smtp.client-ip=40.107.209.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eGLEZPnT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PoNIsuGN3HJbGpS965dCWaibkQJePk4aHd4gH3iG4vo51sHfzqReGr/Fx0p6KCl3DYRqyq57hpneIo5UKsdvoe77/+sHGl53wp+WJwNVERFP82ATxC2KAwBiRd4vLUq1K+73Hwm3YtBG8gOvLW8pPtQT0bJyeSJCovWg6m6Rckp1y9PXhdqyMQRoDS9k4Q+rb8dyoXZauRbzJdatTs8ckHMi7htYKx6XUOZzV1PIgdiiLv5DgWjcjvr3176oPcXlFjkKQbGosXwYZhXY2xdUFeUkKg5LeZGUpuADQJPovEZVgDOlCThn+GfwznLIFCenIBf/vXOz2driNIriHIcKXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZG7EuS6JWZaTtH05aNgt3cZOnOpVM06pfK+PqXqW0+k=;
 b=TLofX3u1wuxpmgSUgW8S9jw2XAZtbhzMmGheeuOj/U5PCzeWR9n+5jEq5VOt4Z2cNWAaNdrY8MDt04+pzaovj4sv+r2kCEX7/+vPhi9kKO1/tEXKWJRvezPeHyyjOCAE2ptlj8AizmDKJKtet9MMAZUsnn8NRBmr/tWIqI9c1aS1jmjJH0TCQTSRp7np8u+tWmY38NyzTZ49UTVOXqufe+yv1M9qtzZz2jTCQySBa6Adr+oIVIvp38gE0AKQtU5DIDCr4VortOXn6wTJ4xVzxeN4uEnvTJRZoaeoAivYcks8OZMbV/T5vWLUTj6AwcXWh4M8YwsnkyyQHezdopLFkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZG7EuS6JWZaTtH05aNgt3cZOnOpVM06pfK+PqXqW0+k=;
 b=eGLEZPnTwA6slMeKYvjAZdyCJV3AFvoNQm6hJdMOwFLF5Oq153XT4zu7oODLy9kDFigGTAAMS3O+GS8P/4YpJxVTweB9m52YtjtyJCSjO/21aH8FoNr+qjlk+a0rLvqXI7XbLekIan/SY9nvWllrU0OE5cQjGyPaAFMuoxxU6JfOC5PGFLoICMlhk5MxDqwwF6fYgeKzW5YD4YqodLKtfFF4OppFW4jKssO2LTbsatkVR3+gha0XfCPgn0SZBecvDtUs2ZGs24xiT14PccVu01VpAlK6Oao8aQbiGunIbr6f+4cVZNKl1DUUogOPM0DSJ326BXWn0MuQ3atYPLhjGA==
Received: from BN9PR03CA0701.namprd03.prod.outlook.com (2603:10b6:408:ef::16)
 by IA0PR12MB7628.namprd12.prod.outlook.com (2603:10b6:208:436::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 16:17:55 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:408:ef:cafe::b8) by BN9PR03CA0701.outlook.office365.com
 (2603:10b6:408:ef::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 16:17:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:17:54 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 08:17:28 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 08:17:27 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 14 Nov 2025 08:17:25 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>, Prathamesh Shete <pshete@nvidia.com>
Subject: [PATCH 1/2] dt-bindings: tegra: pmc: Update aotag as an optional aperture
Date: Fri, 14 Nov 2025 16:17:10 +0000
Message-ID: <20251114161711.2655355-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|IA0PR12MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: 136b5ae2-9843-447d-9d2b-08de23995dc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oiiO5SKOxy1KHaBA11e/3PNu5koi1SPxp4s0TWYdt86hXGmNOxfcSUfQxR7T?=
 =?us-ascii?Q?sC57NwKXUeLDuzhwk9qRM934kJ+mUX+YeeQGUn6y+AWEBHQNJUWhSvx669qL?=
 =?us-ascii?Q?2mPaFdMD/Vlvhfrha2Z3a91PyeWkM6EO+mFJo7E5nvkBhNV3WzLYbFPXtsmS?=
 =?us-ascii?Q?wkb4Enpqs17JeupPsJ+hqvNhKovXDLZGPW9PR8IGnHnWablIrrWki4nQDr86?=
 =?us-ascii?Q?aIT3llcm4CULovHo5BEqQm3zraA2rMz0Zzsp4IqmTdYZ9ssaV+VDsz5cxGQj?=
 =?us-ascii?Q?QDFtJASJ9cKP73XBzDkPzuXLgwZSQozuydwqwDJAgA3bgdENwnj8qtYOaxkE?=
 =?us-ascii?Q?pUAPooUsRJ+6JqJfRAybda6XZBgaTJ9bWotdl3mwk2OOYpSc8jBMDX3yEEHP?=
 =?us-ascii?Q?BLbcGXo6kT5rqZjzx3HEUncrdHqeHYVroL8Yf8XLVDJFGAjJg/ZohOF9KDfp?=
 =?us-ascii?Q?1M3i+IeNwPzg2eRKCvdESEG7h/VvUNQ1Ko2Vn9JMoQ2/EWMmwM4lQDiD+lo6?=
 =?us-ascii?Q?+KgnnxYXB1GnvalkbgI8u2VwHJfzJ9tQEgoORSqs1tNiZu5ZoHkvTciBr9+d?=
 =?us-ascii?Q?EHhCcSW4eawg3gpdVHssfw+os8YOkhKtYp5VqXSHQWCc3/bkOF1UVJqZTE8S?=
 =?us-ascii?Q?GBvL7ehgFHggtRGp1Hyqpp2DELY9tni0heMMCdnrLFbFQEQRCDBzZWH4F4Og?=
 =?us-ascii?Q?HIZLfe1eSeAkNbp0xG5XehsCWeqKwMx71OXzB6j4YndCFk9LhP417GWd+3XU?=
 =?us-ascii?Q?GRWJkhf/yKGx42kTJ154UJMX/in+A03R3yQCD7ROcg/uoNnqT28rlrtm7Pvt?=
 =?us-ascii?Q?nkw2EtVoMSiM6PoEJZEQeIxddrdjqa3d1mvWqgF3ntWU8AKmQ4a5c7m9ZKit?=
 =?us-ascii?Q?QJmpUdTonuvaR6sOIIKclQ2i8QS0/f3FjWpyQVZl8AdGlduG83CtVZP4qLRT?=
 =?us-ascii?Q?k7ykgwwYhtuChquWAWLvlHMAR/KC+IngDmX7PdKr6g/f56JxLyCAF/i0HrQZ?=
 =?us-ascii?Q?wvXqQV1zDRibumvYTzxka5zNHdAkVUe3NNCmu9BZuoB2139R1UDwmQWxEh7N?=
 =?us-ascii?Q?r+yplKB8qYFZEYXdo/fjoZExskP0iLAIh2GkEL/1ekUQjy7MzE4Wt5hywY5K?=
 =?us-ascii?Q?6Vm78cQmsG9V//FdtxlZmfFhrJ8TG6LestrU3VwhUypVPZY08hfsHC0k5I00?=
 =?us-ascii?Q?JMDDNgimDXyYhWFwlux0FrfJlU3KfjUbD30TmMYZVf6nQ2TtnnBLadcWokK/?=
 =?us-ascii?Q?EjikN55g3VQNkMrCRal+C8kvM2/ym34diI239JEvop8HMwKyJjga7CUmI6rS?=
 =?us-ascii?Q?Us4CCIo5HhYCyRTg/yi8TzDrW1Y7OwmtGtBxb/4xMtNhh2km2nP8Jh4uL+UI?=
 =?us-ascii?Q?c2u/J5ARSW8Tv1B02Y300ZxIAYJrD0Inf1NGI2TsuEfH7eduoVcZrYkMT4Ke?=
 =?us-ascii?Q?B9TT1WUUaL5X+NCtJI5C5MsByZlLcH3SQa4LDt7nKvYmTSVbbBrW2TL3XKrY?=
 =?us-ascii?Q?Rr1nJtOmrvKnlKJ4AGyWyZ878D/EkvCt//AuJYaPpv/+cVtWpa5Iy9gwjPdR?=
 =?us-ascii?Q?DDD9vRbKLbK8pmNzSv4=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:17:54.1095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 136b5ae2-9843-447d-9d2b-08de23995dc9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7628

Not all Tegra SoCs or all versions of a particular Tegra SoC may include
the AOTAG aperture. This change makes "aotag" as an optional aperture for
Tegra234 and Tegra264.

Co-developed-by: Prathamesh Shete <pshete@nvidia.com>
Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Admittedly I don't know if there is a better way to handle this,
but if there is please let me know!

 .../arm/tegra/nvidia,tegra186-pmc.yaml        | 57 ++++++++++++-------
 1 file changed, 38 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
index be70819020c5..defd9000eed2 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
@@ -19,17 +19,12 @@ properties:
       - nvidia,tegra264-pmc
 
   reg:
-    minItems: 4
+    minItems: 3
     maxItems: 5
 
   reg-names:
-    minItems: 4
-    items:
-      - const: pmc
-      - const: wake
-      - const: aotag
-      - enum: [ scratch, misc ]
-      - const: misc
+    minItems: 3
+    maxItems: 5
 
   interrupt-controller: true
 
@@ -50,12 +45,12 @@ allOf:
             const: nvidia,tegra186-pmc
     then:
       properties:
-        reg:
-          maxItems: 4
         reg-names:
-          maxItems: 4
-          contains:
-            const: scratch
+          items:
+            - const: pmc
+            - const: wake
+            - const: aotag
+            - const: scratch
 
   - if:
       properties:
@@ -64,21 +59,45 @@ allOf:
             const: nvidia,tegra194-pmc
     then:
       properties:
-        reg:
-          minItems: 5
         reg-names:
-          minItems: 5
+          items:
+            - const: pmc
+            - const: wake
+            - const: aotag
+            - const: scratch
+            - const: misc
 
   - if:
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
-          contains:
-            const: misc
+          oneOf:
+            - items:
+                - const: pmc
+                - const: wake
+                - const: aotag
+                - const: scratch
+                - const: misc
+            - items:
+                - const: pmc
+                - const: wake
+                - const: aotag
+                - const: misc
+            - items:
+                - const: pmc
+                - const: wake
+                - const: scratch
+                - const: misc
+            - items:
+                - const: pmc
+                - const: wake
+                - const: misc
 
 patternProperties:
   "^[a-z0-9]+-[a-z0-9]+$":
-- 
2.43.0

