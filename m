Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011053.outbound.protection.outlook.com [40.107.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C7C39B4BF;
	Mon, 31 Aug 2026 18:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788202761; cv=fail; b=VSI+/z1Ao37mg+Zx7NKLDiZLqmyilIzAArqe+HZAQKTR9otWcy2otXjuwfUbD2KUnSZbELI0EEWckpxpvCfEolgLpuzIpJZE++8B7zfHQSDwbQPVTcGhKsgBvi10akyv+rezzh00SKFEhxLlEs9dLEqaut6k2SKDMot4ExBjmT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788202761; c=relaxed/simple;
	bh=5P1mMNCN+XiLTUdDTB5wpYaL2ADijBdx/foYEUX/kxs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Neq+VMhNdsWSss1S72FPSK75mNKoANmF3g9+AivU4olX7JwkwA/WKvGppcI9Coju0/ZmuPoXgjk/oZ4RLlfTeHdxsnblMqYPj4jQRc2XayfVsgk4V6DlpjI/IEcF64Pq3tgmJBYEA6nxzIXzna1Cbk0VRP3g2IAYA261zl8Yv7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uBgnbc5+; arc=fail smtp.client-ip=40.107.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uBgnbc5+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmXs9zhZ7wz/tEvvu3lOqzMJQCEkHufTtP/d+tQt3+HTlaNelfn3D9qaJsnPNP/Cdxy6w8T6+sGG8cUov35wcZhkASewd0qrCYQdaZmY0kny5mTa00YmKAoDIpo4qcV1PMVcXHxuXrwhyz3X9pMyK0B/G609xWmG6rJWhBom3cU72/319tnaUVtPDjM0yRuEyngPis/Iz+rX+qvyvvNrDoVlb+tQpZANC/JhfDGaALaUG3go2mrVJM5oCPWM6sOrt6s92z0BkVXLaFz55uaDIpwDqCK+6cbFg2KSfpnNqpS3PekDlexQa3i1wr64ximbQ3VUAqRxcmDfhXZzLvLVBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCHa0DglV9WisRwl4inEpmRgrR7SWwgb5OxWKp86zRM=;
 b=mbwDMqSMwBMd3qBYr2j5SaPUI04/9/nXcfeA8L7fpAy3CRRu+xdj+JLiwQt6ZrzS0iCTtk/FIEGlXZkE4LoLaKvzp7OtbN6KfSRatSo+X0X6ZlsUiCCqq+W44yB5kyjoSo4Igl+9h2j5f+WCj1fYQLhle2cGe/+8Dc/IBYVv5Bmg0XHmVUZJkSpCiTq80OTKFyI6NOFHE0nvpJkGOWbMZ60At0O0PmJi1GQNIoxnhk+dMzKNpxtKTA6Vcjp42Tt4A5+u9Bf3IIeL0X+sFzUoaAWG3UPrjfEKNTB3qOxnEh1eYxCNMljcDLqBR00ZDJs1SqDK6qMKXnyh7s2doxSDIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCHa0DglV9WisRwl4inEpmRgrR7SWwgb5OxWKp86zRM=;
 b=uBgnbc5+PCeapkINDMCde4FZwZIRn5EOVrOACvYwGejI7NaZlJvPQ5cEcWFRzE16/kQUV7POOOAEEYSfhUSQFCQz3Cj69ZhtPdTeyrn9UyG24DHznk2xzhfSzBbUMSi12AMDCW3TMx+YrKGsxFyo89nPXgOsfhZ7eEr6XKvlVgMIFsiOIS0ASHzsio43vokMMNwRcqZ0GGKAK1jClRusYryLqrskYOKWyXvSJFPgF3lVKq3O1Zz/ghq+/GXmH4PtgqYmfsE2DnOp8l9WwyzaGTmXjN3b2Es/e6KSFJ0Mq/jOM7DNEmtSWRWaGgxiH0tQmpCBhydGspOywNd1ZlQqig==
Received: from BN9PR03CA0200.namprd03.prod.outlook.com (2603:10b6:408:f9::25)
 by SJ0PR12MB7474.namprd12.prod.outlook.com (2603:10b6:a03:48d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 18:59:12 +0000
Received: from BN6PEPF00000070.namprd03.prod.outlook.com
 (2603:10b6:408:f9:cafe::44) by BN9PR03CA0200.outlook.office365.com
 (2603:10b6:408:f9::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 18:59:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN6PEPF00000070.mail.protection.outlook.com (10.167.248.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 18:59:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 11:58:41 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 11:58:40 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.46 via
 Frontend Transport; Mon, 31 Aug 2026 11:58:37 -0700
From: Wayne Chang <waynec@nvidia.com>
To: <mathias.nyman@intel.com>, <vkoul@kernel.org>,
	<neil.armstrong@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <gregkh@linuxfoundation.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH V2 0/8] Enable USB host functions on Jetson AGX Thor
Date: Tue, 1 Sep 2026 02:58:27 +0800
Message-ID: <20260831185835.3732707-1-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: BN6PEPF00000070:EE_|SJ0PR12MB7474:EE_
X-MS-Office365-Filtering-Correlation-Id: 073a84d1-d9a3-4a8b-0b86-08df0791f1ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|7416014|376014|1800799024|6133799003|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	m0C8m9oiVhF/SfVpjc42z06LJBKGQEqXi97VL/YUbbcdMahGSxlfoWSVC8S0sTk3tfsBU8l93gFXFVp627RBXgs91+JNQCzHE32fgX1nClQXkBXY4lQIjtpGPdJFa4+jlngjCKHFjfr82zjaX38U0vDJMK6Rrm8CadWnljKXcBpJXczvnjmV9wogj4FSjdHkP5aLlJTOqUHIzzzKOn6TWkC1afE7Va/qQgmX2r+9ICucDTq1WOyXY2s1oZO9nMuCpIN249tGeGO8gR+WWxSjRnsKL5PFB5UoYceQHWYevb/cFaHX9eNjV+PW3Jd6OFuPVN2msr0ie0si+0s4wrNagAL4KqSaDYIkk4OffKP1iaq0wP/xzg7/nRTyIpR2lVLeHFM/NhuOAinhr7zTfV1TQ8faaGWn44xu3UVRHUeS71YGeWV/wjo3Hb5kD5ixBSIht3iGGpyy7QJ1QhgaRvCzK6DoSgkokjfLeZjyIQw29XT9ToigkP2zKu6MCR7uaalZGUBIb2TK/exdFxfRFLb42mStXbjNKLOzqT+s16W4JWNoRJu9AOgbbWYYsWVgkjja2nNX8unBVJSLZWOwa6jEiUy/SX+kYdf5E3nZHCBQr2YON2IlSwHFRpLjBDUAZJ1rvQ2ayHdYFNwj6iuIcsMq0yrcDUEDKmJWMnGEUfi4ikMScmfLAStyFcp0/715KaQdIgUAAA8SdB8MxgMk0L8NLw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(7416014)(376014)(1800799024)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MHTSIqmiQs+Vl1AYZYtueF3LgE8GagnCgYhqdacHsC7X3DDNqoVa/7ZV3oEX2/VAgmyQE8hMgWe6+W5zmlfK1sV/eWkLmPiO4DiFXbHY4trf9vHCFyWhhlh9csa0vN9CqKmhZNpp94xrYT97nZEylhxoH/+bpmPUUzZc7pPCUi6D53fGjcFBDxHA8I9w9ts305onaV+xG4DbYCbsXHo0wV5L0lNZGsCn6fGkG4QYp+LdvH4DbHtBhiiXSxyss7kIg9KZ1fnk0V3BLBavANLUao4ebTb2QyMNzy4FkOKoUD/sVEj+lZLi+yWJ1Vmfjaf3t+jC+a5dPPvRN+v+pxUFh+yww6tqWezfjU4BMtB6fgGjiM++H2Jeyh+CzzufoZ/MKLJ0YzSLYaxYmm/FBO8fGo4CPMOgWR6yVj4ieXnoFStLHrpwnlcVb5aB2wO7Rihx
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 18:59:11.4426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 073a84d1-d9a3-4a8b-0b86-08df0791f1ae
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000070.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7474

Enable support for USB host functions on the Tegra264 Jetson AGX Thor
platform

Sing-Han Chen (1):
  phy: tegra: xusb: Use devm_clk_get_optional to fetch USB2 tracking
    clock

Wayne Chang (7):
  dt-bindings: phy: tegra-xusb: Add support for Tegra264
  dt-bindings: usb: Add Tegra264 XUSB host support
  arm64: tegra: Enable XUSB host function on Jetson AGX Thor
  phy: tegra: xusb: Increase timeout for USB2_TRK_COMPLETED polling
  phy: tegra: xusb: Add Tegra264 support
  usb: host: xhci-tegra: Skip MBOX MSG_ENABLED on Tegra264
  usb: host: xhci-tegra: Add Tegra264 XHCI support

 .../phy/nvidia,tegra194-xusb-padctl.yaml      |   1 +
 .../bindings/usb/nvidia,tegra234-xusb.yaml    |  35 +++-
 .../arm64/boot/dts/nvidia/tegra264-p3834.dtsi |  50 ++++++
 .../dts/nvidia/tegra264-p4071-0000+p3834.dtsi |  95 +++++++++++
 arch/arm64/boot/dts/nvidia/tegra264.dtsi      | 154 ++++++++++++++++++
 drivers/phy/tegra/Makefile                    |   1 +
 drivers/phy/tegra/xusb-tegra186.c             |  31 +++-
 drivers/phy/tegra/xusb.c                      |   6 +
 drivers/phy/tegra/xusb.h                      |   3 +
 drivers/usb/host/xhci-tegra.c                 |  37 +++++
 10 files changed, 405 insertions(+), 8 deletions(-)


base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
-- 
2.25.1

