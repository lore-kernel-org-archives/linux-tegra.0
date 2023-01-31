Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48625C636D7
	for <linux-tegra@archiver.kernel.org>; Tue, 31 Jan 2023 17:59:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbjAaR7N (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 31 Jan 2023 12:59:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230472AbjAaR7J (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 31 Jan 2023 12:59:09 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5086E22A2B;
        Tue, 31 Jan 2023 09:59:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dv752cQQt4HnPDOOWBpsjpuAWpG4SGZfN8xUM8jk0Z9MZk2kGibei0UoruqYlqSMG9abjr7CiCaLAz93bhOGU8iTpZf2Dj58aTS7mnQXtiqk58370ttJmLFb3XNszyXB/sFx9Sc002tMuZkVm9S4UXIuubAtcv98wDWUiKbotJm2YyP7DYOEdjqx8i08Zt06oXnhuYDfCibRi0xmeLOn0SWc76BmpRgS7BC2/ZNR3i7I7cfdHTwjrojtMsCK9VeXHwPsTLLCjlJkX1qybPZz/QV/zXObrScb+NDKuHYHYnW/zh/egH3JtvaVpbGoEdbjUK/I6JhU0xh9HW8opBeojA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bEbMfkocNtah/XymelwM/Ra97UskU86AVK6OObPcHk=;
 b=Ct8LPTQApXiRKXC0y1Y2q3sZ9MfxERTyRuwh0241veZQeuFHRgViLFhbQG8W3XKzknarZTfoV3JUO9chGmi8Os1PHsiMP5L/1n4i7I1kiNtyif+Geg8rcpgSODxFZ+aD1EN918iTiA9h5sk7kvvKKCZtOSriDkpL+eILAtPqZo8KIC6H6c6P18LRuE4Wz9OS1gzAgcHOxo0gdtgK0N4OF82rIvJS78xOpVo/0UsUr6gVUh9ZEcpZndNCpPQR6WIJjdBxBmhsReMpkjBPaWZSvrl2o9p55zxOZjNcHZMLkyrjIntrdgU4YK9BWUP38i9gx6rN6u7BQuwdHtd3GA+rIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bEbMfkocNtah/XymelwM/Ra97UskU86AVK6OObPcHk=;
 b=BT74XDC0USBYjjuQitsc5O4mw8xJaXYrIpv5biiNWlpx8YHJdQJG3ubYbcnClj2GmbWeeAEc++57mHg01u3ka3oDNAbWwZIxwF0BOJos2z4uc4rJwBpOlDCtf1U82vwJePAaoGAz8kSfW+8f6AEOrGAFsquy93zZYUi18kj35hn9JAt0nk/jqJFF+kBuGDhW6wOulOr38Gl78X7n/0YMOtgkL78DnTG6oSN6r3KLhs9gzKq9dmruL+zX1kcFd3aaLMASGAR5sLHC24IcpuhFNGGfYYeW454OFjahoIFfW6cROrtoWLaMwa7sgIAgBTskBmjxuxciDV6aZ/uKO/9xBA==
Received: from MW4PR03CA0190.namprd03.prod.outlook.com (2603:10b6:303:b8::15)
 by DS0PR12MB7778.namprd12.prod.outlook.com (2603:10b6:8:151::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 17:59:06 +0000
Received: from CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::8) by MW4PR03CA0190.outlook.office365.com
 (2603:10b6:303:b8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36 via Frontend
 Transport; Tue, 31 Jan 2023 17:59:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT042.mail.protection.outlook.com (10.13.174.250) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.23 via Frontend Transport; Tue, 31 Jan 2023 17:59:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 31 Jan
 2023 09:59:00 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 31 Jan
 2023 09:58:59 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Tue, 31 Jan 2023 09:58:57 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V10 4/6] i2c: nvidia-gpu: Remove ccgx,firmware-build property
Date:   Tue, 31 Jan 2023 17:57:46 +0000
Message-ID: <20230131175748.256423-5-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131175748.256423-1-jonathanh@nvidia.com>
References: <20230131175748.256423-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT042:EE_|DS0PR12MB7778:EE_
X-MS-Office365-Filtering-Correlation-Id: 02dcd983-14e7-4b6e-6cf9-08db03b4d87d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4A/rM+qWDW3lUEmGIf1kzIDNJXWsDMK9NOljKSx+XLNsJM4Syjs5eBTcECgsV+fbMYYqEgHYusVOsXdP9xQjTyFjvjfmLATL5SVjxzQnPaWRfULG3Miu1VdhSuhJcOeVf9qrHcIBdG1ZWn52mD8gxt5XhlWnaqg2L4VhAI0Js+v45vj/vxRwuXLoMDA9icRcDsisTCcJsVJq4dxEHhNyHzWtjmQTwcJ8FMIWc971GZHro+6WMw/cZ4IrAVbjc8PK37dum/a/cuEceC5qB86IT5M4Vqu8B6oafyE5uenm5oR5dMQIDB48gFXl7yPZVtGnk9OdDQiH//1dfIZgSgXw8DGeL59Z80KmTTZ+GfBRYfbgp69sG553IxFlEIEmKvZxCRc3SMTtfN18DDreNMH32C1SPBeVgmnyrL9ClUvGwsp8uYJNEr7Wk7JY5jww57sE1QeNo5Zt75LHSO9nn0hTg6Y4yl0kjpRBoQkiu5Xv+JNQRFv7XBIIRwwgoqC4/6CP5ljZm2+vnwcVIKsO4FLODBP/YBpvnmmbzNOxLxzcnT4hn4fx4qkL8ojPDWEWNcEeqyojiZEa9SswyymQ5NJXU72VXYos2SfIViulkpQEoWutKDlmy+iGk0ngHm3Sfl+uhg8rdrNdkWbKMAlblD2YtJGeAa5qrcfkFsPT/6dmrnxezUZd+A6RVlozN9R0pxQxMIg6t+nk/TUcjYTCHyQicA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(4326008)(186003)(82310400005)(26005)(1076003)(107886003)(36756003)(316002)(7696005)(5660300002)(41300700001)(70206006)(70586007)(54906003)(110136005)(8936002)(6666004)(356005)(86362001)(40460700003)(36860700001)(336012)(426003)(83380400001)(40480700001)(2616005)(2906002)(8676002)(478600001)(7636003)(82740400003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 17:59:06.3214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02dcd983-14e7-4b6e-6cf9-08db03b4d87d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7778
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
V6 -> V10: no changes
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
2.34.1

