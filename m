Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5547AC761AF
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Apr 2023 18:19:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233171AbjDESTY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Apr 2023 14:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjDESTX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Apr 2023 14:19:23 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F9EC6A5B;
        Wed,  5 Apr 2023 11:19:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mVWL4wSnX/bJ8Tk7EpLw/fxSPC3YHvMGqp0II5nToZEaZvFFp7iGI1nWRRkOByIQWWuoiJYKCLxe/na2mYW3hNP/0GtsozcbheLa4QyIc6OCnpesTWeK9qBLhbZl/zB3uYeU7kzQrjUhVKUMIUh4do3GyPzUEffxzxKA5htGRLr+wrs2KyufZbYQFDjPWf+s4+KbAOulE75cjBitfC1uvFlmMv4V6PuwPnpGgGGaVeTWgE7pVT/MAv0A26Qiy/kjDRfbYwcJi/3KPvbIqY/sjFyo+JsnR13LLdsvIC/mePsUjihFxT4m61nJDGHPImrIT0MSpulFgv8xFjV4dNshnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NUHIqL9GG/MqckcICY8cpcEz4mrhQ1ioutInGCeqUlI=;
 b=JNBXK7/XG1JVSrbuZwy0l6jByR8aANpN4/+0ALozbogZ56sV8t87NXwOva4WQfLEE/LutsbG9mkzd0HbfML0XLFNzhzRGvEoniAbnTh7215PJlTVwXhCxHV9ybEJ/5L4bwgxS56owdoH49OUijjtuG82ngc0JUnPSiklKXVMGT2kEiOYMdcRvtIZqG6t+n+Exy78tbazY85LGuB7sFWqVkHDklR9rwvhdk5pijfH2JdfYcwdzYVJ5qY500DiSuscQXv5Z61yBhKXX6+9qnJOYkevDegb2ycVBCJd9T26sRivZVDJ4efzx9hanrfbEI5oLmKbcx3HMjcjL+E9ZF85cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUHIqL9GG/MqckcICY8cpcEz4mrhQ1ioutInGCeqUlI=;
 b=Mt3p53sKVL63Y7GN/db/+4uCpMQVYfD9PeN3AkzfLWsWtMqZCdkdHrKtlaftzqvMbQ0CBXOal2wgXOtLJj2GhclQf+saEhDTWri7qvOCv9WOevObsWB1cV/+v0EOL9Ngk1RLwSch7mbPOFiwBldBs5F4lIoO1MmYP2aN8MbmcUfBUCh/kmgnwTRFAO+NX7lQenKGtBRhrVpjPe6azt00fQ1MmHEWx950mU4HEkN4S7TZlzQBKfW84eUlu0OHsWdSbpBoR1+xfjddvPYE8W7ltoSCI+HzN1IvjSjsbF8yTrC0JTUEeei/lHMOK42xbAJR3AvZFkL9lEMvEj1vsvf9pQ==
Received: from BN9PR03CA0638.namprd03.prod.outlook.com (2603:10b6:408:13b::13)
 by CY5PR12MB6624.namprd12.prod.outlook.com (2603:10b6:930:40::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Wed, 5 Apr
 2023 18:19:16 +0000
Received: from BL02EPF000145B9.namprd05.prod.outlook.com
 (2603:10b6:408:13b:cafe::71) by BN9PR03CA0638.outlook.office365.com
 (2603:10b6:408:13b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22 via Frontend
 Transport; Wed, 5 Apr 2023 18:19:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL02EPF000145B9.mail.protection.outlook.com (10.167.241.209) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.35 via Frontend Transport; Wed, 5 Apr 2023 18:19:15 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Wed, 5 Apr 2023
 11:19:06 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Wed, 5 Apr 2023 11:19:05 -0700
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Wed, 5 Apr 2023 11:19:04 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>
CC:     <linux-usb@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 1/2] usb: gadget: tegra-xudc: Fix crash in vbus_draw
Date:   Wed, 5 Apr 2023 19:18:53 +0100
Message-ID: <20230405181854.42355-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000145B9:EE_|CY5PR12MB6624:EE_
X-MS-Office365-Filtering-Correlation-Id: f5b4c462-5b88-4dd3-3acd-08db360243fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sBQJxGXCQ9ACw28xtH16W0UYpsOwDdAITVq/zg0eRkn77bX1uExuFlkRqai9wvkL+7NozdGHhBvxU3d8U9/mGCHRq+RZqEU3B42xY1H2FrES3UeOKWDe+VkLwzoNyhFefQrVuQYjHoVXuyWo088qSxU/vv/T2k+zYT6IdLMr7S5ZQZu70yIiQ67T72jzBh+XrfGZi1Jq8Z2dqKlbhcuh2xXKf1NOrEaTzOwb7SzEpuMqrrUIxQh2y0rsqZ0oJCzd/PZjNpaSudOY0LmC/AcH35t1rIEZczC5qxeNKlLX68IR0diqYKCnGegr+e7IKeg3CbnaqXsvVgJpYuswRtbt0BeEnOoKUKCsi5bRt2J2m47Fe/HeuE8NVVFWdOo+osl5zN0Nfx/FPNpc1OM5GJ90U5uzW35uO+K71WvmCr5qMFEc08HEDTGbxzaaBWcBSKCR9mxN61j03MGk5hTW05nA1WwLfOGJ0Od+ZigNykmXxUKfvMqQl2NeruSE5IrJdtKgytW4bWXWukhSSRwazk6qKos4aMceRI2MVdA0QRgT8m6B8ehrQGtk5jPUgKrintcGYuTPgYNUqAbTKqpWxcgAAzXlWTS9KvNYFHS3WIcDGq8Qyfrd8zA5sUV3tZy/ji6Jd/GFh1VkJV8bLDTuQxOGWK45IG3l7V1UzJxo5SHsftFvVBhO9xVc9yZ1skmCOXt/GZ67KZNQzmwyde5G1H9C/Thu4angtyhZR/RKQz0UHddT98uEZNOiXUNfes13T+vb
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(5660300002)(41300700001)(8936002)(2906002)(8676002)(4326008)(316002)(110136005)(478600001)(7696005)(1076003)(26005)(2616005)(6666004)(107886003)(70586007)(70206006)(426003)(336012)(186003)(83380400001)(47076005)(356005)(7636003)(54906003)(82740400003)(6636002)(40460700003)(82310400005)(36756003)(36860700001)(40480700001)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 18:19:15.9529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b4c462-5b88-4dd3-3acd-08db360243fd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000145B9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6624
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Commit ac82b56bda5f ("usb: gadget: tegra-xudc: Add vbus_draw support")
populated the vbus_draw callback for the Tegra XUDC driver. The function
tegra_xudc_gadget_vbus_draw(), that was added by this commit, assumes
that the pointer 'curr_usbphy' has been initialised, which is not always
the case because this is only initialised when the USB role is updated.
Fix this crash, by checking that the 'curr_usbphy' is valid before
dereferencing.

Fixes: ac82b56bda5f ("usb: gadget: tegra-xudc: Add vbus_draw support")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 2b71b33725f1..5bccd64847ff 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -2167,7 +2167,7 @@ static int tegra_xudc_gadget_vbus_draw(struct usb_gadget *gadget,
 
 	dev_dbg(xudc->dev, "%s: %u mA\n", __func__, m_a);
 
-	if (xudc->curr_usbphy->chg_type == SDP_TYPE)
+	if (xudc->curr_usbphy && xudc->curr_usbphy->chg_type == SDP_TYPE)
 		ret = usb_phy_set_power(xudc->curr_usbphy, m_a);
 
 	return ret;
-- 
2.34.1

