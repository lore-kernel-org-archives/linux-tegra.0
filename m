Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E63C6C46467
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Jan 2023 11:18:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbjASLSP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Jan 2023 06:18:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbjASLSN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 06:18:13 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7F4170C7F;
        Thu, 19 Jan 2023 03:18:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9S+Pkf3FTShJqr+ba3GCzufRUyGM3dwqaTyPNWgKNgc+nmlEHQVASjShzJNsDod9WFhpYKvswyDlUAode5aR9FprdIlZXkcDR626wCPlY2DyLK8IswnQKZTfwaNniM7PDYRtWXhorZbVoOaoOL15FrdUc7T0EA7fiMjq+8zs6J/rnYC7vKx6NEfw/5KfpmCklDx4r40pZFZC9E0gP5mHlSz4lqXK6HHLV9XDBI4rb5kUlUw4ySCDOiI4ZdAdwx35Nu43FV3boxXK5PKB4FHhm4EaJxkhvVfLPLm2QT8lwzQSdU5VGz1vI/xZzbJj4gLcKWjSesxvK9ubBxLK9nMnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2a6K54pBgF9X5YoGg3tCkU2xT1sCW3lIs+Lsc76qqE=;
 b=L1/5tMp9wXGHnBnxErt9LU2IRGli3w3aLUQQZZiHkN44tgL3bTq/0mDyrmR5TVlILZhnUKBGKWgxucuoXbAShyGuOPL22AKMXIPzanGHpQM85YXplSqKVkN0XxOcb1VUQoRyiGTIX2EgwpUJwzDLxatI904VyD4W5QQTPcV1zJ8/466KmEK6LiWbrRp4s9tpnlkNzMPeIK7bFip4G3t3MGVOws5JIkbBrtsEQBt2B6JBJP+wxxXaynXLDrqBtVOtFz6N8StaF564aD2zbrqRClDoMvd4qpI6uMHV5jKK6q7gDpBosgPGQiqi5Sr1Puf6mQWSPz/9chrwP0m8LrYykw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2a6K54pBgF9X5YoGg3tCkU2xT1sCW3lIs+Lsc76qqE=;
 b=GgQJ10scPZ8rKWJnr3B0uAoz/+BfL3M9+o3teJcql6F9pOXFz9il6bcSmFaYYCBsyc9Jq4+/LNQ2PYKvdJkszyllmg5Y4RX+pSs65jAqbgtZWgVjSicWBDC8sb6FqsVZ2TJFFL5ZP7gFtsS3FPizA7aQu23zIFHgvqaIrRiynPNJRqetB/9lBh6740JwbxgIXKsINK48D2ncGSLcb1IOUrZ0RxXcMfPXA57xPrlXZxNhhKtqQG0v9ADYRrRogL+mfyQlGGe2dpTFOfLvKVsbePlJq9rGo4U5QIBfyQFOkiVoi1+K56ek2MBHVRU4riz+Bn18QXfXWrsrDJus/5/pXA==
Received: from DS7PR07CA0011.namprd07.prod.outlook.com (2603:10b6:5:3af::22)
 by BN9PR12MB5081.namprd12.prod.outlook.com (2603:10b6:408:132::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Thu, 19 Jan
 2023 11:18:10 +0000
Received: from DS1PEPF0000E636.namprd02.prod.outlook.com
 (2603:10b6:5:3af:cafe::2c) by DS7PR07CA0011.outlook.office365.com
 (2603:10b6:5:3af::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25 via Frontend
 Transport; Thu, 19 Jan 2023 11:18:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0000E636.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Thu, 19 Jan 2023 11:18:10 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 03:17:57 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 03:17:57 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Thu, 19 Jan 2023 03:17:55 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V5 2/6] i2c: nvidia-gpu: Add ACPI property to align with device-tree
Date:   Thu, 19 Jan 2023 11:17:37 +0000
Message-ID: <20230119111741.33901-3-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230119111741.33901-1-jonathanh@nvidia.com>
References: <20230119111741.33901-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E636:EE_|BN9PR12MB5081:EE_
X-MS-Office365-Filtering-Correlation-Id: 487b34eb-d82f-43cb-0df1-08dafa0ed8fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2b4Vpg6EA5zSm6wSOYknpU5E28FS3PvhRiWgLpQb0VqsQXUEz7AbUL+ZtSKyvvUJJisasJ9G+FLeefVnWIgfd3Cp7z/Psv6/NGXazQs1AI04DPA0RXcgVtxw7ugpqafXN3r26rh5DzXIwJtXjVNB0vOERgB4GXu/HxjPdopsbxA2XGM2rmwox5m5hOGNsx2AzCNCNRM/PWX2lup0EKCoyVZX2fq7GF5CsL+JDq+tp9fnIgDP318UIzI8fh0YBLziiXwMxRPdoOtyAkCZ/PgeLF33Ag/A+bp0HiO5pr5eBu1+o117aHj/7JeFeVrHwsGXqixJ3/veMrrWxHtnMZHhozM73xjnMwQXe0YrZJNgmL04hhP06pwfrXuTeOQ1Ywo6ZjicAvkKJhcB3YweGVZ7uqW/gCsW2ygQ2txIpVFZqGffV3Ck078uXgMLYSzpf13LsCoKcqr3etYPXW9b9qjlnFT/pCCdRas6zKJhLp2eRWeR8YKMDdPt2HklnHvY1fDJv/1K4J1PAEqKTKyB+f5WA/Qm/dKr1ssH/DU1oM4IJ5WM4/F5UKrFxz6xX5kYrUv3wQ9barigMMDNs50Qd9z9XEqcqLC4LQpljQ3HzXkQoPxSm/ZFXZRc4m5jWZ3UAH47qaJ0AMSkTL/l30zdf3coVVyj55TN0M4ByD7+vBYTeDmXsWtWt6mtRL1mua8uoo8Pd4D08SczjyM9db3E9Eq+Jg==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(39860400002)(136003)(451199015)(36840700001)(40470700004)(46966006)(70586007)(70206006)(186003)(26005)(41300700001)(4326008)(8676002)(40460700003)(36756003)(7696005)(6666004)(107886003)(478600001)(36860700001)(316002)(110136005)(40480700001)(54906003)(86362001)(82310400005)(5660300002)(8936002)(82740400003)(2616005)(1076003)(426003)(356005)(47076005)(7636003)(336012)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 11:18:10.1667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 487b34eb-d82f-43cb-0df1-08dafa0ed8fc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E636.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5081
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
---
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

