Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA42C433F5
	for <linux-tegra@archiver.kernel.org>; Mon,  9 May 2022 15:56:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238635AbiEIQAQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 9 May 2022 12:00:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238698AbiEIQAL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 9 May 2022 12:00:11 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3E3D1F8C47
        for <linux-tegra@vger.kernel.org>; Mon,  9 May 2022 08:56:15 -0700 (PDT)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id C7645100009;
        Mon,  9 May 2022 15:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1652111773;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yAMAFi0FHRmHLtyYDK80duRA+mQU4mhgvhpT8ZJkgg8=;
        b=h/FYDNCNa3X5ObbSQUrINZaV09qsJ1ucS+74RklEh0ApC+1T0W6vGo7KEau8WAMm/45xGL
        KyUMIEk4ms8FpKT1tnXfrgAqbhPxfOkSZe/vA/hJYbh6lDUIAxSd2Hs6yemtNN4pRmyh4L
        aScXboHiaF/SotpzKTBreJMp1b6gXXlWG2/IGyDvQHtuQQcCJXGLXvKBIZHKIMdNDfmAef
        OiVLVRH4HhYO/2vUQOLhthZXFO564ScgPQuiq4o3Y/44JktwGQMkvokjupY+W/ITv0Az9K
        7gwSy1/nn1fdC1ge15zCJO1JJiUurT+LDg6w6IHDHwm8Rd6Tlfz7YC4AEsUXbQ==
Date:   Mon, 9 May 2022 17:56:10 +0200
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Mikko Perttunen <cyndis@kapsi.fi>
Cc:     linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
        dmitry.osipenko@collabora.com,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: Re: Tegra20 parallel video capture driver
Message-ID: <20220509175610.797f8505@melee>
In-Reply-To: <c13fe2a2-19df-0a61-9acf-3100202f238d@kapsi.fi>
References: <20220429184931.69591698@melee>
        <c13fe2a2-19df-0a61-9acf-3100202f238d@kapsi.fi>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Mikko, All,

as anticipated, here is another batch of questions that arose after the
(very appreciated!) feedback from Mikko.

Il giorno Thu, 5 May 2022 12:42:08 +0300
Mikko Perttunen <cyndis@kapsi.fi> ha scritto:
[...]
> > 1. Is there any good documentation on host1x, especially syncpt?  
> 
> There isn't much documentation, apart from what exists in the TRMs.
> But basically, syncpoints are an array of 32-bit unsigned integers in 
> hardware, with each 32-bit value having the following fundamental 
> operations:
> 
> * Increment by one, wrapping (i.e. mod 2^32)
> * Wait for value to reach threshold, such that if you consider the 32 
> bit unsigned integers a circle, then the half-circle preceding 
> (integer-wise) the threshold value are considered to be in the past
> and the half-circle succeeding are considered to be in the future.
> For example, if we specify threshold 0xffffffff then 0x0 is
> considered to be one increment in the future. Waits can be done
> either by HW stalling host1x channels (similar to DMA) or CPU
> interrupts.

Do you think the mainline host1x implementation is 100% compatible with
tegra20? So far I have been assuming that it is, but since my code flow
is now pretty much equal to the old 3.1 driver and I am not receiving
any syncpt events, I started wondering whether the syncpt calls with an
equivalent name really do the same thing or not. Specifically the 
nvhost_syncpt_wait_timeout_ext() in 3.1 looks to have the same
structure as host1x_syncpt_wait() in mainline, but I still haven't dung
into the very details to see if there is any subtle difference.

> > 4. I am currently working on a version of
> > tegra_channel_capture_frame() [1] for tegra20 VIP and other code
> > involving syncpt. The mainline driver calls many different
> > host1x_syncpt_*() functions, while the old driver does call very
> > few of them. Can anybody clarify the meaning of the various syncpt
> > calls?  
> 
> - request/put -- allocate and free syncpoint
> - incr/wait -- as described before
> - incr_max -- when syncpoint is used with host1x channels, used to 
> indicate to job tracking code how many times the job will increment
> the syncpoint. when not using channels, should not be used -- looks
> like the tegra210 code calls this a couple of times but it probably
> shouldn't be doing that.

As I understand it, for my own use case I should never call _incr as it
is what the VI hardware is supposed to do, and rather i should call
_wait to wait for that increment to happen. Coherently, this is what
the 3.1 driver does: it reads the syncpt value into a plain variable,
increments the variable, then calls _wait to wait the syncpt to reach
the same value as the variable.

But the mainline code the the tegra210 VI does many more syncpt calls
and it does not use a variable in the same way. It rather calls
host1x_syncpt_incr() and host1x_syncpt_incr_max() (which it shouldn't
call as you said) but I am not sure these calls achieve the same result.

Do you think the calls that exist in
drivers/staging/media/tegra-video/tegra210.c do make sense for tegra20
too?

> > 5. In tegra_channel_capture_frame() the call to host1x_syncpt_wait()
> >     always returns -EAGAIN. Where would you start to investigate the
> >     reason of this timeout?  
> 
> This means that the syncpoint's value did not reach the specified 
> threshold. Either the specified threshold is incorrect, or the engine 
> did not increment the syncpoint (or did not increment sufficient
> number of times), either because the syncpoint increment was not
> programmed correctly, or the condition for the increment was not
> fulfilled (i.e. the engine got stuck for whatever reason).
> 
> Apart from the wait, you can use
> /sys/kernel/debug/tegra-host1x/status to track syncpoint value. Apart
> from that, if you're not using channels, you'll just have to look at
> engine registers to see why it's not processing.

About the latest suggestion, which status register are you referring
to? Unfortunately the TRM I have does not document the VIP registers at
all, and the 3.1 driver does not use of them so it's impossible to
infer the bit meanings. Can you suggest any specific register that I
should check?


Another question is about the clocks. I tried to set them up as
similarly as possible to the working 3.1 code, but couldn't have them
identical.

The 3.1 kernel configures this way: 

  pll_c @ 600 MHZ --->     VI @ 150 MHz (/ 4)
  pll_p @ 216 MHZ ---> HOST1X @ 144 MHz (x 2 / 3) 

Mainline does not seem to be able to use a fractional divider for pll_p
to get 144 MHz from 216 MHz (if I ask for 144 i get 108), thus I
currently configured this way:

  pll_c @ 600 MHZ -+->     VI @ 150 MHz (/ 4)
                   `-> HOST1X @ 150 MHz (/ 4)

Do you think there would be any issues in clocking host1x at 150 MHz
instead of 144? 


One last quetion. About the VI configuration, in an attempt to getting
it working with the simplest possible setup I tried using an
interleaved format instead of multiplanar. This results in writing
format 3 instead of 6 in the low bits of
TEGRA_VI_VI_FIRST_OUTPUT_CONTROL. Do you think this may be a problem?


Kind regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
