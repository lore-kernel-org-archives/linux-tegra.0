Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB894C001DC
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Jul 2023 16:07:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231695AbjGUQG7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Jul 2023 12:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbjGUQG6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jul 2023 12:06:58 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2078.outbound.protection.outlook.com [40.107.212.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB2CB2D47;
        Fri, 21 Jul 2023 09:06:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fB0qZbbpEMh1leGTzUEbalAHIgr2Uh8jaDGx6MbrCw7GaKjUa1aEwkHx94KekX/11vk6/C8N9W7Qe9n1Ed3hw+jDoS1fZGFNKIoGywJDilAVkRz8MzbRDGnS6PaghxfPWzhitl2VwxMmMzYQqP1qAaiymvNbQqviK+8LqGa2F3Ys6EggiwCsbqRqEwoujTCV4dfiZ2CJtTPE6J4okA8mky8zVCkoejMXX8ziNx7ODxlW51cQsT6/UyguuIEy3Uczsg+ehB4u897KQr5htZXB9N/ga9lAKxsqDQ45lsO47Zg0oTH32DgvLB4jOuRMuVgiy4ERplnUeyqiiRT2wyoSFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBZ5BCOBkjsG4izgQS79x/+rI2UUsmTH/Qgvg2mWlnA=;
 b=a9ARbJiVMOhqCdoIOSKbNc26ZZRPnwZ5Nu33VhnOH0RIcZZnjGRvwYAfuM0IJYvDolGF/U/ON8wCBbgzgrtyGgBW1DQkDPjKBbE3n9zsXbB9PUA3ivJiUe16I+j828o2dZLtnsQ5CX9uUuWFJ8lxTO/0IevVanD/vYesU1qsSWSjWxkmMhWDq9gRvUvY2SJSRMOQnLL81LY6oNHPrs6DC0ofqPriBvNESI2FDm4IFHLIyl7mX/F8jevKz+oatD2wK2woxaPhbWFk+oVxsB0Wv0W1SVEeJPAuADpcy9B5IR2T1tXpi/Kz/aPzLk8nOuArRgWUZsL9E5OReY+PycmiQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBZ5BCOBkjsG4izgQS79x/+rI2UUsmTH/Qgvg2mWlnA=;
 b=c6ZAVwG9jyPWdrxrB5a7H+hnarls8ksxAvPNUNdsSaZwEmJqK4/JKOhtUj5DaW7ElemCWTnbEDYgTcGpy6OjdMHLMHiokpcCuFLFAjDOII3ApCAZF15OYSKGLK7oFGuaceAAP1ftv91d1gvatE9u5BoYH1ruoJPqrcmj1X8SP4IG8vWH0fYiKW2AGkVNh3OG5fp8XoDsN7ZyctKY9RGJye2fkXLVy4f7zi9NB4wmhgcUY0h1arvvxq/yNB3w0tbPYDligueOI12GBfo1J7vP46hm0we08+nvRluj/fgClKjjRq18nRB8aoz6xJNz7KCnPeoP9bm+hqLnnyJfOEwZeQ==
Received: from DM6PR07CA0058.namprd07.prod.outlook.com (2603:10b6:5:74::35) by
 SA1PR12MB6749.namprd12.prod.outlook.com (2603:10b6:806:255::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Fri, 21 Jul
 2023 16:06:53 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::ad) by DM6PR07CA0058.outlook.office365.com
 (2603:10b6:5:74::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28 via Frontend
 Transport; Fri, 21 Jul 2023 16:06:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.28 via Frontend Transport; Fri, 21 Jul 2023 16:06:53 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Fri, 21 Jul 2023
 09:06:44 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Fri, 21 Jul 2023 09:06:44 -0700
Received: from build-gauthams-20230504T093912783.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.986.37
 via Frontend Transport; Fri, 21 Jul 2023 09:06:44 -0700
From:   Gautham Srinivasan <gauthams@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC:     Gautham Srinivasan <gauthams@nvidia.com>
Subject: [PATCH 2/2] arm64: tegra: Enable UARTA and UARTE for Orin Nano
Date:   Fri, 21 Jul 2023 16:06:37 +0000
Message-ID: <20230721160637.3479801-2-gauthams@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230721160637.3479801-1-gauthams@nvidia.com>
References: <20230721160637.3479801-1-gauthams@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT023:EE_|SA1PR12MB6749:EE_
X-MS-Office365-Filtering-Correlation-Id: c4f3c3be-7b24-4ff2-78bf-08db8a048016
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PqGiRAqTJZPsSyQ35kS+Zki5RD0o4cg3U9Cfc/85m6VsWiOUCAUPEUJ+eHuy2ECOybMaAEhvs8/QhuhFIX0nXjE689Lm30pjEqeQRtYTT6JNaLMqmIzFtbM8VOKx0LgoK2ibxhE5SDXAMVIY1+HMtv5sw4Pk9DyuAOWImGXtfhsNZ6j7e1wOMqgdBg1ulc8DXu08hg+04BnEHcjJAWuxU44aqFk4Zo3f1XpkD5qKaZHycgpewK1K44wsFETsU0sF3P7NUPTOhY8vR/LML7Ndm67f/4ehhMMcoDsYI3dofQWnCvd1odBhgrxXEF+mnOxdZZZXP3Pi8YIgwrR69+iu5PEtznb5fDvOUW9kZIGidF/2rIEfc2S5Kz+yiQ1FeCbCZUNI2muMTQCvH7LOCz/5bLITXgg2xYMriqjWR6hovoAXbY2jDZSoCB08UGfOJFApryXxM/uz+J7FKrMnWupoPrGQgTh6nAFdSA+shrOeoGcrPEUM10Qm0Z42PvJ7RVwwE6XbcRg7FUf7cJyHky9MoXc41jcs1h0ygYWx2QLLJNuyhVQTvs8ebyMaP3XkQv0zRF/gChjmhUtqTvDL15qZX5EKAGsO8xTLSnHIHFNrK7bm03wSof+AF9Y4XQ/MNWVA1S5CWB4ILBYq+Bey8rujODybQcOfQ0iI8ZRuQJhHIZTbnKSF3ATOqCjSDHy+CMCdDc9hTIUHFfz7ZO3nku1AF6PSprSVGl78VFGZAAa4gxA7cAy/pmwV0N623rUheThQ
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199021)(82310400008)(40470700004)(36840700001)(46966006)(47076005)(2616005)(26005)(1076003)(41300700001)(36860700001)(316002)(83380400001)(426003)(186003)(336012)(107886003)(7636003)(356005)(40460700003)(7696005)(110136005)(478600001)(82740400003)(40480700001)(6666004)(4326008)(70206006)(70586007)(86362001)(5660300002)(36756003)(8936002)(8676002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 16:06:53.5265
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f3c3be-7b24-4ff2-78bf-08db8a048016
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6749
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Activate UARTA and UARTE functionalities for Orin Nano.

- UARTA is accessible via the 40-pin header with
  Pin 8 (TX) and Pin 10 (RX).
- UARTE utilizes the M2.E connector.

Signed-off-by: Gautham Srinivasan <gauthams@nvidia.com>
---
 .../dts/nvidia/tegra234-p3768-0000+p3767-0000.dts  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
index 2f1a7feb9e09..4cc67a3a08bb 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
@@ -13,6 +13,8 @@
 
 	aliases {
 		serial0 = &tcu;
+		serial1 = &uarta;
+		serial2 = &uarte;
 	};
 
 	chosen {
@@ -20,6 +22,18 @@
 	};
 
 	bus@0 {
+		serial@3100000 {
+			compatible = "nvidia,tegra194-hsuart";
+			reset-names = "serial";
+			status = "okay";
+		};
+
+		serial@3140000 {
+			compatible = "nvidia,tegra194-hsuart";
+			reset-names = "serial";
+			status = "okay";
+		};
+
 		serial@31d0000 {
 			current-speed = <115200>;
 			status = "okay";
-- 
2.17.1

