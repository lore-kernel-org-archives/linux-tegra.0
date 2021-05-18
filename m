Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E26AC433ED
	for <linux-tegra@archiver.kernel.org>; Tue, 18 May 2021 00:15:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C46D61363
	for <linux-tegra@archiver.kernel.org>; Tue, 18 May 2021 00:15:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344811AbhERAQU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 May 2021 20:16:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbhERAQT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 May 2021 20:16:19 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 912EAC061573;
        Mon, 17 May 2021 17:15:02 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id v9so10023875lfa.4;
        Mon, 17 May 2021 17:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AK6TIIPIh6y8oxw77Uj9fjuC4hunUxPgnOdGH6bCmDM=;
        b=RUjZE5MPMnU2iVr8bo2G7C8zofGwrUNiBmyEAZhWDv0DtHj40AtB/SZ5GKYG/ebelm
         MI4HXjtad9eBJ9884yfDk8PhxwXwrZt4W3BIKK871K0/OgiQo05xJwBzMIA1TgU+XFpP
         Ow/OnMH8bBcca0Yi2Dfw+uffBV7XhF0taDHXkO79dJja0pGDptKeRDM69RvzbVy8UHFE
         TCYEFUaKSfzWEVO5PRGZiUAL8woxq7UPPiZ7O7LzPXa4bpYb1jF92ywMqQwfbD3y4JgP
         fvj8q/MibxkHcxrqbFL/T3jBf/5z37myOikRgz7Zp/J6QYUfogi8evtTVAC9miaeRoiL
         GxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AK6TIIPIh6y8oxw77Uj9fjuC4hunUxPgnOdGH6bCmDM=;
        b=PbsI+3SVy7ILn/gvoZnTQ9Y/R6GOmWNgp9XNjNU5uOez/dv5IDwnGLKEBswjwaFQTG
         dO5mkCgqEKr88ctv+MyV3ABsw/IC4HwFwOCUdd0sypfrlm8uT3HV6+9BvsKhXYbaoyxm
         U+cvzkVyHFQ+jxQJcscAbTGHd2TimSQ3zpNuYwnhw8C5bYtfugcdIGOq0bGXyIsveJTv
         0Hb5vW/pLGfqU6Pguz2VCS1WkFpGsHJcGIevwq+dchSmiqI3laixggMvCtIl1JuHdCoF
         rGcBZpGSBWW8ZxNSAiz8YtPG1vmeLTNWr3Tb++ziOjdLqmy8jU0siWddJ/3ah9mZxX8+
         ICjA==
X-Gm-Message-State: AOAM533cZK7bjL21eYKb8Tl9pw65tuXxnM/dkwnhF34FNqKSwgeHDNf/
        MVoLBiodUlAVgU3EFLqiN7Q=
X-Google-Smtp-Source: ABdhPJzbsk2zFIe4tOkSuRwqBARjwaY2lK/ZkieqOpkdfhgBJGYjh9TFxti9jgF1A0Pr0z+tH8es6g==
X-Received: by 2002:a05:6512:13a5:: with SMTP id p37mr1838318lfa.610.1621296901178;
        Mon, 17 May 2021 17:15:01 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id p4sm2108062lfa.155.2021.05.17.17.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 17:15:00 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Unify NVIDIA Tegra ASoC machine drivers
Date:   Tue, 18 May 2021 03:13:54 +0300
Message-Id: <20210518001356.19227-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

During review of the RT5631 machine driver, Jon Hunter suggested that
it will be better to squash all the current ASoC machine drivers into
a single one. This suggestion is implemented by this patchset. The
RT5631 support will come later with the ASUS Transformer changes.

Dmitry Osipenko (2):
  of: base: Export of_device_compatible_match()
  ASoC: tegra: Unify ASoC machine drivers

 drivers/of/base.c                    |   1 +
 sound/soc/tegra/Kconfig              |  12 +
 sound/soc/tegra/Makefile             |  18 +-
 sound/soc/tegra/tegra_alc5632.c      | 259 ----------
 sound/soc/tegra/tegra_asoc_machine.c | 737 +++++++++++++++++++++++++++
 sound/soc/tegra/tegra_asoc_machine.h |  44 ++
 sound/soc/tegra/tegra_max98090.c     | 276 ----------
 sound/soc/tegra/tegra_rt5640.c       | 222 --------
 sound/soc/tegra/tegra_rt5677.c       | 324 ------------
 sound/soc/tegra/tegra_sgtl5000.c     | 211 --------
 sound/soc/tegra/tegra_wm8753.c       | 185 -------
 sound/soc/tegra/tegra_wm8903.c       | 349 +++----------
 sound/soc/tegra/tegra_wm9712.c       | 166 ------
 sound/soc/tegra/trimslice.c          | 172 -------
 14 files changed, 860 insertions(+), 2116 deletions(-)
 delete mode 100644 sound/soc/tegra/tegra_alc5632.c
 create mode 100644 sound/soc/tegra/tegra_asoc_machine.c
 create mode 100644 sound/soc/tegra/tegra_asoc_machine.h
 delete mode 100644 sound/soc/tegra/tegra_max98090.c
 delete mode 100644 sound/soc/tegra/tegra_rt5640.c
 delete mode 100644 sound/soc/tegra/tegra_rt5677.c
 delete mode 100644 sound/soc/tegra/tegra_sgtl5000.c
 delete mode 100644 sound/soc/tegra/tegra_wm8753.c
 delete mode 100644 sound/soc/tegra/tegra_wm9712.c
 delete mode 100644 sound/soc/tegra/trimslice.c

-- 
2.30.2

