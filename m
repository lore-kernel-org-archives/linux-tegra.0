Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 020C1C07E9D
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Sep 2022 09:28:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233252AbiIZJ2p (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Sep 2022 05:28:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234585AbiIZJ2V (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Sep 2022 05:28:21 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B170B46D9A
        for <linux-tegra@vger.kernel.org>; Mon, 26 Sep 2022 02:26:39 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id bu25so7969822lfb.3
        for <linux-tegra@vger.kernel.org>; Mon, 26 Sep 2022 02:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=/a2oANDpQ1dr3+9qhM2hL8b3sTifgVcp3Q4mQ+OH8Gg=;
        b=yfI4SdDlEexAg6S0IzENzJ0SwkQLZ8A06gEgiNIrRqMkAH25wQHjRRUowRyaFB+HUc
         ufHa1wUiQUxrLgxcFTHZ2vwNowMYY1+5ShK/XJaBwnM5cX6Wc6P6NPKubB/JeOrVFiUs
         91n2789xBRQgJpwXt9+kgg6bYyi8yw9pQNKi1q53XLLGnU/Xf3rjYIozl1Cq66I9Hy/Y
         1jZAav8uZK3aal9MwimPTeTM/C3Fzfyj7Q1d8dG58zMe3tnhFSTVkixdcz8ZJUsLelWA
         aAcCQBEWKjQPlKbgcA+ncpDin8HaDh1ynGDFnnBUx27qJ12TpqPxZ774CkAD0KIEwIt1
         Cdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/a2oANDpQ1dr3+9qhM2hL8b3sTifgVcp3Q4mQ+OH8Gg=;
        b=E3xE98S5Q2zt34mgFil0EBLqqlthHGy8QqXscb6nH1qV8dWIkcQ2T27F6mo8+ghcw9
         E2aXpP50HsR8GbLk5peOP7nUxn4l0KomoI68ta+bcNsii3J1A2PwMxkLB13BPEQCEuKT
         uoKkggkZlL/tnbfnvcreM0t2aOkAryHvWHsg1H80srDVeKMX51mcpLmb5l9rA2SrSVNu
         zEjPXfVxOkbevzu33kJ5J+fKh1/K1GzAQhSgYV7t6gVbRsrCDAZIBrPdIFQmrawOolmD
         toyhOrhqDfmkxcsNSkMykL6pPGzKwmS74dVo1p6/dZZRhiuo5IYKplRg+XvwxAf5wRDu
         5LfA==
X-Gm-Message-State: ACrzQf3+a9xV+Kh1gyATRDWSdEatlN3sMUYkQlL/rGPLU32Jvp216Lpe
        ZzvA4lVO7pNVsUcXqChE5nlVYwK/6+S7Wg==
X-Google-Smtp-Source: AMsMyM7JnkBvE7lOseku7vV63MLg5uR8PhyO3nLUSHOzzI7VO1Wnhk3PD47zzWwCo9pGVqikgfmRlg==
X-Received: by 2002:a05:6512:308d:b0:499:bd1a:d1bc with SMTP id z13-20020a056512308d00b00499bd1ad1bcmr9158392lfd.274.1664184395211;
        Mon, 26 Sep 2022 02:26:35 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p10-20020ac24eca000000b00498f1eddad0sm2480737lfr.122.2022.09.26.02.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 02:26:34 -0700 (PDT)
Message-ID: <b5252d24-0c7a-5e71-ec4b-d0460181acb8@linaro.org>
Date:   Mon, 26 Sep 2022 11:26:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 3/4] memory: tegra210-emc: use DEFINE_SHOW_ATTRIBUTE to
 simplify code
Content-Language: en-US
To:     Liu Shixin <liushixin2@huawei.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20220922143344.3252585-1-liushixin2@huawei.com>
 <20220922143344.3252585-4-liushixin2@huawei.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220922143344.3252585-4-liushixin2@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 22/09/2022 16:33, Liu Shixin wrote:
> Use DEFINE_SHOW_ATTRIBUTE helper macro to simplify the code.
> No functional change.
> 
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> ---
>  drivers/memory/tegra/tegra210-emc-core.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
> 
> diff --git a/drivers/memory/tegra/tegra210-emc-core.c b/drivers/memory/tegra/tegra210-emc-core.c
> index cbe1a7723514..603b306daca1 100644
> --- a/drivers/memory/tegra/tegra210-emc-core.c
> +++ b/drivers/memory/tegra/tegra210-emc-core.c
> @@ -1621,20 +1621,8 @@ static int tegra210_emc_debug_available_rates_show(struct seq_file *s,
>  
>  	return 0;
>  }
> +DEFINE_SHOW_ATTRIBUTE(tegra210_emc_debug_available_rates);
>  
> -static int tegra210_emc_debug_available_rates_open(struct inode *inode,
> -						   struct file *file)
> -{
> -	return single_open(file, tegra210_emc_debug_available_rates_show,
> -			   inode->i_private);
> -}
> -
> -static const struct file_operations tegra210_emc_debug_available_rates_fops = {
> -	.open = tegra210_emc_debug_available_rates_open,
> -	.read = seq_read,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -};
>  

It looks you leave here two blank lines. If so, please fix it - only one
blank line.

>  static int tegra210_emc_debug_min_rate_get(void *data, u64 *rate)
>  {

Best regards,
Krzysztof

