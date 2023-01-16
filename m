Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB566C678D7
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Jan 2023 15:22:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231734AbjAPPWo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Jan 2023 10:22:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231682AbjAPPV6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Jan 2023 10:21:58 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC29E2104;
        Mon, 16 Jan 2023 07:19:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBM+bKGmELs4UqK4bbkVfOrMkSGznMnxxKATROracdnwNnRNkFTB4x/6HrZ5y4mdy8f7GWLfu2YM6P9c+Bpc7U7iarAwGgSgtjNFH7AQ9hH+Ryt6KddVWSMmWAToNKM65ePxNfoMkZOj9EDFQfP4w+Grw1s8knLY7asBErkJmwvF2ThFMOV/wSLyByTbTizW5aKTAdhPhdNsv6aU0hhqV9O9XqFK8ZNWYEzmF6xmzZwSY618PtGgsa6EKx3H+buDbTEgu8kp0eafHE0nfq96Nm9T8XDVBQ0uBFgKo4lYFQFQJcRsq6W0YgXi0csN5VLZhqRxrEhVPGdTSsb1ZnAKiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecWzoeOs6X4p9mO25Pz0CXxnWnudYcZJzDQ2irCds28=;
 b=oE763lU3Usf1fbgncmpTW8003F7ZjbaEtn4rAirIhkzBPulrtGiVKR4gowHWU8yzcvwQie5L3WRMuGheaUc6Z3ghTeTK8hvwG3rvFwXG36wQ1miEaXyvKLzPzm8ILTa4LRAJaOTvzAr/lS4+O4n+4OIsltryh/mtaUnk3NAXngdlwGkiwkftJQTXy7JXGVYRRF504hR5ESRDwjW4ggsyUhAcrNAOHKVXfWZ3Tyky+rUu8JMdI6NNLgyLu5N9Tb1j9DS2abVNxZkqy/SOeliTfU+AOig+tJMP9fpZvN4UzZpv13LVHJrKQh+eU1CnNpiMhBU3lzWBFq+O0Tg1VlWhtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecWzoeOs6X4p9mO25Pz0CXxnWnudYcZJzDQ2irCds28=;
 b=s8yOpy5EvAPJH15TceJ9nVsrP7bY3/4S8BLXaCWBL1C/b21Pd56wStvJoSyDqXfI8aFSQrFCBnruw+TjOhufQkyQLXx3OKcBvJQvVKZG9iqnzx5b+HUEOEJ1/nFOouZs/d695EesM37sRGbVfVfJgMii2iYPEznOhBucZXaM2bdog66QNKoTWbT0UljWWlVvR1g17ou4VP4hscaff2YpBV9UIke11hNWERNNtJNxPo+3U/v3zy7a7ORvkBF6dOT4iPyztxN8+OtWvutORjbEhvpXCnQRwBwTTeyD9JOdkOqtiN9JZBcBVWcuLekqJy5JsAgzFw/RfUH6GFYt+RgXRA==
Received: from MW4PR03CA0292.namprd03.prod.outlook.com (2603:10b6:303:b5::27)
 by BL0PR12MB5011.namprd12.prod.outlook.com (2603:10b6:208:1c9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Mon, 16 Jan
 2023 15:19:44 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::ec) by MW4PR03CA0292.outlook.office365.com
 (2603:10b6:303:b5::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 15:19:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 15:19:44 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 07:19:27 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 16 Jan 2023 07:19:27 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Mon, 16 Jan 2023 07:19:25 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [RESEND PATCH V4 0/5] Tegra USB device support updates
Date:   Mon, 16 Jan 2023 15:19:12 +0000
Message-ID: <20230116151917.94193-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT038:EE_|BL0PR12MB5011:EE_
X-MS-Office365-Filtering-Correlation-Id: 506c1c5a-c949-4cd5-8bc0-08daf7d518d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q6y9vLcWZQfYGAVt9AkAa9J8bharA7Bv9o6vRMyGxK6Q9j4NPmSV5/vwwYoYXrZuxsCteRlD8QDj2dhxko6nVI71EbfkARHLlAHzQVed89hs+QU7DSoYczFrjLz1E6pA8PZvkiYy1CFmCt4F/VIvR8G8LswYhDgvsHo2e6S8yiwYO20gCmFEu8lW9mnH6JLaGzA/vY9kDG+YUC0HQm9eQHYzUOrDnefa+4wVWqasuv4rc/JwKTeIUOcG5bygbtjQXEVyNbTjxMN3gEIiLwQCAhpd2TwgHmeHbKkoJFLD8siOZUWUSCbgkBxjteut32hOVObo3A5rs5pYkRtaxc6ke2fdyJgOREmaBVtl6VSRJhHVoFFY1WcRnLthSKcvuOZ0fPc0Mz1LXfBB0RSMrK7X1B5W4qgB1bLCtjlyspNqsvUeYeLudjPYP61JZ3xd9cJ6q4ubtUDqW1phQtWms9zmpP5dWQ7NP8PBW1XexVIE+vx3MKqaGRpKAqNR3wXJnGW/IlVMzJdOPdW6e5N67TlBuWDDDhe0tBNdbpG93depo50K+B6t9xyKfvs/CgTMVDviWIhxqpONq5KqHxcJec1WrGGx0LNXdptvNEcXJkGmZO3+6BmpMcbpMh6qZYxFf8ZDnNvBUkSM4WlEDgwMrE9MO+mZT97LXEvSzXBHnUh891ami++/7i+ecjxKliYHiBbemKNtnROVHTcqM+/oDOns+4BXrLg0XJLkucSwnj05ngKbbDK0cFWwFIa3XBJ6rGMO
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199015)(36840700001)(46966006)(36756003)(82740400003)(7636003)(8676002)(4326008)(336012)(70206006)(70586007)(356005)(186003)(82310400005)(86362001)(966005)(26005)(1076003)(316002)(7696005)(110136005)(40480700001)(2616005)(478600001)(54906003)(107886003)(5660300002)(6666004)(8936002)(41300700001)(47076005)(426003)(2906002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 15:19:44.2414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 506c1c5a-c949-4cd5-8bc0-08daf7d518d9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5011
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series adds USB device support for Tegra234. 3/5 patches were
originally part of the series to add both USB host and device support
for Tegra234 [0]. However, the series was getting quite large and so I
have split this into a separate series but calling it 'V4' to indicate
that this is not completely new either.

I have added two more patches in this version to fix DMA coherency for
Tegra194.

[0] https://lore.kernel.org/linux-tegra/20221114124053.1873316-1-waynec@nvidia.com/

Jon Hunter (3):
  dt-bindings: usb: tegra-xudc: Add dma-coherent for Tegra194
  arm64: tegra: Add dma-coherent property for Tegra194 XUDC
  arm64: tegra: Populate the XUDC node for Tegra234

Sing-Han Chen (1):
  usb: gadget: tegra-xudc: Add Tegra234 support

Wayne Chang (1):
  dt-bindings: usb: tegra-xudc: Add Tegra234 XUDC support

 .../bindings/usb/nvidia,tegra-xudc.yaml       | 15 ++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  1 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 23 +++++++++++++++++++
 drivers/usb/gadget/udc/tegra-xudc.c           | 17 ++++++++++++++
 4 files changed, 56 insertions(+)

-- 
2.25.1

