Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCE6C433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 15:08:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 684D760F9F
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 15:08:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhJUPLB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Oct 2021 11:11:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbhJUPLA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Oct 2021 11:11:00 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6D8C0613B9;
        Thu, 21 Oct 2021 08:08:44 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id x192so915708lff.12;
        Thu, 21 Oct 2021 08:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LtOlMe2BJBUKpJxzc4iXO/flZXymfvUzSpBIinKoT5E=;
        b=S4PLppJgBV0lJcFpyaVZ2r6oUSDg8Nce0NKMB6IrUJZpRiI0opmsA3Hv9B/t5LAh/k
         2F0TYiutEaZ3zP8uvzFE/LIjBYRFaYFB7uXZpOhKlvDyZA4REVMq8sVsGbrh7YgLzZ+K
         4r8gs7ziomcw532uudc0xHjhHoCV+qWDyMrbODmRQ/GMBlnUTCwV/m7yb9DNuIZBqYaE
         dWYzWTq6jogdNXwGv71Nd2tmFgN/pNx709fvm6OMRmahSIQgCPPqo15Zx680jiJl4IdH
         5bEemwAxI0MW75gI+wVfN371+d02uASbZym7W0mpMDDiKIEDPqvugahJ89Rn2hPfxR30
         C17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LtOlMe2BJBUKpJxzc4iXO/flZXymfvUzSpBIinKoT5E=;
        b=Jss040FHuL26kKwuxf8lumdJTJVDIgwnFXulSKdPF+wkEda98TfYYgwFjGzWfDVxIg
         DESKlITMbAzajDpqTliUJdmR1VGC6Jk/1p4xGwEUWVFW6X0pEcEOY/Nwzbnv5csW3MpX
         tLdaEY4vXA/LRmYfsV8L+V+0fZMDun4gYEVbYUm9HbCZwkhuBzItE9TnBqAZQpybrcVw
         dEua2+OmcQuthgbKwSKqeUJMh8ztADZ5E8QtZKVoPlT/q1ERrMuCZLtRMmAbaMv8FsOp
         JxzcDWjF6FAGAQ3OBb1xXMtt4L5fVXABWu6IApupHPfwKNXWcyQasTsxNntCI70wD7tB
         Uc0w==
X-Gm-Message-State: AOAM531tZrZyaCDuNnaFpCZEzFQ1u+KQA4z1rKt8PmUnCtRXUeihHuRf
        BMU6NxnZ2VwI8CtEG9u1GdKf4a4n7/Q=
X-Google-Smtp-Source: ABdhPJx/qJNALzgwzRSkqgnYakmhhye4juv0fFcf+HjKFWeFMlgPCNae1cRhXDQBAPaKspYYPn9rNw==
X-Received: by 2002:a05:6512:3254:: with SMTP id c20mr4976988lfr.254.1634828922826;
        Thu, 21 Oct 2021 08:08:42 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-10.dynamic.spd-mgts.ru. [94.29.39.10])
        by smtp.googlemail.com with ESMTPSA id y32sm482726lfa.171.2021.10.21.08.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 08:08:42 -0700 (PDT)
Subject: Re: [PATCH v1] usb: xhci: tegra: Check padctrl interrupt presence in
 device tree
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Nicolas Chauvet <kwizart@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20211021115501.14932-1-digetx@gmail.com>
 <YXFyu+Q5ifG8Au9w@orome.fritz.box>
 <5f122caa-c810-534d-b2a1-53edef313ff0@gmail.com>
Message-ID: <32694811-8768-8e77-f188-4ed1a1fb93da@gmail.com>
Date:   Thu, 21 Oct 2021 18:08:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5f122caa-c810-534d-b2a1-53edef313ff0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

21.10.2021 17:57, Dmitry Osipenko пишет:
> It might be wrong to disable device_may_wakeup() because it will change
> the system suspend-resume behaviour, i.e. you won't be able to resume by
> USB event, see [1].
> 
> [1]
> https://elixir.bootlin.com/linux/v5.15-rc6/source/drivers/usb/host/xhci-tegra.c#L1962
> 
> Although, I'm not sure whether this is a correct behaviour to start
> with. Previously, before the offending commit, device_wakeup was never
> enabled for tegra-xusb. Commit message doesn't explain why wakeup is now
> enabled unconditionally, wakeup checks aren't needed at all then. This
> makes no sense, please check it with JC Kuo.

Although, wakeup could be disabled via sysfs, so it makes sense. Still
it's not clear whether it's a correct behaviour to enable wakeup during
system suspend by default. If it wakes machine from suspend when USB
device is plugged/unplugged, then it's a wrong behaviour.

