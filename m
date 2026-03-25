Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012037.outbound.protection.outlook.com [40.93.195.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C7B34D389
	for <linux-tegra@vger.kernel.org>; Wed, 25 Mar 2026 19:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466807; cv=fail; b=RqG1V4MZmKSQWXSlM6rfFvx3iAixapxOT6QdZaK0hCzfhGhNTnU+yFgdZKLvMzpZ0CwAsVx8dpvA45kxoxQ7/jL9s8U0PdN7SmW9pRrEXwJIOE0fUyLcFWXzaxG+mYOB6eCtRnHYuvlymzI8laZAAu8e2HI3F4b+VTVDc12VgJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466807; c=relaxed/simple;
	bh=fDs2WH6S/n8YqsRLUEGYEXLIrNCQExVvXFqCzwqp/ws=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HIxLDkZV0tknfLTRrSPMuZcd5VTeuya0Qd192hE3gvgtJKdLN/BLZz8uy28CaPd1WqaTSL+YQW+mKsNb/7H/lxX7q2UzGoG8RrVEge9fiSuIRahQ1MkVDyEmb6xmvnzizZQ/hOwSF9nbLV0HZghgfuxm2XQJDqq710GFD2r72mY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hLXxrT7y; arc=fail smtp.client-ip=40.93.195.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hLXxrT7y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DcJTuH7q7tyvczCP7S6UEYbypJUModPM5r+CIkvWLcZFkuJPADCTNEyCPhDjk1BDiYl8J4tO2xaiONyC+Lciy6J1lLP7eRye7V6pN3uK0cDhtxHbjMH8fM//xxZFuYxIhG9UY9TTMSdkJtXf2JcsqWZRmDgM0zC8laeqC9eBJoy7v7On+WfZJiF60MBBfIDgpg/ejRYqax8Rwrft1zZlFakR6GSIosviHrUgEWqhSsUjbiGWBuXrbXv1DK7VjxxGlu4e7aNypW32tJgmBTcE9Bi2Li9iWju+ODMAfJ+6oyDfmlEcW1hKxbnCI0YO/CAjRVKbenOX0R2bf+O93xueuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RItzYLzznN1gqMIHVq61r67deD3MEvcyohCrNH/ljhk=;
 b=WvMsLz32NacIurDUCQ+V8Gp302CrjIW0el6Oe99MAHiyMtNvgOY0mRMBXLnr/+lRG4LwRyzwlCKRPRhIzCbQofGgIObPMoLjtErhe/+5S+wWeP8Itkc7juPKhXNDf89DQOcysujCgjfIlzzTAkdcfgCatAlKw0rtJUndn6cGE4xroxEIBxdzwYkkMYtky4crZSqm+DyUN8NCEJAAOBfWOaMSt2Z9ou2P+BHD6PCr/pkntAaQIj5xaCV7021mEF7DRbQAH1GCMl4WeNdd/bgGDWxWRPAWec1s8pnCdEnu99N8LMTIsG5L54h0qc5qZC9/pSOdTMFMnon8RWOhmLOW2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RItzYLzznN1gqMIHVq61r67deD3MEvcyohCrNH/ljhk=;
 b=hLXxrT7yijn8kUgbUYWqrcq2Fexd+H72NqJI4TT4MMXejmY5J7/BWfHYDMbrhn9p2zrCnxLVNm2jkxTCOK0aVmYoE32VAdTvYRnTJ4JGE/Abe/nUyCPk58T1/x/T5q0hTwai0B1hEtu01MTf/lfrLEmdvlipxdYVBaSXA8WqdxqmdpvJrTfz4haAWgxManKHeL6rrhtFuN9gywjY7eb9ZUJenEwCr5+UtNkTL3+qrUSihZ3Y2Fvyt74eEW1gnk6qYx+L9c8FxvvN85r2iAaQHUcuS2Ysh9lBrQVQabhxW3aYFPKhK1nc4lGZXSzgV5KEBdXPIoNTuFWVmbrKlUAgag==
Received: from BN0PR02CA0007.namprd02.prod.outlook.com (2603:10b6:408:e4::12)
 by IA0PR12MB8906.namprd12.prod.outlook.com (2603:10b6:208:481::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 19:26:42 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::33) by BN0PR02CA0007.outlook.office365.com
 (2603:10b6:408:e4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 19:26:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 19:26:42 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 12:26:20 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 12:26:19 -0700
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 12:26:18 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 00/10] soc/tegra: pmc: Fixes and updates for Tegra264
Date: Wed, 25 Mar 2026 19:25:50 +0000
Message-ID: <20260325192601.239554-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|IA0PR12MB8906:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a136481-4cab-456e-f0e9-08de8aa47223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	K4EbU93XUFCQrkD2N/5DRufk0YQ3TSqtca2IdGLJ23czGhML/eSg+TNXMRgqd22YojcLvKibWvUG6Bauxyr/EPFpPf4FrrSGx/n3ePiK+dxsV1TneVqiVhmOD1Rf6GcWvMzupi/SNvXc+dGlJA9ZyFj5oqSpToeI3yqBZ62+tLb4MIeJd9d4J39k3K9DwrYCqTX1ti7dU68QwSHXafItA14I2MhoKP/k4W8zBH5Kvsx0zm1vrTCRhHP9pdzCywZiG5HwRNtESHh6a1Ez0/9FzwCZJvXcvzCO/4G64+Wp3HOTLr+YbyNhiYav9s+4PjYqbGsyY+f4FqF5l2z2vM7g9By34oEnalkCPdoLeXcFim0jAkyReOO9B6CnHoXxNS64NTBOAUQGsQ7Qv+6mkNfjWyeUBagLRan/cIG4rTGKwUy0AajftxTOBl9CjJHTlSpUqAlvtdGUZ/AG64gUufamMnTRpWZ6DT63pHEhZihUglklEp+PZ2fBKoAEEqW08SoDYkhdShI3zvKFpRjOa64VgSJvq7k9OKDS6lq64gixWiMKuBt1n7JnL5B/PVN2Knmh+dlvSMHpEOsF2uuwrRxrcID1sFlRPRZaCkoxpVu0Fr7NmwxjO2pQurW7Vyj57xCh9mg4tFs3Hm7euc6qVdpIIdl6WVMqPcScxu+dGmT2K+1jqGs3C8W4j1x/TIRjNUm/SflA4Jcm8kMSd8VtUL4eyH1ppp5vEj2sV7Ngr4eFSE/3ePodz563M4tf4wCGE4HYIpSWbGEu9xlbRmH4cWWH7w==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fkJ/i4d62fULmtDh+JFWiU8q6EFIf/jmJsEwz5efFDivusTb8NIoUWkxtqXIxFPBGrshV+qmHGnJLXLw3pyY/i6yvEZzmIiW41ItszSlXZQhJNJmXNKNTV+6HjSQafgOoIhSyMmrcMeEwjKJhDjJcZ9qUo7ZQzXtVTjouDUjBtk9TH8JxfOBegYVBzykOXoBf+W4djDPPobY3kpxQebL4hWn8md+dm7Qsu5kxySxJYmrOREcRAMndmreVGn9HuccymdvY88v6WJARsxFYuI7iooO/EeDlb/Ru5bKAaHClV3oajEmNvA2TUIIDqiqd/UvMfdvBH2SSaT2ttP+qWyCZY33BkVPxc0jNducGQ2PjoPGrPgzOkJuEmqVI25KSZQG/PKS8KQWBnGhOhG4a7oRM/Of7qCnBVd9VNy/lfmJbcvbuU1zHrTpR6OFY9s6zr1N
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 19:26:42.5286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a136481-4cab-456e-f0e9-08de8aa47223
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8906

This includes some minor kerneldoc fixes and some updates for
Tegra264 to enable wake-up and IO pad support.

Jon Hunter (10):
  soc/tegra: pmc: Add kerneldoc for reboot notifier
  soc/tegra: pmc: Correct function names in kerneldoc
  soc/tegra: pmc: Add kerneldoc for wake-up variables
  soc/tegra: pmc: Remove unused AOWAKE definitions
  soc/tegra: pmc: Add support for SoC specific AOWAKE offsets
  soc/tegra: pmc: Add AOWAKE regs for Tegra264
  soc/tegra: pmc: Add Tegra264 wake events
  soc/tegra: pmc: Refactor IO pad voltage control
  soc/tegra: pmc: Rename has_impl_33v_pwr flag
  soc/tegra: pmc: Add IO pads for Tegra264

 drivers/soc/tegra/pmc.c | 662 +++++++++++++++++++++++++---------------
 1 file changed, 415 insertions(+), 247 deletions(-)

-- 
2.43.0

