Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2041.outbound.protection.outlook.com [40.107.101.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F7B22B8B2;
	Thu, 16 Jan 2025 15:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737041931; cv=fail; b=gYwH/GgcLpCNBfgnguhfCiX9mg/8FxhAuoCJLgyI6GFggh30cks9M7Pgx+kDNbYbrZKXOhI7gTNotP0OWZckd7tsmiPSeGsK/YzhDAxLs/zyRvER1iBnhfW3yu94bRCefyIDfsIXD6dG7H71157aExWKPVkYMlJXFOnvpcoJ0wI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737041931; c=relaxed/simple;
	bh=ZxI0E9RJNc1yp0PlGG9ojFC7myY59XkPwntjkpDLfY8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=a472/IqaV3JDtlEjrdTEhyyiik1h4eh3UbhDYtz40x94/FH7VxdMy51p2NHQ9b6BoP5gwj+Lt1WfTAF5DoZnkx+/a3xYtjrMCTOi5SsHrYDLSqzlm5eN9cJmiKl17G3bSmDuwyEMoqH6GAbRBgC4Rmm8e43FFRXpxIUn3Zy5I4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fa2PRuES; arc=fail smtp.client-ip=40.107.101.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fa2PRuES"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7hYvq1uKlVtr7UCVtrMFOwqSjdiXCxXP7cKCOoscyHJn8YWgFYW/TsWYJboMzJqtkl5Ib+Nhhcn/Hp243tFHFegS8Y1U8zNnbezbz61mCrLneZQuaZj+F9/STf0HxZi6YL4OzWNBXRPSABK2LsiF2/UoG33rat0bGpKMKD4qD1rC9U/km9VM4YchP03nq+KAhDlR6R46Agwzs/BSjkDYyC+Tuo1hv0jT+rAjRGOQR7AGUx8tOiA42rnwqy9+ZxyvO/Z+MAG8D11ca+rugQ/l1Uf04rP5xHLSPwXT7IhJCbZpzte0Hxg/DaYkDR4Nrfws3xStPC3wxrTqQwzO6OZcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRUpqfY6bF4kpyFuHi4DiKepDnkrIZRGtdUyV0Eb7T8=;
 b=vuqQI91NtT92+5+1px0JxpbWHRu/vGjPOJ6xu7mFLyNubqnxRc5wKXo7haVr9JK8VlLwpROEmWFu2sDxaIOiO3/F/GpT0ut6ocDCtizvc+bDv1xbRTm/y1HSfpWR+9AOP528M1vJCQ9aMIcg0SW07lJquqATq+1CeJSCSSEVl8J7lhCdANbzG6xEoqNvwO3QR91BC5Ek1QyxrH+J8femEOuGwgYR2bz5K6Ai1NUYM1fsBSIaCGuykK6lzgbyk7EpcffXiKPOdKYi97/zUwyloZIZ9JAYeudJ/sKBiNeacuHJpvfMpDTUkq8C5awCUrOCxR1eYtjdWnZSgnnM/C6Oww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRUpqfY6bF4kpyFuHi4DiKepDnkrIZRGtdUyV0Eb7T8=;
 b=fa2PRuES+YaW9Oq7Z/gfPtVpLpQA/2Jhey15wH0IC7vn+ftsnZAWDi/jUO30RVnt/vqGYrcmwTKqAUXyzcdl43ysSCxoof7yIZ7Wt9UL32U+CoJkbvMwU6deV7I/zRr1ft0yU4E5mA/fxhjiaNcEYlKyjSw3jhGaC4t/chPW6Ai6vOTJW0Dyul19cuBBrazYZqs9gK0xpGxGo263EjzlJDPAVlLAFjBIIRIkJMXM2aMARHbPFTUsErmf3tMP63S9AlZ5K5XNz/rhF7tM0hdHbma0q5bp23qhql0UtFE4JVjpegFMiRx0KMyucX7zzGA6DtPSxZIlVEWTe1uXMuBuJQ==
Received: from BL0PR0102CA0035.prod.exchangelabs.com (2603:10b6:207:18::48) by
 CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.13; Thu, 16 Jan 2025 15:38:46 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:207:18:cafe::f1) by BL0PR0102CA0035.outlook.office365.com
 (2603:10b6:207:18::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.17 via Frontend Transport; Thu,
 16 Jan 2025 15:38:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Thu, 16 Jan 2025 15:38:46 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 16 Jan
 2025 07:38:35 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 16 Jan 2025 07:38:35 -0800
Received: from moonraker.home (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Thu, 16 Jan
 2025 07:38:33 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>
CC: <linux-usb@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Jon
 Hunter" <jonathanh@nvidia.com>
Subject: [PATCH] usb: xhci: tegra: Fix OF boolean read warning
Date: Thu, 16 Jan 2025 15:38:29 +0000
Message-ID: <20250116153829.477360-1-jonathanh@nvidia.com>
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
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|CY5PR12MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: 77bf70cb-8e59-400e-44ca-08dd3643dd9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ots7MMcancXhpPcKfOO447aWEJ4ftVv3qJx5gPGzg3SfBqC3SsQ1lET6uuY9?=
 =?us-ascii?Q?u1HdhPLSiGaDLyy+WZhinS2FprcJ8nG+sWpLSY3/D4pX8oYGSGwUyq+fZQC8?=
 =?us-ascii?Q?ncj3aHLRpjAGpKOBQNZ+UqB1vpj611GAoY90YVQIlv/JkuE0cJZyc4z+bIV+?=
 =?us-ascii?Q?mN4bGut91RYkKtuBsEZ46clwb9TuKY4ANg9kiVgc2KELwZ+y9dLUcPqgG3Ml?=
 =?us-ascii?Q?yK+j+AaLoo9ktrgCYrw87c2g6zZSaYot0U1fYPQUgtWqoKhhDr+tYUwunA8u?=
 =?us-ascii?Q?9Ru62ayydMlQyxq0TPOhfDDy9RUpDFuGe6Uk20PqMjWnoN9cCMha3DdqgpNg?=
 =?us-ascii?Q?D4DQHe4Ova2yZh6mSnepfAj5yVXqLjdKAAjhJ/WIZ39tK6q9p8Nqd6nNsee6?=
 =?us-ascii?Q?FfOaHsmbwKpZP28GqnC8GfsGY5lAr/mIvgrvf9uCxFgjtGS29xU1oWUaclLh?=
 =?us-ascii?Q?fh+QwvOwy+hMFu+3/zxmtW4oH8sjVk3TAgDWHu1LooYTRSXDGM4k+MdvoH66?=
 =?us-ascii?Q?7djMzR75D1AoCulswjbZj0YgO9fRG3gpyJ+jNPyagbURs7/fA4gVIXB8CaK9?=
 =?us-ascii?Q?2Jvf0qgqg41L/BSY9sd233TE849nIpYO4W+E098nEAeqIdxGkfMvI58wP2tf?=
 =?us-ascii?Q?vAZvSO2j/aZhBuFnVZJ8z9VTejXwc1PJI3v1UlkFvq+23wZz3QmagaWnx5bR?=
 =?us-ascii?Q?FYWn8ErEeXRVuwa7A8lZRmFT/sE7cQDTjSJ3svW8h9ZLNOmBympvrXlCfa1J?=
 =?us-ascii?Q?OlYTz2MESG7Us9AgEB++kZ0VhzE13Lsl7OtMDKJIfQmNGF26apIIYWO95ynh?=
 =?us-ascii?Q?4FtqpyQxFte11lkUwMNUri/FwDrrnbs6taIZZmVS6E+jBFXjF5ECu+qOxBWj?=
 =?us-ascii?Q?jHL0iFYFzl6IVA9jD3JgUW5n3hGen9zjxjbZ+YdJRiLXK8Soqbb94usQ3Reo?=
 =?us-ascii?Q?nSJSiOt3QXHC01cbqZ5jAO/MTpTDOb6cSnI0xM22YDyFutw6SiN8i1cwRuUo?=
 =?us-ascii?Q?wT267sVtQaClak7iFT14djs4xNMAd6k/UrRqdYGo40HlZPB7H5BRrAAlxsfH?=
 =?us-ascii?Q?sFoFpn6I2kd13ntzioQ8XA8gTlA+PrL3e/9ACbP5zj05XEsqNC8OeAxWnLCy?=
 =?us-ascii?Q?iYYoFTLa293Re/9crqTooJGpkNHcvEYd6nKhi8DxJz8VSZaUGPcSMIRxXfIg?=
 =?us-ascii?Q?FwqcFdxnsPRuutJ3Zwd07Oy6Sj0RTYJM5BBahdYNQpfCay1B4nugiu+PcStL?=
 =?us-ascii?Q?RlKldXAIzzVwJr1gC1MLcW6q9N32s4kGXMmWF1rUYOyL0XFmBTkH+OD3dTDH?=
 =?us-ascii?Q?qDmahCBrrCoOhofjXMMNtl6RZdQeuae9j/oQ9TsSUqzkAi/HVwLjIcDnXLUw?=
 =?us-ascii?Q?v4ACx7f6L2O9MIVJ3JCcx4Onc08TvUFuq1TuTK3vxN1FqkRnhrO6XFRjk35n?=
 =?us-ascii?Q?6bEdFachYEHAyRPcq8obJChkfOzvCoVgzMiDKT27j0IlpM/T0bULyjfF+JHq?=
 =?us-ascii?Q?q4ZrkvVDsHAQC4s=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 15:38:46.3358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77bf70cb-8e59-400e-44ca-08dd3643dd9f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6108

After commit c141ecc3cecd ("of: Warn when of_property_read_bool() is
used on non-boolean properties") was added, the following warning is
observed for the Tegra XHCI driver ...

 OF: /bus@0/usb@3610000: Read of boolean property 'power-domains' with
     a value.

Previously, of_property_read_bool() was used to determine if a property
was present but has now been replaced by of_property_present(). The
warning is meant to prevent new users but this user existed before the
change was made. Fix this by updating the Tegra XHCI driver to use
of_property_present() function to determine if the 'power-domains'
property is present.

Fixes: c141ecc3cecd ("of: Warn when of_property_read_bool() is used on non-boolean properties")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 06ae193ec874..7ac341b3599a 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1667,7 +1667,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto put_padctl;
 	}
 
-	if (!of_property_read_bool(pdev->dev.of_node, "power-domains")) {
+	if (!of_property_present(pdev->dev.of_node, "power-domains")) {
 		tegra->host_rst = devm_reset_control_get(&pdev->dev,
 							 "xusb_host");
 		if (IS_ERR(tegra->host_rst)) {
-- 
2.43.0

