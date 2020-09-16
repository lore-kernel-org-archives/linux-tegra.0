Return-Path: <SRS0=19fU=CZ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B71C2BB84
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 20:47:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC96120770
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 20:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600289220;
	bh=mpAdHBdSMzoCqVev8/I8QdC32AN7Gx99N6kNTPpTi1I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=G8QV/kfZnahgmC+q3lWSOGQ4GsPFHXZI/SfcywIN5i2SWplTCgI767AxGPom0SwXZ
	 w6AdtXSsYJdLvLMBuMIimls61V4YLrPVs1XZLHUQPXiUX5Nt6wJ8RkQOWcgShTHePa
	 NygENrNhi4HXFUNVmoegumTE1lMIWTPN60Y6Uj30=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727555AbgIPUq6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Sep 2020 16:46:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:55590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726690AbgIPRBX (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Sep 2020 13:01:23 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F302C221F0;
        Wed, 16 Sep 2020 16:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600273724;
        bh=mpAdHBdSMzoCqVev8/I8QdC32AN7Gx99N6kNTPpTi1I=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CjSGKgXW5qBH1DXUCssLzes7A7cgOMvTlufIoLz4NbatyTTkMh1yUDCPD5r+qetlO
         zinL0stoWd+oPuyeALmQUdPeLRKCBwN2UXzHdMMXHMV7gN1j/yg8uiIlTPnc+W5TcW
         efEBhn5RSsxA2FClxpq5U0Sg26f3OoT9u6TXrY7w=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kIaIU-00CNjN-2H; Wed, 16 Sep 2020 17:28:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 16 Sep 2020 17:28:42 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Sumit Garg <sumit.garg@linaro.org>, linus.walleij@linaro.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <linux@arm.linux.org.uk>,
        Jason Cooper <jason@lakedaemon.net>,
        Saravana Kannan <saravanak@google.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Will Deacon <will@kernel.org>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, kernel-team@android.com,
        Valentin Schneider <Valentin.Schneider@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v3 08/16] irqchip/gic: Configure SGIs as standard
 interrupts
In-Reply-To: <13c096832bd923f956ddd7db7e337857@kernel.org>
References: <20200901144324.1071694-1-maz@kernel.org>
 <20200901144324.1071694-9-maz@kernel.org>
 <CGME20200914130601eucas1p23ce276d168dee37909b22c75499e68da@eucas1p2.samsung.com>
 <a917082d-4bfd-a6fd-db88-36e75f5f5921@samsung.com>
 <933bc43e-3cd7-10ec-b9ec-58afaa619fb7@nvidia.com>
 <3378cd07b92e87a24f1db75f708424ee@kernel.org>
 <dcf812d9-2409-bcae-1925-e21740c2932e@nvidia.com>
 <a6c7bbc91c5b23baa44f3abe35eb61c9@kernel.org>
 <d6dddab0-47aa-ddf2-959b-85493b8da52d@nvidia.com>
 <13c096832bd923f956ddd7db7e337857@kernel.org>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <5c2ec2bf156f27f2f1cde54611a98923@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: jonathanh@nvidia.com, sumit.garg@linaro.org, linus.walleij@linaro.org, f.fainelli@gmail.com, linux@arm.linux.org.uk, jason@lakedaemon.net, saravanak@google.com, andrew@lunn.ch, catalin.marinas@arm.com, gregory.clement@bootlin.com, b.zolnierkie@samsung.com, linux-kernel@vger.kernel.org, krzk@kernel.org, will@kernel.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, tglx@linutronix.de, kernel-team@android.com, Valentin.Schneider@arm.com, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2020-09-16 17:22, Marc Zyngier wrote:
