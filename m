Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24D027054F;
	Tue, 29 Apr 2025 06:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906409; cv=fail; b=DzGkNcJ2z4ZvaSrVESvDo4bX2LpplV3ve3NDMqc5XggHyt3JN24dVB2X2ymcrVVxwHG6jpSyqeET6Q9nsVtYUIFbJ9Y5qsftKjJ7Wi8vW/RobscWFS5gH3abBMlrYceAjLQ9L1V5y3mY/7cw4UDzcTcgANfDqULuGT8L+e0knOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906409; c=relaxed/simple;
	bh=oMHeehJpn5L7D/bZQjwDCQyQPyjjVVpX2Yfun1gM6yk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TcE86CJscWKyS7G51Welyxuom3xSrXBrb9DAEbXTVXMD9mF8Be0oeod7BcFnM8dlb1qFJl69JDcHP76PDvbBMOY03Ezf3z77OAdKOt2/pXUvGeel/b3dJGdBOJb2fMiZABmp8ch7e6NdIG35k951tzKLaifoLlP1WSDPdxZmVRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=daN5LHeD; arc=fail smtp.client-ip=40.107.92.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="daN5LHeD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJgdUewfYOdkMMdg7FNFATp4/YciKtgXXwXYCfdo7whW7YauCzt4XB7gD7clE8foDHVxkHWIe8ogbujCBHqhNiwSmxj+ESm2MB28v6UsHRV35RPPiPZWegUvLx/2R89KnaOwNgsR5d3QxuzlkfB2WEJxLF4KYPun5IMYZf+LqCNWC3K5PEmaNN9ETL798k50Waibh/VLwd6pVFTvRCe20ABePOJ2RAn5O2TCyP4bV+6nEiOJdIIX9g/SzltYD6n9JGUrmRdfAhTbd/ZKnLEL2pzwD3Z+oN1L1+32DlpsEkzf2KWuhdNU3qTAKTRbszar+71en335YpACDPV//ip3sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FpaPgV0KXRjGHzNtHnTOgwkRb74x4oFDtrtzBNsVic0=;
 b=BNDVoROUVXehknyGnx8iNlxZS7JyigWyN2Gw0TGo6XZrPwjbQJ98xXY+B+/KZqE/z7YXGACU9useCdF+kVwCb+1RVfdQQvve/rUSEYxNWsfxkoKzdQ2+35ofPhcsQFcX7y8vkIk2YF14wx1NdlqVzJLU541sRtsz05FhNLJb7GrmlszsCg46TYo31qOodOmGj3IXqxDTTGTWzKGUy6q9+m8gLZYDPUc6H9WzPqXtql2j2EDTasfOFKmtL5TEFtR1cf7AeYm25HnItq9U/7yHzF7F1pcdISrYctW7Va4YAB5zZS0n3BrP+6gK5fGLN0uK/0qG5fnxqCYi42ufYyGcrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpaPgV0KXRjGHzNtHnTOgwkRb74x4oFDtrtzBNsVic0=;
 b=daN5LHeDQJTlQLdqYAIwJXt6HzTpq+UxZh8YnlYWBaXkfL1oGIcPj0QWJ7ksXGVQxg+I/0W0rJjWREKUqaVP9lshcABCnyfXxs2TCL0g+6oCzzA8fkOj5lHFBOlGl/dQffC/Y7DyriC+ClAp4AjEuc69XhYo9Je2NaYoumhtdkml1telKjp37LeW52SBZXszW4uTMLl+AyWVvQ88lFwoI0hLAsDDJXDJzI2AiPauyHkOh9H0AI2Lk5gAxgie93ynr2PhO0ovtpVwmsIixKHmw0OLdDxJZkmB1BHjdeTJQv+ecubNOAmSjA4geTCTlm/7MGkO96nYMtPf+vHn5F8TzQ==
