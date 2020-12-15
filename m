Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684F3C4361B
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 16:54:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 224E42251E
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 16:54:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729249AbgLOQyU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Dec 2020 11:54:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729034AbgLOQyJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Dec 2020 11:54:09 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEA16C06179C;
        Tue, 15 Dec 2020 08:53:28 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id u18so41119801lfd.9;
        Tue, 15 Dec 2020 08:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pxeVgBdXnubjTRFQd0+NlLArU4xAtaXKirsAqdyxekE=;
        b=g/QXdvRanunUTVHdHt+xpME9JFqppjt5zPsBpEIz5opFniHQBSeW91QbCkQ+Buc+Ih
         mBSJvakBfP8HEuamk8by8pY54TZncjMKhLGL1/M+R1VEnqI9aNO1nu/bXry5U4NCrgg8
         JiStNm6wNkN1IvfzLgtayx3z05oSXi6OqbXFR/U86bs+0DYNokBd3f8qRgTJJRevDz4H
         jjn+HArZ5KJVUb6rrdX1eA7icrZgG1zJcuTZIKey/7kZPRUQyVVPBrFIXwpl+lM2X/iL
         B23EvKOPi/DJZoAWmEM8VWkgOnKSk9aZ/9PeC+6yGRcvz7IY/+ClY65iiYjAgj+fd60f
         2WAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pxeVgBdXnubjTRFQd0+NlLArU4xAtaXKirsAqdyxekE=;
        b=itfuw9yfQcEyFd0upbJWdnTWfvGes0CpC/tJid5wxjDXqWi4+GXFsGpIZNhIZaZhJz
         ScEwz2+DGPiMKDUoMZYMDrok5kryZiZtojxpBskvHWSBQlpylURPP7zdV4gIl3IzKghp
         8DRW0B+nKpj1QhCbsCdTXkIQNsiRxNE+iH+OgPBCOjJvUbUFuToQRi9ZVEAvp3aDPgQZ
         zTrd3jMfOvIumSgjyjn/Ccp3OHvk7/xbOOJx6SOnCJ1EsGdghCKDAgwcQyN4AW0f5Ekv
         FdrJKzQzQp/37omJdMxxwdFbmMgFylDGJbe8i1x3NJd/gnmgaiuAQBEqeVMl2tGlCb+n
         Y+pw==
X-Gm-Message-State: AOAM530sTNlO0z51KuqIsscSjbgUnW3jjEyZPx6B1bNhjrxCNVbW4ivF
        o3booFDMVQnbFEpTeHa9eFD6jw8P9Bo=
X-Google-Smtp-Source: ABdhPJytRvdtoyKfXnHKYJjSsmqkno61EmGwKKCsIGWQ69fOQu1anWU/K/BDatzwykMLDkfAX2qWyQ==
X-Received: by 2002:a2e:b047:: with SMTP id d7mr8202005ljl.467.1608051207079;
        Tue, 15 Dec 2020 08:53:27 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id d12sm2797400ljl.111.2020.12.15.08.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Dec 2020 08:53:26 -0800 (PST)
Subject: Re: [PATCH v1] ARM: tegra: Fix misplaced tegra_uart_config in
 decompressor
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20201215135222.6899-1-digetx@gmail.com>
 <980f70c6-8967-c110-1699-cb0da2f46cc0@gmail.com>
 <5b01ce96-5f8b-dfcb-accd-2ba29f34947f@gmail.com>
 <5853b349-562c-3b6a-33d6-49516553dad8@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b115f985-b27b-bbcd-fc42-d9e357ecf46a@gmail.com>
Date:   Tue, 15 Dec 2020 19:53:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <5853b349-562c-3b6a-33d6-49516553dad8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

15.12.2020 19:40, Florian Fainelli пишет:
> 
> 
> On 12/15/2020 8:17 AM, Dmitry Osipenko wrote:
>> 15.12.2020 19:04, Florian Fainelli пишет:
>>>
>>>
>>> On 12/15/2020 5:52 AM, Dmitry Osipenko wrote:
>>>> The tegra_uart_config of the DEBUG_LL code is now placed right at the
>>>> start of the .text section after commit which enabled debug output in the
>>>> decompressor. Tegra devices are not booting anymore if DEBUG_LL is enabled
>>>> since tegra_uart_config data is executes as a code. Fix the misplaced
>>>> tegra_uart_config storage by embedding it into the code.
>>>>
>>>> Cc: stable@vger.kernel.org
>>>> Fixes: 2596a72d3384 ("ARM: 9009/1: uncompress: Enable debug in head.S")
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>>  arch/arm/include/debug/tegra.S | 54 +++++++++++++++++-----------------
>>>>  1 file changed, 27 insertions(+), 27 deletions(-)
>>>
>>> Looks like arch/arm/include/debug/brcmstb.S would need the same
>>> treatment since the implementation was copied from tegra.S.
>>>
>>
>> Good catch, will you be able to test the brcm and make a patch?
> 
> Yes, absolutely, building a kernel to test right now.
> 

Thank you.

BTW, I noticed that the problem is more visible on a thumb2 kernel
build, i.e. you should get a more reliable hang on boot. On a non-thumb2
kernel the hanging behaviour seems depends on a device / bootloader. I
haven't tried to figure out what exactly makes the difference, perhaps
it should be a memory layout / state.
