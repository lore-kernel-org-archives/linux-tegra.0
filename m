Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC6DC433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 17:13:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A44E261A53
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 17:13:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbhJURQJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Oct 2021 13:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhJURQJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Oct 2021 13:16:09 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA6A9C061764;
        Thu, 21 Oct 2021 10:13:52 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id g8so1030669ljn.4;
        Thu, 21 Oct 2021 10:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=96WBkxoUptT3TV/jkpnP+aB9lU2nJWK5JmSeLx6qqyA=;
        b=LDhbyEgjDEOTndpAxIHsyJYp2EKe9K7jA2YiqNJCuqJ05KMS8FSrpcPy6svazKkepb
         N5d67o7qajsPJzRCpDrEojLHgPvxzRv67s5MUumsM6/aHnuf4/fCWIY1L+lKNXO2AIk/
         emDNd8Zfx50VYOEwEFxxDh4LcutszVrjKDbpfEAop31Wi7fiJKT/y7HSzitMaEDFPsui
         P0f8kxYBfBaK9f7WWlJeoFpG+YuD3KJUXmsK29FVWBCH+agaSI0arsbHMJd0UKvqrh8o
         9OdrgzGRWqwFMH1KdxSoWMt+mw1yuU7+RXzfCr4P7Z7vxE5/WuQjUV+C8SAXMo85z4pk
         RUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=96WBkxoUptT3TV/jkpnP+aB9lU2nJWK5JmSeLx6qqyA=;
        b=W4TQMJ5iRyde8duBsbSCvp0F2yxzZ3QIUFmSS7+4DMhU9sGv+XXgmi1fsOywKSkiHQ
         q4Hkfc6rfWw0rSA5sDPSswneh3LLD3G9i9zFkxU/ZWazZjh+7noi/VnjCWL8297+lA1k
         aeMF/CCSYWYyga9mCIfMs7q0yBcu+lKA+PtezVtwI7BiGXX3WK4AUNpiSrYU3vosP0WG
         oQtS/r6s1qBOIMb6zIm6U8TyxsHPWApNpAzH+5oLWrewxBPyBMwZ+stXDvVSdyDwZtzx
         +hjQMDex/JVLHWxfLLIGd6+5t2EQEZxMVQiXf4s3GAVVULXAZCUDe69UiXcLJjN5EAWO
         gS5Q==
X-Gm-Message-State: AOAM532RYMZWSNKh3loFC9hToePyHAfFUFN1TxbnFDumoMC0nK87E/cf
        nB+asGEs5scFdUcVkcQqMkGN2R6UX5o=
X-Google-Smtp-Source: ABdhPJyEPMlIy1p0rgev8jiwr+W4tqlsiJp+mea2o4S56KC/37dCJTXnfRzbk0026ODrjO+AIntx+w==
X-Received: by 2002:a05:651c:b22:: with SMTP id b34mr7183762ljr.62.1634836430970;
        Thu, 21 Oct 2021 10:13:50 -0700 (PDT)
Received: from [192.168.2.145] (46-138-115-62.dynamic.spd-mgts.ru. [46.138.115.62])
        by smtp.googlemail.com with ESMTPSA id b16sm611278ljo.23.2021.10.21.10.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 10:13:50 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <82a02e70-33bc-7faf-e085-a25884e48844@gmail.com>
Date:   Thu, 21 Oct 2021 20:13:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211021152028.GB1161262@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

21.10.2021 18:20, Alan Stern пишет:
> On Thu, Oct 21, 2021 at 06:08:41PM +0300, Dmitry Osipenko wrote:
>> 21.10.2021 17:57, Dmitry Osipenko пишет:
>>> It might be wrong to disable device_may_wakeup() because it will change
>>> the system suspend-resume behaviour, i.e. you won't be able to resume by
>>> USB event, see [1].
>>>
>>> [1]
>>> https://elixir.bootlin.com/linux/v5.15-rc6/source/drivers/usb/host/xhci-tegra.c#L1962
>>>
>>> Although, I'm not sure whether this is a correct behaviour to start
>>> with. Previously, before the offending commit, device_wakeup was never
>>> enabled for tegra-xusb. Commit message doesn't explain why wakeup is now
>>> enabled unconditionally, wakeup checks aren't needed at all then. This
>>> makes no sense, please check it with JC Kuo.
>>
>> Although, wakeup could be disabled via sysfs, so it makes sense. Still
>> it's not clear whether it's a correct behaviour to enable wakeup during
>> system suspend by default. If it wakes machine from suspend when USB
>> device is plugged/unplugged, then it's a wrong behaviour.
> 
> It depends on the details of how the device works.  In most cases we do 
> want to enable wakeup by default for host controller devices.  The 
> reason is simple enough: If some USB device attached to the HC is 
> enabled for wakeup and sends a wakeup request, we don't want the request 
> to get lost because the HC isn't allowed to forward the request on to 
> the CPU.
> 
> But we do not want to enable wakeup for root hubs.  In particular, we 
> don't want to wake up a suspended system merely because a USB device has 
> been plugged or unplugged.
> 
> Clearly this arrangement depends on the hardware making a distinction 
> between wakeup requests originating from the root hub and those simply 
> passing through the HC.

Should USB keyboard be able to wake up every HC or it's a
machine-specific feature? I'm asking because wakeup works on a typical
Intel hardware, but doesn't work on older Tegra SoCs that use Chipidea
controller. It's not obvious to me whether this is something that
firmware handles for Intel or it's broken on Tegra. Could you please
clarify? If it should work for every HC, then I may try to take a closer
look.
