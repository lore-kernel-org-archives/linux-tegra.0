Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C88CC2B9F7
	for <linux-tegra@archiver.kernel.org>; Fri, 28 May 2021 17:29:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5059C613B5
	for <linux-tegra@archiver.kernel.org>; Fri, 28 May 2021 17:29:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbhE1RbA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 28 May 2021 13:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbhE1RbA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 May 2021 13:31:00 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F441C061574;
        Fri, 28 May 2021 10:29:25 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id f30so6439836lfj.1;
        Fri, 28 May 2021 10:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nQGU6xrvasRzJ9/W6i4GybOWCRndIumcGWBV2DwZRaE=;
        b=oLuOlBudc2FiZ4E3p8UrouhdUzva8p07ec+k5PXp+TUrp80hZpOAn4KO4GxO5NcOno
         sq8GpwLc8BzVKI4TxJyoL6MR6rp1FpJTysHAqH/KYG8OsVdZdmiNRpLAbvPpKvpY9YoF
         8HvPHwi9VTDBHoxThJWl+sMEMgcDlsCCUdq48c6uxkOCXZ0ypyq0O1nPbDhS2ojdCngu
         C2NGaF/Fn+/elN+NSdiU5L4TPaPO8Ehz6c317aHP1A89MPUcK69I+pbIHg4+pkk60OtN
         ouJd3CwAs0aP6wMiIPxrsbek9jWe/GhndC8qjSTTx8j5m2Dmq1nUQyn/aCJGvhrobQfS
         /QUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nQGU6xrvasRzJ9/W6i4GybOWCRndIumcGWBV2DwZRaE=;
        b=S+yDtp2pyVOwU5V3j7tKvQ+SSGh097eaH+MIvgUqUndam/kX11qlq49gmxfXpkA3aV
         Xx6KFK/dWBGAKMKQYus9JRJ1zwk6UtHil1IdWba5XeHRKMj73+5yJqZ+VqXmN7gPTBbq
         pEUDwAODmJ6y1OpmbxCVG0aYg6uldD3YV5uhJ95zcv/u5ldmjcgivHMajr+19na2n26w
         w/KKownro2wP/jCWoz8LytU4gqD1Wm7aSG2hiT1u+cT0eTpPiY7WKqywCzNBHEMt20zg
         Lzal3+TPlJhZGjjCUGsB28W8NQlvMa/6rZXQ8/te+J3wYnkTqWevFeZDafc6mSaO9Gte
         nDQg==
X-Gm-Message-State: AOAM532+Tn032+2/T7Ag2JzMpwcDbCbOIKRBzpORCJbAOJ3hNIsdrg32
        A4RBy0tw9rmardrUDn6GqgU=
X-Google-Smtp-Source: ABdhPJzYLXcjkSoV50SJyxTWXbXGdzlaPQ4nCCyFIMp3Wbb81hshFzgZ+uWem4bbOtWwwABvfichZQ==
X-Received: by 2002:ac2:4281:: with SMTP id m1mr6250316lfh.164.1622222963252;
        Fri, 28 May 2021 10:29:23 -0700 (PDT)
Received: from localhost.localdomain (46-138-12-55.dynamic.spd-mgts.ru. [46.138.12.55])
        by smtp.gmail.com with ESMTPSA id x207sm518282lff.234.2021.05.28.10.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 10:29:22 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] Unify NVIDIA Tegra ASoC machine drivers
Date:   Fri, 28 May 2021 20:28:30 +0300
Message-Id: <20210528172833.21622-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series squashes all the ASoC machine drivers into a single one,
this change was suggested by Jon Hunter. It also sets driver_name and
components string of each card, allowing userspace alsa-lib to find
UCMs at predictable path.

Changelog:

v5: - The v4 removed the customization of components string for Nexus 7,
      but I missed to remove the "components" hook which is unused now,
      it's removed in v5 for consistency.

    - Slightly improved naming of the common 12MHz MCLK rate function
      to make it more consistent with the rest of the driver functions.

v4: - Moved out mclk_rate callback that is currently used only by WM8903
      machine driver from the common driver. This was suggested by Jon Hunter.

    - Dropped patch which was setting custom components string for Nexus 7.
      Jaroslav Kysela wants it to be specified in a device-tree, but the
      components string doesn't have a firm specification for today. It's
      better to drop this change for now since it's optional anyways.

    - Fixed compilation error that was reported by kernel robot for v3.

    - Jaroslav Kysela merged alsa-ucm-conf PR [1] which added UCMs for
      Nexus 7 and Acer A500. The UCMs are fully working using a combination
      of updated kernel + alsa-ucm-conf master + alsa-lib master, meaning
      that they will work with the next releases of kernel and ALSA userspace
      upstream packages.

    - Added ack from Jaroslav Kysela to the "Specify components string for
      each card" patch that he gave to v3.

v3: - Added components string as was suggested by Jaroslav Kysela to v2.

    - Renamed MCLK rate function that is used by max98090 and other codecs
      to make it look more generic. Added option for specifying CLK ID per
      device. This all was suggested by Jon Hunter to v2.

v2: - Dropped use of of_device_compatible_match(), like it was suggested
      by Rob Herring in a review comment to v1.

    - Added patch that sets card's driver_name of as Tegra ASoC drivers.
      In a comment to v1 Jaroslav Kysela suggested that the Tegra drivers
      don't set the card name properly and he was right.

      I opened pull request with the new Tegra UCMs and updated lookup paths
      for older UCMs [1].

      [1] https://github.com/alsa-project/alsa-ucm-conf/pull/92

Dmitry Osipenko (3):
  ASoC: tegra: Set driver_name=tegra for all machine drivers
  ASoC: tegra: Unify ASoC machine drivers
  ASoC: tegra: Specify components string for each card

 sound/soc/tegra/Kconfig              |  12 +
 sound/soc/tegra/Makefile             |  18 +-
 sound/soc/tegra/tegra_alc5632.c      | 259 ----------
 sound/soc/tegra/tegra_asoc_machine.c | 712 +++++++++++++++++++++++++++
 sound/soc/tegra/tegra_asoc_machine.h |  45 ++
 sound/soc/tegra/tegra_max98090.c     | 276 -----------
 sound/soc/tegra/tegra_rt5640.c       | 222 ---------
 sound/soc/tegra/tegra_rt5677.c       | 324 ------------
 sound/soc/tegra/tegra_sgtl5000.c     | 211 --------
 sound/soc/tegra/tegra_wm8753.c       | 185 -------
 sound/soc/tegra/tegra_wm8903.c       | 351 +++----------
 sound/soc/tegra/tegra_wm9712.c       | 166 -------
 sound/soc/tegra/trimslice.c          | 172 -------
 13 files changed, 850 insertions(+), 2103 deletions(-)
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

