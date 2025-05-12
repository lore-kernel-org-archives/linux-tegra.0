Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7472561BD;
	Mon, 12 May 2025 06:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747032214; cv=fail; b=UgDc8SJ2IzXPfB0Vw8qi2CtrjW8Neq5xJO2TL8AWku+x0GSU9EoAWY1XfbQU7duRVu3SDLHzIuu/1jEADd1tZCluk2sICgqRWUo7Ans1VBryWA3l/3CoLH8yZIyNBHw/OU6xZO+z2PbujwBEEilx6JAUb3bHmK/EwbCI3BPYfLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747032214; c=relaxed/simple;
	bh=cooGQpks+hYeI6TCU1PEBiRKXtNRU42WoVxPgjIH94Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pWdqVZ77MpwBuqtLcAwkYfVsuVNMbXg4oTPRwDa/mSf48GdmaW4htoqP2LRlcsvzPTQ7H817y6IziwsjD1LhlKQy5ny20JHnIILGkwZGTTpARYkiClQxJRVp3XTrn9Kwk5KlQd4hlQYHt8f5rJ1DW5uiZLRJ7F/WTZD1WLNbK2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oq2Q3JDg; arc=fail smtp.client-ip=40.107.223.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oq2Q3JDg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRkSMRJf/fPWzjXDiLVYjMMnDHvCuqbynrc7UKtfXQYfwprcnc357T9PoUik1+zAyhEcUgO2ussN7c7HIsA1E9TShbvtRDTG+qtYMuTuGbPcT62Jztwx56NYJkjSi/WM+qWtmDodB6kSsRGxhhm1VWgLJC+yGfSHlpUw+TOF2zxCJnNm30ClTpuFRQ1s3guMJZllswF4af4Bov+DxYnqqBKRTrzA4ilPehZrcnd5iPuihGw+yaasCSGLZkxAG19HDJ38w1IEE7Z7ELYqqCtunhzidsijbJ6v6ceK1VA4VCw8pQ54bpGS3wJ1Gls03EM/oOCDziNjSvRWCpTIUb/Ckg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdy8uLkBbBuIiG7UvQNfJ6rQJg0TEgLCfew5WPcCuWs=;
 b=BOWli9SRDepsyh5DkTKkbDP3rSBBVei1OWQ7asJPuwSCxcwldPkQMh7Nv/9X+glBGy130YSt8KLZ2Ubt8Ph5Ww/jQBk3ixi85s0/M4P94b4gKEpfreqJ/h6QIkXijs4Sl9lNjTLOOHZnVHrW3RoRHB/6DdDH/t3+ky0HMHfCEv8WNPnu7OQmADc2qtq4Y7x9vj3voU2lOgtMrT4/kHmhRiS6pemMlJT788t/1eZMqL5tz5U2OuF3lls55uqfKGD0U+gKClzJ2p36py2hovuNCkcYq2cE4qXerOPM69L9rBTOH0UB0fSlY/1+2r+tM+JA9epP+33ZX9GjA8K4kQRV1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdy8uLkBbBuIiG7UvQNfJ6rQJg0TEgLCfew5WPcCuWs=;
 b=oq2Q3JDg7+U1VA9zbkF4Z1FqcgfGiWKuP9g0dCH/ejLHyG2ihmrQShWsutsZ9V2Mzx9jBKgeAUapblX+Yx1nFV8g2hjH9KGe1Vh5wDrtVJ6+1LLDPqkbYp+p7eBXxz/cqSIHqzrurMVCMf487jdLvv/dnrfRGSjJyrCD8FnYs31638TXSeS4EGGoz+BbNE+NeQEs5KkEGGMwofi51s6MmCuyGvylU8x7ZtDYFl68Zkf5dQ0oHAgsinJyg27knEJ1e0GSCEoRFovK2E/ptZ1jJtTNbM2p3n/wfbrkKhfMw9XKQcd9MuX+sog8hrIFTad8tAnUcC7FpE2twhEWJa+KQg==
Received: from DM6PR07CA0077.namprd07.prod.outlook.com (2603:10b6:5:337::10)
 by SN7PR12MB8169.namprd12.prod.outlook.com (2603:10b6:806:32f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Mon, 12 May
 2025 06:43:27 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:5:337:cafe::24) by DM6PR07CA0077.outlook.office365.com
 (2603:10b6:5:337::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.28 via Frontend Transport; Mon,
 12 May 2025 06:43:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Mon, 12 May 2025 06:43:26 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 23:43:15 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 23:43:15 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Sun, 11 May 2025 23:43:15 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <perex@perex.cz>,
	<tiwai@suse.com>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH 2/3] dt-bindings: Document Tegra264 HDA Support
