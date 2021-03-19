Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50ABFC433C1
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 17:57:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E78E961985
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 17:57:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbhCSR4b (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Mar 2021 13:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbhCSR4J (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Mar 2021 13:56:09 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D3D6C06174A;
        Fri, 19 Mar 2021 10:56:08 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 184so13016621ljf.9;
        Fri, 19 Mar 2021 10:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EN3uRBxUV6eO1T+kGUJLe9TYovHE3LSSTvhishvZdAI=;
        b=c+1GxprWueFENyi5K/CZts1MNjoFWJg8eQS3tOBmbBISXM0M/JelqTmfQUv8lPyCUW
         XiswpSTRG6ELr/fdzcZ424IoINC0GuPR6SfL3Moby6GVLSXPvNdJzQk1Oob3tjzjTg2L
         HDT3gqB7gupOd0yaZtsMP+0wxcE1xpHGmS7ya7hhpI3s3Sj3NBIKgjjpkADq10BWruzv
         OaC+UV/CHIBV2GFJA8QQaKUG4JUiy1geLpHIVDYe9mWWtS8q8Doj6vwhZDKb4v2UTxt/
         9enabFoP27vZEiILngtyCXA4nK52I6+oAhW2tHBNk/tzR205zZanwCHolFibW14G7wNR
         Oq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EN3uRBxUV6eO1T+kGUJLe9TYovHE3LSSTvhishvZdAI=;
        b=QvrE5tlEYNTJ06olR9Rem2vTOkTdUlLYNjtptAVZT9MeITJngBEHhT5siv+1JMxuzo
         baJmO43YaQzOJYxBSkVLsGiE2xlEZYLZTD0BCz9zZgY1pnp6kv+5uVrYVNazqe2VvdEI
         2K7MNSYfT0u3X6LYtNMnTXA8BVnPtp+iLuCAghif+dLGSUBlsHJUBcI06Y4zR72I7KAC
         J4mXvLhQD3fS8spfAREZpd4ETy0UL+Bs2J0Wgx0gd03oHndbwzpJMy/IiUlgXrjxM5hV
         P0EUahCcvdUzcgq80T60a+MoGEudtzd7UV7bBubEWzHRYgSSBF6JQWXL/ABnd16XFKez
         y+rA==
X-Gm-Message-State: AOAM530BFjU0pkYLGwdSABsfHSKs+mfnVC0QQOSdxcqEqVpsxp0HL+vv
        3v4TXl5P9EpMCMt0Y21+LLWTigjP6Y0=
X-Google-Smtp-Source: ABdhPJxq1u9oT6lgD+hfhtI3hv0grR3ARQY1SAwmD6LDpEXcJ/1QOK0n2WfApV/cYW4FNb5WkiE5sA==
X-Received: by 2002:a2e:a0d0:: with SMTP id f16mr1679862ljm.215.1616176567012;
        Fri, 19 Mar 2021 10:56:07 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id e8sm855367ljg.22.2021.03.19.10.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 10:56:06 -0700 (PDT)
Subject: Re: [PATCH v4] mm: cma: support sysfs
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <071c6681-f492-2c94-5686-30c30778f39d@gmail.com>
Date:   Fri, 19 Mar 2021 20:56:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFTRkBEr5T37NFpV@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

19.03.2021 19:30, Minchan Kim пишет:
> +static void cma_kobj_release(struct kobject *kobj)
> +{
> +	struct cma_kobject *cma_kobj = container_of(kobj, struct cma_kobject, kobj);
> +
> +	kfree(cma_kobj);
> +}

Oh, wait.. I think this kfree wrong since cma_kobj belongs to the array.
