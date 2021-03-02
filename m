Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4643EC28D15
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CBE564E66
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377427AbhCCDbF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383531AbhCBLgM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 06:36:12 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3503C061788;
        Tue,  2 Mar 2021 03:22:05 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id e7so30726912lft.2;
        Tue, 02 Mar 2021 03:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UXsyTscw9zuLBva4U3+AGU7LQRHCPXqRCSzHFPwdbsg=;
        b=MZO0fEml85aBPb+L0zZijvlr73xZelJgEhc1czmKIkPN1WA/Ao2bmG2eEpQn9/5Cnv
         5gmNhukOhWRqrabru5ZLRuQIe19Ppw7xvec8e8WVtDNcFX2YXjsaC2KTFuDBS9V1HR8A
         q2i1pBwu3M4Yx/RPucxQRLZb8JTWF/n+Sj3BAiypZKcIHbe/VxT6ElkveIjI5YIc+/Sq
         95ldH1eekOw0jmoqo6CncpYd7lOJmwl+A2aFdkIzc4avBbz6tjukMFbxvrmgqU6g6YQp
         p+7yRGMFPKujcTuilLJVt6o0YRGvr4xgMdYCwR/jU1wQP+aK3vfpkWUCxmjOo2tTyiVN
         SMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UXsyTscw9zuLBva4U3+AGU7LQRHCPXqRCSzHFPwdbsg=;
        b=co4w4BK+tYPc7i3YlJwE5NmG0xa5CB9QDnaZtAyI5azSdmPpUxAk2mxj7wgVeusHhU
         weg+DDy2gXh6+7a/kXcj+PGfES1fP+5iz5+JwtnBFp6z+K0W65t8rPfnew3ZBInvirPR
         dMNfjyc0z516kdqQFLxSDFCG7yZ2cU9+RbLuSK9F4Q/AAKHZql4X7kUadAxsSucIQ2gm
         VM5B6JB6fVeXoqoELrEbMZAfQmmqOjE3hQRwGd+nbtjSQrRB9npAtFqIfp0ve1D2As+B
         j74y8wQwfozRpa6s7E0mhUAkLsQWa7zw2WeBFo+6nXRtzdSXGz3my7A+uMr2qT+V2RPn
         upkA==
X-Gm-Message-State: AOAM5335Xi1MJEgz0cV360dSZPFFZyvRS+uZ46tBujSRQkYXB4AWLvW9
        HaDY8HHwUZmdnkBc5TIpnCo=
X-Google-Smtp-Source: ABdhPJxRymJixfSpthjYFtxI7AlxBgvrcbqGsXaXA/6qsfInz7jYNSYRX1M8a7spc/pgycwZXoi9BQ==
X-Received: by 2002:a05:6512:2356:: with SMTP id p22mr11522329lfu.3.1614684124467;
        Tue, 02 Mar 2021 03:22:04 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id w7sm2691078lft.0.2021.03.02.03.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 03:22:03 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] Add missing reset controls to NVIDIA Tegra ASoC drivers
Date:   Tue,  2 Mar 2021 14:21:18 +0300
Message-Id: <20210302112123.24161-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

This series adds missing hardware reset controls to I2S and AC97 drivers.
Currently drivers happen to work properly because reset is implicitly
deasserted by tegra-clk driver, but clk driver shouldn't touch the resets
and we need to fix it because this breaks other Tegra drivers. Previously
we fixed the resets of the AHUB and HDMI codec drivers, but turned out
that we missed the I2C and AC97 drivers.

Thanks to Paul Fertser for testing the pending clk patches and finding
that audio got broken on Tegra20 AC100 netbook because of the missing I2S
reset.

Dmitry Osipenko (5):
  reset: Allow devm_reset_control_array_get() to get resets in a
    released state
  reset: Add devm_reset_control_array_get_exclusive_released()
  ASoC: tegra20: ac97: Add reset control
  ASoC: tegra20: i2s: Add reset control
  ASoC: tegra30: i2s: Add reset control

 drivers/reset/core.c           |  8 ++++++--
 include/linux/reset.h          | 20 +++++++++++++------
 sound/soc/tegra/tegra20_ac97.c | 21 ++++++++++++++++++++
 sound/soc/tegra/tegra20_ac97.h |  1 +
 sound/soc/tegra/tegra20_i2s.c  | 31 +++++++++++++++++++++++++++++
 sound/soc/tegra/tegra20_i2s.h  |  1 +
 sound/soc/tegra/tegra30_ahub.c | 14 ++++++++++---
 sound/soc/tegra/tegra30_i2s.c  | 36 +++++++++++++++++++++++++++++++++-
 sound/soc/tegra/tegra30_i2s.h  |  1 +
 9 files changed, 121 insertions(+), 12 deletions(-)

-- 
2.29.2

