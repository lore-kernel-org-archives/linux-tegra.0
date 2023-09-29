Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C48E7F156
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Sep 2023 10:28:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232833AbjI2K2H (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Sep 2023 06:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233020AbjI2K2G (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Sep 2023 06:28:06 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7908DF9;
        Fri, 29 Sep 2023 03:27:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THO26b0JMTqNAGa3iuELPeDjFBIRo2HiGZv4nsve5FH2fP5ZZhEkn4nL+Z21+MN6yOLaGGNnZ4Ghb6DEecErcJj5u2fXHRqAWeaGNpDGqmWhBfwtG0l+hrctIz4as3CIwWaMFB/oORyDaZg1pGVM5Icr5Cl7vnSgP93bjT7YgsMzxfTs02UnvX72AZgtl54/eM/Gnz6915/ZeYB+qsSfZD0/ZrXRoRwHmvXZjI/KPep0EixDKZvYV6eM5VorquQrVICi5UUwhsP60iItU4ne5OGZNKjS72ivlpzdRplE12eEvcZ4Y31KSsjb8+cGR0xWBfwhLQPng4XW18FY429fBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngnjLdBnya5+X7Sr+3/xU+NWyT/CKu0Xzq+FcuSc7/w=;
 b=IjLiW13PHlFhUAo5L/oX5S4Xnb0p/Fd3SL5w92MUjeiZ6Rh6akeV43mYtvrRW1bfks4Qx8tIdkyG4HHhRx6IrVo/nY6cCQIjXCBIQOooaYEC2MG9XOQkmGucIiMiqi8awMV0CLKC0i3iK4Dzp5PpOXkTJhcvevvhf7tvJ8xusgfEwHmW4rGiZw3rrO3Ii4mH6HDtLqJxFOU8TX9PIqw1D83Gm2gxjbmkJfzbi0xgNFMVemzuVHvmz5HDQqxIqG88GUjMohW9utBFxHJsDEWj9zaXPjqLE0IV2KFmDle5f40h3vCEqKA8bSa2ioLhdc9HMHqrSiEGooePsiDW+TdsFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngnjLdBnya5+X7Sr+3/xU+NWyT/CKu0Xzq+FcuSc7/w=;
 b=KjYebZEWk1heSrVv3sGJ6GacSLc2ADpBOoWbE3/atkFzKVjdaZEzlND30mcyRN1y8vtDV+lKvwZRHLOiRmxS+AUIgzIt8z2C1HoeHHhJfv+0G/FHqYt2NafAdeNV0SmPZoDxF9eaeNTqloxIU8XdvlglxNp/KeOomPqs+UQzRhLvHzT7wcPwvlyokGGJJUjM6JKBOPZFpujqjUDrXsFAU4aBQDwDdAc1l8OeQWSa3PJDRcRUvvl6P6j9OPkYdf2xr0ubTzKl82Qe8SfC9B53erGqhNREcjKfswZPWiJPNhzedIYGTR2h/lH2aBjAelKcRgz4ERfPiRmOqqdZ3ttIIQ==
Received: from CH0P221CA0035.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::22)
 by DM3PR12MB9326.namprd12.prod.outlook.com (2603:10b6:0:3d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Fri, 29 Sep
 2023 10:27:57 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::f7) by CH0P221CA0035.outlook.office365.com
 (2603:10b6:610:11d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26 via Frontend
 Transport; Fri, 29 Sep 2023 10:27:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.14 via Frontend Transport; Fri, 29 Sep 2023 10:27:56 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 29 Sep
 2023 03:27:54 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Fri, 29 Sep 2023 03:27:54 -0700
Received: from moonraker.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.986.41 via Frontend Transport; Fri, 29 Sep
 2023 03:27:52 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
        "Ninad Malwade" <nmalwade@nvidia.com>
Subject: [PATCH V4 2/4] dt-bindings: hwmon: ina3221: Add ti,summation-disable
Date:   Fri, 29 Sep 2023 11:27:42 +0100
Message-ID: <20230929102744.84989-3-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929102744.84989-1-jonathanh@nvidia.com>
References: <20230929102744.84989-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|DM3PR12MB9326:EE_
X-MS-Office365-Filtering-Correlation-Id: ee09c49e-967e-47ea-62f0-08dbc0d6bf70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UHuETInY0XEnNE7ayUHPb87VGyeKx0+cGhywoOJRCrDQjr7YDBHodGMYR9VBRg7i8JAU+G02ZsUco5CtM6fX4RZra8SFnpw8s0o6JOjpKmZ66mcin085+EqsGKYqoAGDlLyUxJqSI81PNGvu2TGZwKxiqWkoLrFS66N9rp17EZi+Aold+1uSncVHzcAY58FGbYQogMsWLgFQ2+m4ROZyN+5jXvkbK26TvGMlZikx6ZlhqRxTPGr1f816o4+fv3oB6S/QTi5WIYXZsD02EAjVO6cv5gY7SCEKb0bdjCrtYA7kr+P+ul54HvmW3dQ+dhq4N1TFZPLegIlLmPMxr2Ve5PgQE5grxQ15GkUYMXAhclTGSxKApzC62zdgkqCfT1J2BI3agBn2EVqlL9XUTSpZmeMc4OsZ3ltrxHVwI/j5s7Gi6BvAUrlx3HN+p1FlHzupnOQL4SGIh5cKH9p3qlPgjcYvUe1r0JzGkGpkuzB9eYzpwaFBGP2v89PcnpsDatztAKhC8+Wp/zyN/HyEp+936S3hKIV2NHZ3hxkU6IaixYT0I2/fEU5r7+JtDOePQ9WfxIAjw74y1PmDIDVKjYcpNLAGg73umEOSnYS/jk7xT/n2DHug7oHPamyeK9ojFoTFSQQG50UjTx4qSv/or/JkwQcBjyWQoeooGXXmeBmqUiZ8KmwMaaRxTvVYT1NGmTmzxTdZeI6yQwhl2yL4JFMe5OqLVivkrfVW6ZUaxpOr2eeTF08jIpXKxvpIG2ERyYJ+
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(39860400002)(376002)(230922051799003)(64100799003)(1800799009)(82310400011)(186009)(451199024)(46966006)(40470700004)(36840700001)(2906002)(36756003)(86362001)(6666004)(47076005)(70206006)(70586007)(8936002)(8676002)(7636003)(4326008)(5660300002)(478600001)(356005)(41300700001)(82740400003)(26005)(40460700003)(36860700001)(316002)(54906003)(426003)(40480700001)(1076003)(2616005)(107886003)(336012)(83380400001)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 10:27:56.8998
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee09c49e-967e-47ea-62f0-08dbc0d6bf70
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9326
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The INA3221 has a critical alert pin that can be controlled by the
summation control function. This function adds the single
shunt-voltage conversions for the desired channels in order to
compare the combined sum to the programmed limit. The Shunt-Voltage
Sum Limit register contains the programmed value that is compared
to the value in the Shunt-Voltage Sum register in order to
determine if the total summed limit is exceeded. If the
shunt-voltage sum limit value is exceeded, the critical alert pin
pulls low.

For the summation limit to have a meaningful value, it is necessary
to use the same shunt-resistor value on all included channels. Add a new
vendor specific property, 'ti,summation-disable', to allow specific
channels to be excluded from the summation control function if the shunt
resistor is different to other channels or the channel should not be
considered for triggering the critical alert pin.

Note that the ina3221 has always supported summing the various input
channels and summation is enabled by default if the shunt-resistor
values are the same. This change simply provides a way to exclude
inputs from the summation. If this property is not populated, then the
functionality of the driver does not change.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Ninad Malwade <nmalwade@nvidia.com>
---
 .../devicetree/bindings/hwmon/ti,ina3221.yaml | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
index d0e64a72af5b..d69f50d0e4ab 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
@@ -58,6 +58,25 @@ patternProperties:
       shunt-resistor-micro-ohms:
         description: shunt resistor value in micro-Ohm
 
+      ti,summation-disable:
+        description: |
+          The INA3221 has a critical alert pin that can be controlled by the
+          summation control function. This function adds the single
+          shunt-voltage conversions for the desired channels in order to
+          compare the combined sum to the programmed limit. The Shunt-Voltage
+          Sum Limit register contains the programmed value that is compared
+          to the value in the Shunt-Voltage Sum register in order to
+          determine if the total summed limit is exceeded. If the
+          shunt-voltage sum limit value is exceeded, the critical alert pin
+          is asserted.
+
+          For the summation limit to have a meaningful value, it is necessary
+          to use the same shunt-resistor value on all enabled channels. If
+          this is not the case or if a channel should not be used for
+          triggering the critical alert pin, then this property can be used
+          exclude specific channels from the summation control function.
+        type: boolean
+
     required:
       - reg
 
@@ -81,6 +100,10 @@ examples:
 
             input@0 {
                 reg = <0x0>;
+                /*
+                 * Input channels are enabled by default in the device and so
+                 * to disable, must be explicitly disabled in device-tree.
+                 */
                 status = "disabled";
             };
 
-- 
2.34.1

