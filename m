Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6322C4332F
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 09:10:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FE9F61183
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 09:10:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbhJUJMP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Oct 2021 05:12:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231153AbhJUJMP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Oct 2021 05:12:15 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F0D9C06161C;
        Thu, 21 Oct 2021 02:09:59 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id o11so422229ljg.10;
        Thu, 21 Oct 2021 02:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=B2/DWXCeFbHX/OGE3yyFkSIIERoFalVJHY7XHc7ZSkM=;
        b=N+nQfJeeZylX1aKOGQqy+fn8zDXOpedwLRHwLl8mN6COKHer7edfyLyInnS2TQ7bhA
         KAvKSQlVwx0s9BwBRKCp5hMsIX351DIBeAvXac6l3dzl3HKY0BTeLGBGVAqxn1iptpXQ
         OsE1f+PKrmNtew+x5M8x8uUus6Q+QmujQTraY5Sn39D3wqErDYS4SHI7Ir/Q613xfyUN
         zGrlxAc1PLjB+IphvRt2tJsNTYjvpvaJFJxcijhgyQQGj1t4+saM0ljOwWvJTCHPev9p
         F7j559hrPE/z14VNT5HARPza40W/7u4TMFX+FEaMqEkSq9XpzmRwdhbuiH0yhUILuFEE
         rkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B2/DWXCeFbHX/OGE3yyFkSIIERoFalVJHY7XHc7ZSkM=;
        b=AZDHdTD7ZDIuog3kxw7Z4YsXlBQvAtU9wl2FNhFuFtXkYKR3meMwylECotNrcmrftO
         gFE8fLIpIAgxSPOh9LLSIXLPV9xHb1Dk2aJoYIfg+Rw8oG0Vcaj0OJxV7FxJjnlJGW5Q
         aJ4InhjmS4kSYarGxLYtVKTTZpTKxGbrp/Xg6yAVnGgxN1+OUxmeiXd5nZJiiZbZJRJk
         meIVI1UzhhXwckZXNNzVirYzeM91p9nx8DQaNrrgkqENj6kzU+TCDVVzbqh2pmsw7aZS
         lLZgPjOLwUgMlSqikPT+JLvLexdbwBxodc6iJQA+3lqGO3XvP1spxshw96bGgxM7sPad
         zlbA==
X-Gm-Message-State: AOAM5325W8Px4Vd3VuOlgvWqqDn4752I+SSwi2zHPMvyPAc4WQmZfjGH
        HV8zdzpd8ZfhE0TEhrIl4yuibyt7WmY=
X-Google-Smtp-Source: ABdhPJw2MM9A4EcWFlzTMKCL/297o/tlDH8gXWYhn54HzIhZKFnLpIElx+fol1uRYlkg6b4x9A44ig==
X-Received: by 2002:a2e:750e:: with SMTP id q14mr4676979ljc.338.1634807397388;
        Thu, 21 Oct 2021 02:09:57 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-10.dynamic.spd-mgts.ru. [94.29.39.10])
        by smtp.googlemail.com with ESMTPSA id p18sm475713ljc.114.2021.10.21.02.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 02:09:56 -0700 (PDT)
Subject: Re: [PATCH 22/22] usb: host: xhci-tegra: deny IRQ0
To:     Sergey Shtylyov <s.shtylyov@omp.ru>, linux-usb@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
References: <20211018183930.8448-1-s.shtylyov@omp.ru>
 <20211018183930.8448-23-s.shtylyov@omp.ru>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <415d1410-5b5f-3de4-1973-998528481c0f@gmail.com>
Date:   Thu, 21 Oct 2021 12:09:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211018183930.8448-23-s.shtylyov@omp.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

18.10.2021 21:39, Sergey Shtylyov пишет:
> If platform_get_irq() returns IRQ0 (considered invalid according to Linus)
> the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no IRQ
> at all. Deny IRQ0 right away, returning -EINVAL from the probe() method...
> 
> Fixes: e84fce0f8837 ("usb: xhci: Add NVIDIA Tegra XUSB controller driver")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> ---
>  drivers/usb/host/xhci-tegra.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index 1bf494b649bd..7151b1d4f876 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -1439,6 +1439,8 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>  	tegra->xhci_irq = platform_get_irq(pdev, 0);
>  	if (tegra->xhci_irq < 0)
>  		return tegra->xhci_irq;
> +	if (!tegra->xhci_irq)
> +		return -ENIVAL;
>  
>  	tegra->mbox_irq = platform_get_irq(pdev, 1);
>  	if (tegra->mbox_irq < 0)
> 

platform_get_irq() never returns zero in accordance to [1], but I see
that it can return it [2]. Should be better to fix [2] and return -EINVAL.

[1]
https://elixir.bootlin.com/linux/v5.15-rc6/source/drivers/base/platform.c#L254

[2]
https://elixir.bootlin.com/linux/v5.15-rc6/source/drivers/base/platform.c#L226
