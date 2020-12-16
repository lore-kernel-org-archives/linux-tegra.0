Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A66C4361B
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Dec 2020 08:52:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AC0D230FF
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Dec 2020 08:52:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbgLPIwG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Dec 2020 03:52:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgLPIwF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Dec 2020 03:52:05 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53739C0613D6;
        Wed, 16 Dec 2020 00:51:25 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id y19so46298907lfa.13;
        Wed, 16 Dec 2020 00:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QG4Uaqo8uO7H73fa66bH2JISMVZAevQOHDtHNchgdOo=;
        b=UFsbkOElzLctLTQNleHj6bb8r3w0+VfwUJcCloVNFZ4/X4ksm+hMcUZzDsoE1B049e
         ME94nwfjq0rzigxr03ybjvnttwzGD/NKUM9V2quf12/SkTOxrzzddWmKiIZcW7htoGNR
         ilNags+h0o5NX7Yb2YLxQIECLsWwY8/6b7uf5l7jbRP7OUKCrGNIHP09L2KUkeIKU3J8
         MvLaAhoFoe85KlanbwEoAiILrxK24QTHcgltNntrN7wer+28NKqh3WWo4/WUPM76yvci
         EiJ7Jq1KtwO+B4eVD1nF2zjzVehqdvSa9dyCQaZVr/uUXuLO7blCuUAxvvqlB5+NeC4+
         VpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=QG4Uaqo8uO7H73fa66bH2JISMVZAevQOHDtHNchgdOo=;
        b=DUIkgFwdM330WeXpxr31TY6FBFF+cv9OtAKLnVQplQvG9tfo/3y381RJwoAtO7VNdO
         +la/E1o00AKXHiIPl8XWbdUAPX4VHRTS7GyfbT1ESqUtA5KHQGzrFu/+reGhFtTnSSIV
         33WXukpedEpPKWWVLqT2mE1WIS4xXOZPiPf9/wREll3Uc+xZON9UPPSfQ754s30Ppje5
         5QLJqGQaw1X6wtKzcEq9whc2VoaAn6vIrEoxynTvvx6P0SVOxxka+cJwr4oAcmD/SFrO
         sqcsNGOPfIg4rbu57fUbf1mIiW3xdFvUSlznx8H2i7nPFksay0jQM2z6e5jO4CXTctge
         KRXw==
X-Gm-Message-State: AOAM533gKp3EpM8taKwQB+tMRw413kyFYLuV0/wgl1zJBZThK1Xz+UbR
        eWAGNwrlQ4b67GTOEOSz7ryotMSS6f+/zg==
X-Google-Smtp-Source: ABdhPJyTDRDtDhJdXEaa/ZFEeJBJZs2It8VC9dK5YUHfO89weTio/nBFAAS7caZY/i/GLEBp5kEuMQ==
X-Received: by 2002:a19:ad4b:: with SMTP id s11mr5470676lfd.427.1608108683711;
        Wed, 16 Dec 2020 00:51:23 -0800 (PST)
Received: from [192.168.1.100] ([31.173.86.97])
        by smtp.gmail.com with ESMTPSA id z26sm191974lja.125.2020.12.16.00.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Dec 2020 00:51:23 -0800 (PST)
Subject: Re: [PATCH v1 1/8] usb: phy: tegra: Add delay after power up
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201215202113.30394-1-digetx@gmail.com>
 <20201215202113.30394-2-digetx@gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <ce6b80f9-986d-b293-fd33-e4ee4fe1458e@gmail.com>
Date:   Wed, 16 Dec 2020 11:51:14 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201215202113.30394-2-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello!

On 15.12.2020 23:21, Dmitry Osipenko wrote:

> The PHY hardware needs the delay of 2ms after power up, otherwise initial
> interrupt may be lost if USB controller is accessed before PHY is settled
> down. Previously this issue was masked by implicit delays, but now it pops
> up after squashing the older ehci-tegra driver into the ChipIdea driver.
> 
> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>   drivers/usb/phy/phy-tegra-usb.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
> index 03a333797382..cee9c9dbb775 100644
> --- a/drivers/usb/phy/phy-tegra-usb.c
> +++ b/drivers/usb/phy/phy-tegra-usb.c
> @@ -784,6 +784,9 @@ static int tegra_usb_phy_power_on(struct tegra_usb_phy *phy)
>   
>   	phy->powered_on = true;
>   
> +	/* let PHY to settle down */

    Let the PHY settle down.

> +	usleep_range(2000, 2500);
> +
>   	return 0;
>   }
>   

MBR, Sergei
