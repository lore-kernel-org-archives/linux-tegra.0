Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C53C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Nov 2021 11:11:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234292AbhKWLOx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Nov 2021 06:14:53 -0500
Received: from mail-mw2nam12on2080.outbound.protection.outlook.com ([40.107.244.80]:26336
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234829AbhKWLOw (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Nov 2021 06:14:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m5khC74j+i07IaYCyCWacgiJ4b8ucBdWp/4+i/UdKx22wcwtczld3wqR+CSs2Iny+UGchpSW8Ti4hdrK0O+V+AXH+34y4dHRR595j6S9zjPDewm0GpUGxc8Mb4drrgpXyVrTFGcV4hXxx4DLCXoo19quNnypwbxDmZadhIvJVGnx9654o7PsKLOzZhgwXya+9JUzu9a7QVLDXchAtyQyRi8R3TEx/SD1ROe3OoXugOmuxZOgECs+uk4SbKSJiro8M8//zD+ORbiZDJ2iihXCsCWUmIQ3AYM37l3t/oxgQEjZ0X/v3geAp/zMEg+3cBDeyWt9b96LTjeqTRIg4WTsCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYMaRNGP1wuPLE7DTNegQcvuPOZEq3AgHtUE1gDHklg=;
 b=JG/H+NibbY/SL017MfiNFgWbVUgT+5WcGRgUPhgkXHwOlujVfrrXTFXsgIh++JC71yCRYw/IDgip0s2EPTzWKo91OQyePOG716YcxPd8MUEQtm0a+K0OmJsutD8VGDxdSBvdonj0Ki0p1u1QKCCrnyF+3lIGyiqMp4rLaSX/Y2+jfffKrADJS/3I79Gx5NyWAXBWljytBe8nrRhi4DGgf9fl3TpVUs8cgrF2DOmKidiYPdyzyL7LNMNNL8z/ngXqSrFxLZf4n0cTW46tgenSIhASG1KSty/RX1nr8OrZmpgA9TmqmnG0p1CyoxTliB1Z9WxU/nko7E/fBpNmJEFWBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYMaRNGP1wuPLE7DTNegQcvuPOZEq3AgHtUE1gDHklg=;
 b=N20Pc42MUTwd0oSqF0bKEUqZRgEyHa0j72yxkX0s2/zLOlmqay7Q+NkClYIsl5SiObFGlZYnf3nnjJO+Rr4EX27NVKlHv/Zn7LrNuTw8e6iwghioNHmmQiS9cve3hqTawylDZjIdlJf6TISC/EMXXQPThPS2MpKugd2Br2TFBFNb4XcEGwIDELqWa28joeQZuXGcwFiMam6drgIVF8tEjRiMgrbh1gtNpoDvrlcRQW/vc084iTz6IYAAkHtOC0vnXwVM+hTQiyfR5K1eicz9OAIn2Yq02lormR8legA32tT6n2YsgZYVYbmaWiqjh8T4/swBU66jHEzpRAMpS3db0Q==
Received: from DM5PR19CA0018.namprd19.prod.outlook.com (2603:10b6:3:151::28)
 by BL0PR12MB4995.namprd12.prod.outlook.com (2603:10b6:208:1c7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 11:11:43 +0000
Received: from DM6NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:151:cafe::75) by DM5PR19CA0018.outlook.office365.com
 (2603:10b6:3:151::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20 via Frontend
 Transport; Tue, 23 Nov 2021 11:11:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT061.mail.protection.outlook.com (10.13.173.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Tue, 23 Nov 2021 11:11:43 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 23 Nov
 2021 11:11:42 +0000
Received: from moonraker.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 23 Nov 2021 03:11:41 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2] soc/tegra: pmc: Add reboot notifier
Date:   Tue, 23 Nov 2021 11:11:34 +0000
Message-ID: <20211123111134.26409-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9484d341-dd67-4f8f-887a-08d9ae72081b
X-MS-TrafficTypeDiagnostic: BL0PR12MB4995:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4995E16A7FE8EE998F978988D9609@BL0PR12MB4995.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ws9Opq7QEv0lz2wK+LXJlBKkV4FimA6DhtKl/jeh4uTcvbZUmioJYBb2+QjPlGAyguiY4uugY2ewvw4o8jGLs0SqiZ0bagNMufLN7ubspvOWLilx8QCVYVeSM6hhq9cstx8mC01hkw90idGuOjxqVIcnMFZxClTmnWLH9f3/zMLwj+DRYMhWza8kz4/XoE31lRNi34fY/Yz3ORzbsZ6uzk9cntP6xFrDHcvcuH6foJY+xooIFClopUeV2ovAAeRipeSyBZ9rIw1O8NxQH6VefURLeDx6rN6y8Iq99AXyMKskoR7lnbDDxpu8Pvla+O83N1DmHrh8hlP4MUgUluo6UJAobgNHA8/IvF19oqwy1BqzRn2w7qUv8tD26eGCaOP5cgl/zJAhtM44dsvSpGbx1ZuIGdjXkVrma1fCHZmSjsjbwtUoLQq7tLZwWkuCDlQOEeVWI8UIVcVNhAmFDXZ1X4lk+iT/Oyg3qhVNo2aoG2NQb1U1XnkI+AtGV2AO/eIeoFlTU/9MVDdO0eop66gPf5WDDsWdXheT43CI5GWEaF8MbH4iJKObZbfL+axYr1wwquBQQXjEE5e+f5g/OS9KESOEQ9ksNurH+yEJwvFs1hTgvh+Ad6viDSlj4mwZi8WeL76glZ4SJefcZQZSsDogPP7MeRqaCR9lX3s/M+ETM5PxzGhzepdjp/jU+T7jzdgcyOy3yHHbdjSZubMlwsmjdg==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(86362001)(83380400001)(7696005)(2906002)(6666004)(26005)(7636003)(426003)(186003)(2616005)(70586007)(4326008)(36860700001)(70206006)(8936002)(336012)(47076005)(107886003)(356005)(508600001)(6916009)(36756003)(316002)(1076003)(54906003)(82310400004)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 11:11:43.3933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9484d341-dd67-4f8f-887a-08d9ae72081b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4995
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
Changes since V1:
- Don't change the behaviour for writing scratch0 register when the
  notifier is called.

 drivers/soc/tegra/pmc.c | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 575d6d5b4294..bb2f39597823 100644
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
@@ -1085,6 +1083,27 @@ static int tegra_pmc_restart_notify(struct notifier_block *this,
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
+
+	tegra_pmc_program_reboot_reason(data);
 
 	/* reset everything but PMC_SCRATCH0 and PMC_RST_STATUS */
 	value = tegra_pmc_readl(pmc, PMC_CNTRL);
@@ -2890,6 +2909,14 @@ static int tegra_pmc_probe(struct platform_device *pdev)
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

