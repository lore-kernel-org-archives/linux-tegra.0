Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D6BC47097
	for <linux-tegra@archiver.kernel.org>; Mon, 31 May 2021 13:22:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 351C461424
	for <linux-tegra@archiver.kernel.org>; Mon, 31 May 2021 13:22:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231690AbhEaNYa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 31 May 2021 09:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231982AbhEaNWd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 31 May 2021 09:22:33 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB7BC06134C;
        Mon, 31 May 2021 06:18:56 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id n4so10915212wrw.3;
        Mon, 31 May 2021 06:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CPy9NivJ4+OnsB0N3Ckvfihd4T9g1JDC37vpykwfW80=;
        b=BO86BuF3qt+lZ42S3UyL6Rmps82zLl7Ly5WgO6UHO3QEHdwcVr4UJQjkK3VhwWxSSc
         cYRWM7Bpmcbe5HPQQ4b5uqbX45evZmuPhfufvCldGAJqOK9N7BlpxbhOHszH+FyoZyZF
         WhLg3Pig7SRgMo3KqUSdo7WFeDm7dP2esjRciKH6omJce/eclsgbLZSY50kF6NEHtrsa
         HlmbXzRI4jImmeKaTVo/fCSbSv/djncQdEoN87JzhxzRXowF52f1hSbJxzQv6SgYoYwj
         6fffj8zqm4AA9UyROghzp4EXjAzrcbg3yB0cpqOFfvX5dnah7s6gYH5nTFbcBFxMTft3
         dvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CPy9NivJ4+OnsB0N3Ckvfihd4T9g1JDC37vpykwfW80=;
        b=tz4EODGisiSz646remWr3fMGE1eUvAxdNxcGyVqZ19MQ2bhYOE50v1UEJSO7pNcGs7
         kxWvFasL/w92cLDO3hEpfMoVzHuiDZDrmqMsZ/QtHbfwjNGMKnuzet41s8mI7UILbpRS
         8UoDELf7jEJExFE2KgUutQg3D0/Um16WZw4v8NdDqhDfhEj1Bae/Lxatfgqb6+LdAQ1X
         koAK3bzW/ylvmxopLRXunDuXl9GyDI3F3hcGz8D9+IpfGXmSfWCxCC8OMhs1Htpt1o0b
         XH0X3thN9C0oWuMxbnXPahWJq2y6BZOrkBBnQHmKQZX4tHXoevLYQw47iHl6ktcEtjmR
         sn7g==
X-Gm-Message-State: AOAM531HmvnMMWfvPHeoIQKgfDCS8CHOVs4zEZzLSHdkJvSFKfd5uzsu
        KzIxwUUJAdlTi4aQeqFGqk4=
X-Google-Smtp-Source: ABdhPJzNnefb0w4qebibJ4QbKeLj4qi4ZjuQLrBZGFy/vC3WHy6Iq91ipY+hueyfpFeIFnMfybcANg==
X-Received: by 2002:a05:6000:1845:: with SMTP id c5mr21118493wri.15.1622467135200;
        Mon, 31 May 2021 06:18:55 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id o11sm17499760wrq.93.2021.05.31.06.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 06:18:54 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Prashant Gaikwad <pgaikwad@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v8 0/9] Couple improvements for Tegra clk driver
Date:   Mon, 31 May 2021 15:20:26 +0200
Message-Id: <162246707691.166381.10603183245488189380.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210516163041.12818-1-digetx@gmail.com>
References: <20210516163041.12818-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On Sun, 16 May 2021 19:30:32 +0300, Dmitry Osipenko wrote:
> This series fixes couple minor standalone problems of the Tegra clk
> driver and adds new features.
> 
> Changelog:
> 
> v8: - Replaced division with a shift, which was suggested by Michał Mirosław
>       in a comment to "Handle thermal DIV2 CPU frequency throttling" v7 patch.
>       Cortex A9 CPUs don't have hardware divider and shifting is a minor
>       improvement here, nevertheless it's good to have it.
> 
> [...]

Applied, thanks!

[1/9] clk: tegra30: Use 300MHz for video decoder by default
      (no commit info)
[2/9] clk: tegra: Fix refcounting of gate clocks
      (no commit info)
[3/9] clk: tegra: Ensure that PLLU configuration is applied properly
      (no commit info)
[4/9] clk: tegra: Halve SCLK rate on Tegra20
      (no commit info)
[5/9] clk: tegra: Don't allow zero clock rate for PLLs
      (no commit info)
[6/9] clk: tegra: cclk: Handle thermal DIV2 CPU frequency throttling
      (no commit info)
[7/9] clk: tegra: Mark external clocks as not having reset control
      (no commit info)
[8/9] clk: tegra: Don't deassert reset on enabling clocks
      (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
