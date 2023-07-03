Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A475EB64DC
	for <linux-tegra@archiver.kernel.org>; Mon,  3 Jul 2023 11:36:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjGCLf7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 3 Jul 2023 07:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjGCLf7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Jul 2023 07:35:59 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E251C6;
        Mon,  3 Jul 2023 04:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lN71Hn4Kd1u7OHr2RLb+x27DQmircaMP0vUuGyvBHJA0JRKH5MG5Ki9NUJ/FCzJjBLVksibNbh9BEOLPsmFEen16zKdHkbyW9T5nirIqeFuBUT2+hEuncV68VnWx0MmLzCNgpW55FRtgK+eBniuo2EEvssen2tP69iuNBeAWdGL5IhQ5YmiCDCE/R61sKUaFYH5g0xID6rsdoFHGYG2DL5FzgDJCXscJMspdxftc+ysnl31McmfGhTZXw57lNzanAo2N9XSmKRMCweegkacEHIR3JJH6yNs7ZDsC+h/fs3X4yM296m2U0LaYbIC/gjzNs/8r1RGMZFppkX6cTPhhCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNV90ysj2aXIq8WuyM8aumkU5dwlx5dqq3qy5V+uLE8=;
 b=cti3kVC7zvLLmtg8pdRnkme5RUR0PNO5h4+onbi5KhmcHpPy/jzocnv5eE69jKx80WfmMPs6vD3ZGhoW4Z/0aVuRAOq9nZsxKtYUDrtvccM8Q4/3+LTmPNR2V6CAFNCs65MpKPIJuWHIjt29R7LiD/9BAAF/Sr0TLZFPbRFBafMPUw0lJ+CAAR5IIVgHit3fK06pEDhdq3zqvEQEdOm7ahJeEsbaBDRaRP1f9vAxGNgAF5ecHsuM8EXhuiycbeIKQgQJxBUWzzi4i8+GDoEGU33U+J2GR0T9FHZtmfUOaNckD12pdNUgH8ajREbXhx4gnXpZT2ZDazJb6GiGCMfxNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNV90ysj2aXIq8WuyM8aumkU5dwlx5dqq3qy5V+uLE8=;
 b=Zyt2qS/Rp3QNFSiNClalRbYm1T83NqXVZkvQIK8haaMk+Y9HA6kJ3SkYr4r8HdiEYVORO2d5L/ffsIyTBdsOGjXq5bGPe+b42jMpfXEbQwrnDjdu54COydNiaiK9oWYbM1X/tRHGIdXLkPAdtkl0BRzXPiat3qO2mLg4NNEwXMrpjKbBq+CQ49srJcx0xKjtvMOtqm2H+79lGvIBhGznsPNF9jN13OPCW2RE+kcqrghts51W1K2vlmuTUkmJ/7KPfhomRBzHxD8P8DUgSDPoR+5eHQJxbSEfz6uQsOWN40Slu1cuePNGsyHZT1rlIckdWQlB8lMSgTGKOpKZjhOUqw==
Received: from MW4PR03CA0070.namprd03.prod.outlook.com (2603:10b6:303:b6::15)
 by CH2PR12MB4971.namprd12.prod.outlook.com (2603:10b6:610:6b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 11:35:54 +0000
Received: from CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::dd) by MW4PR03CA0070.outlook.office365.com
 (2603:10b6:303:b6::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.30 via Frontend
 Transport; Mon, 3 Jul 2023 11:35:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT013.mail.protection.outlook.com (10.13.174.227) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.43 via Frontend Transport; Mon, 3 Jul 2023 11:35:54 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 3 Jul 2023
 04:35:42 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Mon, 3 Jul 2023
 04:35:41 -0700
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.37 via Frontend Transport; Mon, 3 Jul
 2023 04:35:40 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] arm64: tegra: Add missing alias for NVIDIA IGX Orin
Date:   Mon, 3 Jul 2023 12:35:37 +0100
Message-ID: <20230703113537.75152-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT013:EE_|CH2PR12MB4971:EE_
X-MS-Office365-Filtering-Correlation-Id: 20fe3734-9bec-486e-8e52-08db7bb9a95f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iGPzXU4szpMwZWGnkDOTkZqTohcmhONXozdhHBm3QKto9WAF/LYPZe6yXDUW0hdff5ISQTwsWtrFu7JPJTXJoM/iMF8rTUN0Z5havZrBjqr9ytMLyYEBDxAcrn7At5isf7jDIrCs2vd407T1Sa2v5MUL/Tcw4v+GhT+4mGIqgOfQOjo/acetSduzKguAuCUr8sAhLMNHwwTxgmEefkj8N8TL8RSC3TaxnC7Ha6UjqT6sj6uwcdE7hTuEwFphVKvrMgvWT1VwzyWRTliaD60LV0sRaKXJ5k6tY3S0ypQtQhutt2f0B9XOan75/eXSBYblo0K9zktwj2JtmOVWNBRlt9dzmoaTAWIsxL8NORlLI03vRajqJzokxzpZTTdvaP6PR1KWlCCMFxwp4sSejfv4PV08kKlpfye/mO636ixznxuanuptg6gRGp4qfJcQP1ko5WFgTXaeYo8boo71qz9u7A5yxg8QqQpa+3WZmpcrlZmSb6UpDsm5zbkIothvDQetW+/asQraJd74l79yS345pNfCUue+nUNaJNSwWSSMcG+Ev0xzzOGtQ7Pvy8znWQ+GhLwgO04NiLM+VhFupzDXzo6cS+78IcolXeWuOysWSRcVwSV29Wu1oPV7f3nSGeEKGNvUdY+IZv65GDsVVgA7hWzX4Dtclgrs7cwx4t7POvNiGGTMWWOntu4jgbdU7JAJumZVA1kVfKnfsuMO+3LFl0ddfPUMin7yDPlRFBvxIP7VKzTG4c9tmh8EsLiuM0/4
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199021)(40470700004)(36840700001)(46966006)(26005)(107886003)(478600001)(1076003)(82740400003)(6666004)(86362001)(2616005)(186003)(7636003)(54906003)(36860700001)(70586007)(4326008)(356005)(336012)(110136005)(426003)(316002)(70206006)(47076005)(5660300002)(8676002)(8936002)(40460700003)(4744005)(41300700001)(2906002)(40480700001)(82310400005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 11:35:54.2897
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20fe3734-9bec-486e-8e52-08db7bb9a95f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4971
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The following error is seen on boot for the NVIDIA IGX Orin platform ...

 serial-tegra 3100000.serial: failed to get alias id, errno -19

Fix this by populating the necessary alias for the serial device.

Fixes: c95711d7dbc4 ("arm64: tegra: Add support for IGX Orin")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
index c0ba69c16382..f0e3f7f5c0dc 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
@@ -12,6 +12,7 @@ / {
 
 	aliases {
 		serial0 = &tcu;
+		serial1 = &uarta;
 	};
 
 	chosen {
-- 
2.34.1

