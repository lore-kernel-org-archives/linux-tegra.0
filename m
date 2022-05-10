Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40872C4321E
	for <linux-tegra@archiver.kernel.org>; Tue, 10 May 2022 07:43:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232810AbiEJHrS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 10 May 2022 03:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237612AbiEJHqg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 May 2022 03:46:36 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34F141B79A
        for <linux-tegra@vger.kernel.org>; Tue, 10 May 2022 00:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=kA2mZMjvn8cd7Nn0JBnsHzSGe7VyjFVP5fpXK248Tls=; b=ml5NMcHRSdC/1M0WvAUr59+9bN
        m/+WH3IaY52q9imushOO0NuiqH4w56uPem9aW3RDBOywsUfyr8jH4ZFt5plU/bBqXn0Ej3hdlqOhk
        YrYvIfgNmdOP5oS0+KnGji2PPWqbXqVedVv+1qy+M7fsU9c1sRoHDQvgD67COirwEk0SH2ypxmpDO
        F+tNdPSPnGLFxA9WXzKC/L63fhdgvTlHZAWfZrdT2StY4wIfovm5QJOYJLAdyI6ap5ess4ImIc/Q7
        uYfZNY5/uuz9HWLlKhBxKhDWB7cgt2t/S+xk3qmz0xUoJpo4vIZ8rONUAvLc8kP4YnOREDxZaZJrI
        2VIZt11g==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1noKU7-0008N5-TT; Tue, 10 May 2022 10:40:43 +0300
Message-ID: <e37eddaa-3127-3de7-2860-93cbcee2bcf1@kapsi.fi>
Date:   Tue, 10 May 2022 10:40:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: Tegra20 parallel video capture driver
Content-Language: en-US
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc:     linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
        dmitry.osipenko@collabora.com,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
References: <20220429184931.69591698@melee>
 <c13fe2a2-19df-0a61-9acf-3100202f238d@kapsi.fi>
 <20220509175610.797f8505@melee>
From:   Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <20220509175610.797f8505@melee>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 5/9/22 18:56, Luca Ceresoli wrote:
> Hi Mikko, All,
> 
> as anticipated, here is another batch of questions that arose after the
> (very appreciated!) feedback from Mikko.
> 
> Il giorno Thu, 5 May 2022 12:42:08 +0300
> Mikko Perttunen <cyndis@kapsi.fi> ha scritto:
> [...]
>>> 1. Is there any good documentation on host1x, especially syncpt?
>>
>> There isn't much documentation, apart from what exists in the TRMs.
>> But basically, syncpoints are an array of 32-bit unsigned integers in
>> hardware, with each 32-bit value having the following fundamental
>> operations:
>>
>> * Increment by one, wrapping (i.e. mod 2^32)
>> * Wait for value to reach threshold, such that if you consider the 32
>> bit unsigned integers a circle, then the half-circle preceding
>> (integer-wise) the threshold value are considered to be in the past
>> and the half-circle succeeding are considered to be in the future.
>> For example, if we specify threshold 0xffffffff then 0x0 is
>> considered to be one increment in the future. Waits can be done
>> either by HW stalling host1x channels (similar to DMA) or CPU
>> interrupts.
> 
> Do you think the mainline host1x implementation is 100% compatible with
> tegra20? So far I have been assuming that it is, but since my code flow
> is now pretty much equal to the old 3.1 driver and I am not receiving
> any syncpt events, I started wondering whether the syncpt calls with an
> equivalent name really do the same thing or not. Specifically the
> nvhost_syncpt_wait_timeout_ext() in 3.1 looks to have the same
> structure as host1x_syncpt_wait() in mainline, but I still haven't dung
> into the very details to see if there is any subtle difference.
> 

It should be compatible. nvhost_syncpt_wait_timeout_ext is essentially 
the same as host1x_syncpt_wait.

