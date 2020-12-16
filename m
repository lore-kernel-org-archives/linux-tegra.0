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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D7AC2BBD4
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Dec 2020 09:23:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91BCD23102
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Dec 2020 09:23:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgLPJXH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Dec 2020 04:23:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbgLPJXG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Dec 2020 04:23:06 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0A2FC061794;
        Wed, 16 Dec 2020 01:22:25 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id o19so20948813lfo.1;
        Wed, 16 Dec 2020 01:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=C6MAt4url2ziH2hVK7IoN+B3g6q9FhhzqPz2Q4Fn7zQ=;
        b=mVP4EP9P9V3o/Kf0h5fF3NBHtO0hluUmKX5cRV5XroGdYu+yvhwWDXXbUt20dEIsYB
         XfdXZRymUTaS7s21SQdsEQP0Kjb3ara16N3abYroz8Qh35kHZToeQJLYy1YChi9mvPYN
         rb4ttxYf63CcQIx7VlQUMW7YMeXXVwyvol+m+n5l6PihmVbsq2DPXcPFPgViRNroUmQk
         vFvf9WOjOTISXOwKYlwdeiTsLtHsVfWhfR2zNSYxUBlY5jlmrK2ZxEzMJ2Q6LnXYl2g1
         qsXJ5nBYW50kA8E2Ibze2RVBcxwBFtD3cU6OEf9mP25mGx/F4Gmp4gAtpev+Vh8UMBd2
         7Sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C6MAt4url2ziH2hVK7IoN+B3g6q9FhhzqPz2Q4Fn7zQ=;
        b=Ggj7n3qv6F6DbhhIy2NmHMcFOf9jXUhL+x5lOih5vz3HyvOQv2+plhYZ97pZ2qnwsv
         e2bQb0uW12jHkA1cLyKQmC/h5vyN+U4SKCNfiKG15FdvEvNG66FqQf0R1xvo0SoplKCf
         hfgcpJMZ5ZIVl+hf9VLoIbhOOu7RWymJo7PP38MzB6+wuYtO6r6IdKOO+9bTmQ1IEIY9
         1Rhe5CbEOvyOWA3yT8vp5R52TmR4eVz11a8oKIoEksJsFG11ciBdpdkQRjPlEfZLS295
         dt6ElJHh/JrAMZNQWsGcx1iFzQkblwZZEUzQ9DXBgKUs/ruu35loInei0bXgjEC/Fyea
         fAmQ==
X-Gm-Message-State: AOAM5302g3FUSkngsjHHjVt87kcPPaP1e9vXFXKeRzzHdjVXZk6hJvYD
        3xFFCtpOd2mkp6Z1iLUZmZH/rQ+0DEs=
X-Google-Smtp-Source: ABdhPJzHOzMxV2Pimk7H4fnCCPl/VvJhK7BlywSSu16me/y/tOIcVSXLOF2j3t9gkFRFKYJ2SDmNQA==
X-Received: by 2002:a19:804c:: with SMTP id b73mr14130635lfd.231.1608110544055;
        Wed, 16 Dec 2020 01:22:24 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id h19sm210206lji.51.2020.12.16.01.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Dec 2020 01:22:23 -0800 (PST)
Subject: Re: [PATCH v1 5/8] usb: chipidea: tegra: Support host mode
From:   Dmitry Osipenko <digetx@gmail.com>
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
Message-ID: <f5571caf-9a17-3b03-14fa-dc988b10747a@gmail.com>
Date:   Wed, 16 Dec 2020 12:22:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <bb617167-e6a4-221e-5e3b-c9d7a1b50c87@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.12.2020 12:07, Dmitry Osipenko пишет:
>>>  static int ehci_ci_portpower(struct usb_hcd *hcd, int portnum, bool enable)
>>>  {
>>>  	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
>>> @@ -160,14 +166,14 @@ static int host_start(struct ci_hdrc *ci)
>>>  		pinctrl_select_state(ci->platdata->pctl,
>>>  				     ci->platdata->pins_host);
>>>  
>>> +	ci->hcd = hcd;
>>> +
>>>  	ret = usb_add_hcd(hcd, 0, 0);
>>>  	if (ret) {
>>>  		goto disable_reg;
>>>  	} else {
>>>  		struct usb_otg *otg = &ci->otg;
>>>  
>>> -		ci->hcd = hcd;
>>> -
>> Why this changed?
> The ci->hcd is used by tegra_usb_notify_event() to handle reset event
> and the reset happens once usb_add_hcd() is invoked.  Hence we need to
> pre-assign the hcd pointer, otherwise there will be a NULL dereference.

Actually, not a NULL dereference, but the reset will be skipped since we
check whether ci->hcd is NULL in the tegra's reset handler.
