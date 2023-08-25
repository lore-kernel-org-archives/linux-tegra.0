Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D9DEE49B2
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Aug 2023 16:44:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344059AbjHYQnw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Aug 2023 12:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344124AbjHYQnn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Aug 2023 12:43:43 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76DE8196;
        Fri, 25 Aug 2023 09:43:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXsWOc3Jz9D3VK8flopU0SQ07I9H2jYi9O7aQvGMvawuLcNrGG0eqI3rziaDGmU8Y8vvA9pC6qxZcmpV6hiE7wzKxV42zjoECNYeqHbPHxonBCVda+44vAXZK3+2yzrqvXr/JMXq90zaoWMZaYToQiCbVPpvgjZbfhywDozhBmVCl8B6BZU1LLKEA+CnoBJke9BvQ53NxtAGRq7Fy2XOSAkALp53EwMw/Eatkp46P3wlK6pRPfQL/86JissBFUV3tawQB/jAWdkl7bLfjkteHSE3jn6V3dw3gLjJbgRFquchFuUK2NGV41gocJw2Ny9beR+RWVTdDQ2z4UOv+emDjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7iVn//U8LB3QGgd28OLAICo2WU9Y/GE+U8nsmcz8fU=;
 b=IRZDsSNk8eVMT4RVc44Xe35aifJw5a8bRgXVthBOpiyvMjfOUD0BcKOAGAASH5F8H/DqkZkhTp6bsldOoNyfVfyHVrjUsTs1pvrqiSHp+rXrl6bch2zivGfumsn+ePsA1VOaHIqdFqu4qiUtDUxo7c5URQ4N7oPwDw3xCA+ZYWqfrrQ0riE71+orcO+FP2LBuDorH3+ug1GFz0QifKcCgS7OdiU5ngUNoDtUp4A5OAdcPNM36fOOxUP9UO3YyqJgOkD4W1ZpxUtorZo6GhU8Khhx043NTpqxuvX1USDm2e+0UVPKpsm+hawmdLfnqXMlplSS5GEdjjhMah/awlZ+Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7iVn//U8LB3QGgd28OLAICo2WU9Y/GE+U8nsmcz8fU=;
 b=MNWCb1IiZ3SOyJh1exOllRNhhHa5bDCqYorh85F9dh23rTWBAgW/AWWayBx7ODN2obJUzl0NcgD/gJBZ5lWHbTXta5tkQmShUqSVqpgk4V0bggRGTDcQV9yv7sTpF2ek2ThH/i4sfr48kqgllWobIW8fIVnRZ3zqzRNJmTPlZWI2W/E+n/aoqrDVmc1DrvAfclWiZowaeYBcvemJqHqegh+e+/NAluclRa5AZnW7MFvXvA4kpP3nhDxMgmCOZ9nfIA7c1kdYmGifCEuk1dkc5ckxeafihc/JTIR9cBRxyCHWSEd+EFrEESbOtWZr9eSbGzUy2xmmcsXunX6R5iab8g==
