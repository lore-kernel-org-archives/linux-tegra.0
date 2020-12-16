Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CD3C0018C
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Dec 2020 09:08:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 094822311A
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Dec 2020 09:08:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgLPJIY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Dec 2020 04:08:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbgLPJIX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Dec 2020 04:08:23 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70F14C0613D6;
        Wed, 16 Dec 2020 01:07:43 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id u18so46471856lfd.9;
        Wed, 16 Dec 2020 01:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NNBEaxSKyg6BSbKPVjzc/TIpBoY4OtnDFb6TyTjRFWo=;
        b=aZ8zaFrnLaOnI6oU3DAY8sUSN+NpLw0ZzIP7s7DG6mt5uSH9i15EI7DFruntjV511F
         26x1kBmJfXeaVvDBZMRevup3zDxmxYa3eEhmMO+R7nIkgUy3X6r8HJ6KfVgKpESykA1h
         lVwTN5fwAXCw1JwQBZq1B7SorU4rjBpwr2wCuGT2DCowUReLIvYq7/fZOkYfTyzGw29f
         h0xybH50slwEoTfbyKur1be81M0jjVaSPJbr5aWvSO6KssE/bwV59ObUDrjawJQtmPyr
         UIJlR1Ta91/V4M1ibJWrHriCv8OY+sLFPSuB8VM93BffEVqwL/I4aY1lUUrOs4z7JAqu
         Ql2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NNBEaxSKyg6BSbKPVjzc/TIpBoY4OtnDFb6TyTjRFWo=;
        b=hXz5RXLx5aCfbNt2ms9l998Wt9Pun9Q8PMVFCNdzSVXEp7QpB4cD/VktHnA3+nIWZr
         Q90kgYT5C8iGBbuMWceJ8IW71auxeCUOIC8msJmlSs8SMm2fSlq7T699GeoAn965cHfB
         s+DqQPhSrhuWleICmVf39TdwfIA+iKEclMRuim9fXD9lFov8D0xgbs/oJDA9M7Cw4RgW
         ehanIhz6ww+JvqcdeVhmI8p0/MozGG/Y5VPzZdXtfoLU9CO5930iwcoBlaVJEWQP4uVR
         HKm+uP8fnkeuN5uVMR+kgdSuGGYrT1RaFf9NP7SztMElHSsyM9H2lYvrBtWgoMoDDdsi
         G0Eg==
X-Gm-Message-State: AOAM533kX33tHiPZUirLl0fvAeisdqDUpff2bkuZp0yAsHVgmy7COOjF
        ErePbHRGTyQhL6SYPIjUmgafnX96Wv4=
X-Google-Smtp-Source: ABdhPJyipB2RS6fU2xboJkuum0669AsrgUEWRwkMmXq+kj4o7jPRQ16tHxUCkadwBTCsUQUIGrYf1g==
X-Received: by 2002:a2e:a58e:: with SMTP id m14mr14663545ljp.1.1608109661675;
        Wed, 16 Dec 2020 01:07:41 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id o11sm151686lfi.267.2020.12.16.01.07.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Dec 2020 01:07:41 -0800 (PST)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <bb617167-e6a4-221e-5e3b-c9d7a1b50c87@gmail.com>
Date:   Wed, 16 Dec 2020 12:07:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201216060732.GB5595@b29397-desktop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.12.2020 09:08, Peter Chen пишет:
> On 20-12-15 23:21:10, Dmitry Osipenko wrote:
>> From: Peter Geis <pgwipeout@gmail.com>
>>  
>>  struct tegra_usb_soc_info {
>>  	unsigned long flags;
>> +	unsigned int txfifothresh;
>> +	enum usb_dr_mode dr_mode;
>> +};
>> +
>> +static const struct tegra_usb_soc_info tegra20_ehci_soc_info = {
>> +	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA |
>> +		 CI_HDRC_OVERRIDE_PHY_CONTROL,
>> +	.dr_mode = USB_DR_MODE_HOST,
>> +	.txfifothresh = 10,
>> +};
>> +
>> +static const struct tegra_usb_soc_info tegra30_ehci_soc_info = {
>> +	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA |
>> +		 CI_HDRC_OVERRIDE_PHY_CONTROL
>> +	.dr_mode = USB_DR_MODE_HOST,
>> +	.txfifothresh = 16,
>>  };
>>  
>>  static const struct tegra_usb_soc_info tegra_udc_soc_info = {
>> -	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA,
>> +	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA |
>> +		 CI_HDRC_OVERRIDE_PHY_CONTROL,
>> +	.dr_mode = USB_DR_MODE_UNKNOWN,
>>  };
> 
> What's the usage for this dr_mode? Does these three SoCs only supports
> single mode, it usually sets dr_mode at board dts file to indicate
> USB role for this board.

