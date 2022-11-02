Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FFE7C433FE
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Nov 2022 11:14:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbiKBLOl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Nov 2022 07:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231134AbiKBLO2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Nov 2022 07:14:28 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A79294
        for <linux-tegra@vger.kernel.org>; Wed,  2 Nov 2022 04:13:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqkIrgoB83F/2YurXIiYHs6CdrybfqzHR/eyhbEz9CH5vxdiR6ZiMxBXFIJTi5Y4azmFo3m0/L+iLLcQByRS0ugjyw+c0oWN3nn7g1ONZOdPYg/gEu4pN613vdwpwlALn3Yx1Bp9QDC24NjVkA5HAn+KC3g9C5Enu9qyPC35tt94i/TR3iE5P3SwF+2UvJCSAdU3zdAHte8CuzFu/gpE8LDR/38bzMCiIUgWHw/OGSWcu7YoTo5lNrKUO2ZbtL6OErcjE+Nz34hR/SFsmPllY0rTZAHyDZPU7Z8p+FBtiLGFxODUOFQ80ruhf7xSaWHl+JcYRamUSoiJLjTsmOUVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OP7XE3f3EonlWb29ttqW1b/ZW8cphXWH65Av6LrOv54=;
 b=c2oyC9ov11Y3OjLzawKyt/zZ3PWxGoU7tQWU/UShynraQxuLLV0VPn7LRvzYR+waerm7J0nYh/TxWnELdUuHTzYQcymdYafTbz7gErH+OkcsAARJ96LqEB0zcb0u5ptK/MuKN5m4zhM0Oc2xK0ANzjitSZpRaeKqbPAjgM9C3KzpxGHVpVNAnm4IiRZotwybIC1K1M/Nxvz9wkpaT8wyXSASaWHHvmZfCtuxytfCcvjNaY5TWMC5JY60lUBE3C0z1SkyRZ6OfBrSDrqDqYCqong2CbMHw4UrcVQ4bE1lk4u3ynSwxFK255MaiJpyD1xuok6ZIPN4cGSKkqVHHWssVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OP7XE3f3EonlWb29ttqW1b/ZW8cphXWH65Av6LrOv54=;
 b=Qtu0SxUb+U60cq4FhWtHtCMIQTHReHVfd2K3Y4dCNnm6mruL04sniKAypxO6QSY5TzUS5uvk4SWyTxBtz8jzl79Jx6qkiJH4N7jfiLWylTWnfypj5Ic2NDkFwXrron4oz9qCIxkH+1cAQWj2dLPMNrtORyCQHKcOolgN4TC8XVclvvDmykPuVXopu53/zQMvvzRSVTp1s1I3iOOn6/y/lfOFe4paTsn4ilWBIHKEKanSrdn4rWWa1jvY/sxpqpkR+BV8OyXBZmqt1Hi9OTdVPFQ4iaoPqqO86tUAO03/ovLn5ZIxIhkGickYOp+lKdFYvuVtMB+h6RumEBr7VlxcWA==
Received: from BN0PR08CA0018.namprd08.prod.outlook.com (2603:10b6:408:142::29)
 by IA0PR12MB7649.namprd12.prod.outlook.com (2603:10b6:208:437::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 11:13:55 +0000
Received: from BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:142:cafe::ee) by BN0PR08CA0018.outlook.office365.com
 (2603:10b6:408:142::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21 via Frontend
 Transport; Wed, 2 Nov 2022 11:13:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN8NAM11FT019.mail.protection.outlook.com (10.13.176.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Wed, 2 Nov 2022 11:13:55 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Wed, 2 Nov 2022
 04:13:46 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 2 Nov 2022 04:13:45 -0700
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Wed, 2 Nov 2022 04:13:44 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        "Jon Hunter" <jonathanh@nvidia.com>
Subject: [PATCH V2] arm64: defconfig: Enable Tegra186 timer support
Date:   Wed, 2 Nov 2022 11:13:42 +0000
Message-ID: <20221102111342.27838-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT019:EE_|IA0PR12MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 98a6d40b-4563-4e56-4c4e-08dabcc35503
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mCw2GYs2tOIJ9KkrBhNecNCw7N/GW8CEDmwjW0xTAyzk7K/b8e7kyYLUsh17lEkVSaOGMEKq9zLcohV6YrnhP6fN9evXe5VQDlT82yQG4p/olWSmaSby773EteoER5sLTD/NacyHh15FG+Ld7hNeNNHmWv6dNLPDpsoI85bcVhB9k6Lq/aS4kbFWFBLKAQ8id4xllPHH85rghijNDH4MQUmV47x1v4GUgxfTe5kFIepi1OW9dfdznqZ5EjLWi4D4JX0f8p1B25dgPhKuRZxOsOyU7w/jr+nyUR1wkTmWhiXS4DJteLXJj8BHnlwfaMJP2qJW109N15rI7jRQh2vWKBIA0cG7vsD1zLa+3F5M2x74J98ILI7moSuWFxZaVUOnKzKEWT/vh6J9VxF4jG5F2gNnBhxR3oSshCPkBoCH0JTs86lUCBgnDDZ6bFAxri4RQxn6kpyzNz2rUltuwFIGFA9/Yjbf/d55yCLqKKs+TD4LQHPLgQFLj1zOZIBlnQLM3D1PE+VW0GXfdkRpjZnJEoLv+x1LE7QvRcQ+OUIptcbnYrs3BKkQxadu9h4yAADNz08rsQ44CCCFkz0ff8Qgcf1PEGTp01d/PNO/KwbhR0NjEi/+K5INPO/SLFUKnfgpb0sYpxAkolbhZ65MYFrGZ/1wx7Ukox0lqPl4CgGRQ66H/E8vOkdY6lu4/eAJPNK/3/JiJCf2tMVu2RmlpNKI6GzpjLQHuL6oLxByRMGvrGE0y105Wg32a2sLxgA9N2jw3tuorxGt6GThadwDqY4iBw==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199015)(40470700004)(36840700001)(46966006)(316002)(107886003)(4326008)(70206006)(8676002)(70586007)(6916009)(478600001)(54906003)(5660300002)(2616005)(41300700001)(26005)(4744005)(36756003)(40460700003)(1076003)(186003)(2906002)(336012)(426003)(47076005)(82310400005)(8936002)(36860700001)(356005)(82740400003)(86362001)(7636003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 11:13:55.5239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a6d40b-4563-4e56-4c4e-08dabcc35503
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7649
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable Tegra186 timer support which is needed for Tegra186, Tegra194 and
Tegra234 devices.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes since V1:
- Moved enabling timers from Kconfig to defconfig

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 04dd0c58d65f..60a678c76125 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1010,6 +1010,7 @@ CONFIG_RTC_DRV_SNVS=m
 CONFIG_RTC_DRV_IMX_SC=m
 CONFIG_RTC_DRV_MT6397=m
 CONFIG_RTC_DRV_XGENE=y
+CONFIG_TEGRA186_TIMER=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_BCM2835=y
 CONFIG_DMA_SUN6I=m
-- 
2.25.1

