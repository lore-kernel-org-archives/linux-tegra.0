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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CAFFC43462
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 22:21:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3D876115C
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 22:21:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbhEPWWr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 16 May 2021 18:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbhEPWWp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 16 May 2021 18:22:45 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD6EC06174A;
        Sun, 16 May 2021 15:21:28 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id i9so5913481lfe.13;
        Sun, 16 May 2021 15:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zLZwOwVhuIbHTTUdoWppFfwsPZfVF88GWvkyOwsujd4=;
        b=VvCEJxQ2petXYK6A8dPh/7YBxNvD0EcEf9f2MDBdmXjhWg0LemgR889L//dkOhdT40
         fkAEBdCHVsdfu1RgLz5MzNtG0cJQnkbkmNTg4KegmKzMbgzZEbS6I0zQAGD2GdiPjpdK
         tfp3Wk+sNk1cHovJX5FkiFvYnVuTyilf2k4/t2M6F5tgG3Ya8ADjE8uhlldxncG4lHWZ
         Z2E7NnUliaoxU4B4w3xSJYe7oo94WaJ3LVIWJohtmTAiZrqC65jmm33j2PlCoDzEtOJZ
         In08ZPtQm0xt9wNryE+gOD18CtA+mhx0f3Bnm8caWPSJt3qpHdj+jNwoB08I4vWSGoZY
         ZPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zLZwOwVhuIbHTTUdoWppFfwsPZfVF88GWvkyOwsujd4=;
        b=Lg5FeeaqVytoElQOrMUjalWl1mMzOMdgmLZP6UsYNMn18LipZ3yzil778ypk3kCHoQ
         sqvzHZJUu4oOE+XtKKh0YPGcXPOuVn1Lo5U83tdX0qHuLuo0VJVAnJ+VBv5NDHuJKfLw
         qzxWtUWZt9T3XGZZiFrFPSZGI3IW4vD0gpCnZHfc0AlaWOi8W6PyGHZJVUQdDkB2Tf61
         ng4uEsAkFY3pwUYvoIofUH5xqvE1Qj97Mq9iM1q2rRcZvi4NzeN5f2Mazo+L18ynF8Rm
         p3pMgccdVpldQvXCRVd1IrsRBnUNFN0W7sn93Ln5uWTYRLu7svIzPbMeMK1wr2xUB2y2
         vRYw==
X-Gm-Message-State: AOAM530c42kbL3OSCWmSEXiPsiU4jegzRiy9CdS7pT8FIjgHzyok+erJ
        5LV3WJ3e/Vkgg1n3FOIT66Y=
X-Google-Smtp-Source: ABdhPJydgl0ae+kpg5cchbLjeVIlABff9WGVozSoQx961ibHjiw9rzP0mSSi8/wgWUvSya2GyVtt/w==
X-Received: by 2002:a05:6512:1190:: with SMTP id g16mr41508135lfr.342.1621203687244;
        Sun, 16 May 2021 15:21:27 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id q27sm2680275ljm.127.2021.05.16.15.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:21:27 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        =?UTF-8?q?Nikola=20Milosavljevi=C4=87?= <mnidza@outlook.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 2/2] soc/tegra: regulators: Bump voltages on system reboot
Date:   Mon, 17 May 2021 01:21:02 +0300
Message-Id: <20210516222103.28595-3-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516222103.28595-1-digetx@gmail.com>
References: <20210516222103.28595-1-digetx@gmail.com>
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
 drivers/soc/tegra/regulators-tegra20.c | 75 ++++++++++++++++++++++++-
 drivers/soc/tegra/regulators-tegra30.c | 78 +++++++++++++++++++++++++-
 2 files changed, 151 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/regulators-tegra20.c b/drivers/soc/tegra/regulators-tegra20.c
index 367a71a3cd10..3479be5ee494 100644
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
@@ -21,7 +22,10 @@ struct tegra_regulator_coupler {
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
@@ -242,6 +246,10 @@ static int tegra20_cpu_voltage_update(struct tegra_regulator_coupler *tegra,
 	if (cpu_uV < 0)
 		return cpu_uV;
 
+	/* store boot voltage level */
+	if (!tegra->cpu_min_uV)
+		tegra->cpu_min_uV = cpu_uV;
+
 	/*
 	 * CPU's regulator may not have any consumers, hence the voltage
 	 * must not be changed in that case because CPU simply won't
@@ -250,6 +258,10 @@ static int tegra20_cpu_voltage_update(struct tegra_regulator_coupler *tegra,
 	if (!cpu_min_uV_consumers)
 		cpu_min_uV = cpu_uV;
 
+	/* restore boot voltage level */
+	if (tegra->sys_reboot_mode)
+		cpu_min_uV = max(cpu_min_uV, tegra->cpu_min_uV);
+
 	if (cpu_min_uV > cpu_uV) {
 		err = tegra20_core_rtc_update(tegra, core_rdev, rtc_rdev,
 					      cpu_uV, cpu_min_uV);
@@ -290,6 +302,8 @@ static int tegra20_regulator_balance_voltage(struct regulator_coupler *coupler,
 		return -EINVAL;
 	}
 
+	tegra->sys_reboot_mode = READ_ONCE(tegra->sys_reboot_mode_req);
+
 	if (rdev == cpu_rdev)
 		return tegra20_cpu_voltage_update(tegra, cpu_rdev,
 						  core_rdev, rtc_rdev);
@@ -303,6 +317,51 @@ static int tegra20_regulator_balance_voltage(struct regulator_coupler *coupler,
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
@@ -335,6 +394,14 @@ static int tegra20_regulator_detach(struct regulator_coupler *coupler,
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
@@ -359,13 +426,19 @@ static struct tegra_regulator_coupler tegra20_coupler = {
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
index 0e776b20f625..6e4f3d9e7be1 100644
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
@@ -22,7 +23,10 @@ struct tegra_regulator_coupler {
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
@@ -172,6 +176,10 @@ static int tegra30_voltage_update(struct tegra_regulator_coupler *tegra,
 	if (cpu_uV < 0)
 		return cpu_uV;
 
+	/* store boot voltage level */
+	if (!tegra->cpu_min_uV)
+		tegra->cpu_min_uV = cpu_uV;
+
 	/*
 	 * CPU's regulator may not have any consumers, hence the voltage
 	 * must not be changed in that case because CPU simply won't
@@ -195,6 +203,10 @@ static int tegra30_voltage_update(struct tegra_regulator_coupler *tegra,
 	if (err)
 		return err;
 
+	/* restore boot voltage level */
+	if (tegra->sys_reboot_mode)
+		cpu_min_uV = max(cpu_min_uV, tegra->cpu_min_uV);
+
 	if (core_min_limited_uV > core_uV) {
 		pr_err("core voltage constraint violated: %d %d %d\n",
 		       core_uV, core_min_limited_uV, cpu_uV);
@@ -263,9 +275,56 @@ static int tegra30_regulator_balance_voltage(struct regulator_coupler *coupler,
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
@@ -292,6 +351,17 @@ static int tegra30_regulator_detach(struct regulator_coupler *coupler,
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
@@ -311,13 +381,19 @@ static struct tegra_regulator_coupler tegra30_coupler = {
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

