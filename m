Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 222D9C433FE
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Nov 2022 15:40:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242071AbiKRPkp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Nov 2022 10:40:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235243AbiKRPko (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Nov 2022 10:40:44 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F0415A21;
        Fri, 18 Nov 2022 07:40:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlF2eaDmWk3RwpyI+4R7wi1IimEAZr+yo5/nsPLMy2kXVOGv8UA4unnhZAtHYBr5o5bPsAkZXy1A/l6LhrMeL0Gg6SYZ/rmX0D0XxMbGqY6nGkRrnrif8XlKMzyZojcXDo/QfBdQHoRTlj+fhJk9aJWLzfo6GECwr6ar3cGMCNlN4mL8Do99xtuHYG9py3FJ/2dgF8fNbLxmbUaI4yjScr8R9E5nnv/D+4oPz/OjZhcBHlqkahpqsKPS0a524JDi5a2crqct/b16UCJNkG9RtT0INOGh+oxQJi0/353hlxFda3BImrjPQ7VrGQno+KvW59mJId7ti9GWeOnUVnwDhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLlAUj43sDHosmiX7lM+XcAZ2jKgS0s7C15Ml+CMrRA=;
 b=ladz2wMcneqTe6FdyY+VZZ6PwyoFpnEiStDLnJmZelwF4scZEmjHVV/5EOLAJ98FiYqhwZ2LotonHjiEF7/QcvGkcD2UQ9YQSL2BGq49kC19M/D9RRD5wV9NAoJyZhddUj7/MnErJPTpigW/qLM7ROXD1qLItm5B4WRzDsi0RIJqVecOpmJCCx4o8UVjAksFs6aVCSaxkeB26FJAYTF/LMZWnibR1xwHuBLpEM+bi4iSDWh6dnFoa7D9xncmrjzIx/d1gW2yt7I0eJVogRnYvfTZn5g7wUWU4/K3j/43O8MMevobpeYtxqYx37qLMiMhBQtD060l9BQE8Sb8ynvRkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLlAUj43sDHosmiX7lM+XcAZ2jKgS0s7C15Ml+CMrRA=;
 b=SYamclB07F2h77eh3xRQZ2S8XCQa3CQJuPVm2kyuER0aWt3rI6KDIREtSG4en69PMZw6ODmnQrLB+QxY/EhD+hjjZ5or65hL9CTkFMJQ23ZmeuvUQOXluCsq7WNqHHWANUnYMDH0RKUIA4RglprqKCmyvBIIaJD4dfzd72UUMYpL7u86WE4zZV+U9ozjkAxFAwSoVVxqwgBiPpJt1F/iCcmPuFaIdlfmCKRzSBk7HEjXgAy1wtzBW2ldNAdFhw1mRGj0K8+iiW19lp35+grcQtmfpo3LdDbk2Q1KR17WpBjZ8gSd29cZGSn1Lak75gzBmgMN7XcrhoGDIMzhZmgBkA==
Received: from BN9PR03CA0155.namprd03.prod.outlook.com (2603:10b6:408:f4::10)
 by DM4PR12MB6278.namprd12.prod.outlook.com (2603:10b6:8:a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 15:40:37 +0000
Received: from BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::88) by BN9PR03CA0155.outlook.office365.com
 (2603:10b6:408:f4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Fri, 18 Nov 2022 15:40:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN8NAM11FT024.mail.protection.outlook.com (10.13.177.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 15:40:36 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 18 Nov
 2022 07:40:24 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 18 Nov
 2022 07:40:23 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Fri, 18 Nov 2022 07:40:21 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        <gregkh@linuxfoundation.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh+dt@kernel.org>, <vkoul@kernel.org>, <treding@nvidia.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
        <waynec@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V4 0/6] Enable USB host on Jetson AGX Orin
Date:   Fri, 18 Nov 2022 15:40:00 +0000
Message-ID: <20221118154006.173082-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT024:EE_|DM4PR12MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: 88f9d61d-9770-4b8e-a6a1-08dac97b3cb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: atnS9OTYXIq4x6OcxNppAgtBDcDGFCNacDeHravBBYd27VV+XGPUCXejT7J8vparB/OGNiKczobBCNsN86hU5SzxgMXtBh19j1b56IacXelDVMNVmvryM+YOrWpX/U0DyxO6r1IhG5NiAtW+lz9L3eODBjCJUIPgT2b71Mrb3NEAdpbWQCIexjR6kz8/f4z3ak7VbmrzF5NGgMUTZbXRpiQ9D0y6dtjyLjnkp5MFdGivbZC/2HMgboL7Dfhq6qB+ei3zNnSF9r7baOwfdgDieSLsTyeVJ5rk34mJJOSF5D3lWCeIbKq75DE61rHsegBESSHz5UD0ioaKFsE8ARdf/JUE+vqehluqKAUmuoW+zB14pBh/A9HDeTU2AYl91mzTUJpjRlSjQcu7TmyBDzSOHBzIoU1kdsbAYtM+NaEJ/Xio7H+PvNlKAlcrAScoWdF2J47N4wpJMYtzMrG5hbeIo3lRsphsOHxj7b1lxzIxbx3ITCGIv7hO9iC+XME7QgS2whMtAo8KYroCpFhQgQEhPj+XDwNAgzM/O89jtIT53DEmsWs+r5PVwomjMgH0d/ccCBUi6viWUSeR6sSaG3nWU11FUxKnXW/IJbb9KMG6T2y0w/m1rtVAF3EhoCRs4OYpcFJ6ZsHCckxtkKr3s0v6suTuZnD4RrCPA13qAtkRuW3arbYrsN8uQXmtnd4f9t8ONfdrWna5ymqm0N2DAakYAF41fbRbBH4trsWa/LuhqOgIXNZL4iHS9i/C8+OGnu0cum/4SGiiqK4cD19vJUj3e2/Ivhf9y0DoKHmbpGf8kRLk5Dv07cmQPgMd9FUR5si7lwe4wPPwCy4/wuLCkKcz0w==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199015)(46966006)(36840700001)(40470700004)(107886003)(478600001)(6666004)(336012)(5660300002)(316002)(6636002)(966005)(41300700001)(8676002)(4326008)(70586007)(70206006)(8936002)(1076003)(186003)(2616005)(26005)(2906002)(426003)(83380400001)(47076005)(36756003)(36860700001)(82310400005)(40480700001)(7636003)(356005)(54906003)(40460700003)(110136005)(86362001)(7696005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 15:40:36.0947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f9d61d-9770-4b8e-a6a1-08dac97b3cb4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6278
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable support for USB host on the Tegra234 Jetson AGX Orin platform.
This series is based upon the previous series [0] to enable USB host and
device for this platform, however, for now we have dropped USB device
support and support for the type-c connector while we resolve review
comments for these changes.

Note that this series is dependent upon the patch that adds more
defintions for Tegra234 [1] and the patch that converts the Tegra XUSB PHY
binding doc to yaml [2].

[0] https://lore.kernel.org/linux-tegra/20221114124053.1873316-1-waynec@nvidia.com/
[1] https://lore.kernel.org/all/20221003125141.123759-1-jonathanh@nvidia.com/
[2] https://lore.kernel.org/linux-tegra/20221118144015.3650774-1-thierry.reding@gmail.com/

Jon Hunter (1):
  dt-bindings: phy: tegra-xusb: Add support for Tegra234

Sing-Han Chen (2):
  phy: tegra: xusb: Add Tegra234 support
  usb: host: xhci-tegra: Add Tegra234 XHCI support

Wayne Chang (3):
  dt-bindings: usb: Add NVIDIA Tegra234 XUSB host controller binding
  arm64: tegra: Enable XUSB host function on Jetson AGX Orin
  phy: tegra: xusb: Disable trk clk when not in use

 .../phy/nvidia,tegra194-xusb-padctl.yaml      |   4 +-
 .../bindings/usb/nvidia,tegra234-xusb.yaml    | 158 +++++++++++
 .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  |  48 ++++
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts |  93 ++++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 145 ++++++++++
 drivers/phy/tegra/Makefile                    |   1 +
 drivers/phy/tegra/xusb-tegra186.c             |  64 ++++-
 drivers/phy/tegra/xusb.c                      |   6 +
 drivers/phy/tegra/xusb.h                      |  23 ++
 drivers/usb/host/xhci-tegra.c                 | 267 +++++++++++++++---
 10 files changed, 767 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml

-- 
2.25.1

