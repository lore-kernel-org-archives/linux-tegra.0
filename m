Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F9CAC433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 01:25:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3570F23110
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 01:25:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbhATBYy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 20:24:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726843AbhATBYx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 20:24:53 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 780ABC0613C1;
        Tue, 19 Jan 2021 17:24:12 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id m13so24116039ljo.11;
        Tue, 19 Jan 2021 17:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uBnKxkMoWgBmADz8vMOGbpC2I6RNnJynTQ74usheb0k=;
        b=E3r1teUsHqwMDlgns9e18aIexe465SdW1E8s+/2B0eF9nfSYHVYwdvd8G5kQL5L92z
         hfjqKQoC55a7WdobuCHy7kcRHY7D4HuE6atYoQDrhowE8VqFQGk3KqESnb9BwAik1QzB
         0aF8zvGv3OjNhLv48icELUXxbGX/S+kuDSJaQS4hgS9tTYwcYfq0nR81SkQZxW7cM7ST
         oS8KF3tVejK19guV7I4lGMd5iSnkY+pni7/iidMz8lZAzQH4Q58A7T3kFuefhPl45MGh
         0Ppx42ef6c9A7JwMATZU0Alp8Tb5XC6c8zEbRjM5G0XVOeb4M80IAsDyIPgz1rc6wOTF
         SaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uBnKxkMoWgBmADz8vMOGbpC2I6RNnJynTQ74usheb0k=;
        b=TRqWmDOHqEggaK0RUmj/ZER8wCLO/K4JvXeW2/OWRZ3HI83Uf9Kr6lTX0kAREWUcqD
         JlAQAuSVSy2BYoCSz9MLuYyRRVnMRjMCi5AEAEi+FwQWbY1Vxr7cf2/TVhXbmU1C0PMF
         vbkmLv1EzeqfxplPM55oTJP0G3MAIPEKbD5Zsr4f+fZavfpEQ/0qvdHn78OQdodx27q0
         M7HJFk+U9xY13df+ySpF32kY0QBwMhymrE/oU48eHGfdv/kqgiBRKY00741+G3hamu6S
         ghgIJiJLhctHb3K6D5Msd4wRMVI7fT5K6KFrfKi+FICi5noeH/HrENquOBIUf4owP4O7
         bCRA==
X-Gm-Message-State: AOAM533yPkbRZC/xpPN6Apd20AUeH+Sluz/DpJ4llhmMA7z5Uv8mpZjH
        kClf43yvtHjfrJ5pblYGg60=
X-Google-Smtp-Source: ABdhPJw+t9t4TC9wAX/mFIXOhdtNSFjt0AB+iKgwQbTTOlR7I83rHV2BXua5Sfun3DbEykce/wWtGg==
X-Received: by 2002:a2e:7508:: with SMTP id q8mr3150470ljc.35.1611105851031;
        Tue, 19 Jan 2021 17:24:11 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id c8sm28416lja.80.2021.01.19.17.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 17:24:10 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] soc/tegra: pmc: Fix completion of power-gate toggling
Date:   Wed, 20 Jan 2021 04:23:54 +0300
Message-Id: <20210120012357.11038-3-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120012357.11038-1-digetx@gmail.com>
References: <20210120012357.11038-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The SW-initiated power gate toggling is dropped by PMC if there is
contention with a HW-initiated toggling, i.e. when one of CPU cores is
gated by cpuidle driver. Software should retry the toggling after 10
microseconds on Tegra20/30 SoCs, hence add the retrying. On Tegra114+ the
toggling method was changed in hardware, the TOGGLE_START bit indicates
whether PMC is busy or could accept the command to toggle, hence handle
that bit properly.

The problem pops up after enabling dynamic power gating of 3d hardware,
where 3d power domain fails to turn on/off "randomly".

The programming sequence and quirks are documented in TRMs, but PMC
driver obliviously re-used the Tegra20 logic for Tegra30+, which strikes
back now. The 10 microseconds and other timeouts aren't documented in TRM,
they are taken from downstream kernel.

Link: https://nv-tegra.nvidia.com/gitweb/?p=linux-2.6.git;a=commit;h=311dd1c318b70e93bcefec15456a10ff2b9eb0ff
Link: https://nv-tegra.nvidia.com/gitweb/?p=linux-3.10.git;a=commit;h=7f36693c47cb23730a6b2822e0975be65fb0c51d
Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Tested-by: Dmitry Osipenko <digetx@gmail.com> # A500 T20 and Nexus7 T30
[this patch was also boot-tested on some other T20/30/114 devices]
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 70 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 65 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index fd2ba3c59178..f970b615ee27 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -317,6 +317,8 @@ struct tegra_pmc_soc {
 				   bool invert);
 	int (*irq_set_wake)(struct irq_data *data, unsigned int on);
 	int (*irq_set_type)(struct irq_data *data, unsigned int type);
+	int (*powergate_set)(struct tegra_pmc *pmc, unsigned int id,
+			     bool new_state);
 
 	const char * const *reset_sources;
 	unsigned int num_reset_sources;
@@ -517,6 +519,63 @@ static int tegra_powergate_lookup(struct tegra_pmc *pmc, const char *name)
 	return -ENODEV;
 }
 
