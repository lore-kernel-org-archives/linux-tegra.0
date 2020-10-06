Return-Path: <SRS0=wvja=DN=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F36A6C4363D
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Oct 2020 20:39:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3F302087E
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Oct 2020 20:39:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="y+lasBva";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Kdu9Uo5Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727280AbgJFUjX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 6 Oct 2020 16:39:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727166AbgJFUjX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 6 Oct 2020 16:39:23 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 625DEC061755;
        Tue,  6 Oct 2020 13:39:22 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602016760;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=W13RXkAwMTllQhqWm5cq5BZE5nH6uHmGVcHK9GSn3ns=;
        b=y+lasBvaLUkuLHab5bkpdFiFeUtzZZkMAe0MxPseafS75HZSeZdZN+kymi6dFFQhKZE8VW
        qc4YvcR4WDd1//cfrfaBnkbFypqZk/QtRqz9DZvsgiv7QXhlnycxcB2xYbujy3EWoOOElY
        q69FX0eoD272W8M4mxPKAIOLXvd7sGMUJlPaA/xQfAoNdaNCVTQNkJC0J3x4FtpMJBhnq8
        Os8tzxF592SL6LmG6y8BBUPyOy70MBixUpq551uCnXoajQx0Cc6pZV5/R2R+NwWupaF01r
        ngTIFTL+iP5AAP2JTZh0eYTc2Nyhf/lod73UHMtQOt9GWFeG7lOyOgueN3WvXg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602016760;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=W13RXkAwMTllQhqWm5cq5BZE5nH6uHmGVcHK9GSn3ns=;
        b=Kdu9Uo5QYf3A/MyHqKY64fPOxUCAHdJsz+vmpNmY3CnKUZHAh/QD3Mj/dOOk2nryIArRRE
        eYsAfpW+lOuFYvBA==
To:     Marc Zyngier <maz@kernel.org>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Venkat Reddy Talla <vreddytalla@nvidia.com>,
        kernel-team@android.com
Subject: Re: [PATCH v2 1/4] genirq/irqdomain: Allow partial trimming of irq_data hierarchy
In-Reply-To: <20201006101137.1393797-2-maz@kernel.org>
References: <20201006101137.1393797-1-maz@kernel.org> <20201006101137.1393797-2-maz@kernel.org>
Date:   Tue, 06 Oct 2020 22:39:20 +0200
Message-ID: <87eemb6qdj.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Oct 06 2020 at 11:11, Marc Zyngier wrote:
> It appears that some HW is ugly enough that not all the interrupts
> connected to a particular interrupt controller end up with the same
> hierarchy repth (some of them are terminated early). This leaves

  depth?

> the irqchip hacker with only two choices, both equally bad:
>
> - create discrete domain chains, one for each "hierarchy depth",
>   which is very hard to maintain
>
> - create fake hierarchy levels for the shallow paths, leading
>   to all kind of problems (what are the safe hwirq values for these
>   fake levels?)
>
> Instead, let's offer the possibility to cut short a single interrupt

s/let's offer/implement/

> hierarchy, exactly representing the HW. This can only be done from
> the .alloc() callback, before mappings can be established.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  include/linux/irqdomain.h |  3 +++
>  kernel/irq/irqdomain.c    | 56 +++++++++++++++++++++++++++++++++++----
>  2 files changed, 54 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
> index b37350c4fe37..c6901c1bb981 100644
> --- a/include/linux/irqdomain.h
> +++ b/include/linux/irqdomain.h
> @@ -509,6 +509,9 @@ extern void irq_domain_free_irqs_parent(struct irq_domain *domain,
>  					unsigned int irq_base,
>  					unsigned int nr_irqs);
>  
> +extern int irq_domain_trim_hierarchy(unsigned int virq,
> +				     struct irq_domain *domain);
> +
>  static inline bool irq_domain_is_hierarchy(struct irq_domain *domain)
>  {
>  	return domain->flags & IRQ_DOMAIN_FLAG_HIERARCHY;
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index 76cd7ebd1178..d0adaeea70b6 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -1136,6 +1136,17 @@ static struct irq_data *irq_domain_insert_irq_data(struct irq_domain *domain,
>  	return irq_data;
>  }
>  
> +static void __irq_domain_free_hierarchy(struct irq_data *irq_data)
> +{
> +	struct irq_data *tmp;
> +
> +	while (irq_data) {
> +		tmp = irq_data;
> +		irq_data = irq_data->parent_data;
> +		kfree(tmp);
> +	}
> +}
> +
>  static void irq_domain_free_irq_data(unsigned int virq, unsigned int nr_irqs)
>  {
>  	struct irq_data *irq_data, *tmp;
> @@ -1147,14 +1158,49 @@ static void irq_domain_free_irq_data(unsigned int virq, unsigned int nr_irqs)
>  		irq_data->parent_data = NULL;
>  		irq_data->domain = NULL;
>  
> -		while (tmp) {
> -			irq_data = tmp;
> -			tmp = tmp->parent_data;
> -			kfree(irq_data);
> -		}
> +		__irq_domain_free_hierarchy(tmp);
>  	}
>  }
>  
> +/**
> + * irq_domain_trim_hierarchy - Trim the irq hierarchy from a particular
> + *			       irq domain
> + * @virq:	IRQ number to trim where the hierarchy is to be trimmed
> + * @domain:	domain from which the hierarchy gets discarded for this
> + *		interrupt
> + *
> + * Drop the partial irq_data hierarchy from @domain (included) onward.
> + *
> + * This is only meant to be called from a .alloc() callback, when no
> + * actual mapping in the respective domains has been established yet.
> + * Its only use is to be able to trim levels of hierarchy that do not
> + * have any real meaning for this interrupt.
> + */
> +int irq_domain_trim_hierarchy(unsigned int virq, struct irq_domain *domain)
> +{
> +	struct irq_data *tail, *irq_data = irq_get_irq_data(virq);
> +
> +	/* It really needs to be a hierarchy, and not a single entry */
> +	if (WARN_ON(!irq_data->parent_data))
> +		return -EINVAL;
> +
> +	/* Skip until we find the right domain */
> +	while (irq_data->parent_data && irq_data->parent_data->domain != domain)
> +		irq_data = irq_data->parent_data;
> +
> +	/* The domain doesn't exist in the hierarchy, which is pretty bad */
> +	if (WARN_ON(!irq_data->parent_data))
> +		return -ENOENT;
> +
> +	/* Sever the inner part of the hierarchy...  */
> +	tail = irq_data->parent_data;
> +	irq_data->parent_data = NULL;
> +	__irq_domain_free_hierarchy(tail);

This is butt ugly, really. Especially the use case where the tegra PMC
domain removes itself from the hierarchy from .alloc()

That said, I don't have a better idea either. Sigh...

Thanks,

        tglx


