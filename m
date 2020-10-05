Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B03DC4363A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 13:06:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCB86207BC
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 13:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601903201;
	bh=RPyoRkGcSIwCw/JC5a1gyC2ZdvAZhruEz6S7VcUnUd0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=PTF1KyhJDaZ5MklHglwNVDfrl5IdQODFSk/eZAQS0/qMubxMLeUthsnC3SLBIy3sc
	 OGd5x1B65DzNlv/sM55wilkrRP5oerXQ8JeU92ZcN2jIPbGq7jDKWvud95As3YywSG
	 BTH+C2UV/+1hkVdllAjoJeWjpl0SWE4NYBZmhxe0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725983AbgJENGl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 09:06:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:58278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725982AbgJENGk (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 5 Oct 2020 09:06:40 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CCEF42074F;
        Mon,  5 Oct 2020 13:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601903199;
        bh=RPyoRkGcSIwCw/JC5a1gyC2ZdvAZhruEz6S7VcUnUd0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=F0c9qkT7rPBmxbCG4hUsilQQSlj/yIKOVGDR2x20MYkTe35IMwaqM5dLyIxiKdFc5
         CX9uQZv6NMT81YkyvpGR7Njf0H06umzwtVeDtTaThtwzbu9RiwHFBlZ+eVLUzdYvBK
         gldqT8zg9FjqLAQoQpM74zRpJcKP0YUjHKGXZouA=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kPQCL-00HNFd-R0; Mon, 05 Oct 2020 14:06:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 05 Oct 2020 14:06:37 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Venkat Reddy Talla <vreddytalla@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>, kernel-team@android.com
Subject: Re: [PATCH 0/3] soc/tegra: Prevent the PMC driver from corrupting
 interrupt routing
In-Reply-To: <20201005112217.GR425362@ulmo>
References: <20201005111443.1390096-1-maz@kernel.org>
 <20201005112217.GR425362@ulmo>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <da38356394b63e2210f0e52d2e9bdc60@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: thierry.reding@gmail.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com, digetx@gmail.com, skomatineni@nvidia.com, vreddytalla@nvidia.com, tglx@linutronix.de, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2020-10-05 12:22, Thierry Reding wrote:
> On Mon, Oct 05, 2020 at 12:14:40PM +0100, Marc Zyngier wrote:
>> Jon recently reported that one of the Tegra systems (Jetson TX2, aka
>> tegra186) stopped booting with the introduction of the "IPI as IRQs"
>> series. After a few weeks of head scratching and complete puzzlement,
>> I obtained a board and started looking at what was happening.
>> 
>> The interrupt hierarchy looks like this:
>> 
>> 	[DEVICE] -A-> [PMC] -B-> [GIC]
>> 
>> which seems simple enough. However, not all the devices attached to
>> the PMC follow this hierarchy, and in some cases, the 'B' link isn't
>> present in the HW. In other cases, neither 'A' nor 'B' are present.
>> And yet the PMC driver creates such linkages using random hwirq values
>> for the non-existent links, potentially overriding existing mappings
>> in the process. "What could possibly go wrong?"
> 
> Yes, that would've been my fault. It seemed like the right thing to do
> at the time, but the way you describe it makes it obvious that it was
> not. I can't say I understand why this would've worked prior to the
> rework that made this surface, though.

Because until these IPI patches, the range 0-7 never ever appeared
as actual hwirqs in the GIC domain. SGIs were handled in the GIC
code, behind the core kernel's back. As soon as we start using
an actual domain mapping for hwirq 0, the PMC driver starts messing
with it.

>> It turns out that for the 'B' link, the PMC driver uses hwirq 0, which
>> is SGI0 for the GIC, and used as the rescheduling IPI. Obviously, this
>> doesn't go very well, nor very far, as the IPI gets routed to random
>> drivers. Also, as the handling flow has been overridden, this
>> interrupt never gets deactivated and can't fire anymore. Yes, this is
>> bad.
>> 
>> The 'A' link is less problematic, but the hwirq value is still out of
>> the irqdomain range, and gets remapped every time a new 'A'-less
>> driver comes up.
>> 
>> Instead, let's trim the unused hierarchy levels as needed. This
>> requires some checks in the upper levels of the hierarchy as we now
>> have optional levels, but this looks a lot saner than what we
>> currently have. With this, tegra186 is back booting on -next.
>> 
>> I haven't tested any wake-up stuff, nor any other nvidia system (this
>> is the only one I have). If people agree to these changes, I can take
>> them via the irqchip tree so that they make it into the next merge
>> window.
> 
> Yeah, it sounds like this needs to go in ideally before the rework that
> caused this to surface in order to preserve bisectibility. But if it
> goes in afterwards that's probably fine as well.

It's easy to take it as part of the same pull request as the IPI
stuff. Not fully bisectable for this platform, but close enough.
I may even be able to merge this in *before* the IPI patches
(I'd need to rebuild irq/irqchip-next, but that won't alter the commit
ids of the individual patches as they are on separate branches).

> Let Jon and myself do a bit of testing with this to verify that the 
> wake
> up paths are still working.

Sure. Let me know what you find.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
