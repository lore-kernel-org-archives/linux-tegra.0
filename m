Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013008.outbound.protection.outlook.com [40.93.196.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9D44070BF;
	Thu,  8 Jan 2026 14:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767882758; cv=fail; b=ga0uX8HdRWzNIFFHkum5cw1If3atyL97Fo7iE/7CPktnabBR89u1CoXsetfV3+s9HocYhNZbPXHQQ9PmkAWTfup2KKPw48+h41qgZmKcweKFwCF3Q+sMa3gYWUmVXEApLH0BRMiZq8soWgGXkuBGr2eWmkH91wkX+T/c+mG7HjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767882758; c=relaxed/simple;
	bh=XhxhzzzV0dTCoo1NzJIHZ9vWg7Lmn0rVCnJL+886TV4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LniImFjQEIRKuigJSooj37GJdXoo+VQ/eAQVFR/3DApED7DC49wj+aDsqMQcIOIKQ+lUlC8gs04dngwwZY+0l4WUj8tgdv0LuVe7vWJXFXqajSP+3tEA7TcXJ3l8aSa5pIAjPM3LHExOa8S2U1ijqvTNF7TPowQYubIlgw7b3aY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oWWZmGEY; arc=fail smtp.client-ip=40.93.196.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oWWZmGEY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWxm8pnMBA/2ll4YKVduzHHvndAgyNARwJJ6X3LhugLv15/VGixQ+seefLUjmFO5p8jz18pShx9jxdTx4V6PzPFhAjyDroVv49GGJDC3UUpf7ptMPlVyxgwstbFoKPhTe07kYQhU+1BsvzZHUj+yQq3kEv4Cm6fah9f6QUjV4XJvP4XCU71XRGjY16yJhnrKspf8oQynJfWYqalSHUE94iu+Jtr6eFqi4mH315dzmZfVE1pj0gqX/mwtalZNxo/FIhdwHilNApOCX0DRN2IFo4NcqsrJX4hCaO1AE4icboaD8uTafoEUegEwYr2wawjFRChd+znwPTz7E2UShNDoRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mWxwYzc5mJ6wM3T/J4pzXaJg57uMtp3piuM1M8f+Fw=;
 b=ZiInqSZKvYftvwQadtI2PE453+OSR+1l2k3Pb4vFkqL7YW8WgJEQ4raJymXofVVgPKdcqDFa29komtBTsP4C85kSWOTXO85sm1R6Wiv4A8S+6BKIMUid4UlwM0L6ngtmuFELCYQgT0JiiJT7HTt78zn2/zK9WNB0D+4d3EV1xs0S76scm79iuELS2PP/fzf5UD232GIExfH9JBQ2nZxeTVe8f7sLMLdQ/h2yVLIWDyStwmrZsGJCpeQLGRqujUtB9UenYvoB1RZG6IabYslrfeo6xg47SERtSt9+hV1b9vfIa5UGTTdR5J+B79WjrkgldFCgRmOkRweQTea/M4Vnmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mWxwYzc5mJ6wM3T/J4pzXaJg57uMtp3piuM1M8f+Fw=;
 b=oWWZmGEYH1bd9l/uDNCK68IdBVB3ybzjaWPOSm2FFuKEVhyW8MnmqH09SOwSfhPP7a1vKEW8l307R1H4UW3dtMbX7DAzl/bAx7N3mwIkbYAzMbDvFM6rs9d/8RAGRC+JBhaHoA3YcM+Mbc0xmlHCGn8kKZ2XAadEDBYA8JU6QSZCia8S0pBzpq8kfHcT+oCZLKViKHIxAKNjRws2IIigESrVgw3D8PINn1YfDbCGXJwWAnSPJT7iOPNPVjiQs1EIxFzXHBqXg6M2nDrLKcSBLToeTHf/9yy8zbnFBloM8uxG4Nd3bEr6Msgh/JOb+api6gDYDel4YwnFYvSOEwvMvQ==
Received: from MN0P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::12)
 by DS7PR12MB8290.namprd12.prod.outlook.com (2603:10b6:8:d8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 14:32:30 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:208:52e:cafe::a1) by MN0P220CA0022.outlook.office365.com
 (2603:10b6:208:52e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Thu, 8
 Jan 2026 14:32:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 14:32:30 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 06:32:11 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 06:32:10 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 8 Jan 2026 06:32:08 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/3] ASoC: dt-bindings: realtek,rt5640: Update jack-detect
