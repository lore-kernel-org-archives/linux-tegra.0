Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB08C433B4
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 21:13:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03FED610A7
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 21:13:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233826AbhEPVOd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 16 May 2021 17:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233721AbhEPVOc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 16 May 2021 17:14:32 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C813C061573;
        Sun, 16 May 2021 14:13:17 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id h4so5901321lfv.0;
        Sun, 16 May 2021 14:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zZZyb5PF8kxSD1UBWF/3E9fQhGx39CrBn2rzklbxfzo=;
        b=GgwMZLycyaCQtpyTDNrdOGofmmZcWVYBwUkxyfgAjsDfiveXIpR2wgkT0Opul8og2f
         P3GbvmJwdcI3sPlK6nskM59vsBXhJF6dFi4m3BLC6qLYWF874b1Hmdr0P+QvB0k8Zs3h
         iAWSc8Z41XSrNIoyyCgsHtXo7Gr3ryx4C7Iv8Efh0MGk8kFgkk+mN8tR1zPyugImvYBg
         zV9ugqhLL5c1W8+FtxWOU5vIEoBvxejW8hToXcgIMvPrLb+XNO/F0y4cqR3bccpzwHcz
         +EW+rRXH7A4Ft6EIoLzEnDAfetYyuFgIzP+EqA2/kHAPsUMDGpOsXTmBnVaYCKvKOLA4
         vRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zZZyb5PF8kxSD1UBWF/3E9fQhGx39CrBn2rzklbxfzo=;
        b=O7MmTyjMtqHV0rgLHtxCoCo5TUEvhcrUb4COtx7CINV0j1p5AzyXwvV2tzC5WqYnsD
         vCmNCSL4pP4xDxiFVWbVM85Weyk47LPuzF3B7QdO6avHhxKjwqJcAIMhO8RoMLS1de3K
         4GtFt/uG8mP6fYpiY5qu9SR/KTPOR1d3pOIjox6jHgakdiqlUw145Xyhis2kTeEI3vjy
         1Xw8sVqoDpF/2907rXohtAqWGoMoSXiA/WY578m4ERaPEEF+U/LTFSFq2slEk//j3xyq
         6norlP9p8jywSAySzc8XW90iZO8KvqDBUS7S3tw3N5cdspZS+JKNgRn73uF45VwDmWS/
         0qKw==
X-Gm-Message-State: AOAM533xumeV+JJ+lbSR1SwrEbOhs+VQRQsmsXwyUeY2R7YyTmcDmSoy
        GlF/Dj7jVPzw/1EJowXR8e0=
X-Google-Smtp-Source: ABdhPJx1b2bly86/IxZoniIV54kECi1TdvRl6hih/UyUvCdOk3i/b9Og+u5sLi4uLgNDLJ6yyslPhg==
X-Received: by 2002:a19:711a:: with SMTP id m26mr40154033lfc.197.1621199595681;
        Sun, 16 May 2021 14:13:15 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id q27sm1768785lfd.266.2021.05.16.14.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 14:13:15 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Paul Fertser <fercerpav@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Make Tegra memory drivers to use devm_tegra_core_dev_init_opp_table()
Date:   Mon, 17 May 2021 00:13:00 +0300
Message-Id: <20210516211302.32404-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra20/30 memory drivers could take advantage of the new helper which
initializes OPP table right now [1]. Other memory drivers can't be
switched to the new helper until core voltage scaling will be supported
by the corresponding Tegra SoC generations, for now only Tegra20/30 SoCs
support core voltage scaling in the upstream kernel.

Please note that [1] hasn't been reviewed and merged yet.

[1] https://lore.kernel.org/lkml/20210516205138.22501-1-digetx@gmail.com/T/#m247b51a938244c500d70c38cdb9d44adb5f389a7

Dmitry Osipenko (2):
  memory: tegra20-emc: Use devm_tegra_core_dev_init_opp_table()
  memory: tegra30-emc: Use devm_tegra_core_dev_init_opp_table()

 drivers/memory/tegra/tegra20-emc.c | 48 +++---------------------------
 drivers/memory/tegra/tegra30-emc.c | 48 +++---------------------------
 2 files changed, 8 insertions(+), 88 deletions(-)

-- 
2.30.2

