Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E68C432C3
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 17:44:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06DCC65000
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 17:44:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbhCKRnf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 Mar 2021 12:43:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbhCKRnR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Mar 2021 12:43:17 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4588CC061760;
        Thu, 11 Mar 2021 09:43:17 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id p21so41094810lfu.11;
        Thu, 11 Mar 2021 09:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KFH1WQ55n2o2H6XVeSwGtTqtJ0JVSPd2X/kO35Iu2VI=;
        b=JYIOXxWQ0tCq5tpE5vlFkgbMyZR4z0PZzmUho8YJJBzdNyHjvAoAriWB8Kk47Irn7Y
         /RVSAvvbV4KA/9nBbU9SxdJLs+SxbSQ9kCdyNI5ScmtMiwghBTiyl/IJoQcmCE6mGmR/
         cSCKXUi4XsDQmwwRe/qYgh9thvxXimW9jRf17yktbfGQaa92Z+O6mA4JSB7eDrH0X7Gj
         8N4VN3/cgY8/IEHMXQGa75Xh4YS0U8IzO1SPuLtNcEl1XHZ0G+sVOIaCqBFXkkZSojWf
         hw4wu9sWfmR4RCsm+Ef83k9BBw2N9dEWCBDUU19o2DFqS8FucBrgWoB3b2DiZelAaYqO
         7tBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KFH1WQ55n2o2H6XVeSwGtTqtJ0JVSPd2X/kO35Iu2VI=;
        b=SaD2f1p7QLtFkA9rrX7DTat24wPrra1gKnesUNJ5GfiaH6op8WLiA3r9hb4iJmzpJE
         YK8coC3YUfPNiv1q8xsMFSxUD+ZUQ7onoOUXmhkeW/boQQLD8nCeO52Vnmp8y88b8sjH
         NVL7YrKPW696+esqacHbBVo4zm0axbsVUiSurmxj8tX/gluM7baNlybTiNc4m59bxxu/
         G25H+2XbTNNQFnvVIx7Gwu+n82bPBfOVg6176J56Zl2W8jlW4X7KaUE6iuuaSeQq09d8
         3FDMJJsvkX/nRuIEjOi7OYtUaA+EOF+4QVQqdCw53vR+zzUH1T/Yg0YdMEtYglLbaWcQ
         MBzg==
X-Gm-Message-State: AOAM531XnWheSymDiSBtFaAx07h9FaYa0Qe6JtFAGYcB2JVZo3P15cH0
        RC1ACKkYBD6LFKHn5WF2eUs=
X-Google-Smtp-Source: ABdhPJx+umdPXW4BrOcDOBr5X/nTi6J68GJ4UmbG0xK+Rc+6qqHb//k3tPQCAP+QpJuCr8CJdtfkYA==
X-Received: by 2002:a19:6b10:: with SMTP id d16mr2764909lfa.540.1615484595668;
        Thu, 11 Mar 2021 09:43:15 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id g10sm1021245lfe.90.2021.03.11.09.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 09:43:15 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] ASoC: tegra: ahub: Switch to use reset-bulk API
Date:   Thu, 11 Mar 2021 20:43:02 +0300
Message-Id: <20210311174302.15430-6-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311174302.15430-1-digetx@gmail.com>
References: <20210311174302.15430-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Switch to use reset-bulk API in order to make code cleaner.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra30_ahub.c | 104 ++++++++++++---------------------
 sound/soc/tegra/tegra30_ahub.h |   5 +-
 sound/soc/tegra/tegra30_i2s.c  |   1 +
 3 files changed, 40 insertions(+), 70 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 9ef05ca4f6c4..d24c26f4960d 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -65,7 +65,7 @@ static int tegra30_ahub_runtime_resume(struct device *dev)
 {
 	int ret;
 
-	ret = reset_control_assert(ahub->reset);
+	ret = reset_control_bulk_assert(ahub->nresets, ahub->resets);
 	if (ret)
 		return ret;
 
@@ -75,7 +75,7 @@ static int tegra30_ahub_runtime_resume(struct device *dev)
 
 	usleep_range(10, 100);
 
-	ret = reset_control_deassert(ahub->reset);
+	ret = reset_control_bulk_deassert(ahub->nresets, ahub->resets);
 	if (ret)
 		goto disable_clocks;
 
@@ -339,41 +339,28 @@ int tegra30_ahub_unset_rx_cif_source(enum tegra30_ahub_rxcif rxcif)
 }
 EXPORT_SYMBOL_GPL(tegra30_ahub_unset_rx_cif_source);
 
