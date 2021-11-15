Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E41C433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Nov 2021 11:32:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8221A61C4F
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Nov 2021 11:32:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbhKOLfM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 15 Nov 2021 06:35:12 -0500
Received: from mail-mw2nam10on2040.outbound.protection.outlook.com ([40.107.94.40]:7904
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230126AbhKOLfJ (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 Nov 2021 06:35:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsxdUo0HwRGTFMyuS90NXXlDkUYXFilLJ+T112ihaDc/Np/BFC/KFMo2VHbVe+ynvN1L7gSYsOU1oZyzQmOHRb1IuUzlAX2NRpEcXiD3uoN1qVMNGSRMM+wlGnnwRwrX59CLnXIFwvk6o8aINS9l9cc0gt23LQ/+Ta4SUciVsy2jvQVnEfUfGFGI2Wswshx3hGYzpTz/TSVDodOZnlZhk8GHyaoTQRiAxvQLlNfgbrOnWWu4D4qRMkKMaJ7AEr2UJQM6pKPmgJDyQzNA8tNQaNSh1RZDDp62nqXOq4o+RKp9LznnjBI0ojNkOzJldiqY5a7cuyR4n0zU26VbnT+N/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOmoRmwC++BC3y/ohhH08ROVyCCWWL/J0Q9XAmKouvY=;
 b=DZoOIJ+XHBqa5+nJahsa/OrmPY8ym6rM0kh641XIanKHmtYPD7p+Fhazba6JJqJihQ7IUvvPBBS0DRvANSh02hTaA1brmhKjEv5X+pihyo5IAL4niwPKJKdVRQZ60+npP11F/ftK/l7K07HzgmRLTsAufBsDa0pEE40GoDwFyNdS4g1cTlOcfn+38ASa5IdmO9YUwOaWN9R/MNgcxERXlYuNHjtMbZbbdhZ8rBEVKpWvyjioWzNJp9BwaikesU1pY5mL+94FvNqkc/qjGahvqeq/9n8UnU8VXSV14brlH8mFUsBZ2+FOHZTIJzcitnIAoiga5WRsSbo6gcTj3lHfng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOmoRmwC++BC3y/ohhH08ROVyCCWWL/J0Q9XAmKouvY=;
 b=G/CERUqb69nSVdpQr9DnbqBQ8VrkbWks8HnD/PycviMRMnWW+FIETy/s9yC0DPCBgl0EuMJLXo6eSXucVYcO0aC2/GLMdsO2EyZmBVo3M55PJL7yg5CNZwP73WXi2RnDXeZWbQIHnJUQBQcowNCSlRluoMvmOnZg30CvsibwlAnGDSRGF7tv+vwfUo9fdmI7ZOllT2INo/2T3K7Cdk89OJff1eQlarxS1pIIWHMxZryaZtFsTOmYHva86hsIe7PW1y5pN9ssmPB7c85OGnlLsdwJTV/bbW3cUU17Dx0hP+U885QizMzC+ZCz/MKxZvxeNxCEiGvffQa8VB9e+HtxHA==
Received: from DM6PR03CA0053.namprd03.prod.outlook.com (2603:10b6:5:100::30)
 by BN6PR12MB1409.namprd12.prod.outlook.com (2603:10b6:404:1e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Mon, 15 Nov
 2021 11:32:12 +0000
Received: from DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::6c) by DM6PR03CA0053.outlook.office365.com
 (2603:10b6:5:100::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Mon, 15 Nov 2021 11:32:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT046.mail.protection.outlook.com (10.13.172.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4690.15 via Frontend Transport; Mon, 15 Nov 2021 11:32:11 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 15 Nov
 2021 11:32:11 +0000
Received: from moonraker.home (172.20.187.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 15 Nov 2021 11:32:10 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] soc/tegra: pmc: Add reboot notifier
Date:   Mon, 15 Nov 2021 11:32:08 +0000
Message-ID: <20211115113208.237296-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe0b40f4-02e3-40b3-068e-08d9a82b910f
X-MS-TrafficTypeDiagnostic: BN6PR12MB1409:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1409FE7D683174EAC3916E30D9989@BN6PR12MB1409.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BYdSSKM1lPHLrabecExPyENgb8PgtVoQHZw2VKQG0KwEbbGoMyUA6PnDC+z6k5MSwMf64XYwR7YNXF/jV6L7HbQtZtNPaBeqd5yDNybeDYan+dqey/uMxbBHltf9/3VeDkFZ13p+VwoAdcXj7k2TUnlpXO2D8zU0qi/ZBKTfPV/6rFPZcBrNaWjfAAbpejTBIUCnAztXYpcT1GfDz4ut9A5TWBys94auDbvB1K995eIxY9WXrGXvphbVLxmHgrHyzbQFBaaKTOG8G8iWWABIg1xj3BUDNUoFw6k47H7SW2mBfskwoA7nanf1i9xlBs0eIGEKC08DuPP+Ugv+sS9zQCt19JNbO1M7BoULwN14bihBMw1/KPSxnkLTRlgD6dwhzoH7k/LexttOF6huUyq/kq1VfrRXqBNCqRyGPm5Iov9Z9BrHQVSZr6yVxBB5ftCgrG9LHwcfVRvn3ZVCTDZWx7/0ybon6txbPFtu57C3qUADMdMMSMbQtcKbS0mPjCymSutfJ2WfYPYtk9kXnEJpnBb1WnxFbgkemRx1Va63XdB0du0KFNR32GJb0l00QMqO5ZYKb74hlrHbFXTiVD1O5nidWPkAHPUT+P4UFBya0HdGuNjizttrqssmOoL7R0ki7gxWwNTDmK+QD6/ww8vseH9ErehNdOdoEHMTgYfJ9WE+0ihPsYmPjGJXkSymUdrBeVmkVoe7ik3oXOvmUgtyDg==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(508600001)(70586007)(47076005)(2906002)(83380400001)(1076003)(8676002)(7636003)(70206006)(426003)(356005)(82310400003)(6916009)(36860700001)(36756003)(107886003)(4326008)(5660300002)(186003)(316002)(26005)(86362001)(8936002)(54906003)(336012)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 11:32:11.9207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe0b40f4-02e3-40b3-068e-08d9a82b910f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1409
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
 drivers/soc/tegra/pmc.c | 50 ++++++++++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 575d6d5b4294..19357ad9f46a 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1064,27 +1064,47 @@ int tegra_pmc_cpu_remove_clamping(unsigned int cpuid)
 	return tegra_powergate_remove_clamping(id);
 }
 
-static int tegra_pmc_restart_notify(struct notifier_block *this,
-				    unsigned long action, void *data)
+static void tegra_pmc_program_reboot_reason(const char *cmd)
 {
-	const char *cmd = data;
 	u32 value;
 
+	if (!cmd)
+		return;
+
 	value = tegra_pmc_scratch_readl(pmc, pmc->soc->regs->scratch0);
 	value &= ~PMC_SCRATCH0_MODE_MASK;
 
-	if (cmd) {
-		if (strcmp(cmd, "recovery") == 0)
-			value |= PMC_SCRATCH0_MODE_RECOVERY;
+	if (strcmp(cmd, "recovery") == 0)
+		value |= PMC_SCRATCH0_MODE_RECOVERY;
 
-		if (strcmp(cmd, "bootloader") == 0)
-			value |= PMC_SCRATCH0_MODE_BOOTLOADER;
+	if (strcmp(cmd, "bootloader") == 0)
+		value |= PMC_SCRATCH0_MODE_BOOTLOADER;
 
-		if (strcmp(cmd, "forced-recovery") == 0)
-			value |= PMC_SCRATCH0_MODE_RCM;
-	}
+	if (strcmp(cmd, "forced-recovery") == 0)
+		value |= PMC_SCRATCH0_MODE_RCM;
 
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
@@ -2890,6 +2910,14 @@ static int tegra_pmc_probe(struct platform_device *pdev)
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

