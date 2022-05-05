Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A17DC433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  5 May 2022 09:42:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346546AbiEEJpz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 5 May 2022 05:45:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346224AbiEEJpy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 5 May 2022 05:45:54 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5D6425C61
        for <linux-tegra@vger.kernel.org>; Thu,  5 May 2022 02:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=CIlyG+cynvgGzlk1qW4NeJ8fCaTnwWTo6QPfEG60rcs=; b=MISXOGQwiIjeWTXLNW1cz7o1/C
        xxiXO/ZP7twFsZrLH9NxGHCCYnR/refNCZNimxM3HapH7GXsG9TGRmGuaHUF2g1MBU77JE0yyDyWH
        jv7GrWhpX5nYbq3BFrGem9KgAWmhWYy5b2MF5gmX8QFh1GasqH5XCdvoq9cyvdqr0f9u8YviokqCG
        dOr4wJdy8Ph6rA0kxDZRARSayKTUiIcRvcjVwMNw2OVbZqSCKRtrSSnk7HNBW0xIddNmqITf9qOwU
        RjT3gdr8hoQYbyDmXkf6p2JCLdQmSw4oA8eJcEHN+pvrEcVwXLkanFLZMgjMGut12LkwvEblgJjqD
        zbvNUY0w==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1nmXzs-0008Uv-Na; Thu, 05 May 2022 12:42:08 +0300
Message-ID: <c13fe2a2-19df-0a61-9acf-3100202f238d@kapsi.fi>
Date:   Thu, 5 May 2022 12:42:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: Tegra20 parallel video capture driver
Content-Language: en-US
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-tegra@vger.kernel.org
Cc:     thierry.reding@gmail.com, dmitry.osipenko@collabora.com,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
References: <20220429184931.69591698@melee>
From:   Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <20220429184931.69591698@melee>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 4/29/22 19:49, Luca Ceresoli wrote:
> Hello,

Hi!

> 
> I am working to implement a driver for the Tegra20 camera
> interface (VI) and have it merged in mainline Linux. I have already
> done part of the work, but now I'm facing some difficulties, especially
> with respect to interaction with the syncpt feature of host1x. I have a
> few questions that hopefully someone here can reply to, but first let
> me lay some background.
> 
> First, the good news.
> 
> A good thing is I have an old reference image using a vendor kernel
> based on 3.1 which works and I can capture video from a parallel smart
> sensor in YUV. This is on a custom hardware.
> 
> Second, there is a (staging) video capture driver in mainline [0], but
> the huge delta between 3.1 and mainline makes the two drivers not
> trivial to compare.
> 
> Now to the bad news.
> 
> First, that the mainline driver only implements CSI input for
> tegra210 and I only have a parallel camera and a tegra20. The
> tegra20 documentation I have does not document parallel parallel video
> at all.
> 
> Second, the VI is heavily based on the host1x peripheral, and
> especially the Synchronization Point (syncpt) feature. Syncpts are also
> barely documented and I don't have any previous experience with this
> kind of device. And the syncpt (and perhaps host1x too) implementation
> in the vendor kernel vs mainline is very different.
> 
> And here's my status.
> 
> The mainline staging driver is already structured to support different
> SoCs, so I added tegra20 there, initially as a copy of tegra210. I did
> the same to add VIP (parallel input) support in addition to CSI. Then I
> filled the gaps as far as I could and now I have register access in the
> mainline driver that produces pretty much the same writes as the vendor
> kernel does, but it does so using the same driver structure that is in
> mainline, quite cleanly.
> 
> Now I am stuck at trying to understand how to make syncpt code work. As
> said the syncpt APIs are very different from what I see in the old
> vendor kernel. Thus I cannot try to do make the mainline driver behave
> like the old one. Moreover the mainline driver does many more calls to
> syncpt code than the old one does.
> 
> And finally here are some questions.
> 
> 1. Is there any good documentation on host1x, especially syncpt?

There isn't much documentation, apart from what exists in the TRMs. But 
basically, syncpoints are an array of 32-bit unsigned integers in 
hardware, with each 32-bit value having the following fundamental 
operations:

* Increment by one, wrapping (i.e. mod 2^32)
* Wait for value to reach threshold, such that if you consider the 32 
bit unsigned integers a circle, then the half-circle preceding 
(integer-wise) the threshold value are considered to be in the past and 
the half-circle succeeding are considered to be in the future. For 
example, if we specify threshold 0xffffffff then 0x0 is considered to be 
one increment in the future. Waits can be done either by HW stalling 
host1x channels (similar to DMA) or CPU interrupts.

> 
> 2. Is the VIP (parallel input) section of VI (video capture) for
>     Tegra20 documented anywhere?

If not in the TRM, then no.

> 
> 3. The old driver accesses the syncpt using fixed IDs from #defines (15
>     for VI, 16 for CSI), while the mainline driver uses IDs obtained at
>     runtime from host1x_syncpt_request(). Is it correct that one can use
>     any of the 32 available syncpts, and the old driver using fixed
>     values is just an implementation choice?

The old code used to have hard-coded syncpoint IDs for each use, but now 
we allocate dynamically. This is a global namespace so you need to call 
host1x_syncpt_request to get an ID that is not colliding with anyone else.

> 
> 4. I am currently working on a version of tegra_channel_capture_frame()
>     [1] for tegra20 VIP and other code involving syncpt. The mainline
>     driver calls many different host1x_syncpt_*() functions, while the
>     old driver does call very few of them. Can anybody clarify the
>     meaning of the various syncpt calls?

- request/put -- allocate and free syncpoint
- incr/wait -- as described before
- incr_max -- when syncpoint is used with host1x channels, used to 
indicate to job tracking code how many times the job will increment the 
syncpoint. when not using channels, should not be used -- looks like the 
tegra210 code calls this a couple of times but it probably shouldn't be 
doing that.

> 
> 5. In tegra_channel_capture_frame() the call to host1x_syncpt_wait()
>     always returns -EAGAIN. Where would you start to investigate the
>     reason of this timeout?

This means that the syncpoint's value did not reach the specified 
threshold. Either the specified threshold is incorrect, or the engine 
did not increment the syncpoint (or did not increment sufficient number 
of times), either because the syncpoint increment was not programmed 
correctly, or the condition for the increment was not fulfilled (i.e. 
the engine got stuck for whatever reason).

Apart from the wait, you can use /sys/kernel/debug/tegra-host1x/status 
to track syncpoint value. Apart from that, if you're not using channels, 
you'll just have to look at engine registers to see why it's not processing.

Cheers,
Mikko

> 
> I think it is enough for today, thank you in advance for any feedback!
> 
> [0]
> https://elixir.bootlin.com/linux/latest/source/drivers/staging/media/tegra-video
> 
> [1]
> https://elixir.bootlin.com/linux/v5.17.5/source/drivers/staging/media/tegra-video/tegra210.c#L325
> 
> Best regards.

