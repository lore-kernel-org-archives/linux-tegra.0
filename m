Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 156B3C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 19:17:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD7F7610EA
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 19:17:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbhJUTTh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Oct 2021 15:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231239AbhJUTTg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Oct 2021 15:19:36 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EE4DC061764;
        Thu, 21 Oct 2021 12:17:20 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id u21so1936789lff.8;
        Thu, 21 Oct 2021 12:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1iiJyPiELXV0qVznygVX0sLRkVQk3N2jmiVE07csCr8=;
        b=UXAmszEACOzy6koieqeyzy+9439SCDTdqIXcljAX9wHX/qgs8O/B8bKuJKlkhVXqVy
         oSJqmW0QmTCm5czlsq4w3VfB+XXWo12qNu7mDn8HcDPKCo5Kotlld2DXwlMIQWIDT468
         WsLNxaZDGd4SxwJr2UnD3AeZ0wIhMvvslWfQEHRzPNZHuxPFoSeGCkOHeAFcQLWA76wA
         oXv0+voI54vAtA2KzSrzMtZ8x/UGmNUTcWe/s76F7tPze7bmRazKSgFyWXSikKK7SAXM
         6QMtRWWu88YPTzTJfSDHQ6b7vS2etlMXiWHV6MCmoe9FyKocb/k0Eb3HvtWGop37JlMJ
         vz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1iiJyPiELXV0qVznygVX0sLRkVQk3N2jmiVE07csCr8=;
        b=eYdJWAuVWWJixbzStzabuOhZEEFpxVpnxPw9VKtnaabMq3XPFnRc824wHMuTvRHOCv
         xCt5anBWjvPtmZPgO5xlyD3JVYF77C7KknO44HWcsUGaHTBYFor8qf/BfYPRVSB8FkHa
         wl7dB5VemgWcmob0m3g39uFAn5OKoj/PuRe2FzvS6Fk3Z2fdben3YVnSYi1uRA+cFTAv
         qgtZkS159e2ntaDKbWnELc+ON0bwWStYlWuGv8J5PcgG7XX1isLmiTNFfVZxyTvBZioS
         IZw3RcjkXLMCBS/+o05tmbV2Oy89YtRxRphfPKFyn5x3f5egSwopUa/OTmWggdMA4q7N
         pEYg==
X-Gm-Message-State: AOAM531e9bfrrz1cz+wRAlnGVKfSs5ZnTfObNO5fBYIM7mBFnARn5N2o
        gDX/ZkYOLeLl6+E2+hrgItyaODAUxJ0=
X-Google-Smtp-Source: ABdhPJykQs8UfbGEtsEP+2uSvMXjKKck++BTZEqdN+pufY9At398/lvbRJBTj80k6IIfCHao4G20+A==
X-Received: by 2002:a05:6512:398f:: with SMTP id j15mr6638817lfu.523.1634843838334;
        Thu, 21 Oct 2021 12:17:18 -0700 (PDT)
Received: from [192.168.2.145] (94-29-61-202.dynamic.spd-mgts.ru. [94.29.61.202])
        by smtp.googlemail.com with ESMTPSA id m15sm636229ljp.6.2021.10.21.12.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 12:17:17 -0700 (PDT)
Subject: Re: [PATCH v1] usb: xhci: tegra: Check padctrl interrupt presence in
 device tree
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Nicolas Chauvet <kwizart@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20211021115501.14932-1-digetx@gmail.com>
 <YXFyu+Q5ifG8Au9w@orome.fritz.box>
 <5f122caa-c810-534d-b2a1-53edef313ff0@gmail.com>
 <32694811-8768-8e77-f188-4ed1a1fb93da@gmail.com>
 <20211021152028.GB1161262@rowland.harvard.edu>
 <82a02e70-33bc-7faf-e085-a25884e48844@gmail.com>
 <44567c4f-0f0f-6995-b48f-c427cedb6755@gmail.com>
 <20211021191452.GA1170019@rowland.harvard.edu>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <19e852e5-0952-f665-4e0c-627e070f6abf@gmail.com>
Date:   Thu, 21 Oct 2021 22:17:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211021191452.GA1170019@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

21.10.2021 22:14, Alan Stern пишет:
...
>>> Should USB keyboard be able to wake up every HC or it's a
>>> machine-specific feature?
>>
>> I mean whether key press should wake up HC if wake-up is enabled for the
>> keyboard device.
> 
> Yes, it should.  More specifically, if the keyboard is capable of 
> generating wakeup requests, and wakeup is enabled for both the keyboard 
> device and the HC, then the keyboard should be able to wake up the 
> system from suspend.  Some HCs or systems might not support this 
> capability, however.
> 
>>> I'm asking because wakeup works on a typical
>>> Intel hardware, but doesn't work on older Tegra SoCs that use Chipidea
>>> controller. It's not obvious to me whether this is something that
>>> firmware handles for Intel or it's broken on Tegra. Could you please
>>> clarify? If it should work for every HC, then I may try to take a closer
>>> look.
> 
> If the hardware/firmware can support it then it should work.  I don't 
> know what's going on with your older Tegra SoCs; it's possible there is 
> a bug in the driver.

I'll take a closer look then, thank you.
