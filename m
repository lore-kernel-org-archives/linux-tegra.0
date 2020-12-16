Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2737FC4361B
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Dec 2020 15:57:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D593123104
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Dec 2020 15:57:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbgLPP5S (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Dec 2020 10:57:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726588AbgLPP5S (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Dec 2020 10:57:18 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D167C061794;
        Wed, 16 Dec 2020 07:56:37 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id l11so49604188lfg.0;
        Wed, 16 Dec 2020 07:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yoktSe981NvO3RbAGrUEN7qVxybkq9Wcngmx06+9aBA=;
        b=PTgvMn42UTcDBQm7ahYNmVzs9k9QRcghlDcoA5Kk5TYWgOZGutm1d0vtQTzOztAGIs
         ouOwdIgTq7om+9WJCKLVz4l3rEQk6Ue4agD1nrb+2WiyrQchuvnPcPfzxJ3BLy9sq9tE
         mglaT9J8+wMZ6FG3aOH2ZmTUYAIvr7jIcB3E8Gtkr1z4AfkmljrlpUpO1/1TQp/Pu2Is
         FcyN89kXLPSc+bcXECltUrBcZYVette1zM+JqjSSilD9rSOWT/r8KqZDz5IoGOzJdyh+
         ek1tTgxSsBCMd2gV3h9RnzOtlHAljAW1Xp7J5PvPMESlJ1SyymI5oFq/X9Q7V0f0JggC
         R2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yoktSe981NvO3RbAGrUEN7qVxybkq9Wcngmx06+9aBA=;
        b=kziCKxdnRAF8LCAbSqg0ZbWWB2kcWeHnwDj+7FjRRCBH/gUCkr3DjECeUEiw20Wrwf
         SotEjRp4twRHXjbgdV5Xo0QOdPf4UR4YmEtoyTm3Yxeh2BUEaEfD0mI5qOPk8W2GWgAr
         YrkAMhRkWFHqdL3Q9ozxT7cpQDDf1SAxfPfzu8Quzv/uG6kJFs/1wPzPVfS0ani74L0V
         2pKC55vtX6KhKulflVBdr4DesNk3mFzy8JNMcPTusN71NvcPKbzrqfxfTl1hcSo/4B7t
         8/pvq5n8ZxLykcguIpe6Zq3GZl0ORgfrVRi4sjAhOxcJKQzSWN41Y4ZKi2zEdgX6KY0f
         Dp5w==
X-Gm-Message-State: AOAM531XlEyIS7CYH6AkQu1/tRY/cOVyEq0Q1vGd0/9930mdXQFzY3xG
        LHVk2uUHyvJYySui7YfuUuRDhQWZPV0=
X-Google-Smtp-Source: ABdhPJyshd/5Aq/Tgd1HhV7XZ6/MQ76m+g/o0fPfo2xfOG+y/GrCxbzPaLKoqPhdns/ozYgDz7C5cQ==
X-Received: by 2002:a19:3f57:: with SMTP id m84mr6831013lfa.486.1608134192377;
        Wed, 16 Dec 2020 07:56:32 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id t15sm267413lfl.33.2020.12.16.07.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Dec 2020 07:56:31 -0800 (PST)
Subject: Re: [PATCH v1 5/8] usb: chipidea: tegra: Support host mode
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201215202113.30394-1-digetx@gmail.com>
 <20201215202113.30394-6-digetx@gmail.com>
 <20201216060732.GB5595@b29397-desktop>
 <bb617167-e6a4-221e-5e3b-c9d7a1b50c87@gmail.com>
 <DBBPR04MB79794F5CC440279AF94A48448BC50@DBBPR04MB7979.eurprd04.prod.outlook.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e4a63b73-5fc9-33da-abd5-771b2f3813f6@gmail.com>
Date:   Wed, 16 Dec 2020 18:56:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <DBBPR04MB79794F5CC440279AF94A48448BC50@DBBPR04MB7979.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.12.2020 12:32, Peter Chen пишет:
>> ...
>>>> +static int tegra_usb_internal_port_reset(struct ehci_hcd *ehci,
>>>> +					 u32 __iomem *portsc_reg,
>>>> +					 unsigned long *flags)
>>>> +{
>>>> +	u32 saved_usbintr, temp;
>>>> +	unsigned int i, tries;
>>>> +	int retval = 0;
>>>> +
>>>> +	saved_usbintr = ehci_readl(ehci, &ehci->regs->intr_enable);
>>>> +	/* disable USB interrupt */
>>>> +	ehci_writel(ehci, 0, &ehci->regs->intr_enable);
>>>> +	spin_unlock_irqrestore(&ehci->lock, *flags);
>>>> +
>>>> +	/*
>>>> +	 * Here we have to do Port Reset at most twice for
>>>> +	 * Port Enable bit to be set.
>>>> +	 */
>>>> +	for (i = 0; i < 2; i++) {
>>>> +		temp = ehci_readl(ehci, portsc_reg);
>>>> +		temp |= PORT_RESET;
>>>> +		ehci_writel(ehci, temp, portsc_reg);
>>>> +		mdelay(10);
>>> Needs accurate delay? How about usleep_range?
>> To be hones I don't know for sure whether hub_control() could be used from
>> interrupt context.  This mdelay is borrowed from the older ehci-tegra driver.
>>
>> Are you suggesting that it should be safe to sleep here?
>>
> I see msleep is called at tegra_ehci_hub_control at ehci-tegra.c.
> .hub_control is not called at interrupt context.
> 

Alright, I'll change to use msleep() in v2, thanks.