-#define MOD_LIST_MASK_TEGRA30	BIT(0)
-#define MOD_LIST_MASK_TEGRA114	BIT(1)
-#define MOD_LIST_MASK_TEGRA124	BIT(2)
-
-#define MOD_LIST_MASK_TEGRA30_OR_LATER \
-		(MOD_LIST_MASK_TEGRA30 | MOD_LIST_MASK_TEGRA114 | \
-			MOD_LIST_MASK_TEGRA124)
-#define MOD_LIST_MASK_TEGRA114_OR_LATER \
-		(MOD_LIST_MASK_TEGRA114 | MOD_LIST_MASK_TEGRA124)
-
-static const struct {
-	const char *rst_name;
-	u32 mod_list_mask;
-} configlink_mods[] = {
-	{ "d_audio", MOD_LIST_MASK_TEGRA30_OR_LATER },
-	{ "apbif", MOD_LIST_MASK_TEGRA30_OR_LATER },
-	{ "i2s0", MOD_LIST_MASK_TEGRA30_OR_LATER },
-	{ "i2s1", MOD_LIST_MASK_TEGRA30_OR_LATER },
-	{ "i2s2", MOD_LIST_MASK_TEGRA30_OR_LATER },
-	{ "i2s3", MOD_LIST_MASK_TEGRA30_OR_LATER },
-	{ "i2s4", MOD_LIST_MASK_TEGRA30_OR_LATER },
-	{ "dam0", MOD_LIST_MASK_TEGRA30_OR_LATER },
-	{ "dam1", MOD_LIST_MASK_TEGRA30_OR_LATER },
-	{ "dam2", MOD_LIST_MASK_TEGRA30_OR_LATER },
-	{ "spdif", MOD_LIST_MASK_TEGRA30_OR_LATER },
-	{ "amx", MOD_LIST_MASK_TEGRA114_OR_LATER },
-	{ "adx", MOD_LIST_MASK_TEGRA114_OR_LATER },
-	{ "amx1", MOD_LIST_MASK_TEGRA124 },
-	{ "adx1", MOD_LIST_MASK_TEGRA124 },
-	{ "afc0", MOD_LIST_MASK_TEGRA124 },
-	{ "afc1", MOD_LIST_MASK_TEGRA124 },
-	{ "afc2", MOD_LIST_MASK_TEGRA124 },
-	{ "afc3", MOD_LIST_MASK_TEGRA124 },
-	{ "afc4", MOD_LIST_MASK_TEGRA124 },
-	{ "afc5", MOD_LIST_MASK_TEGRA124 },
+static const struct reset_control_bulk_data tegra30_ahub_resets_data[] = {
+	{ "d_audio" },
+	{ "apbif" },
+	{ "i2s0" },
+	{ "i2s1" },
+	{ "i2s2" },
+	{ "i2s3" },
+	{ "i2s4" },
+	{ "dam0" },
+	{ "dam1" },
+	{ "dam2" },
+	{ "spdif" },
+	{ "amx" }, /* Tegra114+ */
+	{ "adx" }, /* Tegra114+ */
+	{ "amx1" }, /* Tegra124 */
+	{ "adx1" }, /* Tegra124 */
+	{ "afc0" }, /* Tegra124 */
+	{ "afc1" }, /* Tegra124 */
+	{ "afc2" }, /* Tegra124 */
+	{ "afc3" }, /* Tegra124 */
+	{ "afc4" }, /* Tegra124 */
+	{ "afc5" }, /* Tegra124 */
 };
 
 #define LAST_REG(name) \
@@ -502,17 +489,17 @@ static const struct regmap_config tegra30_ahub_ahub_regmap_config = {
 };
 
 static struct tegra30_ahub_soc_data soc_data_tegra30 = {
-	.mod_list_mask = MOD_LIST_MASK_TEGRA30,
+	.num_resets = 11,
 	.set_audio_cif = tegra30_ahub_set_cif,
 };
 
 static struct tegra30_ahub_soc_data soc_data_tegra114 = {
-	.mod_list_mask = MOD_LIST_MASK_TEGRA114,
+	.num_resets = 13,
 	.set_audio_cif = tegra30_ahub_set_cif,
 };
 
 static struct tegra30_ahub_soc_data soc_data_tegra124 = {
-	.mod_list_mask = MOD_LIST_MASK_TEGRA124,
+	.num_resets = 21,
 	.set_audio_cif = tegra124_ahub_set_cif,
 };
 
@@ -527,8 +514,6 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
 	const struct tegra30_ahub_soc_data *soc_data;
-	struct reset_control *rst;
-	int i;
 	struct resource *res0;
 	void __iomem *regs_apbif, *regs_ahub;
 	int ret = 0;
@@ -541,34 +526,16 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 		return -EINVAL;
 	soc_data = match->data;
 
-	/*
-	 * The AHUB hosts a register bus: the "configlink". For this to
-	 * operate correctly, all devices on this bus must be out of reset.
-	 */
-	for (i = 0; i < ARRAY_SIZE(configlink_mods); i++) {
-		if (!(configlink_mods[i].mod_list_mask &
-					soc_data->mod_list_mask))
-			continue;
-
-		rst = reset_control_get_exclusive(&pdev->dev,
-						  configlink_mods[i].rst_name);
-		if (IS_ERR(rst)) {
-			dev_err(&pdev->dev, "Can't get reset %s\n",
-				configlink_mods[i].rst_name);
-			ret = PTR_ERR(rst);
-			return ret;
-		}
-
-		/* just check presence of the reset control in DT */
-		reset_control_put(rst);
-	}
-
 	ahub = devm_kzalloc(&pdev->dev, sizeof(struct tegra30_ahub),
 			    GFP_KERNEL);
 	if (!ahub)
 		return -ENOMEM;
 	dev_set_drvdata(&pdev->dev, ahub);
 
+	BUILD_BUG_ON(sizeof(ahub->resets) != sizeof(tegra30_ahub_resets_data));
+	memcpy(ahub->resets, tegra30_ahub_resets_data, sizeof(ahub->resets));
+
+	ahub->nresets = soc_data->num_resets;
 	ahub->soc_data = soc_data;
 	ahub->dev = &pdev->dev;
 
@@ -579,10 +546,11 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ahub->reset = devm_reset_control_array_get_exclusive(&pdev->dev);
-	if (IS_ERR(ahub->reset)) {
-		dev_err(&pdev->dev, "Can't get resets: %pe\n", ahub->reset);
-		return PTR_ERR(ahub->reset);
+	ret = devm_reset_control_bulk_get_exclusive(&pdev->dev, ahub->nresets,
+						    ahub->resets);
+	if (ret) {
+		dev_err(&pdev->dev, "Can't get resets: %d\n", ret);
+		return ret;
 	}
 
 	res0 = platform_get_resource(pdev, IORESOURCE_MEM, 0);
diff --git a/sound/soc/tegra/tegra30_ahub.h b/sound/soc/tegra/tegra30_ahub.h
index 3b85244f87f1..c9eaf4ec8f6e 100644
--- a/sound/soc/tegra/tegra30_ahub.h
+++ b/sound/soc/tegra/tegra30_ahub.h
@@ -491,7 +491,7 @@ void tegra124_ahub_set_cif(struct regmap *regmap, unsigned int reg,
 			   struct tegra30_ahub_cif_conf *conf);
 
 struct tegra30_ahub_soc_data {
-	u32 mod_list_mask;
+	unsigned int num_resets;
 	void (*set_audio_cif)(struct regmap *regmap,
 			      unsigned int reg,
 			      struct tegra30_ahub_cif_conf *conf);
@@ -511,7 +511,8 @@ struct tegra30_ahub_soc_data {
 struct tegra30_ahub {
 	const struct tegra30_ahub_soc_data *soc_data;
 	struct device *dev;
-	struct reset_control *reset;
+	struct reset_control_bulk_data resets[21];
+	unsigned int nresets;
 	struct clk_bulk_data clocks[2];
 	unsigned int nclocks;
 	resource_size_t apbif_addr;
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 3d22c1be6f3d..614b67be1dd9 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -23,6 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
-- 
2.29.2

