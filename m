Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5544DC5479D
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Jan 2023 11:05:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbjAKLFR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 11 Jan 2023 06:05:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbjAKLFO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Jan 2023 06:05:14 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7ABD261C;
        Wed, 11 Jan 2023 03:05:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TiNDGmLfN+snbyxmhOJRBCEeIJ1zqHtCgBUVf0LZ843t/THZ9hu38DU+R0JjJvFXKEYPrRg5R57unnVTk/EB/ej2I3RQpfD7GPH7RPgCPgeLtD77lpyRq/qEBjQESujdOlU/wneI5QDCR6DySQlBdu46YsNY0oLr3shLHiysZ1QtJC5ZEqQZl8I0jtaoqLEIJ3qv/mVECXd+8Sm0oyvpQ4aSXKI2DlVRIIMSBxEBBNlkM7rysSqBAzyLLOih+99afuBYHxAN7dUaopySaCj3P3b2p+NTqH50rzWHbN24Oud87+HH2GldEMGOBxhyiYQywUPM25fSAAqQhh2vrVVP4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUlt5CmNVR9NYL9BcHKi7y8x8SaiG65q6QgcLtRZbLE=;
 b=YF9F7gTffpBIGA6s2W8RwwB0oQAQ7aYAnoXsgGSKyXEdWBkv3guMKh8do45KJPsSEM+8SzN9FJ3wDm8QdhF0zxdTR+lhOVHy3nVMju+8fIAvUT0ZVp9JuXF3JNDYw9ELkOmfl1X3mN17/YPM9nomrn/b2qW/vxY7BuHDIiPRTh9ZdNV8268FustUDe25ZMRRb8BqVbHV3m5GuGW0KwxcWoGoFg5RWDKUePO2EEvSgTkkXNB4zlrD0dAEWI8U8+piztOOpxeXjGkrWcFas6W4n08MNcpBqD9upj8LlLrfKFNPi/aDBKJjd6q+SZf3IXsUkcGluNcZ7HsW/bzqas41lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PUlt5CmNVR9NYL9BcHKi7y8x8SaiG65q6QgcLtRZbLE=;
 b=V9xPaSs3m+yRdG44Tu1ClDku0+Sf5mr5AkUnM522WonR4l7JkZVOE4YvF1IH69nCcXFu0OjDuSAa3n6ld3NiG6/HQ//2NMdDD+q/3lF3RtvbnPKnwhXCi/0Sn+j+qxmbPuUnPGXkeRHzgJhFXbib8AMnvZ+3RhD21ET9CQMB30EQmh9/LDzTm7SsTWYRaU+2DXO4vbfEM41vFlRwyGNKiMJa3p/QkIBPwUtweCGUZ32XhcuAT/tqvHYBHRCnQx2EqzbSqQ8PgRm43U299WeSW74c+Tv507P+utJ7uwszKH7Qj4cYTSdH3SkKrwk9S10WL7m5Yctchq6sZB8B1EGfKQ==
Received: from DM6PR02CA0041.namprd02.prod.outlook.com (2603:10b6:5:177::18)
 by DM4PR12MB5216.namprd12.prod.outlook.com (2603:10b6:5:398::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Wed, 11 Jan
 2023 11:05:12 +0000
Received: from DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::e4) by DM6PR02CA0041.outlook.office365.com
 (2603:10b6:5:177::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Wed, 11 Jan 2023 11:05:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT066.mail.protection.outlook.com (10.13.173.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Wed, 11 Jan 2023 11:05:11 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 11 Jan
 2023 03:05:03 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 11 Jan
 2023 03:05:03 -0800
Received: from moonraker.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Wed, 11 Jan 2023 03:05:00 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <waynec@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V6 0/6] Enable USB host on Jetson AGX Orin
Date:   Wed, 11 Jan 2023 11:04:44 +0000
Message-ID: <20230111110450.24617-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT066:EE_|DM4PR12MB5216:EE_
X-MS-Office365-Filtering-Correlation-Id: 9665cfc8-a4ac-4e67-3d66-08daf3c3b5d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: adUfy7NAMwFnYQULSkE9QzJvTm3zFqHbhnTVD/VH+CB9L08LNVOLdF3Y1uZP2p3AoKKiO7PzQrlfdcgWJd51UalH1qRJkz41O8qYGFiGlvMX8OI9btyqLuKoJ2drAfb/tifIvd7qiLkzNSqgIUWPZMmunYgZKGgphApVI9Ws6JS3PaHq7EiLZd8XUk0LHc3aqg4Rp9jJihbTqnx0MRBKCaIadBm2ilvLuV8XCl997b01DTcDoG4TIFnwnoosgWkj9W4xG3+7OE4/J45vgTinrSkXOIV0TzAwKFeTRt2p1PQLpA1Nw7X5pPNvd+gmSvEASVVx1e5hXMCubYssiginU7pscOCFt+Up7k1SyWcZ1+eeAKFM0ZbMw1hKmqsA5BrbIGHYC3tFaCUlplQkeINM4uH7hD0dcI36nxdYmBC0q6mCFEy9vo9xE42fHQNpa400zyG+B3q+B9SlvAnP7Thg5abkZbVIdPDYu3eZfzKUFufHeYfwJhmmysm4C+s1YDprsGMbgSb1My8SWdRV71QDC4MehgKgJOI4G671M8UqLWqCZWdpkyywSMhabgNNUKHdFcQl5EbOoc0SdLj5vEgbMfM6aHVR/NU4s5ZDNg6OtIgdZmKIfGqshUZT5d7d/ka8B+ZYbBRnCtZQcLu/Tx6aVNljYgi3Q2vsGhX1tebgCyjQXwCiEplNS4fAyyPeHVAVEcCxW68nqKu1/u+8HB0VXBhUo4PSAqAeTopKqEqk80R1N4dcNrgFnj4kpgzJ9SDHx3JxuAtEJ5fGsVzjMmN1C1eHt4XPAmYWucNYNKZA2cE=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(478600001)(82740400003)(426003)(966005)(356005)(47076005)(41300700001)(7636003)(1076003)(40460700003)(86362001)(110136005)(54906003)(316002)(2616005)(7696005)(186003)(40480700001)(70586007)(26005)(336012)(82310400005)(70206006)(8676002)(4326008)(36756003)(5660300002)(6666004)(107886003)(36860700001)(2906002)(83380400001)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 11:05:11.9829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9665cfc8-a4ac-4e67-3d66-08daf3c3b5d6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5216
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
 .../bindings/usb/nvidia,tegra234-xusb.yaml    | 159 +++++++++++
 .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  |  48 ++++
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts |  93 ++++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 145 ++++++++++
 drivers/phy/tegra/Makefile                    |   1 +
 drivers/phy/tegra/xusb-tegra186.c             |  64 ++++-
 drivers/phy/tegra/xusb.c                      |   6 +
 drivers/phy/tegra/xusb.h                      |  23 ++
 drivers/usb/host/xhci-tegra.c                 | 267 +++++++++++++++---
 10 files changed, 768 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml

-- 
2.25.1

