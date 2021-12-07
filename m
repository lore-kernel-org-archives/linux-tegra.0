Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C211C433EF
	for <linux-tegra@archiver.kernel.org>; Tue,  7 Dec 2021 14:41:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233797AbhLGOp0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 7 Dec 2021 09:45:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233705AbhLGOpZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Dec 2021 09:45:25 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5624DC061574;
        Tue,  7 Dec 2021 06:41:55 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id 207so27778393ljf.10;
        Tue, 07 Dec 2021 06:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7eade14rUwVaC6ONhU+mFD2/aGeW0O4W2AFPSjVxDfo=;
        b=n7Ynb9iaAcbA7/q54bBbx/tqpCvDvt4QV43GvBGM2yFhYpXoVuiS4l39elTjUUAQ/q
         RHYRXwSMPHti7y+vQU9UaJEUAVcVVFjd8EblKnrc582XxChj8pXU98hbQGIGc6Lm3glS
         kfdfM2NK27Dkx9sMhWZPTzge5FxKrCnEzfwgrXEGCqWxgVgpfVJdMZn9fFfUHZJo/H6L
         N8yiy7ziQPu2yL+1ua1cPPQCS8gVc7B/GAH382yBzWCPPztXDFvxx64aFS4KP28izIRe
         gSh7vlZypo9XPIGmdWn7Ui3HP3BCYc/g3XSdMFrELhWtv5ONGhMnfHCkY2NrE9yK6Elr
         WWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7eade14rUwVaC6ONhU+mFD2/aGeW0O4W2AFPSjVxDfo=;
        b=2Yur5YNY2sPfGrjBr0Xm7Vfn/+7kroqKIhWVWnRwnCHKLjFkd4s/te+O6Q1K+c6VhW
         CLvJpaUbYHNspYrLHDPzl9XenmAcSXK+zEPDoOhjyF3WG2iCjt98GR0jpgNaBt6EjX5s
         tGK7m3VFxmA1kGHNu7e7DlyycDoSOBgEmdlEM0nkvoGndMwES/3yam7YDcwv6cBSSwJC
         /RNxvEslAYGkxzjkmqHP7AiKxZijhaZJGUc99KDtc2DfvCjz1bIhnMxelaKzIFCpdMNO
         EcJ5idoROQHAbmp2qGDgEM4ewKdDAyo0eydMh2KsEhEiQ71LVMd+kmbJm1wS3owuXina
         uV5A==
X-Gm-Message-State: AOAM5305NxD52lVyjwgS+htDAC7CW6BPTT7xTNenFQAjBMJYpvQUJP9u
        vSksJ4phBQ2qGpLf5ihshcHO7Vh6d1s=
X-Google-Smtp-Source: ABdhPJxh9ScPWue7LeY18aOZam/zWNfvHhAen8kRbiPejnt56y/E3q4uhWmqfFmvEKTnVo/SpNC0Dg==
X-Received: by 2002:a2e:810a:: with SMTP id d10mr43081476ljg.325.1638888113464;
        Tue, 07 Dec 2021 06:41:53 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id d4sm1664035ljq.37.2021.12.07.06.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Dec 2021 06:41:53 -0800 (PST)
Subject: Re: [PATCH] ARM: tegra: Drop reg-shift for Tegra HS UART
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20211207101316.381031-1-thierry.reding@gmail.com>
 <91755ddf-0b4d-aa73-f898-f15ccc214804@gmail.com>
Message-ID: <24a7e99e-0a00-08c9-eb32-b9b64d747bac@gmail.com>
Date:   Tue, 7 Dec 2021 17:41:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <91755ddf-0b4d-aa73-f898-f15ccc214804@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

07.12.2021 17:19, Dmitry Osipenko пишет:
> 07.12.2021 13:13, Thierry Reding пишет:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> When the Tegra High-Speed UART is used instead of the regular UART, the
>> reg-shift property is implied from the compatible string and should not
>> be explicitly listed.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>>  arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi               | 3 +++
>>  arch/arm/boot/dts/tegra124-jetson-tk1.dts                 | 2 ++
>>  arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 2 ++
>>  arch/arm/boot/dts/tegra30-colibri.dtsi                    | 2 ++
>>  4 files changed, 9 insertions(+)
> 
> What about Ouya?
> 

What about T20?
