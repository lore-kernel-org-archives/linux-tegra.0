Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE97AECAAD8
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Sep 2022 10:35:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230441AbiIPKfl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Sep 2022 06:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbiIPKfL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Sep 2022 06:35:11 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21279B6D2D
        for <linux-tegra@vger.kernel.org>; Fri, 16 Sep 2022 03:20:36 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id y17so43336083ejo.6
        for <linux-tegra@vger.kernel.org>; Fri, 16 Sep 2022 03:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=+Qwh9Fiu09wuBBgjyS2RCt9cQRNgS7gUGyaRZ+a59cc=;
        b=nzM+z3hahlB24FjW+Ir6yks4MrsDDNqghwdJ9ObGZBL6XavyJINbs3GX+79ZpJyen9
         uphbHqCjL4jf4NabpVXP161NeLtOaarli9Y47iubL2OqBiMTga62OjHoPwaeQd5UUCZZ
         GRvocSie2TX0Mobvmb9SXPx/lqd4C9IvyUl3HMmrYLKwkqwGMkIDwLE3AmyIG3pbjC98
         rDxgDR0f8IlbgixR3FQlk3uy2G7OslRFYjyYFcySv5wMcuevdtsrv9laHmT8Q4xTEkvo
         Tb0cDAZ2rk7LKdu8MIEWR/TrNxfJGpaR/oK1iXFv2bilCmQiNTwviQWaXjCXurmUFsri
         qnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=+Qwh9Fiu09wuBBgjyS2RCt9cQRNgS7gUGyaRZ+a59cc=;
        b=eEPAc626nRwTUOX85R0rElGb18qQ3Xb4vSOQ/X9XagQg5NjiLDfL3BV1WfY/xlfaaz
         s8OPi4vvLUYH3E4Bv3qr+BzjoH2wYcGYzNtWh+4cX7px9lFR7cwULg3ce2EEHvCaTJrt
         FPl05HVYWM8eXCgAAa7ti+ugPnLrZaMsFSHZiRyK62oSfFKpENueqyEMNEUCZX6to3Oc
         p15ulRYwSx0ZxjHbQ5IVfg9XLngcGNw0mCVL0WSAMJ0KE3WlBrxXZA/aBz3yoapPz4Ww
         c2A3MVpjuZB6hOLHLdBeh6A5S2bElV7zGyIEOLqw8sHcrDPtoygDozr/TnqGg3z7hYSG
         8shQ==
X-Gm-Message-State: ACrzQf1bKa/xXwkyDsZ47eD5kd6JNmfUzVNIFwFcNSUh/T8+7yAyyzVj
        8NpP92QeE0ViMzjDlFUxjN5/9Dhse84=
X-Google-Smtp-Source: AMsMyM4s4izcB6Dd9WAvU+HE15lJeBLAMLoYLrMTubz283dqy1O7KRU5go4bdLQDFRJWyI+AjtC68w==
X-Received: by 2002:a17:907:948f:b0:780:4c66:6689 with SMTP id dm15-20020a170907948f00b007804c666689mr3096844ejc.401.1663323601732;
        Fri, 16 Sep 2022 03:20:01 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ci25-20020a170906c35900b0072b3406e9c2sm10309783ejb.95.2022.09.16.03.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 03:20:00 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] soc/tegra: Changes for v6.1-rc1
Date:   Fri, 16 Sep 2022 12:19:52 +0200
Message-Id: <20220916101957.1635854-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.1-soc

for you to fetch changes up to 74f7f183d81c26a53c2b1708364069d391b1b4d6:

  soc/tegra: pmc: Check device node status property (2022-09-15 14:10:49 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.1-rc1

This contains an assortment of small fixes and cleanups. One new feature
is introduced in the form of simple wake events which are needed to wake
the system from sleep on USB port events.

----------------------------------------------------------------
Christophe JAILLET (1):
      soc/tegra: pmc: Use devm_clk_get_optional()

Dmitry Osipenko (1):
      soc/tegra: fuse: Drop Kconfig dependency on TEGRA20_APB_DMA

Liang He (2):
      soc/tegra: fuse: Add missing of_node_put() in tegra_init_fuse()
      soc/tegra: fuse: Add missing of_node_put()

Petlozu Pravareshwar (1):
      soc/tegra: pmc: Check device node status property

Thierry Reding (3):
      soc/tegra: pmc: Remove leading space
      soc/tegra: pmc: Add support for simple wake events
      soc/tegra: pmc: Add USB port wake events for Tegra194

 drivers/soc/tegra/Kconfig              |  1 -
 drivers/soc/tegra/fuse/fuse-tegra.c    |  1 +
 drivers/soc/tegra/fuse/tegra-apbmisc.c |  7 ++++--
 drivers/soc/tegra/pmc.c                | 45 ++++++++++++++++++++++++----------
 4 files changed, 38 insertions(+), 16 deletions(-)
