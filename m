Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D8DC4338F
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Aug 2021 19:58:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D19E360F58
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Aug 2021 19:58:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231448AbhHPT7B (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Aug 2021 15:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbhHPT7A (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Aug 2021 15:59:00 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33A9BC061764;
        Mon, 16 Aug 2021 12:58:29 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id c17so16615218plz.2;
        Mon, 16 Aug 2021 12:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=s9l5IsedF/5S4SnJF4fAydWyt7KoVJCD7oSIXdqwVD0=;
        b=Ue/nsPauk7U6/n3kytH2QA63vMZ7hMlJ6o+jRyIO+TXAAn5Cfyd6nWdtYBbtA3J3Pt
         gGMXmjbTyBKeY9AzbTy4YzVaR9PQETDQGPWorPB6gHG3IG9zujI1tzKVBlFZwGelsnav
         of61ongXjhXr7f7H1Qk+p/jqWXgGnwRs59kpdQ1gV4Lix0lkWdjtCJF3URLF/Dr/Ps6G
         p7OJhTRksVzsrtxSpnUwzBOukJnVsGWpiPYN5iUBKKQ4ybPZDYEgoadJ1wEGvaxoTxti
         o++Om859MCxZz4jSnVxGTcYmItEURXy2BxxQxigQyKeVOVeSVOwfIbKMLVHssa/9d6wu
         4UyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s9l5IsedF/5S4SnJF4fAydWyt7KoVJCD7oSIXdqwVD0=;
        b=r8K2yrGbba9jWqlJVXJKVI2KOtFRYUeAVb4ShzwK6tUDSOPmfss1h8BqjMCseyVFbo
         enr/sNUcfZ8EGx4qNy80H2eFEBSqC3uG8NT3u8EbOPVFC4N7x0nYPlsRoeadewi0gcrM
         MMrmZoWJsyJK+f7lR+cxSeCE9yPyUGDEMoRgSxOg13dk9ruX8gJ1YOH76zRboJKYXOMm
         X+OnInqMdhgYccT3DcvQNVh9CrAIGtakvfw8WqPRJ1DzHZ0UnP15tOg3EpoXq0ndB7SR
         AXaQ9jiA3dHEzsXh+D8GD8jCVpf7RUCKcRbFnXU1e0Cr/7o/SqkOR9INfcj1kXahlSer
         KliA==
X-Gm-Message-State: AOAM533v82dOgXn0NMT/UifnnHRMVxRA5gwboJkupuiHn3Xl8wg9qlb6
        1cEoXtldH5O2swxS0cLQoLc=
X-Google-Smtp-Source: ABdhPJy5BO8UPitxBJFGj9SnL787Ml47xibIqz1zp+gWTNa1A1DD/jzJ8/nvqsnSQnuQlY7WyZGZxQ==
X-Received: by 2002:a17:90a:116:: with SMTP id b22mr239613pjb.97.1629143908577;
        Mon, 16 Aug 2021 12:58:28 -0700 (PDT)
Received: from localhost ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id l11sm119501pjg.22.2021.08.16.12.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 12:58:28 -0700 (PDT)
Date:   Tue, 17 Aug 2021 01:28:24 +0530
From:   Aakash Hemadri <aakashhemadri123@gmail.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
        Jawoslav Kysela <perex@perex.cz>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Bjorn Helgaas <bjorn@helgaas.com>
Subject: Re: [PATCH 1/2] ASoC: tegra30: ahub: Use of_device_get_match_data
Message-ID: <20210816195824.ulvnb2kfas4rtpjt@xps.yggdrasil>
References: <cover.1628971397.git.aakashhemadri123@gmail.com>
 <e568d621c9c05ee23732a6a6f9e3606a780b1707.1628971397.git.aakashhemadri123@gmail.com>
 <20210816183906.GC4253@sirena.org.uk>
 <20210816194621.mrudqykxvkbt3a2w@xps.yggdrasil>
 <20210816194934.GD4253@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816194934.GD4253@sirena.org.uk>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21/08/16 08:49PM, Mark Brown wrote:
> Since I applied the patches please send an incremental fix on top of
> what's been applied rather than a v2.

Will do Mark!

Thank,
Aakash Hemadri
