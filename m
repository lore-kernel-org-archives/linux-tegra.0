Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7DCCC433FE
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Oct 2022 05:51:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbiJGFvU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Oct 2022 01:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiJGFvT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Oct 2022 01:51:19 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06F25A3F5A
        for <linux-tegra@vger.kernel.org>; Thu,  6 Oct 2022 22:51:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4vKaOyLwwfTSP6fMBeCJ7+IBsBfPx0N3hBRV6CDY+rO/vXGxJLHBoa+mZ5luPUUuwjuq1eqnOmQmnECfWI8Phpvr0W93nZUpP0obzYQa7Zvgx9+/dt6f+GlKGth2ALGJH3o/0w5F2hRcROsxJXKSKlAw8sS7jCw+GjRS02yZB+dyttR+X0ZiOCqMx/0EnZMSE1awuvSPOqQPhx0UyS0wOBh1KHxm1fYx0PrxRI56KSerNUiCmqX2yH+PO59RlL2zbZx4ySkQRYo+N9x7Ixyt84WWWNKH5oWQO+WSqcBba6RdOfqmrzA9FYAj5vfxX7JmoDEf30cgN/RPvs1twa5lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RwoecyA6nfM2pTprTeqU0eUBVNOmadX4DEObW7GmXQs=;
 b=Ti2c6MmgCivQw4YCyq2B+ue4KcnGIPFu4vokPVcTzCoPhYyf+k34MNuEnVbaA+y1fJ/Sk/kkdKi5Wn425Pj/YdNKUAXlHZWw1LhuMZ3xT8mh5OsOR0etzLnMurx+bORjM9SpPL4zGLFu7Uq4NxArhguJdX1G9vIiTyG0vFURJ+7avhgR5krjRMIp2FVDxmzNDxW5bIK/9qY9eXMFG90mHnfuOVnyWQJ6pWRhbAGRpugptJ5PGo4UkAZWeYMtfMd335yC8UylBSzAoLgfbD/mJxkOFkIwbcfpBmlzPmQssbC5FKwwWY4wqPTQVZXq7R7ITaaGg5dFZVtiPKCPbLfgvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RwoecyA6nfM2pTprTeqU0eUBVNOmadX4DEObW7GmXQs=;
 b=e1S1zo0LC0u+pJWtVuE/KV/oC8ymRRPXULK4jWM3zYJz5Ra5uAXJTRNsiC1VxI1LKR87gpNwD5R1CljIduFxtgr5dX3tJaiSIe5/ohuXF3mIkr6QGb+0OSW4MNTfi/ZJjz2BvsLrRCOTxqQImTCZoI8igE5K4LqctnKkqMPCiv3ynpUvCdkFlQ6k39q/JOoff9e838DkA0PaZGEbBr/kcnjksCMOFi3EglSANQKFT+n4nxNaZIRQZNOTTV4gymwHoo5AYU0SRxLs2qJqbFmvqtr/5++TRG/RtYgMsBCUo3AzFAbjG23tzxadGCOX3hlMOYcJJXmAA6KNs4tgkahDWg==
