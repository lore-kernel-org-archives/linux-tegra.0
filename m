Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B8AC55ABD
	for <linux-tegra@archiver.kernel.org>; Sun, 15 Nov 2020 14:10:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B83F22447
	for <linux-tegra@archiver.kernel.org>; Sun, 15 Nov 2020 14:10:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="It0OY4wQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbgKOOKI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 15 Nov 2020 09:10:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726743AbgKOOKI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 15 Nov 2020 09:10:08 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E2CEC0613D1;
        Sun, 15 Nov 2020 06:10:08 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id e139so1440917lfd.1;
        Sun, 15 Nov 2020 06:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cBgdH6GdCBGnI5dccRIOmhr8A9LKRM3pERsD4/tt0MI=;
        b=It0OY4wQqG9i4I/LrYjiVWH6/tC8vyBnyqL7b12g9w4Js5PcICJQB1ABagRngiYNyS
         Ki9JK3/SxfI8BPgGCf0bEW2GWl64ppaSwNvg4pVddCWZVuFOy3cE3JGdI+kmkL/KCUMK
         MWvtnYTaUMV6cDpyD9O+9vfcTGs0pebf4w/F+JmsjOytsbpDDJmgx8bI12vOpACxf5Uc
         ylL9u0tST0lRgTew3w6tg9AE80d2gXuLX3/Z36rKv5Xi1dHdzGyWgAe/XWG2vReJdMT3
         QQWH9f/OBrRhB1TPJ82ziTsOlQvmhDUwP1UP0/igMz8B70Nw0E9nKXhmbb0444K/XiZ3
         hRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cBgdH6GdCBGnI5dccRIOmhr8A9LKRM3pERsD4/tt0MI=;
        b=F2/HEGGf8akpSW3FMJZ3GNX1uUdFol8sAi4P4ufjE9Kd/8mU5Mv04AJZ8wn0r0APSG
         E00La+C+ZXCMBqz//COcNGeLTxXRuujEbF55q0GA1RYLauadS7dqmuREkxuvKF4MVKai
         NPT1IXg6ddIQAWUn7tcEtcJ8H6ezBzoj3lvTltTytB6m2wvhtgCICgMCcHIs/jmvF7iz
         cANGpZGPKfaf2VLfMuLiO9kj1ioDHwuvRihn2qD6F5QVLISoYon3QRdJ1ak3PyxDOWeo
         oG8lOsPSmHQPF0H3ukk0wdNDksg0jm14GYgqejW+GjmrEmxI9XbGAao894TOwNrLxoKi
         0Few==
X-Gm-Message-State: AOAM530iEW7qB1aay2vbWp22wrtQ1Ycwmp86c980jdRX2i2dzgyWqzIg
        +mGHp1bnrFgXyJiqsRSYaDQIIVDgP1A=
X-Google-Smtp-Source: ABdhPJzrrn2CWEv9FRn7nhv9rrehNC6O46kpoyDGaO+VBaOEOcQacCia9+OiQ+wJnnrgAlPRsiMYmQ==
X-Received: by 2002:a19:8544:: with SMTP id h65mr4165469lfd.344.1605449406342;
        Sun, 15 Nov 2020 06:10:06 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru. [109.252.193.159])
        by smtp.googlemail.com with ESMTPSA id j22sm2028419lfr.6.2020.11.15.06.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2020 06:10:05 -0800 (PST)
Subject: Re: [PATCH v1] clk: tegra30: Use 300MHz for video decoder by default
To:     Stephen Boyd <sboyd@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201104134810.21026-1-digetx@gmail.com>
 <160538861846.60232.2236874455363048014@swboyd.mtv.corp.google.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b362195a-665d-5e1d-4c6e-26cbc2459777@gmail.com>
Date:   Sun, 15 Nov 2020 17:10:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <160538861846.60232.2236874455363048014@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

15.11.2020 00:16, Stephen Boyd пишет:
> Quoting Dmitry Osipenko (2020-11-04 05:48:10)
>> The 600MHz is a too high clock rate for some SoC versions for the video
>> decoder hardware and this may cause stability issues. Use 300MHz for the
>> video decoder by default, which is supported by all hardware versions.
>>
>> Fixes: ed1a2459e20c ("clk: tegra: Add Tegra20/30 EMC clock implementation")
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
> 
> Should this go to clk-fixes? Thierry?
> 

Either way should be good. The fix isn't critical because 600MHz seems
to be working okay on unsupported hardware.

Potentially this could vary depending on a board, but then I don't think
that there are actively-supported boards which would notice this change.

Likely that this patch will be backported by a bot anyways because of
the fixes tag.
