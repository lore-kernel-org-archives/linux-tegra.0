Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E0FAC61DA0
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Jan 2023 20:43:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235818AbjAYUnE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Jan 2023 15:43:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235121AbjAYUnC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Jan 2023 15:43:02 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03FBF16301;
        Wed, 25 Jan 2023 12:42:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XkKvomtZCVah8wJqR6hWPBSppM1LN2lZXFAOWNLZSh075SIJOVPY5mMAIc7q5F66krcalb/OTUYAC0JR5qzKel8d/VCkRAj86yLZns16hNX9ADFmuM7ki99gelVWgxy6Dx867k3lomNETmKDZOZ9xjvThMA8/kbDntEuQKyDIZjMkGjkJudCodG+XlY9spZmH+jHYg4aXgRJkSFCZvc76CmcjnS4QlbNfeOBD8FgPqoghgO0NVnIWinwAbVn3u/KUxYCm5WPYmrVbywmlhjTNTttiZPy8OX3BaObo4B8T9y+19AY3t7ZkYKwZQ/U251qnA+Ey7x0NJ75nJlR3E4eZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOoegvfSAEm+BHpoumBrXrXQNBEpfidyw3a77GuuvhY=;
 b=kj9x+Ckfw9lyPjFzuNWqCxbLpf18sB0s5f1HKNkfUC6UKIK8VBD1HVEvYHD/7NQ7AV5m+4OFJC9jWoLjGdHQJI5E2UQTSabk2AZyMYXL7NxJ34KW0AlEXeykqv4m4G0He0s0fC+XjTrdL9bIgnAHuDMjRzz3Fy6Kdb8Uiwqw/XDZ1+ELi4jeEK/RTJovz2MWl8ZkH+A060YzQKEPyHI9RyDexWC3J4uDevDPTAtWR8c9YZJOtHLQA2Zab7wWJe2wSG9vnDsnN+kyStX2eS4Xn8cKrmPuECFk+4RHFuHdEa0Jszp2C3uTlra2UgPJqJEUU7PSIOHoT1lZfA1cKwzAMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOoegvfSAEm+BHpoumBrXrXQNBEpfidyw3a77GuuvhY=;
 b=fJuosISU4ns2oT5Qb5MF0+DifNlYhswD1GfW/1hTR6klIL7fRRNdWEZ2dNW+wq8o7/jqp++7l9MZ6kQueSdc5rI3uz193xp/K0Zf4KHi2v5m5g2CQoibl8fJqrJHZU908DgT8OAGYwsypR0lbf4v5ECSVsd3F3ESX8Y6zzfXDR7uFP1CuNN5dsiV5La6oRa8A2hekkdoz7qsJHfaqvx4SsvmbNKS4+VrEI6EIltLlWbnxF5Q1/pU0kdBIGMqlVo8e/nzTIZUHN8eEwzJzg+A6x7sOMt3I9UbHOx2Hs5DBwft85lNkR1R1W30DvtEeSTXUZF7X18FEdJBkvIAeJMH8Q==
Received: from BL1P221CA0016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::29)
 by DM4PR12MB6158.namprd12.prod.outlook.com (2603:10b6:8:a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 20:42:48 +0000
Received: from BL02EPF0000EE3F.namprd05.prod.outlook.com
 (2603:10b6:208:2c5:cafe::27) by BL1P221CA0016.outlook.office365.com
 (2603:10b6:208:2c5::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 20:42:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0000EE3F.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.12 via Frontend Transport; Wed, 25 Jan 2023 20:42:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 25 Jan
 2023 12:42:29 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 25 Jan
 2023 12:42:29 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Wed, 25 Jan 2023 12:42:26 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V8 2/6] i2c: nvidia-gpu: Add ACPI property to align with device-tree
Date:   Wed, 25 Jan 2023 20:42:07 +0000
Message-ID: <20230125204211.63680-3-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125204211.63680-1-jonathanh@nvidia.com>
References: <20230125204211.63680-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3F:EE_|DM4PR12MB6158:EE_
X-MS-Office365-Filtering-Correlation-Id: 9659d911-432a-44a8-77bc-08daff14b779
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6IgbHuQvt/O6HamWbwFrxeTbOmTpEIAKaq9w+yCze4toYyRItehUPzGlTeRYv6yel/KPHtYXqARWz9AEEHyJ7Mr4cbN7BxlZtUrHG1WDrqctNouA2WdWvnYugl3DJ0BVeM39gaNbZ2pJvOiORtClofC3pgPSXcCtzhEqyzDAUL2w+Kq0uQBEWzXUkJn65Uy/mY2NBl8hojlzR9wcKcZEFOUilGcxGiR3mApPZk7CS5NdVNJtknzbU8PfJ6mRxd6YFXFNW7H/2lMSsNANI5rmnHabPEUDjCZZq/Kg6+ffIFoUk7t+dtJXhyjPJGBKYzCkJMVHY5JcZEfijWSnRkamh7wiA4AH6KTRpN4CzFaXRXZqWc+bJFEiv+jpvIp54nnDQDotPm0r2Qt0cWs9fr/Dj4jRiW11EhjQ7b9lihg69pkgftXf9CRahNaiJtP+A6PEqOlmY4b6zi/MpqOjcNZ6b3rp+FYX04nOqYvJyLOK9Mc5VYfFLgazbkY8CWyhC1uhAtkwnjqt3ZjoD7C6apiebOA8UcdfcYa+wzwZV5FKzCPdJKL9HxhQyxNDHx053CiO/nD1xLQ25zbhqu5xa1zfZ566m2fJOwB0gTn+Hb7e8CoJ+WsWxT0Es6AogQ7eba3WesU4DlzCNgaMIOUZXUVhyb9cY05VDR4p/UehQF2NpBxXDwuFejPaukQNC2PJY5Bn2t0Oi7GDeJB8ZSu1f1Fqpw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199018)(36840700001)(46966006)(40470700004)(70586007)(7636003)(36756003)(40480700001)(82740400003)(40460700003)(82310400005)(36860700001)(8936002)(86362001)(41300700001)(1076003)(26005)(186003)(6666004)(107886003)(5660300002)(316002)(8676002)(336012)(70206006)(2906002)(478600001)(7696005)(110136005)(54906003)(356005)(4326008)(47076005)(426003)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 20:42:46.7091
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9659d911-432a-44a8-77bc-08daff14b779
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6158
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

