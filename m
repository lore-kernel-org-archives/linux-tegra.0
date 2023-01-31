Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF160C636CC
	for <linux-tegra@archiver.kernel.org>; Tue, 31 Jan 2023 17:59:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbjAaR7W (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 31 Jan 2023 12:59:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbjAaR7V (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 31 Jan 2023 12:59:21 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74BD121A31;
        Tue, 31 Jan 2023 09:59:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OBisflVk6cfyXZtOiIoQJBNo6mg5FBnUfa8TPDTrMAqhPJmgp6YMYbz1HWIw9zO6wJXJ87tPdMjfpm1FnrSP+12lDNZL97mvL7KgVLoLxoPQe5pgl2sg320BrDRohq23wMISUFkSg2yoj0ejUK33fh0yRvlgr1IaA5jfvZ1Q2v3jnBn3RPBImEO3HH1Es+Qy6CQeE5lOd+ycyehckzCzNKR12lB3GJ+gXGlaR3cvdRqHfu2TzJQZckdgMuf1yyjtfRrfBS0MwMca7C5yDWXdo7iPsuY9iVyoZkvJNnLBa5Sr9iJfinrjvj3rrc6hvjPo1l5i5yaaqECpHOetkjJ0yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7FDRxLahFR6uDmDIwphTX0R7vjBs5HU4RejtC3PX70=;
 b=Tt8jofG0J0tzGKn27erj2Z0rcXwYY7yRutKlC3P0XBNr1EK+jxIgeKij+nDfGiHmbSapLPS4Oeo2TUaH8gQ9E5B/iHCdmLH0G4VkETXjUyTp7aeNro2mQp7w0I6Hk8OLBsqePTgXt8sUCG0T59WNtYmplbFtZucJKgxbyWfkSRquzJGkK1gKsraN5qvDuILGVffftO54MMJAOr6oANQEVm4jUFDmAUKo/2nXfCf932Ssc9tJOsbfhsXIvr8zY/g+N/+TWO53j9HEfwPRsIF6CkprEVasnuFkZdGKjBA0vJ6ku4LYYq4hxQ2PIsxeAlF1fhZjqxCzx0XXlJ2oxnBxGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7FDRxLahFR6uDmDIwphTX0R7vjBs5HU4RejtC3PX70=;
 b=Hi2gJgTG5YVV9dsACnFK9jxAns6TYDe2PzkEJGB/iPrOFF7X2NZgB88zIa5e43M7OuI0NHvZnuj5VIEYETsFWXym5R2GANEPK0uvcTF8zK8wr31KbrcpeQs+vp4oQGfBo83b5EofhOwOV42THOcu3+Xa/J2SnwsFOi0q0lVhlnbEOvs5yuznXw9RuXAwgirUDrfKeLDN+HupHfQEWnkAtzkFZkg64D6wx4s9u18VBujQ3Ydnhs+bmj6E0xIj/6ayxgesO4S3fvcuycrk/G1oWenck7JGmdORgs7S5jHAVnFQr8Rv7Lx+ZR5d0TBmSkd18heVV3lPxits8MUc8n1QJw==
Received: from MW4PR04CA0110.namprd04.prod.outlook.com (2603:10b6:303:83::25)
 by DM4PR12MB6184.namprd12.prod.outlook.com (2603:10b6:8:a6::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.38; Tue, 31 Jan 2023 17:59:14 +0000
Received: from CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::94) by MW4PR04CA0110.outlook.office365.com
 (2603:10b6:303:83::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38 via Frontend
 Transport; Tue, 31 Jan 2023 17:59:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT031.mail.protection.outlook.com (10.13.174.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22 via Frontend Transport; Tue, 31 Jan 2023 17:59:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 31 Jan
 2023 09:59:05 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 31 Jan
 2023 09:59:04 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Tue, 31 Jan 2023 09:59:02 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V10 6/6] arm64: defconfig: Enable UCSI support
Date:   Tue, 31 Jan 2023 17:57:48 +0000
Message-ID: <20230131175748.256423-7-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131175748.256423-1-jonathanh@nvidia.com>
References: <20230131175748.256423-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT031:EE_|DM4PR12MB6184:EE_
X-MS-Office365-Filtering-Correlation-Id: 450fe0d3-858f-48a8-0a4e-08db03b4dcef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KhJzkncrdrTOoevo6Ho0lrsU/zMRqnBGcIEGfGSArSbWhe7Jir1XZ+4uT70lm2K/+Kh8I/mBhI889T43d4XZhktMcfbTsaFpjDF8iYq+CxNz5JpTaIqehgHoGJzuI+/2gK1Sfcrmj8nWMaTF/hD1yR/RZxHiYaEAItdSpaqX+kMVccGFqh7MRBI1d75BPUsBD6+0O7CQ5yMNuOJE9gLCmRhdz1Ssuh8YHWbQYbJp60EWYutNqsvrNHkvxwjikvN4owRR30OSVGeQHL1Zz1C0weaoVWZPHz0GtGTiXAjfL09xNk8MHXJzOe+raTknzzatPP+i8DVPOlb+KBsAZHIhlNBzpI5S6kK4PnSRdD8dbQStPox1/AGcIE8rEV0fZ7J7GtbAHjLsWUunjtzRXv9fSTtJGpkj78Pbe0bfbWA8+KuIyNF2MwTmTOJAb1WpN97zW6a3Y0C+HxA3ZH8Ap1mEz36GGJiddyJShqBvRgFWfVA6IsIK3wVYRcidt1oChsymeuY6w52LOySIpkkHW5HPl6Yw5gJ9VXmADyLhhAmPZNzpdNnXLFUiLkY49yEaAX53hlCc+PwIazQCC60ra+ZqiMPAd8V2Z/Cw9VtgPZ5KQRcRQYIaVy+xb+7bEczMN26MbEk0NQp5ZK1LrjD3PCjyD6uQuU5TdliVb6zzxs3IXCz3LtwITiALhpYlZVh1EQjHJH47L5vnzUgwYUb9/jRMjQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(2906002)(36756003)(82310400005)(4744005)(2616005)(110136005)(336012)(426003)(316002)(54906003)(83380400001)(47076005)(6666004)(107886003)(1076003)(40460700003)(356005)(186003)(7696005)(478600001)(26005)(70206006)(4326008)(70586007)(5660300002)(8936002)(40480700001)(86362001)(36860700001)(41300700001)(8676002)(82740400003)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 17:59:13.7613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 450fe0d3-858f-48a8-0a4e-08db03b4dcef
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6184
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable the TYPEC UCSI support and the Cypress UCSI driver that is used
on the NVIDIA Jetson platforms.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V8 -> V10: no changes
V7: Added in V7

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 984553d55e17..d487d0e2b8e0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -959,6 +959,8 @@ CONFIG_TYPEC_TCPCI=m
 CONFIG_TYPEC_FUSB302=m
 CONFIG_TYPEC_TPS6598X=m
 CONFIG_TYPEC_HD3SS3220=m
+CONFIG_TYPEC_UCSI=m
+CONFIG_UCSI_CCG=m
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=32
 CONFIG_MMC_ARMMMCI=y
-- 
2.34.1

