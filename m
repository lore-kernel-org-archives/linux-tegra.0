Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E1EC54EAA
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Jan 2023 15:11:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234201AbjA0PLQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Jan 2023 10:11:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234193AbjA0PLP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Jan 2023 10:11:15 -0500
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2079.outbound.protection.outlook.com [40.107.101.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D23FD7FA01;
        Fri, 27 Jan 2023 07:11:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7YPNIpuaBZ8lpBTpV2EbEUrsUOTi1Q+UUvXDYUiitE4ey3eY4nGtT7wRTLc/mLQ5zjdpa/6Tw2BSrTJI22uwaSH8w/GmPGeQHcq2a8nvOmAB+TbuQrL7GDEj0fFH0jr6IH+j/CvgMGWaZM3+heQYHlaZuTooAhVJ3BFeD0SqHNhK52E0Uh2I3o7+534hZtmu4M/gqQoZUCxFEQQKPmk6AllVv9EyqI8smhMFpIzSAPl3B3xc2aXqtC8xag7Ed1DWo8P0JUa8UBvXDVvWNuqcl/7zUiV8am6q9Lascbo2+pdil/HKIYO98sw5zU9xJviWMaUdoN1PbHdNIyDaYeEsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VceegR7S7XvPN3B3VWVjRViS+OfxXwJDhEfrM0/wa4=;
 b=VnrOC57Iqk7wiUp/WZSTl3E+dzDO3O8pnObJGLrCC2vy20Vf3q/1EiwGu5/buDtCMTX3HFpamG1x5Fit+FzsIbFt/nwDh+sgmY+jifHm+2/kc4trhiQtENQ433gfnI6KzFLBHWsZh3zGckmKEounG5A9FodwkvESDAeS+U5KL2Xka/FJZLweNZzRsUcez4Uk033yY5CLe4r5/lof/RnbgjhAJX4GeID73eiirNGYCtSaEooj0WKnTitTr29YJ3CYZycyv+8tiDFd8EQyrSsY7xEmpUqIPHKDzsqi/Kma6tZpghZwlh942IC8V4jusrz5rT+59RbNpQu1hoST1JBnDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VceegR7S7XvPN3B3VWVjRViS+OfxXwJDhEfrM0/wa4=;
 b=h3KdygGcwhbbArv7FWTTg5WRVPNLy+VJiZcX7w4sleXCiw5pAjsTTdM1u/pSyavPJR6asB+Kkp7r1sOGB/Yvm4lZzSHD8m5UL0sHBLMG1aZztALbog99SeIiM23po/FFkWMQ9OJOSJ206ylTVoUZjHM2kZ181w6p8ZYqWUcp3CZa7XLJerBpxCPb5kcsHn166rEdUnYyPhjsM74NJDFm6+alHiZW3i2cxw4ezpjLfJof7E5kCgaW1ZFvkm3KK82hqq4H3NvKLhtMmnanISYJ164cs0tDmPRPC0t7DvhZ3mTmxHbV9Q/o/N0zBu4UcmahJ7B6wPA3qsDbNt17V5lqjw==
Received: from MW4PR04CA0155.namprd04.prod.outlook.com (2603:10b6:303:85::10)
 by SJ0PR12MB8091.namprd12.prod.outlook.com (2603:10b6:a03:4d5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 15:11:13 +0000
Received: from CO1NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::70) by MW4PR04CA0155.outlook.office365.com
 (2603:10b6:303:85::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Fri, 27 Jan 2023 15:11:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT079.mail.protection.outlook.com (10.13.175.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22 via Frontend Transport; Fri, 27 Jan 2023 15:11:13 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 27 Jan
 2023 07:10:56 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 27 Jan
 2023 07:10:56 -0800
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Fri, 27 Jan
 2023 07:10:54 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V9 2/6] i2c: nvidia-gpu: Add ACPI property to align with device-tree
Date:   Fri, 27 Jan 2023 15:10:37 +0000
Message-ID: <20230127151041.65751-3-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230127151041.65751-1-jonathanh@nvidia.com>
References: <20230127151041.65751-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT079:EE_|SJ0PR12MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dd9e26c-f3d6-4e58-ac82-08db0078bac2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6hVDjsBpzYgFup4uKeR/XhLgtxDU6+BNF6SVr+exqu2502DGj6LO0bqjZVVJ/7fgeCGDSmlvUylNBKTmGUghNxtUfytaODZ1OKiy3D4quOukqNVgBGBrnTAUq+6gefmXk3rDCjQjULVMg7PGkr7bZ+JFPxfI0I+iEIe52GW7OO83xWSP6SRPb6nVcajdSyhUJCI9zqCOYhOVTHv8GzW58PddcZa7bzYloyP0PKPEBKsACVlt/J0GKw/JqTDWF0u704T8RnzQaS+9YvkbERLUBTD1VgX8xDiBbsDqzAil6jYil33vnHfw9vDxlPC9x9pXf4iznOqYRCdycNZhlBb5RAeVc5hsQd+2P+TfBY+p+gL9SzcjOp97sEujz/1kFLAytWeC79q13c7ceB4HbIaxJZASxC5Wk3AyQQhHimVFsdkl/pPpnWpLgDCx83zyHER3V6I1PISEhGK5vWYnd44R5BZMYe3m9w8t7823grplv8VlGzs/ZgkFtuEc5nxIC6xsf+IsdR/CfOYiAqKj/JmBN4ZlZj21gIpl4k8pz6uMP/xDi8bx8/G/lsI+QiVuKcGr4iikJUobENAhTV6tuDX3eqXHsMZ8aea1PyNg8uFWNOcWLPVPEyXlzXauk6eMIvXEody98Dmn1yQA3otuc7hLWqdKRqcDisZSf9w6RCxgw7neu9Y7SED49ffdyYvSgGgyD3AqOPO6m2pqrswwnXa6mg==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199018)(40470700004)(46966006)(36840700001)(356005)(70206006)(1076003)(316002)(54906003)(41300700001)(8676002)(7636003)(70586007)(36756003)(40460700003)(8936002)(5660300002)(86362001)(4326008)(40480700001)(2906002)(36860700001)(82740400003)(110136005)(26005)(478600001)(186003)(107886003)(426003)(6666004)(47076005)(82310400005)(336012)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 15:11:13.0890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd9e26c-f3d6-4e58-ac82-08db0078bac2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8091
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Wayne Chang <waynec@nvidia.com>

Device-tree uses the 'firmware-name' string property to pass a name of
the firmware build to the Cypress CCGx driver. Add a new ACPI string
property to the NVIDIA GPU I2C driver to align with device-tree so that
we can migrate to using a common property name for both ACPI and
device-tree.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
Co-developed-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
V9: no changes
V8: no changes
V7: Added Heikki's reviewed-by
V6: no changes
V5: Added this patch from V3

 drivers/i2c/busses/i2c-nvidia-gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 12e330cd7635..6d81ea530a83 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -261,6 +261,7 @@ MODULE_DEVICE_TABLE(pci, gpu_i2c_ids);
 static const struct property_entry ccgx_props[] = {
 	/* Use FW built for NVIDIA (nv) only */
 	PROPERTY_ENTRY_U16("ccgx,firmware-build", ('n' << 8) | 'v'),
+	PROPERTY_ENTRY_STRING("firmware-name", "nvidia,gpu"),
 	{ }
 };
 
-- 
2.25.1

