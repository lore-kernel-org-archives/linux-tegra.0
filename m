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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D03C433E9
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 14:03:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E94EC23877
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 14:03:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732225AbhAOOCt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jan 2021 09:02:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726904AbhAOOCs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 09:02:48 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B19C061793;
        Fri, 15 Jan 2021 06:02:07 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id w26so10489553ljo.4;
        Fri, 15 Jan 2021 06:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Oos6t9KnWAkvLmqY7UEnRcS5qoHJdPePhQibi0JK0Fk=;
        b=CXksPrVBtpOPYasos+RFnMa8HIuUoHkEYbCEroNwYibR9bTJNtUvoRNrSzYu36DEn1
         eao3RpbcqiV+JpkJts9mHFYWRTdQguJ2TNw9DzLD3PvGktuwFbmdbmRXd49m8PJQGXO3
         FM0TugU1upHBWK69Vthxft5kLaxmsnJ288kwSQ8DtPCwwLn/FiJgAqlLq8MgDoFqqwB8
         i+Puvq5kVi1HoasDq0YOLMQALDTMQls3ALPXMDTZEn2Pos1f+WnwaPgj7y+jFPCocEsN
         Y4zTzCroHWqsO+pu7H2kpWw3P0dZ7R/e9gRJ9EclaKA6a8dwkACQVLARM58Y/sV9kxS9
         C26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Oos6t9KnWAkvLmqY7UEnRcS5qoHJdPePhQibi0JK0Fk=;
        b=ID/h8opylLLPRu2aGIoHMkyWrS8IEIyYsUgfCTGob5G9sEFyD6ZwwOuISl4hn8I53X
         d9qLk+QTTJi8Rd7hlvH3ZSrZRuYGq9B48oBTOTY5uto9TcJmchS05kVQwlJkPd8JxmKl
         2GTBeyx4R08t6ij7KgQW0Gn3s6YJCD/q6SrUemJkasmFIRrjhU/ZXHcBYUamqSOw/LTw
         LS6OZPgRBAqCtfQJd5WIrvWtnVK7hxxZBmdYZFvI62EVx+Er+UVHnCPnOssK8rlUPWfJ
         mOja5NgiCKKjhJ3ET1Rjo0Ud3AyvEAH8K66B/sy9AM2yWADD6eevpYfeE0XaekxGLNPb
         yr3g==
X-Gm-Message-State: AOAM5301AlRO0CmntG0+cWscr8XC0QAxOp4w14WRkbiduwrh6AOEd6LN
        q3Og8F97oLc4+CV+pdJMd9k=
X-Google-Smtp-Source: ABdhPJzKZFEU0dXZMmoXf0ObU514p9TyxmYrJ/j4GInoDGyRZKbcQvzng+BePBetQHLjGYAks7Dnag==
X-Received: by 2002:a05:651c:1356:: with SMTP id j22mr5430362ljb.237.1610719326374;
        Fri, 15 Jan 2021 06:02:06 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id f132sm906852lfd.252.2021.01.15.06.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 06:02:05 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] ASoC: tegra: ahub: Use of_reset_control_array_get_exclusive()
Date:   Fri, 15 Jan 2021 17:01:43 +0300
Message-Id: <20210115140145.10668-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115140145.10668-1-digetx@gmail.com>
References: <20210115140145.10668-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Some of resets are erroneously missed in the configlink_mods[], like APBIF
for example. Use of_reset_control_array_get_exclusive() which requests all
the resets. The problem was hidden by the clk driver which implicitly
de-asserts the missing resets.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra30_ahub.c | 66 +++++-----------------------------
 sound/soc/tegra/tegra30_ahub.h |  1 -
 2 files changed, 9 insertions(+), 58 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 156e3b9d613c..8bd3e83b2c3b 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -323,41 +323,6 @@ int tegra30_ahub_unset_rx_cif_source(enum tegra30_ahub_rxcif rxcif)
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
-};
-
 #define LAST_REG(name) \
 	(TEGRA30_AHUB_##name + \
 	 (TEGRA30_AHUB_##name##_STRIDE * TEGRA30_AHUB_##name##_COUNT) - 4)
@@ -484,17 +449,14 @@ static const struct regmap_config tegra30_ahub_ahub_regmap_config = {
 };
 
 static struct tegra30_ahub_soc_data soc_data_tegra30 = {
-	.mod_list_mask = MOD_LIST_MASK_TEGRA30,
 	.set_audio_cif = tegra30_ahub_set_cif,
 };
 
 static struct tegra30_ahub_soc_data soc_data_tegra114 = {
-	.mod_list_mask = MOD_LIST_MASK_TEGRA114,
 	.set_audio_cif = tegra30_ahub_set_cif,
 };
 
 static struct tegra30_ahub_soc_data soc_data_tegra124 = {
-	.mod_list_mask = MOD_LIST_MASK_TEGRA124,
 	.set_audio_cif = tegra124_ahub_set_cif,
 };
 
@@ -510,7 +472,6 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	const struct of_device_id *match;
 	const struct tegra30_ahub_soc_data *soc_data;
 	struct reset_control *rst;
-	int i;
 	struct resource *res0;
 	void __iomem *regs_apbif, *regs_ahub;
 	int ret = 0;
@@ -528,26 +489,17 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	 * operate correctly, all devices on this bus must be out of reset.
 	 * Ensure that here.
 	 */
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
-		ret = reset_control_deassert(rst);
-		reset_control_put(rst);
-		if (ret)
-			return ret;
+	rst = of_reset_control_array_get_exclusive(pdev->dev.of_node);
+	if (IS_ERR(rst)) {
+		dev_err(&pdev->dev, "Can't get reset: %pe\n", rst);
+		return PTR_ERR(rst);
 	}
 
+	ret = reset_control_deassert(rst);
+	reset_control_put(rst);
+	if (ret)
+		return ret;
+
 	ahub = devm_kzalloc(&pdev->dev, sizeof(struct tegra30_ahub),
 			    GFP_KERNEL);
 	if (!ahub)
diff --git a/sound/soc/tegra/tegra30_ahub.h b/sound/soc/tegra/tegra30_ahub.h
index 6889c5f23d02..5a2500b4ea06 100644
--- a/sound/soc/tegra/tegra30_ahub.h
+++ b/sound/soc/tegra/tegra30_ahub.h
@@ -491,7 +491,6 @@ void tegra124_ahub_set_cif(struct regmap *regmap, unsigned int reg,
 			   struct tegra30_ahub_cif_conf *conf);
 
 struct tegra30_ahub_soc_data {
-	u32 mod_list_mask;
 	void (*set_audio_cif)(struct regmap *regmap,
 			      unsigned int reg,
 			      struct tegra30_ahub_cif_conf *conf);
-- 
2.29.2

