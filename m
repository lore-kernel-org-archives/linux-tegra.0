Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DE8C432BE
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Aug 2021 11:00:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9467F60FE8
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Aug 2021 11:00:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbhHTLBT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Aug 2021 07:01:19 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:58250
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236783AbhHTLBS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Aug 2021 07:01:18 -0400
X-Greylist: delayed 506 seconds by postgrey-1.27 at vger.kernel.org; Fri, 20 Aug 2021 07:01:18 EDT
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C59C640792
        for <linux-tegra@vger.kernel.org>; Fri, 20 Aug 2021 10:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629456734;
        bh=bEY0tLoe24jiwQ1BBwb3ntpzUGXLwmR1QkfqwNeab5Q=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=NIMqk8+hTRCl41SfiPqxypEjfwN6iwszeo7BvIK4f7272qtohKT6B2D5AFkRQOTg3
         ZGORwjQF92sypjSB2aupREJRpqyymOJaWpqv2HKeOJm0dE108bwIVvzGpHmwsv9g6R
         2ZqN9agHeswTUZdb8ucs9OHuFkJNxWkB1pHikAzZAjWR8Vy+uQNYHGBGgxspUPtiEz
         Vkj7gXtPxBHHX/MgKMtbZu4+SRfqnGldYZAoMLCgfndBXKtdaz3umTRku51yIHXV6d
         fUUNaXzYTIwBwGrBo2PmPmIHLq2M4M4U3WLwUdqtLSsmlZ+IcSsO+YvpDKmH1b+ZUQ
         SVitWDqcS75Ag==
Received: by mail-ej1-f72.google.com with SMTP id r21-20020a1709067055b02904be5f536463so3563308ejj.0
        for <linux-tegra@vger.kernel.org>; Fri, 20 Aug 2021 03:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bEY0tLoe24jiwQ1BBwb3ntpzUGXLwmR1QkfqwNeab5Q=;
        b=Y1a1udjmcKjFO/FBllf1i7tD7UF14PrLxnWi9mHLUTDZWPZGIvF2Rf2f6YCGTmwic3
         Unzcy02Ar80fZ40vcbkdePcGOyB8a40OXkzRSeLfma22WkldbOSZfo4wUxvTgCZ7o/vq
         vuZ1cpsIGTNxKGPdCLQYcz2OEo5VDtyVETPu9/qqZYN9ozQExyDYq8urJVonzyiANLvf
         8jDN/x2N7DvFzisPQim+UwWoqPXtNVi6HZVidaS38zKofYOLMNQaD9opa76az0YRwpjg
         eb6uIRiM6hVCh+Ixk6CdWaoHfhGaG9HU1T2K6qjpXYu3bF4MXVLnOG3UwvIJqM9HiQtt
         BC2A==
X-Gm-Message-State: AOAM532RAxH61DGLpc90499CwNBFOKQAVY3LtNowgmK2Ztnlud9HHFT2
        HbVuYN5o+TvqbV/slOTN4xk0d8S5zyWjR72ah4CVjpSvhNCd2WfuOv7x/AimWvGgolu/oSrw1/y
        6rqWo43xbBd73HmJl9sEgtKp/TYSxBHQt4ZbH8c32
X-Received: by 2002:a50:99d9:: with SMTP id n25mr21936497edb.310.1629456734352;
        Fri, 20 Aug 2021 03:52:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwgHZjGv4/G3o//as9FIIt8mx7PidsjndSwA7RNnyaBmG0u7l+H7nGHvlAtxIyexightLogQ==
X-Received: by 2002:a50:99d9:: with SMTP id n25mr21936486edb.310.1629456734250;
        Fri, 20 Aug 2021 03:52:14 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id h8sm3269223edv.30.2021.08.20.03.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Aug 2021 03:52:13 -0700 (PDT)
Subject: Re: [PATCH] memory: tegra: make the array list static const, makes
 object smaller
To:     Colin King <colin.king@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210819133155.10441-1-colin.king@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <9ecb8f1b-7e2a-7d5a-c176-07459d0c148f@canonical.com>
Date:   Fri, 20 Aug 2021 12:52:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819133155.10441-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 19/08/2021 15:31, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array list on the stack but instead it
> static const. Makes the object code smaller by 110 bytes:
> 
> Before:
>    text    data     bss     dec     hex filename
>   37713   21992      64   59769    e979 .../tegra/tegra210-emc-cc-r21021.o
> 
> After:
>    text    data     bss     dec     hex filename
>   37539   22056      64   59659    e90b .../tegra/tegra210-emc-cc-r21021.o
> 
> (gcc version 10.3.0)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/memory/tegra/tegra210-emc-cc-r21021.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Looks good, it's too late for this cycle, so I'll take it after merge
window.


Best regards,
Krzysztof
