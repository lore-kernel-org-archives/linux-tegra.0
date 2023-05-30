Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3701DC7EE23
	for <linux-tegra@archiver.kernel.org>; Tue, 30 May 2023 14:03:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232822AbjE3ODI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 May 2023 10:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232827AbjE3ODG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 May 2023 10:03:06 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2043.outbound.protection.outlook.com [40.107.96.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9E0F107;
        Tue, 30 May 2023 07:03:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyspZ56JcWU4E7GgcI0+XfKHmMcmLX5Ennd+/cpD6LB5+rgY/6edZyhGJaVQ9jVUYNh00dCtUevnR9vZjRYJ7L2sZPR9F0UEP4oe+JtW2glVJwadnVjSx04dlkfXGOnOA3EFfnepPeoUr4lfHtQdxwMtSdOHqxo+wK0apXW6wXV9cmSdEJY2LeDQ8+tRsiKOmfm/Tc8YINVbXWk7ucG1vqbpcLlUeBAM5ZZjCBgC9SZMsQyNarhT5xGRFrqqxmMsuu+7WOlBEVBweYuBRJrfS1vRj6msbcCOJ10Qt7jxpbg3+SMeisLvuYpcSGFpn+J2ZcvI8sLR0eYpzn0AwvnrSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xSFCSyZdxHeikizUTrNT7hBiJ2bBAouhCAbN2Q+5DA=;
 b=OnCU760vK8D/KFJjD6XXFMEMbgT3BAqfIggawalBCoi8+S0yDCVWbL2k3NHQ/2S1EOpPSNxPcxHgYlYNeduOalgutCEOjC9BJJC9KFYh+j/BJ2cnb4pi6nlGCUJ/OxFBhCw1czhMJTzaqBhPTpm6xhY2iXI7RZr3lF5WtSpl2D5SGDwx7PljCcu86d2zyQE6tKepewGlJxjFOSvxDnU9uLJY6GWj5TgRg4YxmkJQzItgEgP3MYsFQHLzkHRTvrKPZlXNWd+Sv7AAABydC8BNydI4CDof3L89/NTgtFhY38Dgk3DH648reSlWNYplf4HGL/pGZD0aVOppV2T2qR/5XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xSFCSyZdxHeikizUTrNT7hBiJ2bBAouhCAbN2Q+5DA=;
 b=upDOWiyNVylx9ByPRZstjdRoSG+dCUZsMmpCBnQ8GO30u9sJMBKx6Ubf9tSJ0mjb/9zZ/AKkpE0nFmxZosHK4ZLLlqjWvVp3hH5knbtYFddg+n4VEn8u4KV5CDgEX++z1E9mdxufX9k/shr2xilmyCq4PtApHKh/E5Wmxy+uZL2yibmm3fIuZHsZ+NKusMqcHoGeHAY9CcwMshyvSK4yTNGcI1GPuES/dRWP8fbMfp1WH2WyBQ3QRhkoXtS3w4ypZpTNyE06sCsiXuBBnVMpHBeOgzzpRrJ7/9oZOYw0NcfGJJR8lHK0F1LEAcBLhpQdzLH8moof6JuhrSkzy12iDg==
Received: from MW4P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::26)
 by SJ0PR12MB6991.namprd12.prod.outlook.com (2603:10b6:a03:47c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Tue, 30 May
 2023 14:03:02 +0000
Received: from CO1NAM11FT072.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::22) by MW4P221CA0021.outlook.office365.com
 (2603:10b6:303:8b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24 via Frontend
 Transport; Tue, 30 May 2023 14:03:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT072.mail.protection.outlook.com (10.13.174.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.22 via Frontend Transport; Tue, 30 May 2023 14:03:02 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 30 May 2023
 07:02:49 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Tue, 30 May
 2023 07:02:48 -0700
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Tue, 30 May 2023 07:02:47 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/2] arm64: tegra: Update USB phy-name for Jetson Orin NX
Date:   Tue, 30 May 2023 15:02:32 +0100
Message-ID: <20230530140232.53854-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530140232.53854-1-jonathanh@nvidia.com>
References: <20230530140232.53854-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT072:EE_|SJ0PR12MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: e4bd8fc2-661c-4f46-117d-08db6116952a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hCry2zf0HGKIgmETKNxuJ2f/fkIsYOX26PlKFedYcZvV2DJuMDJZ51wHZExBPYZo0tqxCVwhT42Q3IPS2jTiAwFR3omU1IJtBSYnDIzh1g7UmTW+TV3j0EtucPN2AyUF5YxEwP7SLcYaVRRbALTYwIb7rQENn2HkUzROHgcQObJQPlf0M0TXCWsQ9UpWtOwFljk4Zqjh6/7i72L2C0M7KS8Sm4CDpEbVRbg3zIcQzh0d5UyaP2fd9DrOadGlJgABRAWEzTLMQzdYarciht7HvmGkdo205bYo6wsLOQQrkQT+Czsosl0jNKFTFPHRwXAi1gmIK+nMKtbcVQPN4bWt89w+UzG8QgE3yQ2FZHUMkHPPYcG3K7K07bra2wd8PIneYq6i5uxFuyXGMrv9KvLpnwLViEvC21sr52Zm+CS4p+pyHF5zxiGnWUooZqXLf7qdyH3mwZaNwM+P6i0e5aW0I5iNFTMZg4SDMWuuL2w5G1NjS5HR0elNDnd5kV6tt1sFGihFI/boIccV8p4Zcsduk4MegnbWKG9qiDaI0FtM48NJIVMYxl63ZPaesDOhY+xWFS5vJNXOMNyYHE09RJBoRWBtpFQVoPrMoEdwGPUvoRh2gCx73JXMyOYY2YK+7toLBIFlORheUWtOa8pCfiDZFxwI6FckTAgiNEHSbGcBfZbAzfYs/P+8CeWQBARBElghfaVdtcWv5YAi80C5MNqpln3/TvY1UGV+kwDj2XCAexQ=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199021)(46966006)(40470700004)(36840700001)(5660300002)(8936002)(86362001)(8676002)(2906002)(47076005)(83380400001)(1076003)(336012)(26005)(36756003)(426003)(2616005)(40480700001)(36860700001)(186003)(4744005)(40460700003)(107886003)(54906003)(110136005)(4326008)(70206006)(70586007)(41300700001)(478600001)(82740400003)(316002)(7636003)(7696005)(82310400005)(6666004)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 14:03:02.1856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4bd8fc2-661c-4f46-117d-08db6116952a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT072.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6991
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Running 'make dtbs_check' reports the following warning for the Jetson
Orin NX platform ...

 arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb:
     usb@3550000: phy-names:1: 'usb3-0' was expected

Fix this by updating the phy-names:1 to be 'usb3-0' as expected.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi
index aee21428e1a5..bbd68ef93d97 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi
@@ -119,7 +119,7 @@ usb@3550000 {
 
 			phys = <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
 			       <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-1}>;
-			phy-names = "usb2-0", "usb3-1";
+			phy-names = "usb2-0", "usb3-0";
 		};
 
 		usb@3610000 {
-- 
2.34.1

