Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E088DC433E0
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 20:28:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4F4B6187E
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 20:28:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhC2U2G (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Mar 2021 16:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbhC2U1m (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Mar 2021 16:27:42 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 511EEC061574
        for <linux-tegra@vger.kernel.org>; Mon, 29 Mar 2021 13:27:42 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 12so9992618lfq.13
        for <linux-tegra@vger.kernel.org>; Mon, 29 Mar 2021 13:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zBZP4X/Nh1fRrbRgQOPXvMs7zjDHJfPUlKL9Gu1Yu70=;
        b=V463bQkajIeMwgx+X0vqAKPGxk5FI5FU9aXSjWrSowaRMZLdFwFQa3URG2QCFruS1u
         Wt/gaNgzD7hY2Txe0DmRm0fDRA4EWyOm7C3QVhPpYZyCIcrNDgIVEj1KFnNSDWeXfNrQ
         Zu/KUOkFg9cR99VyGvsmnR8w98Q+bw0sTZmYxrO1FXeaU9sjQgkF869PKhGrf0DtUxNM
         MYgi59pp/5R+qm4cIqMCnbNj7LSsaopxkInLYEbf0VXLIDxObDuKnR8nPRqsYvktAQxw
         s6BMYYg2tMWkjXhir3Ri+gW0bAX2IrpBY0J9p5Gw/ioxOffre8R1WcQKCkg1Tp2Nd/fS
         rs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zBZP4X/Nh1fRrbRgQOPXvMs7zjDHJfPUlKL9Gu1Yu70=;
        b=Qj6O0WTo3F3hzk0HMoLiYouPKqQ1AlpNitTrgzMgl0GOEiGCjDmV2ZKuQxMI51/fk3
         XD7PWzksusSUKnTgi29F4wTb+ln5PsxWDXbqcdhyZS9Eq5t9Hnlf79hYk5sC6imeqOmK
         TIs8IvqwYsLt84vfJq5j0IRCyudUknqDCrxBQjZqtMqz7jUPdcbGWNNUC47OLgv4h+hS
         Y//RTuVWWNyTRzGwwV1/gdloRAltStxWTqKRuRmGrJ8+JoGFM8uw027MSS0Kb571UWpR
         Idkcf32turrcDC5rxnc7kdIyJJOzGDN09rsmVXkJ+yHpZZSQjqyOk4f9JLMxXZ7A3W7q
         SOlw==
X-Gm-Message-State: AOAM532t2vhlufj9ozeEUiCiUEUH/J5wmsup9c7+Zpl0v4YLkIwzb4/i
        u/uG1JcUrU6k7TMio4om4hg=
X-Google-Smtp-Source: ABdhPJxugk52D7Ku1S1eEsrzkBBLCOQPvEbR3a09YIfBvPQpM+mzIAf//a++4IOx/Yjr+bPO3Zy9DA==
X-Received: by 2002:a05:6512:3e02:: with SMTP id i2mr17579971lfv.121.1617049660882;
        Mon, 29 Mar 2021 13:27:40 -0700 (PDT)
Received: from ?IPv6:2a00:1370:814d:b259:a10:76ff:fe69:21b6? ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id i3sm2555339ljj.82.2021.03.29.13.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Mar 2021 13:27:40 -0700 (PDT)
Subject: Re: [PATCH v6 04/10] gpu: host1x: Remove cancelled waiters
 immediately
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20210329133836.2115236-1-mperttunen@nvidia.com>
 <20210329133836.2115236-5-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <85ddc9a2-1355-1e3b-f164-f907c7fdb67c@gmail.com>
Date:   Mon, 29 Mar 2021 23:27:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210329133836.2115236-5-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

29.03.2021 16:38, Mikko Perttunen пишет:
> Before this patch, cancelled waiters would only be cleaned up
> once their threshold value was reached. Make host1x_intr_put_ref
> process the cancellation immediately to fix this.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v6:
> * Call schedule instead of cpu_relax while waiting for pending
>   interrupt processing
> v5:
> * Add parameter to flush, i.e. wait for all pending waiters to
>   complete before returning. The reason this is not always true
>   is that the pending waiter might be the place that is calling
>   the put_ref.
> ---
>  drivers/gpu/host1x/intr.c   | 23 +++++++++++++++++------
>  drivers/gpu/host1x/intr.h   |  4 +++-
>  drivers/gpu/host1x/syncpt.c |  2 +-
>  3 files changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/intr.c b/drivers/gpu/host1x/intr.c
> index 9245add23b5d..69b0e8e41466 100644
> --- a/drivers/gpu/host1x/intr.c
> +++ b/drivers/gpu/host1x/intr.c
> @@ -242,18 +242,29 @@ int host1x_intr_add_action(struct host1x *host, struct host1x_syncpt *syncpt,
>  	return 0;
>  }
>  
> -void host1x_intr_put_ref(struct host1x *host, unsigned int id, void *ref)
> +void host1x_intr_put_ref(struct host1x *host, unsigned int id, void *ref,
> +			 bool flush)
>  {
>  	struct host1x_waitlist *waiter = ref;
>  	struct host1x_syncpt *syncpt;
>  
> -	while (atomic_cmpxchg(&waiter->state, WLS_PENDING, WLS_CANCELLED) ==
> -	       WLS_REMOVED)
> -		schedule();
> +	atomic_cmpxchg(&waiter->state, WLS_PENDING, WLS_CANCELLED);
>  
>  	syncpt = host->syncpt + id;
> -	(void)process_wait_list(host, syncpt,
> -				host1x_syncpt_load(host->syncpt + id));
> +
> +	spin_lock(&syncpt->intr.lock);
> +	if (atomic_cmpxchg(&waiter->state, WLS_CANCELLED, WLS_HANDLED) ==
> +	    WLS_CANCELLED) {
> +		list_del(&waiter->list);
> +		kref_put(&waiter->refcount, waiter_release);
> +	}
> +	spin_unlock(&syncpt->intr.lock);

Looks like we need to use IRQ-safe version of the locking here in order
not to race with the interrupt handler(?), preventing lockup.

But what real bug is fixed by this patch? If no real problem is fixed,
then maybe will be better to defer touching this code till we will just
replace it all with a proper dma-fence handlers?
