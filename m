Return-Path: <SRS0=KKuN=C6=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56BD7C43464
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Sep 2020 12:16:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22A79216C4
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Sep 2020 12:16:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fh0O5oVm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgIUMQd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Sep 2020 08:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgIUMQc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Sep 2020 08:16:32 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F811C061755;
        Mon, 21 Sep 2020 05:16:32 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id m6so12528844wrn.0;
        Mon, 21 Sep 2020 05:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8hnwi7LaEnGoXIIbdpTm3FA5D5ZHFuMW4ucIBDqUi6g=;
        b=fh0O5oVmgP8UGqRhZvQ7nHNFQOijHBXXjFiMpPER65YuDwlF6eDtPsNcZ/VMfkNdyy
         zr60KWDl6NvsDtjBTQgzFUwIS+b6MPbWk6/tENbDQry/5lmVJKzJahsr4TaNPG5eXBAt
         yU0SEMqI18UHXuw4nxHWBVgpxpWJi7VuU8vAOxvpe10D3e5w/aWBwyXSzJPpbnwlQtMb
         Z4p4MiuQJfM5PlwFxEX6adxREcvMgM3jSgh4QfCke5bld2ihHp2SdnDWAEVH4wyTBse5
         qA++BWWUq8CvUaH6KkjKXaOmgehNMiiK3KEgED9bEUAL3+x9NX/xAVRfAC/Oo80cFfUI
         NzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8hnwi7LaEnGoXIIbdpTm3FA5D5ZHFuMW4ucIBDqUi6g=;
        b=jdBLQcCktyF1sVqXAfXNATUHNzOM9a1mcb0wwmV2RPNO+0iccgTv3fFGj9YVxot/L6
         GeXfKzAU0Ws4I9Vwsn449me8ooeioMsFCcbJcsJpXSe8j0VdOqjX48O3RhPoqpNN153l
         Tg2RXmI/AGcWzOJA8+DJu1U1SvlHmkKQWdrZVkEJuTAUtk4MArvFmrxVeccvsaYTU0cE
         1OPmZcavycm4iy15DwUqvbkhTDHUM4h1pKci3DSpWkvaFUsjXBirvAk3w37fQO0OC+iR
         pUUgXvMduiT7HQTFvRd/j1f8HF2vXASVQvFjyVQPAn5pJwUetARm+ZQPAmUdKQ/v53Rr
         1T1g==
X-Gm-Message-State: AOAM533gDrth+sqUWWUcycmq0vFsepT7/tdaD+tsJWLawgqAqj7Yj0Da
        BLKIEw1VGy6o1Aj5ZSj2WTQ0i26wEIk=
X-Google-Smtp-Source: ABdhPJx3Kspp4SCs+plVwMN8D8OWZxGXPKdn7Gp6q03FtFRZA01dVaeM3p93tJXLGYfVtNwzdBL4lw==
X-Received: by 2002:adf:e407:: with SMTP id g7mr52002958wrm.349.1600690590999;
        Mon, 21 Sep 2020 05:16:30 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id u186sm19773738wmu.34.2020.09.21.05.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 05:16:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] clk: tegra: Changes for v5.10-rc1
Date:   Mon, 21 Sep 2020 14:16:28 +0200
Message-Id: <20200921121628.3954746-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Mike, Stephen,

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.10-clk

for you to fetch changes up to 2f878d04218c8b26f6d0ab26955ca6b03848a1ad:

  clk: tegra: Fix missing prototype for tegra210_clk_register_emc() (2020-09-21 14:09:10 +0200)

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Changes for v5.10-rc1

This is a set of small fixes for the Tegra clock driver.

----------------------------------------------------------------
Thierry Reding (3):
      clk: tegra: Capitalization fixes
      clk: tegra: Always program PLL_E when enabled
      clk: tegra: Fix missing prototype for tegra210_clk_register_emc()

 drivers/clk/tegra/clk-pll.c          | 7 ++-----
 drivers/clk/tegra/clk-tegra210-emc.c | 2 ++
 2 files changed, 4 insertions(+), 5 deletions(-)
