Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092D0C47082
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Jun 2021 13:41:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E382F611AC
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Jun 2021 13:41:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230350AbhFGNnM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Jun 2021 09:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230200AbhFGNnL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Jun 2021 09:43:11 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54C31C061766;
        Mon,  7 Jun 2021 06:41:20 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id e2so22300460ljk.4;
        Mon, 07 Jun 2021 06:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LzfN2Btce3tg6nTwffnJEjG2d6mrAouEHxoqIsbHZzM=;
        b=jGFMKj5AAXn1nbfmf1qa76NQd/jGyi0NRL+UsnArWiS+yV6/fe28fh5eG5qSlkdsa/
         2C1OlNfmxAOQsfA8LoX97qDse3GzyRcARIbR1wGFOyypnxF3eSkJxFGig4XaMG+lN/M1
         C+XmrTwDTjw0//KWAcOfKEXYEDtH3QyiELorIHpOlq8EwdPqkGpP6+41wl2OGTbGh+0X
         8NSlspVOAwD9uAQYAVtu9F6x/bgeYYTjm1OBuAAtFdrI+8Ab5+nvjcFwHDi8kssfJb9B
         QlUascO4fUW/g0hrDXOiIEqtu44774UizGC3SOmZQIyJQq4WlSfuIE9L31N79IS2i3xm
         YDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LzfN2Btce3tg6nTwffnJEjG2d6mrAouEHxoqIsbHZzM=;
        b=DCuzAscpz1gPyambcsF44xmtsVTPqnLnbyUmHkEeS4fLgPjtMVfwrCS/r21/BT3cQQ
         5pHzxlZS3uAz1NxZ6NCkbPKgPzBx8E0NTiJikWNTfoolFj6ObiNCqMOevKv4WcrJGuZ4
         uhC4hPF3ddyJpOZAmjkxZ6tTSde/oxrj1T2vH29b+XEFLYoHhZH0SLqw6Z6GuWcLjkdK
         HpfbgsMo10+bOWz5xu0jLAealftm3vBg+NMW5Uq5SIGKiwLoGKypiPZ5LSOqymPkSQd0
         7dGgvYHdMmpKbE86Lctf1s+qYfR0wpP5GED84nNYDUGblyLIE4UF6mQIlflqyCoGQ3/2
         OIHQ==
X-Gm-Message-State: AOAM530MdHGvaxXsD3ya+rEgmVMc+5IatUPHTcW9xjna1xsGcuBT3XNQ
        g713xGmyf1XcK7zCB+9pGN3zD0tLVW4=
X-Google-Smtp-Source: ABdhPJxTRESjlMxqKxQ0LozGaKLKALuNwdn/9jJcpABI+zM7zurkzz0UsoPnH3t4w3fbLxxOD00OSQ==
X-Received: by 2002:a2e:b0f3:: with SMTP id h19mr14028524ljl.62.1623073278426;
        Mon, 07 Jun 2021 06:41:18 -0700 (PDT)
Received: from [192.168.2.145] (94-29-1-103.dynamic.spd-mgts.ru. [94.29.1.103])
        by smtp.googlemail.com with ESMTPSA id u12sm1533980ljo.37.2021.06.07.06.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jun 2021 06:41:18 -0700 (PDT)
Subject: Re: [PULL] memory: tegra: Changes for v5.14-rc1
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210603143739.787957-1-thierry.reding@gmail.com>
 <772bf62a-fb09-cec4-ed4d-ddbfc2832e2b@gmail.com>
 <YLnzQk+suAG5clzB@orome.fritz.box>
 <3ed358ce-de98-0b42-2446-873af55ed825@gmail.com>
 <9f1fe71e-3900-fa8a-8c09-4bc2dc084156@canonical.com>
 <YL4ed935vYUb8L8d@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <84080cd9-b1bf-10d5-89fd-bd9dfdf5a8de@gmail.com>
Date:   Mon, 7 Jun 2021 16:41:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YL4ed935vYUb8L8d@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

