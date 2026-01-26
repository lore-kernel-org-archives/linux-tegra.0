Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012047.outbound.protection.outlook.com [40.107.209.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3BC34DCD6;
	Mon, 26 Jan 2026 18:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769451209; cv=fail; b=dWPegM3IubXrJEp6DghBIiK/fYuXS6MNFzevCa0/Ke0I3MYg3MLMN1ArhbMxOz/zLjfPKiud/xZEfnhu6GPgsk3h1TWymadyf5VWLoK5r8y048i4F0HRq/JuelZ2/3LN3d1dMk8eGwsxB921Vl7CRTvAUO3cLVBurHEnLNYY69M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769451209; c=relaxed/simple;
	bh=QNaFUeDpy7IaArG9GtnP4fAuh3d0moBOemp2yFkSPaI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A/IuYUHBY8p1cr3g9nd+dm7U+b4JPFU7A0+5CUrd4Ry8jYNZ961IJhuK7iUj1+qKiER7ZqS53Da2KuFkUWbvZ3fv/+KMogNU0nXjcsEU6SpE+YPaxvZJ5o/Z/hiTSBlthH1a7oXBgrDEitMR5UDltQLu8dssVRpd6V3ioLCG2/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=T/eIGRTF; arc=fail smtp.client-ip=40.107.209.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="T/eIGRTF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=izmbSbT9fchLnyJOmK5eYxYzrwdUPoWhhEyIgfEw3rwkeEpDBsp3lyJ9CRRs54lGhVg4zGNJM9ubT7hjpuvlpO6qgxxEhssUl88nxr3EuBOufSY+fTqD0Mn8/FDGUpDVu4PgueXpYe8KgzNBeTLd3dzfc3xZjAIKFTfM06m0TBtv/S18OsKZByhd+1R+53EnTN1TfbXAsct37hFBYwYsIJ3/sjDaMFHzQDsq+xnHkNJOHN/0sz2luCnNcGtyDAM7nJbjwzd50LLb+Eglfy6WsKToltGHgf6s9Wjy2Oc1YXwKP12xx77F+nb1sXjnrgISvlQsE0X1PoBaBU25BvYE6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f2yCHArliAdGBypkGh3fUd2DPyX0A0WwmS1dIh1n/Rw=;
 b=jLjz2aN5Fdn5k/03pOZxAnT4qRstXTk6FioyoHg0pfvvpqU1U4fNs7+Py/lrt4oanXFo/+h+EWz7adz3WAJA8a5ZRSo/RN13YzWVY1ktMP1+QzJvF0aFJr+a8aIGsCXrkcen0vF9excf9KfEZefQ6HBTh/8KfAk0xtjxIyRvQJNpvURY1j7dOj8omdQf3CEeCGIZI1leZ3GmqnLBLgaxEQqunFtYuZfh1QiPhzNG7iKce3WU4rVQ2wXlsDKvt3eps/dqwOlG3CxCWmCWLdw+jdR1+mGpFg0+isMasFTuv2vEPvbqqSofybWZG0VaMHV3j2yksvWK8pueWvJAowRH/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2yCHArliAdGBypkGh3fUd2DPyX0A0WwmS1dIh1n/Rw=;
 b=T/eIGRTFIk/S11Wv+hhyPBW6cUy/QW+bVNuGGghp5Lv4qTlgeUGg+xJvDTfbTBLb4tVA5o7JVQAFjSdwzy+uTSd3fAeuEOiRgERlcxSjvNvNvV19qE1+a9CNrdKIZJ1qxLxV8OjqlOQva+fbZ7zA87iEw5S0uDv6JGlU2l3eU8xiAE9N1ZDb7yzWdykezr17n9GdOIAyTW2/2/BFyAA31L2JRdX4r2Gmn2LSFmJ0WDwLDxsrANNYEXyPyLlhcwHdzqsvpYcuAD2GHYAqPAtVSxZhGEHq7RVaLEpMN9TacZhBwzCv4VW0vDRKwDwJMcjd+TfgVE46sSmV9cDNEj8Kcw==
Received: from BN0PR07CA0014.namprd07.prod.outlook.com (2603:10b6:408:141::7)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Mon, 26 Jan
 2026 18:13:23 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:141:cafe::3f) by BN0PR07CA0014.outlook.office365.com
 (2603:10b6:408:141::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 18:13:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 18:13:23 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 26 Jan
 2026 10:13:02 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 26 Jan 2026 10:13:01 -0800
Received: from build-bwicaksono-noble-20251018.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 26 Jan 2026 10:13:01 -0800
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <mark.rutland@arm.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <vsethi@nvidia.com>, <rwiley@nvidia.com>,
	<sdonthineni@nvidia.com>, <skelley@nvidia.com>, <ywan@nvidia.com>,
	<mochs@nvidia.com>, <nirmoyd@nvidia.com>, Besar Wicaksono
	<bwicaksono@nvidia.com>
Subject: [PATCH 8/8] arm64: defconfig: Enable NVIDIA TEGRA410 PMU
Date: Mon, 26 Jan 2026 18:11:55 +0000
Message-ID: <20260126181155.2776097-9-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126181155.2776097-1-bwicaksono@nvidia.com>
References: <20260126181155.2776097-1-bwicaksono@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|MN2PR12MB4254:EE_
X-MS-Office365-Filtering-Correlation-Id: 50d6ce0b-bcd3-4be9-bad3-08de5d0697fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LpQMp7AW40Et7mQWkMsY2KCC32569vezVMIHw96vfn4B8nlOlkR40JCsSWcj?=
 =?us-ascii?Q?3ti62+kWaQfJh5QBF32hAa6RieQNb5CZvKEge7g3Rxqy3c0r9bxoeva/j4YQ?=
 =?us-ascii?Q?EPuz52CFYIoJIuZ6HW8fSRjqBSjG7zF5B6+M8o6YPyZWZjdntUv2l8ykxE+b?=
 =?us-ascii?Q?765G44GUk11B3D0WbSZf6mUcMOD3H7CDAmcQyin6dQud96qJM4oK++rURTz5?=
 =?us-ascii?Q?pq8oDokXK9K0zwjMZOJ5wZXmnR3O8YFWq4tUHUk7v8W2hEB5jMh4TdObr18y?=
 =?us-ascii?Q?PZgeVsoTWWQTb6saAic8iOe3uLbPBb1sz15HX7GWENsbW+yFg9XudSSfO+CC?=
 =?us-ascii?Q?+rIIuFdJbU4vT2KFWMGH9vrPCS39Hstp+HtJaoUVXtb9mq+iDBLkRaaivYE2?=
 =?us-ascii?Q?XFnuUw8NLxQrnnn4BKWM0s9bG/T7J0GEQJhfSKBECQ8aIWDoW+61fjCGuEYo?=
 =?us-ascii?Q?YRzwd0Dg3ux6uq2dVv70bFInAZVcZYMOmm8zKqCv2GFnc5W4vNZgZYnj/uT4?=
 =?us-ascii?Q?E16a72lR/xKly9VqBvuiOq7mS0DoUoYZywg2/6x3E7A2iLpRDs69vkO58/AZ?=
 =?us-ascii?Q?X5i/4ROuPslQPA9lS1p8mhLfbbr7pSBz5lCn8MsCirqMJYa4UBoR4sQwL1L6?=
 =?us-ascii?Q?B3TuIDRYw5mz2vy3xcyIC4ixrVLYKAgfIiwqo0zHXDbhZlvX5f8mZZIi/os8?=
 =?us-ascii?Q?/6i5xdxF1nnlQ0G6NuaaZAlNULgJWUHjPqR8VJYY/AQCZd7rWGjkGVOmt8CK?=
 =?us-ascii?Q?ZJNwoZWCjhzYAYqkBL7/QyYgRYGmUV/LSrgrJKyeWKFYLLeEdEhdftMmUS/H?=
 =?us-ascii?Q?P6UHEuw+0jZzexdjJ3cEyhpNIEc0ICUni6HM6mSgix+mRnTHk1aCYQHcCOD7?=
 =?us-ascii?Q?9WdFTUd6lBh9mhFDt6JslqfrRwhKslxkn8Z0yILhUrOuaq+h2r7W/aQvdPoh?=
 =?us-ascii?Q?W2utsJkXtffh/fMvaWe2nZZlWsuOKr1Ubb7wdxFkKW7LWbvsO61R+ZOkFskW?=
 =?us-ascii?Q?TmA7PWa7ZS/KeifEnV8k7hiPV9bNEg8Ch56jRBaJ/BnCdDywZkyUu2xSElFS?=
 =?us-ascii?Q?WXaJDPrPiTV9ZKWMDORcVi/e19E05z8MQMKiUDwcZpteC8FEhCRqhWJTG4bY?=
 =?us-ascii?Q?/gbeVaOvIqUhxoOGlEEOJQIkj02XHuFWibYtDtGAyPkVxSpJ+G6+5wQOmu4p?=
 =?us-ascii?Q?/Lc7W22txqljxXGLNumWb8CZApdOLdGdmlkG7zlMZxOAIi7qRZRI4sTxsQRl?=
 =?us-ascii?Q?eSWxTP3QZuIEFcIK9Q4f+eCVrxwccEGFkgextZ+w1juYwKINAUpoE8RaC8Lo?=
 =?us-ascii?Q?e7ea0vtojgWoput7rqjiI32Tcplzrln5rhhPwkmztym7DcHuoFik5bgQNdni?=
 =?us-ascii?Q?LBs9U4o/NQFXaffj14jXsmam8daGYwUhQdPOf3Mn+BeXtlDezH/etGAqsgVn?=
 =?us-ascii?Q?kjdrXa7VTBxL22J271ylBPMXdvW8UJRixPnwwtnlNEXHDDYDvefCsTagnE/a?=
 =?us-ascii?Q?WzWoh9gjjkxaXrrMf2y2Bd6ZGqd8HKuvSMoZTnBEB8EdkuinQXweQ4GZY1Df?=
 =?us-ascii?Q?mo6BTVn2UbJwpHfGOgphgUmn0BxjsY2O6k9JIJ0IqpYZVrtIfc/fkHlebFOi?=
 =?us-ascii?Q?MRh6THSczHnzDQqt52FMJ5gAzCb1ueNcX/LO1oKsqdCinklMOI/ud9gesByJ?=
 =?us-ascii?Q?hxiH0w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 18:13:23.2321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d6ce0b-bcd3-4be9-bad3-08de5d0697fa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254

Enable driver for NVIDIA TEGRA410 CMEM Latency and C2C PMU device.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 45288ec9eaf7..3d0e438cb997 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1723,6 +1723,8 @@ CONFIG_ARM_DMC620_PMU=m
 CONFIG_HISI_PMU=y
 CONFIG_ARM_CORESIGHT_PMU_ARCH_SYSTEM_PMU=m
 CONFIG_NVIDIA_CORESIGHT_PMU_ARCH_SYSTEM_PMU=m
+CONFIG_NVIDIA_TEGRA410_CMEM_LATENCY_PMU=m
+CONFIG_NVIDIA_TEGRA410_C2C_PMU=m
 CONFIG_MESON_DDR_PMU=m
 CONFIG_NVMEM_LAYOUT_SL28_VPD=m
 CONFIG_NVMEM_IMX_OCOTP=y
-- 
2.43.0

