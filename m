Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A0BC2BA13
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F11E36023B
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378400AbhCCDbf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350746AbhCBMrB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 07:47:01 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F6BDC061794
        for <linux-tegra@vger.kernel.org>; Tue,  2 Mar 2021 04:36:09 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id w7so2068693wmb.5
        for <linux-tegra@vger.kernel.org>; Tue, 02 Mar 2021 04:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=21H6X5rvFt0C32Ctuv5aBj/q0Nf5F/lL8iKvx7fYKHk=;
        b=apLWEffqFWJnX7KTXo6D4CJSsEWb4++cob/WFqj+ZSeECfK3egaM5UKhOQuDfwySQV
         feVV2+nEd9tXMLbQQXnJ937Un4uAy9pNfpIHg/m8WUVAiFzTxpVjjj7pBjd0MpZWRPax
         QSqLoiHTSJyh3QR50ttVv6c6g//ROFYOoEHsJwH8lcfE7MN/ShB3kWbOXJK56FvuKGQz
         XOXsELPeg+qLYSnwMHyLARMhPDP4d+jsn6Xj138vOCnacwtgaV2bAX2lWBGCCr4Wydgr
         sNomdwMMbVxn9hLxD4YBvEIGX0X5OqPXuNI+4z4dRGX8f6/oXuwA441zfhGJZmzvTr59
         B5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=21H6X5rvFt0C32Ctuv5aBj/q0Nf5F/lL8iKvx7fYKHk=;
        b=UUKmSBDJEUK1I3OzBlkZzeIiVbrMvp3h1QL1edgZdYmaatePHsQK359uZzTlKezGpE
         pvb4M+PqeGVTPybYh8n2JQQb+7aFwC5PopB4L7KNClnEzLFTF7b4GpMstf/jHmZRJ3Kv
         /4mqK3IJ+1vL7Pu/eJhI9fj1mLGdRSwu6aCRJPGt4qcNoo94y3akht7wQxHhTe4LZxRX
         C/IKJZ56uPT0Jj1L/sX5RUI6rRDqGMqdq6qklrrw4dncQgVbN9U+TDZgM3YncYBnwXvj
         fzq/KhDqbhIfamDZdHIX+ZjDgKdepaDE9PxnHoUQPc9a+vdOd72jkyPODUuU3QINVhaj
         2GQg==
X-Gm-Message-State: AOAM533hvHMg96WdWwzmNx5Y9KkNtd85N9vYo0EmDwARNcPovEdhfaAK
        TlKMPrTrnl/dVMZ6/SZPXrVFyzalWhRxmQ==
X-Google-Smtp-Source: ABdhPJztIqxQQoKHKbCEJHOj5ZGVqCfgPg/mXSu5EYZczdOo18Qvlhplp3k1rR5y3c6D5xGl30CqBw==
X-Received: by 2002:a7b:cc90:: with SMTP id p16mr3990395wma.45.1614688567906;
        Tue, 02 Mar 2021 04:36:07 -0800 (PST)
Received: from [192.168.0.41] (lns-bzn-59-82-252-144-192.adsl.proxad.net. [82.252.144.192])
        by smtp.googlemail.com with ESMTPSA id o2sm2417699wme.16.2021.03.02.04.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Mar 2021 04:36:07 -0800 (PST)
Subject: Re: [PATCH RESEND v2 1/2] cpuidle: tegra: Fix C7 idling state on
 Tegra114
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Anton Bambura <jenneron@protonmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210302095405.28453-1-digetx@gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <36f5d767-d021-d1cb-dfc1-7b9dd63d7d9f@linaro.org>
Date:   Tue, 2 Mar 2021 13:36:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210302095405.28453-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 02/03/2021 10:54, Dmitry Osipenko wrote:
> Trusted Foundation firmware doesn't implement the do_idle call and in
> this case suspending should fall back to the common suspend path. In order
> to fix this issue we will unconditionally set the NOFLUSH_L2 mode via
> firmware call, which is a NO-OP on Tegra30/124, and then proceed to the
> C7 idling, like it was done by the older Tegra114 cpuidle driver.
> 
> Fixes: 14e086baca50 ("cpuidle: tegra: Squash Tegra114 driver into the common driver")
> Cc: stable@vger.kernel.org # 5.7+
> Reported-by: Anton Bambura <jenneron@protonmail.com> # TF701 T114
> Tested-by: Anton Bambura <jenneron@protonmail.com> # TF701 T114
> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>

> ---
> 
> Changelog:
> 
> v2: - No changes. V1 got no attention, hence re-sending.
> 
>  drivers/cpuidle/cpuidle-tegra.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/cpuidle/cpuidle-tegra.c b/drivers/cpuidle/cpuidle-tegra.c
> index 191966dc8d02..29c5e83500d3 100644
> --- a/drivers/cpuidle/cpuidle-tegra.c
> +++ b/drivers/cpuidle/cpuidle-tegra.c
> @@ -135,13 +135,13 @@ static int tegra_cpuidle_c7_enter(void)
>  {
>  	int err;
>  
> -	if (tegra_cpuidle_using_firmware()) {
> -		err = call_firmware_op(prepare_idle, TF_PM_MODE_LP2_NOFLUSH_L2);
> -		if (err)
> -			return err;
> +	err = call_firmware_op(prepare_idle, TF_PM_MODE_LP2_NOFLUSH_L2);
> +	if (err && err != -ENOSYS)
> +		return err;
>  
> -		return call_firmware_op(do_idle, 0);
> -	}
> +	err = call_firmware_op(do_idle, 0);
> +	if (err != -ENOSYS)
> +		return err;
>  
>  	return cpu_suspend(0, tegra30_pm_secondary_cpu_suspend);
>  }
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
