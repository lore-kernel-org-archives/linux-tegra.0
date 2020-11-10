Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E942C388F7
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 21:29:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B302C206F1
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 21:29:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYQknKwK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730254AbgKJV3C (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 10 Nov 2020 16:29:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgKJV3B (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Nov 2020 16:29:01 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C01E4C0613D1
        for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2020 13:28:59 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id w142so166701lff.8
        for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2020 13:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BmiauwebKx8cklRqIZirhTMgRdWbGGYeDKcnH0gxPng=;
        b=TYQknKwKsOlhx6O4QVraqkgoIr4myzCgI8gmHwVh6pYqNKBZD/S/hWy8prNav5k7Vh
         x2/Cz6M/MdBAHsa0T2hCOBJkv6GHeG73AM/tPvEN/6EK2Wp1AfqGcX8WpN+tiDRBL7DZ
         88VxXxHYC6zmiawDXxrHEhlTXPL+XdxWqp48WsP4YBLxEdzM22yjadb9caeWeWqvOvJF
         sI1UMpS8fjhWAo9BwEVQv2MKaYH5KmIzI4J6hc+DnyYLUXXZQLXSDOr1/7fsbuNumlE0
         U+BZgwPGyy5bXzrQYSD27U20HittgfhR7qRmiK90ykHooPgv04BxtST4hl2Fmk42srbY
         1IbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BmiauwebKx8cklRqIZirhTMgRdWbGGYeDKcnH0gxPng=;
        b=PWe0CX5b1VCkM/Si84PwxWTHSj66yFIErBLERp+mGLWuYo2JBv74QTO305rQlv6TWv
         EwXvKJfSYlnqk6cx8a8vb60m+BhACwdB3Lfwy+MJkmSIwFqSNsGkY+ln7uayGjc1Gk88
         7ZaWuO7pLdxwwYkTEXf2CYv1QG4mLRmL5ne2wCweJlF1+FS0CACWq3UcrCItZQXfLhwm
         7Zp6rfMXyBJxsT79oHLaRRNa9n0UEribNG7iuTomtk+jf1OaEfPkpv5xAB/9BYju5nJ7
         EAtkm5OuHoiRjIpSIvjLrVDfSAMgfx1Kb73pYip+CoxUnr0TKUp4ST83kTTEZyijEKZy
         SeFw==
X-Gm-Message-State: AOAM531OumvRPEHila6jt7B1OOs+cD/HJG/dAY74pm8OO4Lmp7l7hgpy
        Ch5aBAfyEnryzPLqE3xVPs/bPpyrV6w=
X-Google-Smtp-Source: ABdhPJzPuuzQiIXd2+w+JiYU2Cr0QDI85qvTi4d0cWeDJa3fmAG6BJvkxHCRU1II/iqj0Xt6peaGZQ==
X-Received: by 2002:ac2:53ab:: with SMTP id j11mr4982795lfh.86.1605043738013;
        Tue, 10 Nov 2020 13:28:58 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru. [109.252.193.159])
        by smtp.googlemail.com with ESMTPSA id z7sm3726lfr.304.2020.11.10.13.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 13:28:57 -0800 (PST)
Subject: Re: [PATCH v2 7/8] ARM: tegra: nexus7: Set video decoder clock rate
 to 408MHz
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20201104141251.25834-1-digetx@gmail.com>
 <20201104141251.25834-8-digetx@gmail.com> <20201110175836.GG2297135@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b442810e-77c5-c04c-4816-82ce444c1573@gmail.com>
Date:   Wed, 11 Nov 2020 00:28:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201110175836.GG2297135@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

10.11.2020 20:58, Thierry Reding пишет:
> On Wed, Nov 04, 2020 at 05:12:50PM +0300, Dmitry Osipenko wrote:
>> The default 600MHz is technically unsupported on Nexus 7. Assign VDE clock
>> to 408MHz, which is supported by all hardware versions.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 3 +++
>>  1 file changed, 3 insertions(+)
> 
> This doesn't seem to apply. Is there another patch that this depends on?

Indeed, this patch was done on top of the "core voltage scaling" series.
I'll rebase and send it separately, thanks.
