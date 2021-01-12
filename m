Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB21C433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 22:08:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57625221F5
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 22:08:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394162AbhALWI1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 17:08:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387673AbhALWI0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 17:08:26 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0211C061575
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jan 2021 14:07:45 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id m25so5646927lfc.11
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jan 2021 14:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HbMIN0aiVbYBLJRZm7poztAbwQ7fEt7uXkvRYAH+Q4E=;
        b=pYsD9mwkI1AiuSqOs76AfqLZ0ur+C6ghnk0JO30q206dd7bSXjprXUDi0AmGreQ738
         N3JZ2WfpqVQNY+nB2/RPysZxaja0WWFMN/V9ZBod5K/YF1ywI8mNbT3CCUHFFJtl16uI
         vSXyP60NpWF0/AmTnewU6ZWPj7QGPhceq4wxLVP3CodK6EL1GIvysBIQGV/mmG/N3hz0
         PmbS/pcPCHIEv1E2ocIV8Pcqjt0z72mkrkpFFbK5JRX2wTWqYB6738AAY+CumBktfqFI
         nOF9/yR7J6alKp8eHDN8zZBVQ9VZf64Aux9iDzn8EkNeKVwJgfrLwaX86yQb2ZvxwKNy
         2fag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HbMIN0aiVbYBLJRZm7poztAbwQ7fEt7uXkvRYAH+Q4E=;
        b=XKjyMqE+Dfr79CcdmpUR8U6QNbMh2ca6Zy7F9RmsNRjPLLJbobJWwG5PJvFTRbXYFN
         Tu9Uuo4dd9mdZyOME5V2/386aQ9Wkm5x17i7TDmj4ifaa/KNS4tuWv0SIi2dBc9OGH3X
         ZDJHGrGoEZ7GwFQV/iytuVS+6snIB/MSvw07OcJ9eMPnGO/5dGtUpsZKpo7JgsOkW67x
         KigCFE0FK/esCZXgyzPyuM1urQj5ilK5565zEdq8vKGqmKDFv1sF5Ewyc3AiR8YWsal3
         GcbAp/CZsozXEUa7tFRaR+zX6Y3CKFT5OqnAOd/3xrnuROb4ZpiZdnaRVlCM5YVlJTLl
         8Riw==
X-Gm-Message-State: AOAM532SKBL8Dmwn/XMRpetmFdTku63OEfEIBlCr0ysyTfIJYk/EtLV5
        2DLxc33H1V3DaZF27uOlw2U=
X-Google-Smtp-Source: ABdhPJwCVUf3gXP6dL642xFpV//ZourQlvFx41nTt8T3BZPRIRHf81Lf1Au81rvwtWvHgU0kjycpiQ==
X-Received: by 2002:ac2:446c:: with SMTP id y12mr386576lfl.373.1610489264305;
        Tue, 12 Jan 2021 14:07:44 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id w13sm498190ljw.28.2021.01.12.14.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 14:07:43 -0800 (PST)
Subject: Re: [PATCH v5 04/21] gpu: host1x: Remove cancelled waiters
 immediately
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-5-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1c2c4a31-68a2-c938-fe65-6059d9889126@gmail.com>
Date:   Wed, 13 Jan 2021 01:07:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210111130019.3515669-5-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

11.01.2021 16:00, Mikko Perttunen пишет:
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
> +
> +	if (flush) {
> +		/* Wait until any concurrently executing handler has finished. */
> +		while (atomic_read(&waiter->state) != WLS_HANDLED)
> +			cpu_relax();
> +	}

A busy-loop shouldn't be used in kernel unless there is a very good
reason. The wait_event() should be used instead.

But please don't hurry to update this patch, we may need or want to
retire the host1x-waiter and then these all waiter-related patches won't
be needed.