Received: from DM6PR02CA0148.namprd02.prod.outlook.com (2603:10b6:5:332::15)
 by SA1PR12MB7344.namprd12.prod.outlook.com (2603:10b6:806:2b7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Fri, 7 Oct
 2022 05:51:16 +0000
Received: from DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:332:cafe::90) by DM6PR02CA0148.outlook.office365.com
 (2603:10b6:5:332::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Fri, 7 Oct 2022 05:51:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DM6NAM11FT060.mail.protection.outlook.com (10.13.173.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Fri, 7 Oct 2022 05:51:16 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 6 Oct 2022
 22:51:03 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 6 Oct 2022 22:51:03 -0700
Received: from nmalwade-dt.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Thu, 6 Oct 2022 22:51:02 -0700
From:   Ninad Malwade <nmalwade@nvidia.com>
To:     <nicolinc@nvidia.com>, <rkasirajan@nvidia.com>,
        <treding@nvidia.com>, <jonathanh@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, Ninad Malwade <nmalwade@nvidia.com>
Subject: [PATCH] ina3221: correct the update_interval value
Date:   Fri, 7 Oct 2022 13:50:42 +0800
Message-ID: <20221007055042.7020-1-nmalwade@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT060:EE_|SA1PR12MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b82e95e-4bbb-4456-082d-08daa827f317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J3DaTburpclTfPzJCm4YmvMnVC8AOoYplX4fLcox95OKuOZ20lg31Yclfg83dw2FnH3gIpWOinsQsVwcby/EyVmdIDTjJN2EusTpoN0dr1f7Kv7iDajOWaQcP5jcUv3R3LFWyXBhTJbvVgBI7+ApGf2LBIWnzqyXd/+LBFAyPFTSwjKzjX8HAz2+RtZRr6I5lTPldLGYV9sbc1jTNfv01qTCBiNeDOklFwy5IDJJ139ik8AZ8LbN0fX4soalBU6k35gEAtXYvj+8gZR0DjYCX4ebo5SxDHcA/VO96lMd2ySymD+jtQS8GKkF0MtLdx5SEIKJHw7QfcUWmRqqWyfx/VxMknMmXqnrClivGc/9wuQHhvW+9yfR6LAg8sXkCb8batFicsjh8exIYPAn9xvzkym0MzwGeblKksv3NE7adBabzRE1ZXxM1S6BWESczht8BW6zDmZJBc9OAVRaVc7yasUKYjwJUxKN24EJyUcohpLX6uD05JTzSc52xvaxg8EFciKFJJVBkr8MufajjnFMT+WRMkXZ/mmu5ePkCyWnP1Dlakl4+vWJ2t2b41jrl/49DXzijgH0JGI/46d888Q07ovj282vwh7EgkGj5FxE2O+jMV8p2A50v8htekGxpLv5X9IehUaDomJQjyY7lcLxQ+UIDbapOBYAtB/0enLJX79TkZb2MQV/4LDwjiZ/+YuQYFHU7+mGas9AE/FTzp+RxkOXcVIAxDU5wNtdf5v0gjwOdXGw5GHdMvtLXc1Aik9LrIvIiQld4uddV0ok5jkg9g==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199015)(46966006)(36840700001)(40470700004)(36860700001)(7636003)(47076005)(356005)(2906002)(86362001)(82740400003)(8676002)(4326008)(6636002)(40460700003)(70586007)(70206006)(316002)(8936002)(110136005)(54906003)(2616005)(15650500001)(41300700001)(5660300002)(1076003)(186003)(83380400001)(336012)(82310400005)(478600001)(426003)(6666004)(7696005)(26005)(107886003)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 05:51:16.0504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b82e95e-4bbb-4456-082d-08daa827f317
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7344
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

As per the INA3221 datasheet the samples value should not be
considered while calculating the update_interval value.
Section 8.4.2.2 from datasheet says - "The conversion-time
settings, along with the programmable-averaging mode, enable
the INA3221 to optimize available timing requirements in a given
application. For example, if a system requires data to be read
every 2 ms with all three channels monitored, configure the INA3221
with the conversion times for the shunt- and bus-voltage
measurements set to 332 μs"

As per above only conversion time and number of channels are
required to set the update_interval value. Correcting the same in
the driver.

Signed-off-by: Ninad Malwade <nmalwade@nvidia.com>
---
 Documentation/hwmon/ina3221.rst | 3 +--
 drivers/hwmon/ina3221.c         | 4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/hwmon/ina3221.rst b/Documentation/hwmon/ina3221.rst
index 8c12c54d2c24..a4f107d1e489 100644
--- a/Documentation/hwmon/ina3221.rst
+++ b/Documentation/hwmon/ina3221.rst
@@ -61,10 +61,9 @@ samples                 Number of samples using in the averaging mode.
 
 update_interval         Data conversion time in millisecond, following:
 
-                          update_interval = C x S x (BC + SC)
+                          update_interval = C x (BC + SC)
 
                           * C:	number of enabled channels
-                          * S:	number of samples
                           * BC:	bus-voltage conversion time in millisecond
                           * SC:	shunt-voltage conversion time in millisecond
 
diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index 2a57f4b60c29..e3aa57e3b039 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -183,11 +183,9 @@ static const int ina3221_avg_samples[] = {
 static inline u32 ina3221_interval_ms_to_conv_time(u16 config, int interval)
 {
 	u32 channels = hweight16(config & INA3221_CONFIG_CHs_EN_MASK);
-	u32 samples_idx = INA3221_CONFIG_AVG(config);
-	u32 samples = ina3221_avg_samples[samples_idx];
 
 	/* Bisect the result to Bus and Shunt conversion times */
-	return DIV_ROUND_CLOSEST(interval * 1000 / 2, channels * samples);
+	return DIV_ROUND_CLOSEST(interval / 2, channels);
 }
 
 /* Converting CONFIG register value to update_interval in usec */
-- 
2.17.1

