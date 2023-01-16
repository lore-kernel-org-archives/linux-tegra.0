Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F5AC678D7
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Jan 2023 15:51:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbjAPPvc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Jan 2023 10:51:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbjAPPvZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Jan 2023 10:51:25 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED6B13D52;
        Mon, 16 Jan 2023 07:51:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmCqceObc+9uudkyWqIN9cWZ2vwzv6pK9R/bd/Iok8nwmn/JPVmqPBTuGcrrEi/o0F6tbNu/cuG1G5g6WMd5ig5AO1WMdyR7kimYFaYbZ3ZDtzelS8ns7iST+Ecqvku8Euw/W/T65bQlGTa6FQdxtLY/BUDPAgYh2/NpGmVWGh9wuQPHdl9tYHUvfE/dAYkZ+5av0BmgwlNKxhnuwwwrOcrM/doOMrl61lKsaezDDB2gvb7EDGma4dWslLq5Caq90lu3qa9xIy2StpG237GVpEANW/M/rfGm+yo5B7/dBID70hFeUcZCmBvPkG7JZUHxCft1RvvyFi7ze3Om4KBzrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Op1bWJooVr/1UrW3dQ2UkgcETp1y/xlTfpAzN4vTRik=;
 b=k5Ljd6M5g60T7NT6Hw7uhEriDL1vPV9uAhz+P0Dd/d+iKmJnt/xGKwqRRUXAdM6/glRQk7pUiF9obSbUvW6V1FJ1N1JfuRUzwOIVMMEFK5ZYt9AGX7WzKTFaGt6AxPmhQeaP2li6gSD29XIR37eOxGGgmCC5/cPI//EgNz+g9HoDdIWtYqMlSmDYNMq6K1IdXoFg1XE71/wlsOKALmQE9DXjHKLhtaPkXgrB/O2NP1Zv8hUAQ2hUzGR0iguK0ARyv7RVA7n2d1S7vY7cDVCMgH/qhKbaOhYS3eZdrP3aTSFNKS/7XxfUGSZk6/FVps4r8jdf9n3ihUdz9ALDu7kjUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Op1bWJooVr/1UrW3dQ2UkgcETp1y/xlTfpAzN4vTRik=;
 b=LNcrXocxb0atZ695t7Gx8vvL0+YYjX8YltLjpHtLb29wwfzUeItTjLP1IdNsS55N6bmZ0imHFBY/Nu69enTvxygG6okJy6Nv/fWSj3kvLc9UmcQ5xREhPug4JnyHKFpI8mVfCyB4ei6QXeBOroQg/Gma29XT4zNWrkQu0RYnmuoijOjibJSMSJyxO+1jJ5yvmBoxdw3pon6GX52UfiCDeD5Phy8Z+NrgPzBiiHaF0uBOn/OMcz22uDdGtVtsrZyb6n8ji83gyOzHkXm1AHUrtwFkK1fflL+qy5IE+xciGitysVrJ+CJPY+WGLaw5oL2VQ3YEY8fueNW1JQWBwBsHhA==
Received: from MW4PR03CA0030.namprd03.prod.outlook.com (2603:10b6:303:8f::35)
 by PH7PR12MB5782.namprd12.prod.outlook.com (2603:10b6:510:1d1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Mon, 16 Jan
 2023 15:51:17 +0000
Received: from CO1NAM11FT105.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::e6) by MW4PR03CA0030.outlook.office365.com
 (2603:10b6:303:8f::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 15:51:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT105.mail.protection.outlook.com (10.13.175.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 15:51:17 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 07:51:03 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 07:51:03 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Mon, 16 Jan 2023 07:50:59 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     Wayne Chang <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V4 0/5] Add device-tree support for Cypress CYP4226
Date:   Mon, 16 Jan 2023 15:50:40 +0000
Message-ID: <20230116155045.100780-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT105:EE_|PH7PR12MB5782:EE_
X-MS-Office365-Filtering-Correlation-Id: 53f86e0c-fde8-4027-07b5-08daf7d9811a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ed9xwS32JCIqxgHlu9M5RKUx/PMRm1fs/I6UW6WA5gyfkPObE/SPKmZPixE23x9OU+cxj6ZaCdllPpQhhWaKIW3p0jMtyEe9DjXIghrU762LKdE5vwAT2tM9o2hCPlIsq6wgSNQE/ccOfJ2NyWSHg+kTXYOcNqDBI8adIPVCyx8FbTdAIGc/xAuiGpBcC19Jrjz/61iH70FSnZQxoojuyZn8fGPKvrfjDLxBup+DpGRREKALOOtU4z6+xgmMC0MYbaC3qRRfTXevOodYYwlJNGAHBV/53NggZ6LFor5VggnCzeL+Wc2XJVUMdPf6YqRg253RFWItT8H/gSsSJk40uN6qncwuA2AB8FCPFbvEPJi666VGT1q2kQnB8gijeXT14ePJpas38XXE+zAOvHxiYudsC7ETU0LVdYKUUV9ZiWyQuJgGPLzXGuyASVv6iPszFZS4ogLsu16AdcSHRxKi7unH7GIHX/k2WqTVcKyg2HSNEDkQGJpdAJ0R/ZrJ1K5QigEQ+lXSNxqAbBZj3+JKu3Z/Rwh4CB1m+FZcxZEUuYcOL+vs8tkvOQ5LWhTPysHhAUFDkA4yKKz7j34mOOT0RVn1wvBEriFefxqmrXrOpWC9rM0ArhkYQ0Za5qLi5OaxoUr8aJZ8GTlUa7dGiEDU5m35BIiBa2vvXsegwAXHOt0q/yyx04J8XBg/awgyDzVQSmWrRnIuJfYqEENhbHWJ2tuWT4y/ms95Zokfw9aak0IzrIgmkgcYdbWMunRi6o8qxUTFdqWlIMQQPlb+kE4OGzcqow1oQgVCjcP5fegIBwk=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199015)(46966006)(40470700004)(36840700001)(2906002)(26005)(40480700001)(4326008)(47076005)(8676002)(40460700003)(186003)(316002)(110136005)(2616005)(36756003)(336012)(70206006)(356005)(7636003)(70586007)(966005)(54906003)(426003)(41300700001)(478600001)(82740400003)(1076003)(83380400001)(82310400005)(8936002)(86362001)(6666004)(5660300002)(36860700001)(107886003)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 15:51:17.0714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f86e0c-fde8-4027-07b5-08daf7d9811a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT105.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5782
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add device-tree support for Cypress CYPD4226 Type-C controller and
enable for the Jetson AGX Orin board. This series is derived from the
series to enable USB host and device support for Jetson AGX Orin [0].
I have split this out from that series because it was getting quite
big.

[0] https://lore.kernel.org/linux-tegra/20221114124053.1873316-1-waynec@nvidia.com/

Jon Hunter (1):
  arm64: tegra: Populate USB Type-C Controller for Jetson AGX Orin

Wayne Chang (4):
  dt-bindings: usb: Add binding for Cypress cypd4226 I2C driver
  usb: typec: ucsi_ccg: Add OF support
  usb: typec: ucsi_ccg: Replace ccgx to well-known regex
  i2c: nvidia-gpu: Replace ccgx to well-known regex

 .../bindings/usb/cypress,cypd4226.yaml        | 86 +++++++++++++++++++
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 14 +++
 drivers/i2c/busses/i2c-nvidia-gpu.c           |  2 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c             | 11 ++-
 4 files changed, 110 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml

-- 
2.25.1

