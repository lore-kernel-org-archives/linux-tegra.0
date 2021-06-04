Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC814C4708F
	for <linux-tegra@archiver.kernel.org>; Fri,  4 Jun 2021 12:51:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CEF2661028
	for <linux-tegra@archiver.kernel.org>; Fri,  4 Jun 2021 12:51:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbhFDMxh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 4 Jun 2021 08:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbhFDMxh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 4 Jun 2021 08:53:37 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB9F9C06174A;
        Fri,  4 Jun 2021 05:51:37 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id u22so11395747ljh.7;
        Fri, 04 Jun 2021 05:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sWq9BtJeTbRBDmXrVmUrtGhFcWI4C+yAzYUMss7pZlo=;
        b=sJ2Ky/+ylWNOBisYSJ7J3tzD8ZcTMNJQnxfxj+GaRKM+XK1XXTaVcWl0NgolOaHgmP
         AcrMiKp8D+p+C43u+LMnbVMYXP6oJ5D0Fd/8k4CagMkvZWQpMMwY+2VSs62UV/dPS8B6
         41mHD7sQOcjmd+1Q9TL1X028gN2bZ1WL942ZVKyU0IuWqchetnKB5CLS1ROxOCGoygXa
         NUXjzLKrBcn6+/8ipnUMJTs2Wy9DFUTszGHpZgb7O5+vtCzNhWJfuW/XRl46esuEn/VH
         4/B/52rbvtqXDBzeqlO37Cx1Ev2zvTDJISpkcpKWR4I7rFFnav5gXXmHmN9MjKRAS6d9
         0NWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sWq9BtJeTbRBDmXrVmUrtGhFcWI4C+yAzYUMss7pZlo=;
        b=Sr4mkt7cHn93ciq7Df/rYCribKPjgvqfdABWx9is8H2VWr/cdp5JybsjMAZPwsNsON
         qhnsaPhLAjs+0I2wOLPLYEHTH9Obq9reG2r23hCcVPBuw5u7rinSlQH1lce+L7YtPWqQ
         0098+LtSeCop7eGizTeQg0J5cKq0P7aoLgihfh5ozabbl6x3ddTJ3lOCpVpQS3xCPa22
         cPwMzBXqHvMVVGLqYx9c6AadKnGeiwDDtPu3pcBorZpjmvuf22jXItyerQTMdAp6Xo9S
         BRUZF9pZ9lLRd5knRcM2i+a+K+uQhTrjj2ph7d3kDbFnaYT13cxY9dU42xIcyJ2rdt2F
         8P5g==
X-Gm-Message-State: AOAM532Ev0NG+wOVXpvtb8lb9muRZbGCFkQAC0JsIDHUtiQf/s2PihVI
        kNjUgd3k+gkm3AoJWhztGScyMtLLJ0Q=
X-Google-Smtp-Source: ABdhPJwRZvgz+MdzoAmEM0qrX+XvutCPsnAHjcOTDhIq44lSOxvVYGqOyIKCcpJYkADmrZXIlQfdvw==
X-Received: by 2002:a05:651c:502:: with SMTP id o2mr3333254ljp.105.1622811095888;
        Fri, 04 Jun 2021 05:51:35 -0700 (PDT)
Received: from [192.168.2.145] (79-139-170-222.dynamic.spd-mgts.ru. [79.139.170.222])
        by smtp.googlemail.com with ESMTPSA id w26sm611302lfl.111.2021.06.04.05.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 05:51:35 -0700 (PDT)
Subject: Re: [PULL] memory: tegra: Changes for v5.14-rc1
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210603143739.787957-1-thierry.reding@gmail.com>
 <772bf62a-fb09-cec4-ed4d-ddbfc2832e2b@gmail.com>
 <YLnzQk+suAG5clzB@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3ed358ce-de98-0b42-2446-873af55ed825@gmail.com>
Date:   Fri, 4 Jun 2021 15:51:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLnzQk+suAG5clzB@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

04.06.2021 12:32, Thierry Reding пишет:
> On Thu, Jun 03, 2021 at 10:56:29PM +0300, Dmitry Osipenko wrote:
>> 03.06.2021 17:37, Thierry Reding пишет:
>>> memory: tegra: Changes for v5.14-rc1
>>>
>>> This stable tag contains Dmitry's power domain work, including all the
>>> necessary dependencies from the regulator, clock and ARM SoC trees.
>>>
>>> ----------------------------------------------------------------
>>> Dmitry Osipenko (18):
>>>       clk: tegra30: Use 300MHz for video decoder by default
>>>       clk: tegra: Fix refcounting of gate clocks
>>>       clk: tegra: Ensure that PLLU configuration is applied properly
>>>       clk: tegra: Halve SCLK rate on Tegra20
>>>       clk: tegra: Don't allow zero clock rate for PLLs
>>>       clk: tegra: cclk: Handle thermal DIV2 CPU frequency throttling
>>>       clk: tegra: Mark external clocks as not having reset control
>>>       clk: tegra: Don't deassert reset on enabling clocks
>>>       regulator: core: Add regulator_sync_voltage_rdev()
>>
>>>       soc/tegra: regulators: Bump voltages on system reboot
>>
>> This patch is a build dependency prerequisite for the "soc/tegra:
>> regulators: Support core domain state syncing" patch. Will you send a
>> new PR to Krzysztof with the remaining soc/tegra patches?
> 
> soc/tegra patches usually go in through ARM SoC. This is merely included
> here because it was part of the set of patches that were needed to
> enable compile testing for the memory controller drivers.
> 
> I've applied the remaining soc/tegra patches (12-14 of the series) to my
> for-5.14/soc branch but ended up not pulling that part in because it was
> unnecessary for the memory controller patches.

Does this mean that if for-5.14/soc will be pulled first into mainline,
then the patches will be applied in a wrong order?
