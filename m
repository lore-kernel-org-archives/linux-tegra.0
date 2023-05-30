Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 469A2C7EE23
	for <linux-tegra@archiver.kernel.org>; Tue, 30 May 2023 14:03:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232815AbjE3ODG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 May 2023 10:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232813AbjE3ODF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 May 2023 10:03:05 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C91F3;
        Tue, 30 May 2023 07:03:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJOTtQfhsknBChqIgl251HXqa1z9xxsBuDEUh4rNrF2kCxpXZByEzbx2vgA+JgCbIeM5wRuBcqGX3Uh6e2d+2heOCv6mbRpiQZn7uUgc+jy2Ojw16dUBJmQlu5pTmKvvCe+lUkrI3VgvmgeK04rBM7jPkxu9AcjCvFKcsB7pC+4GS/G4D04+llurWBH14I9JKvkppnqBgprD/JSth9iKot7RQsaG74EB/HF3Tau06cHWd2FdJ1EBQ67p3VvkHFmc3yUuDsz0hppFZhZQiyZk2fFpLHQNihmLzvn8KQyDEh1pDzwCsP9fgqZWzpLwz/HTyw57THp4j/m+CStIosxruA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yL0uRTe/2lCHsE6oqof/xZeoInQiBPILVlntryKTfw=;
 b=lkUKMBQCPsSIUUpWqyNHiIcaIkartpO9fgWNVcKUEQRsYl8+OvIDpQaBHj3c6ci7w1tsHyU2WxXT0/0Pa4Vi84DLVbg84nM38wfZKokXqw7HpnJMk+pieVIsTeC8WN6fpeNw00/oCX9gyl/djbe/VwZwv1ZxhMN7OTuQBIfXnStvlQQCjORMbViuelHafuJW6zdCwrPpvZzfMm8YsgGtQ1+6hpKgoRB+r+kgT5tSshvOCfjN5GEzxaP34PwOkD2e2PKoQ861m5k0LOi20Cl0dXgmscHCCpvp9J4aCnmm4BfNbHHb+jbm8+lXWHeG/KzWo/Bp4qV//boZOuMpJddEhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yL0uRTe/2lCHsE6oqof/xZeoInQiBPILVlntryKTfw=;
 b=JsV2ox8vkOMjBmqCJAFPxg2YW3ZbMhYoa4nubX8AiVbqHjxHL1EjjEipaKM64Qq2Kxsh7aGJzDn0KYlxuXVQQjppPN5OH9dSbYlyhINcx9Lq6YgsDMz0V4QUsBMue7uH8e4OjqC5+BVbYWQwV53BtzDaMqas4Y7gFGXy69PmSrJRRa9m8NjkUeY/FcpOWc/wVXTledB9qylXcnSztXIGygMPWawvKB24iGAzWs/oMizP7avu7d7Uq/x4ZQfKE9rcLFdPJhcLcfPROisk+JKUj1I5IYd5flxuy5C3HUHdtppHZxkAunD/Fq7ggwH5+1IuOkr7sidveYqdVjzm4bvoDw==
Received: from DM6PR14CA0061.namprd14.prod.outlook.com (2603:10b6:5:18f::38)
 by DM6PR12MB4450.namprd12.prod.outlook.com (2603:10b6:5:28e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 14:03:00 +0000
Received: from DM6NAM11FT089.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:18f:cafe::5b) by DM6PR14CA0061.outlook.office365.com
 (2603:10b6:5:18f::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23 via Frontend
 Transport; Tue, 30 May 2023 14:03:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT089.mail.protection.outlook.com (10.13.173.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.21 via Frontend Transport; Tue, 30 May 2023 14:02:59 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 30 May 2023
 07:02:47 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Tue, 30 May
 2023 07:02:47 -0700
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Tue, 30 May 2023 07:02:45 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 1/2] arm64: tegra: Enable USB device for Jetson AGX Orin
Date:   Tue, 30 May 2023 15:02:31 +0100
Message-ID: <20230530140232.53854-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT089:EE_|DM6PR12MB4450:EE_
X-MS-Office365-Filtering-Correlation-Id: 35eea482-138a-40f4-8023-08db611693d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1LRBZz2o/PwTDjjVHiCpc/i+TVeURxK2G7R5UesU9cuJfyaiEGuC7vjm3pZiyhZr81TYkmHZjUUAJ7SrwKaSRSXuHvZeQoPAbX822U7NSM3xcVsFbyh6Dn5PzRArC6+/fatTHdrU91peDbr7GL4IgogEmbqdCAH9GiviywXM/Hl154oS3dLs9c6GepDZj1mvoNqfJU8b+iP7NMh45nFtR0PLalTy+7yvErSEnuy+laCAc73IbcC/8lfwj2Woip4OCydtnDb+ZStTPeXh7cxcUmXIXQaxJn5nKO5cmi1LN073iWH2UUEB5TnUg46cZYCeLxrmRJh5hxBZICVhKIaIomvzCOBzZIW7GsQNBXo0GbqMYXfF4elPlsWZHzf2Hgj6pTNmEBts8e9Y21ncqantL7RzG6t/WDQSnB+ZKCvF3ZMbAtmjY4KRLdxYpdsD3CF2Zdw6I4VKwbScG5KpE1fQ7yvFB3+fWf6btKDUIWuIVoENm5VJHNs2lxUnMzozEpB11MXe8GnBYh6kzQxLRh7v1FBk46gx7Jq4pTX4dw0yPXML6e/VPqkPd4D88CHbR+AKcKBZ+0tdmzmBrYoGuJgJV1Qumjm2MwPE7WeBGKRmi3iKtLnafoheQYqnj2ivhpfoL+asY/sxGFZpSWUHtjWBp6385LkxA6GrUm6jj6Gkqfo5FfxTGVqsN2NQZDmVEvZdXjP2EvQXK3bTRrFUsu764REFLjbc4s5/WX6RkypJcbVIEQVpzUZRENG9tFWrdzFn
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199021)(40470700004)(46966006)(36840700001)(36860700001)(40460700003)(47076005)(83380400001)(86362001)(5660300002)(70586007)(316002)(6666004)(70206006)(4326008)(82310400005)(36756003)(107886003)(82740400003)(8676002)(7636003)(8936002)(356005)(41300700001)(7696005)(40480700001)(110136005)(54906003)(2906002)(2616005)(186003)(426003)(478600001)(336012)(1076003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 14:02:59.9265
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35eea482-138a-40f4-8023-08db611693d8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT089.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4450
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable USB device support for the Jetson AGX Orin platform and update
the mode for the usb2-0 port to be on-the-go.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts     | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index aacacfe4a6ea..5b4f4f3ae34d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -2096,7 +2096,8 @@ usb3-2 {
 
 			ports {
 				usb2-0 {
-					mode = "host";
+					mode = "otg";
+					usb-role-switch;
 					status = "okay";
 					port {
 						hs_typec_p1: endpoint {
@@ -2152,6 +2153,14 @@ usb3-2 {
 			};
 		};
 
+		usb@3550000 {
+			status = "okay";
+
+			phys = <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
+			       <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-1}>;
+			phy-names = "usb2-0", "usb3-0";
+		};
+
 		usb@3610000 {
 			status = "okay";
 
-- 
2.34.1

