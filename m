Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2446C4332F
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Nov 2021 22:06:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348734AbhKXWKC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Nov 2021 17:10:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352050AbhKXWJy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Nov 2021 17:09:54 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE626C06175C;
        Wed, 24 Nov 2021 14:06:43 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id b16so8346365ljf.12;
        Wed, 24 Nov 2021 14:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J2ouOYArYTiGPyKjaLg9beinXsL+bwxgMLfVEklW094=;
        b=pnA9n1gQI9hSs1rmixoW7n5S4z1lJAqgp8X3BpEZd0LjaqU/dT4zRL+OeE1rKtZnld
         JSUusimIa2AFyh4JlQli+Xs+yoCMqmQ8hb5g6H+Xp49/SC5PeD+LtR1yxtbWd14vINrq
         HiXBjF2ftObNSwKUv4XOat9OhGeQ6MFh3o6QEWirQ2F+DxQ0AAV0F/mYglkPO26fTyal
         tVEUyMMz3VcQgMR4RYk73Xmr6a8o3oDUTIvCD8/9dfxXIx63hJnGm+CO5Mr79/lyj9y7
         EljVST/+J8ctzhW6fdnTHCUC7LG2sa6htuHwscJZDvcAh6KrONesooQyPKX9Jq8VLf5r
         GkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J2ouOYArYTiGPyKjaLg9beinXsL+bwxgMLfVEklW094=;
        b=BjLR00vEdA/g9uO4xzhbMv+5PpC6mOQ9EUh90a3rSPFxArtnhQ7sUf+L+pDkTZHmu1
         xo0CHLS6yg7BODkJkt2cO7p70j1thqDyql+9QtUzY8dZ5OpyOiCK+2gurvx4dPHcwcKt
         uM+XYFDwIbZLkQkUJwGEatpmZqV+iLiRM8uyohNcHPeXvCXggTur0KEwAocsPqSReTzd
         itMSzUMf3V31Se5/LUPH78xy345/2B4miRfNjQWWqCvnZZ9d4K9U8AKmWztiQjYKP+AZ
         3xcL/uul59q0lqJN/wRaY41Az1ok/aWyKAqHFS0JODAQzFA1d3KN5MC7DO1ChdSwZsn6
         0bGQ==
X-Gm-Message-State: AOAM530W8/nhIfv/TWueZcK9qH2kCEvwaQDMZj0tDdTWvKVtqYVBU369
        aMBboJnnDFdw2qLncOUhZvw=
X-Google-Smtp-Source: ABdhPJwJSd+Si40B6GfMYdhTeNYiyWm8DOVcAAxmkWLOpTKPR07lt7OcXz3u27yqFTmPOsd95JEF4A==
X-Received: by 2002:a05:651c:2119:: with SMTP id a25mr19932045ljq.131.1637791602196;
        Wed, 24 Nov 2021 14:06:42 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 14:06:41 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v1 14/20] drm/tegra: hdmi: Unwind tegra_hdmi_init() errors
Date:   Thu, 25 Nov 2021 01:00:51 +0300
Message-Id: <20211124220057.15763-15-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add missing error unwinding to tegra_hdmi_init(), for consistency.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/hdmi.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 9a87d351a828..142ad696426f 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1456,22 +1456,31 @@ static int tegra_hdmi_init(struct host1x_client *client)
 	if (err < 0) {
 		dev_err(client->dev, "failed to enable HDMI regulator: %d\n",
 			err);
-		return err;
+		goto output_exit;
 	}
 
 	err = regulator_enable(hdmi->pll);
 	if (err < 0) {
 		dev_err(hdmi->dev, "failed to enable PLL regulator: %d\n", err);
-		return err;
+		goto disable_hdmi;
 	}
 
 	err = regulator_enable(hdmi->vdd);
 	if (err < 0) {
 		dev_err(hdmi->dev, "failed to enable VDD regulator: %d\n", err);
-		return err;
+		goto disable_pll;
 	}
 
 	return 0;
+
+disable_pll:
+	regulator_disable(hdmi->pll);
+disable_hdmi:
+	regulator_disable(hdmi->hdmi);
+output_exit:
+	tegra_output_exit(&hdmi->output);
+
+	return err;
 }
 
 static int tegra_hdmi_exit(struct host1x_client *client)
-- 
2.33.1

