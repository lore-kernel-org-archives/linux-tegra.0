Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCCBC433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 13 Jan 2022 14:31:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbiAMOb7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 13 Jan 2022 09:31:59 -0500
Received: from mail-dm6nam08on2051.outbound.protection.outlook.com ([40.107.102.51]:2502
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234398AbiAMOb7 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 Jan 2022 09:31:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVziu6cSZ8Dx+JOWVVN2zFHCd12aZRW1LQRieFMgOsX/75As30kso0K9efwdd1WB3Oq2c7K/S/wYrdCsOwkMKbIr6Bl6UBLfcL5ZCBM3mTJyDAXts7xTcTEzttVtppriD1e0OHr7FnPj4F1TF99xeo5vOI5L9uecnNwR3Y+ZYiEJ088dDcQMbhp1RptDfg81sSbxI7YYwG27CBhqZpcShLBC/yU0Pj7xqOSrG6yHnqGV+lKtRdXO+DJfD0sbj+7fiOpyCMKUlyBeXOROt5oH52U2+b4S15FSF4KZcSqNV+t7Qr5aIHCdCjL9KnME1Z7LtElRna71tQINuscAHfVRfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCtv+X2srJRzVfUCgO6uIKrJBpjMVlDSBP7YfEmBKns=;
 b=eSTytW2zLs7nPMYavM8sNQjixWTlke0Vdy668jDQhDDMCrCL3og4sTup/KUFf0DWa8Qx+q8nu4GwRtEfNO+mTenyWLcIXxLc1e4GFtc6GvVCforNQ1In9ZAfcZ7kOUr1UKCzD5KzYoY9uz+CkvnR9CHrunj3l1zF9KRtWCdNvv99TnmlCOToMKUXcuHKtoyTQZ8kDqnYSHne0Db8moRZmG494wg+IXmss5Y5zE9Gwtq5IfZVv6ItXtZrUuIGxq6Cyut7ty3cot7Wztw/jgjc+ICOaGLphncXZKck3I3zgJ3ix+3U7i4lTS96SbnM0zjo5Q1DlLDIf4CG2rgIy0BJ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCtv+X2srJRzVfUCgO6uIKrJBpjMVlDSBP7YfEmBKns=;
 b=FH8PzLYAxw/h4bJwWXLJIRzpM9FbkCVtdYCWQ3qXCU+9MOWG3517D7Q1/YhcCvE3cxszkiSSKUkSEn77tqIu1EA1dCVNR6n2Y3s8Vn8SdgotjF0CGuUvv9fAJci4dwcj8MUCYG6PUjA6uysI6CiH+XAsVMkSiuaII5+G/mp/8BFwrSfN7/83XP+2feWoRQSpZPadvxQ8g6s+Tp8uUpOr4B7F+q1d+EYtZYsKmop2vydF4CvBpMfU+8/CblA8pS3/laay3tsJCsSkL972uzhUoKkOSgw/vOzMVSUKw3w7BQK/POcILOacKrzYScwc4awyI71Zo3k1EUrbmmxZm3RXdw==
Received: from DM3PR03CA0008.namprd03.prod.outlook.com (2603:10b6:0:50::18) by
 BY5PR12MB3937.namprd12.prod.outlook.com (2603:10b6:a03:194::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 13 Jan
 2022 14:31:57 +0000
Received: from DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:50:cafe::82) by DM3PR03CA0008.outlook.office365.com
 (2603:10b6:0:50::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Thu, 13 Jan 2022 14:31:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 DM6NAM11FT055.mail.protection.outlook.com (10.13.173.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4888.9 via Frontend Transport; Thu, 13 Jan 2022 14:31:56 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 13 Jan
 2022 14:31:55 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 13 Jan
 2022 06:31:55 -0800
Received: from moonraker.nvidia.com (10.127.8.11) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 13 Jan 2022 14:31:54 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] arm64: tegra: Disable ISO SMMU for Tegra194
Date:   Thu, 13 Jan 2022 14:31:52 +0000
Message-ID: <20220113143152.167583-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adab6c59-410b-4c82-2df1-08d9d6a1736e
X-MS-TrafficTypeDiagnostic: BY5PR12MB3937:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB3937A3DBE1F67904B11D3121D9539@BY5PR12MB3937.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WRzxwJ7FS73BTTpd6dtm9aRxT+CcSYyVk8/Sam2VS+qZMGVeutcuHp9jIlGK+Vh25l0HZ/yefB9qayQuu/EjGHj6d4NPVZpvL9LF0gNSRIS02sHDyL8IDHCIhnFLIEXUxA04zdC64uRG1tEPXq9T+4BuWUh87PHVeyhKssOwcy3AJYD0lgBJn1WqM8JH60smI3NBppB+dJ+nRzfcnRW6ysfSWTqU2K+3DnFJWcY3fYfroD12ZzpokFHone+qS9AX2TN6Jk27q1xSCCBSpdFE3cNzsueYdnN56y1s4lv9HDMqsh2MOi2rl3k8++FWyTTNx/+yVa58wMMaX4IgPnjFJRgN00gwXqU3PmnOwRvgkhYSOQ4qxcrZYh1+wepsA3vMva1rxXYl+wqlTXvKIm4uvET74OArpaO1rZifi5auk7IzNiEiV2F5gj2HEbFlehPKLRxy9UiIzPMgIoQ5n3rifhxFYmIrTO8hvTMzMXfXUQnIwnQRd4WDe7OPLG2wxn88vgizoy7FFzYSOqjBYxK9NICkdbh4m5UIWpJLIWgYNRItQtKrXbZTmRZZ2ZrBO/6+8GZlSsinVhCt8jJ6TTkZsHIMtAm4rH5ADaIkH4ttOBxnzJM+tbxJd3O4CEiERMo9GOI5Rm/2sskVNaK8JpO6S9J15c746+vv+q46nNlanCCWlt1yb/4dU30+EcoJscUNHbkn+LoRrioqMEWEY8DITEmuvaoVnHPvzhKVn2Qo8WCIkT+zIkhXSGYh47CzqIczHqRPOgV0YCR/UH2CHv9AbFekxGpp8fkHmLCdEopuESQ=
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(4636009)(46966006)(40470700002)(36840700001)(316002)(86362001)(508600001)(107886003)(7696005)(26005)(426003)(54906003)(40460700001)(82310400004)(6916009)(1076003)(4326008)(186003)(83380400001)(336012)(36860700001)(5660300002)(47076005)(70586007)(70206006)(81166007)(2616005)(356005)(2906002)(36756003)(8936002)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 14:31:56.1659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adab6c59-410b-4c82-2df1-08d9d6a1736e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3937
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Commit e762232f9466 ("arm64: tegra: Add ISO SMMU controller for Tegra194")
add the ISO SMMU for display devices on Tegra194. The SMMU is enabled by
default but no hooked up to the display controllers yet because we do not
have a way to pass frame-buffer memory from the bootloader to the kernel.
However, even though the SMMU is not hooked up to the display controllers
SMMU faults are being seen if a display is connected. Therefore, keep the
ISO SMMU disabled by default for now.

Fixes: e762232f9466 ("arm64: tegra: Add ISO SMMU controller for Tegra194")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 2d48c3715fc6..aaa00da5351d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1584,7 +1584,7 @@ iommu@10000000 {
 			#iommu-cells = <1>;
 
 			nvidia,memory-controller = <&mc>;
-			status = "okay";
+			status = "disabled";
 		};
 
 		smmu: iommu@12000000 {
-- 
2.25.1

