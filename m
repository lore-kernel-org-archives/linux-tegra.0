Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A64F1DDF5;
	Fri, 16 Aug 2024 18:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723833858; cv=fail; b=K4n2mQXYJnAAwlIU1Y0sCdzyyuScLWax/uoZy8LgIEOMwm8lk8/Yg7vsOK38wiTl9T7B+mdwP8VXh8Ta5jg28zrFba2kZomzsbOQLEmcxwuAcYnQZXKhmMkBL/E6ALeVgOpWR/4aCUrmEmqjpCGhrASuHQORGgxyvEz2EfwULc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723833858; c=relaxed/simple;
	bh=Wk36rBEsjtBPMQ5MEtfG2Xlv95iCeWlZZcD70boAu10=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mvZ2T6x4GmhUp+mGZGoewp/SI5t1+oPJZqdBvpBkZVXnP0FldneS73AffbGAZZOA9WG7W8kNPhneg/9E44HBK8L8DVehLebTOGtjQKJFbEswi7dxhTQp3Md8M2ZGHYry5jy5bU6qj52H/BOt7QS6o1XjZ1sq14sK+hZ10l63TBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=URfnPK8k; arc=fail smtp.client-ip=40.107.94.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="URfnPK8k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LgRQgqFnyTXW2sIh1lAEBD/PdRAjc5MbZ3q5bYZXpLXt2KUp8Zn6lDvbMqjGvvgna5B2fIdLZfE0Su1hnDoGPJvopt88HwTWdDYBC2JZpVRgN7Ax2WNra7nfn5saUx+gYFHuJqBl2f6XS45Fub5cUmfDkMwL0+PMu/sp74WOzKiAWHo1MN6cU+MkiQPJRmKll0GCIB6O89zc2zr2CQyjFZcdffZOtftFzOZlXpYUuU+vzbt77oKEEr7cqa7fOnHh9oTqOIUx/cBNSQN8uvOmmcjxs7S8xvBHrLG52Xr5J5GUlSdaT3YAT2ezKr7GcuAb0JK1MkDnfxE1rdaMRrHUNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rE6iRlWjjeMJFzRfEYUWDCTffJqG6Cnttmw0kbRHCu4=;
 b=cj7BCZ8+nKAHWRf7t/8AOtLfKKmxpljP7XXmSq2wZYPxc0FgSSFiud0l2fFM1zlNO5gV9pGQtHczy0GqY4KNeYwdNsGKU2Hj5s7biBJiNeLvd0A4rkq0N45HvMQQOVmGmfLYQ6sBoHpH6XQdac8fkDfaX8JEXBPYTXuRs4Ox8vLj9caA3sidtjXoMr8vY3+wEC/QY3zW6r8XBomODK/OphId/WntTid351vMClNkVe7TyVAilfk8rAow1HEGrsJxTgTfeSaSdkaJ0k5p9wa6mNzf+HTqKrs+P/iSkX8X6W10smyarc3PiH10bSGEscJYX5QlwdIU+5EmdSSUNPJxBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rE6iRlWjjeMJFzRfEYUWDCTffJqG6Cnttmw0kbRHCu4=;
 b=URfnPK8k+7NlGUZXiSIMkHOwBWMAvBlRU0HL2pDYEgnqomAflEGfDcaRxHA/RRTZ9bx+frXxjVN5NuRCHPni3otrmEiNTZNIFaRxIB2lt9QzqUZHjuIxhlpdVQtKVKSm1ggFcX76UjDFXE7xoWzVYyBYS4MM9GDLQX8+/L+4VSzu5/zyR01YqopFZdpDWLRKpIBQdVDp5J9yZVMuQGVvGiHuHyg5Sh2gAp+gAK8iiRfUmoj13IZ7FrIcoDM0YbcMYEOTE0cGQFpP3eFSI6LqsFzti8QvHKFdKWYAqyClNO0si/51fEuNpOO262r618Ur0qTYcViKmpcpYKr35+VduQ==
