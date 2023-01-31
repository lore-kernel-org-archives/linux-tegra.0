Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B809C636CD
	for <linux-tegra@archiver.kernel.org>; Tue, 31 Jan 2023 17:59:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbjAaR7S (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 31 Jan 2023 12:59:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231550AbjAaR7P (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 31 Jan 2023 12:59:15 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D577F29E38;
        Tue, 31 Jan 2023 09:59:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ezk5gBgwWUHyuK398fypdg2X5gfJUILBDTOoxc3uzZUr8A/v1Pg5yZ/7Ycq1a1NXN16TF1EAOHUe1BJCjz1+0qgsqar9qPiMdR1CphAaIKXTJlI2NyFTkVMHmMc8h2ORFzfi55b0ZfSFOjSgTXd6Hg0qNKyUjXFrcqAR8iQhBbxWYZMWlTcJsBYoTOB0ybrEoOHkZBHUnI6s9Vr3QEiF+1+mzWoQDrLxvzd1QvhWQSQF++1OW9/MYe0Bz4t9oApUm6ARySniAtZw/alY9XjXUDMeMxFFsH9E3/b+g/KyHzJUVMVL2GUlrcnHBngTK9t+QPvrp+O990Tsp+dsqCQ2Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxVFJeA3+kof27jWNbbcdoKwIxcQNFUAoG85A6XujoU=;
 b=ZUo6ppZukbQPGXphlpLSZT+HwYS3osYR0KVPfJHi03TUyW5FFwRwllwHHSw+eCpS7ckaDqtGpL7s0pJaKgTOabXRth+SnRXFcYXL9THFMsZ0Qc1OqM8zOgQ5kT3Dgy5mg8cBsHN4uIGshJoBIwJ951hMOiCJt0259ePjaEdDptA5QLgPtC4kJTPuh7wHSMXYXGhCgw1Gv940r3GtRB1Nc+re6uHHD/X0Qx2bOmUU2VroESwf3oI3u2Etqjx7ftSwnm+VOlhqMCCAfuC+0TkHKLFLAP48xAkEYnQN10z07t8BS7AT81Nfr1XrFVdWK8OcZqaVk2aE7bmsRbU1CPHifA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxVFJeA3+kof27jWNbbcdoKwIxcQNFUAoG85A6XujoU=;
 b=kb6mVlkg+Wf3Bmmfw6WN5aZnhp6ko8Uv5qksej04q56mvFCLWDZxhZNNgeh/6COsxAiVP39k2hqNNFqnuzjQRN/7s65hsln29KRotmrNaQMajvJpm97eudXt+vHXzZ1zQSDWciZtBb6BCwTztDljGEZn2McrOW+GxW9LMgAaIrKzsEfoEfE/wMKadu2c2MPw3euj5ALykj+3bD0TqkOMkfjA5aPBpC9syo0XusfQIIHe+dKcP5COvHm00EGfvNFlYwv7NNmNr7jeHmrEjG+9ZoIe2KLg+6fDM9gxFRFCImnXgCuqu5xILVWZhRTyYIOmc4eMlt0GFdr+NNH7FJt7Ow==
Received: from BN0PR08CA0030.namprd08.prod.outlook.com (2603:10b6:408:142::9)
 by DS0PR12MB8575.namprd12.prod.outlook.com (2603:10b6:8:164::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 17:59:11 +0000
Received: from BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:142:cafe::c2) by BN0PR08CA0030.outlook.office365.com
 (2603:10b6:408:142::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36 via Frontend
 Transport; Tue, 31 Jan 2023 17:59:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN8NAM11FT086.mail.protection.outlook.com (10.13.176.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.22 via Frontend Transport; Tue, 31 Jan 2023 17:59:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 31 Jan
 2023 09:58:54 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 31 Jan
 2023 09:58:54 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Tue, 31 Jan 2023 09:58:52 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V10 2/6] i2c: nvidia-gpu: Add ACPI property to align with device-tree
Date:   Tue, 31 Jan 2023 17:57:44 +0000
Message-ID: <20230131175748.256423-3-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131175748.256423-1-jonathanh@nvidia.com>
References: <20230131175748.256423-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT086:EE_|DS0PR12MB8575:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d6d0504-45fb-4466-2b6b-08db03b4db29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: prW7VxaP72CpYrGQiF1dI044UGQKYlPUY8G7xba/q28CdGwLIEvgYTeRTNbaPXv3sgMgqO/p+nKM9V4WNpu8ApaAOOvttmjjOAOrJsZsvD4eYgJD+bwf96aSsbssgM6loqe+NtjOlgND6BUy5x5jW3PuUcSfG8BMmI98KB2FiRX2MaEoXYfYt8sbH9wzVe+2fq5UoAo534GFAqzyeHyCnOTU3VvIap6kt/uJQH5oEJAZinQ0+qjBmxAGoS7Q/nUsHlHjpWnZB5kY+J0KlyGrIVRWM9dWrEow9NxRAyZ/fIn4aWFkhm34a41KJ/2WeZ/fhJAAK6tqHwPM/Ootrflqc0VTkIbnoHArBEIv9p/mG+eOCcea+gG5YjDCtdx++XMUA4ZZ39o+vNnLwHWnYPbkhGdyyCCU+372Pk6nuuJeCGBpQPoF7eJ6z4TWXbvbXnTy5i2ZAJF91XN3f0p5DYBIE9fekDfyIh7Z1bQI7qAOpm3Vuw8ScrY2cnSvtqQtToOMY9iwmsRLPjCWKV/ULRV9Ek7B+LwTFIgMTjP2zwwTpIwPQAD9VC8iMyMxBlA2McM8wbxoA33cyzJI+97A7vDdIt0aeVo8phwCWrZDsvnt+ZsoGqyUWRI8O56L82kwGOyn2Sy6i8chx1e2rf3uuB6xhVHKITxF1pX4jUZlPbS5LtkwVlMbB1iV+GXxSD+EqYFxfWv/eHh66NFKQeY9XVbHQA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199018)(46966006)(36840700001)(40470700004)(8936002)(41300700001)(107886003)(426003)(47076005)(40480700001)(36860700001)(5660300002)(7636003)(86362001)(2616005)(40460700003)(356005)(70206006)(4326008)(8676002)(36756003)(7696005)(478600001)(110136005)(54906003)(70586007)(316002)(82740400003)(336012)(6666004)(186003)(1076003)(26005)(82310400005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 17:59:10.6931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d6d0504-45fb-4466-2b6b-08db03b4db29
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8575
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
V8 -> V10: no changes
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
2.34.1

