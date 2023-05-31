Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E252C77B7C
	for <linux-tegra@archiver.kernel.org>; Wed, 31 May 2023 08:52:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234557AbjEaIvl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 31 May 2023 04:51:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234770AbjEaIvM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 31 May 2023 04:51:12 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79E2C123;
        Wed, 31 May 2023 01:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Um90luZkrUsQDHuk352U3yfl24T363mHvn6drr7P+ehsbvpfc6PvYWkZ7M9AF7a6QPLNNhcQqjUbZ4ExjZ7sJbqFB23+mILcXFv33QfzpyZGhnWGbhd5fkqbV/QIB1T+t+/vU9FEswrr5Hp5ynEv/cC6+9HCpPIl6YNffPEDADEiu81h+dLvsFSdpTtUe6uDRQm2UR0Ou0SfEEJMfq0AyznENbarqSIV5+w5kgqeygbH2QyA9TWOobdaHjauD2O59TplAJss+R6j8COFW/yJvwx708Y1CRw/3QIIfuuZSVE1HDrOODSA2nTsnla6S3b4nB0+8tYcYumy6uGziIeNew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhr2JO3eHBqQ/5rpQVg5fkycpkmnl3BPX8xFc/iONEU=;
 b=Uhq3ZaItp4V8A/nfqnT+l3cucHGWBjl907yuKfLLxNbFPziEZ8wZ0jHfJ2dd9ooVukK7QHDoefyvbekoFEU0AL1iIP+f4ReI77+butDA1iS1rjUNkdoMksaSc1uCcdt7wjUpTG6D2ur0oWftq1P1VEVlP/UAPZSRLKgMBHHCCeEpLdKUgB2p6Zl1hU5s1cTAFsbAVo+HTTNxaFWODetD3COkrvwNWH+jaLs9PTIbJ29LwtdEDs36DwkFwjDkfe2fIpbobLPid9zAoYEmEMaa3nLGv/YGSandfvGKxkMsAe8LDKNioasmyjXO0tMiQVRwuC6vZyKeHeQ8ZtgNZxaa0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhr2JO3eHBqQ/5rpQVg5fkycpkmnl3BPX8xFc/iONEU=;
 b=lzlhVnPwSqQjv8voig7VI2k5hgibdBE2C6Sq7Qpo2b38LhQ1E9cAKECTpdfL7Gmm4wISjxJ/dxyFdT38RapdWfYdhq9RJEdMvfPsDE2yR+bA9K9Xf/q06bdHSM1pNKpArKFQc/D+MbQfXl2pw2iBAPAF9nVL3F+19hQl8g3HFzUIuozSkttVhsG1O5q+Vuw2ItW6MVaScbvBVsGV/iSUeE8Xb7UPLKZuOVd68856XbDibKoMuu4PjmO8rTlwLmQKnnkukNi9MzLWPf9zgWCgXzkDwYLzPjvWFebmjPABSMQuldD1ZFFesmJo83I3py1A0FVxp8mo4ZSEMuY8KN/WWg==
