Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE46C433C1
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 18:32:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 204D061A2B
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 18:32:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbhCZScM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 14:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbhCZSbs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 14:31:48 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C252C0613AA
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 11:31:48 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id f16so8532017ljm.1
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 11:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=b2f3xr/E6w81sQbdXcFGqRZ/LRTr2HKluT/8xyuicEY=;
        b=anBDIsvJQaiW+vBb4EedAzxD90CO27pMMbFt18tJUd3w/p4gpHowiPFYUQylyz5e0j
         FPcsf62mER1pt3M/jRHlMADhkkwLva/gUotioijOddK5duFIBfFXIXGBPcCLy+5Uqi3X
         FhNYGSArDtm3UV1sl83S+7qo+2sc4IBzYipF+dEM1q/Rq4pzBaJJgLITcuFb0sgXMVQa
         BpV55ITkYQpN6Txbpw0DvCGQxdoNKcaPbVk4ZeG6znhLnvczGQg39DJBdY12WJSUznmX
         6dDZ8f70loqHAoWh4tuepJQ+igWmvKW5+2YE6zDvXokj3MDtmmFK49zPeyZKqvcxiUes
         Bs0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b2f3xr/E6w81sQbdXcFGqRZ/LRTr2HKluT/8xyuicEY=;
        b=II6C9z3pymLzQwci8TranBgbZ4Jw6zFtRBtfLqI3xMNbEsGd4RFcYnvE/WdzmlDAkY
         vXbyjjkS1c1/7kvwrMfPscF7um3eQPcVwulFRqND1iIoD995IzJ6Eefr6FrIvGzJP23D
         He3R7CVPbjNwzObHKBvIXhTmYg3es4ixe1jJz7ObkLsojgR3yefJBVblIPNmqmYHW1+n
         DAqEuzjxcacIELvgS+o9RZBf6msmWQtHk69UUcoYnLIRCh7YnRAHYf0gau3SGX04r1G0
         byrEzJBobjRHZ09RayxzQDQbQYEArIzKBXCJGf+xLwAsjm61KrkMAqupFkpDX/YLrdnI
         CEMQ==
X-Gm-Message-State: AOAM532zoXQnpTjA04NYdLBlcBdI9vY1800dYZ+ngd2deKSNElh78Gk9
        Ebc9M7DNH2PX7jBDW61KDoA=
X-Google-Smtp-Source: ABdhPJy289DCEIf8dD3WRBerWrKHG0ziMy/geZZWJ162h8jJ8f6SvLDejcO0WbSIVaEU2VOrnuVTnw==
X-Received: by 2002:a2e:b814:: with SMTP id u20mr9662743ljo.370.1616783506900;
        Fri, 26 Mar 2021 11:31:46 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru. [109.252.193.60])
        by smtp.googlemail.com with ESMTPSA id g9sm938729lfc.258.2021.03.26.11.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Mar 2021 11:31:46 -0700 (PDT)
Subject: Re: [PATCH v5 01/21] gpu: host1x: Use different lock classes for each
 client
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch,
        linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-2-mperttunen@nvidia.com>
 <YFitsk3I2l7IBnLR@orome.fritz.box>
 <6615105f-ccf1-7833-512c-090817c47952@gmail.com>
 <645366c2-c500-efcc-f44c-b933f6f470c4@nvidia.com>
 <0fb1b458-66bb-c9d8-04c7-174165b39811@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <222f5544-6710-c931-5992-7ac11e440042@gmail.com>
Date:   Fri, 26 Mar 2021 21:31:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <0fb1b458-66bb-c9d8-04c7-174165b39811@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

26.03.2021 17:54, Mikko Perttunen пишет:
> 
> Lockdep doesn't seem to be liking dev_name() for the name, and I think
> allocating a string for this purpose seems a bit overkill, so I'll keep
> the lock name as is if there are no objections.

What does "liking" mean?
