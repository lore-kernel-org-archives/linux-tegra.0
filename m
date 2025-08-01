Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2081.outbound.protection.outlook.com [40.107.236.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB81223D293;
	Fri,  1 Aug 2025 09:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754042337; cv=fail; b=B99185DWNiRlnVKUJgrlODUzXYA2Q6EOcy/hBQ8E/GPYzxBI4MDA1ZPFuJI8cUrCjCLU1rcz7uFI3JbMEtkHKopg5zCgEZC5ZIKtQt3Qlo1gr/zkNilSNyAvNQ8ynLyTOsl5tjRC+/xybPRaA/88oxy+wTn5uA6ToK2gpmCitWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754042337; c=relaxed/simple;
	bh=4CdQuTqsVBtx4745UnkOFZFuBY0XX92rYEzJFa5PCqY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YB2+k0k9X54wir/J5Zeh+NP/AaIR75GvgWb3DgbGEaLn37NziYe21jPKyy8g9btJsOVW3YJZT4qD1RvQzX8j1/dLrykr20R7YYeRBROe6YbN+KHFKKECPr/5YyRx0B7wH8ExQIsYoWVx5qff3ndTxTB4UEjkjG7Nrfd/2toJ4dI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MYFx2WWy; arc=fail smtp.client-ip=40.107.236.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MYFx2WWy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wg2PsDrKrxn3B7JAJOXlcPDQdmhNe1IVzffrYx4rfM3mT1xyWd66peK5HZopl9bX1RuSatlALnyMjEnOsmOv1GRCZ+6XPFS9VzuqeiMr86uwDtS7UKGMFg8sLyQmKlaprc+NRYlWSAI+sp0Td6ZnJ0t9MWFb3V4oTYgk9uYdFbfufziZHX+VNtr1K8xxWd72pnni2va77bLNTBhEUjHQsLIceMvF0dbzMP3ws9uWZ/ZvCoEm4lIesViWrthuW6cALXAevruBW7yrPTUcm+xdDy0rqhd5HhRQh5Ze/KEOLiGKjFDNPTjas8WZNofnvbO3b15hE0i6e1c56IE88gsz4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77NV8T61jyenSu0hqLaYARZQb33PSS1XgE4nh/1Humw=;
 b=Ij2jfNleOy7l2Taf1DgFEU1yx5CGrJ+D6IxIjM9ym6Ak2LvmHCb+K8Cp1GU136FdqRuN/WGKxYJdREQ7DgGHfMX6s2kW4kUICr0Fi+NYe/BjjMymJFfp4pKmgU31x3fCRv35X0jMCorxBPH13LWeqoMB+Dec5by8RN3YYkoLjQRVC7tC4mJQnfhBPv7J74VjSBGrRc5jvS73QCa4SKVO+68pRPuU2dB5QLEvQtA1LPVgd7pTYbN6BehC5fp2BkkXSBfLxP1ft2oQ5a0nCdBsXCILmgo86xGKgWLU2Hu1dQK0pOb1dmxLgbtw7LeE7D1TdyXy3jS1YRazXmvDvg9rmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77NV8T61jyenSu0hqLaYARZQb33PSS1XgE4nh/1Humw=;
 b=MYFx2WWyEapjctHro5JX6q5xd0KvghBbkSUPydtjrhmoQL+75oUYdhJ0+Nj8CjziA+RaQUBGfgwuHYdJZHrDAIsH73vFs2cW9mh0VLKsj2hzsnZVBbZiopcvByxZ726dFcErvgVYHUiL2T6pCuK7WIFUAspDHwlAKhsxS4SQj38cCXArlfzPaion7VIiCkOM1tmZX+cTFb2DS6puVi9N0my5o+pFSGSTcP6Ai1zRL87/ylqbe8hcKFVt1gguYNlexj9ffqWG+elvD4SICrp1F7U9MnMKJ6sNmadWjx5ESMqEVJqXGP6RW0kAtseedSbZfX/Tc/x67lGTSYglPkTvzA==
Received: from MN2PR04CA0017.namprd04.prod.outlook.com (2603:10b6:208:d4::30)
 by SJ5PPF28EF61683.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 09:58:52 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:208:d4:cafe::3c) by MN2PR04CA0017.outlook.office365.com
 (2603:10b6:208:d4::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.13 via Frontend Transport; Fri,
 1 Aug 2025 09:58:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.8 via Frontend Transport; Fri, 1 Aug 2025 09:58:50 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 1 Aug
 2025 02:58:16 -0700
Received: from 553356c-lcelt.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 1 Aug 2025 02:58:11 -0700
From: Haotien Hsu <haotienh@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, Mathias Nyman <mathias.nyman@intel.com>,
	"Brad Griffis" <bgriffis@nvidia.com>, Sumit Gupta <sumitg@nvidia.com>,
	"Vedant Deshpande" <vedantd@nvidia.com>, Akhil R <akhilrajeev@nvidia.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Haotien Hsu <haotienh@nvidia.com>, Henry Lin <henryl@nvidia.com>, "Jui
 Chang Kuo" <jckuo@nvidia.com>, Wayne Chang <waynec@nvidia.com>, WK Tsai
	<wtsai@nvidia.com>
Subject: [PATCH 3/4] soc/tegra: pmc: Add USB wake events for Tegra234
Date: Fri, 1 Aug 2025 17:57:47 +0800
Message-ID: <20250801095748.385437-4-haotienh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250801095748.385437-1-haotienh@nvidia.com>
References: <20250801095748.385437-1-haotienh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|SJ5PPF28EF61683:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ef55d1f-168c-48f9-fd99-08ddd0e204cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N9X2WE6hl6EgMM3BbIzQhh1+ezzdNb0yOhrAcCJktM9D3h1xUgJ5ZkUnxcNX?=
 =?us-ascii?Q?XDUMWItjIz8hIJt4uZkCA83vQa2xzZFd2iBPjG1BwCIFEuil3eQRHBgbP8pU?=
 =?us-ascii?Q?8j+pAKLoXm2FGIMpWpmPwPEdrTBpY/11XzG4QBIvJLild6D5hUkAgV4pZ8lz?=
 =?us-ascii?Q?X37fNE0Vdcyvyu3M6kGmm/7oC3yUb/bcl6/n58XKIg8+pYWYdytx6F+ykwG/?=
 =?us-ascii?Q?aRv+xKkkoIlxnbVNTzeUTTNqmgW45Nf0yqf8RQFCstBc/Oz8lRPvVhkeonXV?=
 =?us-ascii?Q?tZ+is7Mx9lNWlgAAix5fEq+KWlGmrdHf49GDfGZfi5QLFZDRtItseVPOZmbD?=
 =?us-ascii?Q?QkGcKqsg+oRAPQbib7ejuk+xlJ6fzh7rCoOMLO1Nx0M4hH+gi+cowmlFz0LU?=
 =?us-ascii?Q?rUCzS59GoSqb0PmOsoXb3CPvoqeD0F9SxsLbhvfq4wAVVtSf3mICdLZF0TBx?=
 =?us-ascii?Q?/Ad7t/pqHXO9TAZeq7n5KGtAua9gH7ctvy+/x29aLyCKEWA1Qxe1DqFUbze8?=
 =?us-ascii?Q?FePsULdLJw6Psgq6Y35c2iTPULDjCsZlll9+z+yDJ3VEjHgsLcGHUvwz2X8L?=
 =?us-ascii?Q?5TZcUlAeWFXK7Y+g/x/AA3K8r8pxsWctGmiUF3fwcPvYVHFI/7ICbAAzV6dt?=
 =?us-ascii?Q?2MtounOu8ZPAdyA+TrYtIpCa7ctqhigd3bzXmLWKmC9SRGQV1Ys59HdZ/CUS?=
 =?us-ascii?Q?uQDxHf6vq20SFPIUauILfBI/t67Oh8CrXw66uZa9j4yb9ybspHaE8GUgEzIe?=
 =?us-ascii?Q?FWDhbGnsXQQrnyR0A8Xt3vpLCXYaCMnCAa4Tao1MEGFg0JUIixZ+at9GMYif?=
 =?us-ascii?Q?R+HsruLJsVk7aN40nmI9qeEEWkDJHoUPUM0zv2nzrZoZU6BbNSYlt3TLx58P?=
 =?us-ascii?Q?Y7KzMPer65TGMx8tA4EO5h2cwvIJfuDzdwUeP21HKdwwf34pDyZ8HLTCG8Sg?=
 =?us-ascii?Q?X3sbFejk4A8K66j9ggCMvUE13dfC/C3zM7iX2bgYh5qECtL4nxvP4fJ7z44a?=
 =?us-ascii?Q?pNc0km3FQxNVgYL8loW2z+iyUjmWzaGs3MlMVdBiYMnefO+XVlzZET/1BmX+?=
 =?us-ascii?Q?/OcZac27SpaL0iBFRKIToEhGFbgBL2KjxHEc7yD6f/WiFIG7HYIQa29OdTAf?=
 =?us-ascii?Q?LnQUE0g7lUbqnhcpFcM66FqYtbOESpNhkAdNZ64w1t6fcBgsluJ9vBPI/pEC?=
 =?us-ascii?Q?eJ0ILOchqbDU/TETAPMLoScR5HuMIk/KLqzFsR8UOH3K8zfVT3q+kDFfd+1X?=
 =?us-ascii?Q?z3SolsXZu7GTMlUp7WdcP2Tg5qvMnkDocZQHmGGzVEPXBu9VSBAaGH81TqBp?=
 =?us-ascii?Q?LyjJsicTrI3ZRbnYNQ1IlTUImbdK1cjmMBo97SQl6PeK7oYMDe59A4JGSwll?=
 =?us-ascii?Q?rG5Dley+23K7lUbF1dD52uuIgCrpEzu7Q1PlqDbIbY/KpM/tsauqTJMPD4E8?=
 =?us-ascii?Q?8CmvhfCdh8QMKUyZAEQn8v742lbg9gwiQRbgrmwVgHktBQAzxqVpCiJOu7Mw?=
 =?us-ascii?Q?53pkEs0mmlSzVJpn+0pdJaiadE+O7fEo7+K9ASC9X9/xqw9UpEYNFvH5yg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 09:58:50.7919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef55d1f-168c-48f9-fd99-08ddd0e204cc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF28EF61683

Add USB wake events for Tegra234 so that system can be woken up from
suspend when USB devices hot-plug/unplug event is detected.

Signed-off-by: Haotien Hsu <haotienh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 51b9d852bb6a..bf3a46e24aa3 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -4209,6 +4209,13 @@ static const struct tegra_wake_event tegra234_wake_events[] = {
 	TEGRA_WAKE_GPIO("power", 29, 1, TEGRA234_AON_GPIO(EE, 4)),
 	TEGRA_WAKE_GPIO("mgbe", 56, 0, TEGRA234_MAIN_GPIO(Y, 3)),
 	TEGRA_WAKE_IRQ("rtc", 73, 10),
+	TEGRA_WAKE_IRQ("usb3-port-0", 76, 167),
+	TEGRA_WAKE_IRQ("usb3-port-1", 77, 167),
+	TEGRA_WAKE_IRQ("usb3-port-2-3", 78, 167),
+	TEGRA_WAKE_IRQ("usb2-port-0", 79, 167),
+	TEGRA_WAKE_IRQ("usb2-port-1", 80, 167),
+	TEGRA_WAKE_IRQ("usb2-port-2", 81, 167),
+	TEGRA_WAKE_IRQ("usb2-port-3", 82, 167),
 	TEGRA_WAKE_IRQ("sw-wake", SW_WAKE_ID, 179),
 };
 
-- 
2.34.1

