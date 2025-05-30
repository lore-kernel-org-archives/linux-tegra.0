Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2066.outbound.protection.outlook.com [40.107.100.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454D822D7B1;
	Fri, 30 May 2025 13:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748612104; cv=fail; b=Yry1AfsnMSVu6Xa0+MDcKODXkKyyEKZBOjJCRdwA/r6uVCzFM0YOOHfke4aEWMM0aZkwC6T8kBhjaVmhaUrwgCB9mrlCLWiUh8OkD8K/pCQAvRLbIM0qAvp9CrxoUYD+37p9Hu/DzSmtAG2wzhTQH2SsZJEtFRAH3WG82YgUWKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748612104; c=relaxed/simple;
	bh=+1ZonidiUtWFh7D9/IGvBvGve/I43h96tsujlq12ulQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pcmRcxQ7TwtppfeeX3g1efYcEOQGi4dxiAE/PAiux7lAgRTr4bhNpdGI9Hn38nbyhaRTeCreX6SyMb05yOSvsq14cpZwqann59thaSFxcz0OYq5WSiP6uwA5LNDRW/B0Icv03TdAJK7zNpW1HAVUCUY7vi+jATLllPa7GIdPuX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SJY4ynV5; arc=fail smtp.client-ip=40.107.100.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SJY4ynV5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ct1zqNRDF7IBOexIAZyXdjIxL3VZvzRosjEaBEQHn61UXoQyXz1ofhA3apRI18ZHvOPhNXiI72SLzcvLQz/Nbh1YUwy6HssPCL150QKnD9VfAx3U6YxWoOiiuQc1X2OTVOZBNA/VEU49R+Z6sTPAibhSy3Dw5s0bHsqVt3iNEfu+EkhxyKzZuHiWE85ROE1/Rd2wrgd+d4OeJ2fZp3ybE2rws9OVK5wRK3gfdDxTHVRNyfcgxpt8JDiwm1lNnbbjixf6CHE2yiewR3MYUwgVIrYwIHsd+vYtt4Pyf/5KUqhTUxJPfQLpOImA7ntblXtfjZv7YhBzugqZLMTlbg2HUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YY+p9X/0Rb039oLPQ37fDmKssKoZLa4ATEbnOrXvzxQ=;
 b=ZUzKjrE94fhLseUaiP1qFFxSY/laIU9DcFj2zKOesMRsMFlZQv7wOejXj6JU8ERTAkfE/+BIpGr4U0UESaIP7aattTK8pK48vaUlQwXWY6pQap1dQSwBNHXEfl54lFYQafM4OSL+h2F5J6sxmWTFPP/akS+c2h7UBBe8pDftcFQOj16lWKiGIIvPERDGIzLadYRAcg73bpmssN41B6BdB+9q9T6b+hJBqdVsPnBf/w+9aFjcMjXUcJewBaX5J+F1owh4jss8jlOqC2CsCiz8ROvzNMx+SDdVd4JowiIyqA4MznkSvQGCiXTWezr4+Bf9SfiAp1SnPUyCjmZSPmH6SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YY+p9X/0Rb039oLPQ37fDmKssKoZLa4ATEbnOrXvzxQ=;
 b=SJY4ynV52koz6AjmabjPKFizAiEwUINknbRbvZePj7sh941ovQwWa4ZIGyMFh3eklO78Ws134kp8JrGx1x9wjjiVewtYe1D7D2s3ihpk2N3i5zfvHYVJ8Xxs8XWU0lfEuT+uiyHt8oJA8p8ikaOBwINltZX/jJleOZgm203czqGqI/vYQo9iDlirYu0bRSiSrP/HvNiTFQfeI+aEZ8z3IDrbBqjUpwuoFwumQdZh04IhcWzWuBwborOUONOp/OPRAnFuYye+YBXrf1WgldR3xbG8OjWi86XBD2CHPFDLoxmd14uuGiXUOHtmOeoHfXqU30edqQhVziT9JQmyceCR2Q==
Received: from DM6PR07CA0072.namprd07.prod.outlook.com (2603:10b6:5:74::49) by
 CH3PR12MB8510.namprd12.prod.outlook.com (2603:10b6:610:15b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Fri, 30 May
 2025 13:34:58 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:74:cafe::df) by DM6PR07CA0072.outlook.office365.com
 (2603:10b6:5:74::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Fri,
 30 May 2025 13:34:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 13:34:58 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 30 May
 2025 06:34:43 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 30 May
 2025 06:34:43 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 30 May 2025 06:34:40 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <--to=tbergstrom@nvidia.com>, <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [Patch 6/8] dt-bindings: arm: tegra: Add NVIDIA Tegra264 CBB 2.0 binding
Date: Fri, 30 May 2025 19:03:34 +0530
Message-ID: <20250530133336.1419971-7-sumitg@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250530133336.1419971-1-sumitg@nvidia.com>
References: <20250530133336.1419971-1-sumitg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|CH3PR12MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: c0b07ab3-eec0-4640-02e5-08dd9f7ec58e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JK0nq+132/RYOdUPgOKJoXnqVwKZ1w1Gr2iDwUto+jzvvaJ0eS3n4c5CQroV?=
 =?us-ascii?Q?AXCdPIEmZ1XKmMg5LyxKOeZ6FzQwWU+H7yprl8z6mEkhWDFzUBf88T2gLJqm?=
 =?us-ascii?Q?2GZdm6zayHUC3Xt7JYAkTKHsvpW7bRI8Oi7V+E54CAn/exijSqpe06YOWp6s?=
 =?us-ascii?Q?hoyKPCMOG7SbGQOR1mx/4TzXFjoaJzJb8Fa2JnfxdeYQ8kW8rR537e++T09t?=
 =?us-ascii?Q?uuGKSRS5nR9Wjs0Lgr4OQAT7iVqWOHMFCR7bIR0grlU1N/F59M0WBVJKlgnK?=
 =?us-ascii?Q?92lPRprrV6CHKjLW5rywv80qlLQjQ6NlYajhuL2EoG4CyXk9XnBmmrtlbqE1?=
 =?us-ascii?Q?wAJ6PAl0TTA5GLxfAzrdtWnsLLUfT5IZ2G64rkE8FNYc0pyQtePUL7/0WRNj?=
 =?us-ascii?Q?F/N4QkphieNE/aWJ+7Cfcj79Ay9YAG9INZNvZ3GalvJNg7nEBuKLS42fyEHW?=
 =?us-ascii?Q?piqHiOBz7bpuaLQRX+aGSyzvSN8OTaOGqUXObw+fhyHZYbLF41swNgDN18Zk?=
 =?us-ascii?Q?p4Q96bLLka/pMdAv5Gow9gyWXQgXR+vXW9du3602tXTCcKkec1i+LmfiQ1zv?=
 =?us-ascii?Q?KeGY6VxInQfkt/2g7MmWM1nnXRRjiWfsVC54ODFDhFn3q1wu9kSPrfixX3Yy?=
 =?us-ascii?Q?FeQrXV6wv0mjK0wYc/eIelxWB5aJQrPqK7DzNboX+HJWDMni1qzawhRJ8NQN?=
 =?us-ascii?Q?UVoD+RLpjZfbcG61NP4ZnalxH43R8p54HkCj51hL5fsEJUD/40zNITjmLd2u?=
 =?us-ascii?Q?zEjYZJMei8FprT4ee4UG9zTOi0HqWDvfBNiEI3CmWAHmzL0EMEM/0JqCADmB?=
 =?us-ascii?Q?jkKc2badhDnvF8/XEFjSroCVAiPjpmgUbwQv+KtWjZcrrhd7Tw6xUKEKjP2H?=
 =?us-ascii?Q?WRlj96YEbnQGIPA4twAD4XCPtVNkdTbYipP4XOb+Bwdw9XkwI8bNUD5kPDgp?=
 =?us-ascii?Q?4eUlKodDlmLFsZwu7voz5rMk6vd/D3un1723ZcS1DcpNs4WM9Sir1sH9j6Su?=
 =?us-ascii?Q?E6/BdAmJw037hNM+UYT1S5910vLY6glBcOg5fgAKiUuaDaHRPRrzdvkM5NTu?=
 =?us-ascii?Q?mZ2ROi1iey1KAd46xAJroafhIeeNlIGUeoCpGdhtFBWFzKMerRe+FboEWDEK?=
 =?us-ascii?Q?UBC1nUjMAGVbN8Pm4N7KY9giEdMql5158Db3W6WNRn4xxWN9hnjo3Ca6SgTZ?=
 =?us-ascii?Q?Xh84rAHn8ynMUtQ0fkC9anXrh0pNvPwN30omFlqWFZjhfXPFFdDhhPjjQN8r?=
 =?us-ascii?Q?DNq3RhUDsQVZ7/uPN66HHGCtCN/y33Mx5PXMO9QSZJJJTFilZg63/6m0+JLd?=
 =?us-ascii?Q?wvuA1k45wphajWKQ8BU/lajtQ+vBGTucOTz1/7yKkpyDoDTHpcpUVPAqprXX?=
 =?us-ascii?Q?6Hg9Vx3JOnlzfeTbmhcNLzqRhpW9A/M5t18f9RiwsP/b3pLzZy+15Sl9IIQg?=
 =?us-ascii?Q?gA9SdXRUD7AlRHy5Tf52ZpO4b4jbOiHWEboRGI0yhI4COgK0pkHaRuHDxzei?=
 =?us-ascii?Q?/FnhVUx9PU8L93jHU5a8FIf4DCPp3wg8+Phk?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 13:34:58.4213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b07ab3-eec0-4640-02e5-08dd9f7ec58e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8510

Update device-tree bindings documentation to represent the
Control Backbone (CBB) 2.0 based fabrics used in Tegra264 SoC.
Fabrics reporting errors are: SYSTEM, TOP, UPHY, VISION.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 .../devicetree/bindings/arm/tegra/nvidia,tegra234-cbb.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra234-cbb.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra234-cbb.yaml
index fcdf03131323..28227dfbb1c7 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra234-cbb.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra234-cbb.yaml
@@ -48,6 +48,10 @@ properties:
       - nvidia,tegra234-dce-fabric
       - nvidia,tegra234-rce-fabric
       - nvidia,tegra234-sce-fabric
+      - nvidia,tegra264-sys-cbb-fabric
+      - nvidia,tegra264-top0-cbb-fabric
+      - nvidia,tegra264-uphy0-cbb-fabric
+      - nvidia,tegra264-vision-cbb-fabric
 
   reg:
     maxItems: 1
-- 
2.25.1