>>> 4. I am currently working on a version of
>>> tegra_channel_capture_frame() [1] for tegra20 VIP and other code
>>> involving syncpt. The mainline driver calls many different
>>> host1x_syncpt_*() functions, while the old driver does call very
>>> few of them. Can anybody clarify the meaning of the various syncpt
>>> calls?
>>
>> - request/put -- allocate and free syncpoint
>> - incr/wait -- as described before
>> - incr_max -- when syncpoint is used with host1x channels, used to
>> indicate to job tracking code how many times the job will increment
>> the syncpoint. when not using channels, should not be used -- looks
>> like the tegra210 code calls this a couple of times but it probably
>> shouldn't be doing that.
> 
> As I understand it, for my own use case I should never call _incr as it
> is what the VI hardware is supposed to do, and rather i should call
> _wait to wait for that increment to happen. Coherently, this is what
> the 3.1 driver does: it reads the syncpt value into a plain variable,
> increments the variable, then calls _wait to wait the syncpt to reach
> the same value as the variable.

This is correct.

> 
> But the mainline code the the tegra210 VI does many more syncpt calls
> and it does not use a variable in the same way. It rather calls
> host1x_syncpt_incr() and host1x_syncpt_incr_max() (which it shouldn't
> call as you said) but I am not sure these calls achieve the same result.

Looks like it is only calling _incr in timeout situations. So if VI gets 
stuck, the driver does the increment. (I don't know if that's the best 
way to handle timeouts, but it's a way)

> 
> Do you think the calls that exist in
> drivers/staging/media/tegra-video/tegra210.c do make sense for tegra20
> too?

I would expect the general use of syncpoints to work for Tegra20 as 
well, but you might want to do something simpler as well.

> 
>>> 5. In tegra_channel_capture_frame() the call to host1x_syncpt_wait()
>>>      always returns -EAGAIN. Where would you start to investigate the
>>>      reason of this timeout?
>>
>> This means that the syncpoint's value did not reach the specified
>> threshold. Either the specified threshold is incorrect, or the engine
>> did not increment the syncpoint (or did not increment sufficient
>> number of times), either because the syncpoint increment was not
>> programmed correctly, or the condition for the increment was not
>> fulfilled (i.e. the engine got stuck for whatever reason).
>>
>> Apart from the wait, you can use
>> /sys/kernel/debug/tegra-host1x/status to track syncpoint value. Apart
>> from that, if you're not using channels, you'll just have to look at
>> engine registers to see why it's not processing.
> 
> About the latest suggestion, which status register are you referring
> to? Unfortunately the TRM I have does not document the VIP registers at
> all, and the 3.1 driver does not use of them so it's impossible to
> infer the bit meanings. Can you suggest any specific register that I
> should check?
> 

Sorry, it was just a general suggestion; I'm not very familiar with VI 
in general and Tegra20 VI not at all.

> 
> Another question is about the clocks. I tried to set them up as
> similarly as possible to the working 3.1 code, but couldn't have them
> identical.
> 
> The 3.1 kernel configures this way:
> 
>    pll_c @ 600 MHZ --->     VI @ 150 MHz (/ 4)
>    pll_p @ 216 MHZ ---> HOST1X @ 144 MHz (x 2 / 3)
> 
> Mainline does not seem to be able to use a fractional divider for pll_p
> to get 144 MHz from 216 MHz (if I ask for 144 i get 108), thus I
> currently configured this way:
> 
>    pll_c @ 600 MHZ -+->     VI @ 150 MHz (/ 4)
>                     `-> HOST1X @ 150 MHz (/ 4)
> 
> Do you think there would be any issues in clocking host1x at 150 MHz
> instead of 144?
> 

I would not expect it to be a problem although I don't know why it would 
be necessary to deviate from what upstream sets for host1x by default. 
VI clock (and possible other camera-related clocks) may be more precise 
though.

> 
> One last quetion. About the VI configuration, in an attempt to getting
> it working with the simplest possible setup I tried using an
> interleaved format instead of multiplanar. This results in writing
> format 3 instead of 6 in the low bits of
> TEGRA_VI_VI_FIRST_OUTPUT_CONTROL. Do you think this may be a problem?
> 

This field seems to correspond to various output frame formats. 3 seems 
to match YUV422 interleaved and 6 YUV420 planar, so I think that is 
working as expected.

Cheers,
Mikko

> 
> Kind regards,
> Luca
> 