Date: Thu, 8 Jan 2026 14:31:57 +0000
Message-ID: <20260108143158.351223-3-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108143158.351223-1-jonathanh@nvidia.com>
References: <20260108143158.351223-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|DS7PR12MB8290:EE_
X-MS-Office365-Filtering-Correlation-Id: d48f3a65-9977-4044-3603-08de4ec2c126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iWxox/lJZhtjX/EOqfCsPkZdrGQpXPKNGfcJZSsjH0TdYkdOF15hNWsg9Vh8?=
 =?us-ascii?Q?5Qc/1eAEB+D+V8V3TsB5NtiymrmGLchnbCxCxWmPpAT4qU9Fm9JsNKz7yYbh?=
 =?us-ascii?Q?29D8OPkybSH6O5HpjttjcbAJr3ixWtEHChpw2QO0knLtGkFyZYLswRad8Une?=
 =?us-ascii?Q?O4NWp0Dz2490YbzmEbV9gM7BBifWF/ZSC07S8CSUeQeJJmfSKiA0eYdPiSKj?=
 =?us-ascii?Q?IW0prvURtCsZwmtsCP20erzGdByjv+IguFwvRs6gy+Rd4QwF745oLXif2e8i?=
 =?us-ascii?Q?Q2HVPFeSDW6MWhV3PFKxEinul6+VImK9tTsAJIGHTtzoXzCu3IXtBtoMlmyh?=
 =?us-ascii?Q?S83M+dqlOMXrL8ER3K0BCi0nBs5MiZqIQBfEsslyA4LqG5b2uCQll18RAgpa?=
 =?us-ascii?Q?Qpm5coFY69WhddCtu6d1CKN/nrZO2wlZ+pDms7x89DSqwfcLrX1qDyPJEUkT?=
 =?us-ascii?Q?Anz9PeBDkLbCRVuKeOOhKU93RrctsDz20ptoqtxdSoofrGZm7KFLS6wMmynv?=
 =?us-ascii?Q?IGGSvIiKhCOXRjAJpxNhcCFhrWLIKhenHW9eC+HGrE0Z2AHJk76sCYdwScXG?=
 =?us-ascii?Q?DeV8gjp6+p7cRrKUH7PxHOk8yyMsWA0geEjiYPMA14Pst4Yor0MgJqJ4gGEE?=
 =?us-ascii?Q?kQR6sf0ujHMbGjlgH5q6un+2Fdu/+X8ImA+y+hCU6HNj+Q1uQUL5/9MwtMqU?=
 =?us-ascii?Q?38VnFaOwYOBpX+CESwFBFY/yupmFtAlvgJ7Iez7AGB6dKwwSJBrUeCkLDUhm?=
 =?us-ascii?Q?3UFQPLwKiovf+eJ0U3oLVGqReDMRLuyPPFxVyQXA5d2v5XaoJ8MMLrwOLQhr?=
 =?us-ascii?Q?wQb9BVdRqJp7QcS215X6kQzSVu51C4kCvRTK0KMIjH2BN8yMralXV+hZlGio?=
 =?us-ascii?Q?fU16Qrio+NLTN6TL9XahYnaB45jufDsRckTiKoe//aN8Xsq4/26j0QgjWm9p?=
 =?us-ascii?Q?BrRj4DyBsB6XZZ/uX8GQbSDFPREyubUaR7azWyUM1F7VHgvBrsmZG31niCxn?=
 =?us-ascii?Q?AUJtFgqZrDGm4GDSTJRjukvLUi2CEfIdyljmg9vqHFA0rbISkaPemPwtkN9M?=
 =?us-ascii?Q?oFuZxTBILVrJTgd22ey64gz66j9m6FY0WAubOjtzvSisDZz1Uk1jZaAaS0Cy?=
 =?us-ascii?Q?51LgdF/Qacxnnu8o52ovy1d4oZTERgXYJmeOAnjA2gXU7LFvSTv/N+gowJUK?=
 =?us-ascii?Q?3gnv8c2qWXTNAeBZ3UimL+Ar5jtmJs3DLX2h3xhzU0c//ke00J+m9Z1m66o2?=
 =?us-ascii?Q?jJ4HzSoPzghEZ+ikZ8C0z9qdmL8SVsNguulR6Vf/aoSfM56K5eKMieGxGk7Z?=
 =?us-ascii?Q?7zalzK5qkRLTgZHKt6ysotCqtRzmAA2HRtQMbwTEU54dV/jtQ4F7cGn15sJI?=
 =?us-ascii?Q?kJIXdS00y4Nwd4FBuLpmVb2jd3YyLmxA0qSsa22pkCpK0Jd7pBRw2/6syV/G?=
 =?us-ascii?Q?+rmrBdnmepvSwvVwEEjPIeqNnDsxgz3sonFu1ZvdZH3TT4AGL5K0xgOPphJ1?=
 =?us-ascii?Q?zuEXBX7dzskXYwRl/7adjx0EpzcA+n9eudu5I/RiZY4EPWlUgwRTzkEz6jMu?=
 =?us-ascii?Q?xoBFeoX8PE1hvUvydoY=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 14:32:30.2396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d48f3a65-9977-4044-3603-08de4ec2c126
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8290

The device-tree property 'realtek,jack-detect-source' currently only
permits values from 0-6. However, commit 2b9c8d2b3c89 ("ASoC: rt5640:
Add the HDA header support") updated the Realtek rt5640 to support
setting the 'realtek,jack-detect-source' to 7 to support the HDA header.

The Tegra234 platforms currently set 'realtek,jack-detect-source' to 7
for the HDA header and this is causing a warning when building
device-tree.

 audio-codec@1c (realtek,rt5640): realtek,jack-detect-source:
  7 is not one of [0, 1, 2, 3, 4, 5, 6]

Given that the driver already supports this settings, update the binding
document for the rt5640 device to add the HDA header as a valid
configuration for the 'realtek,jack-detect-source' property.

Fixes: 2b9c8d2b3c89 ("ASoC: rt5640: Add the HDA header support")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 Documentation/devicetree/bindings/sound/realtek,rt5640.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml
index 6bb6e12bdf8b..e7d4ec29b0ec 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml
@@ -106,6 +106,7 @@ properties:
       - 4 # Use GPIO2 for jack-detect
       - 5 # Use GPIO3 for jack-detect
       - 6 # Use GPIO4 for jack-detect
+      - 7 # Use HDA header for jack-detect
 
   realtek,jack-detect-not-inverted:
     description:
-- 
2.43.0

