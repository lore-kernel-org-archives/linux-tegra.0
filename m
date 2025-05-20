Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18ADF2185A6;
	Tue, 20 May 2025 09:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732142; cv=fail; b=Ss2ZVrIKtgb34wPVx9xmSSWgeF2sGqem1p1tKj1j2Jd1oVEP8UBEVjxnogntESFjHkE9zUpzOXhkYuPfIfHONoaQ9mcH6U3cwxRDGE1kPGMWxaAeb1QoaXd18Ovl+VFYz00gfUAODERZwC+lF2L3JUiYBn7lCCTaoHkhj9i33eA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732142; c=relaxed/simple;
	bh=qwSJ/LwBqebjXREnOYVqM/IVAQibpFbNIxr0HYd/A58=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gwEGf1oesPxwbnF3ukNKYb97nRfkjUj3ZBa/bndHLQrI7czRXXe8ynoqH+eeTYgHHlM2Ja8NM/OEXOKL+tOzLHs9dOHnF9bP+hwZOlUCEgwVsfd0gYJajTY3/kP2uUXDtgimfeENmVKNh46lqsCecghoq4MRDJkNtWKQsagfMjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JefdIcY2; arc=fail smtp.client-ip=40.107.244.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JefdIcY2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3NdHw72m2OEL3WZc6kBPXfPi3oZdhb11bMY+1c1aiBEwAQHJBhe5zwU6Fn9jxHg/Lmu5QZ5yeNE8JrgWQw0ckiG6mNnggM5zNl+QRCHAMxQJB0qOdjna0CHBWTC9dohcbB0ecDcWkyeNU4VPVxGC/k5ofcrjVmhC5WbvWzZ//YqzP7JELEXl++z+SipotGLDJKgNclGVxQpqrjZAUxmKvPgv0KeJOxGG0KsSgCQzU+AjTj2VxNQNk6KjyJdyzm6rpU2LFE4MsLc0t5fTfTkzIOxldRu+jill6MmOvCuRciurADMQwpA5+q3NcDsVMbW9WseAwKOjkgCPeYmCLnIAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GxEv5mZ+rqy50/k/DujSCWdCsROzZRMrZX9W11eXxbc=;
 b=uryghjZQX3vG/OowSPhwBCv/+4BtilMtp3mTR0ejSIc/VgPe5rzOt3kjt8tP6yCYBQhgE5Oj1xHkNESW2SnYA90PCA+bU4KVDSYjFouphPJX3oOmkRWKYU9PQJErx/y7dCCjUGKTiV14MluBtDiUAkQXEmCGVkRtUG7icH5Ac9ev2v8CLNfrLb0kEwk9XiWY8QuUPruf/h7LBPapgTCk7N0XmZ/ol6v3OwLIwk0aj+gtQrwlp46Z01TBW2mGWN10J7qaRtaA931OqzwbG5MCvXv1uqV+0z6s3slYuKy7Fm6xJKklWLgB2/H7iFmMQOCoDrT9yiy1HMYclpGvKGoC8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxEv5mZ+rqy50/k/DujSCWdCsROzZRMrZX9W11eXxbc=;
 b=JefdIcY2gXL5NVt94Y5Dn+Z1SSDDUeqcHLZMoBaCjez/SJLZ9e4gFQkxOv3HRk0KaRoGZfaFkHZ4Yca2pYgXLrJl41Cx1hfeiLghPk9FuvtwjTh6jexz3u/0Zx3XvShfTe0iX4Suth0XkvCJWLvJVuvI0tPZ6fNA0pDhFMYzoTbbGum5MOcpyA7HLKO/7IS5JBERoU0hCMfQ33PHm8Gc2W2Znhx36jxew4nXtItAT6UCf1YT+5N4fDb8WSP+dxx1CFdoSkxoMYG6cKHnoPRgADVzDf4QGfhnR2gQtLi5HH816LnpbsH9y1121jnUrofqOr+fM/LAp7pfzjfj2MFT+w==
