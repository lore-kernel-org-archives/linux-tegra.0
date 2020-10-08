Return-Path: <SRS0=64AB=DP=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08756C433E7
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 20:47:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E09A21D46
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 20:47:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mVatBHQT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TcCSHBic"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729038AbgJHUrc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Oct 2020 16:47:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728761AbgJHUrc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Oct 2020 16:47:32 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1A17C0613D2;
        Thu,  8 Oct 2020 13:47:31 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602190050;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iiaErFV8vUPjfSMV4QXyaucD9eHsxzFC7I2SjbXl5a4=;
        b=mVatBHQTVT62zuHjje2wR6juvJY9kXVWSYFI/w+0SIrhknNDVRkLnb/fpb19OkNjLnDgEI
        GafO5PFkpnKlzPAbp7M5ldrS+ui///1l7dsffET13kTUAlGpjyKC0kRLDDPTOG3TpDx7ml
        ssI+pHlmKMxVvnirNU3Ev2gpiVwuKdNV27HXrNuuhu/R2SYQuCu5eP13o/wiOxJpdSpV3K
        GstHKFBkdwC292KEY340NyOqpy/QVH7cz+9OqC3OWDCYLiYvs8sw0H3XHBxLrTywTv3Ab7
        D0xLF5QmgbaGKEcSw/IQRCQ6NPtZIdRXmk5B367q5XWFDQfaLlyLG0tGoDiGFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602190050;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iiaErFV8vUPjfSMV4QXyaucD9eHsxzFC7I2SjbXl5a4=;
        b=TcCSHBicqi/QRK5K3vQxF+K7Y2PJYMdEp0cRPXAVUJ1PIRcnCwn0N2+6yJjDL4JK+XWV7j
        q8RFXMAb0R/q94DQ==
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Venkat Reddy Talla <vreddytalla@nvidia.com>,
        kernel-team@android.com
Subject: Re: [PATCH v3 1/4] genirq/irqdomain: Allow partial trimming of irq_data hierarchy
In-Reply-To: <9341eb039193d630d8a3f7bac920a76c@kernel.org>
References: <20201007124544.1397322-1-maz@kernel.org> <20201007124544.1397322-2-maz@kernel.org> <87d01t2c90.fsf@nanos.tec.linutronix.de> <9341eb039193d630d8a3f7bac920a76c@kernel.org>
Date:   Thu, 08 Oct 2020 22:47:29 +0200
Message-ID: <875z7kwila.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Oct 08 2020 at 14:06, Marc Zyngier wrote:
> On 2020-10-08 12:22, Thomas Gleixner wrote:
> Here's what I have now, with the pmc driver calling
> irq_domain_disconnect_hierarchy() at the right spots.
>
>   static int irq_domain_alloc_irq_data(struct irq_domain *domain,
> @@ -1362,11 +1442,16 @@ int __irq_domain_alloc_irqs(struct irq_domain 
> *domain, int irq_base,
>   		mutex_unlock(&irq_domain_mutex);
>   		goto out_free_irq_data;
>   	}
> -	for (i = 0; i < nr_irqs; i++)
> +	for (i = 0; i < nr_irqs; i++) {
> +		ret = irq_domain_trim_hierarchy(virq + i);
> +		if (ret)
> +			break;
>   		irq_domain_insert_irq(virq + i);

You can't do that in one go because in case of an error you leak the
already inserted irqs. You need two loops.

	for (i = 0; i < nr_irqs; i++) {
		ret = irq_domain_trim_hierarchy(virq + i);
		if (ret) {
                	mutex_unlock(&irq_domain_mutex);
			goto out_free_irq_data;
        }

	for (i = 0; i < nr_irqs; i++)
   		irq_domain_insert_irq(virq + i);

  	mutex_unlock(&irq_domain_mutex);
	return virq;

>   out_free_irq_data:
>   	irq_domain_free_irq_data(virq, nr_irqs);

Thanks,

        tglx
