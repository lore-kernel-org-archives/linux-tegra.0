Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A09C38142
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Jan 2023 15:11:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234228AbjA0PLb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Jan 2023 10:11:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234239AbjA0PLa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Jan 2023 10:11:30 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 479918418B;
        Fri, 27 Jan 2023 07:11:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKGAvUB3au6JW3d2WplpiWm3Y1anI+KyRgqJYUCd6QHobHBjsbt3/suPNaIH+K5bjFO9bru/A9xE06g25FZyvXVKbeN7/eAWmOE0quIEXeGpEAJOiu1773Q6PME2wA3hupwshsHFF+wL04ZtsdGSAsxihjoygJ76hha5oTNid9ONUIXoHBSpm+PMKJBByTAW0KkhQBtbPmEDH4pV4ZidKbev9r9LpFT1zEMNwDnKFsZPko5eI00pt1dfm4dvaoPpv2mT80/UxGUkZ66vBFi1Qicos6xFXaQAuxn+w8wEsd5+vzT25VWQzde7rgin8R+TZJQailrPhJnT56mzIn/MJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PR4BLWvFQsVnW+PJbV8ccvkMyc+liBlJJMPxzjPTQU8=;
 b=V7YeVJ3LL7OQslmF0tqr1ydmKZO9x6N0+5gU5xYautz4jzNeURaIJydMANVzswONvpgN+jCdrVUmSMaS7f/jqWKhcnpaoBt2ra8ONB31HId7if1PHxxsI5M4V3I9gyy+PvJ9hg6j+5kyMwr741rJqzdHJd+SkxImP+p/8r1qhFE+plVDsU0oEHAN49VOAz/ldLHXE8VBiH34FAYmM+KzOj6pV74BqrbV7q8HXH/ijzGVdHHwFY43BlCY2o/RHUw5TPkZnTEFH9gFWrIfkRzqlG4XXUgQ99u2i8kMNrMGHV268NoRK67athxM74ipWIPp2WhA/98aBIl92q/zOlUUjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PR4BLWvFQsVnW+PJbV8ccvkMyc+liBlJJMPxzjPTQU8=;
 b=XfmbVaUVn9+FaJkSUeqwKvZ1u7+Cnby6imxQKGirXHf0WMEAnlLJEnTNE+qRSQB7Hl356hY77ZyA4kcHkRr0S1oIjP20Q83+yrskiLiclnIKDeqAgeQBgCIIXNuHW/YqBQdleGTLnFkLWJ+dtOp/Ry4h/wE2/rbF8yQwncLZpW034WRL4xNj+WUADyV3+J9LtcHhglTxhqkexBqfm+vvCsAXagouf5WL1jGBavQ+n4zZ3L8xHzJQPY7pIhCl0vJQJvuhGCeh06fcqEMyGC7LmmS7yLeOyV02rWy71ylfF6HKd0DoF7IPo3rAixy5I/sJyOVc3OXJSqQWiBiHhpVToA==
Received: from MW4PR04CA0198.namprd04.prod.outlook.com (2603:10b6:303:86::23)
 by DM4PR12MB5962.namprd12.prod.outlook.com (2603:10b6:8:69::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22; Fri, 27 Jan 2023 15:11:19 +0000
Received: from CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::ef) by MW4PR04CA0198.outlook.office365.com
 (2603:10b6:303:86::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Fri, 27 Jan 2023 15:11:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT029.mail.protection.outlook.com (10.13.174.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22 via Frontend Transport; Fri, 27 Jan 2023 15:11:19 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 27 Jan
 2023 07:11:01 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 27 Jan
 2023 07:11:01 -0800
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Fri, 27 Jan
 2023 07:10:59 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V9 4/6] i2c: nvidia-gpu: Remove ccgx,firmware-build property
Date:   Fri, 27 Jan 2023 15:10:39 +0000
Message-ID: <20230127151041.65751-5-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230127151041.65751-1-jonathanh@nvidia.com>
References: <20230127151041.65751-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT029:EE_|DM4PR12MB5962:EE_
X-MS-Office365-Filtering-Correlation-Id: d1948c6f-fa6e-48ce-edff-08db0078be68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rhXaiOpwr3MSCJSz7VIQuuvFwNa3WA9rqiopzB22uJij3xyIeYZsQqztimH0FRp+FNkThgciemngxApXc6u4P4tvAB44C5Cgrc7E82nRKbrvwWgCpvn3qi+Fc3tQiv/RffuyftYUug0h37bGduJBcCeOfIgN/cvKuEl/cgEW4Esvw9u5CeI2VIiUj/UMoeObrheBigqQx6o6nSaHUg5qkSePKz14jsDlGVaAYODNNO/w6oEipvehRJxCPF/uHUK2hPexoY7x2M9YDIvyUmB7hMXowGUXvoy7vKoOTJqMZ/PsQNsNlm7Hq3pfK03vn/hejtg3pxe7NIVDiGmLM4lMQ6qYAUMdtepmw+0Xz4MoydPLR7nwaItBf0d2w8Rtt6QXK+pDAGKw5sXziDk6ew34BTuatf+rDWYJ9iyYwq8cUdGVgUeo6zsUD6Op9N/H6qmhRl0Wv9MqErhTTebTmMSK9OJ/ParUt1JLSsSH+HLSLq0+98pZUuy2gCHx0+QuVuzGXY9g5QYWPoU/DrRhRX4NlgSDGIrwSP54cQgg5uvhcK+Hq9l6y2G90nhSC6UK0UGsdNNlXryDp+h7CNFuYyZCSWYh/NEmqXwxjxy6Luve/oPYVHh7km9eQ631fgyiIQtG5oLjtBY+rVsAeotAgLjVQIqdr5fU+lmRxAJ84++Jmu4vWEkb4d0bHtCp9iOD/IueT8UyEqAAQGgZeS3r+Zbl/A==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199018)(40470700004)(46966006)(36840700001)(316002)(54906003)(110136005)(82310400005)(83380400001)(426003)(36860700001)(47076005)(40480700001)(356005)(86362001)(82740400003)(7636003)(336012)(36756003)(186003)(26005)(478600001)(107886003)(40460700003)(1076003)(2616005)(2906002)(8936002)(41300700001)(6666004)(70206006)(5660300002)(4326008)(70586007)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 15:11:19.2118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1948c6f-fa6e-48ce-edff-08db0078be68
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5962
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Wayne Chang <waynec@nvidia.com>

Now the Cypress CCG driver has been updated to support the
'firmware-name' property to align with device-tree, remove the
'ccgx,firmware-build' property as this is no longer needed.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V9: no changes
V8: no changes
V7: no changes
V6: no changes
V5: Added this patch from V3

 drivers/i2c/busses/i2c-nvidia-gpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 6d81ea530a83..a8b99e7f6262 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -259,8 +259,7 @@ static const struct pci_device_id gpu_i2c_ids[] = {
 MODULE_DEVICE_TABLE(pci, gpu_i2c_ids);
 
 static const struct property_entry ccgx_props[] = {
-	/* Use FW built for NVIDIA (nv) only */
-	PROPERTY_ENTRY_U16("ccgx,firmware-build", ('n' << 8) | 'v'),
+	/* Use FW built for NVIDIA GPU only */
 	PROPERTY_ENTRY_STRING("firmware-name", "nvidia,gpu"),
 	{ }
 };
-- 
2.25.1

