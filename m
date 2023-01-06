Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69FDCC4708D
	for <linux-tegra@archiver.kernel.org>; Fri,  6 Jan 2023 15:30:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235290AbjAFPaO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 6 Jan 2023 10:30:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235608AbjAFP31 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 6 Jan 2023 10:29:27 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F5648B75F;
        Fri,  6 Jan 2023 07:29:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PgNGnpk4uPZ24/R2Td0MHNVaTh7BlSKKFYMovLkAiHWvZ5kBn1mgSmY30Q+bcsfrenOu+d+6dfZajaezOns+7syv6uj71PFev3pRPbDMSe82BqkjY3NIFLVFF0jTmUklBSq/rr96zEGLADn3uywmRP6k8/xK2LeD2pphU2/7CcgMtcFIn94/932qHu1KHX5QV6HC+EDxuA46iahNNHogT5gDmk4MCN3QE02nxFCNaNh7teL4Q1SLxeRDdzeuWleItk8ybxD4l/rZgxMhio68P5EaK8QFSy7qmg8L1yHVfx3hrpPQCcBggT8ro4wnEI8ODKuwsshNTcZ+xYISWUrQyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMYtY1cuzppD7VqdwRkN7g3WrQ9+D8AQz61725nrkkA=;
 b=mLeWcehz88b7iywUqqJOzY8Fg0kF7gn8vG1JAc0ViOPBKnvx9K45v/PpmNAVImkAGsTeToRfAynvnaFdCHVrDchmnjpV2Pp1iwXq/LNkJV0UmICnHYjZ8we/Zi8qgDJs0904WYrYS9glpF6VlwzD8fguBKcZbHiYsQ6jqDksJU3GNTweNctdilevCDrvd9iwmt711AJ+5H88Kv+LvrUkL9fKuHxK4LAD//G7HxQ3pGcu+rHJgXYrYOKTNBkDXm+mgP8TZC+UOgyQYjWzb9fNap5W9KQ8mbZ2lbyEMoqDAwcQCLbGb25yQRC/EFvFjinLvvT1IhUDwUVcH1+kjlEr9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMYtY1cuzppD7VqdwRkN7g3WrQ9+D8AQz61725nrkkA=;
 b=MkNlaODXF3myt/ab+Ot+6Ry6WPNfq0YlwK4HtDpDCkDaaml6EPbPuGsSqGu5vQ3om1dw2mQ4q1CJWATurOUqZy7P++A0ErPgkvlHHiKX/kX/zILSQHTd/bwRf0wIiVH4sRPc+cF5kt+LuOuN2ay6Kl94VB1o5VN8+IXhZhMor1YdYkLFMvcQxztH7oI2r23rDVYvXm99+DPeoXHzIEbEjI+j0l3Rpvlz5lXQbQctL5Noyb6ozEmWSThufU9yFFrzsazRYgopXGOkLNdN8vcchEKfCkwOmhMXkqffuY7hvdsLQsVOxYXLQ3cogq1XI5RRjyfZ7jeu1hBaoIzzLoy3yQ==
Received: from BN1PR10CA0009.namprd10.prod.outlook.com (2603:10b6:408:e0::14)
 by PH0PR12MB7080.namprd12.prod.outlook.com (2603:10b6:510:21d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 15:29:24 +0000
Received: from BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e0:cafe::28) by BN1PR10CA0009.outlook.office365.com
 (2603:10b6:408:e0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Fri, 6 Jan 2023 15:29:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN8NAM11FT086.mail.protection.outlook.com (10.13.176.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.17 via Frontend Transport; Fri, 6 Jan 2023 15:29:24 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 6 Jan 2023
 07:29:11 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 6 Jan 2023
 07:29:11 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Fri, 6 Jan 2023 07:29:09 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <waynec@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V5 0/6] Enable USB host on Jetson AGX Orin
Date:   Fri, 6 Jan 2023 15:28:52 +0000
Message-ID: <20230106152858.49574-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT086:EE_|PH0PR12MB7080:EE_
X-MS-Office365-Filtering-Correlation-Id: ad3e50bd-4f9d-4acb-ae82-08daeffaca6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U/WcOdFxZpXMhY5Lpwwgv1S3PjGHVRPOV79lI15iwhOd5KQOZB02O+zOEnDBLeCCQZetd4iNRygFEe/ltRMuaXQDIOYTdSXZXz7fiZTlTtu7KZbHrMU0iCf0mqt2ZOH96xWOzSETEs7watdHmEnUGmQzMAFRfw0+L2hUsv1+Mgr6EwFEn+5em3400r3d6m5JwUKYCXZyB/5MpnuLIAwmhE7knGPkeWMXp8oRfFmQdVJak3Q4gO98grC7D44+R/N169p/cowFm1Is9Lwwi1kEMARUz6FO0G1SbdO6c2y7ffQXC4QU3THmN6A7yEQHbgJAn1EQ+Xk6WTPnV+KPnZlkisBuryvw2Yd3jwthFCL7iZOzf3Y3SGA7cFACC7/HBPHjqlASa0Vigho8GVfaNRAoPdAwmAqcEFLCBmM/m2GXO9eXsCsYcrnVPI12sFIo4shXJyfBiUFwSiQzahvGk8Z5wceHQKsEPeVSk8i3G5ScmCOaaKScptv2I+tvJ3Z6LdjnuBFs7RN2cq1cEJLQmbLqwHPuHoorlEdLjgs4lCMWYJDRUA/4M851NtITVzlq78M+TuwP7PVqFzI2ixV7w0xQlkwmZ0ujMssw/GWNRw/aCjoMFakEUuq6mLsIk6YJiu6M/3i1goZX/wrpc6IAgZbjOINgXbmaXNAqthKrY7sj3fh1fs7QdO2S16dYtK/nPpc2eOL7rxIXcTmv14E0tXxLd11igL9xHPnFDUcutBaXfo6e+HCn6bnM4kOBwFwmHtQhnKj+BE3MowaYEZpj434MgzKOm2NZPJwtPhElWh5Ho2o=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(136003)(346002)(451199015)(46966006)(40470700004)(36840700001)(36860700001)(110136005)(6666004)(478600001)(82740400003)(966005)(40480700001)(40460700003)(5660300002)(2616005)(1076003)(36756003)(8936002)(41300700001)(70586007)(70206006)(47076005)(4326008)(8676002)(356005)(426003)(336012)(7636003)(83380400001)(107886003)(7696005)(82310400005)(316002)(26005)(54906003)(2906002)(186003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 15:29:24.1494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad3e50bd-4f9d-4acb-ae82-08daeffaca6f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7080
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable support for USB host on the Tegra234 Jetson AGX Orin platform.
This series is based upon the previous series [0] to enable USB host and
device for this platform, however, for now we have dropped USB device
support and support for the type-c connector while we resolve review
comments for these changes.

[0] https://lore.kernel.org/linux-tegra/20221114124053.1873316-1-waynec@nvidia.com/

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

