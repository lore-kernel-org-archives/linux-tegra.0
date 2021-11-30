Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C82C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Nov 2021 11:44:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235996AbhK3Lrc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Nov 2021 06:47:32 -0500
Received: from mail-mw2nam10on2046.outbound.protection.outlook.com ([40.107.94.46]:18112
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236512AbhK3Lrb (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Nov 2021 06:47:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRxgdqw8/lLyH9dG2IlOeOTYrw5278HQHMSHpn6UvvH50iZk2QawguQkqRhFiaM3GYViuxD133TZCKouwqtubFjO+3qt327L+gy30z/Q3gBhbgC257Ukw9S2oa4bxFWhFZ/R9guHDimCqwZVC/nkBzMwEISrC4Tk+fwnIuNvHXy9e8rctc6n0UfdaTj42rR+t6xMvSJwOO5eNh1u9ZaomaInwEDLvYmb+P+Qk79svqutSnVNSVe+/NshFTxorNIBHXAo3XXo638zOtugvScN7b2Gey/NLd+u+wW7U5k6027N8NRtO0/yt4oYjpAo5UiWu/o9JcRcvpJ7xtbJTZ7aew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIBTl1in1XHYBH1HWRFgUxsL/VJATiBj7N4x4/rlVVI=;
 b=OCImYTqZxQSNzj87keBBZNXs3BUNHZTCFGzmkcGX/bOmrOd8dS8Van5paisEFpdn+D4U9sfLO+gobaYXMc0BtT2W9nVwpXaVxs8kZBS5iGE1BE+B9L/f7e4UTLhR2c1ddKohx294AaejTgWOFkOF//bTy0ixxbBC+oVhOFz+YiWtjw9HWW/2oBd6b1fE4m+unEs84r6P7JIu7/KOnh9cG96DAG7etPSHznEDHqM8dQwnMm4QFnkpYcqiVakkbGutqMxBdFZ1mm9aqfKlNUkxHBnpN3c6sJhFkTfm5qQaPFZ+1J5LjsMQstL0jdntqcfYXUJpSauyiUXPAp/B6Y8M6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIBTl1in1XHYBH1HWRFgUxsL/VJATiBj7N4x4/rlVVI=;
 b=Jpc/qds02JY/X+l2T6MF3GycWy7W5hroiAYQosFi04rsnsBqFS9mJtJaAgXGKUtxZ8HdHTSJMIU4aCxQuEvIYZWXrTZ8jW1GuJT9saE5JYP1iKFaGCpfZyy7vKOhVB0f1F/tZyEtWUAZJmMNoayLGr6if5+Je1SUzLoVruwiLPpEBRhMoqMD7DxPp6K4ETJVvb6LGgkmBhu5hng+urqEX/hDSYkzThNsCqGB4RAnxG+uAWGeYLoWQiTUNqpCLRCF/wlK0qDmBOVx+1RjCIHKBmIGJprcwQvYe1XdyuyHXM77KN8ObXyBBhx/Chby03qdfof5W33ttqIsrLU80pRVyQ==
Received: from CO2PR06CA0072.namprd06.prod.outlook.com (2603:10b6:104:3::30)
 by MWHPR12MB1517.namprd12.prod.outlook.com (2603:10b6:301:10::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 11:44:11 +0000
Received: from CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:3:cafe::c2) by CO2PR06CA0072.outlook.office365.com
 (2603:10b6:104:3::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24 via Frontend
 Transport; Tue, 30 Nov 2021 11:44:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 CO1NAM11FT018.mail.protection.outlook.com (10.13.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4734.22 via Frontend Transport; Tue, 30 Nov 2021 11:44:11 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 30 Nov
 2021 11:44:10 +0000
Received: from moonraker.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 30 Nov 2021 11:44:09 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V3] soc/tegra: pmc: Add reboot notifier
Date:   Tue, 30 Nov 2021 11:44:06 +0000
Message-ID: <20211130114406.110021-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea1908df-5b23-4a92-1754-08d9b3f6b9e0
X-MS-TrafficTypeDiagnostic: MWHPR12MB1517:
X-Microsoft-Antispam-PRVS: <MWHPR12MB151774E644DB524BD84F6B0AD9679@MWHPR12MB1517.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R0mV/w6ynQr+OqewjKiPS/KdlUk2144GNh0r+I+TL74Wc+Sm9iIO8ncgiNkmt5VxsfxIoTh3I9emiNULgeauVxU7HgedSL/2/uvJelAlgqrcABbkQYnwqpsrzll3douwQUme815iXFvlkgjo3TI+cBWKiiPEXJga9vxe2uqcCOlHdPoDo+nfo/q6shuzWSxNVU3Ah92MBLXyEdACYPBwnAoCLK2wHI9czqHbV/aDusteCeZI4hGKJazfJneGi6bGF28NSNsMbi8GroJPESUqlA/kjekuqQ3VZ+bnFB9/7FPJiw1KKJ98l9BCV703JReUPcV1xv7IMMC2IL1bbEbqyjjBHWZxz6oFPkSAkmH4cyApfdRfhqQszVRSxylXKI2uS+DnDkIjG3MNBvJgv8yS0vfWWdLxzU807jjztCKa4nT8Ajz/rKBKfrsazOYMQ++zJWOUoRcNk0Rs1WqcNCeyDRdScJA/u6GhZRjIecl0Yvk1ta6gvUq9t+rPdW5M/a7N02sSMwoyxrC2Du3or69az2qS/IDHi0kbZlsjXxpSY9you0ap7KkJoAKqbN2KdqXhXD5ZW+Odi3D78ZhyG8vrjeU7x8itzrGvr3dnSmsV4ADPVgs2yEUNlGSqRsrTFiyCZvHKFc1d2DZptX62bTq0BC2Fia+/ktlM3RBpwvb/m2G3T2osHsKb7uLSUcDIy6BsmDePdLDzWU98kVzs/oZUn2t7aH4nDnTtPsaV8DN9yFtw1TONi9xcYUIOSV0DFAh6p1nQywFvnzbpJU/7+xwBrg==
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(107886003)(7696005)(2616005)(47076005)(8676002)(1076003)(508600001)(356005)(7636003)(36756003)(6916009)(36860700001)(86362001)(54906003)(336012)(83380400001)(2906002)(70206006)(5660300002)(70586007)(82310400004)(316002)(4326008)(186003)(26005)(6666004)(8936002)(426003)(40460700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 11:44:11.0374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea1908df-5b23-4a92-1754-08d9b3f6b9e0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1517
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The Tegra PMC driver implements a restart handler that supports Tegra
specific reboot commands such as placing the device into 'recovery' mode
in order to reprogram the platform. This is accomplished by setting the
appropriate bit in the PMC scratch0 register prior to rebooting the
platform.

For Tegra platforms that support PSCI or EFI, the default Tegra restart
handler is not called and the PSCI or EFI restart handler is called
instead. Hence, for Tegra platforms that support PSCI or EFI, the Tegra
specific reboot commands do not currently work. Fix this by moving the
code that programs the PMC scratch0 register into a separate reboot
notifier that will always be called on reboot.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes since V2:
- Don't call tegra_pmc_program_reboot_reason() a 2nd time from the
  restart notifier.

Changes since V1:
- Don't change the behaviour for writing scratch0 register when the
  notifier is called.

 drivers/soc/tegra/pmc.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 575d6d5b4294..6db0e31ac6fa 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1064,10 +1064,8 @@ int tegra_pmc_cpu_remove_clamping(unsigned int cpuid)
 	return tegra_powergate_remove_clamping(id);
 }
 
-static int tegra_pmc_restart_notify(struct notifier_block *this,
-				    unsigned long action, void *data)
+static void tegra_pmc_program_reboot_reason(const char *cmd)
 {
-	const char *cmd = data;
 	u32 value;
 
 	value = tegra_pmc_scratch_readl(pmc, pmc->soc->regs->scratch0);
@@ -1085,6 +1083,25 @@ static int tegra_pmc_restart_notify(struct notifier_block *this,
 	}
 
 	tegra_pmc_scratch_writel(pmc, value, pmc->soc->regs->scratch0);
+}
+
+static int tegra_pmc_reboot_notify(struct notifier_block *this,
+				   unsigned long action, void *data)
+{
+	if (action == SYS_RESTART)
+		tegra_pmc_program_reboot_reason(data);
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block tegra_pmc_reboot_notifier = {
+	.notifier_call = tegra_pmc_reboot_notify,
+};
+
+static int tegra_pmc_restart_notify(struct notifier_block *this,
+				    unsigned long action, void *data)
+{
+	u32 value;
 
 	/* reset everything but PMC_SCRATCH0 and PMC_RST_STATUS */
 	value = tegra_pmc_readl(pmc, PMC_CNTRL);
@@ -2890,6 +2907,14 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 			goto cleanup_sysfs;
 	}
 
+	err = devm_register_reboot_notifier(&pdev->dev,
+					    &tegra_pmc_reboot_notifier);
+	if (err) {
+		dev_err(&pdev->dev, "unable to register reboot notifier, %d\n",
+			err);
+		goto cleanup_debugfs;
+	}
+
 	err = register_restart_handler(&tegra_pmc_restart_handler);
 	if (err) {
 		dev_err(&pdev->dev, "unable to register restart handler, %d\n",
-- 
2.25.1

