Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8955C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 17:42:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE611619A5
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 17:42:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbhCSRl5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Mar 2021 13:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbhCSRlo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Mar 2021 13:41:44 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDF43C06174A;
        Fri, 19 Mar 2021 10:41:43 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 75so11231586lfa.2;
        Fri, 19 Mar 2021 10:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UJBwv3+scWtdnjoEEcvwzg70Xr2SAona42n3GhDaRo8=;
        b=EGxUeaqh7gZ6zW6IxD0oLKsRXYcvjWT/cWSuO1zUBl/uag8YlM6DggPJMLLvVkNIei
         S2EEVQ5ik667esLxtTLddpIkIioh9MLinW0z38Ki2f541TkMMBJwnhkmITSp5n3Inr7P
         orIP5rLVLcCnDStiRyLf6LzKYbBpbuxaSMV5RWpbKTQzwXLLJFxXoL3WYoSuisEIUelz
         7DwTG6v1bYVbYAgDjnjYK+icR7v0u5hWTeIrQKQvz2O1YgoFZPfA4SpEBT61dSOkx/au
         pMywlyy1DFBD3weNpN2m4kGG0CkWRvKEqH/GUJnWy4ZHkHfXazRLhQIavFCjfwrqno0l
         3QHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UJBwv3+scWtdnjoEEcvwzg70Xr2SAona42n3GhDaRo8=;
        b=fIJHHnqxvygYfy0dVZDVSP6XUZ5ddNCkT7BWYJ2aj9adi/X1FvnPpoElYafzF1gsdF
         HmjLwB/1HIkj3+0vsPTWU9blYQphwP/jORW90NnA7+i5Q+UmGuFlA61FNp3Ks8kk71de
         i2bozKscARXUoABF2TALP2SYFSPr4K/EAJTIkrBGf6yUtXu9t0KvLHiiZMSCWJhAgCf2
         h+txBKI8GInYNHttqiRRwcaQrI/586z72lThgSLd7z93cbfCS8XdogK2+N/iGatpVn+p
         7sSkSiE6z9zsJom39UrKMSINyaK31w24Vp7ELZUYVqUftc4zPeBbgZskv0GJSdLOQkB8
         6lrg==
X-Gm-Message-State: AOAM533Y3ZJYrGHrDnswqePGGty2XoZXxS23fMBJlx/xd2xcDA8VrTry
        dOtcCtUBMEgnlruLS5nporMAMMrBSQg=
X-Google-Smtp-Source: ABdhPJw37m3EPlJ8q46cVxOkVst/rTJG4abkNKD3e0LChybJTMCGYEWRlX9IN/R9Ei0YQjH86lSnQw==
X-Received: by 2002:a19:e48:: with SMTP id 69mr1327591lfo.469.1616175702251;
        Fri, 19 Mar 2021 10:41:42 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id 192sm847746ljj.95.2021.03.19.10.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 10:41:41 -0700 (PDT)
Subject: Re: [PATCH v4] mm: cma: support sysfs
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Minchan Kim <minchan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>, joaodias@google.com,
        willy@infradead.org, david@redhat.com, surenb@google.com,
        John Hubbard <jhubbard@nvidia.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <e8ae901d-9521-8de4-ee45-18cb55b8f29c@gmail.com>
 <YFSqYUfaxMajR/aq@kroah.com> <b3cfe38f-bfd0-043a-6063-f5178d4a9b09@gmail.com>
 <YFSrgfAyp+dYWi7k@kroah.com> <33ec18ef-8652-643a-1a53-ff7c3caf4399@gmail.com>
 <c61e58ca-6495-fd47-0138-5bbfe0b3dd20@gmail.com> <YFS06OLp70nWWLFi@kroah.com>
 <78883205-e6da-5bc4-dcec-b6eb921567b1@gmail.com> <YFTITw73Wga0/F0V@kroah.com>
 <72db59eb-75dc-d1ed-7a83-17052e8f22a8@gmail.com>
 <YFTRkBEr5T37NFpV@google.com>
 <82bde114-60c0-3fde-43f4-844522b80673@gmail.com>
Message-ID: <f451e60c-750f-a6d8-e035-e665391f9261@gmail.com>
Date:   Fri, 19 Mar 2021 20:41:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <82bde114-60c0-3fde-43f4-844522b80673@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

19.03.2021 20:29, Dmitry Osipenko пишет:
> +void cma_sysfs_alloc_pages_count(struct cma *cma, size_t count)
> +{
> +	atomic64_add(count, &cma->nr_pages_succeeded);
> +}
> +
> +void cma_sysfs_fail_pages_count(struct cma *cma, size_t count)
> +{
> +	atomic64_add(count, &cma->nr_pages_failed);
> +}

The atomic looks good, but aren't CMA allocations already protected by
the CMA core? Do we really need to worry about racing here?
