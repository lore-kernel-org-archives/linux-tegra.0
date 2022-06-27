Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC0FECCA481
	for <linux-tegra@archiver.kernel.org>; Mon, 27 Jun 2022 11:48:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237572AbiF0Ls4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 27 Jun 2022 07:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238456AbiF0Ls3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 27 Jun 2022 07:48:29 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FE63BF4D
        for <linux-tegra@vger.kernel.org>; Mon, 27 Jun 2022 04:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axXmXaxLoOp2NRqaT5z02ejWv2FjNMZ6SWGQXuO8I5P4g222EqcKphGswTA8jTkpOElx0RzzFhfCBKpIEG1/z8YXFhHk2KZIr5tcIXhDdfp2YA+eb6CDjDfO1ka47i48H7IsJjP13/++/EKz+3v70XCEtcvYx2dpkc8IvCuDqvbuDS1CXH99qAyQjmH5y+ouC4LwSH1/LQdNzHIskB6mrWophlU/1LNCxCdUNSl6l+Qg2M3qShnxGlU26z5HQiNr2F1U/SAQu6bxP+z/zoaJCfWVnpadv3Pa2vS2YJFO+ynkBzeaQ9m80ZUO0vglKCb3Y0i934WHIcmHEQSHjzL/zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miR+HB/6vsuLkTRl6JzrUD8Hr+9I9MgK+mkooVkpIUg=;
 b=l1vglg042/YRky9q1jGQHjhmHAmFS9tyzjMsm3jHj1coRrUmA+TTHa+JjVsj1rDoAABMqUuDmDbt4gFTt++SmgAziV5vCxaGNYVE1++jze+nTG/IVv/ajNfahlQCsFfe/mDBc4oqGde+suE2bEfVTZQgx3Vi4wKWY6aqrtrwKYd9ttHUkbzsEGfaq/jYL3LE6RzcdJXcE3vk3p/K2iW4S2t4o5P8QjuVFZ1cLgMkYjPHsH6NNUbntem1mZI4lA7xmCdHuVRS0YetspphOpHEA8qVkSydt7kVw15STPBVdCKU9qD875k/KVfJquI20Oi/s8OmNAOhmlBv0pT/QwpJcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miR+HB/6vsuLkTRl6JzrUD8Hr+9I9MgK+mkooVkpIUg=;
 b=HrogbFS4qw6aH+l2DmZpM0780fRuWuvT1uyc8LKsKBN3Qgch7U0OBuQ/v9zKmL3b3FmP91R+ZSYwfn6p+aViHbzOKWwTBARr/j5q1gRPwzaR1qA8xHU5/nA6XyFtFhPzHFzzrvvNj/u2K5wBp8dDPuhwINivMxPbxIZfkCaYK2769u2NoQAoXvVkk3pkesARv2fzfpZkNIPGLTBLAhXp5DJe6XZSJCmxX5aQJUk+PHjkeJrRBqM2pRAgchkmrxRob4ohgrgRJIvwIR0cCH45ZCIiyrzeVwIGZz3baGe8GbZt29IO8sH7Yw8txry2R+rnYlmF5iPvfDyHxFkXLhZC4Q==
