Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79D0C00A5A
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Jan 2023 12:17:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbjASMRi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Jan 2023 07:17:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231253AbjASMR2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 07:17:28 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 750337494F;
        Thu, 19 Jan 2023 04:17:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IopJfpAEY6mhZXC2BAYQ5ewPxs3uJQ5XNMuVQaWT5m/m6MKkPdRJwSSNV8oqBB5aGSR8KtfsinE9WGqmMCmnqRERVZPgLhZlJnqyuuX+hiH1a4o9E1X35bJliU1/HbZaLPwXnGpATAUvD8IqxKfnWQgVcU5OizyLLZpTL6B1xdKy6G4zpjWdSPgWMFa1HFW0SWwEP8L+/pedNwmnTzOdnhUXipcocb0ZdZGiVwQMuhySURhzSRlVo2aBD9GEzO7dkUpYKVrh0TuxyRqzo7DiJrsWa1IfX1GwgmzkF4QN59ennzM6X0n6K8/7zgu7obX1BteFh0Cv+1OWY9CHaJvvmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STkxZujXtbr84jEqF9p/3iLUJ9SwyFHWz1dhc7Vp0qE=;
 b=NEOjLM0ZEU0dp4O+V06e/jNsE9ojHXufhVdi4YXdQUUwKmHJsiiAyIJxOxWSlDLCBkjZSaZ6y+eNtowvGxB57kYfYWtLxkMnc0VRUNOtbyZfPMSpnsMAb+Ef7oYPAcp3eXnJvB9q6dgSGnXAEzktbyFwWYKVZcsZl5SNDvMvsLOwRwP8PAogPEpmNHVl20HF6uaAXOrMQtK7cWgBCerGBqCT/0hJnObsezwGYbhdnYbGSLpx0jJPxHPYFhdfGdINUr7J2fC2rSy4caxlDQixvW1iirCqbpW8K2A8rTyPfspqS3yZ4NArnd6pkWC6T58Y90pK1FJdgEM8EVcaI2YqJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STkxZujXtbr84jEqF9p/3iLUJ9SwyFHWz1dhc7Vp0qE=;
 b=JC/TK4g5WaKBqxFsB8Bka4Q4T2t5ouseHe5wU4IE9Dw07Py8DiwDBTuyqQGYPkh2FofN7dgoxoc8ZOdioPIi+qWBF5jJSAqxSgFJEpiSL22rWAnQU57vi0QTQYIqFJaqI9JKZZ0+LWs+5gxeQpJ3GwP13wjHlebBOm67u0VlIGVMVQwq2Sq/CM1O1998aqZmdVVKlYUy93fWwy0iaelSJKWKs226AfGG2DQoum1gS68hQ3WPCmuDJHxxC9xMRXZl+zZlCIE1hZV+94ZFJPKyYHu9OO6RXZ1XUFP1bpRwFXE+ynNMR6e9ZzJPhA2E8ZS5Y1zdTCRQp6zcnwgl1xppZQ==
Received: from DM6PR11CA0007.namprd11.prod.outlook.com (2603:10b6:5:190::20)
 by DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Thu, 19 Jan
 2023 12:17:13 +0000
Received: from DS1PEPF0000E659.namprd02.prod.outlook.com
 (2603:10b6:5:190:cafe::8b) by DM6PR11CA0007.outlook.office365.com
 (2603:10b6:5:190::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24 via Frontend
 Transport; Thu, 19 Jan 2023 12:17:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS1PEPF0000E659.mail.protection.outlook.com (10.167.18.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Thu, 19 Jan 2023 12:17:13 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 04:17:09 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 19 Jan 2023 04:17:08 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Thu, 19 Jan 2023 04:17:06 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V6 6/6] arm64: tegra: Populate USB Type-C Controller for Jetson AGX Orin
Date:   Thu, 19 Jan 2023 12:16:39 +0000
Message-ID: <20230119121639.226729-7-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230119121639.226729-1-jonathanh@nvidia.com>
References: <20230119121639.226729-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E659:EE_|DM4PR12MB5311:EE_
X-MS-Office365-Filtering-Correlation-Id: 91c2d57b-ab13-4514-3b4e-08dafa1718b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lcVl9i1M4zF6Y8slEpNKxS3xcUognGmaCXxioGYSlCb85fDRoDvOX2IGljPbmJZ3bBB4BI4FLTSOGX+QC+E+0kyinTk/PaUbP3lSygxuJuodZyRaM57dQKZRveii/nUZZ+0wDz6pECA8uofrePjJQiIwaz9vY0zlWhAM7XDCgyIGdbcr7lqDkilfHTmSVBR3+KwD+Wi62wQ69A+rZkD2lg8CQJy6jKEUxYn+H2q9rsROK1WS4DMCVosHKo4f8ia2OGPztRBkzq8+u8CdxSQcvVwCA3KTXkSF+j26c/W4MxX8AToUutXVGM4dTZBakuiUjctkM/MWzIZClmZProRZMKTF6qGvU1aA/oFxLNyQqelI2OeGbI3T+hp6+K7YLfXDjSX0sccRiIbEKvaIEuqm8aL0V0MhUhJfF9rnxQZLRXX60GDK5L2PgMBXFkwKXv2UXdWE0xlpKzqeL398L9JVJaK+GVRZbpPwtygTPJWkzqQDaZp+55EDWD88FL5v7WvKzMfi9xmJXnRgt0JWPaxe1VT/AURj/HJ/GhIfI0FcjxXbrTPQwU3lSo5H6+0l73ynnWe73x6io3u01uIaZ5PSD6Qm+eL5SiZGsg6OZVmOk9D5pdP9R++RoonZncjnQJd2eKeTz3HJ49HhA+Uns+1D09gv6/6ySfFyM2RBeJtcAOQvE7qPvbw48dCQZXhqzyYF3VzreaFmbazXYH2D/MSGtw==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199015)(46966006)(36840700001)(40470700004)(40460700003)(86362001)(107886003)(478600001)(6666004)(36756003)(7696005)(8936002)(5660300002)(316002)(82740400003)(40480700001)(70206006)(8676002)(4326008)(70586007)(41300700001)(26005)(82310400005)(36860700001)(186003)(356005)(2616005)(2906002)(7636003)(1076003)(110136005)(54906003)(47076005)(426003)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 12:17:13.0924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c2d57b-ab13-4514-3b4e-08dafa1718b9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E659.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5311
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add the USB Type-C controller that is present on the Jetson AGX Orin
board. The ports for the Type-C controller are not populated yet, but
will be added later once the USB host and device support for Jetson AGX
Orin is enabled.

This is based upon a patch from Wayne Chang <waynec@nvidia.com>.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V6: no changes
V5: no changes
V4: added in this version

 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index 32c58aa00035..05819d8f8038 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -2115,6 +2115,20 @@ usb@3610000 {
 			phy-names = "usb2-0", "usb2-1", "usb2-2", "usb2-3",
 				"usb3-0", "usb3-1", "usb3-2";
 		};
+
+		i2c@c240000 {
+			status = "okay";
+			ucsi_ccg@8 {
+				compatible = "cypress,cypd4226";
+				reg = <0x08>;
+				interrupt-parent = <&gpio>;
+				interrupts = <TEGRA234_MAIN_GPIO(Y, 4) IRQ_TYPE_LEVEL_LOW>;
+				firmware-name = "nvidia,jetson-agx-xavier";
+				status = "okay";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
 	};
 
 	chosen {
-- 
2.25.1

