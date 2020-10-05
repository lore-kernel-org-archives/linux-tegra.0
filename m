Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 352C0C4363A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 13:10:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE0DD20874
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 13:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601903416;
	bh=kDjkkbRUbpOP0s/mbwqdmPJKM4HIZwidUfRO/Yv/FQw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=MJqWNLdW6KQXOAcjKI3uB+IDMoycqPb8XDEckGcWB+lOfnqIStv0cYLCYEsiRJpge
	 /MZY5gPKBcBHPoCtFeRt7Av6IiSo8NlhtML3IrgsKvjllflFcLl5hmkHbhSVcVibmI
	 Yi6xoXocCSf/nIQnmn8PgwhCHz/tX/r213vmkuUM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725914AbgJENKQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 09:10:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:33146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725891AbgJENKQ (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 5 Oct 2020 09:10:16 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 26696207BC;
        Mon,  5 Oct 2020 13:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601903415;
        bh=kDjkkbRUbpOP0s/mbwqdmPJKM4HIZwidUfRO/Yv/FQw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=r9K6pmsQVtLYS/JRnrZIBTBmJC0nvLDZNOF/a8V/iMZfyIsrdMcqjHjm7xYIhqEBR
         4qVHGlZ9NbjN4LG9aAVVdf9CBXO+xQzPpKbKXG6pqlR33+eit7iR9NVmoyZj79Koh2
         m3zuOdF05CvQ/3tsGGolWWL14W6WH+i/KN8kej9Q=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kPQFp-00HNNO-4d; Mon, 05 Oct 2020 14:10:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 05 Oct 2020 14:10:13 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Venkat Reddy Talla <vreddytalla@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>, kernel-team@android.com
Subject: Re: [PATCH 3/3] soc/tegra: pmc: Don't create fake interrupt hierarchy
 levels
In-Reply-To: <20201005113335.GT425362@ulmo>
References: <20201005111443.1390096-1-maz@kernel.org>
 <20201005111443.1390096-4-maz@kernel.org> <20201005113335.GT425362@ulmo>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <f5b711ff9289d41f25b0ea3b6658651f@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: thierry.reding@gmail.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com, digetx@gmail.com, skomatineni@nvidia.com, vreddytalla@nvidia.com, tglx@linutronix.de, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2020-10-05 12:33, Thierry Reding wrote:
> On Mon, Oct 05, 2020 at 12:14:43PM +0100, Marc Zyngier wrote:
>> The Tegra PMC driver does ungodly things with the interrupt hierarchy,
>> repeatedly corrupting it by pulling hwirq numbers out of thin air,
>> overriding existing IRQ mappings and changing the handling flow
>> of unsuspecting users.
>> 
>> All of this is done in the name of preserving the interrupt hierarchy
>> even when these levels do not exist in the HW. Together with the use
>> of proper IRQs for IPIs, this leads to an unbootable system as the
>> rescheduling IPI gets repeatedly repurposed for random drivers...
>> 
>> Instead, let's allow the hierarchy to be trimmed to the level that
>> actually makes sense for the HW, and not any deeper. This avoids
>> having unnecessary callbacks, overriding mappings, and otherwise
>> keeps the hierarchy sane.
>> 
>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>> ---
>>  drivers/soc/tegra/pmc.c | 79 
>> +++++++++++++++--------------------------
>>  1 file changed, 29 insertions(+), 50 deletions(-)
>> 
>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>> index 9960f7c18431..4eea3134fb3e 100644
>> --- a/drivers/soc/tegra/pmc.c
>> +++ b/drivers/soc/tegra/pmc.c
>> @@ -1993,6 +1993,30 @@ static int tegra_pmc_irq_translate(struct 
>> irq_domain *domain,
>>  	return 0;
>>  }
>> 
>> +/* Trim the irq hierarchy from a particular irq domain */
>> +static void trim_hierarchy(unsigned int virq, struct irq_domain 
>> *domain)
>> +{
>> +	struct irq_data *tail, *irq_data = irq_get_irq_data(virq);
>> +
>> +	/* The PMC doesn't generate any interrupt by itself */
>> +	if (WARN_ON(!irq_data->parent_data))
>> +		return;
>> +
>> +	/* Skip until we find the right domain */
>> +	while (irq_data->parent_data && irq_data->parent_data->domain != 
>> domain)
>> +		irq_data = irq_data->parent_data;
>> +
>> +	/* Sever the inner part of the hierarchy...  */
>> +	tail = irq_data->parent_data;
>> +	irq_data->parent_data = NULL;
>> +
>> +	/* ... and free it */
>> +	for (irq_data = tail; irq_data; irq_data = tail) {
>> +		tail = irq_data->parent_data;
>> +		kfree(irq_data);
>> +	};
>> +}
> 
> That kind of looks like what I originally wanted to do and (naively)
> thought that passing the (0, NULL, NULL) triplet would achieve.
> 
> Given that this is fairly low-level stuff that deals with the inner
> workings of the IRQ infrastructure, should we eventually pull this out
> of the driver and make it into a core helper? I don't seriously expect
> this to be widely useful, but putting it into the core might help keep
> it more maintainable.

That's the ultimate plan, but I wanted to give it some soaking time
on Tegra before exposing it to the outside world 
(irq_domain_free_irq_data()
could be rewritten in terms of this primitive, for example).

> I volunteer to do that work if you think it's a good idea.

Sure, once we know we're good to go with this.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
