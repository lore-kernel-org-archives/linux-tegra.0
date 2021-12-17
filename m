Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C84D1C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 17 Dec 2021 16:03:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233419AbhLQQDb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 17 Dec 2021 11:03:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235165AbhLQQDa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Dec 2021 11:03:30 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1E23C06173F;
        Fri, 17 Dec 2021 08:03:29 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id d198-20020a1c1dcf000000b0034569cdd2a2so1836285wmd.5;
        Fri, 17 Dec 2021 08:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BbxL+1YwSZqSNgh0PXdSZOr3fXboEtkYJo+qZ4UYg3A=;
        b=F5EtOt6fwchXPBYYKV76XXa6rlSfGJEd8p+/R3OGJH9ckCQg4Lisms2g1XjgrR8NRp
         MMSIu7bxq3xlbjjnYKrMdKB5ERfz6GdXYYAf6l7+gLHSM91FwZWBuk3H2we4oWeEUI1g
         GP8FYinpCoOhzPNzLWhuG6/07CJwYbtkDd3JdQ58heIrQo3+Hxh6ssfr3QLpWkxmdeLW
         UwJCgOXXe1gCev5w+oSgGqWFA8lZURQNutHs/F+J9bNHBVum+Dsct0+BoL5X1c79/3fl
         v0BJq838m16MATM2huO+hT7klkexO1CZu6+Wxa4jzTtSK/btinD9myT1Wl9fb+M8S2G/
         19qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BbxL+1YwSZqSNgh0PXdSZOr3fXboEtkYJo+qZ4UYg3A=;
        b=JsQm/qAjLca4NUbaQIWf2MPiI/+WM56flM8+Nod/tl6hRiIXl0lTSc/BJjgwvtbhna
         VKTFPeZkoAPrkufWN1dIMJbmExGILL8q19HBlVz+sbZhtvCOLAJcVP28k0ogu65mrMUX
         4FsaKZV2j6Gd3U6u6qVhBXnujlEWBDcue2BpDoUTsfQ8+esFcP5uGh2vAXR+sH+uUiqn
         kwkFryOhx9nocv49PS1GShJt9S6f/Auu/Owx+Zkep718ADy7ykDUcPLK/6fYX/0MYpYJ
         Srzd2jXpB3zTc9bUGiDtju6NYJLvMH4GjTGFXgJF4xVkZQRFUb3Fxv+d9tXtZ/s8BAHm
         6qkQ==
X-Gm-Message-State: AOAM530hVMTmfN00FV0J+rrwHiKBzqHmLJ2UCppL7zOWmnprhrr2GHwk
        WjBJkRR5LSlIHiexGtgXLn0=
X-Google-Smtp-Source: ABdhPJzvbqMteZh1nEl0y77TRDimsVRh4rvInAU/UyNutqZ8CdKlnH53yu3duvHqtTYzGi5GIM+KRA==
X-Received: by 2002:a7b:c76e:: with SMTP id x14mr3301650wmk.27.1639757008439;
        Fri, 17 Dec 2021 08:03:28 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id j17sm10500040wmq.41.2021.12.17.08.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 08:03:27 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] clk: tegra: Changes for v5.17-rc1
Date:   Fri, 17 Dec 2021 17:03:22 +0100
Message-Id: <20211217160322.1157799-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Mike, Stephen,

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.17-clk

for you to fetch changes up to b1bc04a2ac5b15e0b681228376664671fc2f2017:

  clk: tegra: Support runtime PM and power domain (2021-12-15 18:55:21 +0100)

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Changes for v5.17-rc1

This contains a simple fix for the VDE clock on Tegra114 and some
preparation work to support runtime PM and generic power domains.

----------------------------------------------------------------
Dmitry Osipenko (2):
      clk: tegra: Make vde a child of pll_p on tegra114
      clk: tegra: Support runtime PM and power domain

 drivers/clk/tegra/Makefile       |   1 +
 drivers/clk/tegra/clk-device.c   | 199 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/tegra/clk-pll.c      |   2 +-
 drivers/clk/tegra/clk-super.c    |   2 +-
 drivers/clk/tegra/clk-tegra114.c |   2 +-
 drivers/clk/tegra/clk-tegra20.c  |  77 +++++++++++----
 drivers/clk/tegra/clk-tegra30.c  | 116 +++++++++++++++++------
 drivers/clk/tegra/clk.c          |  75 ++++++++++++++-
 drivers/clk/tegra/clk.h          |   2 +
 9 files changed, 421 insertions(+), 55 deletions(-)
 create mode 100644 drivers/clk/tegra/clk-device.c
