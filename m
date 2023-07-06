Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BEFEB64DA
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Jul 2023 00:56:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbjGFA4K (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Jul 2023 20:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjGFA4J (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jul 2023 20:56:09 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B7611995;
        Wed,  5 Jul 2023 17:56:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOLG8m9IRb00xlWQWbOZ6KBPtaqeAPQVmu2fJ48oq4w1Xl/HyIXHGc3rQeak/mZIDgB7c24bC6tKMzWs3aw13H4zpDuqOExPE2W8OmC139A3rmgZ9xQECCq9ZA+93eMKnecDnQERtNvDeFt6fPylYfC5FuGxYTktCx07VO6Yy0vPIhp4cXaiABHNTpTNKYkU+723REnfr9O7c5saNlee5sOslUTsGE1B9zm2hVIC4LfOj4YqKXlIrFE9iGNZkWVox4v/5tBfwN3A7qrWsW7aWqLh3eELztdwGWd8OvJaGbGBM5f/zJN8DBENbQnTkQ17PTZ5wlFf0IYMu+rTKAMUxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkRqfPUdP4+DH8eg32Tzj/APeJFaZPGSC327wWPJgSw=;
 b=eFY5PZ28a1T8lXGKBkTA5xe5AUk/L3mI/ikluu3BOViLz/EgoyunZOtBr3U7Aslasidhj3v8FVQz8m0jzERfH8NX8sGZ0NLgYk/Q07kIrRX8I21wIxT1yT55hC+3mvipLi8zZPBRE+CgAl8U7xHe3r6JSJteFDRBXReEda7fGY2+rzMzH7eh0E706RawoFatqmWzbFy03iGurxgVFr9By6rV9x5N0Rlz+wF3ZF+xJHTaAFHvVeokJcIU8jFPQftG8csym8laQuQGfdDcYw93ikgjLAiV+6dn6IKTRETTRwdnB93ah5SSfKofEIsLfjcIM7V3Fsn/cOMquSL20qJEGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkRqfPUdP4+DH8eg32Tzj/APeJFaZPGSC327wWPJgSw=;
 b=NeSWg7FMTBNH8spn79wzPeqTEtkDgmDV7YiWDZ6rfBYX1OD/IWMaCkAICwCMtLQI/HSnRPOEdkdsKgQGZyyzdTeN/aiqXFgZqElBLhQcJySotcXUhJzKiZG/x3yKfhh90QSVRqC7xp+YVObZOymRFD5CuucmSboooJbTxHHeGSSmAoW9xpJfkK/Tv5WO5CIPHZzY+XpmY6Y8CGgfnlgD9CqyGsvUFATyMLsgrMEYSxAMjnqq2HiOVhU+jsvWrfTg0k2WicizhQHE38MH+itSEMQGR8lt3J25yxcecBG2A5fcUtYackJYg0i5bzSSROiosrirqA1J1fON/XPklQdxqg==
Received: from BN9PR03CA0624.namprd03.prod.outlook.com (2603:10b6:408:106::29)
 by DM4PR12MB6109.namprd12.prod.outlook.com (2603:10b6:8:ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 00:56:04 +0000
Received: from BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:106:cafe::f6) by BN9PR03CA0624.outlook.office365.com
 (2603:10b6:408:106::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Thu, 6 Jul 2023 00:56:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN8NAM11FT027.mail.protection.outlook.com (10.13.177.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.45 via Frontend Transport; Thu, 6 Jul 2023 00:56:04 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Wed, 5 Jul 2023
 17:55:55 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Wed, 5 Jul 2023
 17:55:54 -0700
Received: from build-gauthams-20230504T093912783.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.986.37 via
 Frontend Transport; Wed, 5 Jul 2023 17:55:54 -0700
From:   Gautham Srinivasan <gauthams@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC:     Gautham Srinivasan <gauthams@nvidia.com>
Subject: [PATCH 2/2] arm64: tegra: Enable soctherm for Orin Nano Devkit
Date:   Thu, 6 Jul 2023 00:55:45 +0000
Message-ID: <20230706005545.1813584-2-gauthams@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230706005545.1813584-1-gauthams@nvidia.com>
References: <20230706005545.1813584-1-gauthams@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT027:EE_|DM4PR12MB6109:EE_
X-MS-Office365-Filtering-Correlation-Id: 40867fbf-eacc-41cc-4c87-08db7dbbc669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lI8zrt4thYbtiaYkoXfIhJ/U6+rMpCoX04oEmsq/+PS7xbW5Zs+m3gf4pwc3gQ3UD7KWe/GneiTJLvmupZYSDYCXyyfQuO2WMzteyuQEo6YzFJwyVffdinTT9JcVrNYk3rFA8Sh012yMO4LGoUGspkaU1SlZM7SNWDicwepWTbW2rISnwDitwjnghSoEV88Y1A1ZTLxcc9ZpDWVkXvhNqqvfyEeA518/Ep5uR/075YSdl3j+NcUdK5P7f27kPRD7xNeHfAwcabYacETsw6CiXf6zNA+VVjwMzNEceUot1xtcdycOoH4awmUeOFsrAhlIo7WXUHJktnXNa0xqkBKTEnyHr0HzOhXfW18EEPAhXgn2SZEykMUAhKjG0yuNkyOxoam5c9LHk0+v1fyOrzkOTBEk8H33mDNgnFrPQh6M2h7mZSkoWD5lo2VJKrBhqc3AWyedt5vu2qjR+y+re3qhJ94T+utUZBmZJv8uBN/1cYXZzoSbLuE9GQN6v70ZlmfnuknDybg1oYHiarVHVqYRoBGk+/R3ve4XgIT4K2rLKCSj8LQaJP/lN0wf1QdRihmNQzQRqWsnwB6XbOQTeCDzTd14VnrfixuJtfst77lLuOHlIWMzaMkV8/Xq1ZhL1tN6UQQT8MKN4YbvGZuATn0EdNafz4YVHP1h2p2NgZgvWiUE7v5DdSuixNk4nrxkGJ530qo5rcaI8cj96NvbuQnh4qmBW0PHOmAzqddKjeizLI/MmhoqfS/AhuVJVLFDmq3p
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(82740400003)(70206006)(316002)(2616005)(70586007)(5660300002)(8936002)(41300700001)(4326008)(356005)(7636003)(86362001)(8676002)(40460700003)(40480700001)(426003)(82310400005)(36860700001)(2906002)(107886003)(186003)(1076003)(336012)(6666004)(7696005)(110136005)(26005)(36756003)(478600001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 00:56:04.2171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40867fbf-eacc-41cc-4c87-08db7dbbc669
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6109
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable soctherm for Orin Nano Devkit. This is needed for the CPU
fan to operate.

Signed-off-by: Gautham Srinivasan <gauthams@nvidia.com>
---
 .../arm64/boot/dts/nvidia/tegra234-p3767.dtsi | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
index a8aa6e7d8fbc..cb76b08e15b9 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
@@ -98,6 +98,12 @@
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
+	bpmp {
+		thermal {
+			status = "okay";
+		};
+	};
+
 	thermal-zones {
 		tj-thermal {
 			polling-delay = <1000>;
@@ -118,5 +124,37 @@
 				};
 			};
 		};
+
+		cpu-thermal {
+			status = "okay";
+		};
+
+		gpu-thermal {
+			status = "okay";
+		};
+
+		cv0-thermal {
+			status = "okay";
+		};
+
+		cv1-thermal {
+			status = "okay";
+		};
+
+		cv2-thermal {
+			status = "okay";
+		};
+
+		soc0-thermal {
+			status = "okay";
+		};
+
+		soc1-thermal {
+			status = "okay";
+		};
+
+		soc2-thermal {
+			status = "okay";
+		};
 	};
 };
-- 
2.17.1

