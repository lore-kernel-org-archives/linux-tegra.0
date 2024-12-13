Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A757621;
	Fri, 13 Dec 2024 00:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734048256; cv=fail; b=IzMWCOtvD2a90j3nUpP36wGK0uTstfUW0iHp2GfE+d63aVyF8PhDjHrmPVBP+esS3jlOh57awfQwUqHO0mNyruDTtBj2qMlx+DKyZi2zW1zq99+44ppfVeufeU5go56y68WBY87lrDLFILl7b6ZjBDDHhyLruM3TNa7JpzNPXxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734048256; c=relaxed/simple;
	bh=SN1tnLWQHuAFqe6QfyDkOe5b2cbwHJ2KwFov7OOnFJI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GdSVg/0b0XtWxXHa+YfhFqonXN3BkSfG+HoaRdqpFxf4ZYSQKj9yz4ODLcKJU+PL3z82nh8CR7MpX85GfQdTyGGbFxXZyQzVWCs98f7p1kQpeGEXb+pcFgHNamIysnF41EwHm5lxQkLR5CoDf6w9U9U8aFGDttjrcUZT98JgEC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iiaGYOa6; arc=fail smtp.client-ip=40.107.92.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iiaGYOa6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbgqbEfrLqVYjiK42JBZ+HRFVffSu/KAb0bvRH/MBgyJUlk8oOfaFe6T4iIly3BxPhxJbb2Sf4Tf0GTz3rK+vktPeYK8754u5hO/4GD4Xd6mvQwlJ6hXBqC1iSfBoF9m9/uIq6lJc9LZpawIBJEndwO55tQgIVvB0eMZkSvaqbiz1JC5f1wLJ7dm3wpRFRIh+50K59XHMsIbAcQvcF4KluSt0NyjF32MwrQT4+FOE5fEB7jynzdCtL2Hw7MtSODdZL85/tdjLaidYsGS+ncgQC3MkjJAemp5fvlOKLWZXthHm6DDjEH8q/J0HOuhlAmwzcXp/7vzcoifeJjrZAZkgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKqMc9THjl1/TpjXiKt8E+xlrFVmMPBocwIeQFOPMyc=;
 b=ofCWYI3Txnm8N5/f1TB8kNvs2VMj9aaH7SXy7vdS1KOzQMgVpZOJwyReFzuczfzhTU55wDbN2UCihD9vV9gzQOqdQ7z6d7uzevB1xBCQt6XNySc4p1+Zr0ffnoHWWAZ6bwoOxHWS/90Xmt4fB8OxfGLsHr9Oj7aPP12jzq02eeXTgzs/SPk6sdLIQItsEj73+HBU3inQXQTh+xg36uCcsKlkeP+k/a8osl6WxE8/AHvY13kMrqHDm8MsWqpAu/GhRmpMrPEbV6pqub92EF2PZpEtyPVJ6cYJ7t1LM8kezgSOV7U56QhRfcsNFka9ytiBb5XBY8mMl7YmCWxbO5ehCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKqMc9THjl1/TpjXiKt8E+xlrFVmMPBocwIeQFOPMyc=;
 b=iiaGYOa6jrQ232Tyg23U7SffvMbDiCg0zBn660oWfC13oZeKryGoVMCRn3gwznLXOHswhwI7VQ29b8mZ49kzUiMOlXuxpb4nm3IDX+YesbXC7ZduchODm/Pm2IOVrNRVWPud6OT+jwB/wmGdC5AU/aVulvRlV5Am7Lpa17O+ndaN/SoXbXq69PLH1ONgbFpcWjrU6joI6gMRxT92cLP0bei0UvulO5Zp+wahhJe3lckcqtpDpW8uDndfAaa/kgsCaSOY+vyRezs0PvIwZeQxMYet7OEfh6Q0z/y5DULgkZd6e1CCFAPNWdWX0iXMCQHitKFPfaVi1ttgxkvP0uZfhA==
