Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA264C432BE
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Aug 2021 16:22:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3C7261042
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Aug 2021 16:22:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233593AbhHMQWg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 Aug 2021 12:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234502AbhHMQWf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Aug 2021 12:22:35 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB2BEC061756
        for <linux-tegra@vger.kernel.org>; Fri, 13 Aug 2021 09:22:08 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id q11so14010355wrr.9
        for <linux-tegra@vger.kernel.org>; Fri, 13 Aug 2021 09:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hL2E+OHMaEPvpW4ofvFox1pZWIDm0uZSMYdfM4ARIh8=;
        b=sZhtKvUnMsvvGQjtf3803c3v8rIIlRbZdxTiwZFpS207ksRQ4dK4EwS/c+XIWwih7E
         PX7cU7ob6GiI+qri200jPcbtzqAYlkNM+trDulTpJw5ck/rweHRdejz9f4vQOMcKLMAJ
         qWeFCO9pQa2+UrPOV3SG+S7puwjC3NJQlOO1/WkhwMbISyzVzaVsaSM/RSlx8jfpM7SR
         jUV1J0cUaP6VMnNzpwwAHz9YDLc1KlnvTOsJFeR0BdO5DBO7/tALZ3BFvLXrylHiU3eQ
         TFFimCWLYGfvrKE5JAmN5v3cWwttQnEhiHGO+eyJEgvUdCh84tXQx+SqrdD8guVWDRr0
         Sxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hL2E+OHMaEPvpW4ofvFox1pZWIDm0uZSMYdfM4ARIh8=;
        b=SDpcqo24nIGz6yzavgw86QO+4ExxZmuVx5MgHZ4urPKxFkidvT8fWnrkCjaYVXPzJx
         aEA6CpZeWxPO9kGA5BrlazdQgaz/hZFFfBwYHGPC0ZeyYpfKw0WT0NNkxkIsonZ/c5ae
         hqN6mSJxQjQ36uLqzImvAMK6fU9ioxVmGDrrMv/mG5DguGVBCxTAMJllKkOHZk2xDCww
         HfhiKPsjVg4xWW7AJFd549rl6m1mAF+ffj4I5YOfVs7Mcwst4y9GmlOZXSN3wF2h6GEh
         zqveF0nrKhtOJp2fJlipCN+png7pcs1d2DqFTtVpqRXd68hpwdNCTtCTtlHguzIIkT6D
         1w/g==
X-Gm-Message-State: AOAM533mCDqNvdkMyH9cuMbp+FWXe3ab+eniajUrMgz6BvXnEbfpTuQf
        akH0UnEZ8wUL46MMZatPOp0=
X-Google-Smtp-Source: ABdhPJwzR+Uowa5MQLzSxcsOnFulMAAm1lotJXL0blvGBNnYk/iRwy07QQUX8ZBrJwBpuoQ2jds9KQ==
X-Received: by 2002:a5d:4dc3:: with SMTP id f3mr4226800wru.302.1628871727392;
        Fri, 13 Aug 2021 09:22:07 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id g9sm1812124wmk.34.2021.08.13.09.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 09:22:06 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/6] ARM: tegra: Default configuration changes for v5.15-rc1
Date:   Fri, 13 Aug 2021 18:21:56 +0200
Message-Id: <20210813162157.2820913-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813162157.2820913-1-thierry.reding@gmail.com>
References: <20210813162157.2820913-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.15-arm-defconfig

for you to fetch changes up to 806b99206b840bcf3bfa44227dc978880d13ed1b:

  ARM: multi_v7_defconfig: Enable CONFIG_TEGRA30_TSENSOR (2021-08-11 12:15:48 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Default configuration changes for v5.15-rc1

Enables a couple of drivers by default so that the configuration is
useful on more devices. This also rebuilds the tegra_defconfig, which
hasn't been done in a long time.

----------------------------------------------------------------
Dmitry Osipenko (5):
      ARM: tegra: Enable CONFIG_TEGRA30_TSENSOR
      ARM: tegra: Enable CONFIG_FB
      ARM: tegra: Enable Acer A500 drivers
      ARM: multi_v7_defconfig: Enable Acer A500 drivers
      ARM: multi_v7_defconfig: Enable CONFIG_TEGRA30_TSENSOR

Maxim Schwalm (2):
      ARM: tegra: Enable CONFIG_CROS_EC
      ARM: tegra: Rebuild default configuration

 arch/arm/configs/multi_v7_defconfig |  4 ++++
 arch/arm/configs/tegra_defconfig    | 25 ++++++++-----------------
 2 files changed, 12 insertions(+), 17 deletions(-)
