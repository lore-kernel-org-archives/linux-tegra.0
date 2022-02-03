Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01277C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Feb 2022 18:43:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233256AbiBCSnk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Feb 2022 13:43:40 -0500
Received: from mail-bn8nam12on2085.outbound.protection.outlook.com ([40.107.237.85]:16833
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230376AbiBCSnj (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 3 Feb 2022 13:43:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVzjn0L+ZgzQJK1muTg/KXx9N7tqcTG0Z+wGKIytInmC1vAkP7rmSSaiAPQRSjXmtpk5JH7Ub+DrnzcOJbrdhdzTzyaO7gb+7hzVC14QnRZ8p2BUfT1FGXUeVgPpvWXrCXfFnZCI+/9AMH+PENkPSfaqm/5GQtyojxBSt0/PGoGIYz2WGAP8eVe2NVgfXZ8Ch00el6Uw/B/yV2GBm+zXjftnM4XLes3qsb0rSr89jLAczUVKcqJeeNRf1K/r26tagUbQMjJzRLpYT3KgZ3T/Ia66cu5tZkMatET999Io2QIWiqOwmajK7GKKtBnsF1Zq8y8+MRkGO2vl6nVzRxg7JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/D/NcO/w8G0cq8a/IteQv9xukj7NfXVmDOktv/lU0MY=;
 b=eKE+cV8nhPGyCDv6mJ5Jvu+wRR2ryNib+NtJX6NX+sjvuikCxiLCv0ayURI63nuPi9/iXf+RRC19mkvfEjZ2YDofGF0/NFUYwxMxM7QwAT8HDNxO8tKhQzCyViFnkMBTu+At3+bxwfDdxvFibH4GrxOW9rzQnFBfYLWbRv19+uVa9AqUb9qBLure9TDibdOC880ZGxt4l8lfk7QRWxWPN70I2GiZarfw1Ck8usW8kdtSXaxK++kGKL8//zqgoJtOdbMGTSiYQULSjB99/OceSCNbxmlQGPqFFcnCweIOCijcfeRClyU+xw1Ft534IiDGna51Xpzw6HbnsRshFzGRNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/D/NcO/w8G0cq8a/IteQv9xukj7NfXVmDOktv/lU0MY=;
 b=CUeCNKB9H7MNwIVxRk9zd5KiwVSWy/EExx2wrYJ0PRlvviNFT41c+752K5GCVIXlI6mrawzlPe+TMxK+d+el5LRgq2lGjLRSifihXzRj6eU/UV3H/HGgNBhaxdOHSnRrwHs6qyy4wqBhaUHbNB3WWz4Dj03yNXxaXdck01Rp1KVyuCCf4fQLzRJ3jW7G8LP0dEJHkxwZvNYl2hbUXyhZuLB/T19DTP6K2WX6CSwUk22KZq24VzMhMr0PgMdusQ4Fbu8WAL4LEl4BguQQxrJTjwuFetacy9njDRAqmEzjS+V7fpQO0LjefcMET/mW3l8bWx48c3BABL8SN764YCZIvw==
Received: from DM5PR16CA0025.namprd16.prod.outlook.com (2603:10b6:4:15::11) by
 DM6PR12MB3452.namprd12.prod.outlook.com (2603:10b6:5:115::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.14; Thu, 3 Feb 2022 18:43:37 +0000
Received: from DM6NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:15:cafe::c0) by DM5PR16CA0025.outlook.office365.com
 (2603:10b6:4:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Thu, 3 Feb 2022 18:43:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 DM6NAM11FT035.mail.protection.outlook.com (10.13.172.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 18:43:37 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 3 Feb
 2022 18:43:36 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Thu, 3 Feb 2022
 10:43:36 -0800
Received: from moonraker.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Thu, 3 Feb 2022 10:43:34 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] arm64: tegra: Enable device-tree overlay support
Date:   Thu, 3 Feb 2022 18:43:27 +0000
Message-ID: <20220203184327.65878-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60b0fefa-50a9-4dc8-1450-08d9e74516ee
X-MS-TrafficTypeDiagnostic: DM6PR12MB3452:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3452B5119D22ED62CD10A8CDD9289@DM6PR12MB3452.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZFT1s0C241twAD0vxsjottgqxEwMTdHtqTDatwcc83gkXEgJ0XC+7163P48WVFTkx+Kun2QCR/mv4vK67dHdgFJPPA3S59RV2y4ohqXHalu5Hvov8cb/iZpuVhLsWSEzncOGUOwCmEezw0zodry/tfcXQiAZ+sbbHPeV8nucPvmxoIRXIIWjSM96SMy4Y7giml+7z9gQMyzl/s7bZIEUdWF8HdzhSGKms0x0NrbBsQFpgV954lNDavuH2wvvh3lXmMM9TSX/W3UtGbrUTvtYdMBTDTHvMOvoPV/bI9NwT50b5Pas6M9mfT60xWOhQi2ac/QMm9EoDq6OhfnL79Nf9nrzXaL0vZcOlhYuwCJ72srcTgac1dUFywYZF8xET+T+l9p9Ps9glwSAyDXc+bvJdX6u3L2flEtHPhxcw5gPp0u+A5LmgCLhDsam41AriVQAbDgX7wvTPUrhZ7n5unZGkQYJFitakwwNAfcJU4xGN7TwSncSnHT9pI9O5goCMJwhfk5VI9Mlq2R6iRdn+3mB5E+EGF+qxKNgGSuYTwjsM5ggC2M/mJdMrohmNe2ileG6Kq1ClfP6cCk/73ZdB90hbTl/Up1RC1XeNHPTYeuYwmZl4irAJnsgeLjThcsHNsPpxGjFELE+byw9FrLsybRSae+RM9QoQNgW3J0V9cHvJE2LZEVD7RdU5ojhMe1xaT3laUsSxCVnycBeLmyyNbd2AQ==
X-Forefront-Antispam-Report: CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(6916009)(54906003)(316002)(2906002)(81166007)(36860700001)(107886003)(36756003)(82310400004)(508600001)(47076005)(8676002)(8936002)(426003)(1076003)(356005)(186003)(336012)(26005)(2616005)(4326008)(86362001)(5660300002)(70206006)(70586007)(6666004)(7696005)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 18:43:37.1847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b0fefa-50a9-4dc8-1450-08d9e74516ee
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3452
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add the '-@' DTC option for the Jetson TX1, Jetson Nano, Jetson TX2,
Jetson TX2 NX, Jetson AGX Xavier, Jetson Xavier NX and Jetson AGX Orin
platforms. This option populates the '__symbols__' node that contains
all the necessary symbols for supporting device-tree overlays on these
platforms. These Jetson platforms have various expansion headers,
including a 40-pin GPIO header, that allow various add-on modules to be
connected and this permits users to create device-tree overlays for
these modules.

Please note that this change does increase the size of the resulting DTB
from between 30-50%. For example, with v5.17-rc1 increase in size is as
follows:

 tegra210-p2371-2180.dtb: 79580 -> 105744 bytes
 tegra210-p3450-0000.dtb: 57465 -> 81357 bytes
 tegra186-p2771-0000.dtb: 64763 -> 99553 bytes
 tegra186-p3509-0000+p3636-0001.dtb: 48078 -> 62464 bytes
 tegra194-p2972-0000.dtb: 75303 -> 111545 bytes
 tegra194-p3509-0000+p3668-0000.dtb: 74762 -> 111995 bytes
 tegra194-p3509-0000+p3668-0001.dtb: 74578 -> 111748 bytes
 tegra234-p3737-0000+p3701-0000.dtb: 11229 -> 12917 bytes

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/Makefile | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nvidia/Makefile
index ea3f338fd013..bc34c9d8846a 100644
--- a/arch/arm64/boot/dts/nvidia/Makefile
+++ b/arch/arm64/boot/dts/nvidia/Makefile
@@ -1,4 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0
+
+# Enables support for device-tree overlays
+DTC_FLAGS_tegra210-p2371-2180 := -@
+DTC_FLAGS_tegra210-p3450-0000 := -@
+DTC_FLAGS_tegra186-p2771-0000 := -@
+DTC_FLAGS_tegra186-p3509-0000+p3636-0001 := -@
+DTC_FLAGS_tegra194-p2972-0000 := -@
+DTC_FLAGS_tegra194-p3509-0000+p3668-0000 := -@
+DTC_FLAGS_tegra194-p3509-0000+p3668-0001 := -@
+DTC_FLAGS_tegra234-p3737-0000+p3701-0000 := -@
+
 dtb-$(CONFIG_ARCH_TEGRA_132_SOC) += tegra132-norrin.dtb
 dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p2371-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p2371-2180.dtb
-- 
2.25.1