Received: from SA9PR10CA0005.namprd10.prod.outlook.com (2603:10b6:806:a7::10)
 by BN9PR12MB5355.namprd12.prod.outlook.com (2603:10b6:408:104::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Fri, 25 Aug
 2023 16:43:26 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:806:a7:cafe::e7) by SA9PR10CA0005.outlook.office365.com
 (2603:10b6:806:a7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.30 via Frontend
 Transport; Fri, 25 Aug 2023 16:43:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Fri, 25 Aug 2023 16:43:26 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Fri, 25 Aug 2023
 09:43:15 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Fri, 25 Aug
 2023 09:43:14 -0700
Received: from nmalwade-dt.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Fri, 25 Aug 2023 09:43:12 -0700
From:   Ninad Malwade <nmalwade@nvidia.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
CC:     Ninad Malwade <nmalwade@nvidia.com>
Subject: [PATCH V2 2/4] dt-bindings: hwmon: ina3221: Add summation-bypass
Date:   Sat, 26 Aug 2023 00:42:47 +0800
Message-ID: <20230825164249.22860-3-nmalwade@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230825164249.22860-1-nmalwade@nvidia.com>
References: <20230825164249.22860-1-nmalwade@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|BN9PR12MB5355:EE_
X-MS-Office365-Filtering-Correlation-Id: 51094fbb-c9a6-48c7-4688-08dba58a679c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Je50Tv7TCLF9VO2th4HubcuF22YALTDZ/QQI1/QjmEjjicAYxHS5sXo9nUQLiII5Qaw8t48mN5awntsduPuBD/7TC+yvbX29Q4bl1/6sjThpHqd5qxwv/8S6K6vUrAgumFeWzymQQXI9+H9fKJQyE3/Wlgq7yKV2003xNCXj+Mf5KpjcKMgt+fZ2JrXmBDEoeEYiH/Qoiphe1fC+vd/Wtlh55P/x47Fg80hJKpJYK4M7JNPjjqnXxCRVlhg9ghhsX/YlgRe7Fr62Q1ThVldbitFHJyRbvCNYkSiDY/VkCK6HU2UeCmPvmeIdfYfZei08WVWt5BF8ANexul6nGSmfFPzEIpDOJFc7xZh3WQd45xXfZvKU1mCHHDOvYvxi94gJ1FJ4Z8XBsd9/m09zn74nNUBiKnFolKg16VkruIQ5xvCHfYtyLEEUNWOjWKF2T9bfbV7BtD2FmMRVl9OnkC5ubcejRLv8pGnEnYHOxcmitU6rzy6twO6Jb9BZ8fInc6JEOBOoXI6ed207+Jxj414smesKjsANIwgd8p78YPqohHucKfrLJclWuXKq13Va/PssQxNvWbBhUkBl04QmTZgA129nV5GhdJOvXgdp9p+MF49oee88XFAk6jcyFimQZCIF1BATV7JM80fDulmjIr5oasbqzF4lRdzuD8YlCzpGFxic7i947eJtDKI7AewAbEWqeyQ0eKHKK29meW+bbVKTORNseCBVDdjPPm+e3gk9De8S9ePAHGrNLwFIcD2tFJUs
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(376002)(39860400002)(82310400011)(1800799009)(451199024)(186009)(36840700001)(40470700004)(46966006)(1076003)(36860700001)(336012)(83380400001)(478600001)(26005)(47076005)(40480700001)(2616005)(5660300002)(426003)(107886003)(2906002)(8676002)(8936002)(4326008)(921005)(356005)(7636003)(82740400003)(40460700003)(70206006)(70586007)(86362001)(110136005)(41300700001)(36756003)(7696005)(6666004)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 16:43:26.4015
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51094fbb-c9a6-48c7-4688-08dba58a679c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5355
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
to use the same shunt-resistor value on all included channels. Add a
new property, 'summation-bypass', to allow specific channels to be
excluded from the summation control function if the shunt resistor
is different to other channels.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Ninad Malwade <nmalwade@nvidia.com>
---
 .../devicetree/bindings/hwmon/ti,ina3221.yaml  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
index 0c6d41423d8c..20c23febf575 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
@@ -55,6 +55,24 @@ patternProperties:
       shunt-resistor-micro-ohms:
         description: shunt resistor value in micro-Ohm
 
+      summation-bypass:
+        description: |
+          The INA3221 has a critical alert pin that can be controlled by the
+          summation control function. This function adds the single
+          shunt-voltage conversions for the desired channels in order to
+          compare the combined sum to the programmed limit. The Shunt-Voltage
+          Sum Limit register contains the programmed value that is compared
+          to the value in the Shunt-Voltage Sum register in order to
+          determine if the total summed limit is exceeded. If the
+          shunt-voltage sum limit value is exceeded, the critical alert pin
+          pulls low.
+
+          For the summation limit to have a meaningful value, it is necessary
+          to use the same shunt-resistor value on all included channels. If
+          this is not the case for specific channels, then the
+          'summation-bypass' can be populated for a specific channel to
+          exclude from the summation control function.
+
     additionalProperties: false
 
     required:
-- 
2.17.1

