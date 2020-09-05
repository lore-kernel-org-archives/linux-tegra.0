Return-Path: <SRS0=vF+y=CO=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5880FC43461
	for <linux-tegra@archiver.kernel.org>; Sat,  5 Sep 2020 14:30:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A494206A5
	for <linux-tegra@archiver.kernel.org>; Sat,  5 Sep 2020 14:30:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DkAT/Mrv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgIEOaK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 5 Sep 2020 10:30:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727875AbgIEOaH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 5 Sep 2020 10:30:07 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FF47C061244
        for <linux-tegra@vger.kernel.org>; Sat,  5 Sep 2020 07:30:06 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a15so11254654ljk.2
        for <linux-tegra@vger.kernel.org>; Sat, 05 Sep 2020 07:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xCjl3FtgQod729R+3QUkX9rN7e6gzfBjhz6n2Z97NJI=;
        b=DkAT/MrvPS6qWE9NHQ1l883kNCkCg+LaVCr+fC3o9Ns8GrnuxlJhb48ygIJXHXql0c
         UDPTx1U7/faSnOUJsmtse2c+c3Qv/MN5J94b1KOKYyG+Iy0/6Lu7N9C7lHjmWFxFc8yk
         /9JoccKOlG/OsWiZy7JeFCMUOa93SagMkmFcBUBSk+Akpxwm4bagehXXiTIkggqZVw6N
         dTGIjf6Jc3boMJaOBiTSpYJZNUVjbDTqbyyDC4ssTf6Ly/A5xCZbqs7ZCJcyzZm44NMB
         g4ss0ybVP5ihAeBkIxU238+Wc/stxEzWzockC6ebpO3S5NIs/W6b82uoYbobDM3c83r+
         B8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xCjl3FtgQod729R+3QUkX9rN7e6gzfBjhz6n2Z97NJI=;
        b=iIIJktfWus+uGPk1d2ZbJtRDv12ioJUy3ZwP9Lpakjk+9VyzlAtOYsJ9v6HY3Y99c1
         lMle3KACkDcBmMjCi85XxLL/xB/Mjau8iiHUmW1a2yLuCAGprSyQR1HzeaJ7rlvVyAdo
         wcTTzbb+KSjkOW6rnGT2nIvMctzvV2CzOk2w7vh0+fUx5aHOtVICDodfVk4m9tiY/pXz
         Tt0SFq3uwzPwQwfXEOkmsGOJ7Eoa4060SvIoAsF07AlsSy0aD/fGgw0ycm3V5nZxImtX
         /YNvk0B7E9zVFoJVnPhrQGFXZjdGWB7tgXQbdoSKoqPdQbUSbHyi2UZcCNxt+ZNcA2Mg
         CSAg==
X-Gm-Message-State: AOAM530g9t+H585PMpHq5fmvZlGhI3f1FocXxLqPS5OvpqPAYynNc7Hq
        CNPz4EjsmIhVkEmYvKfKLkvcFo5H//M=
X-Google-Smtp-Source: ABdhPJz0PyoBnYDo6UOXMIMwbzMqcSEDGt3fj0ZX8OuCyPW1uEjLhCBwwWqDwyvwaCNAglyOv4Qp+Q==
X-Received: by 2002:a05:651c:106a:: with SMTP id y10mr6271673ljm.296.1599316204840;
        Sat, 05 Sep 2020 07:30:04 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id s3sm2200207lfd.39.2020.09.05.07.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2020 07:30:04 -0700 (PDT)
Subject: Re: [RFC PATCH v2 06/17] gpu: host1x: Cleanup and refcounting for
 syncpoints
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-7-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <913a625c-9630-92af-aba0-fdddf6bbdb29@gmail.com>
Date:   Sat, 5 Sep 2020 17:30:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905103420.3021852-7-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

05.09.2020 13:34, Mikko Perttunen пишет:
...
> +
> +/**
> + * host1x_syncpt_put() - free a requested syncpoint
> + * @sp: host1x syncpoint
> + *
> + * Release a syncpoint previously allocated using host1x_syncpt_request(). A
> + * host1x client driver should call this when the syncpoint is no longer in
> + * use.
> + */
> +void host1x_syncpt_put(struct host1x_syncpt *sp)
> +{
> +	if (!sp)
> +		return;
> +
> +	kref_put(&sp->ref, syncpt_release);
> +}
> +EXPORT_SYMBOL(host1x_syncpt_put);
>  
>  void host1x_syncpt_deinit(struct host1x *host)
>  {
> @@ -471,16 +478,48 @@ unsigned int host1x_syncpt_nb_mlocks(struct host1x *host)
>  }
>  
>  /**
> - * host1x_syncpt_get() - obtain a syncpoint by ID
> + * host1x_syncpt_get_by_id() - obtain a syncpoint by ID
> + * @host: host1x controller
> + * @id: syncpoint ID
> + */
> +struct host1x_syncpt *host1x_syncpt_get_by_id(struct host1x *host,
> +					      unsigned int id)
> +{
> +	if (id >= host->info->nb_pts)
> +		return NULL;
> +
> +	if (kref_get_unless_zero(&host->syncpt[id].ref))
> +		return &host->syncpt[id];
> +	else
> +		return NULL;
> +}
> +EXPORT_SYMBOL(host1x_syncpt_get_by_id);
> +
> +/**
> + * host1x_syncpt_get_by_id_noref() - obtain a syncpoint by ID but don't
> + * 	increase the refcount.
>   * @host: host1x controller
>   * @id: syncpoint ID
>   */
> -struct host1x_syncpt *host1x_syncpt_get(struct host1x *host, unsigned int id)
> +struct host1x_syncpt *host1x_syncpt_get_by_id_noref(struct host1x *host,
> +						    unsigned int id)
>  {
>  	if (id >= host->info->nb_pts)
>  		return NULL;
>  
> -	return host->syncpt + id;
> +	return &host->syncpt[id];
> +}
> +EXPORT_SYMBOL(host1x_syncpt_get_by_id_noref);
> +
> +/**
> + * host1x_syncpt_get() - increment syncpoint refcount
> + * @sp: syncpoint
> + */
> +struct host1x_syncpt *host1x_syncpt_get(struct host1x_syncpt *sp)
> +{
> +	kref_get(&sp->ref);
> +
> +	return sp;
>  }
>  EXPORT_SYMBOL(host1x_syncpt_get);

Hello, Mikko!

What do you think about to open-code all the host1x structs by moving
them all out into the public linux/host1x.h? Then we could inline all
these trivial single-line functions by having them defined in the public
header. This will avoid all the unnecessary overhead by allowing
compiler to optimize the code nicely.

Of course this could be a separate change and it could be done sometime
later, I just wanted to share this quick thought for the start of the
review.
