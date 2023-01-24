Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B34C25B50
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Jan 2023 11:43:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234266AbjAXLnz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Jan 2023 06:43:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234273AbjAXLny (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Jan 2023 06:43:54 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 539603F2A6;
        Tue, 24 Jan 2023 03:43:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qrt3CKRtu2XvVePGyhzVBCivA5KDwXP0H9OQBy1Kc9UButQwlRKbYSKgr4XC6Q1hvSrxPcvYM4GhMyP+owWxCucCYyt8Ii7XS4mVq4QE3ThiIe6JEvb1wui1Q+4+9KPu4Q8ChdFAR4tNYwog3nB2EJwk1LWpX4NKAKtidRYnscZnea00sToZPH++2pUwjH2my2IePoM2L8u0l9sai0SYnv6ohyks2ezQNArpPh5ICEiLqWp6mGYd599F2jIU+CxwN9IR8YafEveKWd0G5t/ve61fMufizc1UJMToH+NslgRzVbeHvit3s6NUgJq2D6D1bAjfwPlsuf0OezpQoEZX1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/fmBgnAx2qcJTwQXxImfEG0FS8wduULOdPqIxExs3I=;
 b=CkmssC6R1H5O1+aMwuVNjCUgDalgpQHBZQid+n6X0Qd3kB5n2I9F/BAvAh9D2XmmdnPop6PmVsHHsu9hWR0kGzq9KI+sFJlxdSZvgWMlW1PYPbrSuZFe21xA3U4fKsFqgKEAzmwVjAgCgoHwzSrOSQhJ356ZyOMSHzm5tlNBHeAJQ5D26/NZJ7wpuRuA/duRuGjSk1ze/NSIYiWW0TqCwexaX70tvo8tGzFaISqN/k3EdxOtNhJltHe/5FQArWYIjZKBDP4bmUBnBqBOp7t02LFUTHVW4xkJVVE4OANE9sQFrxOYOgcfYySKu+OYqxsEdtyhYVBDGVaJqHpWN/EgCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/fmBgnAx2qcJTwQXxImfEG0FS8wduULOdPqIxExs3I=;
 b=oZRw5KcDR1dIYEVQJLbeJB8f79P8lemZOXST8DIEvOX5lIWwMOHkBznpBRolonH9cbBVAHma31RxaloLYnufrp1tiekxRJU6TeGsiuIx0AQiCFvz3J/t1pDdmGi/mabxbBub6x93yxOQ0d2In9rtotc2cRZydU6vTTItxfXIMNxb1bQUAZdD1LWyzPIMt73TVdwsKi4NGd66iWMR+Yo6qtyQ3HBpa0cDr5hnjIUjC5XJCMN+e73wUpZL1iH8TaTjFEtgrwRWcvOu4U6L6u8yzT+3gxSLuf31gOMbfLX+4spUoTj9G8sH7os4dP2DaxC4MyzoQ4dIpz+oeDbe2Se78Q==
Received: from DS7PR03CA0179.namprd03.prod.outlook.com (2603:10b6:5:3b2::34)
 by SA1PR12MB6679.namprd12.prod.outlook.com (2603:10b6:806:252::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 11:43:48 +0000
Received: from DM6NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::78) by DS7PR03CA0179.outlook.office365.com
 (2603:10b6:5:3b2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Tue, 24 Jan 2023 11:43:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT073.mail.protection.outlook.com (10.13.173.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.17 via Frontend Transport; Tue, 24 Jan 2023 11:43:48 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 24 Jan
 2023 03:43:34 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 24 Jan
 2023 03:43:33 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Tue, 24 Jan 2023 03:43:32 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V7 4/6] i2c: nvidia-gpu: Remove ccgx,firmware-build property
Date:   Tue, 24 Jan 2023 11:43:16 +0000
Message-ID: <20230124114318.18345-5-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230124114318.18345-1-jonathanh@nvidia.com>
References: <20230124114318.18345-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT073:EE_|SA1PR12MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: 157494b4-f0be-4b38-b2dd-08dafe0041cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8QRRDpvglFRPgCBsejeAEUvsCkQdFyN/4r9NVv/o8wc3wnZ7Dd7OD5kUNhsG/8M1EQboL7fxSXS59ohmqVyq+bcpDH34DhfL5wqTaR7VT0BQnf+933v461Li7IrhpRVBkuzgseoEepgfGCsyzhR/1JQ0P+zm15CpxlJxibxjYOU2XYaW/UFy/l4hj6zcTp3/ghvHFcOheH4OT2gcEtmjj1rxOBzYwqgijcb4T2xTHv07br1RZ44VXWCBxhXxaVyv3VijxZySC6eAoKr7cU7Pdx5DHnZuise6bB+DidARIjX52DbEDCVoPqPbs2UuEUqDlBturF7BZyRjyC0cuoWzYoF8oaxIgbvoLjjBy+kMb/Q7Kv8k30hakXRuHmxEaqa1mdJV3jhHP9xucoFkqt483IDoNY41ePDR2Um/cMn9ZE2cjcholk7yvA3UZ3W5dgNgGmA3e47PbMt4P0M0nMV2B+VjZDe8I8LE3XOKlgBbC/qzhIpZZkgrOJegAPA6reaEZzF9tL+glXKzKZTN/gP8wOjlDoXHjD/LcgzDVtB0LGuo23JsDUIeKJoCIJVpLPzcO4wH3I3MzOYsxPEP/RGAbhZ758JixOpicgs4MF4LK44T/k98IlI3YF5qfdbLPeql5KyKpmsQ7/ffNFB0vlV86JMezlh/YbJbBWZLrWhH1AzV4Oe8+cj5exqqg+iQxrKmXgLL8tgycXcz6vBWA04RxQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(36756003)(41300700001)(86362001)(356005)(7636003)(82740400003)(8936002)(5660300002)(4326008)(82310400005)(2906002)(36860700001)(83380400001)(478600001)(110136005)(7696005)(26005)(186003)(8676002)(40460700003)(316002)(40480700001)(70206006)(70586007)(54906003)(2616005)(1076003)(107886003)(6666004)(336012)(426003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 11:43:48.2395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 157494b4-f0be-4b38-b2dd-08dafe0041cd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6679
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

