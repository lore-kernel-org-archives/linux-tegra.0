Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CED7C54EAA
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Jan 2023 15:11:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234111AbjA0PLe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Jan 2023 10:11:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234214AbjA0PLc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Jan 2023 10:11:32 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA9DE8497D;
        Fri, 27 Jan 2023 07:11:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZeaB/waAszDwbiU38/LXnXsfN+s3AZP+eSsCKKv5JOLEl+0xmH3cgsbKsnEcrE/1ywMFhgLi/3YTjtvVPC1m6jPeeIDIvWqZHLvy5I4QIrn4vTfNU4tuQjHPPzWAEAfExnTQDVhP8TguGeg6Tn+W8xtIXvqHaNTwOVkhpFFl9ph/Xw49K5Km/K45k0I7UN4VhRRHNck1+pkOCUpmxraB6waWOy0Dl6vzM17RgodkrIKcNMtVEFalIOBDKO9U9C4cKwfRUZ7muCiu/BBC4hvW77qQXzO8UCwIZZ+muu59rtND4aT+q3pwGAUh1IID02wif3m6ksZcsRJxTEsP8XCuyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgg5F8lO5aMLue6WhQoCZw/ncL4g9pNbjeyroS6nJM4=;
 b=ci8zVBO7Mj03926hQDbxij1fc8JpLqIVdJudXp2mzXBITNOFjidb/LszOO2PTEAiFXSRQ4fjVdmrsOlSm+9qme5ZXiRaRi7v93GLMxzFUA55TfMPFnIG3XP1uGIZO1zlswHzM28LK88W3DqKrY4NrN8ZDe/B13GcWM9eX5wPT/I1oAr4Ulo/OcvC2lJ2FVeMpCCtE4CkL/ma8+wLUTbkjxhSOdgLVGQaKAQPKtczYL2BO+DaNuNGSqdQciyG/ovYHy8BIojAGB68avSwWfasNUXuyr20GBqgBjQUQJnkrc9ObymR8tLVoOkTE3CExoKZcm40mZMx7LFTCAq21U6+dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgg5F8lO5aMLue6WhQoCZw/ncL4g9pNbjeyroS6nJM4=;
 b=FKV8LXUrkF0rF5YSWWlTKI1G5kblMwuBrqGRw9bChkPA1R4qYjyMyll3PfDFMyNo9yDr2ycg+y2iN6w6uNskZ3lX/Xb/11LCs7VYpC93w9vU+cn9GBelIW2nZTg0vQshOOCyGy5ysTW9BgbxLyb6MhzNaFMJVEC49k30TC7YKDsWjOkr2Y3VyoCRIFEOvqZ2a0KBnn0txGU4yx1ZMTCtp8l+J97CFj3sEicWFYExTc8UJ5OK3B05rwRwYVKUwFGLeLzYYOpkIDj9pzcjn+E37NEwAhuf6pyoKBHZao7l0a7WTSK5GcLozhlDRw5iFNeV7F3tar4Kv+CzFhY+Yv0bNw==
Received: from MW4PR04CA0203.namprd04.prod.outlook.com (2603:10b6:303:86::28)
 by MW4PR12MB7030.namprd12.prod.outlook.com (2603:10b6:303:20a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Fri, 27 Jan
 2023 15:11:21 +0000
Received: from CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::cc) by MW4PR04CA0203.outlook.office365.com
 (2603:10b6:303:86::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Fri, 27 Jan 2023 15:11:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT029.mail.protection.outlook.com (10.13.174.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22 via Frontend Transport; Fri, 27 Jan 2023 15:11:21 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 27 Jan
 2023 07:11:04 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 27 Jan
 2023 07:11:04 -0800
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Fri, 27 Jan
 2023 07:11:02 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V9 5/6] arm64: tegra: Populate USB Type-C Controller for Jetson AGX Orin
Date:   Fri, 27 Jan 2023 15:10:40 +0000
Message-ID: <20230127151041.65751-6-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230127151041.65751-1-jonathanh@nvidia.com>
References: <20230127151041.65751-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT029:EE_|MW4PR12MB7030:EE_
X-MS-Office365-Filtering-Correlation-Id: a1c6f9be-5490-440a-3a1e-08db0078bfc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mhjGuODIjUVZjat4H6BaE0B1Ct4c7FjvI6M3nreZcF5r7VjTJKJ8LNhOKnYODj6p9SLF0wD+HCMZEDAfdzhk0ClQDvBxzYjHCa7/LHNd+BhW5o6gqBF8O4wz9YUJqA/RPIjVnzDZq4TI7PW8Hmln8jynBHUZzc1NNDsgrnebolQAWN9BJoIx2m3vMeqsM5bd5CV/J8LgO2dTdsO0wHtXpqK3tbzd8ws/bsQzVbEn5bWif6jKJmjIpyds76ciXHED40y9HHlINumIA1P82697+bmCtSU0XXknmhpUam/0fOFDPe8ctzLMN1ppS1BSgVJmzwsAe6OhzfBW/C7wfTzZB4vJuRX6vBp67Xr1xrLC1zMxpN1A0+OVqspoaUQh3BCmsdYh+nLTafj9F5DFxK1noP7WZqsFuozmY6sntFho2zm7+KliIhZOxSimrNfl5TedNl0qSD/sz7Qo3VbRR1XWMBsT+g2vLiksoNc7uvxgqO3+eVP5+khdanEAC0vuU3LtHMYAD72918BeFN0nMq1umYbWQHC/jLWs1jz14PCdxhSDruCbYNGok0hLGuPSiJ4+CmDHjNQSG4uSgTC6j4G8YhoN475zA/abIEtvW7k2wQfWpDQCDIvSbxe6ITOCegzsEKFkE3waC47g5bBuh4PQaZ+3FTCr7EarWjIFypS9xOAgO19dRwTOB8TJf8PxVnWgWILAha7xSE4BUoX7jfuoUw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(316002)(8936002)(82740400003)(86362001)(478600001)(1076003)(6666004)(7636003)(336012)(107886003)(2616005)(82310400005)(26005)(36756003)(186003)(356005)(40460700003)(110136005)(5660300002)(36860700001)(40480700001)(426003)(47076005)(2906002)(54906003)(8676002)(4326008)(41300700001)(70206006)(70586007)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 15:11:21.4616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c6f9be-5490-440a-3a1e-08db0078bfc0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7030
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
V9: no changes
V8: no changes
V7: updated to use 'typec' for the node name
V6: no changes
V5: no changes
V4: added in this version

 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index 8a9747855d6b..3beb510996f4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -2190,6 +2190,20 @@ TEGRA234_AON_GPIO(AA, 4)
 			phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
 				    "p2u-5", "p2u-6", "p2u-7";
 		};
+
+		i2c@c240000 {
+			status = "okay";
+			typec@8 {
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
 
 	gpio-keys {
-- 
2.25.1