07.06.2021 16:26, Thierry Reding пишет:
> On Mon, Jun 07, 2021 at 10:28:14AM +0200, Krzysztof Kozlowski wrote:
>> On 04/06/2021 14:51, Dmitry Osipenko wrote:
>>> 04.06.2021 12:32, Thierry Reding пишет:
>>>> On Thu, Jun 03, 2021 at 10:56:29PM +0300, Dmitry Osipenko wrote:
>>>>> 03.06.2021 17:37, Thierry Reding пишет:
>>>>>> memory: tegra: Changes for v5.14-rc1
>>>>>>
>>>>>> This stable tag contains Dmitry's power domain work, including all the
>>>>>> necessary dependencies from the regulator, clock and ARM SoC trees.
>>>>>>
>>>>>> ----------------------------------------------------------------
>>>>>> Dmitry Osipenko (18):
>>>>>>       clk: tegra30: Use 300MHz for video decoder by default
>>>>>>       clk: tegra: Fix refcounting of gate clocks
>>>>>>       clk: tegra: Ensure that PLLU configuration is applied properly
>>>>>>       clk: tegra: Halve SCLK rate on Tegra20
>>>>>>       clk: tegra: Don't allow zero clock rate for PLLs
>>>>>>       clk: tegra: cclk: Handle thermal DIV2 CPU frequency throttling
>>>>>>       clk: tegra: Mark external clocks as not having reset control
>>>>>>       clk: tegra: Don't deassert reset on enabling clocks
>>>>>>       regulator: core: Add regulator_sync_voltage_rdev()
>>>>>
>>>>>>       soc/tegra: regulators: Bump voltages on system reboot
>>>>>
>>>>> This patch is a build dependency prerequisite for the "soc/tegra:
>>>>> regulators: Support core domain state syncing" patch. Will you send a
>>>>> new PR to Krzysztof with the remaining soc/tegra patches?
>>>>
>>>> soc/tegra patches usually go in through ARM SoC. This is merely included
>>>> here because it was part of the set of patches that were needed to
>>>> enable compile testing for the memory controller drivers.
>>>>
>>>> I've applied the remaining soc/tegra patches (12-14 of the series) to my
>>>> for-5.14/soc branch but ended up not pulling that part in because it was
>>>> unnecessary for the memory controller patches.
>>>
>>> Does this mean that if for-5.14/soc will be pulled first into mainline,
>>> then the patches will be applied in a wrong order?
>>
>> All of the branches of each maintainer should be bisectable, so order of
>> pulling by Linus' should not matter. Assuming current Thierry's branches
>> are bisectable, how Linus' tree can be broken after specific pull order?
> 
> Yeah, I don't see how there could be issues. The for-5.14/soc does have
> all the dependencies that it needs, as far as I can tell, as does the
> for-5.14/memory branch. If for-5.14/soc gets pulled first, then the
> sub-branch that's included in for-5.14/memory will end up in ARM SoC
> before for-5.14/memory, but that should be harmless. Once
> for-5.14/memory is then pulled in, it'll pull in all the dependencies
> with it, except that part of them will be there already from
> for-5.14/soc.
> 
> The only way this could break is if either the original series wasn't
> bisectible, or if some of the later SoC patches rely on patches from the
> memory portion of that, which rely on the earlier SoC patches. That'd be
> a very odd circular dependency and would add to the complexity on how to
> handle this. But given that all these branches seem to be building fine,
> I don't think that's the case.
> 
> If something like that ever happens within a series, please make sure to
> point that out. In general a good way to manage such circular
> dependencies is to post subseries separately and make a note of the
> dependencies in the cover letter to make that clearer. That's also why
> it's usually a good idea to send series such that the patches within are
> ordered by tree. That way it's trivial to find out if there are any such
> circular dependencies by doing a bisectibility build on the branch.

I see now that for-5.14/soc has the "Bump voltages on system reboot"
patch, so it should be okay.
