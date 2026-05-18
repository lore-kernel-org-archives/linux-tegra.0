Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013012.outbound.protection.outlook.com [40.107.201.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDF031A7EA;
	Mon, 18 May 2026 10:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779099301; cv=fail; b=hsM4Vbo3C2frFcwsEtfFWuTmkyw4iEmlW9yXePEAeyFD9sxIhaH+qnZ/Tmx3BvOhVSA0hWJlMpJosLxPNFFJFTtKIHsQGyEpK1OBQsahC3eN5L+d+pYxZl4IbF4YhlG8UyC3pmsgn4G8OVamtit8vHMYE8oG7s41jP0uUfKBJ3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779099301; c=relaxed/simple;
	bh=QKcYKcvNicPa3B9n3hIvd0LSRTsUXMvLdJOHqc9tk6k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=St+cFiz0ZAeXbg2qIY3rCfwQ7YLEbwCARdFeObnSAHJ7Ds78GfK80KSeNLfBSSmecRe6cN/Ljtsp31zrCX9nJCfY3/ZUiHD3Xg+KTpP5v4Nw+ZRZQX+5CRvgJD2OgszEn74Msc7sa0+i5zR6iWX/GiD2b6HahHpaR6VLpk0MAL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IfRldd7x; arc=fail smtp.client-ip=40.107.201.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IfRldd7x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bU9gPQLmXpNZJ3zQeVNR0sNYmFysqJ/9fhVC/11o5qYwZwAsdVIwJgZEV450cAcnb556/qKumeZQChra+ndWj5dsP2kTFDpbfkTEeLZcacQmXZGIIeVEFZNCUMnG9TI70UDlDokC0TvSIeJqBEh4dMEE6LX1siwNOp4CQQ18nBqg7wnhy3Dks6oH+K/he+HBtNQ2rQ+OmjkXwb2wZK60y/8GGTxI7Aq9tXG+CeJ2O+GxM0apnE3ZL+wMleqkLY4XGvxXzTHcorvg7ejRW/uKhYrM5eBiM2+ieOhMKDSdK7jvOLoYOIfnz7/RySHV4ZB5MbRj1xpIw5G7kihdX3C7Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LKgR2uG95KR4OKXVNMBjY65qmmUZNQIUXMRfJuWpDgM=;
 b=jJTsb+CI6P04TImK6NjykW0/xYtl8pVv9XcFTVpCNJeiVZUjdoiTHD/V2BMZh11AYka02iUD8ZWC1aLlYh6jmMN885BywPZl8IXK1cVwJm9kEgAPNuG8upTlJPDBi188e0I94W1QRz1V2/gXjpDtUNVOFWGzUtUYfkxRO7xTQPPib5k/+zncTTZ8z5jlO8cVRHe9leLhXWmgPrrU3ceoGBOCd5sDeX4GKMBHL2rM9Ljjt06dS0xpYPa2oZSrsOo8lN232ZbirfaH8eOsNf6VmnBLaf+sBHUdSumOssFobQTF2uADQcC170kKW8NUUTKjFlxM/l52SsOYZVS7KtAFKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LKgR2uG95KR4OKXVNMBjY65qmmUZNQIUXMRfJuWpDgM=;
 b=IfRldd7xHTWvfEA7/3tQBeF4O+v8TwD4qyGJczPKP1gShRYA+yaJpDcl1g0hq6kUaHMrbu0TRJ9IJtvx/hjtGZ0oTs4YUen5sCzwPKx5ap/dafb25wotKcvsjUbFMK42cWOQHyXJ1VPlioL+2jQaF4BztqgsNubOPiFK6gTFZRshcc8gvRrvO0O7xgYbO41mxWIkliTNatjRiTc+8kMTlk7Gqwpu8Omjq/Glp/eKTjXysF9jjZnR8vzDJ7Q2sPy95+H9Ya/2tKfARD8Ip6FTBJf39leUj+DvL85C4e+4SBAogu3xHeB3w3v8WCYYfYRNeeMbY2+VS63gmXzIdJYUNA==
Received: from BN0PR02CA0011.namprd02.prod.outlook.com (2603:10b6:408:e4::16)
 by BN3PR12MB9572.namprd12.prod.outlook.com (2603:10b6:408:2ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Mon, 18 May
 2026 10:14:54 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::4) by BN0PR02CA0011.outlook.office365.com
 (2603:10b6:408:e4::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Mon, 18
 May 2026 10:14:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 10:14:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 03:14:33 -0700
Received: from build-pshete-focal-20260330.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 18 May 2026 03:14:32 -0700
From: Prathamesh Shete <pshete@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Prathamesh Shete <pshete@nvidia.com>, "Conor
 Dooley" <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: tegra: pmc: Add Tegra238 compatible
Date: Mon, 18 May 2026 10:14:19 +0000
Message-ID: <20260518101420.171465-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|BN3PR12MB9572:EE_
X-MS-Office365-Filtering-Correlation-Id: 4547dc98-237a-416c-710b-08deb4c64e44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|11063799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	M4oq1zrfjrWGWzrVkrmKlMQO6OJ3TqamJ7XQJ4azPTFcrV1h0Sz/Jl5yakSIntCQHQTVgOmQj1NlSH4I+xxMkdGwcPrTwpKzmTFW4HG28HPtiFA8Df4cizpgA9BVYQA8fvJYwKNNld3ZyJg88qrOihXtEwZ/nC2DWoYIIP9300VxPIqHXy9V6ISgHOjGLec5SIa2jjtkfePggyWI8Zb/QXT4QznRBJ2UQCgoQ/okCkWdFLoyXu6aEdMy2rVc2KVDATp1fU6fvyFU0wMYPNF2wGTPrwcCl3v8W0cnvyWfjXA9JtSA+49PeI0PYhdFaS3+dW3DIQnZF6xdaDv7xXyJpUlZOJQaYYln6U7u0/6p0HyPCCOPEyHEQUnhxdCh7VZpnEJ4N/Wua5RCKasikOs+bn1i8qnZQ3Xa4dOzzG3T28J0KjdtTvkiXsYG20da9fgXAHAyj5cJ/uU/C/3jKeHWQgglwB/+YbGf89rT/wMR8l6x4+mHct+5E6US+EZBD7M0kJeR9MdlUU5wimCfOCgN9nPc+2RiMWCMEg+GjuqFGTujww5pkBAA9EQ6w4uuw4pvxopF3JQ3pKkLVCrsFHuDPuqVh/yyCH+wdUMtNn2WgdnU4eK1/dFnE8lIKGAXLb4wSJzPOyJqDINZWen3fCLw9uTN3e9f1dykRErOMr0B7xPop12oL7MK3MZkes/aQSSKYwcnegPyjfaz709POafzkYox2g2jOBMHviKat8IUcWY=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(11063799003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DtWKXUZ6hiU//9SqvhhNq3eo9a8HdCv0S0c1hElGhLzer0OzoMzzM8HnvQMeuMayoyNstW1vwN5M3HtmYihfz6GfK4GIUTCgquIchtElw3jtJzh73KZcAqyq9nCTLSn+QAOj5L6LLewGjPQbmFxf0G6qQan9uAC1CPExjG12MFIzVg+ZKa39e3yXKSYvlHvEE2chTHM+UJW+TRByIaZoOemdxn7qp9Hsc+jdjIrE8AxXdC9BraoTBk0KlaOrs6Gh1nbbS1ajz5JYY0YB3gYlHJuesd+LTeXXji+DNOuitQprx90XEVU43yeVy1Xzp+6n0TJZvHZIC++U+CCqng2ZPJ9wo5Nas1Ma18SwzVPiWQ95QycLotzY6Sk2tVHINfK5b950vy3WeBRcRqFXqlYpDQURZE5ln/N8pcWg+OV05RDX912uFuDtrXXuzt+c3DEA
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 10:14:54.0750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4547dc98-237a-416c-710b-08deb4c64e44
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9572

The PMC found on Tegra238 is similar to the version in earlier chips but
some of the register offsets and bitfields differ, so add a specific
compatible string for this new variant.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes from v1:
  - No change.
---
 .../devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
index dcd1c5376507..dd1f637e4175 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
@@ -16,6 +16,7 @@ properties:
       - nvidia,tegra186-pmc
       - nvidia,tegra194-pmc
       - nvidia,tegra234-pmc
+      - nvidia,tegra238-pmc
       - nvidia,tegra264-pmc
 
   reg:
@@ -76,6 +77,7 @@ allOf:
           contains:
             enum:
               - nvidia,tegra234-pmc
+              - nvidia,tegra238-pmc
               - nvidia,tegra264-pmc
     then:
       properties:
-- 
2.25.1

