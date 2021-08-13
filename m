Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251F7C4320A
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Aug 2021 16:20:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0772D610CF
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Aug 2021 16:20:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233839AbhHMQUs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 Aug 2021 12:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231503AbhHMQUs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Aug 2021 12:20:48 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1509EC061756;
        Fri, 13 Aug 2021 09:20:21 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id r6so14054356wrt.4;
        Fri, 13 Aug 2021 09:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EtTi82zv1W6qbA1UgdC/JzbU8TMXbWqcbjVmeC8xG5I=;
        b=HmvF8SfOhclo7FEZpfVLUuS4axHlsQ9YGtRGyljlmK0QHDZB82HAIO/+d3Ni8KMcTq
         qPiCitdIotYKU8kviggSfzjHh0dITYZ6KjEyFaHicHYzkOxWA3i1gPVgG0BGB3zgY47s
         Yodtq+wg4CNOPoFx+30qxV1l1GwQ8+/245zGJdNqXnNWsApS4X1SHepn7XtJlnIyBGSW
         OYkHcoUznr7MLga3ErGWxbUnpnCcan6ipdkanbTqjOaVHss+pcBZbNlobQDBr5p4H3C3
         viqs0xxr202aj1XK1FkWfw8MwIgPez6WwUkNk+AYa5KlbD9FpfqNS3ohpWWS6fxbSnjR
         5H7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EtTi82zv1W6qbA1UgdC/JzbU8TMXbWqcbjVmeC8xG5I=;
        b=eLfGQX3el7xMJuk3AqTDRJCR64XeOtvYqyuXkq2zkp58ZiFEGvN3883Oa03o/MDiFu
         mcyHfUlKhYrYDlnwipAi0dH9xptvJAjcQyVIm8p9irE9V3LaraDHIzFIYvfle+qSGplc
         SRGKd3fnZZ6iD6nVx/n7JAiN5m87k1K46cy4c7acZvH9WtSkO73iE5tzJWwMjEjxdDJB
         ajHm/H5zKfSoFkxHRFthk/dGoRXP+v3ymNt7Xo02AJOXjs3EJiKwXHQ+p+m9IaybtsjP
         mCOSq9fJMaEcnGxXhF+VGTfM8pW1BoUjkRxJ5LqBJZTba9/eefSJPdZ577A8mzZtT/k/
         WFqA==
X-Gm-Message-State: AOAM531o+UJDmnALrYXqAhqUEcROmlkimLzcI/DioBe8TZU5wS9Xqfth
        301+achJteNl5Mh8pFCGWyU=
X-Google-Smtp-Source: ABdhPJzoYyZgkSgAJgJxCrK72my9BHt/tEU/1t4x5U6mELtsJsNRyltJeqvvi/XEkoTM5BzZN/FDAQ==
X-Received: by 2002:adf:e107:: with SMTP id t7mr4109796wrz.165.1628871619659;
        Fri, 13 Aug 2021 09:20:19 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id b15sm2000158wrq.5.2021.08.13.09.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 09:20:18 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] clk/tegra: Changes for v5.15-rc1
Date:   Fri, 13 Aug 2021 18:20:14 +0200
Message-Id: <20210813162014.2820473-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Mike, Stephen,

The following changes since commit 59c6fceb2ecc382c3d20508a235b539bf23af1f0:

  soc/tegra: fuse: Enable fuse clock on suspend for Tegra124 (2021-08-11 11:55:56 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.15-clk

for you to fetch changes up to faa8605f9f92e36c724ecaf03b466cfe31b04b06:

  clk: tegra: Remove CLK_IS_CRITICAL flag from fuse clock (2021-08-11 11:57:01 +0200)

Note that this pulls in a couple of changes from the ARM SoC tree, which
I haven't explicitly included in the diffstat below. If you prefer I can
also send this again after v5.15-rc1 which will then already include the
dependency. It's not a critical patch, merely a clean-up, really.

Thanks,
Thierry

----------------------------------------------------------------
clk/tegra: Changes for v5.15-rc1

The FUSE driver has been updated to take manual control of the FUSE
clock over suspend/resume cycles, so the CLK_IS_CRITICAL flag can now be
dropped.

----------------------------------------------------------------
Dmitry Osipenko (1):
      clk: tegra: Remove CLK_IS_CRITICAL flag from fuse clock

Thierry Reding (1):
      Merge branch 'for-5.15/soc' into for-5.15/clk

 drivers/clk/tegra/clk-tegra-periph.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)
