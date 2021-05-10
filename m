Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CE6C433ED
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 22:07:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E62B761601
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 22:07:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbhEJWI0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 18:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbhEJWIZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 18:08:25 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 974A7C061760;
        Mon, 10 May 2021 15:07:19 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id w4so22677258ljw.9;
        Mon, 10 May 2021 15:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SCUHjLezGOSYgdMDmUZ9lrsTkgiruZl3MogFURlEJ9Q=;
        b=j1n+Hoh3eQg7qrrGj+35pqOiCbB1t+XawliKITmQAdK4MIHp8g5VhoGQEYfKlciU1T
         Hh/zC9vtsUaf0Yq3tcTg/Mqfpq93pSITyM54IHEClyeYIsFqjoOfNoM9CkHtztjYOhzZ
         ElOH8oABQtd7shq7GZ/3AQFhDW/wADFh1CvoWPfJysE017PXAc5glnW5Yuj/FK+HA/n8
         oRpYGSbE1H1yR/CgypMv3WzHhzkxF2GB1VbUOjtxVs0vw/gYyGQnFxxtw/wKFsPTdKHD
         sam0yjxg+LM0r6OcQHqd1yArIQZuaY0ziFvi+Lt3R/g1DZ4U+zeCmk3P4I5VJJVnWECn
         ih8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SCUHjLezGOSYgdMDmUZ9lrsTkgiruZl3MogFURlEJ9Q=;
        b=qAAT8tMsXSI0uoj/daFxtXuFDG/1Cp0OsM+AXKBv3A7YO6NVoxcRwXc0Ep8mseoFcq
         /9fYKXzEAPnx6Qx/cbY7Fwj3frPeqPPhOgIMY55ppD/FiyAiIZHdWasIX1kopqDzxOyO
         3jvUMVy+hIt1mS5N5uigd/UXbzvEyHGkC6x8iyTdwGL3/+OU50m5r0M273x4W3KWjDus
         zQI7f/EuETSxmbuf9ojvBqMRbVMAbDvEbOJpQbrcGzddS+w8qInUnd5NzvmRIgSfHLLJ
         eP5TA1StmK4/RKPCtfCYKOkbTT7+K9ig0qBJ+CCaHmvey3mqYTNMmW/ziypm0jAcFdss
         CYLA==
X-Gm-Message-State: AOAM531CPArcVrjB2aelxAXuyqpgHLHtSYFYIAmoLb+FFS8pZEZWRikM
        dgVlaM9ji/YIg9RpyzEBmUE=
X-Google-Smtp-Source: ABdhPJySzGJhfuE92UftyShMjDQCxnI9mIfBTIb4ii1zBz6jR03XsFma9EQhU4e05Jy2oLGCNOiXZQ==
X-Received: by 2002:a05:651c:118c:: with SMTP id w12mr21668267ljo.405.1620684438119;
        Mon, 10 May 2021 15:07:18 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id v14sm2390850lfb.201.2021.05.10.15.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 15:07:17 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        =?UTF-8?q?Nikola=20Milosavljevi=C4=87?= <mnidza@outlook.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 2/2] soc/tegra: regulators: Bump voltages on system reboot
Date:   Tue, 11 May 2021 01:05:26 +0300
Message-Id: <20210510220526.11113-3-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510220526.11113-1-digetx@gmail.com>
References: <20210510220526.11113-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Ensure that SoC voltages are at a level suitable for a system reboot.
This is important for some devices that use CPU reset method for the
rebooting. SoC CPU and core voltages now are be restored to a level
that is suitable for rebooting. This patch fixes hang on reboot on
Asus Transformer TF101, it was also reported as fixing some of reboot
issues on Toshiba AC100.

Reported-by: Nikola Milosavljević <mnidza@outlook.com>
Tested-by: Nikola Milosavljević <mnidza@outlook.com> # TF101
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/regulators-tegra20.c | 77 ++++++++++++++++++++++++-
 drivers/soc/tegra/regulators-tegra30.c | 80 +++++++++++++++++++++++++-
 2 files changed, 153 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/tegra/regulators-tegra20.c b/drivers/soc/tegra/regulators-tegra20.c
