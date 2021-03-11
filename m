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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB58FC4332D
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 18:00:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80EB464FFA
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 18:00:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbhCKSAV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 Mar 2021 13:00:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbhCKSAM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Mar 2021 13:00:12 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9D2AC061574;
        Thu, 11 Mar 2021 10:00:11 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 184so3296199ljf.9;
        Thu, 11 Mar 2021 10:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2SMSIMvYxaxu4F53i5qtc3hVUmETiEH2Ssz4CshQdOI=;
        b=AS3GW0XCPCtBu2eNd6+wVB3YLc3XmMhfJUoDml49eAVW6sBtpXvXDtkjEUHweHOhUX
         oZ4Elum7vmVDAF4QbluHt3Eww8U4DM2l5FfRmMNK/OyAgOqvkc+CC9R5zJv7f2sDPd1H
         B+6A1Krb5IMzHYb9DhRaCmy77BC+LmayAURKbHGqE/E7sW+KL0LkpKplwlsQcJh2igKB
         2nPU3G0blwBkP8v1VnAovDO2FmWmgE19xb3kSp2fYiWriX9L4aJ6csMigU3OTlNYs+o7
         BwJOKn4GhWdHIvIDl29i0ZvA1mNT+OdFmDTwilTmxrw5lbjGOOxktoCy2Mei79/NcL6D
         iNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2SMSIMvYxaxu4F53i5qtc3hVUmETiEH2Ssz4CshQdOI=;
        b=eHPBZKRWLiavpo+LdyVQhqb+FkLMqKchc1LxavhdlJ8l45MYfz+aDBVsOoFTTA0sWM
         QraFxhlGI+cTtrtbCY1Mxa/NR4vZa7IS/RWh1FHX8UYB+AQotQY/+KBxdqIO6i+qrAX0
         aoMKM25GemsrxyMTjhowVMH2C6WAx6rqZ+YifZwtLzPtYM+VN902ldBbTO5ciH21UEKM
         88ddRzkXpbS7/5bQ3xvSiGrspodN6GkOgpXYY8ntLqAzJEd0gxkAaS7pmBKsxJO0L2IP
         lCMEbq9AlgcPLH8wW8Aaj3ksk1lYXKAkbao1y90aIEzluCi0Z5eVJn3gEzXBqRBosHMs
         XBWQ==
X-Gm-Message-State: AOAM5337AxNB8+IjeAJCOguxYJOsD+3s4CM/mUE26q2uNxUGKMTom2cU
        i+asugwHf/j5OpN/E+EiuiE=
X-Google-Smtp-Source: ABdhPJzquMAtNXxPNSc9ZahQypjTB6Ex+kG4p6Qn+zA6QSEthDwgSRlmNRnHxA+dZck2UE7SeQJRDQ==
X-Received: by 2002:a2e:2f05:: with SMTP id v5mr64770ljv.114.1615485610280;
        Thu, 11 Mar 2021 10:00:10 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id k18sm1014075lfm.88.2021.03.11.10.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 10:00:09 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/5] ASoC: tegra30: i2s: Restore hardware state on runtime PM resume
Date:   Thu, 11 Mar 2021 20:59:56 +0300
Message-Id: <20210311175958.7433-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311175958.7433-1-digetx@gmail.com>
References: <20210311175958.7433-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra30 I2S driver syncs regmap cache only on resume from system suspend,
but hardware is reset across the runtime suspend because RPM of the parent
AHUB driver resets the I2S hardware, hence h/w state is lost after each
RPM resume. The problem isn't visible because hardware happens to be fully
reprogrammed after each RPM resume. Move hardware syncing to RPM resume in
order to restore h/w state properly.

Fixes: ed9ce1ed2239 ("ASoC: tegra: ahub: Reset hardware properly")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra30_i2s.c | 40 +++++++++++------------------------
 1 file changed, 12 insertions(+), 28 deletions(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 6740df541508..3d22c1be6f3d 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -58,8 +58,18 @@ static int tegra30_i2s_runtime_resume(struct device *dev)
 	}
 
 	regcache_cache_only(i2s->regmap, false);
+	regcache_mark_dirty(i2s->regmap);
+
+	ret = regcache_sync(i2s->regmap);
+	if (ret)
+		goto disable_clocks;
 
 	return 0;
+
+disable_clocks:
+	clk_disable_unprepare(i2s->clk_i2s);
+
+	return ret;
 }
 
 static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
@@ -551,37 +561,11 @@ static int tegra30_i2s_platform_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int tegra30_i2s_suspend(struct device *dev)
-{
-	struct tegra30_i2s *i2s = dev_get_drvdata(dev);
-
-	regcache_mark_dirty(i2s->regmap);
-
-	return 0;
-}
-
-static int tegra30_i2s_resume(struct device *dev)
-{
-	struct tegra30_i2s *i2s = dev_get_drvdata(dev);
-	int ret;
-
-	ret = pm_runtime_get_sync(dev);
-	if (ret < 0) {
-		pm_runtime_put(dev);
-		return ret;
-	}
-	ret = regcache_sync(i2s->regmap);
-	pm_runtime_put(dev);
-
-	return ret;
-}
-#endif
-
 static const struct dev_pm_ops tegra30_i2s_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra30_i2s_runtime_suspend,
 			   tegra30_i2s_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(tegra30_i2s_suspend, tegra30_i2s_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra30_i2s_driver = {
-- 
2.29.2

