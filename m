Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91C6C46467
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Jan 2023 15:07:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232908AbjAPPHu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Jan 2023 10:07:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232916AbjAPPHZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Jan 2023 10:07:25 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55DF84490;
        Mon, 16 Jan 2023 06:55:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/uK9jUvOuuVzdAJEJEX8jxlmNiQ+tASdOe1fJt+opW49rfTFmGkh8sjz+ya4SC4rKp1fuP7QUAw8wq9ZsxzhBPku4Rco3U1p1Egnf/fTkB9EEgvcTl+S82uiuQaj1niMmqoHoHPc9R9xudBOiHzEW3x6Tlj1myMSlrEkqV9JxJaZDHkZYN2BKHcq7gigB83O6JJI645Cn2Vq4ebdKcGDaNEl0vi4nBiv0HIYMP4TpjoQkhYBoPH2unWaHmEjz2HfXAElJpE5g4FKigJnEanzgpC5F0b9mLckYaWVNV5KKHGHqQFsiwkcGR8EpzVNWy6r/AvLu9sdERa6GXNnxX+3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecWzoeOs6X4p9mO25Pz0CXxnWnudYcZJzDQ2irCds28=;
 b=go6AaqDkqHXA+fubjAGshO0ofNpF/FA7cSyjiU+h531NhrJZOWA1t2nwm5QeJONzBTDhtdzQ1Nw+axOQsHBCZOks1kzAneJL4MFCeMc+AiNxBMH8Vmu6hryoHrkM7dSmbEXdzV2Buxf05FM4+cFiODm0gIabNh/WVcqV0tzBynf4Ji/95mV88iKxU42v7XxjKT4UffNhuHbryfe3Y0d0alQheP+R7Giq5yGsme3yfgScE9sTjDOlbaoPe3Gh1nrgWf6yxOUU/y1ocnCofKzCU783ACf8pmE2oPh/bKlY+ENPpZqmPNlLTOU7K3Le6wZR/7RtVLj85z2LQUuTkyOpZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecWzoeOs6X4p9mO25Pz0CXxnWnudYcZJzDQ2irCds28=;
 b=JImJrNruuRTSfoVX7Puo84Gpeh53o2WWOkHyYDtSrKGUZcs5ijXJhb2d/Qw1OCoZmNK6sO/iHXCzSQPDfIbqpPJyfzBkMe9J85l3PPiRoROPjHTyjTBgsufZpIjaa6A/RbwfUIWKRK2hvrbAWdF9LDDpxPt2KW9wblZEMSwe7TffpROtF42xtBgbfMpa07dvjBj2hHbRI1g7nyI7EQFj69cnZiKDownSk4keN8FPjKUv1Dw6kb8JX+2GhBumMkHHfynU/5JZmc8SAiCor0GWNqB0q+m3kCZ0ACXNEdZ5nkZLJe6yc2ipK74W16VcBTAK0Epefq1iEA7R7QLjS++anQ==
Received: from MW4PR03CA0087.namprd03.prod.outlook.com (2603:10b6:303:b6::32)
 by BN9PR12MB5081.namprd12.prod.outlook.com (2603:10b6:408:132::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 14:55:08 +0000
Received: from CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::b0) by MW4PR03CA0087.outlook.office365.com
 (2603:10b6:303:b6::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 14:55:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT009.mail.protection.outlook.com (10.13.175.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 14:55:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 06:55:03 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 06:55:03 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Mon, 16 Jan 2023 06:55:00 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V4 0/5] Tegra USB device support updates
Date:   Mon, 16 Jan 2023 14:54:47 +0000
Message-ID: <20230116145452.91442-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT009:EE_|BN9PR12MB5081:EE_
X-MS-Office365-Filtering-Correlation-Id: 22abf752-a9d0-46f3-0a57-08daf7d1a927
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vu78ywjV0kVfHs+Ib3JaEtBMC+TruIcdVQNjrt0X80xwUbGE8hMUlkU5jypTKZKz2IBI0fVp2C6345Jd0AeToH8BpLnR5sbOQd5cA21rxQ0bWMwKmcggLjKx2i3HZ0hFriUypSLiTz1OBpiuXIn4t7xcSDqXNRcpRiYSFnhWAzWMCAJlW9cwXZXR09gpyBG87WXxr1k7QX3eWgkQQR5cp1AR8W/KZbzAIvYbUCjzJTsfAOLeMhk5g5eF4BVv1vMj27u+yS/gZ27fR6kAoXxynzRBS19A4ynTOlSv5sX+OFqcozzcPmpyUh/yuMz7q0gLQDVydPB/g4Khan4toCUrzcGnAYJRihLJwh3SoJ7uxKQGDHn5zdx4Krnoh+ByMtno6ql3cTcfsBXT/WU0D/AnyKyoD0zaAJZWtFDLj+hJJzUAQAKLMyb1ASA2y20clbjkILSWCZCR1LuEA1/nVZ6I+bC+nLbU6VInZvVkFK3vXEWw7iZYcuJmPL6r33ugMnn9eHQKjjYOc6KcGCZBQm1/dWKGuqfpX7Fc2xz3bLoUrQ7fRHjuY8Xz0OiiJqMdJ9ooFvKKmvEd5hEcIrfFarjYfOGIFvSJAN9/VtJ9pHDq2MOOpWl7m9/BsoJYUW1AUeQzR4txrz8XHazRkjMAe0uPJjkahz8g8+AbtdjCQyu4tO8JZ1Qq8rOrut8bytxu2BiG4dZBOCPYAyBLtlU/6i/zLGmbE+i+QP42TESVzKEaPG1x1FZuvcVOeZkKxsO267eVmQZ+QFrgm+dzJzTzTutWRjdgpkMY96bxswWTV6jA/Zs=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199015)(46966006)(40470700004)(36840700001)(36756003)(82310400005)(86362001)(26005)(4326008)(8676002)(70206006)(70586007)(426003)(47076005)(41300700001)(186003)(2616005)(316002)(1076003)(6666004)(40480700001)(54906003)(110136005)(107886003)(7696005)(478600001)(966005)(40460700003)(7636003)(2906002)(356005)(82740400003)(336012)(5660300002)(36860700001)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 14:55:08.3542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22abf752-a9d0-46f3-0a57-08daf7d1a927
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5081
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