index e2c11d442591..81787ae3d03e 100644
--- a/drivers/soc/tegra/regulators-tegra20.c
+++ b/drivers/soc/tegra/regulators-tegra20.c
@@ -12,6 +12,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
+#include <linux/reboot.h>
 #include <linux/regulator/coupler.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
@@ -23,7 +24,10 @@ struct tegra_regulator_coupler {
 	struct regulator_dev *core_rdev;
 	struct regulator_dev *cpu_rdev;
 	struct regulator_dev *rtc_rdev;
-	int core_min_uV;
+	struct notifier_block reboot_notifier;
+	int core_min_uV, cpu_min_uV;
+	bool sys_reboot_mode_req;
+	bool sys_reboot_mode;
 };
 
 static inline struct tegra_regulator_coupler *
@@ -50,7 +54,7 @@ static int tegra20_core_limit(struct tegra_regulator_coupler *tegra,
 	 * This means that we can't fully allow CORE voltage scaling until
 	 * the state of all DVFS-critical CORE devices is synced.
 	 */
-	if (tegra_soc_core_domain_state_synced()) {
+	if (tegra_soc_core_domain_state_synced() && !tegra->sys_reboot_mode) {
 		pr_info_once("voltage state synced\n");
 		return 0;
 	}
@@ -259,6 +263,10 @@ static int tegra20_cpu_voltage_update(struct tegra_regulator_coupler *tegra,
 	if (cpu_uV < 0)
 		return cpu_uV;
 
+	/* store boot voltage level */
+	if (!tegra->cpu_min_uV)
+		tegra->cpu_min_uV = cpu_uV;
+
 	/*
 	 * CPU's regulator may not have any consumers, hence the voltage
 	 * must not be changed in that case because CPU simply won't
@@ -267,6 +275,10 @@ static int tegra20_cpu_voltage_update(struct tegra_regulator_coupler *tegra,
 	if (!cpu_min_uV_consumers)
 		cpu_min_uV = cpu_uV;
 
+	/* restore boot voltage level */
+	if (tegra->sys_reboot_mode)
+		cpu_min_uV = max(cpu_min_uV, tegra->cpu_min_uV);
+
 	if (cpu_min_uV > cpu_uV) {
 		err = tegra20_core_rtc_update(tegra, core_rdev, rtc_rdev,
 					      cpu_uV, cpu_min_uV);
@@ -307,6 +319,8 @@ static int tegra20_regulator_balance_voltage(struct regulator_coupler *coupler,
 		return -EINVAL;
 	}
 
+	tegra->sys_reboot_mode = READ_ONCE(tegra->sys_reboot_mode_req);
+
 	if (rdev == cpu_rdev)
 		return tegra20_cpu_voltage_update(tegra, cpu_rdev,
 						  core_rdev, rtc_rdev);
@@ -320,6 +334,51 @@ static int tegra20_regulator_balance_voltage(struct regulator_coupler *coupler,
 	return -EPERM;
 }
 
+static int tegra20_regulator_prepare_reboot(struct tegra_regulator_coupler *tegra,
+					    bool sys_reboot_mode)
+{
+	int err;
+
+	if (!tegra->core_rdev || !tegra->rtc_rdev || !tegra->cpu_rdev)
+		return 0;
+
+	WRITE_ONCE(tegra->sys_reboot_mode_req, true);
+
+	/*
+	 * Some devices use CPU soft-reboot method and in this case we
+	 * should ensure that voltages are sane for the reboot by restoring
+	 * the minimum boot levels.
+	 */
+	err = regulator_sync_voltage_rdev(tegra->cpu_rdev);
+	if (err)
+		return err;
+
+	err = regulator_sync_voltage_rdev(tegra->core_rdev);
+	if (err)
+		return err;
+
+	WRITE_ONCE(tegra->sys_reboot_mode_req, sys_reboot_mode);
+
+	return 0;
+}
+
+static int tegra20_regulator_reboot(struct notifier_block *notifier,
+				    unsigned long event, void *cmd)
+{
+	struct tegra_regulator_coupler *tegra;
+	int ret;
+
+	if (event != SYS_RESTART)
+		return NOTIFY_DONE;
+
+	tegra = container_of(notifier, struct tegra_regulator_coupler,
+			     reboot_notifier);
+
+	ret = tegra20_regulator_prepare_reboot(tegra, true);
+
+	return notifier_from_errno(ret);
+}
+
 static int tegra20_regulator_attach(struct regulator_coupler *coupler,
 				    struct regulator_dev *rdev)
 {
@@ -352,6 +411,14 @@ static int tegra20_regulator_detach(struct regulator_coupler *coupler,
 {
 	struct tegra_regulator_coupler *tegra = to_tegra_coupler(coupler);
 
+	/*
+	 * We don't expect regulators to be decoupled during reboot,
+	 * this may race with the reboot handler and shouldn't ever
+	 * happen in practice.
+	 */
+	if (WARN_ON_ONCE(system_state > SYSTEM_RUNNING))
+		return -EPERM;
+
 	if (tegra->core_rdev == rdev) {
 		tegra->core_rdev = NULL;
 		return 0;
@@ -376,13 +443,19 @@ static struct tegra_regulator_coupler tegra20_coupler = {
 		.detach_regulator = tegra20_regulator_detach,
 		.balance_voltage = tegra20_regulator_balance_voltage,
 	},
+	.reboot_notifier.notifier_call = tegra20_regulator_reboot,
 };
 
 static int __init tegra_regulator_coupler_init(void)
 {
+	int err;
+
 	if (!of_machine_is_compatible("nvidia,tegra20"))
 		return 0;
 
+	err = register_reboot_notifier(&tegra20_coupler.reboot_notifier);
+	WARN_ON(err);
+
 	return regulator_coupler_register(&tegra20_coupler.coupler);
 }
 arch_initcall(tegra_regulator_coupler_init);
diff --git a/drivers/soc/tegra/regulators-tegra30.c b/drivers/soc/tegra/regulators-tegra30.c
index 42d675b79fa3..e0203f78b396 100644
--- a/drivers/soc/tegra/regulators-tegra30.c
+++ b/drivers/soc/tegra/regulators-tegra30.c
@@ -12,6 +12,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
+#include <linux/reboot.h>
 #include <linux/regulator/coupler.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
@@ -23,7 +24,10 @@ struct tegra_regulator_coupler {
 	struct regulator_coupler coupler;
 	struct regulator_dev *core_rdev;
 	struct regulator_dev *cpu_rdev;
-	int core_min_uV;
+	struct notifier_block reboot_notifier;
+	int core_min_uV, cpu_min_uV;
+	bool sys_reboot_mode_req;
+	bool sys_reboot_mode;
 };
 
 static inline struct tegra_regulator_coupler *
@@ -50,7 +54,7 @@ static int tegra30_core_limit(struct tegra_regulator_coupler *tegra,
 	 * This means that we can't fully allow CORE voltage scaling until
 	 * the state of all DVFS-critical CORE devices is synced.
 	 */
-	if (tegra_soc_core_domain_state_synced()) {
+	if (tegra_soc_core_domain_state_synced() && !tegra->sys_reboot_mode) {
 		pr_info_once("voltage state synced\n");
 		return 0;
 	}
@@ -188,6 +192,10 @@ static int tegra30_voltage_update(struct tegra_regulator_coupler *tegra,
 	if (cpu_uV < 0)
 		return cpu_uV;
 
+	/* store boot voltage level */
+	if (!tegra->cpu_min_uV)
+		tegra->cpu_min_uV = cpu_uV;
+
 	/*
 	 * CPU's regulator may not have any consumers, hence the voltage
 	 * must not be changed in that case because CPU simply won't
@@ -211,6 +219,10 @@ static int tegra30_voltage_update(struct tegra_regulator_coupler *tegra,
 	if (err)
 		return err;
 
+	/* restore boot voltage level */
+	if (tegra->sys_reboot_mode)
+		cpu_min_uV = max(cpu_min_uV, tegra->cpu_min_uV);
+
 	if (core_min_limited_uV > core_uV) {
 		pr_err("core voltage constraint violated: %d %d %d\n",
 		       core_uV, core_min_limited_uV, cpu_uV);
@@ -279,9 +291,56 @@ static int tegra30_regulator_balance_voltage(struct regulator_coupler *coupler,
 		return -EINVAL;
 	}
 
+	tegra->sys_reboot_mode = READ_ONCE(tegra->sys_reboot_mode_req);
+
 	return tegra30_voltage_update(tegra, cpu_rdev, core_rdev);
 }
 
+static int tegra30_regulator_prepare_reboot(struct tegra_regulator_coupler *tegra,
+					    bool sys_reboot_mode)
+{
+	int err;
+
+	if (!tegra->core_rdev || !tegra->cpu_rdev)
+		return 0;
+
+	WRITE_ONCE(tegra->sys_reboot_mode_req, true);
+
+	/*
+	 * Some devices use CPU soft-reboot method and in this case we
+	 * should ensure that voltages are sane for the reboot by restoring
+	 * the minimum boot levels.
+	 */
+	err = regulator_sync_voltage_rdev(tegra->cpu_rdev);
+	if (err)
+		return err;
+
+	err = regulator_sync_voltage_rdev(tegra->core_rdev);
+	if (err)
+		return err;
+
+	WRITE_ONCE(tegra->sys_reboot_mode_req, sys_reboot_mode);
+
+	return 0;
+}
+
+static int tegra30_regulator_reboot(struct notifier_block *notifier,
+				    unsigned long event, void *cmd)
+{
+	struct tegra_regulator_coupler *tegra;
+	int ret;
+
+	if (event != SYS_RESTART)
+		return NOTIFY_DONE;
+
+	tegra = container_of(notifier, struct tegra_regulator_coupler,
+			     reboot_notifier);
+
+	ret = tegra30_regulator_prepare_reboot(tegra, true);
+
+	return notifier_from_errno(ret);
+}
+
 static int tegra30_regulator_attach(struct regulator_coupler *coupler,
 				    struct regulator_dev *rdev)
 {
@@ -308,6 +367,17 @@ static int tegra30_regulator_detach(struct regulator_coupler *coupler,
 {
 	struct tegra_regulator_coupler *tegra = to_tegra_coupler(coupler);
 
+	/*
+	 * We don't expect regulators to be decoupled during reboot,
+	 * this may race with the reboot handler and shouldn't ever
+	 * happen in practice.
+	 */
+	if (WARN_ON_ONCE(system_state > SYSTEM_RUNNING))
+		return -EPERM;
+
+	/* bring regulators to the state that is safe for reboot */
+	tegra30_regulator_prepare_reboot(tegra, false);
+
 	if (tegra->core_rdev == rdev) {
 		tegra->core_rdev = NULL;
 		return 0;
@@ -327,13 +397,19 @@ static struct tegra_regulator_coupler tegra30_coupler = {
 		.detach_regulator = tegra30_regulator_detach,
 		.balance_voltage = tegra30_regulator_balance_voltage,
 	},
+	.reboot_notifier.notifier_call = tegra30_regulator_reboot,
 };
 
 static int __init tegra_regulator_coupler_init(void)
 {
+	int err;
+
 	if (!of_machine_is_compatible("nvidia,tegra30"))
 		return 0;
 
+	err = register_reboot_notifier(&tegra30_coupler.reboot_notifier);
+	WARN_ON(err);
+
 	return regulator_coupler_register(&tegra30_coupler.coupler);
 }
 arch_initcall(tegra_regulator_coupler_init);
-- 
2.30.2

