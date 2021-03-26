Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3CDC433C1
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 22:48:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DD75619BB
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 22:48:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbhCZWrn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 18:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbhCZWrQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 18:47:16 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA2BDC0613AA
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 15:47:15 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id w37so9890516lfu.13
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 15:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W1RcGUH/uP3AV+xR5R8WnDD4dWL+fCI3DhAY9Sgy0wc=;
        b=grSyczPIYylTzXeOONjlfKqt282gKKiAu/eXyo0eiv09K6a8LGD0lc3V6rmQwpf6nz
         Yy6LD9UbdAQNyKX6iaR4dQhSxufJNSfGKw/u/gGX0ZPy0h1i+scZpe65xe7ZC0+IMB07
         ZKwHKno5TDAUOWAyXVEDesKUu5lkmb/UxvM/3v9GCHZxv5s20OXkbWusF2J4u+ePdOtM
         B4KUXSSzGF499J2jbKfeXlUXmiY+ISidHNr5BnPZN4ZopOi28aUzISLRbyIU206iTE5r
         WuXHyQMrHgo9yeMZhuC1dRzaLm9gguIqlPVeC/4Tj4sBxdDokTdDWXOYg+YQXe40o29B
         JWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W1RcGUH/uP3AV+xR5R8WnDD4dWL+fCI3DhAY9Sgy0wc=;
        b=PYnAdlWZsuBzTPHfeRSNe8mo+sXYOWEC41CFIkqNAIZ1tQM82yO8LNv6IKoMOEYI9t
         hQCGIvZ2IS3dACgBvz5dNUPzBiYdgb1b5dCDDXBmIt0wfXi9OwB52mz6w+JdTXmdlYcI
         OKXjIuUeoyZACrAcTPVI+o3r2hriBgDshj968LWsVjvtKGUNdAmn2HgCyKUIQdPRsMEI
         bFEA285Oi0JMc/A+oH2DW4z6K1ql6NBQY+9J6eO+9gzBijbwr4kQ3BbjKSmjkOVEmAuJ
         ua4x/iDSJfuCAzrYxuuuGnSQJ62Caxs+fri/GvTluPGOfKe/dmsOnx11UWN94g4vSb52
         LEsA==
X-Gm-Message-State: AOAM531Przvuuss+efP1Vy1qRB0OZlYNdR+Wzkf5/qjJHPpFyrQiwsKA
        Q+ATVvsx0wDu/5YBIw4uSIsq38mOeVw=
X-Google-Smtp-Source: ABdhPJyhGhr5e1IcWFEMSBlIsbuyHIwxtX2KhC3EJ2yE0S4ruHkCIufM20ofganuPru1KBeRN3CE5g==
X-Received: by 2002:a19:7d43:: with SMTP id y64mr9876595lfc.614.1616798834206;
        Fri, 26 Mar 2021 15:47:14 -0700 (PDT)
Received: from ?IPv6:2a00:1370:814d:99a9:a10:76ff:fe69:21b6? ([2a00:1370:814d:99a9:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id x27sm1003125lfn.95.2021.03.26.15.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Mar 2021 15:47:13 -0700 (PDT)
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
 <222f5544-6710-c931-5992-7ac11e440042@gmail.com>
 <48367008-1786-6cb6-15a0-03b526f53fe9@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d4e34746-3ea5-8413-e31e-d0a50d34eac9@gmail.com>
Date:   Sat, 27 Mar 2021 01:47:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <48367008-1786-6cb6-15a0-03b526f53fe9@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

26.03.2021 22:10, Mikko Perttunen пишет:
> On 3/26/21 8:31 PM, Dmitry Osipenko wrote:
>> 26.03.2021 17:54, Mikko Perttunen пишет:
>>>
>>> Lockdep doesn't seem to be liking dev_name() for the name, and I think
>>> allocating a string for this purpose seems a bit overkill, so I'll keep
>>> the lock name as is if there are no objections.
>>
>> What does "liking" mean?
>>
> 
> kernel/locking/lockdep.c:894 (on my local tree):
> 
>                        WARN_ON_ONCE(class->name != lock->name &&
>                                      lock->key !=
> &__lockdep_no_validate__);

Alright, I see now that lockdep requires to use the same name.

