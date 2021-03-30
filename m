Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9FFC433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 21:13:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BFF4619CD
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 21:13:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232636AbhC3VMi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 17:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232558AbhC3VMO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 17:12:14 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 000BAC061574
        for <linux-tegra@vger.kernel.org>; Tue, 30 Mar 2021 14:12:13 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id n138so25906001lfa.3
        for <linux-tegra@vger.kernel.org>; Tue, 30 Mar 2021 14:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Dm71ZieA9ZB7ge1ol10am2Znew0nDw7ySgXhHMyKoWw=;
        b=P7FwY80scTh+AZuDelUQ2acmWIswjipAe8pTO/H2dqmCQspsjq74SbRQV0V6zPD5ke
         V3kgpBRJt3/+Kc1v2tRTZDMUtDTD2GmpM/QjFXnnvkvjiyYzaPVrGSPmZoORTtrDOCH9
         +f6HBQTQ/LBJ8YXVN9fluLfTdJLioIg0Fw2h6yEM1vLOE4aWDsnfdltqxyyhix5SEAdZ
         OmW0zLVAS4i+rgaM4SaD6GlIpNFtD2GaOwa5Vxs0Ha01P90ooyKRNZLHCJjvZvH0SwHr
         wFHbp0n9oCi3ffJckC0DwwJNZshrl5z0Ka94WQ/f6OS9TMuiQV/9m/jWuw8bANyR6dPC
         BJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Dm71ZieA9ZB7ge1ol10am2Znew0nDw7ySgXhHMyKoWw=;
        b=pts7YXpbug2EPL3XJ0+2dhQVCLFAsm1sK+tDFA0kFbCMLtfrZCwnDllIz9vzy0Q+iM
         AtHpq1kdWLJkhJN/Dpk3XsdqoxaXeyfwqUYixP9PHBuUeTT39TCuZya6426aLd+HxAo7
         Sj5fVsoRGSGKwEraRzwnehLYJltmldkHA+0cWID16DSfQbGmGTQW4Y0w1O+c0obLKKHd
         h9IUaS7Fe4DqDSPeMTzJOg23MuFQj6xRAov4RvhzFuBr+mLxxKo+btWGI+Xmd69kuO7c
         uGExClAqa8ZIRARRGEC935DkvqWrkbppvd05+jF9YsV0WU4k1KGCLiV0s0u0T5Wtu4Fp
         Af0A==
X-Gm-Message-State: AOAM533ZtzyyFC9RXf/JVD5xJ1HnCCyTDIFsrW3mSemvH7VnUxExRUbe
        oz6avIC//DH90pb8S5iuwrE=
X-Google-Smtp-Source: ABdhPJwsyeB5bJNOdZS1Hb5dmfPxDSLYKAprsDi3pNdEkKJdc7WQaCda6Sr1xo57jfEbsZkk8JQiFw==
X-Received: by 2002:a05:6512:38d0:: with SMTP id p16mr57132lft.208.1617138732563;
        Tue, 30 Mar 2021 14:12:12 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-98.dynamic.spd-mgts.ru. [109.252.193.98])
        by smtp.googlemail.com with ESMTPSA id j8sm2924589lji.8.2021.03.30.14.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 14:12:12 -0700 (PDT)
Subject: Re: [PATCH v6 05/10] gpu: host1x: Use HW-equivalent syncpoint
 expiration check
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20210329133836.2115236-1-mperttunen@nvidia.com>
 <20210329133836.2115236-6-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <61e24311-7b61-64af-e7ee-61e5aa776bab@gmail.com>
Date:   Wed, 31 Mar 2021 00:12:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210329133836.2115236-6-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

29.03.2021 16:38, Mikko Perttunen пишет:
> Make syncpoint expiration checks always use the same logic used by
> the hardware. This ensures that there are no race conditions that
> could occur because of the hardware triggering a syncpoint interrupt
> and then the driver disagreeing.
> 
> One situation where this could occur is if a job incremented a
> syncpoint too many times -- then the hardware would trigger an
> interrupt, but the driver would assume that a syncpoint value
> greater than the syncpoint's max value is in the future, and not
> clean up the job.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/host1x/syncpt.c | 51 ++-----------------------------------
>  1 file changed, 2 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
> index f061dfd5bbc7..8da4bbce8b9d 100644
> --- a/drivers/gpu/host1x/syncpt.c
> +++ b/drivers/gpu/host1x/syncpt.c
> @@ -321,59 +321,12 @@ EXPORT_SYMBOL(host1x_syncpt_wait);
>  bool host1x_syncpt_is_expired(struct host1x_syncpt *sp, u32 thresh)
>  {
>  	u32 current_val;
> -	u32 future_val;
>  
>  	smp_rmb();
>  
>  	current_val = (u32)atomic_read(&sp->min_val);
> -	future_val = (u32)atomic_read(&sp->max_val);
> -
> -	/* Note the use of unsigned arithmetic here (mod 1<<32).
> -	 *
> -	 * c = current_val = min_val	= the current value of the syncpoint.
> -	 * t = thresh			= the value we are checking
> -	 * f = future_val  = max_val	= the value c will reach when all
> -	 *				  outstanding increments have completed.
> -	 *
> -	 * Note that c always chases f until it reaches f.
> -	 *
> -	 * Dtf = (f - t)
> -	 * Dtc = (c - t)
> -	 *
> -	 *  Consider all cases:
> -	 *
> -	 *	A) .....c..t..f.....	Dtf < Dtc	need to wait
> -	 *	B) .....c.....f..t..	Dtf > Dtc	expired
> -	 *	C) ..t..c.....f.....	Dtf > Dtc	expired	   (Dct very large)
> -	 *
> -	 *  Any case where f==c: always expired (for any t).	Dtf == Dcf
> -	 *  Any case where t==c: always expired (for any f).	Dtf >= Dtc (because Dtc==0)
> -	 *  Any case where t==f!=c: always wait.		Dtf <  Dtc (because Dtf==0,
> -	 *							Dtc!=0)
> -	 *
> -	 *  Other cases:
> -	 *
> -	 *	A) .....t..f..c.....	Dtf < Dtc	need to wait
> -	 *	A) .....f..c..t.....	Dtf < Dtc	need to wait
> -	 *	A) .....f..t..c.....	Dtf > Dtc	expired
> -	 *
> -	 *   So:
> -	 *	   Dtf >= Dtc implies EXPIRED	(return true)
> -	 *	   Dtf <  Dtc implies WAIT	(return false)
> -	 *
> -	 * Note: If t is expired then we *cannot* wait on it. We would wait
> -	 * forever (hang the system).
> -	 *
> -	 * Note: do NOT get clever and remove the -thresh from both sides. It
> -	 * is NOT the same.
> -	 *
> -	 * If future valueis zero, we have a client managed sync point. In that
> -	 * case we do a direct comparison.
> -	 */
> -	if (!host1x_syncpt_client_managed(sp))
> -		return future_val - thresh >= current_val - thresh;
> -	else
> -		return (s32)(current_val - thresh) >= 0;
> +
> +	return ((current_val - thresh) & 0x80000000U) == 0U;
>  }
>  
>  int host1x_syncpt_init(struct host1x *host)
> 

Tested-by: Dmitry Osipenko <digetx@gmail.com>
