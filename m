Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1788FC677F1
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Jan 2023 15:22:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbjAPPWl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Jan 2023 10:22:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231684AbjAPPVx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Jan 2023 10:21:53 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::619])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E326410D7;
        Mon, 16 Jan 2023 07:19:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFVGAb14avAKahYDVS61CDX6EAkXLG512440SF5/h6v7EqThdJUNgv99QAElfk47P+KCbyr0fuu1cdT6K7LDs6eJw4JVNNs5JVzmrWo8RP6FP1GOh9z8UPDzTXFZL36FEOPJP5lSYjXGHC4jfPOIhIRFRnQ1NPLk06u1zVoQTnDU1VFgwid2KvUTMyFnto1CHGSucIQ2kRqmIakDTNDAQXs9h/WLh1+bSQIWZe2SCXxrUAZSN3KFSwvhHWyvRsIVVbyVbRAmc70mfEj7UFUo6Z+gtrKlR5K5H7D714sajiX+QJAoYKmR2Z/p6T2Vtzm1zWNxLeCwJMs6cIxlDfj2hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSPPBN8w2XkJ8uJNXo7RTJpGpJBEdM6PiZACsiwrjQg=;
 b=UnhCFpqn5Ugr7CeyrK1yfOIvhVMpRCV7SIZEidKaT406worVaNkIWzdoXvt4Kw0sMS9Q4c9nFgABVJXGx9D4L7lQA9CyE3TKxZwpHiyQrSwBAif0PcKq5Mf39ebgspNM10S590wpaiRHYrgYpl8aYai/EHWx15tLYv5sz/ymtwXS5mF4rwaY53qTIB3k7wMkZptEqqfkJuWmgspphS69ZZJ/ykayH/DgsVVFA0HTY0k8kmmkEQk0IuIheJGUWaZBOrLmfuld7FFACQyn1ehbaHn23mleeQ1HGQl3BMeAWSMOAUhh/MJdGL+VtKhfGNWbDDMgCaODCUWXeVk2HzIOEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSPPBN8w2XkJ8uJNXo7RTJpGpJBEdM6PiZACsiwrjQg=;
 b=fFqDDdYo912klypbityb47iVz2+m8PSoYpiU2e2MldaGOMRVDvgN8FSEO3is7sG6/YQGrG68nJcOSVo/ffdFwm6XmfRw2+L9PNM5qjorX8mtCq1vWqSRaacyP1XCd2DMpmS4eDO3H+ggolLdgN8awveBJP4yTNOMWnuhCgHI3GleWIjA8IP1F+1SiSXj27kcJ4RP48IF9SYgf4bT5RBTa09T3baczWVa1gYsN9tKkB73XeO8g099fKm3DuelBx7L2YnqhKpWiBPyICpjXfCJC6sOH1+VRiGi8mMb0nB88RfKNI/X7Lm4xGYKyvvne0yYQvNF91qjX2BYG1K9gfsWlw==
Received: from DM5PR08CA0055.namprd08.prod.outlook.com (2603:10b6:4:60::44) by
 PH8PR12MB6962.namprd12.prod.outlook.com (2603:10b6:510:1bd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.22; Mon, 16 Jan
 2023 15:19:32 +0000
Received: from DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::28) by DM5PR08CA0055.outlook.office365.com
 (2603:10b6:4:60::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 15:19:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DM6NAM11FT042.mail.protection.outlook.com (10.13.173.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 15:19:32 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 07:19:29 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 16 Jan 2023 07:19:29 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Mon, 16 Jan 2023 07:19:27 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [RESEND PATCH V4 1/5] dt-bindings: usb: tegra-xudc: Add dma-coherent for Tegra194
Date:   Mon, 16 Jan 2023 15:19:13 +0000
Message-ID: <20230116151917.94193-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230116151917.94193-1-jonathanh@nvidia.com>
References: <20230116151917.94193-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT042:EE_|PH8PR12MB6962:EE_
X-MS-Office365-Filtering-Correlation-Id: 918c9a6c-a2d2-4ab5-42e0-08daf7d511ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ff4cbFyHDS6oFudkxB+9MQqVlJOs/ZAF2Tf8vCY0MAbSfD3XPrVEJJS4X7PvxrjrcCd9jhGaEggYYceuCQ58Jp41DB6e//N8WmuIR4ZzSBTdWkERStztpafZYkobWXBMX0HZ+Afg2ih7yKgWfwlQBaFPn69tEsJPn5TnaJdWfK3MEJSPho4WK+oNbiELdWUjzX+FiYC/UfkoLI2ZCjtyjkBED0wOLu60j3nKRlaaJKVi/+sJOs1BtqIIz0Ge8+OltCaHnX4++k9IykAFW8euFejR+ExWStJKAiKCOl3uAEYyKEsU8plfJqej8FQ60sjs7tBOjHICnQ9dyx5XIWYZeRq3e/YaKzbS+C/3UWdtZU7wLXWwWP/v/9NA76T32CWHgJYk9EVtaJ5Ogx42KQx3pQ4TnPJ3lEfrsNXEL4Lr97fxLdXkvs/IZzk5vGQdK2toLWCe6OM2YuKZBNgvlup25U493il6Km5yhGKjjPNy2pKI3QYcwVydr5zBXdwYc4xfuOwVzAaYWYJ7LPkL+LjUD79x8WMpnHr+1vLLYVC0d7+YHLKRFUC3gUoZxziK7lXCFPKbn72fLwnT3VpvPmk9lTRg3MTx7PmrDoyoZ4g/ffu6eDEB0qcf+eQfAcVgqOo9SEZw5xdvhrMmO9+FrPZdFnInd3AuWVUbUcRR/8Qhbg+RXo1vU/FHpLsbu5hpHMWs27KUPHTy2RPhSQliEjyOlw==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199015)(40470700004)(46966006)(36840700001)(54906003)(110136005)(4326008)(36756003)(41300700001)(316002)(70206006)(70586007)(86362001)(83380400001)(336012)(6666004)(426003)(36860700001)(7636003)(356005)(47076005)(40480700001)(478600001)(107886003)(8676002)(40460700003)(1076003)(7696005)(2616005)(82310400005)(26005)(186003)(2906002)(8936002)(82740400003)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 15:19:32.1380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 918c9a6c-a2d2-4ab5-42e0-08daf7d511ac
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6962
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

DMA operations for XUSB device controller are coherent for Tegra194 and
so update the device-tree binding to add this property.

Fixes: 394b012a422d ("dt-bindings: usb: tegra-xudc: Add Tegra194 XUSB controller support")

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
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

