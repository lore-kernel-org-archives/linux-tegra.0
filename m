Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7048C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 19:33:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77BF564E06
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 19:33:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232997AbhA2Tdv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Jan 2021 14:33:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232849AbhA2Tdt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Jan 2021 14:33:49 -0500
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 753FFC061756
        for <linux-tegra@vger.kernel.org>; Fri, 29 Jan 2021 11:33:09 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id l27so9859057qki.9
        for <linux-tegra@vger.kernel.org>; Fri, 29 Jan 2021 11:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bqVdY6Y1Pq6EnP728WEfCslQJrqbbJH/OzjLm3CcFak=;
        b=frlSKUglNEaK6Zpvp86GtgN++a9yOZ+2aO/YgJHiBy5G2bESsrJHWyNI2fyjx3vG8k
         36MAdBp+4c7E3fDNpL0vQtOPHajP3DYI7sJw4kH4iPjWTWkKPGr1HW2IeE/3NUUQPLnr
         mhr8CQvXb/jEl5SVirY4jZrvGzz7ussoXU9QYtuGzAjXsUjRs2258+JRMYJ+7sqdOnp2
         iQR8/b9kimu0cg4uqhZa9/KTqXm/16i96G7ea7be05PasQqDomlBcbcju9uk6ChGgXZu
         ZOE/XO4pzNNdazf3bFB5grzxkAYj3mD6CDwGkirWuwdcwkBcTuqkhvdObrFVw1sUt4oN
         UpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bqVdY6Y1Pq6EnP728WEfCslQJrqbbJH/OzjLm3CcFak=;
        b=m/B/ERYfkRbzXxSQru5ap76bBPICluJVg4w7f2I4JcwfAi1Fv1gDcRGGfM92tr8i7C
         Sq9XYCtZ6MUhuDjRyyJZAsA186pmS6w+XcB9rX7wSt3MR/AH8/0zTRvYYsTtjL0UEphN
         TAzu1t8+gFqCPYoCqCDQ6iijQo7/kW47GL7r/4FNfi71ouuJQxZo7QlmQJMAPj+zipmz
         0Jrj1RKKiSWA/1Iu6RL1vTQql1iQSzpdPbMgEzc1Vjh5zYxIkD0xkx9Z8ZYDProqwl1r
         d/0yOJqYE/uHkMBBFo4BaBmkOeXCnQ6LIE8/D5sfQlstXrsz7zslC4d3ln8huEAHJvqM
         f8fA==
X-Gm-Message-State: AOAM530FHYmHfWqu7qRHm3atGFNUsfi/R8Ac7pDeySxFz7r7Pg38grsK
        QPpseSOTpWXf7DEabmBonbsipFBAg3Y=
X-Google-Smtp-Source: ABdhPJyNcVv2s6OfH0LXqQSxzBg0bM2teWMMrnalWOh+8lH382eWJR2cTxp36jtmwKB0alXh5vStVg==
X-Received: by 2002:a37:a70c:: with SMTP id q12mr5811740qke.25.1611948788759;
        Fri, 29 Jan 2021 11:33:08 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id h25sm6766744qkh.133.2021.01.29.11.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 11:33:07 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] ARM: tegra: Default configuration changes for v5.12-rc1
Date:   Fri, 29 Jan 2021 20:32:52 +0100
Message-Id: <20210129193254.3610492-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129193254.3610492-1-thierry.reding@gmail.com>
References: <20210129193254.3610492-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-arm-defconfig

for you to fetch changes up to 760f9c2b84106fd02de701c964e7989c9802791b:

  ARM: config: Enable Tegra SoC Thermal driver (2021-01-19 16:54:49 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Default configuration changes for v5.12-rc1

Enables the Tegra SoC thermal driver on 32-bit platforms such as
Tegra124.

----------------------------------------------------------------
Jon Hunter (1):
      ARM: config: Enable Tegra SoC Thermal driver

 arch/arm/configs/multi_v7_defconfig | 1 +
 arch/arm/configs/tegra_defconfig    | 1 +
 2 files changed, 2 insertions(+)
