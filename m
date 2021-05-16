Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D43CC433B4
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 22:21:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2ACDB61076
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 22:21:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbhEPWWp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 16 May 2021 18:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbhEPWWo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 16 May 2021 18:22:44 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BE23C061573;
        Sun, 16 May 2021 15:21:27 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id v8so983288lft.8;
        Sun, 16 May 2021 15:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6hDyKCEJ5F5HU0VO9fIusrmFjq59XWmLLJOKxXWrnM8=;
        b=bV0wxqPoUMCi0MlsefrMnSLYja03+X6cDVysP8KuDNKFEkDt8CgVDyUfCmBPfXm2Vj
         8eqjF5N4YZTtYBRLtv1yx9VwD79rj1ydsDvB/VjYNchPRUvKFZ3//APmy/1AsXI6ZFDa
         iwfh3HZ0ckUkPzGY/jEl8DFFiIqMkMFVH+tawYj9d57IaMkfyf5KoLpbOlyPA3pPUcWO
         +zhbfhv7OMkYXmJuj1Fljs5NO0eSGUB9JoREe4Vd1k2UoIOWTW+lsR8JeFezRXbvMO8l
         wLoZZNR3iUKs4YuXRBT/TN/CZhvosAXfdt3NZGPlOITZM/480NBS/py63bF7G56NbYmW
         qHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6hDyKCEJ5F5HU0VO9fIusrmFjq59XWmLLJOKxXWrnM8=;
        b=YA20m5fZu90LTpR3/ohB/gPSyvIl4FGwSPtsnU+YJh58nWcWBk5lfXeyZvI+Qrkb7F
         RQAKAexJaBwSVykn9rPHKbGyH+PbFMz04a25Qg0h9I0KZyAnAp94lQsoZ8H88BKef6rA
         2071SMXS4rwtaZwgir3dcMiazYSyslFE6Ekt+jAWUXv8mmWKHQLTqfDWbaJcfxxydtyw
         e/ytDZA4okVZg3xW8O5vrOrlEi7IuyVoetBm8O9Ng2crwcVABR06Az0zssQf1s+yjOA6
         4S6egnlTUB5lV4r6uqTi036hoZglxhVnAvuWdlRB0lx/s0NfaOv80KG9GKEyOsiH/ZcO
         9Bag==
X-Gm-Message-State: AOAM530Px6XdyImQp3dntGySCtUmbhJ0+gPu5tiHuzqsWrSeSoZ5/ZTz
        Tp+2RdvGINIK8+94kpmXbnc=
X-Google-Smtp-Source: ABdhPJwNJsCfpbtLf5Q2NyWoJ3UhV0NktWobCbPFY0DV1o4FzjKVgJMkiU2Zcd4TKwurCDtp9l+wXw==
X-Received: by 2002:a05:6512:204:: with SMTP id a4mr17082060lfo.238.1621203686089;
        Sun, 16 May 2021 15:21:26 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id q27sm2680275ljm.127.2021.05.16.15.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:21:25 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        =?UTF-8?q?Nikola=20Milosavljevi=C4=87?= <mnidza@outlook.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 0/2] Restore voltages before rebooting of NVIDIA Tegra SoCs
Date:   Mon, 17 May 2021 01:21:00 +0300
Message-Id: <20210516222103.28595-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

Nikola Milosavljević reported that rebooting wasn't working properly on
Asus Transformer TF101, which is Tegra20-based tablet device.  We found
that TF101 and some other devices have bootloader which doesn't re-initialize
voltages properly on a reboot.  The problem is resolved by ensuring that
SoC voltages are at a levels that are suitable for the rebooting of the
SoC before reboot happens. This series adds reboot handler to the Tegra
regulator couplers, it bumps voltages on the reboot event.

Changelog:

v2: - Added ack from Mark Brown.

    - Rebased patches properly, thanks to Michał Mirosław for noticing
      this problem.

Dmitry Osipenko (2):
  regulator: core: Add regulator_sync_voltage_rdev()
  soc/tegra: regulators: Bump voltages on system reboot

 drivers/regulator/core.c               | 23 ++++++++
 drivers/soc/tegra/regulators-tegra20.c | 75 ++++++++++++++++++++++++-
 drivers/soc/tegra/regulators-tegra30.c | 78 +++++++++++++++++++++++++-
 include/linux/regulator/driver.h       |  1 +
 4 files changed, 175 insertions(+), 2 deletions(-)

-- 
2.30.2