Received: from BL0PR1501CA0036.namprd15.prod.outlook.com
 (2603:10b6:207:17::49) by SJ2PR12MB9210.namprd12.prod.outlook.com
 (2603:10b6:a03:561::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 18:44:12 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:207:17:cafe::40) by BL0PR1501CA0036.outlook.office365.com
 (2603:10b6:207:17::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20 via Frontend
 Transport; Fri, 16 Aug 2024 18:44:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 18:44:12 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 Aug
 2024 11:44:04 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 16 Aug 2024 11:44:03 -0700
Received: from l4tsclab4-2000.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 16 Aug 2024 11:44:03 -0700
From: Vedant Deshpande <vedantd@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "Brad
 Griffis" <bgriffis@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
CC: Vedant Deshpande <vedantd@nvidia.com>
Subject: [PATCH 2/2] arm64: tegra: Add p3767 PCIe C4 EP details
Date: Fri, 16 Aug 2024 18:43:48 +0000
Message-ID: <20240816184348.2072535-3-vedantd@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240816184348.2072535-1-vedantd@nvidia.com>
References: <20240816184348.2072535-1-vedantd@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|SJ2PR12MB9210:EE_
X-MS-Office365-Filtering-Correlation-Id: 44e11b54-16ad-42a8-b530-08dcbe236bdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PhaFwMAGaRYWYzxZxroEIDbS/RbQVMwhihg4x/GuK1Jqs15IQTXMTT2RUT6N?=
 =?us-ascii?Q?hEEqC+JYXcq5obcA06t6wKFKqPWVWdfY1TZmnVxy4BiKPZLiLAzLfggkM/sX?=
 =?us-ascii?Q?hy5qaoH2CR3bzug2I7T5BxddGhSzaDntBkLC4K27wcXROnctHk61IutL5b06?=
 =?us-ascii?Q?OLh4hNsCA75l90Xv3gmkIcHnNshbhuIjssoMDNb+EAi+0PwQbVdaN5UcL4ib?=
 =?us-ascii?Q?0GXRfpvQykpTT3QV7L8HX7gpIXAALMIZx3t0kgT6LMyQMjKYCIriJFQnpX57?=
 =?us-ascii?Q?ocm3CUb6P5EZAzYcDfuGjjXm0nGNhIQK2n6NQHcB5H4UYrEPuA2Y8UjNiMWK?=
 =?us-ascii?Q?1beKGu4XXtbBvTZNSXhgwo1MQxpJmEy6qFQSoRVG+spmq9vJkV3nOLS1GWzo?=
 =?us-ascii?Q?OJjwX3uMQbQ3bbmLYmhWD8cun+y0MqszJC+rZVpl4/WHp08vPv6jUDHvjsUa?=
 =?us-ascii?Q?VWkXyr73A4Xb4rEc8EmoZY+y5jopvkySXAll6UjTYi8sYmP3y94xgCBBHhqr?=
 =?us-ascii?Q?mwhWNsKo/Qu9DXP2SsB5+U5g2v3Cc2i5TnwbORtDcikhn4ogYRxI+2wvoKcy?=
 =?us-ascii?Q?oMoibHK7wSb9g/KQINT2U515dtf48+97hBdiDNDrxIGeTch58SDo5J+VThG1?=
 =?us-ascii?Q?cpXAdvP0LI9BBIuPqxjqkN1T74JkPjVj/lm/Gx14tk3eMNqbVBz1321pe+Xz?=
 =?us-ascii?Q?+6YnPCZ2EFxnHDauq2sdtZmPG7Kfgv2AOYuWEXW9YXeQAXu/5rmjpngnHmaH?=
 =?us-ascii?Q?dc4Zohl8JcegSj81wmQW9V2AIkI/Qcxd0EeLN0iWSnTFw5DRYVvv4SHNWJkS?=
 =?us-ascii?Q?am8Yk1zIPjFfbt8lVnVp3vLO6mDY2gnz790zD+5MPjR6X8ItUUN188hA1TEE?=
 =?us-ascii?Q?FaaJcSHvAPrHw6yjfTLV2FYFdPE/PaOrkBHDTGLXEmOUlgQ4bA/S+J10L88E?=
 =?us-ascii?Q?+2+9UZspjeqXO1hqTwSXCi5RvRNfOVprlmhxqH0L3agXHj4fas04jQ8tr2Ve?=
 =?us-ascii?Q?v9C+n8feBA5I8Zk3PFYa/YlR/9q5beNVu4fGzm/Ke0Cpr00dYSPuxKMiIF/2?=
 =?us-ascii?Q?IEmciGRTYw5fZVxZ+8QsHxwLWrpnLNYycJYHcLfjrzhBLH2HnXnnfaK6ZHq8?=
 =?us-ascii?Q?naNdbGovzZJmO+JWIgSJ4uRFM1zwAna1bsM8ebiXp0K/NNoh5H+K54GBF4Yf?=
 =?us-ascii?Q?dDxUaEwmU7bdc5ecDUtQ5875tXp5tGs1pKFUpzo8jPTYYsJFyCkfChOJJixd?=
 =?us-ascii?Q?JO1W9mtdpr4YwS2EeHyFqq8OaHrTXZgZOnJc10tFnnwZCG3VQOHP/y4DUwBL?=
 =?us-ascii?Q?+1BVV9sbo/s9a///4iO6sRteD+BbgBNfdswdaZvISmhgfmFWi0+zvsMTiPMZ?=
 =?us-ascii?Q?gHcvUvInyiDhKjLmKh+4Cv0y9ZMeUR63ep0CNcozh30C5jwYUhGwWbxmXK4a?=
 =?us-ascii?Q?BxyfDamLjfP/XLC2Rfa4xbfaxaejBBR3?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 18:44:12.0808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44e11b54-16ad-42a8-b530-08dcbe236bdc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9210

Add implementation details for Orin NX/Nano PCIe EP on C4.

Signed-off-by: Vedant Deshpande <vedantd@nvidia.com>
---
 .../boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi
index 6d64a24fa251..7a60f3a4550e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi
@@ -172,6 +172,18 @@ pcie@14160000 {
 			phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3";
 		};
 
+		pcie-ep@14160000 {/* C4 - End Point */
+			phys = <&p2u_hsio_4>, <&p2u_hsio_5>, <&p2u_hsio_6>,
+					<&p2u_hsio_7>;
+			phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3";
+			reset-gpios = <&gpio
+					TEGRA234_MAIN_GPIO(L, 1)
+					GPIO_ACTIVE_LOW>;
+			nvidia,refclk-select-gpios = <&gpio_aon
+							TEGRA234_AON_GPIO(AA, 4)
+							GPIO_ACTIVE_HIGH>;
+		};
+
 		/* C7 - M.2 Key-M */
 		pcie@141e0000 {
 			status = "okay";
-- 
2.25.1

