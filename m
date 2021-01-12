Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52473C432C3
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 13:00:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18A0F2311D
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 13:00:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbhALNAF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 08:00:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390626AbhALNAD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 08:00:03 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A53C061575;
        Tue, 12 Jan 2021 04:59:23 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id o13so3246695lfr.3;
        Tue, 12 Jan 2021 04:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+afUEpDMhe7ussFXU5RD6s0njNqgxNofkXjI+x50JfQ=;
        b=CB1EKgjf1qF3agk6x30CIeWs/lLDeQNdu0wJHPZYpRxNBCzaCOkmT0z9yIbQyBRDS1
         l19AO/rlLhz7wC03CY7dHlR21LPEXpVXgAjg+TeH0YNBzVe83dzxq2lF0+9mV0btWDwm
         N/07BMILeNnxhEvSPkyqHR/BR8/cfp47ne2Bb9TryqYTqRq9GUFW7C0a0n3YKsy6SOuQ
         exc71/bIW8RBmp40Im5FwOoldSLjHIfpxA5wqUUZFTUAoCBPeT2QD6c5iHkfNrvInF+K
         J0nH+GcjA6GULo0DB79ua76cUiNOKXXkDJGG++co4SMOnQaTB8zg2RC5WL2JFKuC+k5c
         /C5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+afUEpDMhe7ussFXU5RD6s0njNqgxNofkXjI+x50JfQ=;
        b=O2FMf3nUi0jdr+v/1KzWc94Fy3uKVTYq81Lksuo/X/d99NvxzJ5GENBki6HLja9Mzo
         A4B2cXs0Aainad5fTuR8IOHQSJdU9By2a2WNZlAK5ewC/W98LkMB/Jr4EUP+UqKhdxr5
         My2/gHMJHt26QQ4D128nC7SVaOKabvDzqec2Wwo4qX7xyY0QZPZttz6SJC82du61F9W3
         FxMk+RbZchMkBGvPRWRE1OrntpFQbD7wUVffGA2qBRXUSV1iuQrhjp84zPfASi/Uia05
         4pOrnPSrJRrGOM3JZ2easyzH6ekvtvveWwY+KwDhwVj2dZWmjPQrOcsRdzYXSqlLn+QB
         FGVw==
X-Gm-Message-State: AOAM533+50eu9mNMbqvqKR5W3h8JJ8MTNJvTNely124BowY1jzF/ulte
        t1W7gUoGudwlZkyGHv4410M=
X-Google-Smtp-Source: ABdhPJzyd4WGQhqZtI/2sAskfJU7FySL7B5s58e20JMeJDqE+uoQ85q3s1u+Rwe9SUe5ZI3etDplrA==
X-Received: by 2002:a19:cb05:: with SMTP id b5mr2049857lfg.61.1610456361579;
        Tue, 12 Jan 2021 04:59:21 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id 192sm384211lfa.219.2021.01.12.04.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 04:59:21 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] Clock and reset improvements for Tegra ALSA drivers
Date:   Tue, 12 Jan 2021 15:58:29 +0300
Message-Id: <20210112125834.21545-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series improves the handling of clock and reset controls of
NVIDA Tegra ALSA drivers. Tegra HDA and AHUB drivers aren't handling
resets properly, which needs to be fixed in order to unblock other patches
related to fixes on the reset controller driver since HDA/AHUB are bound
to fail once reset controller driver will be corrected. In particular ALSA
drivers are relying on implicit de-assertion of resets which is done by the
tegra-clk driver. It's not the business of the clk driver to touch resets
and we need to fix this because it breaks reset/clk programming sequences
of other Tegra drivers.

Dmitry Osipenko (5):
  ALSA: hda/tegra: Use clk_bulk helpers
  ALSA: hda/tegra: Reset hardware
  ASoC: tegra: ahub: Use of_reset_control_array_get_exclusive()
  ASoC: tegra: ahub: Use clk_bulk helpers
  ASoC: tegra: ahub: Reset hardware properly

 sound/pci/hda/hda_tegra.c      |  86 +++++++++------------------
 sound/soc/tegra/tegra30_ahub.c | 103 ++++++---------------------------
 sound/soc/tegra/tegra30_ahub.h |   6 +-
 3 files changed, 49 insertions(+), 146 deletions(-)

-- 
2.29.2