Received: from PH7PR03CA0023.namprd03.prod.outlook.com (2603:10b6:510:339::23)
 by DM3PR12MB9392.namprd12.prod.outlook.com (2603:10b6:0:44::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.21; Tue, 20 May 2025 09:08:57 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:510:339:cafe::6) by PH7PR03CA0023.outlook.office365.com
 (2603:10b6:510:339::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Tue,
 20 May 2025 09:08:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Tue, 20 May 2025 09:08:57 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 20 May
 2025 02:08:43 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 20 May
 2025 02:08:43 -0700
Received: from build-shgarg-noble-20250422.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 20 May 2025 02:08:43 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: <jonathanh@nvidia.com>, <lee@kernel.org>, <robh@kernel.org>,
	<krzk@kernel.org>, <alexandre.belloni@bootlin.com>,
	<thierry.reding@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Shubhi Garg <shgarg@nvidia.com>
Subject: [PATCH V2 6/6] MAINTAINERS: Add NVIDIA VRS PSEQ driver entry
Date: Tue, 20 May 2025 09:08:32 +0000
Message-ID: <20250520090832.3564104-7-shgarg@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520090832.3564104-1-shgarg@nvidia.com>
References: <20250520090832.3564104-1-shgarg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|DM3PR12MB9392:EE_
X-MS-Office365-Filtering-Correlation-Id: b256b0be-0edc-4750-da51-08dd977df3f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tP7sZJMj+KLSYttqonQFTqL13rKH8VcV8pMio8WmiW9xUF06zxMnMQ2K2Sc6?=
 =?us-ascii?Q?nT3kwo/MGwArkr+zBy6m6060vH5fAFzNIVQOiR5/xs19VXFEAFMN0TC/n1LJ?=
 =?us-ascii?Q?we7ks9OrLLk82AJ/7HdHr2MyoSx2x9Vgsgoj1+mViil3xZ5ATpeVTWKcU2vJ?=
 =?us-ascii?Q?bNnRylvRqbQ/SeMTAwvZjiSTqyoRb7VoSo5++1Y8VlC9nB5yuGeNzxy3Ncfp?=
 =?us-ascii?Q?14g5X+VsoYUbRYjo+tXQ7cINyYumn6/zfUOAA/MhsHc6qey1rI8Ux5YVN9mA?=
 =?us-ascii?Q?zxMpKAkfrxli+CgLL2QQVec7yNXFYJc9urmrsWYNTQBY2dpSMFjYnzKOj9XN?=
 =?us-ascii?Q?tFDe4MO/yD6ZH+winz6JbC7RRGL42cL22xD14udWOHUoKw6U0U/Ygm34EJ5x?=
 =?us-ascii?Q?NiNCrcf1vDrbIiRziWZ4alAnTHLCOiM7pgSp1iMRQQM6KXoqj3ijB6uxXHgV?=
 =?us-ascii?Q?g94od8/qfSNZ1c1JBVkRRls/DhRncCMX8bLJiO4E0K6Z/RVM7YBduD3gVAcr?=
 =?us-ascii?Q?vB1lymFe31BaKvaG/lSv9pReyLb6mRK57w65qSonUaCQjg+GHizBhnlE+Q3u?=
 =?us-ascii?Q?CGLpjJBCOr+oZBjVTmlN0wrwQzuch3MDCFxuP1Aw1BEIBFGaYON1CG+gQwvE?=
 =?us-ascii?Q?eoKjsukR0K3SVZj68544bpv8rXMrv2Bjj4ead3XPK63hIYG//IPJv35Uyjq+?=
 =?us-ascii?Q?7PPpEXmxqytfHXQvmtscNqLcJ/0m43665g2Q/FJ4KWi8Elj3r5X3aN/34n63?=
 =?us-ascii?Q?5V+girxbPWtI4eAnd0UkTu2W4mMhAcs2bjf0+eRnFJSizp8TJ8ymTg/RDvfA?=
 =?us-ascii?Q?wqBoTKRJueRjFnrbONeskBpHEqgtemZaPxLr45TNTDniql6AKkwsw1fS5/Gq?=
 =?us-ascii?Q?TCuyi1D4e20Ehcft0fQM/4Pxb6UmkP/Y8B+u1XQQQ3Ho8p8F/nEcT1Ht7Rel?=
 =?us-ascii?Q?nQe4vaGx0aZBCentoAnw0ah18/QyAfFEdFTCSoMM4pevd52I0DRLHQeVVXwr?=
 =?us-ascii?Q?laxBcckR9tjkg9qeqr77A6N+yj2GeswmEkBTfK+CVayWIJEzkY3GVzL8YtPV?=
 =?us-ascii?Q?MRtJSYiWR2PFZ5g+/SgaJYXy5mH86Zskb+3ZM7ESuDM3oTKT/BFG1EJfvK7t?=
 =?us-ascii?Q?XFmFt7m9TOC3Hp9wMRAFSSQ+t8Z5mN+idUZvUQkB4jHRm1L/VM9KxuCmeI3H?=
 =?us-ascii?Q?vDz/BDWBLUQufKKj+QRN9jdff5SU1WXCOjVull67wSy5Jvg9hO0x6/ygRIMo?=
 =?us-ascii?Q?bJ1X5yy8D63qIa+NxeggaHvGeZyYnES0bjg7TwYUagddUfnR8Mgc+GdJkaCG?=
 =?us-ascii?Q?qaKotp4X/guiUFBa56XYGscdvoBnDpnSqQCNzGU/39jlhcsjmsg1B0kheeBI?=
 =?us-ascii?Q?9b2vZpqEMipUdQSnB6C782AZtaMNnvun5srzmjUptILJA4R75yE+664Hrhby?=
 =?us-ascii?Q?WTVpJYdTyMrBuYauSp2/WwiQmQtOIAWsySe8hOgGe19+sdp6hYfa7wkhEnCw?=
 =?us-ascii?Q?DVO6f2P6OcPj83LnbHaQNiVJJTwqMcXHPQjj?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 09:08:57.4585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b256b0be-0edc-4750-da51-08dd977df3f2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9392

Add NVIDIA VRS (Voltage Regulator Specification) power sequencer driver
entry in MAINTAINERS.

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

v2:
- this is a new patch in V2

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20e07e61a148..aff6a915d5a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17707,6 +17707,15 @@ S:	Maintained
 F:	drivers/video/fbdev/nvidia/
 F:	drivers/video/fbdev/riva/
 
+NVIDIA VRS POWER SEQUENCER
+M:      Shubhi Garg <shgarg@nvidia.com>
+L:      linux-tegra@vger.kernel.org
+S:      Maintained
+F:      Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
+F:      drivers/mfd/nvidia-vrs-pseq.c
+F:      drivers/rtc/rtc-nvidia-vrs-pseq.c
+F:      include/linux/mfd/nvidia-vrs-pseq.h
+
 NVIDIA WMI EC BACKLIGHT DRIVER
 M:	Daniel Dadap <ddadap@nvidia.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.43.0

