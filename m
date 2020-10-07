Return-Path: <SRS0=Z/5G=DO=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A372C4363D
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 12:55:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BE4D20870
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 12:55:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hKqmv7xx";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="W8HoIw88"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727927AbgJGMzA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Oct 2020 08:55:00 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:43442 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727253AbgJGMzA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Oct 2020 08:55:00 -0400
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602075298;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/2aBRJQoA+SZ1RobSyjfATDVrfPleqWvojs6D8gv+0c=;
        b=hKqmv7xx2Z1UX/j5vuvOOjtHme0lj1TX0tp36fsOVimMoQGBAI9Lk5NAGBXLSs0TIAfCIj
        mSo5fWO2yQNuwm+w53mrJfEQMczda5aybqvFd/RQ7dDo4c6M3EpLrK0VIMQE4Occ+s9U/J
        l97YFHdDFZqh/hBeJmvbzPZ+ic2SFkQ4DWcveHfjzvRNJ3TVi4Z3vbDpX1KnGKtlMIBUfv
        zgmvim4PXnEfuVivkihMAYCFk8Plh38VHpiYL8i9SAeNJVi2H0gGusZ03CDdD0bTFua9QD
        Im+3WdyNZBrGEMJUNqglKrC8gs73hs0bf3R8SbSnNScYJpBomcIAyhAbyOLqEQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602075298;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/2aBRJQoA+SZ1RobSyjfATDVrfPleqWvojs6D8gv+0c=;
        b=W8HoIw88be7z7t4VrcJogqPIsOOu7xYCRZ+LC89jZ5Qma5QsKq+XxoXe29M4h8qR0ikJIX
        lvQ6nzgB0wg7AZBQ==
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Venkat Reddy Talla <vreddytalla@nvidia.com>,
        kernel-team@android.com
Subject: Re: [PATCH v2 1/4] genirq/irqdomain: Allow partial trimming of irq_data hierarchy
In-Reply-To: <738593a42b62ea7905e4a680775cb996@kernel.org>
References: <20201006101137.1393797-1-maz@kernel.org> <20201006101137.1393797-2-maz@kernel.org> <87eemb6qdj.fsf@nanos.tec.linutronix.de> <10788c0d08fccbcbc1ac590a855e70d3@kernel.org> <738593a42b62ea7905e4a680775cb996@kernel.org>
Date:   Wed, 07 Oct 2020 14:54:57 +0200
Message-ID: <877ds25h7i.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Oct 07 2020 at 09:53, Marc Zyngier wrote:
> On 2020-10-07 09:05, Marc Zyngier wrote:
>> On 2020-10-06 21:39, Thomas Gleixner wrote:
>>> This is butt ugly, really. Especially the use case where the tegra PMC
>>> domain removes itself from the hierarchy from .alloc()
>> 
>> I don't disagree at all. It is both horrible and dangerous.
>> 
>> My preference would have been to split the PMC domain into discrete
>> domains, each one having having its own depth. But that's incredibly
>> hard to express in DT, and would break the combination of old/new
>> DT and kernel.

Moo.

>>> That said, I don't have a better idea either. Sigh...
>> 
>> A (very minor) improvement would be to turn the trim call in the PMC
>> driver into a flag set in the first invalid irq_data structure, and
>> let __irq_domain_alloc_irqs() do the dirty work.
>> 
>> Still crap, but at least would prevent some form of abuse. Thoughts?
>
> Actually, I wonder whether we can have a more general approach:
>
> A partial hierarchy that doesn't have an irq_data->chip pointer
> populated cannot be valid. So I wonder if the least ugly thing to do
> is to just drop any messing about in the PMC driver, and instead to
> let __irq_domain_alloc_irqs() do the culling, always, by looking for a
> NULL pointer in irq_data->chip.
>
> Not any less ugly, but at least doesn't need any driver intervention.

I like that approach.

Thanks,

        tglx
