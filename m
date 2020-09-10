Return-Path: <SRS0=wB+u=CT=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29586C43461
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Sep 2020 22:00:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2F112076C
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Sep 2020 22:00:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qh6UC2Tf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbgIJWAN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Sep 2020 18:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgIJWAE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Sep 2020 18:00:04 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7BD4C061573
        for <linux-tegra@vger.kernel.org>; Thu, 10 Sep 2020 15:00:03 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id v23so10227878ljd.1
        for <linux-tegra@vger.kernel.org>; Thu, 10 Sep 2020 15:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fYYYff61VtAw9Z/3mr6kGU5nAy8/XuUCDtA3jDKDF6s=;
        b=Qh6UC2TfF6yqcwkTzJdqTqdYeKJgt2k3eTyTF/v5LypgubpX2FitxIqxNDnjtNwdBK
         A7puxJ1hQL/cL4GC8vEzn0w/CoPbvVe9Lmq3EGWnkqPp6r0LrTz1MqZqcbV0oDy9B8mS
         JGYFlTENs53wW2tJ1bSyJRGXbPVNOE+kLvfFjbqGkcKTBWMEoeYABDGtNzuY5EVSXHnX
         6z/JYGoQi1DYWo02CrkiCp5uUMt+XFbJtbTEEJRWdegj0oLbPCmIK2Sga/jrWyczQOha
         yrzdouQL0gRelESVGCAlQ0TA3Wv6NexhtmAZeKOMu2z6GuQTj0Gji3tmQ86wYgyOkmeL
         OBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fYYYff61VtAw9Z/3mr6kGU5nAy8/XuUCDtA3jDKDF6s=;
        b=uaNjLt8T2fDBTd867PIqOsWZEGa7ASetwaKTrnOgbYkQi0JKg6h5Lb7v5MgX9/ONta
         Bthc279pgLzo3JWSdb7/HGg+iO0Ad0IQy5qCoHijCZIWFVpPiKPEFNaLXNnT+OJz2F4Z
         UnHcTB9xPtyYIjuMcmKal4tyIFvBXJxNrA6fNAHPnH2C+m4jgjQZqiBXw0bsCKRFvLRe
         15Gp9SctD66NPU1AY2rPNPpa9oxVyFzZDZgB/aK7dBWaffEY+RsIJoF26XtDhVFhfS7R
         R9pr+ZyJbkthxC1+fWRy7mea7Ph50q7sBFHu30K4AJYbIsNEUZAV3ZTDZVkbkLhknOKl
         /ykw==
X-Gm-Message-State: AOAM531pYOnQJL6wfV7vvN9PdLtyh7ctfVshuZrQLbIxKpPwBYSJehCV
        SY3L9BLs9JGWF4baFUtsMnU=
X-Google-Smtp-Source: ABdhPJz6xQk+4nZLk2kH3arRb5+HFnZwQTyDkOzhdUh5dW23b4O62EMlch4D1GiopDCUpFcMXaGDPg==
X-Received: by 2002:a2e:b00e:: with SMTP id y14mr5277416ljk.427.1599775202308;
        Thu, 10 Sep 2020 15:00:02 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id v16sm55225ljc.84.2020.09.10.15.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 15:00:01 -0700 (PDT)
Subject: Re: [RFC PATCH v2 09/17] gpu: host1x: DMA fences and userspace fence
 creation
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-10-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ceaa95f3-51a1-3fc6-2466-053e21506d6d@gmail.com>
Date:   Fri, 11 Sep 2020 01:00:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905103420.3021852-10-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

05.09.2020 13:34, Mikko Perttunen пишет:
...
>  
> +static void action_signal_fence(struct host1x_waitlist *waiter)
> +{
> +	struct host1x_syncpt_fence *f = waiter->data;
> +
> +	host1x_fence_signal(f);
> +}
> +
>  typedef void (*action_handler)(struct host1x_waitlist *waiter);
>  
>  static const action_handler action_handlers[HOST1X_INTR_ACTION_COUNT] = {
>  	action_submit_complete,
>  	action_wakeup,
>  	action_wakeup_interruptible,
> +	action_signal_fence,
>  };

My expectation is that we should remove the host1x-waiter entirely. It
comes from 2011/2012 era of the host1x driver and now duplicates
functionality provided by the dma-fence and drm-scheduler. Perhaps it
could be okay to re-use existing code for the starter, but this is
something to keep in mind that it may be better not to put much effort
into the older code.