Date: Mon, 12 May 2025 06:42:57 +0000
Message-ID: <20250512064258.1028331-3-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|SN7PR12MB8169:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c0a3203-ad1d-4ec3-a101-08dd91204cdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B3/Jgx3Vg2fIsnb3+fDvbg6glltoQee4p7Hfv0RpnaNZLHqFS3wY9H2juQnO?=
 =?us-ascii?Q?Vola9Bhe9PTLroTYsMej/2g0eLGaxbjanwwgXYGYkcUU4IZhQJlf0Z/PcBZz?=
 =?us-ascii?Q?oHylk2xZAPdnaNlEHyP9rBCvhYBepAplDK5v72OMRAz/aXJKyoFZrO/EY2D2?=
 =?us-ascii?Q?irGTNeM9JFGreEQKEIaDJnv5Kdj2CNT0o1eBgC53TXyrqKhtOOnGigijLM6Q?=
 =?us-ascii?Q?COLeTxmSx+P18nlCab1jmVXnGrY1QmNcUg9z+FzNvXAXV8DCRaboRRedllj5?=
 =?us-ascii?Q?n3kMvfFGVOA22hr7FB57LzbpEr97VI7jb/Fma06k3qBWf/w+EN7hYMVEWDNg?=
 =?us-ascii?Q?6iYsrA2jPG/wG8I87dodrZqwx7yFdngUrEJiMDISs1Yt1AFsKP1FMNw/+T7q?=
 =?us-ascii?Q?IK0QypNBIHe6xNCOowh+FuCfoo3I84A6NHwNObd2vUvZof5YadUH+Dw4Y68l?=
 =?us-ascii?Q?qwR2x4UUxvMKcL9EI5udfufJCvAvj1i72UKLgTaBPT3v4l3aJaX20WkehR+c?=
 =?us-ascii?Q?cGCa2tV+XLknoKhCnTjXeV8YwGcOkTR42Nmcac/se9vEn/luvQFeDpzqeZzS?=
 =?us-ascii?Q?wFEZQvFIMfTnn+hScGaIERMsV5tDKGf9jMAhwgjcsk3lM7SEhKDnOIEbLi3M?=
 =?us-ascii?Q?0Fkns/UtuLJDgLtGiLbjIcWg6h/4oumAYTnZT7G/d/10MmSqfsQRk3wmSrUE?=
 =?us-ascii?Q?0GCphwvPKmuP6paGaUl7VQM/s30yehQ5hYXe2yPw8L15UfEyynWULZUkWop4?=
 =?us-ascii?Q?5lF1JqH4OSzkjgtN0B3CDazowPaYU+gpMBabSbkZMpxHjjg8C6RF5ujei0DS?=
 =?us-ascii?Q?hBVbnRtk+ZoKqR85GzHZCv/FTcs1q1M9I6ew/Sq/9vmKUuCec+laf5UrxgzS?=
 =?us-ascii?Q?l15MV9cZvcBBH50NYlrHkPYx2MqYS7DTUst7NaNJOU9+Y5aMUgSClf/4+7yS?=
 =?us-ascii?Q?hRQNgUehpyuxQXU76Ged4UlGvIk2IJQKALQfCBcu1p6E+rbsYixsr4BwxVC9?=
 =?us-ascii?Q?7HIxAQWoq9j9JiH7McTVmWDqf/4wc0BpIGcJUzRhA3hbd9++zi6DNeXGLRT6?=
 =?us-ascii?Q?8bLmi6f2rgaHamxkq8JGYIHSGCVRqlXmqnZfaW+s50hlYZSoA86qei0Zkhfk?=
 =?us-ascii?Q?O5u4eqhPChgIJGWul4mWInEiQlOcDsbc4H0tbKcH5j+Tq590RW9a5RQOmdWP?=
 =?us-ascii?Q?XhHVdvTbdNrRC7UKwoHrv5q8eHkvCdo3GShhg56sonosoiRbZIxJxJBFI4V5?=
 =?us-ascii?Q?E4stjKvJ8zPYrxKjhPbVnpZ8Pf0K53xd+EmZgBMl8FkeeaBgS/I3beMM7GxV?=
 =?us-ascii?Q?T2x7I+hjeKhtE+qMY5FzN1YtL227WSFhoGXg0t/R/ZCjr3K8nYWhZXS2v/Ux?=
 =?us-ascii?Q?wGoIfNQnFIB49ENNIO4/+VlohfIx5xVa4UaRRYNwCGmWm+fLcmQfAMr7BXCO?=
 =?us-ascii?Q?Ulve4YSE/m+xfrRgVtKFn0o86VTiwPsP44i0AySCCi+A6GNudmWS8V9dXs94?=
 =?us-ascii?Q?tLzyQWeTEuFjPhR8uCTfvxrEAvFiGOolz3zd?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 06:43:26.9669
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c0a3203-ad1d-4ec3-a101-08dd91204cdd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8169

From: Sheetal <sheetal@nvidia.com>

For Tegra264 device there is one clock, two resets and no power-domain.
Add the Tegra264 compatible and necessary logic to the binding doc to
determine appropriate clocks, resets and power-domain properties based
on the compatible string.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 .../bindings/sound/nvidia,tegra30-hda.yaml    | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
index 703f009862a4..8a8767589ee0 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
@@ -24,6 +24,7 @@ properties:
           - nvidia,tegra30-hda
           - nvidia,tegra194-hda
           - nvidia,tegra234-hda
+          - nvidia,tegra264-hda
       - items:
           - enum:
               - nvidia,tegra186-hda
@@ -44,11 +45,11 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 2
+    minItems: 1
     maxItems: 3
 
   clock-names:
-    minItems: 2
+    minItems: 1
     maxItems: 3
 
   resets:
@@ -153,6 +154,26 @@ allOf:
           items:
             - const: hda
             - const: hda2codec_2x
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra264-hda
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          items:
+            - const: hda
+        resets:
+          maxItems: 2
+        reset-names:
+          items:
+            - const: hda
+            - const: hda2codec_2x
+        power-domains: false
 
 examples:
   - |
-- 
2.17.1

