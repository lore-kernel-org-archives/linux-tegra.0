Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7ABCC77B73
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Jun 2023 15:36:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233505AbjFFPgf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 6 Jun 2023 11:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237471AbjFFPgf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 6 Jun 2023 11:36:35 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3247EA6
        for <linux-tegra@vger.kernel.org>; Tue,  6 Jun 2023 08:36:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPZZP33JaUjIcNqN4mC0ndR6Q7JLG9CUeiWD0kuC6Fdup33PxARe6WJID6A1ak45cBlBAvHFlU7e1DGbnrnVuVVIOUriYyWlFnNYTBkjsMIbBhRzOkdFA/aX+Q6T8F1K3FB2KCGY59JZ1PhtR8aVFrfuVKv2MPSpwCXJkFUsuSeikeRjv+fV/CrWk46tufB/pyfx9GCZ8cHID4VlMrfpV5xPI51KmqANoogwRX8S3iYTXlcpyzHgC0eKYfVNU7uHfkz0icpj6zE3PfZTPvNTjwNEwzB06jdlVVMv5Ey8NeaD11XWn+avif9L8i3wdX70zGaBxux68QbLjXTxRlrEvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDnaR1nHQk+M0VbfqAscM4U1ONxGQoMOzqER2n1Ojng=;
 b=My+WJ7xXIWAeNHsSAJhoQ9QqHfwP94StrGzdEccf12G1sE7h5TS9Xsa5QF64Y43kWSInWe5wL3PCCWfRTFbALHkfubE6l6uvXKfXpQ+79ZPeFhJpBsSiNNbyEiPSYSZuW/TSB0bsi5CZjeCKPDw9ICZqX+UbS+3418lFllkdwGaCXcCUitpUgoyH5qqOxgbcpH/BVEgFaBiUs1530NjMRnyU+LAS0+trXoEu+8l67UnjgOWWN+R6mfYsJlVa5Icx6aLnLRZgm5YW4F0zYCgTP08TyGHLbcU+rWGTBKGXQXP45tb/QdjjORnpdqooZ+dlsA5dUON6xBoj9TtFbjxoSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDnaR1nHQk+M0VbfqAscM4U1ONxGQoMOzqER2n1Ojng=;
 b=mqMDyZntf0HICqLP0AqTfCR3UbF+wCpkWNitqpUXecCaDCykv8BTtq19RsV5IMYgFkKfAp+U6IrXdxkBm/XiX/G4SHAUOOp6kUuq2NFVR0krWCyO/OsoDxjD0Ge3j0JGmTu70wy/H6UL6FiEA55RGnBDKvg9DXxAHELZH3JZZsGgcp6aD/2HrQTAyqAWSuhYu+Hs78usaC9IRNB2d6xcCOU52KHu8q+6UuGMffKktUlvzgxCk4km+msXyIS9xle4eULNT4mvYWidAAt9G0KkCzwCqQVH6us2S5FTdckmIO3lUMnLS8OoOe5XgoeHmC7gWcB4sHs08mjjnLizUcRdfw==
