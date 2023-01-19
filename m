Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D25FC00A5A
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Jan 2023 12:17:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbjASMR0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Jan 2023 07:17:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231206AbjASMRR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 07:17:17 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81DF474E8B;
        Thu, 19 Jan 2023 04:17:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OH2jM34FEcElBAmzmTF5NYxqSDdP6U/ngDWESneG+Q67lVOcBe68uLI+zAbor+JylyRvvvsL+jTpqKhwRT8XKQjmTdFFamMyZRUs/NnPff4PQQX7HR7LKBb/BXdQLg9FgC/xnKuiKmMDE2nF1bHIsnHYU9gJ+1Wf1kTFfLr5QlCoS26DnVQ7Rbpd1XHnqFSByeWxZlqsZoUr4YR3/an/9tU8uKc47ZMkvLG1XpPQCgn4DDESbvx9GCVxHQAj9ZaWtZsGQ3csJMZBHUM/Q7ywY7S+hGD1oXLcNZdbLhlzblcp+r6MZa9Y6V0SmzXEkMHoB+s1FNFvDb8E4FrC8B4ruA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEv2r1i6JAJEeRYonB3zHCrPHMXHuhzHZIk/CuIH76M=;
 b=I8u+QQN1UBNECVaSyx89zI7Q0nLPoGHeAwNYaf0YiuwexX0oKh9Nm4rsGTXHmIC90CpxHix1f5MKIT7HCriS0aRcoms1O0oB5I5vhJLuAH2kjFjlgihcQZAIQTSNdHWSIgNP5dJhW3+oCRd3E8CWNWWwC8UqEo6sunwPTxF1YD2amnkquNNI1ZWQ0wf7yTA1EvmXO58vowENmkks/zDksggohJ9fR+jR3bTVBG56ELRsl19BhyhrY8mz/vlnF1zlnXRPjXmFi74HTenyU387otkCcYm+1mzD130Rvo8RD4Bvk08K91Q91630behnX311Kv7JxnGQ7Jzv2IKRsPDM2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEv2r1i6JAJEeRYonB3zHCrPHMXHuhzHZIk/CuIH76M=;
 b=c3TUyrh/B3TJUfl2xsfWq6l5DpnuGDJMp3vfJnOIy5kpmJNL2W3cl+B/fsUF1UngyMHIpU06KYbrnJrZrqW+iLi7HDx38xaSVrmf+oXUrZ6SLgJJsokBUiIUvWqWELGS5L46ECYrjqSxhebnC+ReWKPezmu5OhIKk5yQdGBmT4wyBBK5/glVJc1OhyRwimApb5RDruiRAFpSJxvEb1IWAaTj2EJB22sl7jrJxEdz4dI7bytuCsPudUhq80fBy4mQI3fH6SZBQj+bvMUv4zizg2NUhTR0u8eo0FqWWD6oE5iBWYgvhdOB2tv7fk84ZjRp5rJ2ZAamvD+otRZaxE6z3Q==
Received: from MW4PR03CA0306.namprd03.prod.outlook.com (2603:10b6:303:dd::11)
 by SA1PR12MB7037.namprd12.prod.outlook.com (2603:10b6:806:24c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 19 Jan
 2023 12:17:09 +0000
Received: from CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::fb) by MW4PR03CA0306.outlook.office365.com
 (2603:10b6:303:dd::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25 via Frontend
 Transport; Thu, 19 Jan 2023 12:17:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1NAM11FT063.mail.protection.outlook.com (10.13.175.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Thu, 19 Jan 2023 12:17:08 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 04:16:59 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 19 Jan 2023 04:16:59 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Thu, 19 Jan 2023 04:16:57 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V6 2/6] i2c: nvidia-gpu: Add ACPI property to align with device-tree
Date:   Thu, 19 Jan 2023 12:16:35 +0000
Message-ID: <20230119121639.226729-3-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230119121639.226729-1-jonathanh@nvidia.com>
References: <20230119121639.226729-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT063:EE_|SA1PR12MB7037:EE_
X-MS-Office365-Filtering-Correlation-Id: d88fc1b5-42e7-439a-5de1-08dafa17163e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l/DMBtdcnwB06st/gj5pXD1V10G6HYrT3CF70+dQh3lcADs3ZNB7jBau4l99efGMRtNsR3RJmR2zlp7wMu1R7WDUZMhXaJ/da/C/+JP9Och5TbTI8bDQ2LUSNYwz52JURWlz34xWiqXfZ6Fomvh0Az+i2FD/ULr5/KubZos3IMfrrM6jv2CXP0SGu0pVkwRYAuUk0yRUooSBM1GI0ZoKNF7ITip6iUGyv+XxQbei8QuC+Ka4F4Kh9zain5FEMsP2KniaHYBY6Ih6jpXMmwD0HNvEiUcETsBfGV+yTFhrnQqUIaQw+vbNXUPgFnQ/IOvnx52QHOMAlJf2IugW5Xh3TJj/0MScuSi2hSRZPADSQSQKToJWdmU6d1FD/4mE4df4LNFu6fyKEX8jXVE+XVZopuDRHTo3gGWSggn4KCANPNzHFLaF1yc8qwEqwUvGRCe9TSOcyaIrjwKK1qFNr4bZ2sNVcADsTRIgOS6SYDYSmdx4SI7/9n2IaS1Q97lJYCdow+/szGUKl96rO7F3usGgi3updoed04DrGof/RlSl/E+IEHUBpVASqN1qslfhcpU86xpMYDfJX2LIhRlvIrWx/UHU/O8ZF99zGPHNjIDo7pOS2qKzrc5m7+psV8DLpuhi7vhH/WgT8jdsrdyBoi1FEtH+2xgxuiAEudONhflmoJzOO1yemPxTaGpxGU4x0WhnusrPmHGnv3dVs+oD3gjVMg==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199015)(40470700004)(46966006)(36840700001)(40480700001)(47076005)(40460700003)(36756003)(426003)(8676002)(41300700001)(6666004)(4326008)(70586007)(70206006)(26005)(8936002)(478600001)(186003)(107886003)(5660300002)(110136005)(7696005)(336012)(316002)(54906003)(2616005)(82310400005)(86362001)(1076003)(82740400003)(2906002)(36860700001)(356005)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 12:17:08.9786
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d88fc1b5-42e7-439a-5de1-08dafa17163e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7037
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

