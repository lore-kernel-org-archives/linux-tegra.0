Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0442C004D4
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Jan 2023 10:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbjASKmq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Jan 2023 05:42:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbjASKme (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 05:42:34 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF644630AE;
        Thu, 19 Jan 2023 02:42:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B5SjaixVfpuVitO9zvwWB7xnSVYltUo3Y4lCSXTWKxvdt4AqUAdHZjPMDdOWJjRm4v0crEnjAFTZiidVeWka9JzEf8cCk90/bAxVyb8RJRRg6orU0NM7c3kIWhAmiUCqOHmDcmuIoOjdE2sM6+ySQtzypcmPTyHMVgY/K9oAqc/DymoPPPlT2i5A0DII1Vh70LuEMquZcT1hHbF0ZDA5Ez++6ua69dWZh1xKsuks0NLaQZ2+sFdvlseSRaKVpWGsI/0/fmFsylYVB5xRkxOeo9FhnV8wbIjWVvHfX/0bc4ruRBkCaLNNB2+kbht8a2/iRukL1shbeULXtyC9LRxYZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8DdMiE4uCvveTeyWzjTZd1vS3BdwrJbQAWjnzBS4hA=;
 b=J5pg2jvIiBKFbLEmT0kEj/cIJuA3jEdMQpMDFwvuQxCdMugpqcucPuHZn3GcefjuxdeJBMPJd0Kiu3xpULLGvyVs28OG99wYEk05mDbUZ+jtpr/+qTKH9B0ORiaR4HO+xmyVVjSwND6p9ueWE6IKvqEG2O9wI2RX6QTJHi1+l1pqIjXHvfIXWa391Yj8dKwenZak0xuSiJM0oGJu4LVwq+JWnMfXInnzmQObtMmSCUxRbGDzDhuu1umOJSu0JQ/wUxcHG8BvDJZ7oWe1jsAjB9KgR06gCR0PYNAOqddmQ3ZMq+4LBhIBUPS4E92eJbPlQGuM9VmMcZdm1FMaRdgOfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8DdMiE4uCvveTeyWzjTZd1vS3BdwrJbQAWjnzBS4hA=;
 b=fdT+44oJVB8r24BRI/ydRlhGk+UeOkCPmthaJo3gmsTXUsEZM0F2DIVjtylLlERjUG9+fSd2MQI2DG477XY1Wy9eoyA/4lIj6wPFCIdQRoemNYm0SrJGhDKvoikSBcYU0BT5/U82RVoBJ+mvs4NS+frN9ALWharqawL6P5aO4gzs69uF2QCMbPWI8pZ9IHOrK5cwHGVmYkBdVes7tyQ9T1XLxb8HjHmYKydYLHboCBsKuXUkFh8geRsWJ00lnE6uvXebRpZZMowmdtZTA7Pq+SGSC2dlMKGxba5EwCZgaoGpF9vOwx5jXVXoLsRMZQm5qhUAlKlRNWsHgkzMW6UDlg==
Received: from CY5P221CA0053.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:4::23) by
 DS7PR12MB6264.namprd12.prod.outlook.com (2603:10b6:8:94::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.23; Thu, 19 Jan 2023 10:42:28 +0000
Received: from CY4PEPF0000C985.namprd02.prod.outlook.com
 (2603:10b6:930:4:cafe::d6) by CY5P221CA0053.outlook.office365.com
 (2603:10b6:930:4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25 via Frontend
 Transport; Thu, 19 Jan 2023 10:42:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000C985.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Thu, 19 Jan 2023 10:42:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 02:42:19 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 02:42:19 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Thu, 19 Jan 2023 02:42:17 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V5 1/5] dt-bindings: usb: tegra-xudc: Add dma-coherent for Tegra194
Date:   Thu, 19 Jan 2023 10:42:04 +0000
Message-ID: <20230119104208.28726-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230119104208.28726-1-jonathanh@nvidia.com>
References: <20230119104208.28726-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C985:EE_|DS7PR12MB6264:EE_
X-MS-Office365-Filtering-Correlation-Id: be8f62d9-506b-4fea-f0a5-08dafa09dc0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rnytVhBQ8uS5xAYI89ynmIFl4ZuiSDngombbJuP2HJugtyQIQRhiJXv+6N7qpu0Rc/s6HKQSgplxNPSbJ9ESPMXnBd7+xqOIAKhgYbijfHN5PMbIQfwEQlBJGYSm9M3YIyq04+RUCG8B61E97MfQEoxZ3paDqUla5FMHU2MMDnyQMIizXeMYn8H2YKu8X9vOhpPm1J/B6+M2gvzRXUPTnaOMBO4HkqGjjsSBuEuXo8Z1J5I/mi39ExZIGrVBD28PPz7APmepiSTavvRwK6ulE6aUe1dRwDUrj5vFzaajiON7uv7TObmpUPpyl06UYfJ7AuCNuUpFX6lmqYyuPNAQAPA1deZECHXN9Ygx3DUD3A4O1mMYxuuGVetF2SK0kvDbmFHJQNcNbk/qVMfhpiJvK+Om0SOx78SSxJ62zHQ2ThDx819XhUqNxHzU4RM4IDwC+r1AhwT+D3xvZR2910yDe3Afp6b3hcsAs8egThQ357+ty7Sr5bc2l6qQOcS1dBwZdYWuctNCm0jjKnCG7L6AHKBLqkF0wq7xDb8ywinc8iyaxvo5uvXXxJWmok2dR/EWMP044+U/F5qspVGibxmjir1C8EwqxhDWjs64soDrrpSdJVFzJ6CJTl8+ebOc45AiuoGwvr4pMZ72GH5NLdQTBXoyMZw/6Ek5vCHuKSlPWwHrQuuw3LZqirgINviWOSbk5mGjeEQZVl9zwvX5/kMB6Q==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(36756003)(356005)(86362001)(8676002)(8936002)(70206006)(70586007)(4326008)(36860700001)(83380400001)(82740400003)(7636003)(5660300002)(110136005)(40460700003)(316002)(7696005)(54906003)(6666004)(41300700001)(40480700001)(478600001)(2616005)(82310400005)(426003)(2906002)(336012)(1076003)(107886003)(47076005)(26005)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 10:42:27.8935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be8f62d9-506b-4fea-f0a5-08dafa09dc0f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C985.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6264
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

DMA operations for XUSB device controller are coherent for Tegra194 and
so update the device-tree binding to add this property.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V5: Dropped fixes tag
V4: This is new in this version

 .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
index f6cb19efd98b..4ef88d38fa3a 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
@@ -112,6 +112,8 @@ properties:
   hvdd-usb-supply:
     description: USB controller power supply. Must supply 3.3 V.
 
+  dma-coherent: true
+
 required:
   - compatible
   - reg
@@ -164,6 +166,16 @@ allOf:
         clock-names:
           maxItems: 4
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra194-xudc
+    then:
+      required:
+        - dma-coherent
+
 additionalProperties: false
 
 examples:
-- 
2.25.1

