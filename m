Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4564CC25B4E
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Jan 2023 11:44:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233118AbjAXLoO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Jan 2023 06:44:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232664AbjAXLoN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Jan 2023 06:44:13 -0500
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2047.outbound.protection.outlook.com [40.107.100.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4966844BE6;
        Tue, 24 Jan 2023 03:43:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEDlYf1ADsDS1ULGWOBKUfLpegRVXN2xJXQrW3JTtm4fg+3cMaMsGuuqCjbSP868FQqHuOJvSswGp3u+3VkQwXfGUH0KIqoewdfd+7qIMRmmrPeXCX7fhXZxDI9oAegYpKGsyZRCyN4hbHHMM6gO5tQdbRnOSODqs07PRiXvOmBjqhVPKeRA1le6ZXAJFZ37WECrK4PCGCnm7OxaMEuzPnTKtd1+CFPSewYnExPQaHPyQfZjBOQmFB7ckiDoCA3Ym4wWS+2RDmPyOF3Ui5vfD/5or/+o81oLIkPzTTeiXcuSCbN63TwyXSe6o+Oq9Q3B2Y9FxtTgin3mN9ME/bm8+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1M3T3PH5qIh7fo+qhVfoz+sQrDJcugUVoDGCKS5eqyw=;
 b=SiUlDK5N99vzkiWzoaxXEtWNYyBavTo2uumpQqgsor6I88C+8JBcaAC2BPxC8gcvxJYnq/A+E+2bPZc40mzmCySAkJm0kWMKm0FoOzDOY5Mj5cBqdSyP9ZR5QBi00nRX+qkxrzQTmzDyuGcThmHJXK4zE/VL1+RUm2beBx9Yed2qfIJZDAmulZqSsMw1fDAfJ9y7iIOcH+S1hYMAeORqG4O0nOBNUcKuz0x/48bvGSz1WLgm0LvAfBPcRnAwPGHiBg7rhovTezBzKle8UjOa7GXslajbMikzW7SxGHMO//8wE+1CwXJFcekO7RkoJzcYANszsR1impDkmRWpt/EkMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1M3T3PH5qIh7fo+qhVfoz+sQrDJcugUVoDGCKS5eqyw=;
 b=ZE/6vBl3sgboklin1AHNT4teW8XOind5ekKOPZq41R70iL6DZ5aKLU9K+AfvyxzUidsTSQ7JPyyKc2I5mtgHloYrh/rln96EvZXJFwu4Yp23nvyeBdFAdLNKOBJtICp0wgf088LvwCAP5wn4/x32Qd7M4E+PQFzT2dTTP4KiZ4RcwVhOiqwitwTDWJLLljQHDd3YtBhqLoWN8SqwZGbGn4oc7tH5UPaFp6Qrw9E6PLHin3wz5i5j/CO+0UKK2Wnsb8o5O6oAXXmR8Wc8OgbDIxrJF1opqoTCDQyqBu3uwsXEHzFbpVQwoNmViL+5vBm1wsH0Wbhml7u4OT7aKPv3hQ==
Received: from MW4P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::10)
 by SA1PR12MB8600.namprd12.prod.outlook.com (2603:10b6:806:257::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 11:43:54 +0000
Received: from CO1NAM11FT092.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::b4) by MW4P220CA0005.outlook.office365.com
 (2603:10b6:303:115::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Tue, 24 Jan 2023 11:43:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT092.mail.protection.outlook.com (10.13.175.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6023.16 via Frontend Transport; Tue, 24 Jan 2023 11:43:54 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 24 Jan
 2023 03:43:39 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 24 Jan
 2023 03:43:38 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Tue, 24 Jan 2023 03:43:36 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V7 6/6] arm64: defconfig: Enable UCSI support
Date:   Tue, 24 Jan 2023 11:43:18 +0000
Message-ID: <20230124114318.18345-7-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230124114318.18345-1-jonathanh@nvidia.com>
References: <20230124114318.18345-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT092:EE_|SA1PR12MB8600:EE_
X-MS-Office365-Filtering-Correlation-Id: 55931245-41c3-4d54-c422-08dafe00453e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UfOI1PneeGUBe+Z5UzIyn4rhccMhAwD1/jHkqBtBV1c79UxNeBXdVyC4KJopAQ5j8b/1sQuP4dd/U4kfnLUfRhxkIuJ8zhYob25/G/6Ld/LX/U7ojvV8WOlo/ZIk72/NoB2dK1bb8yASUTLmq//caOvu9cpOkp6N/9e1xscJuBzHNIES5qT4KMR1HTVuJal88lXbrTnoR7xaBcAuJAuScDjHxr1uEmrmHy+PE2r2UjQY1FFt2wasAH9DD6RMwAvNXNu5XUtpD9xpAx9hPtr9tfd701U94RN1SoflObmFVaszFp7hZoXAcduNjsN+MHEwqFjXKrEN1ExfuYUyxL0VfC1HwGWjgakjBY0wCC2/2Fe+JbDcsOD/93Y2f9icIyR4UemspGnHvoT2Hw93yJIv6rnCreAVPaGG0+yNysp0oNuYV/aaDvZ/OM001BVrOY91pDZLS6vHaTdoak3qBvsgBmKJ9wXL9yvhCB7zn1Yn6Cv+XqcBJE1D49qyO6NqfHGpLTHq3QS9g7gJ18i0L93zlNWUBOvF1P5IuhzRh+HK6Rf99MuAFK2xGEcuV5bWFKiYmSMXXs8lpqRiN2AjztVcGryeQxzsSqzkT5Db4VhkxOjTXl9xiywuRBVeVrb+XSAYKJBkkgkAacGA0w2QgwKcxb4YrBJ9LoM0kjBXB8ibtryZoYRk0SNe4JQtK3OSYw/F7IZ5R2DwUBKKaeK0LTeujw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199015)(40470700004)(46966006)(36840700001)(36756003)(7636003)(356005)(2906002)(82740400003)(8936002)(4326008)(82310400005)(4744005)(5660300002)(41300700001)(36860700001)(83380400001)(86362001)(26005)(478600001)(110136005)(7696005)(54906003)(186003)(40480700001)(40460700003)(70206006)(8676002)(2616005)(316002)(70586007)(426003)(107886003)(1076003)(47076005)(336012)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 11:43:54.0449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55931245-41c3-4d54-c422-08dafe00453e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT092.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8600
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable the TYPEC UCSI support and the Cypress UCSI driver that is used
on the NVIDIA Jetson platforms.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V7: Added in V7

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 984553d55e17..d487d0e2b8e0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -959,6 +959,8 @@ CONFIG_TYPEC_TCPCI=m
 CONFIG_TYPEC_FUSB302=m
 CONFIG_TYPEC_TPS6598X=m
 CONFIG_TYPEC_HD3SS3220=m
+CONFIG_TYPEC_UCSI=m
+CONFIG_UCSI_CCG=m
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=32
 CONFIG_MMC_ARMMMCI=y
-- 
2.25.1

