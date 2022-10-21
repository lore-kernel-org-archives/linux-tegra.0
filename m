Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C36C43219
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Oct 2022 08:42:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbiJUImT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Oct 2022 04:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbiJUImR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Oct 2022 04:42:17 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19CD824E3AE
        for <linux-tegra@vger.kernel.org>; Fri, 21 Oct 2022 01:42:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvL8y31OLFVAbGPPCBi0xwkgp0DXHxX9J54OMM5I5rnVOG+nw2VAtK7CeQg508D+omGMhSB1qE+YxWBM1RNfjfH3BLDnqSXb7PffadpEBLhr8MEjPt+7XkqKRp6HImYkH1eKDF6+r11XyrRGqCCQaaGxMgrZ4jU8qDfk/DqyRxgsAP9mRjbXyA+LLqai5CMxh64fy73yvkcKapTG81N6lftGS4+r80rfA6Pvk02BsA8DoRzMIkHGAhdTTQl1EREQIZGX1k49TNqffpLtedhcujKIOTuYjQJOMzzljZDwKCF31fFRhkRHRnoe5DV1SkGv2hBX3JGmFSprsK7xu2qLmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEMLmt9wZREjBPasPROXB3BcgO7k8QQfWl5bEXjXsuQ=;
 b=LfY/nwaux7bwxQiRogCKNU69We9i7z5RmAKWfJfNQnru506raDiePHTC26ZKCjkC6D9FSqTjxlSIVa8+2UeRIL7QWenG6G6sTOg1D2WwyPkTSMUlYgflQUw86ZDkVlS+JoZIjvvoRCwWM+OZC6W/EkKjSWCE+8qQBzto4CeGB8YrxWVFIrUs36q2kRHYtexwYRfAN3SKgria2Ovcha5z7P+T+Zc9vm//S9LbY8aejJjaxLAN7/g1Cod9Hbpzbq7l9gLLtu/R9962EbWqyxA9gWxg835sFVuyVwVL7agcpOSQtNjTFmyKkCs7IniubmDdM7GzlL+KkQECXXEWoTuK4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEMLmt9wZREjBPasPROXB3BcgO7k8QQfWl5bEXjXsuQ=;
 b=Nh6TCACerUan9bkETn/FmhfbhYYzId3TwCCfekiEkKx8ASgIRhNpN5VIWjA/HqDuVUrfgeQiEHFqAYxO3KTqs4PS69VmU4GsEzf/IkAzvU58Mpovdu3PvNKSOZ+8hRWDlWq7c9+sisSxvKTgIkdmpzriqzsBJoxpei1aOt3fJtQHpsOHjbjWl1CawOnLJz3N7oqmhCyRCLcfZwxn39wW3MqjFod/NpZXYn1roM4xl2Ok9DLyjOorGt27avg0KN9RCNQH/syGf89dedurK7jO0jk26P9d1M56UdAMqMbXsCelAqoyfdYd5uQE5b/UKrcP9ZHFoxktxM5iHxly2A2Ekg==
Received: from BN0PR04CA0119.namprd04.prod.outlook.com (2603:10b6:408:ec::34)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Fri, 21 Oct
 2022 08:42:14 +0000
Received: from BN8NAM11FT087.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ec:cafe::b0) by BN0PR04CA0119.outlook.office365.com
 (2603:10b6:408:ec::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Fri, 21 Oct 2022 08:42:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN8NAM11FT087.mail.protection.outlook.com (10.13.177.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Fri, 21 Oct 2022 08:42:13 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 21 Oct
 2022 01:42:04 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 21 Oct
 2022 01:42:03 -0700
Received: from jilin-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Fri, 21 Oct 2022 01:42:02 -0700
From:   Jim Lin <jilin@nvidia.com>
To:     <jonathanh@nvidia.com>, <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, <jilin@nvidia.com>
Subject: [PATCH v5 0/3] xhci: tegra: USB2 pad power controls
Date:   Fri, 21 Oct 2022 16:41:56 +0800
Message-ID: <20221021084159.13954-1-jilin@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT087:EE_|MN2PR12MB4255:EE_
X-MS-Office365-Filtering-Correlation-Id: 56d405d0-e9c5-4999-71fb-08dab34026f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8/JBUD7RTYOBhO9Qrx77DRSVfPPTKMocsuube9/gXSU8xghFs+pnWW8Bu6pO02nRrdCEt/Lt+i+sNgRlaXPqoMS73p/de9k8XaoYcoRvF1yzlKbqh/KyXJ/O6q7fc7JuoG8L8qqm3gpKxX1UI2vVnmRic49YGwXOe7oI9afu1Jh8A+0bSNIbHPtCdY8F803ft/NlonWZGa9nJQ1PVQiWRVgpsInQRJjTlO2zycbse63znYCpfdpsbtqQu8I4P8UjjPlR7g4YbeTIDZVn3bLbc2y2mAMGAHJOphRmdH9OmAbM4gMQqGLDjSRY2i+NYDuiwI7HvmKVZrivGEKUo0bSDv60E+rndRRDn0mRNMucxqOc8luKyC0jIWRqKAPNOi9AyKkGLofseKtDZRd1NKP7IYXOTLOq/z58oR5LqyqMozVEmu6EwjmEgiJZukxOgrigtmK7PIBD3mlgSR5hRmCn1lPnLZcyk7DHdgrnhlAdOO7op9d3BIp8pDlJHXy2BEV5NjGPCV6OP/nEyvQJn8dhn0LjRS3QWpePKCZxqDtguPUdYkHYUIHlOmzkKlWg9tvgSuLosGVZXCNgFETXVN4AHiIhJsQdRtgQr0sTsHYj9V1RMgKBzfTTi45kXRp4JbYAVJp8WhpAnhNbb/qQd4VyRL/RzWKen6psbyEo4Jev2yQlIh9EqazVqBzR22M/xkA7zjiFU85G2qYR3ZBDN+wf1/rwobwwF6emOsZzBDfqcLp1sqovUaIweI1/hOKl/6Su94y3IGHwTwkyt25nMMz5Kw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199015)(46966006)(40470700004)(36840700001)(186003)(1076003)(2906002)(426003)(47076005)(83380400001)(336012)(40460700003)(26005)(82310400005)(40480700001)(7636003)(86362001)(4326008)(8676002)(356005)(41300700001)(316002)(2616005)(36860700001)(110136005)(54906003)(82740400003)(36756003)(8936002)(6666004)(5660300002)(4744005)(7696005)(107886003)(70586007)(478600001)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 08:42:13.6548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d405d0-e9c5-4999-71fb-08dab34026f2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT087.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

1. Export symbol on xhci_hub_control
2. Add hub_control to xhci_driver_overrides
3. Program USB2 pad PD controls during port connect/disconnect, port
suspend/resume, and test mode, to reduce power consumption on
disconnect or suspend.

Jim Lin (3):
  xhci: hub: export symbol on xhci_hub_control
  xhci: Add hub_control to xhci_driver_overrides
  xhci: tegra: USB2 pad power controls

 drivers/usb/host/xhci-hub.c   |   1 +
 drivers/usb/host/xhci-tegra.c | 131 +++++++++++++++++++++++++++++++++-
 drivers/usb/host/xhci.c       |   2 +
 drivers/usb/host/xhci.h       |   2 +
 4 files changed, 135 insertions(+), 1 deletion(-)

-- 
2.17.1

