Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0638C433E2
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 08:46:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B014D20770
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 08:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600332365;
	bh=XYG6JGcwgkmjNbVGDa4h66QWAsy/bKbSi/BpwoM8ZUU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=vOsv687XD/X4OxC11NLOvAwsbZhmnZNUykL6dr+3j1TjGfs8sEnSORYL/3LOKSj+4
	 kUUc8iNxtQuvKIDrRn7xT9EHAA8Bw8bGJBao58cNvk8075EI4gwa7BUSX9VolpSu9f
	 vF6Qo3OamYZfjmhoWcj7NJ2D45z56SaghXVG8Uno=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbgIQIqA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 04:46:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:40376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726169AbgIQIp7 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 04:45:59 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8271F206A1;
        Thu, 17 Sep 2020 08:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600332358;
        bh=XYG6JGcwgkmjNbVGDa4h66QWAsy/bKbSi/BpwoM8ZUU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TvMRY2qOEraH4Rfb8k5hDT8yd1Lz4WxBT0oWNg/vfxujfyT7zAh5fVe5VXdROxz3V
         fjxL56HpXlT9rEhS1V6QbWFjKeNrhwuYJSiuF+sDqd0JJuxFbzdAnEjLioqFC2oPV/
         EKZO8cw4Z4UVtE7Q9XSt5BlFS0Y6ujF7tV63c4UY=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kIpYC-00Ca3q-N1; Thu, 17 Sep 2020 09:45:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 17 Sep 2020 09:45:56 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@linaro.org>,
        kernel-team@android.com, Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <linux@arm.linux.org.uk>,
        Jason Cooper <jason@lakedaemon.net>,
        Saravana Kannan <saravanak@google.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        Valentin Schneider <Valentin.Schneider@arm.com>,
        linux-tegra <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v3 08/16] irqchip/gic: Configure SGIs as standard
 interrupts
In-Reply-To: <a88528cd-eb76-367a-77d6-7ae20bd28304@nvidia.com>
References: <20200901144324.1071694-1-maz@kernel.org>
 <20200901144324.1071694-9-maz@kernel.org>
 <CGME20200914130601eucas1p23ce276d168dee37909b22c75499e68da@eucas1p2.samsung.com>
 <a917082d-4bfd-a6fd-db88-36e75f5f5921@samsung.com>
 <933bc43e-3cd7-10ec-b9ec-58afaa619fb7@nvidia.com>
 <3378cd07b92e87a24f1db75f708424ee@kernel.org>
 <CACRpkdYvqQUJaReD1yNTwiHhaZpQ9h5Z9DgdqbKkCexnM7cWNw@mail.gmail.com>
 <049d62ac7de32590cb170714b47fb87d@kernel.org>
 <a88528cd-eb76-367a-77d6-7ae20bd28304@nvidia.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <81cb16323baa1c81e7bc1e8156fa47b8@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: jonathanh@nvidia.com, linus.walleij@linaro.org, m.szyprowski@samsung.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, sumit.garg@linaro.org, kernel-team@android.com, f.fainelli@gmail.com, linux@arm.linux.org.uk, jason@lakedaemon.net, saravanak@google.com, andrew@lunn.ch, catalin.marinas@arm.com, gregory.clement@bootlin.com, b.zolnierkie@samsung.com, krzk@kernel.org, linux-samsung-soc@vger.kernel.org, tglx@linutronix.de, will@kernel.org, Valentin.Schneider@arm.com, linux-tegra@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2020-09-17 08:54, Jon Hunter wrote:
> On 17/09/2020 08:50, Marc Zyngier wrote:
>> Hi Linus,
>> 
>> On 2020-09-17 08:40, Linus Walleij wrote:
>>> On Wed, Sep 16, 2020 at 5:11 PM Marc Zyngier <maz@kernel.org> wrote:
>>> 
>>>> Can you try the patch below and let me know?
>>> 
>>> I tried this patch and now Ux500 WORKS. So this patch is definitely
>>> something you should apply.
>>> 
>>>> -                       if (is_frankengic())
>>>> -                               set_sgi_intid(irqstat);
>>>> +                       this_cpu_write(sgi_intid, intid);
>>> 
>>> This needs changing to irqstat to compile as pointed out by Jon.
>>> 
>>> With that:
>>> Tested-by: Linus Walleij <linus.walleij@linaro.org>
>> 
>> Thanks a lot for that.
>> 
>> Still need to understand why some of Jon's systems are left 
>> unbootable,
>> despite having similar GIC implementations (Tegra194 and Tegra210 use
>> the same GIC-400, and yet only one of the two boots correctly...).
> 
> So far, I have only tested this patch on Tegra20. Let me try the other
> failing boards this morning and see if those still fail.

Tegra20 (if I remember well) is a dual A9 with the same GIC 
implementation
as Ux500, hence requiring the source CPU bits to be written back. So 
this
patch should have cured it, but didn't...

/me puzzled.

         M.
-- 
Jazz is not dead. It just smells funny...
