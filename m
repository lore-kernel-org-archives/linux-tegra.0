Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013003.outbound.protection.outlook.com [40.107.201.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4692BE05E;
	Thu, 14 May 2026 05:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778736944; cv=fail; b=HWghCNaq+g7UyMIIbdNVeSA7cv/jOCAKyI7K149oU/jOO3hWeTy3KKk5ThtlTxQR5oke+EPrbS2zQXxZKrCqnBGW+zWEzM0Rzpuc+84Yp/lbCs/hwcjXkrfcZvKQ4cG14sqtjiDEigfwHyvbb2upWEbok43nZQzygLKSEwSYGvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778736944; c=relaxed/simple;
	bh=9RQVyYjQdHAZNwXNIvCD1gjWP+yX5K3COrViZg90RAI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YfQZsGXKNAIPD/xFPngafRRH3EaVzmJrwwU090jlmHVaQJPY5Ejh7scwGunqJFYcNGpluP6Axwm1HgDCWAql/h5EFkOKfm7ItDOOWov8FO5CFmYnyYwgUOvZqvwTdwEkFr5pE4+7LOesEzO3zBR8G2jHPsmAi9XBiukhraTegxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TjI8YCir; arc=fail smtp.client-ip=40.107.201.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TjI8YCir"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2aUEAAOFVBhai/rNDexfqVUfNjL3hMYmq2uxMM5LSTcvlDVo8w1vTE7HlnTZ6Blf12aZyf6cxIEZVGo01CR12TgH5imC7EHmSWhLYDG1MyNljRTChkVnSSfpmldWSnePbh8ivkWN0BDEtdcRS5JF1A90a3eriNAUyf2WiwcUcJTH3UU3S+YBbZnGmbp5Jax7zmDcxEqQmFxVZPrt1jJJudIt3uH1D3D2eTbVTMv0lh0oXt2F9KixZ61qw6svTX5Xg2JefiCXK7RUiwnJK+bQrAV41kIMYm57iFge7pAaq/NIVSE6fQoaCeRM9a6HrUAbqaAcqUzOFRoTl0O0hh94A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mue2dU3xSACewN9lBvp/6YPIOW8w9z+JBoR70uKBD2w=;
 b=wKL9703IlsewN0krISFlvmStsiyLwB/9F/2SZHLppVLPodXaE8nPqWa8gYP5KmKhHSndYjBAZD9xf3NDCcyg76CMCwo/dzlTU3X2gmSLZhOA45FuH4L8zJA+Bl86yayAlmzFJcYjI1J59awiL5ZlNtw86F8H8IGqpneFmR6cS4g8cR8rT/Y4lFYcPiMXwxaca0YEuAi/KcZ5z2FaUjVPLlNEf3ufsN5W926m3HfKJ3mDC6iYh2Lwg5AINx3K3liInpVAGGMmJqwtBmpxIEeoKRmpSJY5wV5H4Fcqkkl5wW4v+UQlzmbHpZwekulv5rZM1hvNo7FrLUALwai5foJFKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mue2dU3xSACewN9lBvp/6YPIOW8w9z+JBoR70uKBD2w=;
 b=TjI8YCir0EqQbqWxR8DO+E2nsJ7i2v2a5emDFr6aNaB8mcEfXXNCOHHfSTzPWfUHjMFo9dfnaYVWCrpxqbkv9EYJcnPBG6NPTIVd+2R84mdV2OrBpbhWt1zeTH4Jq3ejcIgKlDcnHRAvojprXjll2dPhKM6jJTF+uNLnBu/y/959/muBhl4MHtcatBGolfMkPZZDvnjE/QyEIgSi2vERvvr/qudxrtxxeWQY3wlWaPWZCPFNWzIC58SVfvCGlMcJKDnM/w19glTjz/74SRJfL7Yfy6hHQd2dFwy+VP7CvrlYTgz799r7UcJOG2r35DFcqbPz2l1M1/zZt4+vQpcKZw==
Received: from SA0PR11CA0161.namprd11.prod.outlook.com (2603:10b6:806:1bb::16)
 by PH7PR12MB7986.namprd12.prod.outlook.com (2603:10b6:510:27d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 05:35:37 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:806:1bb:cafe::1d) by SA0PR11CA0161.outlook.office365.com
 (2603:10b6:806:1bb::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Thu,
 14 May 2026 05:35:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 05:35:37 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 13 May
 2026 22:35:22 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 13 May
 2026 22:35:22 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 13 May 2026 22:35:20 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>, <kees@kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH RESEND] soc/tegra: fuse: Use device-specific instance in suspend/resume
Date: Thu, 14 May 2026 11:05:18 +0530
Message-ID: <20260514053518.2402597-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|PH7PR12MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: 09b04259-7ac3-42d8-3ffb-08deb17aa0b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	nHyh2QEjXHPFrSzXPZeLzNSWJwn80RK5Oorxo5Y83XdkhpJL53R4Xqxa2SxZekFEygb5+azaveJR30yvFkNYygMPWE9XL0feUM+82YXRw3fXNQZuCEa/EoWL/3F6dIXVWgo/2TxSimtgvl98Z1YoZ/2NAgZ4J2lYrY6KO9x3LmS8Gm6kQxDMTgot6Q+MpIT+XrzINmlYVTDAXMdpGltEBJaTWEI681uR3if6lfvsMqlLJLFsfcAUAYIZ5dEFuDavzJKUxC/pZ4MMoHwS7DpMnJ4uHdbwTdai3wJXTPE94j1rn+xf6K4Ce4QqXt4qZXlbPA8988a2M2ELDpXSRf8UizKKn5vCcHpzVxRVek6mq2DV0y9DzTYwzzaGmr4WwfpZywL5cQx8TXuHPgQB+rIdPLsWSuOsHzi3Zw6SxC3tO4/1x6q/BM3eGsOfenYdJOewIPhd3hIKMLHzZgZbySKDaHW2TMugbu+vLm1mbX3Z0SyHZvXwyxKXsCeEn/Pj5rY2t7jiW6BrlLpjORdLLdb415rgSKYrW2cqYuB0ztzUstlZOoKvSmvx6hqLbF4nAZjyOn+LMAOuDljirDwJouCFw4qWWl4GV4HKN2+F7IqhPvmf7tHZ9+Nzu7XFH5kERGO+nJ9c3CeS5zwKjrjUu7Osgd7EJ7e7Nt+cOigq96BjY1/OvzScsoyZhkB/6Mj+m16wa6+tu83kyt2ZwnJ7Sx1D5Aako1tjADKJc/fXIz5obng=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eHbVhTh6AK4Hd7HzomOWiYF++MJ3jxZWwxECOStnitEgapMzL39eUS/qaOuXaKqInMsrcSzS/oN/GxuEthCpGvA5dCZzocEfxTwXYlMY+HQuYTUDNRrg83nZJB6RvW1QZYKVeOERqpF/g3QC01WpwRXhPv2DTKNfYwY5wqDMEDVqMRQrUFv7pZJt9UJBDcY0dVCNk8T4fDiqyAtaESTmoDDtixYtts4SiiS72nS86E2Di6xTrwCiyfjcEopoAEWK3hKV2LKhT1GAr3TSe/lhklPnmIYH0uviKeKVDHYbqWX+7QDq+Krm1kX15T3F035Eo6+SIozVOqT726H7wFAU28lQii8Hq3cqcom+jhK8ViNjJKywUbd1HA4bAWp5mmQ61dL2t5sy/gtkrKj7U9FoK4isLTh6j2vefNo5YsRSjSxDRBO+dMNz0qP/fdF3QM8S
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 05:35:37.1860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09b04259-7ac3-42d8-3ffb-08deb17aa0b0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7986

Avoid using the default fuse instance in suspend/resume callbacks, as it
always runs the suspend/resume callbacks for the default instance rather
than the device’s own.

Get the correct fuse instance by using `dev_get_drvdata()`.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 291484595dcf..f38107d04ed6 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -259,6 +259,7 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 
 static int __maybe_unused tegra_fuse_runtime_resume(struct device *dev)
 {
+	struct tegra_fuse *fuse = dev_get_drvdata(dev);
 	int err;
 
 	err = clk_prepare_enable(fuse->clk);
@@ -272,6 +273,8 @@ static int __maybe_unused tegra_fuse_runtime_resume(struct device *dev)
 
 static int __maybe_unused tegra_fuse_runtime_suspend(struct device *dev)
 {
+	struct tegra_fuse *fuse = dev_get_drvdata(dev);
+
 	clk_disable_unprepare(fuse->clk);
 
 	return 0;
@@ -279,6 +282,7 @@ static int __maybe_unused tegra_fuse_runtime_suspend(struct device *dev)
 
 static int __maybe_unused tegra_fuse_suspend(struct device *dev)
 {
+	struct tegra_fuse *fuse = dev_get_drvdata(dev);
 	int ret;
 
 	/*
@@ -295,6 +299,7 @@ static int __maybe_unused tegra_fuse_suspend(struct device *dev)
 
 static int __maybe_unused tegra_fuse_resume(struct device *dev)
 {
+	struct tegra_fuse *fuse = dev_get_drvdata(dev);
 	int ret = 0;
 
 	if (fuse->soc->clk_suspend_on)
-- 
2.43.0

