Return-Path: <SRS0=Z/5G=DO=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F31C4363D
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 12:24:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E18920789
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 12:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602073442;
	bh=Q3pIt73eh4sd4LL4/+WGztH/CUwDYXD/xhuKYEwDv40=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=fAJvguJJtQUYrWkkJG4ybnHJrUu5IWOC75JKOgy5WSCpv0yuD0wVmyUQDk+0I1w1F
	 h0bbLyKT8gr18o4DkMRlxXmu8ALWqYRqUeksgJke/MCAZHdygMLFedbbKiDBDK5cyr
	 2Z8fnHGxOC4bJBTqIAaDaDJ5smd+3z7nS93UgJ1w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728222AbgJGMYB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Oct 2020 08:24:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:43604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728207AbgJGMYB (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 7 Oct 2020 08:24:01 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 33B02206D9;
        Wed,  7 Oct 2020 12:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602073440;
        bh=Q3pIt73eh4sd4LL4/+WGztH/CUwDYXD/xhuKYEwDv40=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lSGykKvm91oG2fFwwcYo4YZiaUplkGPO8iH54eaHNS7INNj1YrW8z5cm2Ng/tWs6t
         k6WhANcx1HAQvWXX6U55da5wT0ne3BwOjZci+RuKjFllktzo055y/vBvUabTIDCJgp
         UQw2hSYBJrhJ1SJYycLwdkFfYpZJfgeE2Rkwvpac=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kQ8UA-000Ljy-7j; Wed, 07 Oct 2020 13:23:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 07 Oct 2020 13:23:58 +0100
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
In-Reply-To: <738593a42b62ea7905e4a680775cb996@kernel.org>
References: <20201006101137.1393797-1-maz@kernel.org>
 <20201006101137.1393797-2-maz@kernel.org>
 <87eemb6qdj.fsf@nanos.tec.linutronix.de>
 <10788c0d08fccbcbc1ac590a855e70d3@kernel.org>
 <738593a42b62ea7905e4a680775cb996@kernel.org>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <02226efd42fdb249b81c01eb702100e9@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: tglx@linutronix.de, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, skomatineni@nvidia.com, vreddytalla@nvidia.com, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2020-10-07 09:53, Marc Zyngier wrote:
> On 2020-10-07 09:05, Marc Zyngier wrote:
>> On 2020-10-06 21:39, Thomas Gleixner wrote:

[...]

>>> This is butt ugly, really. Especially the use case where the tegra 
>>> PMC
>>> domain removes itself from the hierarchy from .alloc()
>> 
>> I don't disagree at all. It is both horrible and dangerous.
>> 
>> My preference would have been to split the PMC domain into discrete
>> domains, each one having having its own depth. But that's incredibly
>> hard to express in DT, and would break the combination of old/new
>> DT and kernel.
>> 
>>> That said, I don't have a better idea either. Sigh...
>> 
>> A (very minor) improvement would be to turn the trim call in the PMC 
>> driver into
>> a flag set in the first invalid irq_data structure, and let
>> __irq_domain_alloc_irqs() do the dirty work.
>> 
>> Still crap, but at least would prevent some form of abuse. Thoughts?
> 
> Actually, I wonder whether we can have a more general approach:
> 
> A partial hierarchy that doesn't have an irq_data->chip pointer 
> populated
> cannot be valid. So I wonder if the least ugly thing to do is to just 
> drop
> any messing about in the PMC driver, and instead to let
> __irq_domain_alloc_irqs()
> do the culling, always, by looking for a NULL pointer in 
> irq_data->chip.
> 
> Not any less ugly, but at least doesn't need any driver intervention.

[still talking to myself...]

I implemented that, and it has the advantage of placing the hack in a
single location. It even booted on a garden variety of systems.

I'll post an updated series, and we can compare the various levels
of ugliness.

         M.
-- 
Jazz is not dead. It just smells funny...
