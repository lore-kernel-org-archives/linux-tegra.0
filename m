Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8287DE71094
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Sep 2023 17:01:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbjIURBK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Sep 2023 13:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbjIURAv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Sep 2023 13:00:51 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6A3B137;
        Thu, 21 Sep 2023 09:59:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRzsp5G34i0fevyqdEFjimNydJJVos/GQga87DPjMFRb+rwfJHoBWelQd51ZCP7RZq4pJDagusdfCHm0ids1EAY1iOcKaII6FzkJEYj3vv25otubXNt1bTchrHZzMbBsb8WWO92CR/r05aXEn4pwNFi/wUXTJ8h0GQu042VZkmmi6uX7U//eDWNqs/0vh8cXD/XLsau/O66WmPixnrjLozr50ujyFKsM048msrZCPmFc+QxREOta9QZFPXRxvsTWRjamAZkyhR/y9OmwO/ir3Izz30zd38nzW20vHXCDMhptMc+8a4FhtzTV8lkr2IU/mN3cmjT7RyIYsVbPkNUU+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qR4d4vbEHOKN9d8aHifXMTDoVTXtTq3Ui6AtIADyNL0=;
 b=eBs7uuJhgODfKvDlXJ3S9ZJuVdznyB+a1GzACa2MgH+o+9fEqR/GkdMwae8zCq/XzK/FT/C9bRiHXcKoFwODKZMqzs3VMZTqnTmpwU+JQJ1FEQ7BJr/aTD1KKqoRZw90zlUUb0FhuX605WJxBPPxH/PXssO8JDI68puuYsuSblFLJag/H6rfvcneB5Z1dzp9fnudKqLSpVlOsADOITLpc7EXdqGcvQN5gism3DtlPCT4RVfSJtBgiqFZAicLk9mbqkIBrI4J9ZlScoXeBYg4KawvgJ3jQU6YXT2g+lsn/DSCxMLiOVVFDxjdwGqLB/odLEKoBS+UINfsIve43Xq0YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qR4d4vbEHOKN9d8aHifXMTDoVTXtTq3Ui6AtIADyNL0=;
 b=OMTCeeLUQpTr+52+HaDTUjetdX4+cdUnP+UeBIhi0t+hEILBYSqBDVyoVHeu207umFXKRAGmn9CQ+U4u/RJS2w3r0Ar+Mban77YC8x27iYOec/kAXhwGCI3Q7qxvVo+Q/X/bgai3rpJl0Ytj/0kfTM8z98Pci9QyitfQLLRG1wFdQ4MsCua9PfjTrTPgtzFFfzY7RamyeZgonmjfiJ34yKws/zksWD1foEfbZEjhrLS4PqSYwtzB+EvErD5lS8jbPX3StdHCJb6rOvQAc7xTf3gQK28UkTyEX6L81gzFsXESTOxf1o8Q5Cw2JNuzxbZLgaNxT26JqmNcAOExIrbwUQ==
Received: from DM5PR07CA0092.namprd07.prod.outlook.com (2603:10b6:4:ae::21) by
 SJ0PR12MB6734.namprd12.prod.outlook.com (2603:10b6:a03:478::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Thu, 21 Sep
 2023 13:11:51 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:4:ae:cafe::b3) by DM5PR07CA0092.outlook.office365.com
 (2603:10b6:4:ae::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.31 via Frontend
 Transport; Thu, 21 Sep 2023 13:11:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.20 via Frontend Transport; Thu, 21 Sep 2023 13:11:51 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 21 Sep
 2023 06:11:38 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 21 Sep
 2023 06:11:37 -0700
Received: from moonraker.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.41 via Frontend
 Transport; Thu, 21 Sep 2023 06:11:36 -0700
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
Subject: [PATCH V3 2/4] dt-bindings: hwmon: ina3221: Add ti,summation-disable
Date:   Thu, 21 Sep 2023 14:08:16 +0100
Message-ID: <20230921130818.21247-3-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921130818.21247-1-jonathanh@nvidia.com>
References: <20230921130818.21247-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|SJ0PR12MB6734:EE_
X-MS-Office365-Filtering-Correlation-Id: 18a8852f-8c81-4d6b-f7f9-08dbbaa451ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0P3ZEGPg4meDDGr4nH4+93l0zSpICzV10NMBH+aai8ihbHpWzdRJVoJ0soDmU3o2cqqrGBg0rHai3V51gv/jJkQQ6WJ1GvUz8BaUS6LoZSzFp0JNxUNnOrQfthIkAyrub02JJwXIsAHTYTrBWbT+AEJPe5DcZsNlhLnHCRl6l0/y5EW/RdcJc1nmc31Al9TXR7bprJe3vUPugiQx7Zy/+MOhla/VAr8jDyxedrDTcmLyQd3WoJQYoLagEkOgKKn9HVZ0u+Wi4QOCx3dloSJffrgS7ozam9hFAdxhaqJIhq4ewq++EIf4eXFAi0QadINt3Yxdq649z/oiZDGJA64Z6eqmJPr0uoEdx7MJTurkR4R0Vf3WU0PHoSVp/LlpBp6q1XkAbAOi83yeYFWfkojZ+B2dhgT/kJF/wlMaGmwo8YYW2eWYlusCjfhpUpBEkZStytqX+EZL1ZUYfSlySTLn+bMTRctr/4OAReFYH8QJ7tPAyswmz5ajghdbpiUboV59rh9KxCjPhyG82fsofwTHEa0RqbIEU9ww6gk7xYvAN4YcJOBxUrp0M4OmxV120ftD0tSSN0IvobKF/0VwEucJiji0AzDRTPMUt/IqO7Imy6AqRa/Ch6JLXxx9USRoXNSq701b2ym0G2CVBh58ZOoRy5iSM9SHMYE36gb8aR0FRJaMNrThAsbMlHYLjVwPfnDKzZSjrdqfbY4F70UG0Qtx1+8V7Xgfe7LE3IsuBX1MQSswyDMosvulNz8+BKJHfNOc
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(396003)(376002)(1800799009)(82310400011)(186009)(451199024)(40470700004)(36840700001)(46966006)(1076003)(47076005)(336012)(40460700003)(40480700001)(316002)(86362001)(7636003)(356005)(82740400003)(2616005)(8676002)(4326008)(70586007)(70206006)(54906003)(8936002)(41300700001)(107886003)(110136005)(2906002)(83380400001)(5660300002)(26005)(426003)(7696005)(36860700001)(6666004)(36756003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 13:11:51.3578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a8852f-8c81-4d6b-f7f9-08dbbaa451ef
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6734
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

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Ninad Malwade <nmalwade@nvidia.com>
---
 .../devicetree/bindings/hwmon/ti,ina3221.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
index d0e64a72af5b..8afbe729076f 100644
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