+static int tegra20_powergate_set(struct tegra_pmc *pmc, unsigned int id,
+				 bool new_state)
+{
+	unsigned int retries = 100;
+	bool status;
+	int ret;
+
+	/*
+	 * As per TRM documentation, the toggle command will be dropped by PMC
+	 * if there is contention with a HW-initiated toggling (i.e. CPU core
+	 * power-gated), the command should be retried in that case.
+	 */
+	do {
+		tegra_pmc_writel(pmc, PWRGATE_TOGGLE_START | id, PWRGATE_TOGGLE);
+
+		/* wait for PMC to execute the command */
+		ret = readx_poll_timeout(tegra_powergate_state, id, status,
+					 status == new_state, 1, 10);
+	} while (ret == -ETIMEDOUT && retries--);
+
+	return ret;
+}
+
+static inline bool tegra_powergate_toggle_ready(struct tegra_pmc *pmc)
+{
+	return !(tegra_pmc_readl(pmc, PWRGATE_TOGGLE) & PWRGATE_TOGGLE_START);
+}
+
+static int tegra114_powergate_set(struct tegra_pmc *pmc, unsigned int id,
+				  bool new_state)
+{
+	bool status;
+	int err;
+
+	/* wait while PMC power gating is contented */
+	err = readx_poll_timeout(tegra_powergate_toggle_ready, pmc, status,
+				 status == true, 1, 100);
+	if (err)
+		return err;
+
+	tegra_pmc_writel(pmc, PWRGATE_TOGGLE_START | id, PWRGATE_TOGGLE);
+
+	/* wait for PMC to accept the command */
+	err = readx_poll_timeout(tegra_powergate_toggle_ready, pmc, status,
+				 status == true, 1, 100);
+	if (err)
+		return err;
+
+	/* wait for PMC to execute the command */
+	err = readx_poll_timeout(tegra_powergate_state, id, status,
+				 status == new_state, 10, 100000);
+	if (err)
+		return err;
+
+	return 0;
+}
+
 /**
  * tegra_powergate_set() - set the state of a partition
  * @pmc: power management controller
@@ -526,7 +585,6 @@ static int tegra_powergate_lookup(struct tegra_pmc *pmc, const char *name)
 static int tegra_powergate_set(struct tegra_pmc *pmc, unsigned int id,
 			       bool new_state)
 {
-	bool status;
 	int err;
 
 	if (id == TEGRA_POWERGATE_3D && pmc->soc->has_gpu_clamps)
@@ -539,10 +597,7 @@ static int tegra_powergate_set(struct tegra_pmc *pmc, unsigned int id,
 		return 0;
 	}
 
-	tegra_pmc_writel(pmc, PWRGATE_TOGGLE_START | id, PWRGATE_TOGGLE);
-
-	err = readx_poll_timeout(tegra_powergate_state, id, status,
-				 status == new_state, 10, 100000);
+	err = pmc->soc->powergate_set(pmc, id, new_state);
 
 	mutex_unlock(&pmc->powergates_lock);
 
@@ -2699,6 +2754,7 @@ static const struct tegra_pmc_soc tegra20_pmc_soc = {
 	.regs = &tegra20_pmc_regs,
 	.init = tegra20_pmc_init,
 	.setup_irq_polarity = tegra20_pmc_setup_irq_polarity,
+	.powergate_set = tegra20_powergate_set,
 	.reset_sources = NULL,
 	.num_reset_sources = 0,
 	.reset_levels = NULL,
@@ -2757,6 +2813,7 @@ static const struct tegra_pmc_soc tegra30_pmc_soc = {
 	.regs = &tegra20_pmc_regs,
 	.init = tegra20_pmc_init,
 	.setup_irq_polarity = tegra20_pmc_setup_irq_polarity,
+	.powergate_set = tegra20_powergate_set,
 	.reset_sources = tegra30_reset_sources,
 	.num_reset_sources = ARRAY_SIZE(tegra30_reset_sources),
 	.reset_levels = NULL,
@@ -2811,6 +2868,7 @@ static const struct tegra_pmc_soc tegra114_pmc_soc = {
 	.regs = &tegra20_pmc_regs,
 	.init = tegra20_pmc_init,
 	.setup_irq_polarity = tegra20_pmc_setup_irq_polarity,
+	.powergate_set = tegra114_powergate_set,
 	.reset_sources = tegra30_reset_sources,
 	.num_reset_sources = ARRAY_SIZE(tegra30_reset_sources),
 	.reset_levels = NULL,
@@ -2925,6 +2983,7 @@ static const struct tegra_pmc_soc tegra124_pmc_soc = {
 	.regs = &tegra20_pmc_regs,
 	.init = tegra20_pmc_init,
 	.setup_irq_polarity = tegra20_pmc_setup_irq_polarity,
+	.powergate_set = tegra114_powergate_set,
 	.reset_sources = tegra30_reset_sources,
 	.num_reset_sources = ARRAY_SIZE(tegra30_reset_sources),
 	.reset_levels = NULL,
@@ -3048,6 +3107,7 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
 	.regs = &tegra20_pmc_regs,
 	.init = tegra20_pmc_init,
 	.setup_irq_polarity = tegra20_pmc_setup_irq_polarity,
+	.powergate_set = tegra114_powergate_set,
 	.irq_set_wake = tegra210_pmc_irq_set_wake,
 	.irq_set_type = tegra210_pmc_irq_set_type,
 	.reset_sources = tegra210_reset_sources,
-- 
2.29.2

