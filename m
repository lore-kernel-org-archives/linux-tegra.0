Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 004A5C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  5 May 2022 15:32:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354598AbiEEPf7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 5 May 2022 11:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbiEEPfy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 5 May 2022 11:35:54 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7C5658E74
        for <linux-tegra@vger.kernel.org>; Thu,  5 May 2022 08:32:13 -0700 (PDT)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 27219240008;
        Thu,  5 May 2022 15:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1651764732;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TuRtfewerCWm4nX16I3niqXrwLVgtJ3TfPWEsCZ0Npo=;
        b=MMtaKQixe5O0bIFhV0qIAAr5IVi8c8s0vZe+OJRf26/tLy0evGpd/EHtslBKDniFKSl9BD
        3/AlsV7q09OtEwp0y5RB++NWnW7oEekfGOWIqqAZwmYlCl5As2y0kDS6xxDlRRp5lzGkgG
        7kXNy24UM1e8Lp0mtqmz8848FlKo4e+GcO+D/aOFQuSNClk3OYZqXaZkl176NsP7IeBZyF
        yvZVZB28ONkO9DUkuRv5ejDXvpX9WfsEUL2mqxp065GizAzKF1wzIbMb7/x6lP4DyauwzM
        +ZR/5DeD7GPymiamjixgTCKt2+Bd3Ww8mtPGBvjBqnTWTxRABpwAZbKYYUB69g==
Date:   Thu, 5 May 2022 17:32:09 +0200
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Mikko Perttunen <cyndis@kapsi.fi>
Cc:     linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
        dmitry.osipenko@collabora.com,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: Re: Tegra20 parallel video capture driver
Message-ID: <20220505173209.5adb2427@melee>
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

Hi Mikko,

Il giorno Thu, 5 May 2022 12:42:08 +0300
Mikko Perttunen <cyndis@kapsi.fi> ha scritto:

> On 4/29/22 19:49, Luca Ceresoli wrote:
> > Hello,  
> 
> Hi!
> 
> > 
> > I am working to implement a driver for the Tegra20 camera
> > interface (VI) and have it merged in mainline Linux. I have already
> > done part of the work, but now I'm facing some difficulties,
> > especially with respect to interaction with the syncpt feature of
> > host1x. I have a few questions that hopefully someone here can
> > reply to, but first let me lay some background.
> > 
> > First, the good news.
> > 
> > A good thing is I have an old reference image using a vendor kernel
> > based on 3.1 which works and I can capture video from a parallel
> > smart sensor in YUV. This is on a custom hardware.
> > 
> > Second, there is a (staging) video capture driver in mainline [0],
> > but the huge delta between 3.1 and mainline makes the two drivers
> > not trivial to compare.
> > 
> > Now to the bad news.
> > 
> > First, that the mainline driver only implements CSI input for
> > tegra210 and I only have a parallel camera and a tegra20. The
> > tegra20 documentation I have does not document parallel parallel
> > video at all.
> > 
> > Second, the VI is heavily based on the host1x peripheral, and
> > especially the Synchronization Point (syncpt) feature. Syncpts are
> > also barely documented and I don't have any previous experience
> > with this kind of device. And the syncpt (and perhaps host1x too)
> > implementation in the vendor kernel vs mainline is very different.
> > 
> > And here's my status.
> > 
> > The mainline staging driver is already structured to support
> > different SoCs, so I added tegra20 there, initially as a copy of
> > tegra210. I did the same to add VIP (parallel input) support in
> > addition to CSI. Then I filled the gaps as far as I could and now I
> > have register access in the mainline driver that produces pretty
> > much the same writes as the vendor kernel does, but it does so
> > using the same driver structure that is in mainline, quite cleanly.
> > 
> > Now I am stuck at trying to understand how to make syncpt code
> > work. As said the syncpt APIs are very different from what I see in
> > the old vendor kernel. Thus I cannot try to do make the mainline
> > driver behave like the old one. Moreover the mainline driver does
> > many more calls to syncpt code than the old one does.
> > 
> > And finally here are some questions.
> > 
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
> 
> > 
> > 2. Is the VIP (parallel input) section of VI (video capture) for
> >     Tegra20 documented anywhere?  
> 
> If not in the TRM, then no.
> 
> > 
> > 3. The old driver accesses the syncpt using fixed IDs from #defines
> > (15 for VI, 16 for CSI), while the mainline driver uses IDs
> > obtained at runtime from host1x_syncpt_request(). Is it correct
> > that one can use any of the 32 available syncpts, and the old
> > driver using fixed values is just an implementation choice?  
> 
> The old code used to have hard-coded syncpoint IDs for each use, but
> now we allocate dynamically. This is a global namespace so you need
> to call host1x_syncpt_request to get an ID that is not colliding with
> anyone else.
> 
> > 
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
> 
> > 
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

Thank you very much! I appreciate a lot your feedback and it will be
helpful for my advancement. I will probably come back with more
questions later on.

Best regards.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
