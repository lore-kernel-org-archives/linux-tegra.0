Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF3BE80A98
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Sep 2023 10:37:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233041AbjI2Kh3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Sep 2023 06:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233046AbjI2KhO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Sep 2023 06:37:14 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 887EB1B1;
        Fri, 29 Sep 2023 03:37:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9m2AC9CtpGwOLnTVaCeoUQcGPJQTe0qwEjyjppQtp3qWqeIoOkJV9VG8ewRNWF8DexR5LkSzIWzdeclo0uibkmKAqUF7gquzqjv0LzoKNStaMlfmUC/zWaINM4JKoNlQloUiu1Y3ZBHxD+M4ytZLuzX+eXDzNK4+G9e0jz3H5YnDt2WY6pI4jjTBAeLdp7CzAowLRJwnSGzzAuwsbRctWhWXBkZxMmm05OiK6qjjRH+Z+6kKb9Dgp7ynN+Bo5o3jI1v6K1LOp9eGRQUVo1I/GL/lvw45seyvKpm8Thlj/5wuYlU4/V6MKmzgGeEE3/M3+DhMIRU9yrHOEEZ9Wx6lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkR3+BXDwUV1HYy5UVfZDM1SuhNeuEsRGgQfCgwsU7w=;
 b=KhsEKBMWRJXpXnMytYq9juzYUQbWnVft/dE4fiwbr0+P7PEuQ8VqqaQt0ZQAjX0ScV76q6hy9KPhK6hTwAO60SaVR5lQ9kNLxADnxR+mCM+5RN5HFRcMhY17Qgt4PMnkJNE70lugwgtp3vy0WKfVxo/D2EdiQWTbLSHV8Rke8VkPcORw1/loKXbUot5ejVuQ0ZC/tNAVlb5fBNKrxtrcZg1k50LhEJ/zaaEaPdE0IREOJSOd4OVS7jxO5qZ+uR4KlkqLyJXK6tAEhpQ+F8Oeejr3x79Q/rWfh0KD5x83Snuf3aWkDUBp6XVvytj/v30yUM7FdE4cxvWM3V/GDJUtHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkR3+BXDwUV1HYy5UVfZDM1SuhNeuEsRGgQfCgwsU7w=;
 b=tMyjJu4CxYD21KQdorPg8UREA7PEv0eIsKkrOzaZj1WjUtFtD/Q04w8OldGlUrnnfuOVEOmp3ycIUIv33AhYFzJsjFDEj5CNDUACp7iBxqgrS67Snkd+oc1yB5TnCWlu+M65M8HL+QFLo85DcyX1/H6Cd72iTRGPl8TvnqorjdKiVeSLpJzle9X/R7Q0xeoN5Sg8L1M5nepCBTHtqyZbeYQlwdJ3yNgB8NOPCAeO6ho4XW0bhwLTTu4OS4QpyjoEGy01mYDTTyr+caUqcPLdQ+wNX9OYgH0jD0kFdFM/uHfSTg7NLT/zG4UfbTlODExevOS37hypN3Wg2h9sj1blXg==
Received: from DM5PR08CA0034.namprd08.prod.outlook.com (2603:10b6:4:60::23) by
 PH0PR12MB5482.namprd12.prod.outlook.com (2603:10b6:510:ea::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.27; Fri, 29 Sep 2023 10:37:09 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:4:60:cafe::3d) by DM5PR08CA0034.outlook.office365.com
 (2603:10b6:4:60::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26 via Frontend
 Transport; Fri, 29 Sep 2023 10:37:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.80) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.19 via Frontend Transport; Fri, 29 Sep 2023 10:37:08 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 29 Sep
 2023 03:37:00 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 29 Sep
 2023 03:37:00 -0700
Received: from moonraker.home (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.41 via Frontend Transport; Fri, 29 Sep
 2023 03:36:58 -0700
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
Subject: [PATCH V5 2/4] dt-bindings: hwmon: ina3221: Add ti,summation-disable
Date:   Fri, 29 Sep 2023 11:36:48 +0100
Message-ID: <20230929103650.86074-3-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929103650.86074-1-jonathanh@nvidia.com>
References: <20230929103650.86074-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|PH0PR12MB5482:EE_
X-MS-Office365-Filtering-Correlation-Id: a9b1f9fa-b9e5-403a-cfab-08dbc0d8083b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xZJge4+iJG062HQbXFQkT1bNbfjwoYQvwt3xtCNzpUBX8ZtJkNO/YBWsWT0XUP/HBgadfTd9Bu5van21okyvni9CHSQvTJnVGxmgOfkohUkdiQ5O0MtfkPBh4lh4VgFUGHlpoB1Zd3mc/QeM4wyd2F/+6dy80SlMrB0e0g0roqlr76a+H/HgGlk8E+qa0x6EFd1y02ZQKDGckjmygskw4H7YgOE80D//CbO4UcGAyHS61DdAPp3SgSPYuB86G6U3ksVsESirOxkl1kveyPaF2T/Jnm4Wut3NdOirYpj1pvlXG77M5QtdeXlJc4+bzDGY5+jI9PJVC1SNFOGfOuEhRNJwqofXOMW/syoMLy6B1qJgNmMbGWW89n6kuq85TkXrFU1oWaU0xdDxybPDpGolF9oV6xqOcZ3LzxtO6TfQq1bSmgnRVVIuZ70vTXMsRlABPfjqd2kQkrgUOUnvB0Pi2ZXRUurVgL8EQplMBns34By+hpg4qoE1Kc2JPNprIOlSnvcyXq9jPaGVTc6G0OOCRj33wYEaekK9ixRaL/8gPnzqgWBe3BiKodAhDwcXx/I5gTcAqHL/8qlINgZuuhjissRwIVcIfMMSGldZSZYn9YZl/ZabK7BhCh/PwX9a7rzmIJfw9BFdPwy6xz7CDLAXZVb/QQkFxGTgY7qgWeouN5ScjvQl289b4TKx2oC6YGBme0r0zWi5xe/qFxQg9zn4zPDlY7TFUdaqul5EV6fbbxe3+0Uap07QHUda6LvMmz0e
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(82310400011)(46966006)(36840700001)(40470700004)(54906003)(70586007)(110136005)(26005)(70206006)(1076003)(41300700001)(316002)(6666004)(2906002)(478600001)(5660300002)(2616005)(107886003)(336012)(426003)(83380400001)(36860700001)(4326008)(8676002)(8936002)(47076005)(82740400003)(356005)(7636003)(86362001)(40460700003)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 10:37:08.5569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9b1f9fa-b9e5-403a-cfab-08dbc0d8083b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5482
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
 .../devicetree/bindings/hwmon/ti,ina3221.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
index 0fd8ae5f6a22..5f10f1207d69 100644
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
 
-- 
2.34.1

