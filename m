Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC75C433FE
	for <linux-tegra@archiver.kernel.org>; Mon, 25 Oct 2021 11:08:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58E0E60F92
	for <linux-tegra@archiver.kernel.org>; Mon, 25 Oct 2021 11:08:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232478AbhJYLLP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 25 Oct 2021 07:11:15 -0400
Received: from mail-mw2nam10on2069.outbound.protection.outlook.com ([40.107.94.69]:44256
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231133AbhJYLLP (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 25 Oct 2021 07:11:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ObywzUUij+ds1DTEquTVti9/CTUOgNZ2fSSMuezUAA/hJfG2D3OAhgk8lGmk/W8DM4dVud5I6BO6p8JxhHYZGrDCfsYzmOeoKgdxXjdVoxvRfGjqVXjey48BMsoJ5D/LTx8u6E+AzYXxfmOQ/5xql8HvCsxgCGqgLtNAZ6e5suM36HJStuW8rIqL8mDmMUhLLjV+zFx0lprYvQ3T3w9JO+kSOuOP8IsfxLhXP/gT5QnSh9l09BR1KKJFXC7FETLRLQy9UcuUNByN+wgR0Yb6j/5YtcDa13YFjCu69/6UjOUF1p8KW0hjEwQLN/KF0gvgWN45mlSU3R2rNLWy+Jj7QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUoCRcHwV0LXadzLUBjsm3fAL8RBNPz3R/cgFoBaNdE=;
 b=Dfaehi8RAPj2O8vUfns3g6B1vZ8ZTRMVVEsL9MLaIXsYfncsII0wo3jUlaxlDaoIGEKHmPZPLoz9u98pU3cGdATzeo8HFTFQCGcz/di71systgzbYmPJteaxI9/RNtVXE0qebT9TYh88ryZOcL36zWBNmtlIjjhAWJhTYC8U+RO8YK4lZof1o+mGzC1LjRHt0uEgnMQrXYKyVi/zwLDBOhuPNPpK7Bht2UZ2v8gNkYHm57r0ouHaRyiBoCe4eEonQ2Vu7ev6OVmLeUMPbPkvz0k+uGqa3Tlsw6yCjIzcu0ygEzFLBUnzumLyS0h0aznHFExZ3WAlZ6+yG22IRzIABw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lUoCRcHwV0LXadzLUBjsm3fAL8RBNPz3R/cgFoBaNdE=;
 b=eCsN7HEcRT9K6GHLvIT92DznVw9vv9hoipZJz8p/Ipn/tGbBoAIU7/R9ADYsBDfjS7muUEI4EHBgcQxPHKZbnM25Rc3E806IBW/4c4TmfUSRdEGiHahPwYVrLPKkZ8Iw04CN1veZ8VmFOYmzQGSQop09Ye45oNJBiYghq9lAw8butyRiDT3ljkkRVDjAMuwNHQ87DR4uxfpjJbPyAIyJl638WaQLaZBFiBUdelZUWyRBs/soRyD21xwefMblHK+mZpZ1LNNj4MnBHfIEIpvsQ5Lv3KlFw3Mtok1KxWZ6GHU8x/CdUJReQLLpEcJ4Cgtzaa6RPNZoonGWDjMkALoEWQ==
Received: from MW4P223CA0007.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::12)
 by BYAPR12MB2614.namprd12.prod.outlook.com (2603:10b6:a03:6b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 25 Oct
 2021 11:08:50 +0000
Received: from CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::c0) by MW4P223CA0007.outlook.office365.com
 (2603:10b6:303:80::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20 via Frontend
 Transport; Mon, 25 Oct 2021 11:08:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 CO1NAM11FT032.mail.protection.outlook.com (10.13.174.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4628.18 via Frontend Transport; Mon, 25 Oct 2021 11:08:49 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 25 Oct
 2021 11:08:48 +0000
Received: from moonraker.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 25 Oct 2021 11:08:47 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] arm64: tegra: Add dma-coherent for Tegra194 VIC
Date:   Mon, 25 Oct 2021 12:08:42 +0100
Message-ID: <20211025110842.22383-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b99ad3e-c163-4f10-218a-08d997a7d27c
X-MS-TrafficTypeDiagnostic: BYAPR12MB2614:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2614BE45BAF004AE26802470D9839@BYAPR12MB2614.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wCIguH0LdndkOgVjBN6ac9OpGtORQ+W/T7ZD6NMT8fLaOKOfsyZxzc7H4180kB76Z+TsUaFwrW7huEE/nR7nZkifCq+F5WkzspvGLTMR7LnMHalqS9CpJneorZtjBkMt9KoyqNA8+zf2iPDjAmwl0nEA3J1Nu9cVuwjpW9P/gAoOInzJv1Js/PNX6JNyHmFGn97Jv17z0++lr1k7Gp3cUEqtVOXflpuw3hQSshDccZVU0/rRj1sqsRqobef/zoRYUkHjrrbAAL1wIjOGgwJeVjebcRglGonicvdpzTK+iVXt1uh5gR7OBFCTHOkFZuup0NDz5krxj0mP0j+FG/fK1oGG2QghrE1m4N1AzKUhOQQMUInNrRBiFKKMmvwL4Lj4zxl/QYItP/2ZbI+IWuJh/iv5iCle1rhIazxDWfm93BeNvbmncRsoMYQRr5zOr5pvheeiLAymshquI0ja9fBi6l6+4UxK7ewA14IeE2JQToeOl7TS8LTus9lRXnKX3jXlCx7UJo1EwA6U+hKe400Qqs7K9OWYJXhlqa2+w3bZyqUlMFBEp5ps7zq0lyd+2HfzeQngF2pVYFNa8leSoxr2AstrnmHbfBQIvLJIjQIU4cL28iIrAcHehY+Q2ZLZD357qPNl4KFrnuDjwMUOKCDN+NCvYEbPrImJJPzn4VREd20scL7MBageJ+lHubJYLwzOBxYjCpOsCyXUx5fQTWfq3w==
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(186003)(2616005)(4744005)(26005)(6636002)(7696005)(336012)(426003)(107886003)(2906002)(82310400003)(1076003)(86362001)(356005)(70586007)(54906003)(316002)(36756003)(47076005)(8676002)(110136005)(8936002)(508600001)(70206006)(7636003)(6666004)(4326008)(36860700001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 11:08:49.5139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b99ad3e-c163-4f10-218a-08d997a7d27c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2614
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

DMA operations for the Tegra194 Video Image Compositor (VIC) are
coherent and so populate the 'dma-coherent' property.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 851e049b3519..d78c9ed08c47 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1703,6 +1703,7 @@ vic@15340000 {
 						<&mc TEGRA194_MEMORY_CLIENT_VICSWR &emc>;
 				interconnect-names = "dma-mem", "write";
 				iommus = <&smmu TEGRA194_SID_VIC>;
+				dma-coherent;
 			};
 
 			nvdec@15480000 {
-- 
2.25.1

