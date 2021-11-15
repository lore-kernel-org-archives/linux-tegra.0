Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 915A0C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Nov 2021 11:37:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7396C60D42
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Nov 2021 11:37:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbhKOLkE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 15 Nov 2021 06:40:04 -0500
Received: from mail-dm6nam08on2073.outbound.protection.outlook.com ([40.107.102.73]:21285
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230288AbhKOLj7 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 Nov 2021 06:39:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6aQQ4B7hC6qSsGcpxKcpAKlXRGtqiLGmXwwfXB2KjvttkDKOivQTp8ILJYDWbJAAnn4F1lhY0s2wvLqPMOD2LtcC4pFq9RSwyWbIzhgLvPDAl5tV3H5wTb83JnRd3SeomD8bMr0T20kntQwXADHhawMoR9GJJS1TxoFfzbKXMCVfA0yOBqMQ7M6UR6jg75+SZJKZLnTFmrnAz47bCBulugYhfETGivCK9RK0bwVcDdeOratL6fPjH7SQbv2b07trZD1jaFI9kQ8PH5AN8bdP+vh2Pv56LDWv+GlwODIxhmFNuExpTZVkeSbpozt6NtrYNO9YxoYSE4CZSTCTVG+ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4vTFYd6QSIQnK5LC/9sLqnvD9aLlTuQ+Ax3tdF4uoY=;
 b=Lpl6rvd6LmSPplW1yCXUkW9o+CwhJOaBbpml/E2wxQ2xzIAorQKOjR9nt+PRmemfpjl4JEIe4Te2BK4NcOS/29mGibttHZq9TQS/eaMadrcYkJdRr6I0EifrQeSpit2/Hn7Yqg+QZnc78JWlcOoXok5yTHC3SF7p2MQvv1aCttZAqLpYlQmRf3DX9FFCP9JeAz8uBDU+EGgRa3CrOjBA0JEdX3Hb4EKGTMdlCNiebWqtXbZGql1Rg2WZ/lpNc4pBf4DhRgQ46k6rQdMgSnVX2DjCrkCiN1heGZIcP9nmvGPi5Iz87peEWS31CzgE5vZH/sGMvRDwg9JKnGrLCTlhTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4vTFYd6QSIQnK5LC/9sLqnvD9aLlTuQ+Ax3tdF4uoY=;
 b=Etq+FXa52YLD3FkWEg6NH6BIljOs1++4Fy7lOSFu4rXthnVAlcYm0FAyCOHaT5KLzHVHhlNZlPWl0r1gzNgOOVe8nlH+QdPR9t6z/FckSJIu92T6WIz48K9L9qhdG3PVKkdJQu1Wq91FN2wQdjdExNmAbU61rJSNLW2P+e/cI1WwyfEnAQYI62OX65E7KfKeQH4TDpCXrt6OMOBKWzjYymag/kKzfutEBnTEJaIyh8kCljZ+AYiE3qvtfi2L3fenqPan1Oq+ASAsjeyNcocKd8tCnIg3A5JKPXkKzy48t2twBX8Dr+glzf3BIaIN4jxmysXTrYmbWMnKAnVwJNVRzw==
Received: from DM6PR06CA0022.namprd06.prod.outlook.com (2603:10b6:5:120::35)
 by DM5PR12MB1660.namprd12.prod.outlook.com (2603:10b6:4:9::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26; Mon, 15 Nov 2021 11:37:02 +0000
Received: from DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:120:cafe::58) by DM6PR06CA0022.outlook.office365.com
 (2603:10b6:5:120::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Mon, 15 Nov 2021 11:37:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT049.mail.protection.outlook.com (10.13.172.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4690.15 via Frontend Transport; Mon, 15 Nov 2021 11:37:02 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 15 Nov
 2021 11:37:01 +0000
Received: from moonraker.home (172.20.187.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 15 Nov 2021 11:37:00 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
CC:     <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] mtd: dataflash: Add device-tree SPI IDs
Date:   Mon, 15 Nov 2021 11:36:55 +0000
Message-ID: <20211115113655.237785-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b364fbb-8494-4ae7-9e0d-08d9a82c3e39
X-MS-TrafficTypeDiagnostic: DM5PR12MB1660:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1660F8AAA8A5681E48C8FEA4D9989@DM5PR12MB1660.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rTsZykAPcvfDNUjuwAZ5hac9S26aTAOOMatj/uxJ8DbICMXDbNPigcgFa5M3XAeoFLrpAua4EIPS4snlWz2gcT90hqLmxQ9V2CqKnszJf6nA3Zv3Y3I2eCvUxfBTAXqYIbDQ8S431Wt6dsPHuZm4qCuHOFYL+YtmQT5yt6/OfBPaCSNFqwO3302gN9Wny9zGzEZYjRbHxdI505LhVmfZ6lQh1I+6jxw7hXyetqj/iA1aMV/u1MFEB0+Q2xMCJXZOkPUxcbNSWwIqX1GoN9+qRHf2ia7caOb1yKreD56T9R4flVGOhqAvILVD+iXslGVbWvnTcJDbgZuWePRwFCgu18wqQqSt9VxaNx6pKh26xLl9JB1zRJeLTPXXIoMC1hX5JjfOg1N3URCR4Rze6MdOjLjjR3yCmBZ7ueNYG9Cp+uMekUW+sWXCH0b1Fzpd+pDwlN1ZLpGtPZmllRm1Y85FT9v4eWrabyObruph1yqvSVz4eNl0VHXixarn9SwdWIlBo1SyMBKKPebg/U9N+dJBXKZQDvEqKN/zWe/5zwYRXn6u46l3CsXuO/CZ0sBVaTysYUZEQTSy9MV6ymKBfkwbdsminZscO8srIzPygIEkFU6i1SUQxbusFtqVFU8hAza01c1c17OGE4ZDc8geiSSi+RwpukEQigyc/Um3uoqKfIAc7ReM5wwurWuSq6PrfuYxSy0Gmsucd6L3bph4ITBEyQ==
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(426003)(8676002)(82310400003)(336012)(4326008)(47076005)(36860700001)(6666004)(2906002)(26005)(186003)(86362001)(8936002)(1076003)(36756003)(356005)(70206006)(107886003)(508600001)(5660300002)(2616005)(70586007)(7636003)(36906005)(54906003)(110136005)(83380400001)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 11:37:02.4397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b364fbb-8494-4ae7-9e0d-08d9a82c3e39
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1660
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Commit 5fa6863ba692 ("spi: Check we have a spi_device_id for each DT
compatible") added a test to check that every SPI driver has a
spi_device_id for each DT compatiable string defined by the driver
and warns if the spi_device_id is missing. The spi_device_ids are
missing for the dataflash driver and the following warnings are now
seen.

 WARNING KERN SPI driver mtd_dataflash has no spi_device_id for atmel,at45
 WARNING KERN SPI driver mtd_dataflash has no spi_device_id for atmel,dataflash

Fix this by adding the necessary spi_device_ids.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/mtd/devices/mtd_dataflash.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 9802e265fca8..2b317ed6c103 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -96,6 +96,13 @@ struct dataflash {
 	struct mtd_info		mtd;
 };
 
+static const struct spi_device_id dataflash_dev_ids[] = {
+	{ "at45" },
+	{ "dataflash" },
+	{ },
+};
+MODULE_DEVICE_TABLE(spi, dataflash_dev_ids);
+
 #ifdef CONFIG_OF
 static const struct of_device_id dataflash_dt_ids[] = {
 	{ .compatible = "atmel,at45", },
@@ -927,6 +934,7 @@ static struct spi_driver dataflash_driver = {
 		.name		= "mtd_dataflash",
 		.of_match_table = of_match_ptr(dataflash_dt_ids),
 	},
+	.id_table = dataflash_dev_ids,
 
 	.probe		= dataflash_probe,
 	.remove		= dataflash_remove,
-- 
2.25.1

