Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0CC1C433B4
	for <linux-tegra@archiver.kernel.org>; Wed, 19 May 2021 16:41:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80657610E9
	for <linux-tegra@archiver.kernel.org>; Wed, 19 May 2021 16:41:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355371AbhESQnI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 19 May 2021 12:43:08 -0400
Received: from mail-mw2nam10on2056.outbound.protection.outlook.com ([40.107.94.56]:57761
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1355170AbhESQnF (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 May 2021 12:43:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZYlfjM5FDdD200qYN2R5xiCiamZv7cK3kt/8vXSWT84pVRXDCShNjv+u+6+CbpjTMIPnHPhNjvjNvezWTK0rJ88igEKqqLD+/E62c2LPcuq5ueILgcsKi4jykv7G/2W+rmHsxSZKlPXz/D0dc5CYeLxNGDHpW/Vga7YNBEzBSOwBa/zScrs6j3oAj0Ow3qH8b//tOHstU4rwFMUyFV4fjqqpPD6b+l+LcwFHtCUVoOxQkUz1g3yO0iRf9mwo/3X82xzwZdrC3f3943MuFhBysselzOcsf+pttwxrWGuhoF88tyoDvIhWe38QJeHAmAAVWY73SiLy5YgpoFop0yNuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DJ5maSTrXOEiGs/I2WjrrGDW4QQgHBPYMLVAexEexo=;
 b=Mvlw5Wn9olctuDHAiCNRp2xVzIKArEDDJSUwjnowTNAN/vOkRl57IvqgbCVj8zzb06r8uiwqnepwP1nSMQSuNNTR0wWPN3JhDJIuLI04jqN24pW65ra9xfP2jaG6TaUK10ToKb7yPT/DY2FBRHrbhAfDlVswRof4/4fPqjfy9rY4FGUNQZbPbqVr3vqKENx2A8qYb8TMFYUwsfhr+wNA6KZiauKTVSie0LkJlEijhCDktdVCl1D9VJkVnM2YyxAm+v3W4NMKCJnSqr19fduXacUfUQEHHwemw1E4QFPjho5frERU1jSxDyAw5F1WfvlRd5j/DnPxiiAjpVKYVCduVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DJ5maSTrXOEiGs/I2WjrrGDW4QQgHBPYMLVAexEexo=;
 b=mO7aWwJT8evQYsa8oAhzmqpIcKgGQRIN558WTYISTyyZ9U63UonQrhHZpO3Mj7k8MSmRTYmaJknWUqKRStm+ZWgLhsCQvIwgd7YIX673oWjVV91S/xUfsTLbi2VIObCdmAdY/vBQifwD49ZK4tOnh6BhP0X19QW7stC1bbgCksy6SyebNAznVc6kRkXGxfm55+nyYZUbD8fpo3OXBdXcyAIolhqKN3ulejFNhb/6PArRh0h6qXs5Bm57AshACUaWHCnhnDyAJwskmDrW7GoquISli2hznws7dXgGJ3owI+y378i/QYYNeogbtAuzyE9kRnI0MW6L2c2kr/ZuyILW1A==
Received: from MW4PR04CA0369.namprd04.prod.outlook.com (2603:10b6:303:81::14)
 by BN9PR12MB5259.namprd12.prod.outlook.com (2603:10b6:408:100::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 16:41:44 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::5) by MW4PR04CA0369.outlook.office365.com
 (2603:10b6:303:81::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.32 via Frontend
 Transport; Wed, 19 May 2021 16:41:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 16:41:43 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 19 May
 2021 16:41:43 +0000
Received: from moonraker.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 May 2021 16:41:42 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] arm64: tegra: Add PMU node for Tegra194
Date:   Wed, 19 May 2021 17:41:35 +0100
Message-ID: <20210519164135.213369-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 047f9065-14ad-4478-9274-08d91ae4fc66
X-MS-TrafficTypeDiagnostic: BN9PR12MB5259:
X-Microsoft-Antispam-PRVS: <BN9PR12MB5259AC3CA858C0B135854B44D92B9@BN9PR12MB5259.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kNNgYVkjSexuhNRS3s89VoCfmCPkpVfPExN4WjRWDjcjDFRiv9QQLM3zcC+0eqQTersTrMlDrXvmJEBKOP7RMcdz9I8xImfqnZJYjQ5OFKDEfUkW3Oajy4kzJlYwTMC8o+yQHcb3Y8mq541j5qNRUjAMudSuICd7Uy7S8TnSkwzgOB2CUbASpNDpbpaut95k9diBABni85egyKWfdB148oCHkslxeN2jqEjgd/ChB83HmnlC7z1wPn8u7GNUFrc+fBEwaS+6qAcJP1gmIIPIQ/NFnVjH70JdEfA/SPx6gutcL6vQB4n05ZzVuYc9bEs3EN68M/5J1M2DySJNycVmiVCtuoHE15YC36xj7fLEfESLJi1ZwOwYFnY4JT9VvXBKVDDZWDh7+80ipE/GF8yYHdhjTbJKsmr/7QeBUpes3OllEq+u1ZFL+puUIpyol9iR+4P+/HUleloJ3C+9n32p4r/DfGDDRW/5XcoY6hqN05kaBSv2uof5Nsfp3jlH9yuNupYm05FcyZBIsm6w4gEkvVWr8hoUT9bnvEa0l562yMGGssUp3R4JLqTuwitWE2n1z7iJAoIKeiZtFpvXycfca2Ai0TUcywL1eIqLSc4YuGKvxfZaBVFhTnPHWPyOQ8LIBln2SSaO4/Wr1MJ0yULuhNM6NxtwC2FCS3TD4DvqGxQ=
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(36840700001)(46966006)(54906003)(6666004)(110136005)(7696005)(70586007)(107886003)(70206006)(356005)(186003)(4326008)(36756003)(8936002)(5660300002)(8676002)(82310400003)(7636003)(36906005)(336012)(26005)(1076003)(426003)(86362001)(83380400001)(2616005)(2906002)(36860700001)(316002)(478600001)(82740400003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 16:41:43.8022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 047f9065-14ad-4478-9274-08d91ae4fc66
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5259
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Populate the device-tree node for the PMU device on Tegra194. This also
fixes the following warning that is observed on booting Tegra194.

 ERR KERN kvm: pmu event creation failed -2

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 9449156fae39..2e40b6047283 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -2345,6 +2345,20 @@ l3c: l3-cache {
 		};
 	};
 
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 390 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0_0 &cpu0_1 &cpu1_0 &cpu1_1
+				      &cpu2_0 &cpu2_1 &cpu3_0 &cpu3_1>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		status = "okay";
-- 
2.25.1

