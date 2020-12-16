Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1ECC4361B
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Dec 2020 09:54:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97F7E2313C
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Dec 2020 09:54:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbgLPJyW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Dec 2020 04:54:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgLPJyW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Dec 2020 04:54:22 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5851AC0613D6;
        Wed, 16 Dec 2020 01:53:41 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id x20so27250555lfe.12;
        Wed, 16 Dec 2020 01:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7K3VpldibCJw6SR86Fx4bZqIehnXTqNoL7QsytzTCAc=;
        b=MCsSEYUFTM5ED71OJrR4OvHrul5rKb2rZfsb9lpjqhVue+kFhn/63N+a1R6iu9nOd3
         7mXbTNwTMd2DEdcawUDoyBx7WEdXMCneOi85Cbcb9voGoUO0N8jy1mGHG83W7AGJV8Hu
         dnhLxUxrxv7KTnhY771KDlhHhRHG7rJ2zXIkmJiqEeN1KRN1H9naF19XTfYB0wbSfdsp
         P7Z+Qsi1guvpcOHUstliWTG9lyqCYNc9TdGOYH130yEZP7AdEdpxeg+bdFFgfY9kEs7q
         6eTIf/nNbdwtEkXAiSihsYhWfZdq+eUyFmFeQqv9h7EdZ36KYTp84Y7/9+woigzZDIY+
         c6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7K3VpldibCJw6SR86Fx4bZqIehnXTqNoL7QsytzTCAc=;
        b=eP+JraMe3VUZ9V1+zEMJYjFpAnYo9rurF8rs5J9t3VeNwZOs36UQbsAv9PXIRYncup
         mHMXsYPiM57hV8ViQwujr+UPUbRUvfvlhd/FoBEqMApDF4TJ0UUB87GJph7Q90c3AwH3
         fNW3B/7cKr7JaMtJrvzGIUKgN7sJOHj2aVI3+tz0J0V13aEjgRkMgdQPakmjcrnUsR9k
         H/TtSck/cUp1jPLKl0TUXgzgVyQSlBhH4izmHb1J+/oXBwRbWGmresws9qYrV4Kb/Byc
         xjhUtGLqmQhQRLGlsJcDbjhKRdepUmPV1ZWoV2E0u+iODSC85SM4qYWi7+GMneOXa1C6
         KsnA==
X-Gm-Message-State: AOAM532xu+SK/n4rhSupRR4GDqK4fluVbRub1d9ZJH/VAF2MYIovJl1q
        CvBeWanavoIY3jBMws7U7qLdRPkoJjs=
X-Google-Smtp-Source: ABdhPJyamCAlvp8liqxG/4XrSDjc3YQnFT3rNYbzlQrL2kZ4cunu94BG58qoGFfLCcNFWM8z8Dj1jw==
X-Received: by 2002:a05:6512:3e6:: with SMTP id n6mr4456172lfq.262.1608112419754;
        Wed, 16 Dec 2020 01:53:39 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id y3sm209998ljc.131.2020.12.16.01.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Dec 2020 01:53:39 -0800 (PST)
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
Message-ID: <78b8b868-fa72-cffa-b3c2-5a73a02d02b0@gmail.com>
Date:   Wed, 16 Dec 2020 12:53:38 +0300
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
>  
>>>>
>>>>  struct tegra_usb_soc_info {
>>>>  	unsigned long flags;
>>>> +	unsigned int txfifothresh;
>>>> +	enum usb_dr_mode dr_mode;
>>>> +};
>>>> +
>>>> +static const struct tegra_usb_soc_info tegra20_ehci_soc_info = {
>>>> +	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA |
>>>> +		 CI_HDRC_OVERRIDE_PHY_CONTROL,
>>>> +	.dr_mode = USB_DR_MODE_HOST,
>>>> +	.txfifothresh = 10,
>>>> +};
>>>> +
>>>> +static const struct tegra_usb_soc_info tegra30_ehci_soc_info = {
>>>> +	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA |
>>>> +		 CI_HDRC_OVERRIDE_PHY_CONTROL
>>>> +	.dr_mode = USB_DR_MODE_HOST,
>>>> +	.txfifothresh = 16,
>>>>  };
>>>>
>>>>  static const struct tegra_usb_soc_info tegra_udc_soc_info = {
>>>> -	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA,
>>>> +	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA |
>>>> +		 CI_HDRC_OVERRIDE_PHY_CONTROL,
>>>> +	.dr_mode = USB_DR_MODE_UNKNOWN,
>>>>  };
>>>
>>> What's the usage for this dr_mode? Does these three SoCs only supports
>>> single mode, it usually sets dr_mode at board dts file to indicate USB
>>> role for this board.
>>
>> All Tegra SoCs have three USB controllers.  Only one of these three controllers
>> supports peripheral / OTG modes, the other two controllers are fixed to the
>> host mode and device trees do not specify the dr_mode for the host
>> controllers.
>>
>> Hence we need to enforce the dr_mode=host for the host-mode controllers.
>>
>> For UDC the default mode is "unknown" because actual mode comes from a
>> board's device tree.
>>
> 
> You could add dr_mode property at usb node of soc.dtsi to fulfill that.

This will break older DTBs, we can't do this.

...
>>>>  static int ehci_ci_portpower(struct usb_hcd *hcd, int portnum, bool
>>>> enable)  {
>>>>  	struct ehci_hcd *ehci = hcd_to_ehci(hcd); @@ -160,14 +166,14 @@
>>>> static int host_start(struct ci_hdrc *ci)
>>>>  		pinctrl_select_state(ci->platdata->pctl,
>>>>  				     ci->platdata->pins_host);
>>>>
>>>> +	ci->hcd = hcd;
>>>> +
>>>>  	ret = usb_add_hcd(hcd, 0, 0);
>>>>  	if (ret) {
>>>>  		goto disable_reg;
>>>>  	} else {
>>>>  		struct usb_otg *otg = &ci->otg;
>>>>
>>>> -		ci->hcd = hcd;
>>>> -
>>>
>>> Why this changed?
>>
>> The ci->hcd is used by tegra_usb_notify_event() to handle reset event and the
>> reset happens once usb_add_hcd() is invoked.  Hence we need to pre-assign
>> the hcd pointer, otherwise there will be a NULL dereference.
> 
> Get it, please set ci->hcd as NULL at error path.

Ok, thanks.