> On 2020-09-16 16:58, Jon Hunter wrote:
>> On 16/09/2020 16:55, Marc Zyngier wrote:
>>> On 2020-09-16 16:46, Jon Hunter wrote:
>>>> On 16/09/2020 16:10, Marc Zyngier wrote:
>>>>> Hi Jon,
>>>>> 
>>>>> +Linus, who is facing a similar issue.
>>>>> 
>>>>> On 2020-09-16 15:16, Jon Hunter wrote:
>>>>>> Hi Marc,
>>>>>> 
>>>>>> On 14/09/2020 14:06, Marek Szyprowski wrote:
>>>>>>> Hi Marc,
>>>>>>> 
>>>>>>> On 01.09.2020 16:43, Marc Zyngier wrote:
>>>>>>>> Change the way we deal with GIC SGIs by turning them into proper
>>>>>>>> IRQs, and calling into the arch code to register the interrupt 
>>>>>>>> range
>>>>>>>> instead of a callback.
>>>>>>>> 
>>>>>>>> Reviewed-by: Valentin Schneider <valentin.schneider@arm.com>
>>>>>>>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>>>>>>> This patch landed in linux next-20200914 as commit ac063232d4b0
>>>>>>> ("irqchip/gic: Configure SGIs as standard interrupts"). Sadly it
>>>>>>> breaks
>>>>>>> booting of all Samsung Exynos 4210/4412 based boards (dual/quad 
>>>>>>> ARM
>>>>>>> Cortex A9 based). Here are the last lines from the bootlog:
>>>>>> 
>>>>>> I am observing the same thing on several Tegra boards (both arm 
>>>>>> and
>>>>>> arm64). Bisect is pointing to this commit. Reverting this alone 
>>>>>> does
>>>>>> not
>>>>>> appear to be enough to fix the issue.
>>>>> 
>>>>> Right, I am just massively by the GICv3 spec, and failed to 
>>>>> remember
>>>>> that ye olde GIC exposes the source CPU in AIR *and* wants it back,
>>>>> while
>>>>> newer GICs deal with that transparently.
>>>>> 
>>>>> Can you try the patch below and let me know?
>>>> 
>>>> Yes will do.
>>>> 
>>>>> @@ -365,14 +354,13 @@ static void __exception_irq_entry
>>>>> gic_handle_irq(struct pt_regs *regs)
>>>>>              smp_rmb();
>>>>> 
>>>>>              /*
>>>>> -             * Samsung's funky GIC encodes the source CPU in
>>>>> -             * GICC_IAR, leading to the deactivation to fail if
>>>>> -             * not written back as is to GICC_EOI.  Stash the
>>>>> -             * INTID away for gic_eoi_irq() to write back.
>>>>> -             * This only works because we don't nest SGIs...
>>>>> +             * The GIC encodes the source CPU in GICC_IAR,
>>>>> +             * leading to the deactivation to fail if not
>>>>> +             * written back as is to GICC_EOI.  Stash the INTID
>>>>> +             * away for gic_eoi_irq() to write back.  This only
>>>>> +             * works because we don't nest SGIs...
>>>>>               */
>>>>> -            if (is_frankengic())
>>>>> -                set_sgi_intid(irqstat);
>>>>> +            this_cpu_write(sgi_intid, intid);
>>>> 
>>>> I assume that it should be irqstat here and not intid?
>>> 
>>> Indeed. As you can tell, I haven't even tried to compile it, sorry 
>>> about
>>> that.
>> 
>> No worries, I got the gist. However, even with this change, it still
>> does not boot :-(
> 
> Do you boot form EL2? If so, you'd also need this:
> 
>  static void gic_eoimode1_eoi_irq(struct irq_data *d)
>  {
> +	u32 hwirq = gic_irq(d);
> +
>  	/* Do not deactivate an IRQ forwarded to a vcpu. */
>  	if (irqd_is_forwarded_to_vcpu(d))
>  		return;
> 
> +	if (hwirq < 16)
> +		hwirq = this_cpu_read(sgi_intid);
> +
>  	writel_relaxed(gic_irq(d), gic_cpu_base(d) + GIC_CPU_DEACTIVATE);
>  }

Make it that instead:

  static void gic_eoimode1_eoi_irq(struct irq_data *d)
  {
+	u32 hwirq = gic_irq(d);
+
  	/* Do not deactivate an IRQ forwarded to a vcpu. */
  	if (irqd_is_forwarded_to_vcpu(d))
  		return;

-	writel_relaxed(gic_irq(d), gic_cpu_base(d) + GIC_CPU_DEACTIVATE);
+	if (hwirq < 16)
+		hwirq = this_cpu_read(sgi_intid);
+
+	writel_relaxed(hwirq, gic_cpu_base(d) + GIC_CPU_DEACTIVATE);
  }


         M.
-- 
Jazz is not dead. It just smells funny...
