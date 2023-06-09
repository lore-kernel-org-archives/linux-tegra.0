Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6669C7EE25
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jun 2023 19:36:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbjFITg3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jun 2023 15:36:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjFITg2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jun 2023 15:36:28 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00C5930D2
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jun 2023 12:36:27 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-977c72b116fso321174766b.3
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jun 2023 12:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686339386; x=1688931386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kO1qKhOJaKdap30fcHYTQI7lFzHq12HURBNl6AXLAwo=;
        b=HaRhe8cNwuD2aW7SSxwuWT1A2FrZDaoHZ3geyskluJFFwaEFVOedGvjQiLMOU8j1XY
         5GIJhCpMzVzBnTR1MzGpupJdQE+aXJLHXFHO97kNm2OqdyGBKWWngCFkAuRIdhfaq5pZ
         yiCZ0jUFyIE1si5Pm5Ljg9TR6BfYQWv7u1r8m+pw0saxm5H5gmXsfNZI9xcJA4NPSEfS
         ap0jrai1BIaECTrgJaynu3qxuM87ROy6kVYttPqg47t6EKah5wgaI6YegKS3ZIf+aGqH
         RNHBoFRhXijRPU6UCYqa9F1z7jU6j8QmX/cEKepJC9BVn39wof+zuEv1v9mIRyAmM92P
         3vxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686339386; x=1688931386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kO1qKhOJaKdap30fcHYTQI7lFzHq12HURBNl6AXLAwo=;
        b=RhUZ5Iy/ztf2RndKHx1utMu679GqqV7fBBl2JFN0gsKezSi1V6PMek/Rx/Omao/jO1
         jg0MXgzZAb/hliuFRdB1lwYBLYgnlzA5ScvPukRxrxJybcAEiQCu4eW+3hLwd7s3atvv
         kS/kmmmiDBjg2zXRVP43tPqNCeP2QyEl77UWCCkfPau8lykJhmXJSFq6sx1TbcXHOJ3I
         cbV33NHhH3NFIZB+lhJJJUBfBqnNfzTUvyqomZa3ASsF4jWQRZ7jn9wPQz4g7JwyiS7V
         /45FjriNCFfPYM7BDaZODinkNyiAQRP8fDpDE7BzCJ3kqs1PQ8FyTCHOKkE5c3UhYnO5
         kQ3w==
X-Gm-Message-State: AC+VfDx+MiZv6LB0pMGFIyiDKB+RHQgEtRGASlUQFYKixK5MOzfh5Dl1
        pcgNKnl3IW7MKeynxfkYXiw=
X-Google-Smtp-Source: ACHHUZ7lBuR4AS4bpJEEO5SCTHfx2ULgdyWa08hXimyR75+JGLKOU5N9xxKtHZCys1P9lF6E7YlPTQ==
X-Received: by 2002:a17:907:9307:b0:973:ebbc:1d6a with SMTP id bu7-20020a170907930700b00973ebbc1d6amr2638457ejc.33.1686339386253;
        Fri, 09 Jun 2023 12:36:26 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id zo18-20020a170906ff5200b0096ae4451c65sm1658904ejb.157.2023.06.09.12.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 12:36:25 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] soc/tegra: Changes for v6.5-rc1
Date:   Fri,  9 Jun 2023 21:36:15 +0200
Message-Id: <20230609193620.2275240-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.5-soc

for you to fetch changes up to c954cd7ad041251d903707c463a2c4d6cc30e5ae:

  soc/tegra: pmc: Use devm_clk_notifier_register() (2023-06-09 16:56:58 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.5-rc1

This adds initial support for identifying the Tegra264 SoC family and
fixes potential issues when reading from the FUSE block. A new software
wake event for the AON cluster is added on Tegra234 and the debugfs
initialization is drastically simplified.

----------------------------------------------------------------
Kartik (1):
      soc/tegra: fuse: Fix Tegra234 fuse size

Stefan Kristiansson (1):
      soc/tegra: fuse: Add support for Tegra264

Thierry Reding (2):
      soc/tegra: pmc: Simplify debugfs initialization
      soc/tegra: pmc: Use devm_clk_notifier_register()

Viswanath L (1):
      soc/tegra: pmc: Add AON SW Wake support for Tegra234

 drivers/soc/tegra/fuse/fuse-tegra30.c  |  2 +-
 drivers/soc/tegra/fuse/tegra-apbmisc.c |  3 ++-
 drivers/soc/tegra/pmc.c                | 31 +++++++------------------------
 include/soc/tegra/fuse.h               |  3 ++-
 4 files changed, 12 insertions(+), 27 deletions(-)
