Return-Path: <SRS0=Z/5G=DO=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B06C4363C
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 08:05:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66D952083B
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 08:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602057939;
	bh=qSgDO/KF1PkgYuOLLQdWJ8Ae8ug3/f7wzPW5vva4H1E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=IcSN3WcJWY01+zOlbS4r/hPIrplpOlM0YjxpuDBtn99tAIdQ12k/rCbsQf5JXS2cf
	 eGB/HbwHKsDQViJ7TABDdpSpWtwcwfFmze7zToTwO8kv0L2ypfmXhVKlXCWQi4hbHx
	 K1vDIrgmRc5psCS3Yz+a8qjo+943Vd78puA5+FuI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbgJGIFi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Oct 2020 04:05:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:59366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726041AbgJGIFi (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 7 Oct 2020 04:05:38 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 691F42076C;
        Wed,  7 Oct 2020 08:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602057937;
        bh=qSgDO/KF1PkgYuOLLQdWJ8Ae8ug3/f7wzPW5vva4H1E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=yZsHLsXpN5Jwt3RVPi2o2roe4CmqWmEzWxtUjFpy6HhUqcC6FHSabw/mvacXdmP7M
         ie6GlFzTrw/DAjNeJdQz30TZAW2X2ZmDwBKKtg4gpvaTVhlh4ee6qDPd5UzTwo/Rq5
         nWNh4bnHthFMgoxuP02WPmnTY54gdbOjD9vKYXGk=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kQ4S7-000I86-BD; Wed, 07 Oct 2020 09:05:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 07 Oct 2020 09:05:34 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Venkat Reddy Talla <vreddytalla@nvidia.com>,
        kernel-team@android.com
Subject: Re: [PATCH v2 1/4] genirq/irqdomain: Allow partial trimming of
 irq_data hierarchy
In-Reply-To: <87eemb6qdj.fsf@nanos.tec.linutronix.de>
References: <20201006101137.1393797-1-maz@kernel.org>
 <20201006101137.1393797-2-maz@kernel.org>
 <87eemb6qdj.fsf@nanos.tec.linutronix.de>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <10788c0d08fccbcbc1ac590a855e70d3@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: tglx@linutronix.de, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, skomatineni@nvidia.com, vreddytalla@nvidia.com, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2020-10-06 21:39, Thomas Gleixner wrote:
> On Tue, Oct 06 2020 at 11:11, Marc Zyngier wrote:
>> It appears that some HW is ugly enough that not all the interrupts
>> connected to a particular interrupt controller end up with the same
>> hierarchy repth (some of them are terminated early). This leaves
> 
>   depth?
> 
>> the irqchip hacker with only two choices, both equally bad:
>> 
>> - create discrete domain chains, one for each "hierarchy depth",
>>   which is very hard to maintain
>> 
>> - create fake hierarchy levels for the shallow paths, leading
>>   to all kind of problems (what are the safe hwirq values for these
>>   fake levels?)
>> 
>> Instead, let's offer the possibility to cut short a single interrupt
> 
> s/let's offer/implement/

Thanks for that, I'll fix it locally.

[...]

> This is butt ugly, really. Especially the use case where the tegra PMC
> domain removes itself from the hierarchy from .alloc()

I don't disagree at all. It is both horrible and dangerous.

My preference would have been to split the PMC domain into discrete
domains, each one having having its own depth. But that's incredibly
hard to express in DT, and would break the combination of old/new
DT and kernel.

> That said, I don't have a better idea either. Sigh...

A (very minor) improvement would be to turn the trim call in the PMC 
driver into
a flag set in the first invalid irq_data structure, and let 
__irq_domain_alloc_irqs()
do the dirty work.

Still crap, but at least would prevent some form of abuse. Thoughts?

         M.
-- 
Jazz is not dead. It just smells funny...