Received: from BY5PR03CA0029.namprd03.prod.outlook.com (2603:10b6:a03:1e0::39)
 by IA1PR12MB6554.namprd12.prod.outlook.com (2603:10b6:208:3a2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Wed, 31 May
 2023 08:51:05 +0000
Received: from DM6NAM11FT105.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:1e0:cafe::5e) by BY5PR03CA0029.outlook.office365.com
 (2603:10b6:a03:1e0::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23 via Frontend
 Transport; Wed, 31 May 2023 08:51:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DM6NAM11FT105.mail.protection.outlook.com (10.13.173.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.22 via Frontend Transport; Wed, 31 May 2023 08:51:05 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Wed, 31 May 2023
 01:50:55 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Wed, 31 May 2023 01:50:55 -0700
Received: from build-shgarg-20230103T221109854.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.986.37
 via Frontend Transport; Wed, 31 May 2023 01:50:55 -0700
From:   Shubhi Garg <shgarg@nvidia.com>
To:     <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC:     <shgarg@nvidia.com>
Subject: [PATCH] arm64: tegra: Add PCIe and DP 3.3V supplies
Date:   Wed, 31 May 2023 08:50:52 +0000
Message-ID: <20230531085052.3082394-1-shgarg@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT105:EE_|IA1PR12MB6554:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c90ea54-201d-45e5-9644-08db61b42b6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l7aMqPYAM5nQKXGkIUILaF83K/hGx03ASUDEq3kyNlFJ4PbvV59t5FvR+A8ZLO3ngXGIcG5XNS1HTf7pGoRYxEm3xCKFR8f4HYUo0knapfbL9typgpORi5KTe6Rtf5W8zrbvH60EqHE4G+4lOUC02PC1lhzJ8sQiVFCrh3BO47/fqV6AKrQEN/KZvWL1CRMQKRt9/kec3WIIzA/7H/E92p+iFUukPc/zKeVHTdgrAB8ongW+PzZ7NLv88BmKf088f2F/2zxNxlCajzvEQwFgKRvNTJyRvvzRoNTy8CUMmRSgoGeAbQWv9EG8GIKOv3cdDPt+wBC2qTClL4MEFsKWsZ0cvPC9Rph8IjIchq5WNOE1+8Otgx7u1tWcgRotlUjfdFdbhFiD9SE70F2T+EON3H0WQ0hY8F+yTtlfTYsawX2BkWdQD2etAjBYaRj2hZbTL1knuNLvnPNDvltZBIvuU+HHi352VArcJ19i+Md6zdiM6zQd8Yw70C0W18nB6ZWyPgqtNuo+vDn2fCBoIFSU0V6ROfeVA9aVaqkE7a7bSCJz+exK0QVayOxOvWi0yVd3C+MQxfNxE0b5qQk9BJX8DrqrsOApxdlnvPQbOFKlsiI0jabLRAbSmnrHOpK5x4KstLB11vZSn3F9CZkT7SfIbulOVRcd+UW3NBfimiQAEJaGwUZR9dpOWzsMZU57zlKXGXrHyM84xdKWHh8Tbr5S/McrCMcUliJrDRL/rZx6XD/ZScTsZtH1yq05ny4+hIBz
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(316002)(186003)(1076003)(26005)(7696005)(6666004)(2906002)(40480700001)(36756003)(40460700003)(107886003)(5660300002)(41300700001)(8676002)(8936002)(478600001)(356005)(7636003)(82740400003)(36860700001)(110136005)(336012)(426003)(4326008)(82310400005)(86362001)(70586007)(2616005)(70206006)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 08:51:05.2064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c90ea54-201d-45e5-9644-08db61b42b6a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT105.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6554
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add the 3.3V supplies for PCIe C1 controller and Display Port controller
for the NVIDIA IGX Orin platform.

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---
 .../nvidia/tegra234-p3740-0002+p3701-0008.dts |  1 +
 .../boot/dts/nvidia/tegra234-p3740-0002.dtsi  | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
index 43d797e5544f..c0ba69c16382 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
@@ -35,6 +35,7 @@
 		pcie@14100000 {
 			status = "okay";
 			vddio-pex-ctl-supply = <&vdd_1v8_ao>;
+			vpcie3v3-supply = <&vdd_3v3_wifi>;
 			phys = <&p2u_hsio_3>;
 			phy-names = "p2u-0";
 		};
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi
index c95063b19321..7f6c34b79491 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi
@@ -134,4 +134,32 @@
 				"usb3-0", "usb3-1", "usb3-2";
 		};
 	};
+
+	vdd_3v3_dp: regulator-vdd-3v3-dp {
+				compatible = "regulator-fixed";
+				regulator-name = "vdd-3v3-dp";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				vin-supply = <&vdd_3v3_sys>;
+				gpio = <&gpio TEGRA234_MAIN_GPIO(H, 6) 0>;
+				enable-active-high;
+				regulator-always-on;
+	};
+
+	vdd_3v3_sys: regulator-vdd-3v3-sys {
+				compatible = "regulator-fixed";
+				regulator-name = "vdd-3v3-sys";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+	};
+
+	vdd_3v3_wifi: regulator-vdd-3v3-wifi {
+				compatible = "regulator-fixed";
+				regulator-name = "vdd-3v3-wifi";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				gpio = <&gpio TEGRA234_MAIN_GPIO(G, 3) GPIO_ACTIVE_HIGH>;
+				regulator-boot-on;
+				enable-active-high;
+	};
 };
-- 
2.17.1

