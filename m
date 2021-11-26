Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D08C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Nov 2021 16:36:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378667AbhKZQjt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Nov 2021 11:39:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238140AbhKZQhs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Nov 2021 11:37:48 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28AD8C061D6D;
        Fri, 26 Nov 2021 08:19:52 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id z8so19725084ljz.9;
        Fri, 26 Nov 2021 08:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XQZdihin90lA7efVTDzu3CsDg/xeb8H7EeSD4A6ITqg=;
        b=F1IsN1lNqFntYo6bCbHB9CPRZvvY/nTXdJo+Us3PXxM0NkiSnU7nUaMk/j/ma8/fAX
         1eWdx4wrvVz0g9/srkBaAayU0zUTkrtWurvknhUJJwI6+JLMw5hfEEaI7yBcyE+zTU60
         3VvyVvlOfs3coaF5eRyiLMvstMebJYewwg03H5v1b1VaezeZX1hIsjLvGa36vN92WmmT
         ilMDoNkp7il0KAGRyZEGqJcEUunJhDUVlXyCu3mOmwn9g8ZVhnOOFk0JL+fKc0B4ExAZ
         21A54gVXgh3tsqJcaqHD+taoAkT4yqz3/MTCXhgDmOwAeOglSsVhQWTw1vJZ8lgPJVJg
         D2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XQZdihin90lA7efVTDzu3CsDg/xeb8H7EeSD4A6ITqg=;
        b=y4/deuaHO2xA6Y3DUtV3ddDD/IW0T9UgJNbg8gR8+yNMT4x2F+9FfpZZ2wazjc3eJu
         BChdZjNlZL4Jqrl8B1Z2TJtaem9SD/w/e8p9ZVeMJejlZNP0rg3MO2YKhkIwkgdWwmWz
         5n5eIXdJc8yQeF9rDW9d/I8SQF7SzEhHFV6gYgRzxqZRhkdibtC+x0T61PDMtUyo1f5M
         +rPOX6tO2nIhpCBnpdHKPobA7cV1scj8NeINGquDYUFSqfQ4zKiFHsPERI5ycGIfBSsj
         aCdYZzwJWJOvpnH8ZdTo9i42kP933a0whinmWm9I1M2rCE6xU980k0vuZtr+mZJOoHVD
         LUag==
X-Gm-Message-State: AOAM530amq/1oEnj2P9/ZUqDTf6P6noYIgKCOt/S3R4HPpWf6eJG9pvy
        uLiuIoiBx8RbEZcHDYxPm7w=
X-Google-Smtp-Source: ABdhPJyeY+DJa2sflfc3Mxo+CLSNCZ8db8o1DJ/F5GgZWoSelxfLa5+6d4xFyI0nij43neTNk1WsoA==
X-Received: by 2002:a2e:a279:: with SMTP id k25mr32248372ljm.37.1637943590529;
        Fri, 26 Nov 2021 08:19:50 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 08:19:50 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 11/20] ASoC: tegra20: spdif: Support system suspend
Date:   Fri, 26 Nov 2021 19:17:58 +0300
Message-Id: <20211126161807.15776-12-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Support system suspend by enforcing runtime PM suspend/resume.
Now there is no doubt that h/w is indeed stopped during suspend
and that h/w state will be properly restored after resume.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 8b9bac30d5cd..89f7fc5c8aad 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -345,6 +345,8 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 static const struct dev_pm_ops tegra20_spdif_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra20_spdif_runtime_suspend,
 			   tegra20_spdif_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static const struct of_device_id tegra20_spdif_of_match[] = {
-- 
2.33.1

