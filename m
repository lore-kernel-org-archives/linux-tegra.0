Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C15C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Jun 2022 10:41:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239083AbiFNKlf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 14 Jun 2022 06:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234519AbiFNKle (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Jun 2022 06:41:34 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1E3140A2D
        for <linux-tegra@vger.kernel.org>; Tue, 14 Jun 2022 03:41:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJkiH0suAFl8oO7mIKyqmPEhMaSTKOpRFjs/pxQLNdc98pWCIPB99wDOmXEti7bU+bFDN2zxOmBJuMfOKziLNbMvBzmqP3e2fRP85n/K7KGBHOapFgZTFASs8lTneDGf999tUOAGnkWuXLDqlANRbqnxNxiyI4dtKgjawAja/SSMuI2mF4HJJhGCRRXUpSDjnjIR3gztdVaIE6FC0OsOxyGYuiBJe/rLWrD52iA69ebg5FSNW0Evo8OwhGnGA+x1wCvc2Lo03GtvBawF+BbXlhRrFrOlKXWnrHKtNd1sEQey3ULvUgJRMdSmwoeD4cCbaJxbNRp08BbAP0nKA6sLsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPFwKPqaKGKdR5PizmO239XfyjjUwpmH9LyA/Yix2iA=;
 b=YZqp7PU7kkcgeQvnozjW1UyypsivMQFzeQM4pYBhp1s6ACsOmeIDgXPLLea8JclS5ZBEykoDMAxVp8gLfiihdVw0YJNG4vuiyl4BLI2R/+BKWyjEaFnS91uKjonQWh7HI/A2vBPLrHTbOsItDYl003rClORQLAcGRRS6CfDYptEwon3rOopYRB0p2+1sRVIPBJtn740WYnxHqM9BogylQqJRJQY1MqRqQ25eY54Q2p34f4Ex0H4WMC+VJANRO00EUnqXQSUxRkJXSef6NtXOtM5cQVZyrEaPCq2NVQnGOd8vn5n8HIDKuvX2UX7SOrBSAgVlWXGLg4VuxTv1trSvjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPFwKPqaKGKdR5PizmO239XfyjjUwpmH9LyA/Yix2iA=;
 b=ZoqHzKAziETTUjUK7eao3nTd2XX6QODKCdXk92bhMRtC6wKfG2keUcosgZXDih0edtlN7vUYUyw3i4o/Yivq5rXyaZUJFO+spms4/YD3dQoNITDV7MI6igMcja4ThDsnoGaYl0K+joi50FObYusiWrMuI/TJRiObQbDd7uSA0rRNYGiwq9oY2otIEOQ26rfaKGyhDJPgZ2Uh6iJuF+QqYiXdKNaMbvjfyy4JzR73Y+YBHlmyoOZp0j/pjA/NR9NC8xhtqF+vN/qAatiXEkHr7xhifv/68wfdLL//LrEKJunaCBTg6zJq6DVMaeATxGijN4j9g72ecDgsn4j+JU7OwA==
Received: from MWHPR15CA0034.namprd15.prod.outlook.com (2603:10b6:300:ad::20)
 by MN2PR12MB3293.namprd12.prod.outlook.com (2603:10b6:208:106::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16; Tue, 14 Jun
 2022 10:41:32 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ad:cafe::a9) by MWHPR15CA0034.outlook.office365.com
 (2603:10b6:300:ad::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20 via Frontend
 Transport; Tue, 14 Jun 2022 10:41:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5332.13 via Frontend Transport; Tue, 14 Jun 2022 10:41:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Tue, 14 Jun
 2022 10:41:11 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 14 Jun
 2022 03:41:10 -0700
Received: from moonraker.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Tue, 14 Jun 2022 03:41:08 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, Bitan Biswas <bbiswas@nvidia.com>,
        "Jon Hunter" <jonathanh@nvidia.com>
Subject: [PATCH] soc/tegra: fuse: Expose Tegra production status
Date:   Tue, 14 Jun 2022 11:41:05 +0100
Message-ID: <20220614104105.84891-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dbfbea3-6670-4a87-de8a-08da4df271ec
X-MS-TrafficTypeDiagnostic: MN2PR12MB3293:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3293FA459FA0886F720867E6D9AA9@MN2PR12MB3293.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VynIDbajZS39NXnVIoKkKyEaJLEyDKXfuwf8eUlOC6ND46bDu8p4nV+6bQT6MApeZMlSI+RpkCHzg1L58A4UUEgIW1a6ZPVSb08mM2XkjRcIsQTdlY7MUC4RDZf3pdh1s2yoJdTuQQh99I2gmjnHBSAWrfIA2wE50XFVUrEJ8oRmwvQZpuu0HR+10zY4t/vqX5+71b7CazT6TCX6VpcBxusj8WecEmUUdyS93jltGbmPpIrUrAvLuElFdvOSYuTA2B0W/PSIjwPDCJ1KaQlUXf50iHGXFtwRv7/j3Q5azMqvf4ADnxixswL4GZJxNeW7pjbKkq+t5IsHYHJw//AMvziQqP6vD4smo1CDHZeB5DGJWr7i2BRsz9jN+O8TWZ714TFuyTWwzgwqTvFpMVtTBYSrXw70b+QFtbh1fnqIOqjbSWEAlvsU7BqUIz8jJWUoNUEi1Ay5It4v/Il1naFHkHqShfS6403UgBWqU+qbRao7QbviInurpHd94jEynPkDcBRcCBDUMQiVEE0Q1WIYWaivHq46LDBexGBca7IGg4F8L6dF4eB8VwyeNhf1kqq3jkmqw8VPHeKpmF3fvYdyy/vqT9fopkZsGhm4kIXqRXUZcOrbjw/r0xbyoedJuUBiHIWwtcrlbnMlQoucx7salhzkMVnhGJJBlS2Phpsg1yy38+rSE2zl+9vhQZRzl26hmPM3orhQNBi5SzbhXycGLw==
X-Forefront-Antispam-Report: CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(46966006)(40470700004)(36840700001)(82310400005)(4326008)(8676002)(6916009)(81166007)(86362001)(8936002)(5660300002)(36860700001)(54906003)(36756003)(508600001)(70586007)(70206006)(40460700003)(2906002)(316002)(426003)(336012)(2616005)(26005)(107886003)(1076003)(7696005)(6666004)(186003)(356005)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 10:41:31.4026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dbfbea3-6670-4a87-de8a-08da4df271ec
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3293
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
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 15 +++++++++++++++
 include/soc/tegra/fuse.h            |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index b0a8405dbdb1..276b22144ff5 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -426,6 +426,20 @@ static ssize_t minor_show(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR_RO(minor);
 
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
 static struct attribute *tegra_soc_attr[] = {
 	&dev_attr_major.attr,
 	&dev_attr_minor.attr,
@@ -456,6 +470,7 @@ static struct attribute *tegra194_soc_attr[] = {
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

