Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E7AEC4338F
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Jul 2021 18:51:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00A3360FC2
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Jul 2021 18:51:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbhG0SvH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 27 Jul 2021 14:51:07 -0400
Received: from mail-dm6nam08on2079.outbound.protection.outlook.com ([40.107.102.79]:38145
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229453AbhG0SvH (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 27 Jul 2021 14:51:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V37FthowVRHiKYZDwWQi+6vX8m3mSFOjTtKrLm0lrZCxDrZA0LiDy1KBeBE+hYz+QR5dERX8THZMfPkt2b8SFL782Ozg372BeouYUpS9FG0WOueeuv4BmRNcTJWx4kjyVQGhK1RGJH+8qr2ypmgCgsncmnX0jjN8QfN2SdSdMWnesLF9lnbg4JM458ZPZ2QTYeM+arnK6etB6DrbgqqNvCNeTm1yaq1waIeQ+iZfXZ3vHwIE8vVR/o8dFdSD/7QGhWxyl+hBiSbSZPVhmGkrR/xJei9tkOXdIWcMy6/qcr6QqbqNH2an4qQcvnCLKd1KF8QL3SbWD9Ca65Zcuicx4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7MeGd5xyh16dc2hTy/h3i4p0oVzZ5f8mx4h7eu5EC4=;
 b=iTkETQwVQhSI1565yPH41ql3Lruov2IKNsewni5FW9vbG0A7VGloGCO18pD5PAyzB0KoWuzIgFkWrvZ4S80u0kg+0aZgwV6BPlKQ7SGGDzU3oW0Tvk2M9+28SVMJbORZQx6jFfmj3A6SSWN+ybwRypmenmt8Vp8bFUkplan3NOtlDZCefseDXSSSXOIHO6bHkn+PZv1r/j0tP3T6D5fSo11Srgm9DjJ8Uy0QJ0F2V6YhGfaD1SELXDXEw7XVWkzMXKuiec6bgGQ0XXr9bCpeawVrh/fw9wzx0/Bn6D53tvktHWSxUOOyCseju/6OYL2DMr8/HwbZPLjj3vhI/BLkUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7MeGd5xyh16dc2hTy/h3i4p0oVzZ5f8mx4h7eu5EC4=;
 b=RwijN3B5rnsXUgOTacUyJ7Dh0Bs0g6tG+W+SHbBpsdqz2POaUR43OG4Ya7Zw01Iq4TS8gMAQZlXhzcn/cB252iClzeqmKTu5qasC3w2E2tAEPa2EbW0vE9ijv9st70tuAeImJlqxqgnQypSvvKEVEWZoiRcmRMRhb0OI/zYW/IKGykDFpvka8tG8iNrZiEyDjfXP2Ti9YXKA87aMRBh0IoH0fIAZKqYWqLhKexwqZP0lYSq9/+VVYAI0m4Uf7BX80UtjGaZh3bB5kq+fMhA3WOE8TyKE3CWcVsptwYr6VUgfWX3IfBoSMh6N8N8sWJ1AF7+GJoOvtWrd1Al52gCP+Q==
Received: from MWHPR08CA0037.namprd08.prod.outlook.com (2603:10b6:300:c0::11)
 by BL0PR12MB2498.namprd12.prod.outlook.com (2603:10b6:207:40::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Tue, 27 Jul
 2021 18:51:04 +0000
Received: from CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:c0:cafe::3a) by MWHPR08CA0037.outlook.office365.com
 (2603:10b6:300:c0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17 via Frontend
 Transport; Tue, 27 Jul 2021 18:51:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT024.mail.protection.outlook.com (10.13.174.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4352.24 via Frontend Transport; Tue, 27 Jul 2021 18:51:04 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 27 Jul
 2021 11:51:02 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 27 Jul
 2021 18:51:02 +0000
Received: from vidyas-desktop.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 27 Jul 2021 18:50:59 +0000
From:   Vidya Sagar <vidyas@nvidia.com>
To:     <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kthota@nvidia.com>,
        <mmaddireddy@nvidia.com>, <vidyas@nvidia.com>, <sagar.tv@gmail.com>
Subject: [PATCH] arm64: tegra194: Fix Tegra194 PCIe EP compatible string
Date:   Wed, 28 Jul 2021 00:20:55 +0530
Message-ID: <20210727185055.11010-1-vidyas@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f4ec606-22c7-4209-936a-08d9512f7c75
X-MS-TrafficTypeDiagnostic: BL0PR12MB2498:
X-Microsoft-Antispam-PRVS: <BL0PR12MB24989999E603A63E8CFDBEAFB8E99@BL0PR12MB2498.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CrQ3w/fRzffG9PLj09SwrpWD5CHwHp/3R3Y6L2b45nfgTdr3zXgLMadOhml77+cRnZ2EwzyfhAwHtZUqwB3wWuIdNaGJzStQs712IidCj22JF4MOFpCwRf9rJMkO+Brj2JPJAdsqNzWL3yGrzkpkTc4vWRcC/FIJqY9oBgicbUGnUjdQPwrJ4VyGZoe3ShBrnYbk4PsvxZCqzQdAlnQs+g3N7Asu3moZqunB0hMqGTvhzDfrN6Yp5cDh84BtDGFFdiXMaMY4WdoSAweviNVY1qDphMzV1UJPlfMyIIUubkVcmX0UyRc0erG6AwKZoK2pFZoQWuvNHvCPctISLzAfe9Kwbd9efJB6sQSeub/1uMJmgZ7Hg2cjFMlroNHEm6O6KER0KFw5ASIbRwbmeMibZKU+UcHCBY+j/qIQFKmpf84pNZpuWLr1D6KjFNYIWZ8hlmOQe30RM04CovOVf+vsC1FXj0dkaj4A0P+eKOgz3aIDjlVLqxwgNFwYkZ2/VZFxCJUg3WnavrQ3CsiXl/pagBNvugX7GrLgD3Do7gSnWYwfT8iCP0q/IwcfhuZTAZbPVgzaFN5xdhmD5cAFLAjV/DPNtjxjxyjN0bu/cbVQB432u2xKdLyMt+fNraaHuYjdc0qTFrQRf5dNaHYc6zlgQuyW72dSaV0YwEsPpdkU+vx9iddN7CP2wu+LMJi8mQkUhBA+VuvM8alZSsXmtb81ew==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8936002)(110136005)(70586007)(426003)(4326008)(83380400001)(26005)(186003)(356005)(5660300002)(508600001)(2906002)(86362001)(336012)(54906003)(8676002)(36756003)(1076003)(7696005)(36860700001)(316002)(6636002)(6666004)(2616005)(47076005)(70206006)(7636003)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 18:51:04.1649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f4ec606-22c7-4209-936a-08d9512f7c75
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2498
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The initialization sequence performed by the generic platform driver
pcie-designware-plat.c for a DWC based implementation doesn't work for
Tegra194. Tegra194 has a different initialization sequence requirement
which can only be satisfied by the Tegra194 specific platform driver
pcie-tegra194.c. So, remove the generic compatible string "snps,dw-pcie-ep"
from Tegra194's endpoint controller nodes.

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 076d5efc4c3d..2f58f3e4746b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -2098,7 +2098,7 @@
 	};
 
 	pcie_ep@14160000 {
-		compatible = "nvidia,tegra194-pcie-ep", "snps,dw-pcie-ep";
+		compatible = "nvidia,tegra194-pcie-ep";
 		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX4A>;
 		reg = <0x00 0x14160000 0x0 0x00020000>, /* appl registers (128K)      */
 		      <0x00 0x36040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
@@ -2130,7 +2130,7 @@
 	};
 
 	pcie_ep@14180000 {
-		compatible = "nvidia,tegra194-pcie-ep", "snps,dw-pcie-ep";
+		compatible = "nvidia,tegra194-pcie-ep";
 		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX8B>;
 		reg = <0x00 0x14180000 0x0 0x00020000>, /* appl registers (128K)      */
 		      <0x00 0x38040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
@@ -2162,7 +2162,7 @@
 	};
 
 	pcie_ep@141a0000 {
-		compatible = "nvidia,tegra194-pcie-ep", "snps,dw-pcie-ep";
+		compatible = "nvidia,tegra194-pcie-ep";
 		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX8A>;
 		reg = <0x00 0x141a0000 0x0 0x00020000>, /* appl registers (128K)      */
 		      <0x00 0x3a040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
-- 
2.17.1

