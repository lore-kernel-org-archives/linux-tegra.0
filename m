Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3067C47082
	for <linux-tegra@archiver.kernel.org>; Sat, 29 May 2021 15:47:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BFE4601FC
	for <linux-tegra@archiver.kernel.org>; Sat, 29 May 2021 15:47:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbhE2Psn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 29 May 2021 11:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbhE2Psm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 29 May 2021 11:48:42 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8E9AC061574;
        Sat, 29 May 2021 08:47:04 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id b18so5764991lfv.11;
        Sat, 29 May 2021 08:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=69jY18dEEmfg/ZmZabTRCrIvuDBUDZXyA3JOYkZkeGw=;
        b=mRcFb2P0k5/vGofL5Z6ifIaPh1MLPeh+A8QKTudtugZOONYgG0jOYoQk/KzxhvhLfu
         KQDDGsTNC3s8khsw5BXO5qgZGwIO5JOhSVNbW+6P2t+EueqiaQ52nNAuZMtaBBi0qNI/
         e4/gvZtyvEjG3GDM0M5mJdhsqdRtzwFCojSM1uige15JzQLkmP5hhQkBQ5rYNglfZI2G
         4BB56E95lEbYFkYDkzscfLeGKPT6axij8yPU4iub9LtKNwWi8th/kROMJ9eaVnOwxHd2
         FcdezkdjweOLL4fvYsq2EVkXlzbUtMdJGumNsWVfsxucbJZd0QDvpO/M2fHbcC0JHyzL
         lk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=69jY18dEEmfg/ZmZabTRCrIvuDBUDZXyA3JOYkZkeGw=;
        b=FVsKAqyyjTM28B5xvfAz9BwrSGZtZ0Xy3aFAc0QyV+Rqb8o0O+nYnVI5e9c1INF36+
         pX/gQRe44R1D0oMiDUWBF8PM7YTNG84F8TryDithrxsyepFCtwZirV+MUapqA1xDVqZK
         mIflUq2UC2uVjUSUubc1V2iS88Ui5bValEI2riHHvAW2jmY7tmiKIoCvSxzIvhPSqzLc
         zT+VI15kBEd1jLKhRFw2NZZcrsn78ELMOioPBEcL65G/LnbZojmxTQdlt5V0PvVLnSx2
         alEPjAO5lC7quajUSXIVfLtJwgmyyXOrLLwk7jfpVW/fvuoKFeiTN+EyjEveOBNDCNcV
         mNLw==
X-Gm-Message-State: AOAM530CkqxZRQm7RWVyQDjrnYxtPfYwycFkj7CUG+vcieXzRaB/1of8
        pAnkV97tMs6jbRXgxBvGGyE=
X-Google-Smtp-Source: ABdhPJxub4O4ti3YHUpNH7X94BqtbHhnVYCK73BCXVrvgQWeio/I30cjJEEadISmn+0wxgOW1GLbgQ==
X-Received: by 2002:a05:6512:a95:: with SMTP id m21mr9319762lfu.272.1622303223164;
        Sat, 29 May 2021 08:47:03 -0700 (PDT)
Received: from localhost.localdomain (46-138-84-89.dynamic.spd-mgts.ru. [46.138.84.89])
        by smtp.gmail.com with ESMTPSA id y24sm764005lfg.232.2021.05.29.08.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 08:47:02 -0700 (PDT)
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
Subject: [PATCH v6 0/4] Unify NVIDIA Tegra ASoC machine drivers
Date:   Sat, 29 May 2021 18:46:45 +0300
Message-Id: <20210529154649.25936-1-digetx@gmail.com>
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

v6: - Fixed missed configuration of AC97 clock rate for the WM9712 codec
      in the unified driver.

    - Added new patch that removes now obsolete "utils" helpers and moves
      code into the unified driver.

        ASoC: tegra: Squash utils into common machine driver

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

Dmitry Osipenko (4):
  ASoC: tegra: Set driver_name=tegra for all machine drivers
  ASoC: tegra: Unify ASoC machine drivers
  ASoC: tegra: Specify components string for each card
  ASoC: tegra: Squash utils into common machine driver

 sound/soc/tegra/Kconfig              |  12 +
 sound/soc/tegra/Makefile             |  19 +-
 sound/soc/tegra/tegra_alc5632.c      | 259 --------
 sound/soc/tegra/tegra_asoc_machine.c | 854 +++++++++++++++++++++++++++
 sound/soc/tegra/tegra_asoc_machine.h |  49 ++
 sound/soc/tegra/tegra_asoc_utils.c   | 225 -------
 sound/soc/tegra/tegra_asoc_utils.h   |  38 --
 sound/soc/tegra/tegra_max98090.c     | 276 ---------
 sound/soc/tegra/tegra_rt5640.c       | 222 -------
 sound/soc/tegra/tegra_rt5677.c       | 324 ----------
 sound/soc/tegra/tegra_sgtl5000.c     | 211 -------
 sound/soc/tegra/tegra_wm8753.c       | 185 ------
 sound/soc/tegra/tegra_wm8903.c       | 351 +++--------
 sound/soc/tegra/tegra_wm9712.c       | 166 ------
 sound/soc/tegra/trimslice.c          | 172 ------
 15 files changed, 996 insertions(+), 2367 deletions(-)
 delete mode 100644 sound/soc/tegra/tegra_alc5632.c
 create mode 100644 sound/soc/tegra/tegra_asoc_machine.c
 create mode 100644 sound/soc/tegra/tegra_asoc_machine.h
 delete mode 100644 sound/soc/tegra/tegra_asoc_utils.c
 delete mode 100644 sound/soc/tegra/tegra_asoc_utils.h
 delete mode 100644 sound/soc/tegra/tegra_max98090.c
 delete mode 100644 sound/soc/tegra/tegra_rt5640.c
 delete mode 100644 sound/soc/tegra/tegra_rt5677.c
 delete mode 100644 sound/soc/tegra/tegra_sgtl5000.c
 delete mode 100644 sound/soc/tegra/tegra_wm8753.c
 delete mode 100644 sound/soc/tegra/tegra_wm9712.c
 delete mode 100644 sound/soc/tegra/trimslice.c

-- 
2.30.2

