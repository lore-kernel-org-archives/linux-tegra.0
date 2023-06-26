Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D28A7EB64DD
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Jun 2023 18:09:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbjFZSJ5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Jun 2023 14:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbjFZSJ4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Jun 2023 14:09:56 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D026A106;
        Mon, 26 Jun 2023 11:09:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mg2ilAEVVdUcB3qoFbn6NoChJg6UX9zqq5jK7MRfXnHkb75l1dV8fu5//sJaQfQnpJNfzOrDnpg10iMvMzao5J08IB6yFH8b9Jt4MWix2XXqi4L5zwjfSm/XTlXoxHw68ZvWhDbRzT8ekmQ9XyLpSzMA821MX8/RzSPj9L6t7D60HUwEmg0jPow9nRsTn+TeWDKKCZeqNyjxtjnifysS3K/UDoknOMeZnIPg64Bnkt07dant0i6SI906bnwhq/fGkxvtxZ8a660eCMXm1PJvJExuAV5ZDk+a/jUTpnERDkM8IIrg4zCSw6QuJBSSD+5ES/gTTsKZGKXMVP6n0F3/Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mnwzi6X5RK1i3rYqmBUKKk1wPuxLkmF3O/lrNd3b/3M=;
 b=KHVRUytzhhHteunCLHE3kOHb7S/KFJ87tDYlL2YbYJjxE2pdHIRsZ39EuMGgmSClTOiE5Re7eZhb7BCdNOIw2IjK88VB+SrLN9XDXBjfupOMmkeJXRs9FPM0uQQY0e5A1bMbOSHnLVPHHRABt6W6/EYZCQsGDOPR8Zu5R8pVCafZjoX0eksduVbULDbnszL7WBYHLmLcIx2g7eFb9brA9ZSQc2sUPDxDzvO6az084O4IV4XjtPL4B3hsot4FCheW5pp80StG1z9Rq6x21lUONu4s7Dkofhae/bBX8M4N09id5xee1zkgdM97lu9GzuXPGRHATj4NBwt8Aok8RUWqXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mnwzi6X5RK1i3rYqmBUKKk1wPuxLkmF3O/lrNd3b/3M=;
 b=TVoudgr+SYr3Mw/PtIvc8mXnqs5fk32JClB9H8PNoWxXVXdrBfjkE4gnAMsKvtHCRQ8Lw3TBAsP9Laz33hZopybs1zMkxCxHjUnc9dvoxBNdx9d2E4pOuLhcFhDhCYew/9C8v5GkerVw52ph2hKjQRwWi6J/q6U217uX3BRto/pexKYvRZ5YskjGXesDLmblshQFpDdP5yt3nwxsVUHIj9Eu0pakepbp6xvW7dpNLJ9skYo+E88kT+f6jHJgRIOKF6yxBfjrZ8KK/7/HcKCBqgughhcwOlKtrbES9AovUgyOoj43TFFSeUyHDuN0wP0CMBwmi+g1ZVN+lJAtaf8u0A==
Received: from MW4PR04CA0035.namprd04.prod.outlook.com (2603:10b6:303:6a::10)
 by IA0PR12MB8973.namprd12.prod.outlook.com (2603:10b6:208:48e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 18:09:53 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::ef) by MW4PR04CA0035.outlook.office365.com
 (2603:10b6:303:6a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.33 via Frontend
 Transport; Mon, 26 Jun 2023 18:09:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.47 via Frontend Transport; Mon, 26 Jun 2023 18:09:53 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 26 Jun 2023
 11:09:37 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Mon, 26 Jun
 2023 11:09:37 -0700
Received: from build-bgriffis-20230515T220707639.internal (10.127.8.9) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.986.37 via
 Frontend Transport; Mon, 26 Jun 2023 11:09:37 -0700
From:   Brad Griffis <bgriffis@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC:     Brad Griffis <bgriffis@nvidia.com>
Subject: [PATCH 2/2] arm64: tegra: fix p3767 QSPI speed
Date:   Mon, 26 Jun 2023 18:09:20 +0000
Message-ID: <20230626180920.318774-2-bgriffis@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626180920.318774-1-bgriffis@nvidia.com>
References: <20230626180920.318774-1-bgriffis@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT025:EE_|IA0PR12MB8973:EE_
X-MS-Office365-Filtering-Correlation-Id: dd2f0276-ed21-4ae3-0f64-08db76708a49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dqgtxjAEELRqZva+FrgMoxpcdMEnQcBxxj3MO9ZFXNs550dgEV7QKGZdVKxa0b/5F25tYMCqAgoGu7dejAEqqJS0EInFcypcCISGNVqMJT5MNC6iAOZkWTjIIttJnoex59N0VK+WGehgK4nCgBDXxcuecHWh0Sepz5epZ3DG1Wd/72MPdlo+8yanfLv9ByDpSnAGY17I+0rkwTNofbFSelyL1ToHVy2O+MS8eMFDNfLSw7nIurkWfDY+0JDTRzgszoboljho8M+6YB/ZoojRc8II4W43dB+Edix4K7v2msemxATefiauohCOCD+RIhNQy0Ez55s+OpECUO8Ceq05b2wz/dhnhxprNoFRgZY4r7OQINXQg4/n9mfiCohGhHXqjR9HBxC50NnGiQZ0sJe5tDTlqHzeDKAY9XmWTmiBzK4sZHJp4LDtsl6g6XFsi0i8v9gja3lEgMS7gaQ4XmfYS25K6VEYZ+tXJmwWfpSzDX0SftzuKMABqMqOaT5vcKMH2pupKv72RIP/vxd7/+HKhutQD+gTNMR5GP0uCYqdN+5wKSFQUArG0/Ioyt8yfN3xBHz2WlhWym1LDM41IVVYIQdnkcwhnjU+s0JBNDctkEhW/fuD0e81KtwdcpN/1RJeu2+HGgwewVGphHOlI1pcp6+bh2bLdZifsH24nZdi9P1ro76F7StPHl5KsLPNScD5VFTHJoFaYDU1rm5fiXKxiJ+UJ+9uCJe6xyTXO7gNWGqBioAxPitdKithg0eL/CNK
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199021)(36840700001)(46966006)(40470700004)(4744005)(2906002)(40460700003)(478600001)(82740400003)(36756003)(82310400005)(336012)(47076005)(426003)(110136005)(70206006)(83380400001)(5660300002)(2616005)(316002)(356005)(4326008)(70586007)(6666004)(40480700001)(36860700001)(41300700001)(86362001)(8936002)(7636003)(8676002)(1076003)(26005)(107886003)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 18:09:53.0578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd2f0276-ed21-4ae3-0f64-08db76708a49
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8973
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The QSPI device used in Jetson Orin NX and Nano modules (p3767) is
the same as Jetson AGX Orin (p3701) and should have a max speed of
102 MHz.

Fixes: 13b0aca303e9 ("arm64: tegra: Support Jetson Orin NX")
Signed-off-by: Brad Griffis <bgriffis@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
index 831a553ec387..980f15ac674d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
@@ -28,7 +28,7 @@ spi@3270000 {
 			flash@0 {
 				compatible = "jedec,spi-nor";
 				reg = <0>;
-				spi-max-frequency = <136000000>;
+				spi-max-frequency = <102000000>;
 				spi-tx-bus-width = <4>;
 				spi-rx-bus-width = <4>;
 			};
-- 
2.25.1

