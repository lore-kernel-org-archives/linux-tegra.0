Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011068.outbound.protection.outlook.com [40.93.194.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC4B4B4053;
	Thu, 17 Sep 2026 09:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636603; cv=fail; b=WSrSqSKQmVQj5nxCxJ1MPqjmfxL70rzA0wH5PSxEfbkLug5dW8cu1XmT8hD3Qjp0mFVA1CmouYhCOX7XV0ZJXsbFbMAypBoe3PJEmP9+dR+9Og5ONul+7/SknKR/gBRx0x1F6qtLb08oQ1QRlJrpKgmPXcxddYv9EYyOOEH27N4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636603; c=relaxed/simple;
	bh=vmg3fsZVivyiQmx7xjiQ1FOxuVI6WNlO8/U1A8Qbvhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sr7+KVDcSbginrQBB54TALb8ebU9IUQoggWZLDnRUe2xIWPgGWH8KQngmuA5WgiUhaRLpzyp1Lsh93pV6DxFZJw/jzGEYtuUPBnWCrsAegV2uNvq0c0Ny5+V+OUhxVFWSFMLCNY0L3swtxhKkyATR9vNSzQ/+pjziU2ceDTh9Ig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ce/MDAQL; arc=fail smtp.client-ip=40.93.194.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ce/MDAQL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dG4biK4Fb+ouhU8EU15tPEQhKz7J901GJO+qMHfRn1IqVSQG1mKnkbNkYBZMMuQaickY/NsZPtKgfhEs1eYb7Cr2rqNujyueEjKGfR7DxYi1aRWRD9rJv+YoSVsFgDfSrHfIMbIo2PTLSjsMmMvoegMODeAEfs6DYqRsLapQnj3gzVc/ft+fqnl+xVcMwWohIyd6nXcgg8ZcF/lfH5JGWpblWmk9/g+AWeR2b5n1E+a2m2j9IciIS2plBrKhDd1/XFA50pNJNHaVWvWacmlquHUdOvpXkUwR2seZmU4UihofnwihzUHwXXArdyA9MY9HXlHPCwbwVJ9GqmHLJghHNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCRThzAVU97wgvi/X65GcNf73bNpEkwCLKWBWJgrwFk=;
 b=FLhHuWuFhI1MODvFEdrDc3XUp65bHMI1J0bWoV7m74VqtZfwQ4NZKufye6y2Nr1cgv65daclSa+BT39hRQoeEzebds+WAxNOfba5WW6PBCt0o8IBOHex4W3BvUyo8WzWLjRuNTz0fV/nJRqECoSxL5/nSxVIOjhCYgGIo4CJC9McBLFqsw9+uCexy6Wg0o5dSrC4ElbAlIp1qxz5Ml5q1NHyCQOE0EXRTPD3ytNEn59ojCh5Q0ZWa5OCOYXgaM2SlAWs35Qvq5gRbzghfke/WYbXKdGUwQQOaYYFl+Ri/yDBcDcQCznwo3elrtbtbY8bwwWvK2wVbHHXkSgyYtRz2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCRThzAVU97wgvi/X65GcNf73bNpEkwCLKWBWJgrwFk=;
 b=ce/MDAQLRE8oSh38gRbgi+zThhhXgq9LtsMedv5Lt+VzPFQoSCX2CW+GWV2ru63vToYQs7Xsm9JJMT8m8srZzjG64boc0kG3xcAwvdp7L437G7XWmzSaRDsi7pJHdaSM94flYaWKDcVEV828YVXlrXReLGE1Gw2R1Br5MCOApD9mqCHn4K/UP2Ta2T5a8QXns2Go5tTX4PHy1n447ey0hVBawhb6WxIVq2/1s6a2uEEct5jqQS+d78f4bKHtofbZ+a+BggOpFqaKhkhW3GH4L0EyzepuS4V+h3RgLczK7JxD61sVG0pg+dUmGdEPhPkXaYcXyi3KCDss+Relyqvb8g==
Received: from BN0PR04CA0201.namprd04.prod.outlook.com (2603:10b6:408:e9::26)
 by SN7PR12MB6789.namprd12.prod.outlook.com (2603:10b6:806:26b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 09:16:36 +0000
Received: from BN2PEPF0000A98E.namprd04.prod.outlook.com
 (2603:10b6:408:e9:cafe::23) by BN0PR04CA0201.outlook.office365.com
 (2603:10b6:408:e9::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Thu,
 17 Sep 2026 09:16:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000A98E.mail.protection.outlook.com (10.167.248.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 09:16:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 02:16:14 -0700
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 02:16:11 -0700
From: Jon Hunter <jonathanh@nvidia.com>
Date: Thu, 17 Sep 2026 10:16:02 +0100
Subject: [PATCH v2 2/3] arm64: tegra: Add FUSE block on Tegra264
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260917-tegra-tegra264-fuse-v2-2-4936068c2168@nvidia.com>
References: <20260917-tegra-tegra264-fuse-v2-0-4936068c2168@nvidia.com>
In-Reply-To: <20260917-tegra-tegra264-fuse-v2-0-4936068c2168@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>
CC: Thierry Reding <thierry.reding@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A98E:EE_|SN7PR12MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: aabba791-aee0-4cc9-ce3a-08df149c5f77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|23010399003|1800799024|10067099003|11063799006|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	W6F9+MT20Fvhc7K9LNYvF/pu5Yj1ebx9+mHcLa70i+Gkq1Aismj1QGlxUwL+LVgZt4uFhgs3URO//EpcRGrasY8liJNWMH6dKmi1e1dlJJX9Y4IoSPHrJ44d9ASns9+0a/T8UALg/5EizVUpok6TJ0kgxAhDzYAuf6OKymINPYQRM6lF7X/4WmSy5tl9ZtVdVL6DNVzo5vlor8dSbr8xpoftNunkHiiOYEMOqBSRDozVHsQ25Tr7uXDYrKaSLlZXwZqrdHdMjRwrDWY96PmDydq979jJp3C47KCEOkhr7/Wb2D5M47NF0k4UWOl3DdwQS6FBdGq2pEL034i40odY4+9+t39y5iprybWV/N8kzMdV69DwEfwzIUcClOQ60P3PoCfbje465eySdRiv/1lDExSvUIC2D3S57wKDD9wf5Hv+VTml9QvnhmWVgZ6LoZl3rWwXX6HUK4gAJwEmHiSan9/7lBJz0KWLzjraQVBsQAMe4HlmTQnxCCAIsarlKjH6An6DKZrNY7cEirTBdzH6MESncRkmo7QEFFGllo+et8MzxhyAzxbfEGIbI4no5EIqGbQQFfJWjBo9YnxovaZhN3l8LxVlaS8CByIgCbR87NZMokjUM7fjRRatmJsBa2YABPS95+8HF1+A3pm0KcuxiPHZBAwc6zj/mTTd4uRHoHsROjjaG1Q4Ze7TErTqMa/ymmZbAfiSVJdqmpamOp86rg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(10067099003)(11063799006)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vtyZD1qsACrEwKPCS0VKOglnfsH4NAkKB8VeY3xW2xMw4FUIB597QvMttYHAKVMHE068nntFtDvKPAwIXts/vfinxSIZpxIMFl2PDSrZGPbeEBhDXVAnapxRewGt7c02C3D5J+RAlIzq+DByIIGrNSV51Swk/RhnJqB6hJdF0lgdhwt+N+wB9c6ra+WW4v78HXmBf4gWc9FKgGKOr6c26E6H88N8rIs4FuWIPK6UKRjRk3t5v1wIp0x9WY+Kc4wuD9Qy/nyECTMPiVOayJG/Zr2n2F5fsmcncejP587sDGyF/hfsefbxG+9ph3HPxNmprLZ9cZxRD9NI1npV7eiScPBAka/yOzOGzAKS/cOkXyNkPz0FmEHfx7Oj4MAkqge8W9ZuCuwpbd/bJXyRswm+4vVPdlvQGAem4ESlV1c321tCSVEA3Xqqb4DSkGfsPEQ0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 09:16:35.7144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aabba791-aee0-4cc9-ce3a-08df149c5f77
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A98E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6789

From: Thierry Reding <treding@nvidia.com>

The FUSE block contains a number of registers exposing information that
is useful for certain drivers and/or userspace to read at runtime.

Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index b84f93ad227e624a696f50c4e86c7909901096bd..dd81ce3b36aee163d81437d0a7fed0ccde2748d8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -43,6 +43,13 @@ misc@100000 {
 			      <0x0 0x0c140000 0x0 0x10000>;
 		};
 
+		fuse@1000000 {
+			compatible = "nvidia,tegra264-efuse";
+			reg = <0x0 0x1000000 0x0 0x20000>;
+			clocks = <&bpmp TEGRA264_CLK_FUSE>;
+			clock-names = "fuse";
+		};
+
 		timer@8000000 {
 			compatible = "nvidia,tegra234-timer";
 			reg = <0x0 0x08000000 0x0 0x140000>;

-- 
2.43.0

