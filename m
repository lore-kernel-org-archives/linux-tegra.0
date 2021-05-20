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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 664C3C433B4
	for <linux-tegra@archiver.kernel.org>; Thu, 20 May 2021 17:54:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 394A16109F
	for <linux-tegra@archiver.kernel.org>; Thu, 20 May 2021 17:54:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234334AbhETRzr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 20 May 2021 13:55:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233716AbhETRzq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 20 May 2021 13:55:46 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00F9FC061574;
        Thu, 20 May 2021 10:54:25 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id i9so25756256lfe.13;
        Thu, 20 May 2021 10:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MSeuamGnXAgkNNyC56B/8tNoyLHAJZahhkX5EWuZJAo=;
        b=drigm3jWBw/husIrX7rD1YNqveBwT7xCa6uR5yJowZYmeRz0wH4XGX1ft/dZN2BDWU
         TYMZOkQQ6uGSHWBUHnIWIApKvALY3W1e1EJCRzSmFtvz2sqeVMeUuuMDLFgITIPOth6U
         k4UQl9UkvHCdFr1ONPpqYUXKwCAXjhMtmCGPKoOoaIqeV36VOVrCDGD+/+S9EERVt8sc
         uV98A+1k29+A81Gp3CZRpPBkLLCAY3Vj5pK85SHWPIUP/BR7xX2nb+sk9JjZM4FJizd7
         KQvFlS6/ZjjN5z2RW89Rewzi0xGntGpytqAxhSj65f6MAR7oTaS08CSbdPsd4sO306ZY
         rqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MSeuamGnXAgkNNyC56B/8tNoyLHAJZahhkX5EWuZJAo=;
        b=B1r4A4nomcdCXLepIi4NzE6rI86KueRNR9DcYMIvF+ecBsVzAYoKPqErtS2AcfraaK
         KBX6+cLZZ6lUePqaHlsjhbPgNgbqu6vCKYfGk3/x9no3ISvOdaia+vc2du4ndzx/MaTT
         s/wnd9+cyOdnbKKFy3Gmhac7Jv5xckzwOXyvhwyAHYh5Ca5uxUdOL0uCTl7dFlPYbZ7B
         B3tr0Mmaz7rbvIVkGiaOyVEDD/zq9CWHK4MS88AjDf+QIVjw45rpg2XAGwUB5uJLhrOg
         WEjGd9jNA5yvWndlVmAPfneMhvhbFamogG1f3HkI0WWp7az6WZq1ytjaDcY6ngtM+Ytl
         ev/w==
X-Gm-Message-State: AOAM533x6W48mtFf/LwZZ51A/xDM+4CyJKoKr6Mzkc2Ou14U/McbGjKT
        4kOnw/B4TcdUInKFlolRJk8=
X-Google-Smtp-Source: ABdhPJxbKMKYuzk8/vJ36ofueZGlvEO2QTJoXhdsP3WRbp3iQCou97D6+YYJIEq8B4DG9UKviipyoQ==
X-Received: by 2002:a05:6512:3d0b:: with SMTP id d11mr3816604lfv.405.1621533263322;
        Thu, 20 May 2021 10:54:23 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-88.dynamic.spd-mgts.ru. [109.252.193.88])
        by smtp.gmail.com with ESMTPSA id h16sm362972ljb.128.2021.05.20.10.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 10:54:22 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Unify NVIDIA Tegra ASoC machine drivers
Date:   Thu, 20 May 2021 20:50:52 +0300
Message-Id: <20210520175054.28308-1-digetx@gmail.com>
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

This series needs to be approved by Jaroslav Kysela before it can be
merged.

Changelog:

v2: - Dropped use of of_device_compatible_match(), like it was suggested
      by Rob Herring in a review comment to v1.

    - Added patch that sets card's driver_name of as Tegra ASoC drivers.
      In a comment to v1 Jaroslav Kysela suggested that the Tegra drivers
      don't set the card name properly and he was right.

      I opened pull request with the new Tegra UCMs and updated lookup paths
      for older UCMs [1].

      [1] https://github.com/alsa-project/alsa-ucm-conf/pull/92

Dmitry Osipenko (2):
  ASoC: tegra: Set driver_name=tegra for all machine drivers
  ASoC: tegra: Unify ASoC machine drivers

 sound/soc/tegra/Kconfig              |  12 +
 sound/soc/tegra/Makefile             |  18 +-
 sound/soc/tegra/tegra_alc5632.c      | 259 ----------
 sound/soc/tegra/tegra_asoc_machine.c | 732 +++++++++++++++++++++++++++
 sound/soc/tegra/tegra_asoc_machine.h |  45 ++
 sound/soc/tegra/tegra_max98090.c     | 276 ----------
 sound/soc/tegra/tegra_rt5640.c       | 222 --------
 sound/soc/tegra/tegra_rt5677.c       | 324 ------------
 sound/soc/tegra/tegra_sgtl5000.c     | 211 --------
 sound/soc/tegra/tegra_wm8753.c       | 185 -------
 sound/soc/tegra/tegra_wm8903.c       | 357 +++----------
 sound/soc/tegra/tegra_wm9712.c       | 166 ------
 sound/soc/tegra/trimslice.c          | 172 -------
 13 files changed, 862 insertions(+), 2117 deletions(-)
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

