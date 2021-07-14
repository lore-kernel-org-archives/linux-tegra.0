Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0EF8C11F66
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 02:51:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84FD56138C
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 02:51:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237606AbhGNCy1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 13 Jul 2021 22:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237478AbhGNCy0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 13 Jul 2021 22:54:26 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 162C9C0613DD;
        Tue, 13 Jul 2021 19:51:35 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 141so1130076ljj.2;
        Tue, 13 Jul 2021 19:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y18MtVBNJCSt0reG0zKbcirRM5joaQD9M2TfGGnejyo=;
        b=gghF/2RWHy96MSprDxIu9kWldrcM06u8UscUnK4/85eFYkT4gC0CU/eIgTguLDZaZb
         7UvhFRBuHVpLpAhKxVTRQNM6oXlSM90Ftmit2D5hc5jz91hLAsunJ3ISEfnGt8uUko+8
         kG8HY3AgohPCtHrIqGKSioqnVCeiWUm37mPyn2Jcx3H1TfTretFcDlVeLYutf1hUphK4
         q1qA8VEhlXYhVcvXro0eNVbVFZ4xWQAOt61zO7ww0xLUBRd1AgwuSjh2uyUlnAB+xzgj
         8n8W0kyZ/BYb3xK15jTX19uPuMDL0CZn5yKxjKWx7aIIUdDXTWTVqmZ0W7LZpokkpE9I
         XDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y18MtVBNJCSt0reG0zKbcirRM5joaQD9M2TfGGnejyo=;
        b=JcotPwHthhzH1WgTgqRZ5CNNmcbbbbsNi5FoCfF2hRhh4KEjIYcY23VzdDQc/nZdkl
         o73bXAIT1Pvn2WvhEW0t6Z+V/xK1pe5ENneiQ47f1M9vHDCaZX27X9W5K48TSkbYOUQV
         Mr6L2Q68tmDWvEcwsjg+o+OX/O2qxWpBeHL+SKvgcY029Mxp7sRTJq+k25JIvo3QANsk
         CIFT6AmGIZwl+AFJSthWcG3fw8xJqOHtkIEwK0VFFaYPs0L9QK4koj6rJMomvXQERtuK
         aTBKN8q029bNK+wAbkjDCiWyYT2TQb80ZEKlFgZNJHxApLtL99TychMNLyg9Y6iFayu4
         Y5dw==
X-Gm-Message-State: AOAM53222HAP6HLowmMF/Gd2Qhm02j0b+lLwId3y9eLIrDUrnZMxLzjx
        bDwvrwyc59InjlCLIJUgSuY=
X-Google-Smtp-Source: ABdhPJyJ2nqd8NxVQVU1+U8BpqxjxS4jSQccHlgOfwshtNBtYCdX6vTu0CcxALxvKt7S+Cc8FiUj4w==
X-Received: by 2002:a2e:8883:: with SMTP id k3mr6867850lji.247.1626231093520;
        Tue, 13 Jul 2021 19:51:33 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id a10sm50281lfb.93.2021.07.13.19.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 19:51:33 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 0/7] Tegra Kconfig improvements for 5.15
Date:   Wed, 14 Jul 2021 05:51:20 +0300
Message-Id: <20210714025127.2411-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series enables new Kconfig options, it also fixes CONFIG_FB and
CROS_EC options.

Changelog:

v2: - Added two more patches from Maxim Schwalm that are fixing CROS_EC
      options and refreshing tegra_defconfig.

    - Added fixes tag to the CONFIG_FB patch, thanks to Maxim for finding
      the offending commit.

Dmitry Osipenko (5):
  ARM: tegra_defconfig: Enable CONFIG_TEGRA30_TSENSOR
  ARM: tegra_defconfig: Enable CONFIG_FB
  ARM: tegra_defconfig: Enable Acer A500 drivers
  ARM: multi_v7_defconfig: Enable Acer A500 drivers
  ARM: multi_v7_defconfig: Enable CONFIG_TEGRA30_TSENSOR

Maxim Schwalm (2):
  ARM: tegra_defconfig: Enable CONFIG_CROS_EC
  ARM: tegra_defconfig: Rebuild defconfig

 arch/arm/configs/multi_v7_defconfig |  4 ++++
 arch/arm/configs/tegra_defconfig    | 25 ++++++++-----------------
 2 files changed, 12 insertions(+), 17 deletions(-)

-- 
2.32.0

