Return-Path: <SRS0=kaSA=DG=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B300C4346E
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 04:01:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C301420BED
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 04:01:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+6M4uKP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725550AbgI2EBs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Sep 2020 00:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbgI2EBs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Sep 2020 00:01:48 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F690C061755;
        Mon, 28 Sep 2020 21:01:47 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id y11so3850890lfl.5;
        Mon, 28 Sep 2020 21:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xJYJ1xOL5oF7tlJWhcaFZcfxBH+PkKUBN4FGKZt/x+U=;
        b=b+6M4uKPVgLsJjI8VVLA9c0C8VvcnqnGhRo2VawGiarpWGDp39bSjQtYlBrY5plDys
         +V1l0R+VAfVu6taRrLGwSF6q8Eok7PaOhnnyciXmLOf7JmpfPUcLFZwMTTGtXHJBwAA0
         zCnFPIdsP5SG6dPfPrnZVk1CFbBU/fqaoW6U440B6TwiBmYHEJUnwlmNFxHA8exs+vA2
         O1QE+S6FtrXdL489PYNUIlGlGa01XZgi47bvFuSbGCb5v9fGcm8g4Dsba1NnGT+Wx3ZW
         x3jcVM9afU3xKu3rhsN31cLt+Rh6tgLNQiAnUjH98bcBSCC0V6RKtO7EHkSfY2QJNTg6
         N58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xJYJ1xOL5oF7tlJWhcaFZcfxBH+PkKUBN4FGKZt/x+U=;
        b=e9+Lg45iyH0kdr1SGWWb1T11N+6RC6clnjwYEZxbCZToh5KbegUp+BGfRokA2YBu5q
         xY8GYw9yzRMPsQKLlzzaF2zzFqxR8Z/DE0Vhy8fhOUsDcpxgMew6VVMbFKgdZOMcLzxp
         yRPLs0P2lYf1QpJfuCmqEyn2Uh0aloFhNkJytT7gdsVe5IBXxyOtwcLBMzLdi+CwT5Ie
         xY4N2M14GZWC/FOqlqFdVL9gNMpnrHnP8nCTxkoVe8Lqxq6e6xB4657XzMjUOsJ86GUf
         HSEWXI8YoV65IIUBrwmZMKfN3S/xhBLM2f/UORX7fSKpsB7sVgt7x1dtSCwZlscjbQ3R
         ZHSQ==
X-Gm-Message-State: AOAM5314EeCcC0zoeegtDag318vRyAnaHfMWQ6DlQmvTu8eB5/qVuH7o
        e8uhAFVD1JONGeXruk3D9SpYEyNl+uY=
X-Google-Smtp-Source: ABdhPJyhZWHq1YAVgXNNTUdpYqr01wxVJKztWF4nDaW5+4JCe/tpBBmCl8JWl0bEnSYmeszjNRoxqw==
X-Received: by 2002:a19:488a:: with SMTP id v132mr424123lfa.461.1601352105431;
        Mon, 28 Sep 2020 21:01:45 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id h11sm3079396lfd.21.2020.09.28.21.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2020 21:01:44 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] ARM: tegra: Add device-tree for Ouya
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Bob Ham <rah@settrans.net>,
        Leonardo Bras <leobras.c@gmail.com>,
        Michael Brougham <jusplainmike@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200923210352.1176386-1-pgwipeout@gmail.com>
 <20200923210352.1176386-2-pgwipeout@gmail.com>
 <df2d6a8d-8a6c-464b-8f35-a7994ea01534@gmail.com>
 <CAMdYzYosBUUudsRnf9RQ1HKYq8cS4uXRm-9Mg1=hZy+v_Q_X6g@mail.gmail.com>
 <83a5ee67-e30d-db43-a210-345304ed6edd@gmail.com>
Message-ID: <3801ef6d-0207-06b9-713e-285179703131@gmail.com>
Date:   Tue, 29 Sep 2020 07:01:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <83a5ee67-e30d-db43-a210-345304ed6edd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

26.09.2020 16:47, Dmitry Osipenko пишет:
> 26.09.2020 05:01, Peter Geis пишет:
> ...
>>>> +             pmic: pmic@2d {
>>>> +                     compatible = "ti,tps65911";
>>>> +                     reg = <0x2d>;
>>>> +
>>>> +                     interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
>>>> +                     #interrupt-cells = <2>;
>>>> +                     interrupt-controller;
>>>> +
>>>> +                     ti,system-power-controller;
>>>
>>> Are the ti,sleep-keep-ck32k and other properties not needed for Ouya
>>> like they are needed for Nexus 7?
>>
>> Ouya is wall powered, so ultra low power isn't terribly necessary.
>> Also with LP1 and LP0 not working, it doesn't make much sense to
>> implement this yet.
> 
> The keep-ck32 is not about power saving. If PMC is running off PMIC's
> oscillator during LP1 suspend, then this should be one of the reasons
> why LP1 doesn't work for you.
> 

I missed that you set nvidia,suspend-mode to LP2, so perhaps should be
good as-is for now.