Received: from MWHPR18CA0058.namprd18.prod.outlook.com (2603:10b6:300:39::20)
 by DM6PR12MB4877.namprd12.prod.outlook.com (2603:10b6:5:1bb::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Mon, 27 Jun
 2022 11:41:36 +0000
Received: from CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:39:cafe::a) by MWHPR18CA0058.outlook.office365.com
 (2603:10b6:300:39::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.21 via Frontend
 Transport; Mon, 27 Jun 2022 11:41:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT054.mail.protection.outlook.com (10.13.174.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5373.15 via Frontend Transport; Mon, 27 Jun 2022 11:41:36 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Mon, 27 Jun
 2022 11:41:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Mon, 27 Jun
 2022 04:41:35 -0700
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Mon, 27 Jun 2022 04:41:33 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, Bitan Biswas <bbiswas@nvidia.com>,
        "Thierry Reding" <treding@nvidia.com>
Subject: [PATCH V2] soc/tegra: fuse: Expose Tegra production status
Date:   Mon, 27 Jun 2022 12:41:19 +0100
Message-ID: <20220627114119.110825-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4087b9a8-2dd6-4622-6473-08da5831fe0d
X-MS-TrafficTypeDiagnostic: DM6PR12MB4877:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EtCgv3yAnyHw2m1gGQwjLB+Dz5pNuO/pXDZFs5091/dhwWpAFzoCDgzaDmSYFs88hDctcPXO3dTrjWaT8rWgzpmjIQ3AriDitWNUaqhdCHhn6k4xv8jSYvpshB2NREKCMIFwMFp/ytgQhPoUADHHEdBuQoW+28BWtHzKWS+F5vlr02QFlQeLl90N9qqtKPwp3L+JDFC3fCxt26HVqMvtZIjzDZVyUCc0UkIVLX60T8S6ircjF3qVKBflwj5K9wOgGmtLJrSqSPa/lZACG67elZ20EAVr590zt0x2ZRyaImbKWzk3WUmEawk2l2+pAnP14i0/6XaRNBT8I2y1W/toeLjfXopT7EW7/NaO6c+gd+XlasITkob4czKyOz3pTI+B18CTna2P2Py/xvdDmVT+2YFXXqHbIA1mQ7xD+AinSuZsQ5uXh2iRPvzi6Blse4fYcHQIl46xTY0mBT06KkMYVS0APIbXtwoM/IibBpqe8OsjVM0Z7chin48fXzZG+SuzFk2ihIJaKot7BS+XHt11GhxokJp17XE3kEXUacKDvRR741R0oLU9Niphswsb4lMDod9C/ylwQ7mJ3h0cbZQm4JMUP33aT8be/aFewTRUOErGavpowLGmazmLcWXVLK7h2pdX3YFHCXOs0fKdPTM/WgAhfbGxbvUzxbzR+i8zblwSnb0jSR3+ND0zcFWYj1SOW1PBrksDxA80p1AVtSYsDdJcV/0dPaRAMLUJ0mGASSOZLlqd7E3GS/JeXrnTPFCFgaV2ITJzehSGgfAoY2f+mPguNdTE7k+NpD/1lSVpjghMBrUjAMZAp4TtEwrH2bszBh2TDOTtm2VcW/nnHX3F9g==
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(136003)(346002)(40470700004)(36840700001)(46966006)(110136005)(40480700001)(36860700001)(8936002)(1076003)(478600001)(5660300002)(81166007)(83380400001)(336012)(186003)(40460700003)(47076005)(426003)(2616005)(82740400003)(70586007)(70206006)(6666004)(86362001)(2906002)(7049001)(7696005)(26005)(356005)(8676002)(4326008)(107886003)(41300700001)(316002)(82310400005)(54906003)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 11:41:36.4028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4087b9a8-2dd6-4622-6473-08da5831fe0d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4877
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Bitan Biswas <bbiswas@nvidia.com>

For Tegra194 and Tegra234 devices there is a production fuse register
that indicates if the device is a production device. Expose the
production status of the chip via the sysfs for Tegra194 and Tegra234
devices. Note that '0' implies not production or unknown and '1'
indicates the device is a production device.

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
[ Re-worked for upstream submission by Jon Hunter <jonathanh@nvidia.com> ]
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes since V1:
- Fixed unused-variable warning observed with ARM multi_v7_defconfig

 drivers/soc/tegra/fuse/fuse-tegra.c | 15 +++++++++++++++
 include/soc/tegra/fuse.h            |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 6542267a224d..8ee6092753b1 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -452,10 +452,25 @@ static ssize_t platform_show(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR_RO(platform);
 
+static ssize_t production_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	u32 reg = 0;
+
+	if (tegra_is_silicon())
+		if (tegra_fuse_readl(TEGRA_FUSE_PRODUCTION_MODE, &reg))
+			dev_err(dev, "failed to read production fuse!\n");
+
+	return sprintf(buf, "%d\n", reg);
+}
+
+static DEVICE_ATTR_RO(production);
+
 static struct attribute *tegra194_soc_attr[] = {
 	&dev_attr_major.attr,
 	&dev_attr_minor.attr,
 	&dev_attr_platform.attr,
+	&dev_attr_production.attr,
 	NULL,
 };
 
diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
index 67d2bc856fbc..d035e04cb869 100644
--- a/include/soc/tegra/fuse.h
+++ b/include/soc/tegra/fuse.h
@@ -18,6 +18,7 @@
 #define TEGRA194	0x19
 #define TEGRA234	0x23
 
+#define TEGRA_FUSE_PRODUCTION_MODE 0x0
 #define TEGRA_FUSE_SKU_CALIB_0	0xf0
 #define TEGRA30_FUSE_SATA_CALIB	0x124
 #define TEGRA_FUSE_USB_CALIB_EXT_0 0x250
-- 
2.25.1

