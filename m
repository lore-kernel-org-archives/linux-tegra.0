Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 348A4C67871
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Jan 2023 11:05:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232489AbjAKLFY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 11 Jan 2023 06:05:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232244AbjAKLFV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Jan 2023 06:05:21 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 674055F83;
        Wed, 11 Jan 2023 03:05:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5eR6SlFi9bw7sB80EoHZuyA9JFURhSB4hAqrH2gGkFyHFFxoyE3b0ZziDdDYsRm/nBpHrHW9rdCo2oXvJ78i2+CtqPCFPK1m270xA5w82CQeRl7ZcezrjaL3zHb0RmmT3kSP7iSdEWxEIm6HW2DvCeeHtVUK1t5h+tnRcwuzijjxiPJg0GMUx1B2ksWPMXD3lMkpW9D+sW+HBUiW0V9rvC8DCKl59Jk7niNIP5BTWtuWmCnE0N3jrD9RGqJ83duS2Zb1JSaAK848zXWuELCpvs/0qQU+CBH44i/lLxShYcERFb5lVvazcJHf8BjmGvcjYRyuXwA7CkE3R/KFnqZnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCjz7OF6Ib+wwsw+NXVwA17UXH3h0ZVkiK4TA9TgORI=;
 b=Hbf3u2sc7263foVKdIbe7wUtyAzdnCs5it/o1e9LleAytsWNUIqaERHnY55dq0GHCmtygvHyNeSjVZgVTdvibl069aIcVYA1LKUGlR3wjnYbfbd7GAzMZ6bBBNk/vG2yoAnxUt4gM5i42fNJA6FeIO3M7jDvQL0gIUBPksnkAl1Kvd0Y8Gi0ijDNT3NSMi79g5wZTMMM02A6N01BrJS7Ky5bczpopTDEd3PCZKKFE9wbBgj5DqG4EQHW7JLwi3Msdq3MaC2F+5FDdNp9tlKVzdQRpL0Pd7Bn7bLHbTCMh7ob9C9UhsuLbI5ZvQC2bZkSknIryoGe5w6lEs0vXRyPXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCjz7OF6Ib+wwsw+NXVwA17UXH3h0ZVkiK4TA9TgORI=;
 b=U6mNFhZUQ9oRYth2Me457rbBFInfK9cvJ/iTuoGKh+5EdbE42alXG+C8JJEgwW5EJqnKAVYY8/2YzMaUh3rUZGAAojv8//fFYus9p154vAEyw19i3da6JKni+nV+D+nJD6jKPvjpdIao/OrgmymjlLh6YqX1X6+4E8xJqDCPyQQGbTk+qd4vfrfLzWjs/tWxou5ILl3aMNo0RvK77rxMEvdrtmXk+a31uvoVpZN2VqwxV9M9Uk99z3s06uBlpx4ru9Ra//fDk6c8MxmpAuhA8peUOj2C7rHYJ3vLJYNrQ9w3iPJSh8bi6Rq+6HGeSn+/d6y9f2J69i/P86GMB3V+KA==
Received: from MW4P222CA0002.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::7)
 by SJ0PR12MB7476.namprd12.prod.outlook.com (2603:10b6:a03:48d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 11:05:19 +0000
Received: from CO1NAM11FT101.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::6f) by MW4P222CA0002.outlook.office365.com
 (2603:10b6:303:114::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12 via Frontend
 Transport; Wed, 11 Jan 2023 11:05:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT101.mail.protection.outlook.com (10.13.175.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.12 via Frontend Transport; Wed, 11 Jan 2023 11:05:18 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 11 Jan
 2023 03:05:10 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 11 Jan
 2023 03:05:10 -0800
Received: from moonraker.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Wed, 11 Jan 2023 03:05:07 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <waynec@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V6 2/6] dt-bindings: phy: tegra-xusb: Add support for Tegra234
Date:   Wed, 11 Jan 2023 11:04:46 +0000
Message-ID: <20230111110450.24617-3-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230111110450.24617-1-jonathanh@nvidia.com>
References: <20230111110450.24617-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT101:EE_|SJ0PR12MB7476:EE_
X-MS-Office365-Filtering-Correlation-Id: 343b5041-fa69-41ad-dc88-08daf3c3b9b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dswm0r09SYZEbwZ6Tzcb4Y0PfUHql7bpMCpA0Yu9cg4CRji34XFrLFVBE9ETLACkZcQkEcS3cf5b3j39ptBCGYXAdzAV16/1Dib1wd8xEQmJYDfdqFEtnIXpwgBfeisDDblAed/dlqaPLyD+dE39GdL74gO/UyEkTqRTdhcpw07bnlm/vI85XKLWIRF7ai0QUWgX/cqE2iRhE403jJ4pghe+p1gMJoZ9h9AiRg57Oz4pY+GEyab0VwlXEPBM4x4AfwMlX4n/SBSWwxVdnoJVy8UkRUhy3qGiuvJsKX+7PAc3R/ZWfJOxt+aVt69yIVbkzCVFp2io/VlgsJs++ulS3gGXKnxkLTYSOdzaS+7ma5H4Ta/8xdq78GMqLK1hP488KODqOuEyFOCmXZ3+CabKeRUYWI+DeEK4cu25GrkHlIo0p1W6wGEkPxYkHZnG7R0NK2oXPYs7HQsAdGibAs7yEk4TGr/+IFAVuNpqRCOYWqcLfAAnn6nSEP3eY9UanxTl6GBbrDQUfBzbSmSsjgRweXhMc8ifsaVZtc534Ex+JxS3qk6TtFtmV3TagX3Xum4Sd0PDdVubggYL67BeXpyrDgmpshzSe6URQBgMYDSYbOwbtHrmQNP93ciFk2OlrRiDF7B6JRg1cOkiY9bgpIT2q8UsBPZ22RgqG76NQlPgHaz0v+J1sCR+HZvWpEFrKV+2VnRmKBsRH/ug7AMEp7FfFQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199015)(36840700001)(40470700004)(46966006)(83380400001)(356005)(5660300002)(2906002)(47076005)(426003)(336012)(1076003)(4744005)(86362001)(82740400003)(2616005)(7636003)(7416002)(41300700001)(40480700001)(82310400005)(8936002)(36756003)(26005)(40460700003)(186003)(110136005)(316002)(54906003)(7696005)(70206006)(6666004)(478600001)(70586007)(4326008)(36860700001)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 11:05:18.4921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 343b5041-fa69-41ad-dc88-08daf3c3b9b9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT101.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7476
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add the compatible string for the Tegra234 XUSB PHY.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
V5 -> V6: Added Krzysztof's ACK 
V3 -> V5: Fixed compatible string
V3 -> V4: Added patch

 .../devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
index 1c570ff65eb4..873a97df5150 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
@@ -42,7 +42,9 @@ description:
 
 properties:
   compatible:
-    const: nvidia,tegra194-xusb-padctl
+    enum:
+      - nvidia,tegra194-xusb-padctl
+      - nvidia,tegra234-xusb-padctl
 
   reg:
     items:
-- 
2.25.1

