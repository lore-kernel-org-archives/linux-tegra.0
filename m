Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F92C433E0
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Jan 2021 14:00:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 857EA239ED
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Jan 2021 14:00:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbhAHOAM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Jan 2021 09:00:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbhAHOAM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Jan 2021 09:00:12 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02F3AC0612F4;
        Fri,  8 Jan 2021 05:59:32 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id i18so9866166ioa.1;
        Fri, 08 Jan 2021 05:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nyp1Y2onEbcYwJTPNCdZdClbb6AQgC+DkZVAjw0ozR8=;
        b=LXeMOQn4g3/tfRh8x7CMKYz8CPTI1+pP7Llcf5XajSz8CM2P25BkqFKLzEDSkbA0zg
         F1xAys9s6bb0NieajV86osEicFx5J4wlI2pyMeCcXL59rz3qxzETm1ICIPpa/OS04Tvy
         vxff9M/U2V4E1qQlKWysLYEXk4c31AuwqI0I1yLfAK/KjSbKsEK7L22iODrxXGNLkcKL
         fy9nARZQBZyNUnicJ7YGKFBerNvjNaVYMYCZjVG0/xjFcutSnvZsuCD05yaE9+I/y6bh
         9S7ojgF+VzIrg2x4aaAgdq1/uzZV8lO4st6BHZEV4eaZjrwJRbbe1TJx751WervSroEF
         T5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nyp1Y2onEbcYwJTPNCdZdClbb6AQgC+DkZVAjw0ozR8=;
        b=fZvi968KWSXXC5Qwc9J8cdOtU4XEhuFsx0RoiCLP2ZdfzbwbLEoD/lTtd+d2Edd7jC
         jo69iKClLol4ThQCSpgod17+5nB4XCTwcvu3dWUgDfyhRW1/qQ+7U/JbEqlDNfPkT6dP
         EXMRxlcsKxKaB84LZrRNhThp8/sbZT9ANsQZ6n4X5BobSBLXAgEr90zg2BJtcqGHLwQQ
         fmaP2bnDdxtMim3S0Enz10YSlrnLREmXBBYo/izREx8GN75+RUMo5MMsj0CWWrwuu6lx
         4UJK1EA0wd8IXS9yGSEstuWAOM5AL5r+tzqMHa0S4dKiO2pjPsNkO0jdGUlYYM6dJaGR
         X4FQ==
X-Gm-Message-State: AOAM532GUpsdRyTSw524Uvt+PTLLJ5mWeJP9h4Pz8Hr2IsOXp06fBR/3
        rnEjdiQ9+oygQHuesf3p8XvanzdpZTZYCpvQ
X-Google-Smtp-Source: ABdhPJw+goSAMa6HMOrIAPdukTjXrBnBjqaAhawYG9QJjpQbABV6HDvRDSd3rHGNj0Vpm3tPVXx4jQ==
X-Received: by 2002:a05:6602:2c4e:: with SMTP id x14mr5390290iov.58.1610114371325;
        Fri, 08 Jan 2021 05:59:31 -0800 (PST)
Received: from rockpro64.hsd1.md.comcast.net ([2601:153:900:7730::20])
        by smtp.gmail.com with ESMTPSA id l6sm7570063ili.78.2021.01.08.05.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 05:59:30 -0800 (PST)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Mohan Kumar <mkumard@nvidia.com>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
        Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH v2 0/2] fix tegra-hda on tegra30 devices
Date:   Fri,  8 Jan 2021 13:59:11 +0000
Message-Id: <20210108135913.2421585-1-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The following patches fix tegra-hda on legacy tegra devices.
Two issues were discovered preventing tegra-hda from functioning:
-The hda clocks on tegra30 were assigned to clk_m and running at too low
of a rate to function.
-The tegra-hda encounters an input/output error when opening a stream.

Since the only mainline device that used tegra-hda until recently was the
t124, it is unknown exactly when this was broken. Fortunately a recent
patch was submitted that fixed the issue only on t194 devices. We can
apply it to the tegra30-hda device to resolve the issue across the board.
Note that downstream devices used the spdif device instead of hda for hdmi
audio. The spdif device lacks a driver on mainline.

-Checkpatch seems to have issues finding [1], but git show has no issue.
[1] commit 60019d8c650d ("ALSA: hda/tegra: workaround playback failure on
Tegra194")

Changelog:

v2:
-Added ack and reviewed-by from Jon
-Updated fix to apply to tegra30-hda vice universally (Thanks Jon)
-Updated commit to include comments from hardware team (Thanks Sameer)
-Cleaned up commit messages

Peter Geis (2):
  clk: tegra30: Add hda clock default rates to clock driver
  ALSA: hda/tegra: fix tegra-hda on tegra30 soc

 drivers/clk/tegra/clk-tegra30.c | 2 ++
 sound/pci/hda/hda_tegra.c       | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.25.1

