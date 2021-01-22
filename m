Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41858C433E6
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:16:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18BE623B00
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:16:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731004AbhAVUQe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 15:16:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729708AbhAVUPE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 15:15:04 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 403D6C0613D6;
        Fri, 22 Jan 2021 12:14:20 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id h7so9267065lfc.6;
        Fri, 22 Jan 2021 12:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uPvrecLhutANoFhrJF5kdvYp/ZtstK48/BH0rVdtLfE=;
        b=EBLn/UWUHjVmLQEp16UWv5aK29f2TR3+rJHv3fbS9Q7HL6YEYXaMspoqBALND5fULf
         +x7uxOg4fw47j9ZWZjXRbTSymQW6Mj6gMe+44yza2a+pVSnZXb/QuLbpsmQgskHBSO1K
         CT7f1+cdMwxsEJkBPiSt7yM4H6hJhYG+8FKNzp1klQg/saCOy8/EnIQFYfw7s3fC0+Xf
         IEdTF7nIlsxJAxoFBboIanl2Vilgj7h0wfU/aaGeMmbilMjlxZKci4Gx3/EAStGow2QH
         I7SmCFPTtcFmsa8jd5v1JQ1/a2JR9bOPyG+6IOGMBTzNvtrnmQCe17etmXARDCtLNXZt
         QYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uPvrecLhutANoFhrJF5kdvYp/ZtstK48/BH0rVdtLfE=;
        b=cUW1U5XvF/dmFms9c0AInW2xaXpjZ/6AANzGxdBnH8j1Fcmi3PTigwJtYtm2Ab24kQ
         x8crwFkt8bxL91KWlI/abvNxX7jlcjA4CeIk8pJSW3aysQ6VoDuXmo68Gkwzevv5y8iS
         HJTpzJIqTQt7pJlEBGgWS18tNgI0EbAEV60C0PNNEC2Amb0jybQOdPl3fZDmqwKkADRC
         qM/a04QxdcZWkjIn8dEfMRJpbxKxRqt7mBR0+c9W5wqUHYgoLt5+pUDz2J9AJq3GO86k
         tI3pkSiDkotyJA4EgRJMKxz6QL9sx8BVkwNPum3rvnAOS1KvaRlMCVZo1XmzYEY5qd/1
         0gPA==
X-Gm-Message-State: AOAM532mS7Ks0qnMHBlUv2opMWH38qHCMrWlUGNjAO7+X+gKBgYrmaXa
        YDy3LwGeigwlnGVWrhxZ/FneIpzmbMI=
X-Google-Smtp-Source: ABdhPJwZY2QT7KGOIxlx/NoP7q6pG0N3KDri2NcoCa4R7BXgWRKgh0uyXR2CDylK0Tk0owv7pf9eFA==
X-Received: by 2002:ac2:4c28:: with SMTP id u8mr28772lfq.56.1611346458664;
        Fri, 22 Jan 2021 12:14:18 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id p22sm992078lfe.187.2021.01.22.12.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jan 2021 12:14:18 -0800 (PST)
Subject: Re: [PATCH v1 09/13] ARM: tegra: acer-a500: Rename avdd to vdda of
 touchscreen node
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210121182308.16080-1-digetx@gmail.com>
 <20210121182308.16080-10-digetx@gmail.com>
Message-ID: <a85c8647-69f4-aa50-a66b-ab87ed8091d8@gmail.com>
Date:   Fri, 22 Jan 2021 23:14:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210121182308.16080-10-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

21.01.2021 21:23, Dmitry Osipenko пишет:
> Rename avdd supply to vdda of the touchscreen node. The old supply name
> was incorrect.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
> index 8a98e4a9d994..d852527db707 100644
> --- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
> +++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
> @@ -449,7 +449,7 @@ touchscreen@4c {
>  
>  			reset-gpios = <&gpio TEGRA_GPIO(Q, 7) GPIO_ACTIVE_LOW>;
>  
> -			avdd-supply = <&vdd_3v3_sys>;
> +			vdda-supply = <&vdd_3v3_sys>;
>  			vdd-supply  = <&vdd_3v3_sys>;
>  
>  			atmel,wakeup-method = <ATMEL_MXT_WAKEUP_I2C_SCL>;
> 

This patch should have a merge conflict as I see now, since
atmel,wakeup-method isn't upstreamed yet. I'll rebase patches in a more
correct order and will make a v2.
