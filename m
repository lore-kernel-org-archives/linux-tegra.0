Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A37C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 17 Dec 2021 16:23:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239065AbhLQQXA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 17 Dec 2021 11:23:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238463AbhLQQW7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Dec 2021 11:22:59 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77B61C061574
        for <linux-tegra@vger.kernel.org>; Fri, 17 Dec 2021 08:22:59 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id b186-20020a1c1bc3000000b00345734afe78so1904043wmb.0
        for <linux-tegra@vger.kernel.org>; Fri, 17 Dec 2021 08:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1mK0r/9xUuE63DtKuCJhcveUtYFPRvoBOsKNoXyCrPA=;
        b=VM8/lLDXMOd+hUZfrJAyMOvCYcS36Sy6Sm4r7VxDJ5vLiRJuX4RAmz++RQMnPwGRjy
         IMvPhKNZ3upPL5kycR/PpqRfUAXu5IttI11mmhPAUC0BuLsB6RdNkEiNR78GA6facdr1
         CDNg9dnvezxuVqGxmC5zeAk8Td5HIwxuaaLEzlTSJMNR+V9GdYc7qROzQWhyHYl/CFqA
         190jbD+SdN4LgDsxaKX/wv0pG7/pOw0DyRNqHszEykOdnRCyWvHyiVnGBpchUnf82M3l
         So2tmaz3Y/xWhh7Vcme2qxE4WA2tQ6aZmFAi/jyPQNXmNJ+3YaqCZwl6XyEVTt1xwqhN
         CUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1mK0r/9xUuE63DtKuCJhcveUtYFPRvoBOsKNoXyCrPA=;
        b=tbigApRfjBIYvHhQzSCCalhFdaksJFGaGEUxq3bh0AIOuVgwF4Hf6BTvgBCH4Nu72T
         wHdVFkjPpw8dAjIkHzQPQOUfkDq4fY/WaBdPi7miRCkQivMIJ4n2ug/XlSDQdNdyS0O8
         IoNLz0kZ9ykeXE5wHoNe9/jlnPLfCiNRC0miWvDDoW7foKVB/pUxhwVqPetQPIRbda7l
         GaYkP51Xfb14Deez+j0qt0vjkgj+cQH4+2BCDAZUZI/UEatoDdLQ5HvzPYXetjhPJap+
         Cn51t4FiwlOifD4SNX3FoxcWgn8b87IsEIsLv+/bOChCS+T+ma16fyoGooPDUp2S23d4
         1sFQ==
X-Gm-Message-State: AOAM531kJnIrqYAEbm8oF68M5qUV8kRdx8FgQ//aUxpZrcC02WHxIDEX
        jd8+Xb2GeLXrVHr8hYU5H9A=
X-Google-Smtp-Source: ABdhPJw+akvRiJCruMuiEPgxbuNFe3BiGD8LAiDrZWdaMpw1V6oo/FSXtPorZpI92aj0+2egXxHnrQ==
X-Received: by 2002:a05:600c:4e07:: with SMTP id b7mr10245702wmq.8.1639758178019;
        Fri, 17 Dec 2021 08:22:58 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id bd19sm592741wmb.23.2021.12.17.08.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 08:22:57 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] drivers: Changes for v5.17-rc1
Date:   Fri, 17 Dec 2021 17:22:49 +0100
Message-Id: <20211217162253.1801077-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211217162253.1801077-1-thierry.reding@gmail.com>
References: <20211217162253.1801077-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.17-drivers

for you to fetch changes up to e0abae19535504cc012a32c98619c07ace8a91aa:

  media: staging: tegra-vde: Support generic power domain (2021-12-16 14:05:24 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drivers: Changes for v5.17-rc1

This is an assortment of driver patches that rely on some of the changes
in the for-5.17/soc branch. These have all been acked by the respective
maintainers and go through the Tegra tree to more easily handle the
build dependency.

----------------------------------------------------------------
Dmitry Osipenko (9):
      soc/tegra: Enable runtime PM during OPP state-syncing
      soc/tegra: Add devm_tegra_core_dev_init_opp_table_common()
      usb: chipidea: tegra: Add runtime PM and OPP support
      bus: tegra-gmi: Add runtime PM and OPP support
      pwm: tegra: Add runtime PM and OPP support
      mmc: sdhci-tegra: Add runtime PM and OPP support
      mtd: rawnand: tegra: Add runtime PM and OPP support
      spi: tegra20-slink: Add OPP support
      media: staging: tegra-vde: Support generic power domain

Thierry Reding (1):
      Merge branch 'tegra-for-5.17-soc-opp' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into for-5.17/drivers

 drivers/bus/tegra-gmi.c               | 50 ++++++++++++++++++---
 drivers/mmc/host/sdhci-tegra.c        | 81 +++++++++++++++++++++++++++-------
 drivers/mtd/nand/raw/tegra_nand.c     | 58 +++++++++++++++++++++----
 drivers/pwm/pwm-tegra.c               | 82 +++++++++++++++++++++++++++--------
 drivers/soc/tegra/common.c            | 25 +++++++++++
 drivers/spi/spi-tegra20-slink.c       |  9 +++-
 drivers/staging/media/tegra-vde/vde.c | 63 ++++++++++++++++++++++-----
 drivers/usb/chipidea/ci_hdrc_tegra.c  | 53 +++++++++++++++++++---
 include/soc/tegra/common.h            | 15 +++++++
 9 files changed, 369 insertions(+), 67 deletions(-)
