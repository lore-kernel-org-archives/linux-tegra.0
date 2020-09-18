Return-Path: <SRS0=kXk7=C3=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 610FEC43463
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Sep 2020 15:03:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0681C23119
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Sep 2020 15:03:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0qcHLmx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgIRPDP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Sep 2020 11:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgIRPDP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Sep 2020 11:03:15 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34423C0613CE
        for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2020 08:03:15 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id m6so5991968wrn.0
        for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2020 08:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6MqmYtoNPusi7d9e/KIUSFMLKp5blUl2clfpqGQ3OYE=;
        b=F0qcHLmxyIwaiO+Rpa1HZxLzjaBCTuhT51b5Z4cLfqo100Rfn4nooxMXdjsrxgnvpb
         EM7tjo1ZTfsKunbnqbsl/WUa1dC8YmAX8NkJcisgUN/7sBJedE1RcoFeh87YLCp7E4JD
         FGOB25W96VbG23Vkd9ksD7H7qwUmiv4goAA1UlPk/0C95b7ps70SxTzMC5acDzzfQV+H
         JC3su+KjGPZaeoej6oLpqcb3JxfRsqYie0T5hGn+gwuypjTXWKtJkAxozCMhVLgeis1G
         AbRfyUStBxCAlu3Tndns+59uSj7iNJgKyG11E87JOHGxnPq0fTlgaJ8SfVIsrxhZEaXc
         RWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6MqmYtoNPusi7d9e/KIUSFMLKp5blUl2clfpqGQ3OYE=;
        b=SWEqXBoyBDIS/HAldHw3YKboRKVWUh/iaqJD71pzYtJdzDaBJwAsCvmaqcD2GvDEhG
         04wVwiSDm6dfB0ozEKS5XhOLR79DOOhBpKNS7nh0j6JwEH5zLMEMj2sylbrUiQ886GEp
         SuuuerQyzc3mZEGnjvD3X+6RfCJ3+SjU1TxyZd0j8HvbKuVGqOPZgljki9XJR7vtQZ1c
         PeVWwzA9db369esZ1pKVwiETYx/Q3QbFDk3nJ7D9fVVi60W6g+TRzF7GPfMpH+8LRKdT
         oeI0lq8EmyXmWAMkeV0SOr0Cr0ZWS9Idw63EXvw1//3mC02Xm3nZIrnAzVSmkBLx3N+Y
         6w1A==
X-Gm-Message-State: AOAM533kUKiKlIP0SXiwCIxNuStp3eYJKf3OEiu9zNp8WoQ4nUQo1DR3
        FlxJB/trE2UhqpQlUl6cL7Q=
X-Google-Smtp-Source: ABdhPJzLcBCw4+Qq9YIislBi8l67/yVhdfM5ehtAf1Dy5W6jpUkUjpFJ3NKI6ZCEeHJ7VglTpUOHzA==
X-Received: by 2002:a5d:61c7:: with SMTP id q7mr38806255wrv.343.1600441393776;
        Fri, 18 Sep 2020 08:03:13 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id d23sm5082728wmb.6.2020.09.18.08.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 08:03:13 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] soc/tegra: Changes for v5.10-rc1
Date:   Fri, 18 Sep 2020 17:02:59 +0200
Message-Id: <20200918150303.3938852-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200918150303.3938852-1-thierry.reding@gmail.com>
References: <20200918150303.3938852-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.10-soc

for you to fetch changes up to 34e214a99689054e666cd4149500a37fa0c5ac98:

  soc/tegra: pmc: Add Tegra234 support (2020-09-18 15:55:37 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.10-rc1

These changes contain a bit of cleanup and chip support for the upcoming
Tegra234 SoC.

----------------------------------------------------------------
Thierry Reding (6):
      soc/tegra: fuse: Extract tegra_get_platform()
      soc/tegra: fuse: Implement tegra_is_silicon()
      soc/tegra: fuse: Add Tegra234 support
      soc/tegra: misc: Add Tegra234 support
      soc/tegra: pmc: Reorder reset sources/levels definitions
      soc/tegra: pmc: Add Tegra234 support

 drivers/soc/tegra/fuse/fuse-tegra.c    |   8 +-
 drivers/soc/tegra/fuse/fuse-tegra30.c  |  30 +++++++
 drivers/soc/tegra/fuse/fuse.h          |  10 ++-
 drivers/soc/tegra/fuse/tegra-apbmisc.c |  26 ++++++
 drivers/soc/tegra/pmc.c                | 146 ++++++++++++++++++++++++---------
 include/soc/tegra/fuse.h               |   3 +
 6 files changed, 181 insertions(+), 42 deletions(-)
