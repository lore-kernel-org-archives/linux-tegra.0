Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89BCAC433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 09:43:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FD8264FFE
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 09:43:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232397AbhCLJms (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Mar 2021 04:42:48 -0500
Received: from mail-mw2nam12on2084.outbound.protection.outlook.com ([40.107.244.84]:62336
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232834AbhCLJmo (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Mar 2021 04:42:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGdkyi6AdgjFye8d1NMM7K9Nm59+TKetcstPB+nA/ZKkm6QjqJeqEymyNwgl2vHJ2dtVBlwvBMXFCvcuSm8K4YM8W3lltm9mMeY5kHsOosJ2LKVKCjjnFHIF4hzcfFIZhc1ZFFEeHmDwIDA13ASkcplYGfiO43ZF0F9tWU3pkfZyfS4SD0QT5gzGY64WFx/5eLWWG+rdxVtmPLzeptxiKPssXu8PMYYTfjQxjqgjEl6UusA8+MxE5UJJmNBa8OnzvRJZ7ngAkKTlYG323fEOOjuSZQwB11b86Ib+MJ4bfZwl+u3KH96ZgsoIAI59hG3DkyJx7oNqPlgR9/bRqUt8VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hke9NPXbOdJMQJO0nS+0euzk9jJ/CD//Lq32muEpah4=;
 b=fZM79LpIPM/jHaSvYvaVHv5s8UbGubJYn/XOd1rp/cssXMze3ibm6EYu/c6uFFmKELRgvgEJmKyVnguY3lO5gV7OVvMG0VKd/aCD5FFNcpumzwMZgFSi1qpLCHUkbFF1jI6IBuzBQOd1nBj9olZm5hryUacQYGhWuV13E8jWUSPioqYO3rT52i9Zyw2t6mNRGyTvOr5eU7biPv7rgD6v5L3z2U+U319qzg484TFpqTTHgSF6hJ7+uxHfqOSGU1ImBi5rL3WPdlvILiHxcXvkfs9+wVdgYSB40byXu5sHUw1f6fGnhO5pxeQ3lVNA3IChk+8P+pAfsFDSRhnWqboWqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hke9NPXbOdJMQJO0nS+0euzk9jJ/CD//Lq32muEpah4=;
 b=fUZXKMApKT90Llvt+U2TnbDd3cxawKYO6OmDe3vaJcJsFiDx+/Dffe5/zssDo4tlmOEDNW7efUDXEHMUjmxrxLYuNWgOY9kDqpp8CJso5Pswy+cNL9dTtss1NKCeiuthPDzL1g90cb6GOgnngMxkXZj0svmjwowHCdufqE6RJ/vHlxZ9OSSImhHisxruN7Kp17Svycmk03n5MZJnU7btqQjoBH7mhajcFBAmLaKiT8KnqLX7tvMH1O5ZWuJiz9COIsFI0KUx84ZEqqEuhXZtG+tm1F6++6tZfAFAA8SWSMf1JOod0nfP9Ewn3MYx5ZKue+IloLkxoq4ppuUWpqVUAQ==
Received: from CO2PR18CA0043.namprd18.prod.outlook.com (2603:10b6:104:2::11)
 by MN2PR12MB4781.namprd12.prod.outlook.com (2603:10b6:208:38::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 12 Mar
 2021 09:42:40 +0000
Received: from CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:2:cafe::3) by CO2PR18CA0043.outlook.office365.com
 (2603:10b6:104:2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Fri, 12 Mar 2021 09:42:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT036.mail.protection.outlook.com (10.13.174.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3933.31 via Frontend Transport; Fri, 12 Mar 2021 09:42:39 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 12 Mar
 2021 09:42:38 +0000
Received: from moonraker.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Mar 2021 09:42:37 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] ARM64: tegra: Fix mmc0 alias for Jetson Xavier NX
Date:   Fri, 12 Mar 2021 09:42:35 +0000
Message-ID: <20210312094235.755603-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e167d848-b174-4186-788d-08d8e53b2d0d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4781:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4781DA5C85771255E3597EC5D96F9@MN2PR12MB4781.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ylt7n8UDuA/1yrBPuTD5zk70g0/PJJOQA5OZIGiZ06/C1420KQIIJClFUzMIAlBvTwZaHWDFPiqUUQcVaE7dncFp+fy1PmVVR5x87vfKIalvReG73tORzZVZAZ6YugPFDd7dxKGXW+BnSoA8jdiyU+e/8qBqxGUKodhZ97/6a4PG2tvk1kbVzSeOtwNcs+abNete3ljtRMym1CvaMfSVmfCxj1xlmY2NkYPaftciRiwsgDYr3r/2tI3WRNbeiK3mlsTou4QuAJSgJ5pyL3tf76uAa2Wc21Yi8aLa9CVhy/eHFkpnUtAwLU0WiJvnpL8iOljzdGHp9Epb1tIHOjg/gqPtr3fkW8S1tbAFTSBqLbuWYzAs/9q74OHFH+1V37H8AbmnEfkoXW9W8ur6uqpOHqce8UppBjQaylwZ+7qtWC0IonO2DRhKd5uC0WEoKs57iIdPfpHdCg5amm98Zzsg8nrJddx2HKo5DcG45drgZ2Oam5h5kDAs8MQBw8Ps3Fxi0ssMLxy4pwARVAW3NhDT5UJEBdItpra9Yb/r0BuwwrxWhyxIfQ0F1NVLbz/+3C7hHaNJix0Eih1iMizAWtHLEJoVpYLAu8kSTX+qtXA8tHv1tuZagKPkY9GqydMReqtuO8reaHNf08hcSXEYNFyBczpFDhjyfqdso4XREZm7gwcruW1OTFDjwWXW/h0+A51e
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(46966006)(36840700001)(82740400003)(82310400003)(34020700004)(36860700001)(83380400001)(7636003)(356005)(36756003)(70206006)(70586007)(86362001)(47076005)(336012)(107886003)(478600001)(54906003)(6916009)(8676002)(2906002)(5660300002)(316002)(8936002)(2616005)(426003)(1076003)(7696005)(26005)(4326008)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 09:42:39.3474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e167d848-b174-4186-788d-08d8e53b2d0d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4781
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

There are two variants of the Jetson Xavier NX platform; one has an
eMMC and one as a micro SD-card slot. The SDHCI controller used by
each variant is different, however, the current device-tree for both
Xavier NX boards have the same SDHCI controller defined as 'mmc0' in
the device-tree alias node. Fix this by correcting the 'mmc0' alias
for the SD-card variant.

Fixes: 3f9efbbe57bc ("arm64: tegra: Add support for Jetson Xavier NX")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi | 4 ++++
 arch/arm64/boot/dts/nvidia/tegra194-p3668-0001.dtsi | 4 ++++
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi      | 1 -
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi
index 7da3d48cb410..14da4206ea66 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi
@@ -5,6 +5,10 @@ / {
 	model = "NVIDIA Jetson Xavier NX (SD-card)";
 	compatible = "nvidia,p3668-0000", "nvidia,tegra194";
 
+	aliases {
+		mmc0 = "/bus@0/mmc@3400000";
+	};
+
 	bus@0 {
 		/* SDMMC1 (SD/MMC) */
 		mmc@3400000 {
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3668-0001.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3668-0001.dtsi
index b7808648cfe4..f5a9ebbfb12f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3668-0001.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3668-0001.dtsi
@@ -5,6 +5,10 @@ / {
 	model = "NVIDIA Jetson Xavier NX (eMMC)";
 	compatible = "nvidia,p3668-0001", "nvidia,tegra194";
 
+	aliases {
+		mmc0 = "/bus@0/mmc@3460000";
+	};
+
 	bus@0 {
 		/* SDMMC4 (eMMC) */
 		mmc@3460000 {
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
index 4f12721c332b..f16b0aa8a374 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
@@ -14,7 +14,6 @@ aliases {
 		i2c5 = "/bus@0/i2c@31c0000";
 		i2c6 = "/bus@0/i2c@c250000";
 		i2c7 = "/bus@0/i2c@31e0000";
-		mmc0 = "/bus@0/mmc@3460000";
 		rtc0 = "/bpmp/i2c/pmic@3c";
 		rtc1 = "/bus@0/rtc@c2a0000";
 		serial0 = &tcu;
-- 
2.25.1