Received: from DM6PR05CA0042.namprd05.prod.outlook.com (2603:10b6:5:335::11)
 by DM4PR12MB5915.namprd12.prod.outlook.com (2603:10b6:8:68::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Tue, 29 Apr
 2025 06:00:02 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:5:335:cafe::61) by DM6PR05CA0042.outlook.office365.com
 (2603:10b6:5:335::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.33 via Frontend Transport; Tue,
 29 Apr 2025 06:00:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 06:00:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 28 Apr
 2025 22:59:44 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 28 Apr
 2025 22:59:43 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Mon, 28 Apr 2025 22:59:43 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>
CC: <perex@perex.cz>, <tiwai@suse.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <spujar@nvidia.com>, <mkumard@nvidia.com>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v2 01/11] dt-bindings: ASoC: admaif: Add missing properties
Date: Tue, 29 Apr 2025 05:59:31 +0000
Message-ID: <20250429055941.901511-2-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|DM4PR12MB5915:EE_
X-MS-Office365-Filtering-Correlation-Id: 1efe2d82-6d67-4e9e-ff11-08dd86e314a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vMlL5Qx/IJxf1KSI6ZEsEaLaPsNDgb7MptuhYb9K4KXGaiKRhEJxyk6dxwwB?=
 =?us-ascii?Q?MEqZZTUghg8WkjvY98xUzykY75l8f5/pqpMcHN4+HbTKjG5EZ07QOMA8PW1j?=
 =?us-ascii?Q?0HqdQbWC/K62uSSrXJ5qrNgObRz8LgB+U34ygBp89/iYUzZu50L+XxsAHEQg?=
 =?us-ascii?Q?X1Hl+rf0leeQ9CLwRtaNVUy/VDUHiAIovw1LkznNnF3o7IqpRowx2XsQ55pe?=
 =?us-ascii?Q?AETuu5fRoeVzWe1f5CxF2Eyi4fHS0xTOiOAbgQyovhFBYoUaLE1vORGBgrja?=
 =?us-ascii?Q?2tCtUjqYuCfBnf/y3ZXPag1UYaG3U0Q31009cAoJ2XtKMCA1iiDcKUfNpwPC?=
 =?us-ascii?Q?ZI41tlk/AQXq2gBq9GBIl7VgqGMzsq90t1FMc6MjUXuOZVjfslPaCNf1ErwU?=
 =?us-ascii?Q?ymJ4pvWsNX3ohj0Ijv00cTGolSikkbz3BkScLdVA8GSFDLDNeDH88GLmRVK1?=
 =?us-ascii?Q?bkjTY2TbygQukNSou4hOfwYMwwCUHQUyGiLzQqmmulY0K8lWT+hSRNJLhvC6?=
 =?us-ascii?Q?YWYxSvn5JDWyx+qNwhwbJ+wRsuTFM+KShV+tEH6qQstp6PWCvdkn7HHPO/JA?=
 =?us-ascii?Q?ij20wMeAxXjr+BJDpGeAucO3hbW5I+ZjKGi8j/ZGSntGqc3QyoiMUVYzk7M3?=
 =?us-ascii?Q?K2BUj2zMgKPDHl/U8ZhS+L17QjkkJ19ETRLc+sOsMOGFahpVy/5TQHkIpbZW?=
 =?us-ascii?Q?M8UNmxOZxU8ztOIwwQMdSfEOc00wxTsbcx1kJ9JqL9Ko3rppGUAqgGiH6B/C?=
 =?us-ascii?Q?ww6uDhKmUPoR7dPeyRQVgDnMyPlxSWo1aSmv8WZZUqZzhd1AL2J1VLySzb6j?=
 =?us-ascii?Q?L2R6xHoQduNd4y1HbhiATWiT1GOnnviRQtM9S1Zlkq5wVNJZdkVVAu0o7TiD?=
 =?us-ascii?Q?dwVUJ6UG6+uCSaFxvfhkpX5cAueDITi8d4fuuuKYM+u0Kp5ua3ChdaFcV3+Q?=
 =?us-ascii?Q?6zXG9EJDH/6DSKXw/+14ZzSpjteXOfNbqaLcb9Rvx4t898J7GmReHWor4xz1?=
 =?us-ascii?Q?wh5PYlnwrpZnE/TloqqlG4MrWwbapS422g8UYJlFS8z7gVq4+d3pxrxjUHbq?=
 =?us-ascii?Q?hhkjqp6xwGXg1wPrBjvEHN/zPwZ5gBHK8QH9VrMiIVBp8O6ER8GLq3414BVz?=
 =?us-ascii?Q?OsyH+1ifuqSIdFFkfj1Nb5/UCU9MKE0i+YYEOhrabDyFAPRSrRU0uPeMEWud?=
 =?us-ascii?Q?tJjc+btqEuadL9zK4wFzpFhGEqWKeTxbmlqpXtK8jL5kyGkY/gH4vBREuQsC?=
 =?us-ascii?Q?UIRELcnbC0HFASY3hLj5Vul1Gd2aP8wakwIeWx4Kbw892lxXvO2ensemf+tN?=
 =?us-ascii?Q?ycSsEYZn2+HWfR5uHm75TKQwFLlB2SnaSASJ0ai/AWPe0CGGHIpZpHw2Pcz/?=
 =?us-ascii?Q?89Az8RDdt2FaVNydhqgiDHzCNfJId2k7/THobOnhXbvEM0Dv3JcS3PsBTKkL?=
 =?us-ascii?Q?Gppa+jgBez7gAPTJvHea3AkxdKikhJwJmCdwWzDzPoZfn+SLqhnIPgwU0l9H?=
 =?us-ascii?Q?MqfHPEkXr1/1llju/ephUKBEe0V6tJrF5qiz?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 06:00:01.7183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1efe2d82-6d67-4e9e-ff11-08dd86e314a5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5915

From: Sheetal <sheetal@nvidia.com>

Add interconnect and iommus properties in admaif yaml.

This fixes dtbs_check error:
 'interconnect-names', 'interconnects', 'iommus' do not match
 any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 .../bindings/sound/nvidia,tegra210-admaif.yaml      | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
index 15ab40aeab1e..3008ab4c96ad 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
@@ -39,6 +39,19 @@ properties:
 
   dma-names: true
 
+  interconnects:
+    items:
+      - description: APE read memory client
+      - description: APE write memory client
+
+  interconnect-names:
+    items:
+      - const: dma-mem # read
+      - const: write
+
+  iommus:
+    maxItems: 1
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description: |
-- 
2.17.1

