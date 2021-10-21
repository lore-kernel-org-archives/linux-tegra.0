Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE7BC433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 14:57:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AF2360FD9
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 14:57:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbhJUO7e (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Oct 2021 10:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbhJUO7d (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Oct 2021 10:59:33 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B522C0613B9;
        Thu, 21 Oct 2021 07:57:17 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id n7so400754ljp.5;
        Thu, 21 Oct 2021 07:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iErgHFWWUQOAckHSzae8UPIfuFCZ+UvmvzxxaxlRgls=;
        b=G+pDRmlnykJVzB6nL+U4P6Tca0kziP1yLkLFCubWaNpQhKY1FJpX+RvGB+3zfhq/Ew
         GQ8ijrmVtNKVZMVIDBNezu/ksNQXl16qv65nRis46lPnxCz9duesP2FpWfzv/bipgBum
         TFBBV7CqfDF3c5KQtPmbY6gdykSnLGd/UA2ggcBWRYRR7TZTvygQhb4ipufbjXMXeV55
         RpzOFY02g7zP4nESzlh0HUtyGGICgTgS3vbgeACwo75FYFjf0lobZCke1DqMSPw4LGsF
         fs6NPQR80iXvoRpRyFusJE9tfsWlM7h8qalNQpGPw5UMXandnWA2VBdxr5rzNg9bHj+M
         QD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iErgHFWWUQOAckHSzae8UPIfuFCZ+UvmvzxxaxlRgls=;
        b=pfdE6zbNWfPw8yBZyUwvIYI4QNaTpRG0F87XMKMK0z2Br2ojw0Na1fjCGI3s2xEjUi
         pqHYSZ0+XiYX548Fo2AlSZFDbluLWBP8Chq1CBLhj9yjxuXokwUCwAilBnLYwlic+iAW
         0nCp940t3KMpv5BtBv71/gR3WLfskkoLNyXdp++1K6OrdC7z17Gn8htYyzbuSwqZaOZo
         /dEu0VDQcS/S05hclmPRYSlrtEPMiGlbzExb6BFbcOxcrY1Uw7A+7d9eN46eALVWUzU7
         hXrxMn5zZ9rSZCi/MNC9mxIyL0jDwAiV+yO7s9q5SsXuIcdSycdsGsSGA6YwHP0KFnc9
         6Umw==
X-Gm-Message-State: AOAM530I3aivG9DDXHnqU7OgVjn4yh/H7koa6r3AjerK82rgTACdLDUt
        JFMaAAY7yDneVf5md38dYh7/9RYPl68=
X-Google-Smtp-Source: ABdhPJzlJb/0RgHtJcrzgSNYCcyj5067olyboKnot6+aBm5Ez23X456/nO32sFsrk/PJ53zgnXCTYA==
X-Received: by 2002:a2e:bf26:: with SMTP id c38mr6390259ljr.523.1634828235594;
        Thu, 21 Oct 2021 07:57:15 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-10.dynamic.spd-mgts.ru. [94.29.39.10])
        by smtp.googlemail.com with ESMTPSA id t19sm522167lfl.30.2021.10.21.07.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 07:57:15 -0700 (PDT)
Subject: Re: [PATCH v1] usb: xhci: tegra: Check padctrl interrupt presence in
 device tree
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5f122caa-c810-534d-b2a1-53edef313ff0@gmail.com>
Date:   Thu, 21 Oct 2021 17:57:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YXFyu+Q5ifG8Au9w@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

21.10.2021 17:01, Thierry Reding пишет:
> On Thu, Oct 21, 2021 at 02:55:01PM +0300, Dmitry Osipenko wrote:
>> Older device-trees don't specify padctrl interrupt and xhci-tegra driver
>> now fails to probe with -EINVAL using those device-trees. Check interrupt
>> presence and disallow runtime PM suspension if it's missing to fix the
>> trouble.
>>
>> Fixes: 971ee247060d ("usb: xhci: tegra: Enable ELPG for runtime/system PM")
>> Reported-by: Nicolas Chauvet <kwizart@gmail.com>
>> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

I now see that this was broken since 5.14 and not 5.15, so stable tag is
needed.

>> ---
>>  drivers/usb/host/xhci-tegra.c | 32 +++++++++++++++++++++-----------
>>  1 file changed, 21 insertions(+), 11 deletions(-)
> 
> Thanks for typing this up. A couple of minor comments below.
> 
>> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
>> index 1bf494b649bd..47927a1df3dc 100644
>> --- a/drivers/usb/host/xhci-tegra.c
>> +++ b/drivers/usb/host/xhci-tegra.c
>> @@ -1454,10 +1454,13 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>>  		goto put_padctl;
>>  	}
>>  
>> -	tegra->padctl_irq = of_irq_get(np, 0);
>> -	if (tegra->padctl_irq <= 0) {
>> -		err = (tegra->padctl_irq == 0) ? -ENODEV : tegra->padctl_irq;
>> -		goto put_padctl;
>> +	/* Older device-trees don't specify padctrl interrupt */
>> +	if (of_property_read_bool(np, "interrupts")) {
> 
> Can't we just rely on the return value from of_irq_get() instead of
> explicitly checking for the presence of the "interrupts" property? All
> we really want is to make this interrupt optional. As far as I can tell,
> of_irq_get() will return -EINVAL (via of_irq_parse_one() and then
> of_property_read_u32_index()) if the property doesn't exist, so I'd
> think it should be possible to turn this into something like this:
> 
> 	tegra->padctl_irq = of_irq_get(np, 0);
> 	if (tegra->padctl_irq == -EINVAL)
> 		tegra->padctl_irq = 0;

-EINVAL is a too ambiguous error code. If of_irq_get() explicitly
returned -ENOENT, then it would be a different story. It's wrong to rely
on -EINVAL, IMO.

>> +		tegra->padctl_irq = of_irq_get(np, 0);
>> +		if (tegra->padctl_irq <= 0) {
>> +			err = (tegra->padctl_irq == 0) ? -ENODEV : tegra->padctl_irq;
>> +			goto put_padctl;
>> +		}
>>  	}
>>  
>>  	tegra->host_clk = devm_clk_get(&pdev->dev, "xusb_host");
>> @@ -1696,11 +1699,15 @@ static int tegra_xusb_probe(struct platform_device *pdev)
>>  		goto remove_usb3;
>>  	}
>>  
>> -	err = devm_request_threaded_irq(&pdev->dev, tegra->padctl_irq, NULL, tegra_xusb_padctl_irq,
>> -					IRQF_ONESHOT, dev_name(&pdev->dev), tegra);
>> -	if (err < 0) {
>> -		dev_err(&pdev->dev, "failed to request padctl IRQ: %d\n", err);
>> -		goto remove_usb3;
>> +	if (tegra->padctl_irq) {
>> +		err = devm_request_threaded_irq(&pdev->dev, tegra->padctl_irq,
>> +						NULL, tegra_xusb_padctl_irq,
>> +						IRQF_ONESHOT, dev_name(&pdev->dev),
>> +						tegra);
>> +		if (err < 0) {
>> +			dev_err(&pdev->dev, "failed to request padctl IRQ: %d\n", err);
>> +			goto remove_usb3;
>> +		}
>>  	}
>>  
>>  	err = tegra_xusb_enable_firmware_messages(tegra);
>> @@ -2132,7 +2139,7 @@ static __maybe_unused int tegra_xusb_suspend(struct device *dev)
>>  		tegra->suspended = true;
>>  		pm_runtime_disable(dev);
>>  
>> -		if (device_may_wakeup(dev)) {
>> +		if (device_may_wakeup(dev) && tegra->padctl_irq) {
> 
> I wondered if perhaps there was a way to make device_may_wakeup() return
> false if we don't have that IRQ. Intuitively I would've thought that the
> calls to device_wakeup_enable() and device_init_wakeup() set this all up
> but after looking at the code I'm not sure if omitting them would
> actually cause device_may_wakeup() to return false. That would certainly
> be nicer than these double checks.

It might be wrong to disable device_may_wakeup() because it will change
the system suspend-resume behaviour, i.e. you won't be able to resume by
USB event, see [1].

[1]
https://elixir.bootlin.com/linux/v5.15-rc6/source/drivers/usb/host/xhci-tegra.c#L1962

Although, I'm not sure whether this is a correct behaviour to start
with. Previously, before the offending commit, device_wakeup was never
enabled for tegra-xusb. Commit message doesn't explain why wakeup is now
enabled unconditionally, wakeup checks aren't needed at all then. This
makes no sense, please check it with JC Kuo.

>>  			if (enable_irq_wake(tegra->padctl_irq))
>>  				dev_err(dev, "failed to enable padctl wakes\n");
>>  		}
>> @@ -2161,7 +2168,7 @@ static __maybe_unused int tegra_xusb_resume(struct device *dev)
>>  		return err;
>>  	}
>>  
>> -	if (device_may_wakeup(dev)) {
>> +	if (device_may_wakeup(dev) && tegra->padctl_irq) {
>>  		if (disable_irq_wake(tegra->padctl_irq))
>>  			dev_err(dev, "failed to disable padctl wakes\n");
>>  	}
>> @@ -2179,6 +2186,9 @@ static __maybe_unused int tegra_xusb_runtime_suspend(struct device *dev)
>>  	struct tegra_xusb *tegra = dev_get_drvdata(dev);
>>  	int ret;
>>  
>> +	if (!tegra->padctl_irq)
>> +		return -EOPNOTSUPP;
>> +
> 
> Similarly, couldn't we enable all that runtime PM stuff conditionally so
> that these functions would only ever get called when runtime PM is
> actually available? That seems a bit nicer than having this return
> -EOPNOTSUPP.

That should be a bigger change and we will need to re-test it all again.
I don't have hardware for testing.

I can delegate this patch to you. Otherwise I will prefer to stick with
the current variant. Alternatively, you can make another change on top
of this patch later on.
