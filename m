Return-Path: <SRS0=64AB=DP=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3735C43467
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 11:22:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52B072145D
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 11:22:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BoHx8+F2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Q+enYPn5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725966AbgJHLWi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Oct 2020 07:22:38 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:49996 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbgJHLWi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Oct 2020 07:22:38 -0400
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602156155;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=b6+lOlv1iwgaOYJSo0B4bAoDFZBDK2Xe5o6Luzef3Lk=;
        b=BoHx8+F2Jc247mGCaTP9Bpi2UfNR1qiiNjRlYM1D7nivnl6P8yyna+zV6d9XWdZNKmWcUM
        6s1r/DJqZYyRlwN66odfdx8a4zW1EoLkHs7cf3cWuRTzx7UIgLVGdp7jlMiMKba/j1yUvT
        6CeEBD6rzbmRJrfZXQNbymhHyp6TNCnnJKoD8o/6fVU7m1vAs1SSNCSiXpCzBuqj4chIWQ
        7sseCTxpIqnFxvdveCyx0WOsdWWdkDyRdWLG/RTJZ0eZpP8YX5ouiOYP1egkbGN5kZ2zsW
        nqHSWt2DoWrXP7lVXUxbpsugFHbrgwxWuKe6WMiKEhR7IEzIK+T+x+Qw6ybPeQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602156155;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=b6+lOlv1iwgaOYJSo0B4bAoDFZBDK2Xe5o6Luzef3Lk=;
        b=Q+enYPn5ITD2l0pill+t8nPwCu4NEfLJeB4vBS5U8ed363RD6htO77XrmpBcQnlWgPE0NI
        0SziIb5gmmIWafDA==
To:     Marc Zyngier <maz@kernel.org>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Venkat Reddy Talla <vreddytalla@nvidia.com>,
        kernel-team@android.com
Subject: Re: [PATCH v3 1/4] genirq/irqdomain: Allow partial trimming of irq_data hierarchy
In-Reply-To: <20201007124544.1397322-2-maz@kernel.org>
References: <20201007124544.1397322-1-maz@kernel.org> <20201007124544.1397322-2-maz@kernel.org>
Date:   Thu, 08 Oct 2020 13:22:35 +0200
Message-ID: <87d01t2c90.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Oct 07 2020 at 13:45, Marc Zyngier wrote:
> +/**
> + * irq_domain_trim_hierarchy - Trim the uninitialized part of a irq hierarchy
> + * @virq:	IRQ number to trim where the hierarchy is to be trimmed
> + *
> + * Drop the partial irq_data hierarchy from the level where the
> + * irq_data->chip is NULL.
> + *
> + * Its only use is to be able to trim levels of hierarchy that do not
> + * have any real meaning for this interrupt, and that the driver leaves
> + * uninitialized in its .alloc() callback.
> + */
> +static void irq_domain_trim_hierarchy(unsigned int virq)
> +{
> +	struct irq_data *tail, *irq_data = irq_get_irq_data(virq);
> +
> +	/* It really needs to be a hierarchy, and not a single entry */
> +	if (!irq_data->parent_data)
> +		return;
> +
> +	/* Skip until we find a parent irq_data without a populated chip */
> +	while (irq_data->parent_data && irq_data->parent_data->chip)
> +		irq_data = irq_data->parent_data;
> +
> +	/* All levels populated */
> +	if (!irq_data->parent_data)
> +		return;
> +
> +	pr_info("IRQ%d: trimming hierarchy from %s\n",
> +		virq, irq_data->parent_data->domain->name);
> +
> +	/* Sever the inner part of the hierarchy...  */
> +	tail = irq_data->parent_data;
> +	irq_data->parent_data = NULL;
> +	__irq_domain_free_hierarchy(tail);
> +}

I like that way more than the previous version, but there are still
quite some dangeroos waiting to bite.

Just for robustness sake we should do the following:

 Let the alloc() callback which decides to break the hierarchy tell the
 core code about it.  Conveying this through an error return might be
 tedious, but the alloc() callback should call:

static inline void irq_disconnect_hierarchy(struct irq_data *irqd)
{
    irqd->chip = ERR_PTR(-ENOTCONN);
}

to signal that this is intenionally the end of the hierarchy.

Then the above function would not only trim, but also sanity check the
hierarchy.

	trim = NULL;
        
        for (irqd = irq_data; irqd; irqd = irqd->parent_data) {
                  if (!irqd->chip && !trim)
                  	return -EINVAL;

		  if (trim && irqd->chip)
                  	return -EINVAL;
                 
                  if (IS_ERR(irqd->chip) {
                  	if (PTR_ERR(irqd->chip) != -ENOTCONN)
                        	return -EINVAL;
                        trim = irqd;
                  }
        }

        for (irqd = irq_data; trim && irqd; irqd = irqd->parent_data) {
        	if (trim == irqd->parent_data) {
                	irqd->parent_data = NULL;
                        free_stuff(trim);
                }
        }

	return 0;

or some less convoluted variant of it :)

That way we catch cases which do outright stupid crap and we let the
allocation fail which needs to be handled at the outmost caller anyway
instead of crashing later in the middle of the irq chip chain.

Thanks,

        tglx