Received: from MW4PR03CA0205.namprd03.prod.outlook.com (2603:10b6:303:b8::30)
 by PH7PR12MB9076.namprd12.prod.outlook.com (2603:10b6:510:2f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 15:36:28 +0000
Received: from CO1NAM11FT108.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::e7) by MW4PR03CA0205.outlook.office365.com
 (2603:10b6:303:b8::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Tue, 6 Jun 2023 15:36:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT108.mail.protection.outlook.com (10.13.175.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.33 via Frontend Transport; Tue, 6 Jun 2023 15:36:27 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 6 Jun 2023
 08:36:17 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Tue, 6 Jun 2023
 08:36:17 -0700
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Tue, 6 Jun 2023 08:36:15 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        Petlozu Pravareshwar <petlozup@nvidia.com>,
        Bharat Nihalani <bnihalani@nvidia.com>,
        Kartik <kkartik@nvidia.com>, "Jon Hunter" <jonathanh@nvidia.com>
Subject: [PATCH 1/3] soc/tegra: pmc: Use debugfs_initialized()
Date:   Tue, 6 Jun 2023 16:36:06 +0100
Message-ID: <20230606153608.94289-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT108:EE_|PH7PR12MB9076:EE_
X-MS-Office365-Filtering-Correlation-Id: b557043a-1ad3-4376-2c04-08db66a3cb4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OR3CJY2Lkc9G5ZqF6DWA3BZQvjBt9zNXdiaW8J0zJQLFp/FKhZBkpXVVjtpQ2NNnbcBLPCARFfiVH3uiXRsP8tNeX3Ck/ZwdfIwKsYH292l8Zv7gr+dBsaVA6bMa3KtxCJVNChqeAexPlI75Cqix98OCIkRQLyljSEx+CV+UJxfbtMuJHporQUkF5q1hXKaVsHe37RfCOQ+Ut494GfQfyZ0o1rBJOrQ3l5sGKVulBg+v4x5ZnxsnObpwb8UmHrb7af/cingaFEJzlw20DuYIuyVy5S2kWIX2BeMmNnwOx/SOKWncvM/3R/HJ8d/ib7g/5ol43gzOtvluDnEVo7vL3vA1EMj4X+ArQFnLI/Bi5iIL8uxk1Wygs5iecdftpyLmMc5QMX6V4voHZqeQgAASs4IiRMyXyLEj9qYDynoT6zn/6idwjCpRNYJCid74jcCX5OEuOapPErMtpNduFg2av06nyeDOYno2QRDnf5BVfG7lT/yq6bWpuP//GA31SetwcQA551zUYlCIABPYw4U6y2YNc8QWoVN7hVtTY+51Ozei3o4ZwstThxUMrnYVZG71zAn4dREzYgWlHq1pr0MnzIpPr0kxWO6uiD5vSdbi/7GiFNCLbQlq26WarQW1QV5OFMqDAcc7wAL7R0XJ8X0ryOq8RcVpid3uz9ZscPqLGbelOt2xqKhrYQBmsa04tMtFUcwOLJ+pcZXUEM+/7lx12ZRiEA1KJ2o2pDiJwr6tR9c=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199021)(40470700004)(36840700001)(46966006)(54906003)(40460700003)(40480700001)(478600001)(6916009)(8936002)(8676002)(2906002)(36756003)(86362001)(5660300002)(82310400005)(4326008)(316002)(70206006)(70586007)(7636003)(356005)(82740400003)(1076003)(2616005)(41300700001)(107886003)(26005)(47076005)(36860700001)(83380400001)(186003)(7696005)(6666004)(336012)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 15:36:27.8720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b557043a-1ad3-4376-2c04-08db66a3cb4e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT108.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9076
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Bharat Nihalani <bnihalani@nvidia.com>

The kernel command line parameter debugfs=off can be used to dynamically
disable debugfs support at boot time. However, the Tegra PMC driver will
always attempt to register debugfs entries if CONFIG_DEBUG_FS is
enabled. Therefore, if CONFIG_DEBUG_FS is enabled but the user sets
debugfs=off, then probing the PMC driver will fail.

Fix this by using the function debugfs_initialized() to check if debugfs
support is enabled before calling any debugfs functions in the Tegra PMC
driver. Note that if CONFIG_DEBUG_FS is not defined
debugfs_initialized() will return false.

Signed-off-by: Bharat Nihalani <bnihalani@nvidia.com>
Signed-off-by: Kartik <kkartik@nvidia.com>
Co-developed-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 5d17799524c9..12e852a8a609 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3026,7 +3026,7 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 
 	tegra_pmc_reset_sysfs_init(pmc);
 
-	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
+	if (debugfs_initialized()) {
 		err = tegra_powergate_debugfs_init();
 		if (err < 0)
 			goto cleanup_sysfs;
-- 
2.34.1

