Return-Path: <SRS0=4r7m=DC=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D7DC4363D
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Sep 2020 13:21:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF1552399A
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Sep 2020 13:21:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEZna10+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728365AbgIYNVW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Sep 2020 09:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728121AbgIYNVW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Sep 2020 09:21:22 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1BFFC0613CE;
        Fri, 25 Sep 2020 06:21:21 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id b12so2760836lfp.9;
        Fri, 25 Sep 2020 06:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HSGaf1eGfw5tIztilXD8fvlle7SWUYGVsu5F+1o/XiE=;
        b=EEZna10+58DvlojMGo1TeKlWT6WjoHMAhd0OJFLVx2SF/7VD6C6y4Oy8IoTTWuYxK4
         PiT7gPA+chFaoJSFa5IH4+vwnYVVR9C6Deo4tX9FDZ/Tm/wypL0EEMa8TYHSzZ4ADRZm
         rZOqEZHofpSf/VfzEY3zkA7acZyOzOSKjx2i4cbpfvp+90cKqEdpPFzqzAJDiYMrE+eG
         QIwSBFSTHaN7Yb64ESK5zBDs1290HrqX2pFHMzXkszsxh9lL7iCVf4Z7rgIIkS+fnbAp
         R+7tkOli2jgkEZ/Tp0WBoAuypuzzrH8SaSin1iGBuMtuLuoDC8bjw9Yv55kPRWw5oTkw
         XHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HSGaf1eGfw5tIztilXD8fvlle7SWUYGVsu5F+1o/XiE=;
        b=QvTvOxX9+fJnGPDhFZ7/k+1fFRncpBSkdfZ9NRbcuViKp8fVEJsijPe3r1vyC8ESKk
         Z8reBuClK3xg+z63pUYILaPMtPKVS5zQEduuMN1joAMKwBJh8i8eQI/Ybh0Nbgyj66Af
         H/n+EpQqa0/7UCduDeKf8ppLpPY8Y5/Bi+hcEJeeWbFINsiK+ViZ5kTk4NwIi+rWgXYt
         Ei0yNFTw5/2PHlUbSxjSGuBsrmF+8lCk/ciw7qgMmjOvvLCD6nWBUI6dOtAed9TVWLpd
         a5sOw8sjBI1A/O+ro7Oal+ZP1HYzxCvcAbjSlErlDHmuBZ4EsYMUfd4rayTY5AbMt4RZ
         Aajg==
X-Gm-Message-State: AOAM530erqoCY780UBHcc08mZQBAhdDiPPeALaDGsJt/Fujs43GW6P6W
        mxGJmA40R0JUlHIUYRWEcMf3aaq2hlQ=
X-Google-Smtp-Source: ABdhPJy7rFSI4LluJaDLNquOaxpLE+A82l9X3D9ZLpwTjDfKunUJpoe/hTAG9P68Jq4PI26/OrtgEw==
X-Received: by 2002:ac2:491e:: with SMTP id n30mr1274466lfi.395.1601040079799;
        Fri, 25 Sep 2020 06:21:19 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id 82sm2247569lfo.173.2020.09.25.06.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2020 06:21:19 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] dt-bindings: reserved-memory: Document "active"
 property
To:     Robin Murphy <robin.murphy@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Will Deacon <will@kernel.org>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20200904130000.691933-1-thierry.reding@gmail.com>
 <d3d69cb4-b0f9-40b0-b526-52fdc1a4b876@gmail.com>
 <20200924140130.GA2527337@ulmo>
 <ba16b795-34df-8f8c-3376-3d629cc30f8b@gmail.com>
 <484b9e90-7395-6161-577c-4d3f3716997e@arm.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <70712ca4-8971-3af4-d0d0-b73788d6cfa9@gmail.com>
Date:   Fri, 25 Sep 2020 16:21:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <484b9e90-7395-6161-577c-4d3f3716997e@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

25.09.2020 15:39, Robin Murphy пишет:
...
>> IIRC, in the past Robin Murphy was suggesting to read out hardware state
>> early during kernel boot in order to find what regions are in use by
>> hardware.
> 
> I doubt I suggested that in general, because I've always firmly believed
> it to be a terrible idea. I've debugged too many cases where firmware or
> kexec has inadvertently left DMA running and corrupted kernel memory, so
> in general we definitely *don't* want to blindly trust random hardware
> state. Anything I may have said in relation to Qualcomm's fundamentally
> broken hypervisor/bootloader setup should not be considered outside that
> specific context ;)
> 
> Robin.
> 
>> I think it should be easy to do for the display controller since we
>> could check clock and PD states in order to decide whether DC's IO could
>> be accessed and then read out the FB pointer and size. I guess it should
>> take about hundred lines of code.

The active DMA is indeed very dangerous, but it's a bit less dangerous
in a case of read-only DMA.

I got another idea of how we could benefit from the active display
hardware. Maybe we could do the following:

1. Check whether display is active

2. Allocate CMA that matches the FB size

3. Create identity mapping for the CMA

4. Switch display framebuffer to our CMA

5. Create very early simple-framebuffer out of the CMA

6. Once Tegra DRM driver is loaded, it will kick out the simple-fb, and
thus, release temporal CMA and identity mapping.

This will provide us with a very early framebuffer output and it will
work on all devices out-of-the-box!
