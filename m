Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4598C433E0
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jan 2021 11:29:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6672C22210
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jan 2021 11:29:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728552AbhAKL3Y (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 11 Jan 2021 06:29:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728483AbhAKL3X (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Jan 2021 06:29:23 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20C4FC061794;
        Mon, 11 Jan 2021 03:28:43 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id m13so3126720ljo.11;
        Mon, 11 Jan 2021 03:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=E9of78v4i96JZrNoHe6kz/pn16yK55YQHi5bQS+//0Y=;
        b=gghDSodYEVB/wOR4YTdnNKDKWtPNvq52HJtVtr+B+Ip3gRopcLVgwYs/tgIJBV8ERz
         Wwm7RNxs5kDe6nn6NwL0uTpxZP1b19/W3EvfIyT1+FAUOynLW6MDgjAXFskW0osWc1Bb
         zbyqjp2T7nHQbHGTSj0wH7xpDdyaaWnbEHz8Y8sTilPw8C6t8LeufwPoqxBqVy10ukP9
         PiVyW7QbvmjGri53e320Y2OFO45ZFAM6ZFSDJWDexwAuEbGLRah4lX0sfF5NGNs2hhiF
         N7NJSlixI5NcSy4RrjPLdZFrlmuTW+8l3v6OsrH1c23jxIIfOimVn1XvHfLCT0xugj+9
         0KBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E9of78v4i96JZrNoHe6kz/pn16yK55YQHi5bQS+//0Y=;
        b=oxb9cRBDbNaffIgvL7wZ/Av7g4hR1s2rAHj0WpL7GIzPixlmSgDM2TNn6+ZEF+DySv
         mM9q+QTDMo6EPt2IzRkhJhB/L20Eubs+4HvRLzQB0U4GP8C5vF/03LJUcm8YzrtBfkLv
         Jg9GVl3cFywv4Fl79bjSpWH3Wi3zFyEV0neNc50ApG/v0ZNxjajnVTi3fYrgm0rzffRa
         Qonahjs/5QvPmgAHuR5DXisqAXa7Yj89uqB5WpjAFosFruLYooiOH3rsIt7WyftyK7Ak
         19QtNZLZFZsugFNbwzLJWiCytA/ehXH0bVT/nYDZGaJ69cJhPoRxHCf7m9T2l0eBzGaj
         kpZA==
X-Gm-Message-State: AOAM530a+X+zHkYJvuKzsbNsITzU4JWfCpQBc2kNmCr82YoPZAffjoOJ
        MAn4TESNSPe0UA6hc52O/EXjjbJnn4k=
X-Google-Smtp-Source: ABdhPJyY2Jpk7wfZUTy1IDLgP6NY3VIDeQNyfnMntxiErPN2Ac7dbKJLuzPUWCHTkxDP0bn4o7j0BA==
X-Received: by 2002:a05:651c:1304:: with SMTP id u4mr7541313lja.146.1610364521385;
        Mon, 11 Jan 2021 03:28:41 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id m16sm3063973lfo.294.2021.01.11.03.28.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 03:28:40 -0800 (PST)
Subject: Re: [PATCH v2 21/48] PM: domains: Add "performance" column to debug
 summary
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-22-digetx@gmail.com>
 <CAPDyKFqm4vqWXFxsogo0UVu7r6APmO2c4QG0zf+1ZUKQTP3P2w@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <92f0fb58-0e6b-066d-f7a8-1ead714ef3d6@gmail.com>
Date:   Mon, 11 Jan 2021 14:28:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <CAPDyKFqm4vqWXFxsogo0UVu7r6APmO2c4QG0zf+1ZUKQTP3P2w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

11.01.2021 12:13, Ulf Hansson пишет:
> On Thu, 17 Dec 2020 at 19:07, Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> Add "performance" column to debug summary which shows performance state
>> of all power domains and theirs devices.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> 
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> 
> As I stated for patch 20, I suggest you resend this to the linux-pm
> mailing list so it can be picked up by Rafael.

Thanks, I'm finalizing v3 with various fixes and improvements over all
the patches, including this one, which will get a slightly improved
seq_printf formatting.
