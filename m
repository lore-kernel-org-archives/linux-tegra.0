Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011005.outbound.protection.outlook.com [52.101.62.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3899B4ACC74;
	Thu,  1 Oct 2026 13:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861367; cv=fail; b=UH1L82olj2gvDR2FZ2K95Reoj3hwC5ug+mLMfe3w94FAa1VsYJXNPqIJBDYuGd47JmecFLDQbZLgEPc1W3cEO1bYYT+RRnshMsHIenbb8RuJdKdYwfN4qLngIB6I2azv0qt278Xc3ueqDdpYpJV0uKchBu4KG5Ts2s1hZDOfJN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861367; c=relaxed/simple;
	bh=+MIjTU+n8528MxZnzxbjgIWX2p2EDu639g1kgP6eFMA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=XEd2+KYT3yEaFOeCg5ymvX24A2IrisRQDXUv3cGf1t0EqAEE/w9Q5jyn0RMTxfjdtac0xRfMUoDNKfGWic/tSjLA+ocYTCyWQjhclsxWI972iLaCLni2wiwwVJLLIfFe+HtyIATX85UheC/c3iIJqn1qc2FpjFHfx/tPHLlua6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pG/uyata; arc=fail smtp.client-ip=52.101.62.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pG/uyata"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+edMWFSAoGtH6Bsz37dw8J7WMTejp1gy6kDWjzpRauVN0BPclM9evYUx8xsLWrJxRBt479AbWuYy4oez1QO92FOWzg1rDyWKp3084Gqu4xDx628Vw9/NaiAub2CENrKS0Gd2cu2OxnSV3h83Wf5EbGibEV0SOB897Qoagp0ET2PUuzvMUovQznQ7c8YEDgefh6ifdWAj3sPEZ5f4wYkukqfJeropfS1pAdYbnKiuFvtXntFGArXnBgE52WeiW11U0rf+7qwdQsl+iBF3OfnzSWYox4ziJ91+gGTIZ/Lpul4Z6xWJu3U0bM3NcKjGBOVd+GFDWLPxmtwfb3M3jrHZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7WdEIDxonddAEwKrPapSaVHk9lPYRBKGndmzZvnjcI=;
 b=e8Tcfmhw8BRFSoUurWskFkpavUnZGq5qKr/1AP26sd5pJN5ONGkPDZk71b1i+l/88R6YXvPVisL/6CqXAHGPSPcku+g8yldsQwzq/LCf4ORYqGpsb1JhZnj9R5sgundLu1br0eY/ageTMk3DbA6vnhpFgLpvh9b8g6E2twNzGK1vTY+bozzvDkT3srJ2kc8r6pllwNozhpRrT2VHCZ2q4bSkgD8DezzB0XJeeUNXbeCygQh6QtJPGmgrDrc0CVuMiGJ0WiaF93BhiLTbAHtMlBkp/XLivi9j/lncZI4dgWcIK+nacT/a6cgAch97eoKTeyLlwwj5NUgaIK67BDt71A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7WdEIDxonddAEwKrPapSaVHk9lPYRBKGndmzZvnjcI=;
 b=pG/uyata1Gs2BRnT47ZZlC+8sK01Pwr25ob+sx0pNM76OTaoUfp7eRQQjf05PRwk3Iz+ZbRrbx3OpYADLpuT5vWclMc4LdAgyAMdEA9ibmjQD5p1UR0gfxvOsu/lon0Ae7bAw51Ye/oi7CjIbNNbtQLKXlEg9214HlgVpIqbX5+gDAz3AV2QsiCvJDhnRWV90/CNf7vcJq7+0oXKQrdT2YDtWbN2QnzkVwVDXtdiBl7kAlxe89ISN1BMZPuo93dyQONo1Tqk5mJrGFnILmhcCewJbXzgnMYmw+k2ZqUhUsfJ084DIiUB2gIzpUv+RxVQDd0s+Q9zWEL3b+/zeg7l0Q==
Received: from MN2PR08CA0030.namprd08.prod.outlook.com (2603:10b6:208:239::35)
 by IA1PR12MB6483.namprd12.prod.outlook.com (2603:10b6:208:3a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Thu, 1 Oct
 2026 13:28:52 +0000
Received: from BN7PEPF0000009F.namprd04.prod.outlook.com
 (2603:10b6:208:239:cafe::65) by MN2PR08CA0030.outlook.office365.com
 (2603:10b6:208:239::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 13:28:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN7PEPF0000009F.mail.protection.outlook.com (10.167.248.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 13:28:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 06:28:27 -0700
Received: from [127.0.1.1] (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 06:28:23 -0700
From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH v2 0/3] phy: tegra: xusb: Add Tegra238 support
Date: Thu, 1 Oct 2026 14:28:17 +0100
Message-ID: <20261001-tegra-phy-v2-0-3e453b1fb271@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPFfvmoC/02PQW6DMBBFr4K8riOPbcaAqqr3qLIYzDh4AaQ2p
 UURdy+BTZZvNHr//4fInCJn0RQPkXiJOU7jDvqtEL6n8cYydjsLrTSqGio58y2RvPerBAQI0JW
 WAon9/544xL/D9XU9OfH3z66cz6MYOGc6lE3xfhqVUQ5q4y6lMWhRgvyldWT/OS6xi3Tx0/Dxl
 LeUWe4wxLkpGEtHFi21VDkTSqZgPFUaWmSrANFZW+sOxbNGH/M8pfVYuMDR44zW8DJmAalkZSx
 iG2pyvnspIK7btv0DSy1cJCoBAAA=
X-Change-ID: 20260918-tegra-phy-1611f1d54afa
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, JC Kuo <jckuo@nvidia.com>
CC: Thierry Reding <thierry.reding@gmail.com>, Wayne Chang
	<waynec@nvidia.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF0000009F:EE_|IA1PR12MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: 07029c4e-c56e-4e7e-b626-08df1fbfef7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|1800799024|23010399003|82310400026|13003099007|11063799006|10067099003|260925022911599003|260925021311599003|260925021911599003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	wHRVJW3s/duIIZArers2fQVs3/P3Q3k6ff6V06tdsJkC4H4z2vuC7VRdYX9ikz8uxkDK16ep/HXPVm/BSAIRWuxPQziuYF0NjVoaL4lt8CwCTiYttehG62JzY9t/HdUIkRc3bRKAzw8KfOUN8dJ4DgqJXatRYa/2PQG6ui+B/iwHq9mW7fDZUJSZEQzAXryIpeik43FuvSsJG/2W+M2aEWjOfzsHedwbYF5k7MIVre0b2XjofnYfAQQqx7B165aSoq8G94nGwQD47xWT8sDZkgQX1p5doX0nZH+KBVRuvIMjkAz6B62hGv6rhJ6bNGWf3ntHH2QnIP+a/mzArEyiUGgBsuknhRPe9zYAJxmcdP7Oq5+KDkZOWVzd06JzmcnoP2Yt6e8jCzSJOBMnEQp5XX37wTr+Fj29MzhY1DXD8VUAMoGJFm1wpbyXtx18qYG0e4S9bY3U9C5LnRBhA2G1QIeDm9GFAe7xN/iguMhfPEf4sxKXpiSK0sWdK9or+oXu11rVIM6ocAIMQgCMFC6Ol7KXGzsOcS4BZmIx0rISyFpFfhy3n0Ayf3emMTCVnyryhxQWK1q6rwNzWdKBkvdqlgPCjtfuhvsTqCN/99m0zsaK+bOuFDLdM49/Kan9GQmlI8SmyXkRe3x61cNYVcVv13gYTHcC7NqmasCRVpJSADix/pabE7PX4RZ+52/tgXMz5NDgSbQTkjelUr3icCdO3g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(1800799024)(23010399003)(82310400026)(13003099007)(11063799006)(10067099003)(260925022911599003)(260925021311599003)(260925021911599003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9WLP+u8bZuN7ZxFpstTHnBEFwfektOIsCFE3lftixEJ1Ix1GipMsWrZ6sNljQVMMWP8qUN+ezkprwh0eiHYav3A1+ruQXaNUDtj34XjsB6rMy26iuU8+KdjUDJF64s/3J5T6EQf3wsPERyaudG3bQRbQQZGPKGjFeeb91wYqQQ+UVvR8s0njs673vjRA+ad2T1JCdXViO66wQqYyL6xhUSnPoXOTJ4Xo0wPbN6m6FZC/y+wPwFJ5jQerft8atAK+9WfETEupY0koL/B17SGn5v8GAQXUug8bas7450/FgYimeGdwBPNR5cTaWkUe5/1eM/vBnN9rg2Jj7xxDG8W7UKRX4F0myIAKzPxfahHYRZosifU3ctWhw7bgxbcW1OzER21jdkJqiJzstQCUPvEfoS+tWH0+FdTPQp7x8wGJI4Tr+T7/xugbuxW9tebM8AuF
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 13:28:52.5143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07029c4e-c56e-4e7e-b626-08df1fbfef7a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF0000009F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6483

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
Changes in v2:
- Dropped extra 'err' variable from patch that migrates to dev_err_probe
- Added Krzysztof's Reviewed-by for device-tree binding.
- Link to v1: https://patch.msgid.link/20260921-tegra-phy-v1-0-83466bf9a7cd@nvidia.com

---
Jon Hunter (3):
      dt-bindings: phy: tegra194: Add compatible for Tegra238
      phy: tegra: xusb: Use dev_err_probe()
      phy: tegra: Add support for Tegra238 XUSB pad controller

 .../bindings/phy/nvidia,tegra194-xusb-padctl.yaml  | 38 ++++++++++++++++++++++
 drivers/phy/tegra/xusb-tegra186.c                  | 29 +++++++++++++----
 drivers/phy/tegra/xusb.c                           | 14 ++++----
 drivers/phy/tegra/xusb.h                           |  3 ++
 4 files changed, 71 insertions(+), 13 deletions(-)
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