All Tegra SoCs have three USB controllers.  Only one of these three
controllers supports peripheral / OTG modes, the other two controllers
are fixed to the host mode and device trees do not specify the dr_mode
for the host controllers.

Hence we need to enforce the dr_mode=host for the host-mode controllers.

For UDC the default mode is "unknown" because actual mode comes from a
board's device tree.

>>  static const struct of_device_id tegra_usb_of_match[] = {
>>  	{
>> +		.compatible = "nvidia,tegra20-ehci",
>> +		.data = &tegra20_ehci_soc_info,
>> +	}, {
>> +		.compatible = "nvidia,tegra30-ehci",
>> +		.data = &tegra30_ehci_soc_info,
>> +	}, {
>>  		.compatible = "nvidia,tegra20-udc",
>>  		.data = &tegra_udc_soc_info,
> 
> Your compatible indicates this controller is single USB role, is it
> on purpose?

Yes, the "tegra20/30-ehci" controllers are fixed to the host-mode in
hardware.

...
>> +static int tegra_usb_internal_port_reset(struct ehci_hcd *ehci,
>> +					 u32 __iomem *portsc_reg,
>> +					 unsigned long *flags)
>> +{
>> +	u32 saved_usbintr, temp;
>> +	unsigned int i, tries;
>> +	int retval = 0;
>> +
>> +	saved_usbintr = ehci_readl(ehci, &ehci->regs->intr_enable);
>> +	/* disable USB interrupt */
>> +	ehci_writel(ehci, 0, &ehci->regs->intr_enable);
>> +	spin_unlock_irqrestore(&ehci->lock, *flags);
>> +
>> +	/*
>> +	 * Here we have to do Port Reset at most twice for
>> +	 * Port Enable bit to be set.
>> +	 */
>> +	for (i = 0; i < 2; i++) {
>> +		temp = ehci_readl(ehci, portsc_reg);
>> +		temp |= PORT_RESET;
>> +		ehci_writel(ehci, temp, portsc_reg);
>> +		mdelay(10);
> 
> Needs accurate delay? How about usleep_range?

To be hones I don't know for sure whether hub_control() could be used
from interrupt context.  This mdelay is borrowed from the older
ehci-tegra driver.

Are you suggesting that it should be safe to sleep here?

...
>>  static int tegra_usb_probe(struct platform_device *pdev)
>>  {
>>  	const struct tegra_usb_soc_info *soc;
>> @@ -83,24 +292,49 @@ static int tegra_usb_probe(struct platform_device *pdev)
>>  		return err;
>>  	}
>>  
>> +	if (device_property_present(&pdev->dev, "nvidia,needs-double-reset"))
>> +		usb->needs_double_reset = true;
>> +
>> +	err = tegra_usb_reset_controller(&pdev->dev);
>> +	if (err) {
>> +		dev_err(&pdev->dev, "failed to reset controller: %d\n", err);
>> +		goto fail_power_off;
>> +	}
>> +
>> +	/*
>> +	 * USB controller registers shan't be touched before PHY is
> 
> %s/shan't/shouldn't

ok

...
>>  static int ehci_ci_portpower(struct usb_hcd *hcd, int portnum, bool enable)
>>  {
>>  	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
>> @@ -160,14 +166,14 @@ static int host_start(struct ci_hdrc *ci)
>>  		pinctrl_select_state(ci->platdata->pctl,
>>  				     ci->platdata->pins_host);
>>  
>> +	ci->hcd = hcd;
>> +
>>  	ret = usb_add_hcd(hcd, 0, 0);
>>  	if (ret) {
>>  		goto disable_reg;
>>  	} else {
>>  		struct usb_otg *otg = &ci->otg;
>>  
>> -		ci->hcd = hcd;
>> -
> 
> Why this changed?

The ci->hcd is used by tegra_usb_notify_event() to handle reset event
and the reset happens once usb_add_hcd() is invoked.  Hence we need to
pre-assign the hcd pointer, otherwise there will be a NULL dereference.
