Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B6AC4332F
	for <linux-tegra@archiver.kernel.org>; Wed, 19 Oct 2022 13:31:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbiJSNbK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 19 Oct 2022 09:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231267AbiJSNaf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 Oct 2022 09:30:35 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20624.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::624])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4173F36844;
        Wed, 19 Oct 2022 06:17:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUkpPJC+GTrWn6E1imHk083zEMmaFrKygTYBOFvFWBgzJbK8w9JthJcr5XQPuFIHK1jnYlnMJcnBEWOLpIFor7TRLKOOf3jwumIiYcEoD1PXP1jwfQEctrd8vR952CGNzQsyBTSWKKCleVjjOo5TtSaY9aSoj8kUkgPCT6mghIVeFDJ+/Kw35j9BkIsuHCVqGuq23o9XmchI3JaEe85VZarmNSPUE6ch+Giat2MaCc9NLaafLs8GyhNEWVOf0iqRQobuDnkDNH5RnTVkdMRR/mQpAzM/nYlYkVOthCLhbqT0qfAkvVnZtBqmm7/6RIKG4KEuuSEJuneHnmNnS718kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMY8MNshq3QcpIPOmIkqyOXxwgoYAYl6NXAs+woA5s0=;
 b=DcIUnfk9I5OleL9LnLJCpYn4K0rQQV/t79Y/jNyCVqzeqUszRa+sQUeoku+7gQRIqX4dVNwT8chVLVS4Cu5xadh+Nf6HZtCu7dyqTIfTrKjMTFdFNane1lbF3QA5SbRaqtUuZe6mpsqdpchA13eFdctZiZ6xuQpDGVW/WlM3AG28J6aYRO9oUqoGAzBDnZYVSAHUxwmXPrVftinkJjb2ATVDZfzI8r/xzCv1zsDjYZ2hiJlJyd52q3K9svIcXL4mqXHb0OS0XQwCNCz1fZ+cGDy0wWz5jmeE9Ohwzqc8BIi0MXL53Aaplc7jLYXz0b154zFzhyk6HufZXyy3hvZH7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMY8MNshq3QcpIPOmIkqyOXxwgoYAYl6NXAs+woA5s0=;
 b=iFkCwvXN1P7CvgByHdh8fovnU9ijtNSp+MqVgu/rmgXTXUuw8OcN4susdxjY3ZJLqFAJ1sxsL+KuRdnZBNtzfeYxVbYFojoQ6UZKGcNOUJwKgZ96Y6pq3qnn6G7NdOn7w2QlFvUxoGS2MbhtdnTPl2e3gGYAi4HIu4teUMaBRJI89ikRd3Vz0uXbFUMFlm+EJvaOrGuFpdmeYxuO9AuwT+5bKaYwWnK/fJKU9hU4nfF7PE+miR2c9I8Nf5tcfmAw/9wVD4xKB1XRzn6af1t75HeAw1h+gy3QN/6/LCrbfm6SnEDCOxBG8wCeh2l3+JI4BuOnfqRN+oWFWrdGeq9fXQ==
Received: from DM6PR03CA0037.namprd03.prod.outlook.com (2603:10b6:5:100::14)
 by BL1PR12MB5972.namprd12.prod.outlook.com (2603:10b6:208:39b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Wed, 19 Oct
 2022 13:16:22 +0000
Received: from DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::d6) by DM6PR03CA0037.outlook.office365.com
 (2603:10b6:5:100::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34 via Frontend
 Transport; Wed, 19 Oct 2022 13:16:22 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=nvidia.com;
Received-SPF: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
Received: from mail.nvidia.com (216.228.118.233) by
 DM6NAM11FT032.mail.protection.outlook.com (10.13.173.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Wed, 19 Oct 2022 13:16:22 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Wed, 19 Oct
 2022 06:16:17 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 19 Oct 2022 06:16:16 -0700
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Wed, 19 Oct 2022 06:16:15 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] arm64: tegra: Remove unused property for I2C
Date:   Wed, 19 Oct 2022 14:16:13 +0100
Message-ID: <20221019131613.145999-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT032:EE_|BL1PR12MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ee43839-78d3-4450-4289-08dab1d41e15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H0PolQ1pzwqi+7YmTyKfOAq4lNUvlpUNMFASibX4beHOTymqAm3k44ihiK4KxyYUemShhj/q5ALAZ/sAp6ovzlL+n+jiIz/wTv1EE15rMid3bFFQ/tHynhzYW38wZSWOLH+LX5lEr3xlaQl5r+SvADUjqyZy1SwG77mJaqVYRbhk+14b80ClFEeoP0nrLOuEnAjz6KpmByEzStaKGxLYiOyPy5/fiWsG3ALsCAK1qlfsqzlXbwGkU+DwwTMsEdgeeI1GufNmP7czlY3/UF79B/tB4srLgIcpQgnD/nNEzpVTbKW8ElhyLHtFnwKn/F0QEiA9rjbk3NlRAhz9O0Jprr+pvOIO5DUHgXwOGnLujCG3dczbC8PzL8m5de27xMtmHNxHisv0GtxiL6b8LP4w1Xu6jJUaoJ/9QyhBG2dZj7UN4GtcMlmppPeGwNzPOEzW2UQnyEHmjI/8FnB+/ZWdhFndL3c9X9sh8ABPtjBjcJBbV1Vq6V8CakboWGgRkumztdGJQRTFVr9NlNzeyLMsJAbNKbYfbZFuSx7YCZ0y4wLFdWk7Jmy93pF7EVfIA/00eby/RQDuX+UAh5N1ND7nYq6692G2Ck+HkIViMf37oZcypR2cuQq+PchnCnC2wP1cC0S4HS7xcj8lfRnySKar1sNWRVkhXCUg7QOZuFqktYASUu7r2nwgfVlgDLTJ44S9IPaMgB9daWwlgg2xwKoT0ITUMw66hPgpK/zIkm/U8Raa9PyDRNN80R/px50uSZWUf7h7xAlP2cCXSKuKdb75oA==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199015)(40470700004)(46966006)(36840700001)(8936002)(26005)(7636003)(82740400003)(356005)(86362001)(316002)(70206006)(36860700001)(54906003)(70586007)(4326008)(110136005)(5660300002)(4744005)(8676002)(2906002)(41300700001)(40460700003)(426003)(47076005)(2616005)(1076003)(82310400005)(186003)(83380400001)(478600001)(107886003)(7696005)(336012)(40480700001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 13:16:22.0676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ee43839-78d3-4450-4289-08dab1d41e15
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5972
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Commit 156af9de0932 ("arm64: tegra: Add Tegra234 I2C devicetree nodes")
populated the I2C device nodes for Tegra234. One of these nodes
contains the property 'nvidia,hw-instance-id' which is neither
documented or used. Remove this unused property.

Fixes: 156af9de0932 ("arm64: tegra: Add Tegra234 I2C devicetree nodes")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 0170bfa8a467..499102ce5bd0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -1488,7 +1488,6 @@ gen2_i2c: i2c@c240000 {
 		gen8_i2c: i2c@c250000 {
 			compatible = "nvidia,tegra194-i2c";
 			reg = <0xc250000 0x100>;
-			nvidia,hw-instance-id = <0x7>;
 			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 			clock-frequency = <400000>;
-- 
2.25.1

