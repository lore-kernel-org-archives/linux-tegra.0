Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013068.outbound.protection.outlook.com [40.93.196.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81B331D39A;
	Mon, 21 Sep 2026 12:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992922; cv=fail; b=WgRINoGzs+jjcbd8aWbyqkeus9RcEEvOmyAooBdtPiP0rcIKz1mXIfNjX8X911Vv8hK8Ru998I2QIQydDwqRbYbWylGwK3w9/wtrOnk0skBFmzGQe2CqHsYDa+zX0oJS6GrLRuAIspztBe7dLzOgDDSEPNIQnos6Z6OSVPr9ofQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992922; c=relaxed/simple;
	bh=8+HBzf8s99lBvqoNEBeP06SEv/c1Nfyl4btRrMENeXg=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=e8QrmOHtRypCDu5xVESpiaZQcWmZcLXe9kjlt2JmGsXsLw35KTXLLllUzIqaxBnjfNsCQbDlc/T9skr4WypXlDy2lAF7ungmloQYAUnY9DP6aUxr7LXDW0IBaOvWEJuNR+YiTWdAfocQWhJRRa1CZ9Z/FedUv1x5ytDr9N8Nme8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=s6/fa6x1; arc=fail smtp.client-ip=40.93.196.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="s6/fa6x1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nogeNkqFi0QTU/XcprWHRNKALZW5XqKXA8p1bI1xGqEmTSe0Ysq6vTRmF5d0UhsOs0mBY/5r7IEI+r0xTXu4IRfXlteimNkKbz3dm2KAU/UENLbAJf6J9STBNNqvufKIWboBb/RW+TK5DwivXbsl/nOwnOS5oUKXDxAsxge0PxuQJlX5x3FwDjpTAO2qhIqYPd6nU7tWfGgMJlE8brapE0Gk+UfYv6lq8eyN5X7xskY2K6q77XUVW6ARdnbvN+1/xv5psiswDbv69S9AbusW2G+bHG5rwH7YbP3ffjmorwChZBpqkr4+95dJlAZO7SMUf9tM0BF5YIB50FkFwZcPLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DvdxrRdy3DoE7N+gymwePixxn2in6AYLSzkOpG9ByE=;
 b=Xk0thTKW2LyM5V/SGmrwCmeG9C40a9LPAyWkykufTHlInPqTekQd0TENeZ4/HaBbD/e4mOvQqkSNdINW0T81qpbku5kmcr8aF11LhBkg4Ofm6q57q/O4z3uA+3gfnbXGd4u/Q73Hv3bcV7upsMdalklv6H6AB6MGMRm3dg+V3AR02yvFL9/MhciXQFkz6DHrpuCSJZTGh4rkSfXr3MzMj76/r4MMetSveT2b/0ERbQwdBsUxrT04yMDol5Hvf+dUsvFFOS6zXaFGDg4qq0iJBKxoRXp9+F2ifWRCG80YNEjv1aOnTJfm8R+haDemuvTdqoh1G4dwnl5Xdu+V1Hqatw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DvdxrRdy3DoE7N+gymwePixxn2in6AYLSzkOpG9ByE=;
 b=s6/fa6x1hNtnzL43Gg4i8gplMYUeBo95V9v3F9wUMoCY7hnyemZ9cAbdfvqNBBwyUpdJfGFQ+S2Q+99EcZJJVwAfrku5sLi3PiH9fS3cS2rNXds6GA1VfwaEnIQp0xzW1pA8WVv4srgBIwwX/RhV9P+DCOAHrVapPmHmYTFlO+O18Ip/pJzzJlg54cng42dVS/CygTFacIntITk6IVr3rVTZDL2FHTUjDjSIXA93XA/MNfeMkZYGvLJGEqWawaGQMX9qbOMQlAcrjO7CRa7byZpBYTFxIqLTGDuauxZS5L5eARv7rYlc4FBcuUy+QoQ8ziMr6V6Ys8B81NsZfZ7yZA==
Received: from SJ0PR03CA0216.namprd03.prod.outlook.com (2603:10b6:a03:39f::11)
 by IA1PR12MB8192.namprd12.prod.outlook.com (2603:10b6:208:3f9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 12:15:14 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:a03:39f:cafe::81) by SJ0PR03CA0216.outlook.office365.com
 (2603:10b6:a03:39f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 12:15:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 12:15:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 05:14:52 -0700
Received: from [127.0.1.1] (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 05:14:49 -0700
From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 0/3] phy: tegra: xusb: Add Tegra238 support
Date: Mon, 21 Sep 2026 13:14:44 +0100
Message-ID: <20260921-tegra-phy-v1-0-83466bf9a7cd@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALUfsWoC/yXMyw6CMBCF4VchXVvToWUKxBjfw7gYYIpdgNrih
 RDf3QrL/+TkW0Tk4DmKOltE4JeP/jamgF0m2iuNPUvfpRa5ylFVUMqJ+0Dyfp0lIICDrjDkSKT
 /PbDzn9U6X7YO/HgmctpGMXCMtJJ1dthEpZWFStt9oTUalCDfNI/cnsaX7zzt29tw/OMNRZYpB
 j/VGWNhyaChhkqrXcHkdEtlDg2yUYBojanyDsXl+/0BYt1FEuIAAAA=
X-Change-ID: 20260918-tegra-phy-1611f1d54afa
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, JC Kuo <jckuo@nvidia.com>
CC: Thierry Reding <thierry.reding@gmail.com>, Wayne Chang
	<waynec@nvidia.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
X-Mailer: b4 0.16.1-dev
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|IA1PR12MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e1ee608-1fc3-41e7-b45f-08df17d9fd58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|7416014|23010399003|82310400026|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	P0hCPnXUURX7LjmpxsWkZch38aG7mtWDiSLE9R8UanM6go2aYZ/OZK06Wi9FZUSX8AVsK43Prav5f07qwDE5yGf1/HaHY2L0FE04geYUla9FAYmUpUfC4iltIqkpbWN6uk0+tQO/cFvQqH4BJ80RfKWupdfOrxj0BAt8+sAzb3ULnOtp81uVCM8+HzWESerBPj3QuELpwyoE9AxpWTleBm8UECr8qbJxdoerutAkR5ksl2xw4qNF0/rPFV0KQh0sJCMB2mJRmToNHyiOFuO5CSGW+b0qR6z6BwRMTNdyUL5b1Nko0alXKuqEuu2kUINv6Hpg1zbyCmMbXFxZZ4XYYBYqvfnDG44H2FwEiVEPQSBFgUrDzp9JlYxQ2D9VdA0SY0mGVuSWRpKuRo/9HKa3h4/7op0enaCagpdr6kE6DL3rFrOU+H/ZGSdnSQofLLkYr3vi1GLo+1FVXYXLtWF9XuHgiHcSzLGdgqIm95kiCzr2e0nLIe38FzlXVgOMnBNNwV/eyiHpQjIhlhJQbVeFYf4tyjX2U8G+sH95NZBQQjXVWRemxTQW6e2duSzLW3tTZWdDtLZqIY5g4KYTe743E+xMsGlPEjGb7Nt7hqTvbXjs5yN2mx76u8jczZCAOZ+EFx9jrphB2vuGQckh2WoK7lpg/EZFKCngqeEkXuxLJQPp0fLnIFEkjfbAyg8lnmOO/QhqaVrw29G0zc/8Hv8+3Q==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(7416014)(23010399003)(82310400026)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DnM2iEZ3tOevicXxKsZnBbZ4pe2qR7Hx4x61b/e2AYCGPh22a7MCHElaJsLQcbMz+PxGslCcg35WsLfOQGfEcP1CvRH33VQK6SzXsBtf5hpwDZKuAcjdbCtlM6tBx3LGL294hUa5fjr5crraGBVxYpUbhBcaZtmdeP6injkI2/c7GYjnQEAtzt1e8ffitXzjzt7coeVAssUqljPNnnje2Wo57aMbLcWjFnzIPBU4E6GMi9RHOFaR7nfihGfIHCZ+TbksUOdndykMD5knMsSrMI/ih9manW97Fg5plGaHpCkzBcMT6PKvLyZM4FJ8qCMoSwEbSX4ftVW/AvioLpOfkQhYFtN0lVAY4ICRG6tgMr/3XPfdMB4pwy1MeftlnYyfjaLXMDIEfysGFX6S996rE/pEVsu3RYcDOHX1De+sluIsKzz11VO5z4xJ4WjD4273
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 12:15:13.4314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1ee608-1fc3-41e7-b45f-08df17d9fd58
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8192

Add support for the Tegra238 device to the Tegra XUSB PHY driver and
add the necessary device-tree binding documentation for this device.

This series also includes a trivial clean-up patch to use the
dev_err_probe() function in the Tegra XUSB PHY driver instead of open
coding this function.

This series is based on top of the series that adds support for the
Tegra264 device to the Tegra XUSB PHY driver [0].

[0] https://lore.kernel.org/linux-tegra/20260903071937.533646-1-waynec@nvidia.com/

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Jon Hunter (3):
      dt-bindings: phy: tegra194: Add compatible for Tegra238
      phy: tegra: xusb: Use dev_err_probe()
      phy: tegra: Add support for Tegra238 XUSB pad controller

 .../bindings/phy/nvidia,tegra194-xusb-padctl.yaml  | 38 ++++++++++++++++++++++
 drivers/phy/tegra/xusb-tegra186.c                  | 29 +++++++++++++----
 drivers/phy/tegra/xusb.c                           | 15 +++++----
 drivers/phy/tegra/xusb.h                           |  3 ++
 4 files changed, 72 insertions(+), 13 deletions(-)
---
base-commit: e657a464aba873f5eaf3ca821b6e4016674492d6
change-id: 20260918-tegra-phy-1611f1d54afa
prerequisite-message-id: <20260903071937.533646-1-waynec@nvidia.com>
prerequisite-patch-id: 4d5aee86ddf39567e3751c3e3067d9381635de46
prerequisite-patch-id: 532f630446505f9258dee65ab43887fc3cf877e0
prerequisite-patch-id: 4660a52fe6277f5d91ee70cee0b74280a8ce927e
prerequisite-patch-id: d58ecf03061a3c26f4f0a71f2dd5c97a673e23eb

Best regards,
--  
Jon Hunter <jonathanh@nvidia.com>

