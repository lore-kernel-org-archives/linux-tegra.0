Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1374BC433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 26 Oct 2021 07:23:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD28961040
	for <linux-tegra@archiver.kernel.org>; Tue, 26 Oct 2021 07:23:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233789AbhJZHZn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 26 Oct 2021 03:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232528AbhJZHZm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 26 Oct 2021 03:25:42 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C003C061745;
        Tue, 26 Oct 2021 00:23:19 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id e2so1670176ljg.13;
        Tue, 26 Oct 2021 00:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AW+Zz4LSPPD4HAdRjlqcvubjivOVrJcjX5uwm6fq5Iw=;
        b=ltIEJDarwJVKfK15/fJ93KV9dIaCfqL1hDksHWWzyKB/yhM0BGFYD6rzxgLXL2Pnu1
         +KByUGWdjhDqk9jCrIf8VHZ5zpYMgcGLH6NVnVnoApmbNpLzkbs4NzjIxSPJ3Lqyty5i
         faGC1OSgZwpZNr/EqCFPZvfnbABkuVJGd6iHF28zdXmYuIqa8BFPs8D4byLbpJvKK0Sz
         o6fFoaC7bPysfQB4UkkFSTgf9bwAhNOA4h+rqHoKZxhUtaofgmphGtNlMRRfimQDisX2
         Vd2eIJV20AhGitNmubkV6DHKetFkb+ohfLm1i6TbQc5/PaaiHKJNczlEd4hXL/8tLA4R
         a6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AW+Zz4LSPPD4HAdRjlqcvubjivOVrJcjX5uwm6fq5Iw=;
        b=jvPQbuaDOpJMbM5OZWDnuluJG+sKiwg5J1lU3F54ZcgnKEdLx8Z5c6A87xyQlz+bRD
         Z1i6XWzdbHzn+PSbjsLD7BjfUqWjJpS1nY9Xmhv2HwB1R/XYnfgIY2jctU0I+KKKb1OE
         4mTUYBBhdlrJRGpnmVPORdy0c3Qw7XCgOs6KXJEw2OjJLzXAzdZiXqwi9ZqL1L4v49Xk
         aNRN3q2zU026+M+mPxo030YeGiiiFxo+WIpylHkyLKgcVCMqcDum5oYJmu4aaXZ3vwYT
         U7wFhDAVBP+LNfOE95/zM69Ys7dxKn9Vy4ht7bK7yLWorQX45PaMh1yrEAEA+8UzZJzL
         wGkA==
X-Gm-Message-State: AOAM531h17Ihx1bTXoLFXwKKZyKO1OgmMFJFlaT5oIF3fe5wGLseP+p4
        +bFl3hLkHoaRYA04GHLe4bbWEogKZdk=
X-Google-Smtp-Source: ABdhPJy6bO8wL79f/SflIqNmc/13+GWFAWCLs0jBMm1HZu9WsrVrGYOuDugsntGJIXuTNoiIqXtR8A==
X-Received: by 2002:a05:651c:989:: with SMTP id b9mr2598690ljq.335.1635232997385;
        Tue, 26 Oct 2021 00:23:17 -0700 (PDT)
Received: from [192.168.2.145] (46-138-41-28.dynamic.spd-mgts.ru. [46.138.41.28])
        by smtp.googlemail.com with ESMTPSA id q15sm1934453ljm.43.2021.10.26.00.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 00:23:17 -0700 (PDT)
Subject: Re: [PATCH v1] usb: xhci: tegra: Check padctrl interrupt presence in
 device tree
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Nicolas Chauvet <kwizart@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20211021115501.14932-1-digetx@gmail.com>
 <YXFyu+Q5ifG8Au9w@orome.fritz.box>
 <5f122caa-c810-534d-b2a1-53edef313ff0@gmail.com>
Message-ID: <2c22dc0c-6709-907d-8296-712d77282f0e@gmail.com>
Date:   Tue, 26 Oct 2021 10:23:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <5f122caa-c810-534d-b2a1-53edef313ff0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

21.10.2021 17:57, Dmitry Osipenko пишет:
> It might be wrong to disable device_may_wakeup() because it will change
> the system suspend-resume behaviour, i.e. you won't be able to resume by
> USB event, see [1].
> 
> [1]
> https://elixir.bootlin.com/linux/v5.15-rc6/source/drivers/usb/host/xhci-tegra.c#L1962
> 
> Although, I'm not sure whether this is a correct behaviour to start
> with. Previously, before the offending commit, device_wakeup was never
> enabled for tegra-xusb. Commit message doesn't explain why wakeup is now
> enabled unconditionally, wakeup checks aren't needed at all then. This
> makes no sense, please check it with JC Kuo.

I looked at it again and now see that disabling wakeup actually should
restore the old code behaviour properly because previously wakeup wasn't
ever enabled. Alright, I'll prepare v2.
