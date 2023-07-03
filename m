Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E230EB64DD
	for <linux-tegra@archiver.kernel.org>; Mon,  3 Jul 2023 11:36:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbjGCLgs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 3 Jul 2023 07:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjGCLgq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Jul 2023 07:36:46 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C671EC;
        Mon,  3 Jul 2023 04:36:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnHP46xS7UUMzcVjWvafTNBbziNFZH4Jd+8XzOFioZ1TPLdhzvuEwfICMUMbRAty3HUG64HrjgEifwqm7mgaspgx8ztjk3/N+Qyr3qJ5YRsv0gHoo+w8vjgPaffT1vPvYGiu8JgKErBjzgQ7fvjsV1oa/DdNT07lZnuKv/7410vRxFXEXLOeeUiceCu4e0ThqP1IPCICCg4Vv2PAdqyEQYjPDyt+9jvt+ZfdR6bz8Nozru5tRNpGCZ5EM6KolPEr4IJ+1FAcEoAgWO38Z93qH2VlN0+wTSgO0U4ugEnNjIq2jZjVpYupSD+KWh52oM6bUJXlRSOMsWn+mvlSvh6sfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nyj5t5IraypRpxrBG0Yy2IDcXBus11jCmXP93+AAp38=;
 b=llYnVWcXB7OI03P3wA5YszavgJMUsYfsdC5TW/RIPCZBRcEht4BZe/8wuEsu3J+sLwc20ddqjkZ48DwWdx4zD+WojwjBSmC4zLI9ReluFCnlILOiRTO/Qz0pExSyYmfYZ2ErjePEW6lZ4kaj7FdbEbYdhL4cwqSPx7up2wRYKQbIn97JRSh79RIoM5ffM+wvIrZBIw+DdAiZi+jgJVOlzZlbttShCtfacxrswYM/ZS9HHkwS6Dta//pFsUkDm39xere0hqLoA4kylehGXSHnOTNfgk7TJW3fUz/0EXOFk+i+k9OusieD+0BC60dhMslpwOS33vfflkUgb0QVwY7vpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyj5t5IraypRpxrBG0Yy2IDcXBus11jCmXP93+AAp38=;
 b=l2e5tA8UNKJa3j0LdVZu9USPLEIIbNHjBRCqHczf1ken0KrYQIANYxX9TBT5H9IMqf+wMYr8wIR9ggGgfpuYPECT9wysuS4lLbkkACZPbc86QgezgwNzsAyCRekhwi5PYpMsFGaUxj0HF1a+BCOCXkjQzXqFgn+B9Q9BlKAMqLHUp+Ag1XeRYErFZM8EtJG3cTd9A1jH0KFPkmzh6nxhEJxWUl/89NnU7fM3Mv2CfBK/s5v9ij7/w5L9AjNFA0T9W9zj6ZBKia/qqD5xguYDScnUjlgt7OhHnDVTo+b9riOzjkFE88rCF10xxWl1marCIBUhodhAp79zvVL/uVBFNQ==
Received: from MW4PR03CA0228.namprd03.prod.outlook.com (2603:10b6:303:b9::23)
 by BL1PR12MB5946.namprd12.prod.outlook.com (2603:10b6:208:399::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 11:36:40 +0000
Received: from CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::8d) by MW4PR03CA0228.outlook.office365.com
 (2603:10b6:303:b9::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.30 via Frontend
 Transport; Mon, 3 Jul 2023 11:36:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT042.mail.protection.outlook.com (10.13.174.250) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.44 via Frontend Transport; Mon, 3 Jul 2023 11:36:39 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 3 Jul 2023
 04:36:21 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Mon, 3 Jul 2023
 04:36:20 -0700
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.37 via Frontend Transport; Mon, 3 Jul
 2023 04:36:19 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] arm64: tegra: Fix HSUART for Jetson AGX Orin
Date:   Mon, 3 Jul 2023 12:36:17 +0100
Message-ID: <20230703113617.75311-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT042:EE_|BL1PR12MB5946:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bf54ec6-3d13-46b6-91fe-08db7bb9c448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ylgXfNwfjWi/7WkeXB0TRRrUrzGB2+irliRbvTfbtCMkE9cwmmx5UrsexekroZuysKwRgDQRUNjX6Ppxd7tgcqyNJqkgVbp3hW0A2jKaWAouGvX4vepwXubq7NS4wXYbgEuaoIqhFIvHvIE8wU1epeidW3ZfB5W+C+5OFf9JeDdF6fdKBjlnvXWP1BwpwEZU9TAfal3MjScTpekFQW9hwGmzn9qEPokMwEpyRDNQCnPujPPPTe+uqfepwue1WSzwl8KrV23nxEnFEYNoZyRAVhVzseTYvT6Zv2370IRCgfOcPc3F8gLyKFzh3TX2pRK6G67jeW1CUZrN0D5VV8KxBZt1dP/im/G9vjGdH0lT54b72qPBimdFaKSyBMtGL+3OLABGLNxKUHUlHYTBMmgdlw+zP5M/JHcdhpk8iTjWuWPs5q+m7Drfv2XLSE/tX7cMTkyuKuCZrMcofzByB/IB5TMk9qusDng1vQ4mLxjm4mnsBLd+2/8dJ8TQ6/mhdk3aPjBZP4tdLM8VIjMVZB/4pEcrrhlzHE/TTl06/2trIt5fCH8ABpDlV2M2gAXUVPDJJXHr2X6xmaNuMGs3oh2Kf1hdE1ng8hcptEolRcH8Ylm3lRQDmwotPneyGcPU3VQuR6kQOQjSZJ5NTaG//oCldwd/Mqal3wEzsAc8c/N3xhnXj9MwVdEBn6FDAmAiHNzFOulLqtt6NgeVPKvADAEtYz55CMEZ0zyjq0w6Cyws5E2/FkxgFoKo6lHEarQFDITx
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(2906002)(41300700001)(5660300002)(8936002)(8676002)(82310400005)(36756003)(40480700001)(86362001)(186003)(2616005)(478600001)(107886003)(26005)(1076003)(82740400003)(70206006)(47076005)(316002)(4326008)(70586007)(36860700001)(7636003)(54906003)(356005)(336012)(426003)(110136005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 11:36:39.4219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf54ec6-3d13-46b6-91fe-08db7bb9c448
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5946
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

After commit 71de0a054d0e ("arm64: tegra: Drop serial clock-names and
reset-names") was applied, the HSUART failed to probe and the following
error is seen:

 serial-tegra 3100000.serial: Couldn't get the reset
 serial-tegra: probe of 3100000.serial failed with error -2

Commit 71de0a054d0e ("arm64: tegra: Drop serial clock-names and
reset-names") is correct because the "reset-names" property is not
needed for 8250 UARTs. However, the "reset-names" is required for the
HSUART and should have been populated as part of commit ff578db7b693
("arm64: tegra: Enable UART instance on 40-pin header") that
enabled the HSUART for Jetson AGX Orin. Fix this by populating the
"reset-names" property for the HSUART on Jetson AGX Orin.

Fixes: ff578db7b693 ("arm64: tegra: Enable UART instance on 40-pin header")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index cd13cf2381dd..513cc2cd0b66 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -2010,6 +2010,7 @@ interrupt-controller@2a40000 {
 
 		serial@3100000 {
 			compatible = "nvidia,tegra194-hsuart";
+			reset-names = "serial";
 			status = "okay";
 		};
 
-- 
2.34.1