Received: from BN9PR03CA0475.namprd03.prod.outlook.com (2603:10b6:408:139::30)
 by SJ2PR12MB9243.namprd12.prod.outlook.com (2603:10b6:a03:578::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 00:04:10 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:408:139:cafe::f8) by BN9PR03CA0475.outlook.office365.com
 (2603:10b6:408:139::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.23 via Frontend Transport; Fri,
 13 Dec 2024 00:04:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.15 via Frontend Transport; Fri, 13 Dec 2024 00:04:09 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 12 Dec
 2024 16:03:59 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 12 Dec 2024 16:03:59 -0800
Received: from build-yijuh-20230530T223047391.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4
 via Frontend Transport; Thu, 12 Dec 2024 16:03:59 -0800
From: Ivy Huang <yijuh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Brad Griffis <bgriffis@nvidia.com>
CC: Sumit Gupta <sumitg@nvidia.com>, Ivy Huang <yijuh@nvidia.com>
Subject: [PATCH 1/2] arm64: tegra: fix typo in Tegra234 dce-fabric compatible
Date: Fri, 13 Dec 2024 00:03:04 +0000
Message-ID: <20241213000305.3533971-2-yijuh@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241213000305.3533971-1-yijuh@nvidia.com>
References: <20241213000305.3533971-1-yijuh@nvidia.com>
X-NVConfidentiality: public
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|SJ2PR12MB9243:EE_
X-MS-Office365-Filtering-Correlation-Id: 37c0e65a-fecf-4cb4-56be-08dd1b09ab50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ocG1jR8BV254p7EY0l1BU//txq4zMmPC/4/jQv2ufpouyQqSPHjGrP8T1xdu?=
 =?us-ascii?Q?xS416IOBEhyDZ0lYt6uCTkzhwurC5NEEImppPIRaGAaT6xQtxb6dlXNgvi9D?=
 =?us-ascii?Q?zR3IbRWw9/9qRpBmU7ldl84mzSin87jtW7FZ+rVDAzfklSyb3dp3NkBB9gpc?=
 =?us-ascii?Q?UEhQQIV9IGLEf8VneQLR4pzgQ5WAHCmMFyozwW+epB91qegDKmC55RpAtbDT?=
 =?us-ascii?Q?B67XqS/xqySI059IIM25ChUmXq86Li4k/Umcx82n5H5xmSeA9kkZSu8G05Z7?=
 =?us-ascii?Q?LiS3lJFPlbHsBKyfmxQ2yOJNeiwskAHYrhp5oi8DroSyAaTJOqLrqN4TGMtZ?=
 =?us-ascii?Q?z2rd+KS6vo1L3fgYSAOZJiMwQNYh8/tCexX+nI1frN/nJHg4SMHxXbhCcN2u?=
 =?us-ascii?Q?8xr7Ef94k6bRyL+zpzgcowDI5YcUJz5GwbR3G6yRsswCDg9Jx6+nevODJRUe?=
 =?us-ascii?Q?jmXLxEyvVMb0DjPusMLrvqD7vK4uS92WV7sJ52va8GK0gqeeP0EZhBa3lvT0?=
 =?us-ascii?Q?xLSfOEEUDtD0VyglNM/akUXdY3Prutf+pSGK1UF3mtS/kUHafWDTi3pPURjb?=
 =?us-ascii?Q?qIaW0ww1RZV5PFRmLTyplAVrwfUCg7s2mFBLy+aJK0jj0O5afVzAftMlotxv?=
 =?us-ascii?Q?1662nkWpjl13UtOYMD6dznpf4Qx5Vml7bvvcQHAyxYF+CwYA4fA+yTjb3hd7?=
 =?us-ascii?Q?KwmmoxkjIdrkRVuIoHiKpTfluE2D6578XLPedXk2S8JTHt0UmdNbv+9AiAXk?=
 =?us-ascii?Q?ZxMwM1PKwRTYMOphSvXi12nIi3W8pFcj1ZTxS8Molouj/KMHhHGI5QdWuhK3?=
 =?us-ascii?Q?OhHxeyMXBApSS4z1m1m2L2lG23fJt+ZXxpvjWN2mKadDM/Kc/LtQKQnX6oC/?=
 =?us-ascii?Q?LgOUCdKI0WEF5utVNT4J79VemADIvc+ci0A2q0YxAtP+zxAddeAXQup7ea1e?=
 =?us-ascii?Q?lACvGaLaOfz116dGe567cptgaGi6SrKuXTk1T0wQgNnRxsvhkX/u4GKvr3Zr?=
 =?us-ascii?Q?TggxYHq9/TchmUpbZQuMYrL+MhVtP0i2WflzG3e6gOJvulKzBXbgm4AM1TGh?=
 =?us-ascii?Q?S4Kblf3v+3U/194MssnvUY/kpGwAJu9FE7qDJUwQowfgqUVtz4I7gkZaG71s?=
 =?us-ascii?Q?2WXLLkuS7Lr/HQLiddL9jPAMW/DS3gDNOazQAMApDiJ6sP5/jd55Ynv5xxif?=
 =?us-ascii?Q?KzaOfEJ3sJ/nVHnjNpwrsS1GKpxKlck4QL8MsTxKNKcyMDH8upjiC+WCJ2uO?=
 =?us-ascii?Q?xgkWM7YbVqpAWLn0O4vEbJBNMjlAtnd+cS1FQdNG0I/e6TJ0Wut+6ZhxQifa?=
 =?us-ascii?Q?r/DyinxVv6wShQx3PWpwQZ+0UuBJXSA2Rru5jReVVhJta2lpow14bYki/Eb2?=
 =?us-ascii?Q?HsJ9GNPMl3h+MU6kt0XtFHMmg3UW2lgeu842Ka6Myg5+q7zNTQhW3JO4lhBB?=
 =?us-ascii?Q?okN/XsPxYYiLdvbnLS53dqPZTbTS42Ri?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 00:04:09.7428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c0e65a-fecf-4cb4-56be-08dd1b09ab50
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9243

From: Sumit Gupta <sumitg@nvidia.com>

Fix typo in the compatible string of Tegra234 dce-fabric.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
Signed-off-by: Ivy Huang <yijuh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 984c85eab41a..d08faf6bb505 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -3995,7 +3995,7 @@
 		};
 
 		dce-fabric@de00000 {
-			compatible = "nvidia,tegra234-sce-fabric";
+			compatible = "nvidia,tegra234-dce-fabric";
 			reg = <0x0 0xde00000 0x0 0x40000>;
 			interrupts = <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>;
 			status = "okay";
-- 
2.17.1

