Return-Path: <SRS0=PTnO=BS=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE5BC433DF
	for <linux-tegra@archiver.kernel.org>; Sat,  8 Aug 2020 03:01:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E5182087C
	for <linux-tegra@archiver.kernel.org>; Sat,  8 Aug 2020 03:01:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b="mbRwRCyc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgHHDBs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Aug 2020 23:01:48 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:52174 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726200AbgHHDBr (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 7 Aug 2020 23:01:47 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4BNn7Y5vyYz7N;
        Sat,  8 Aug 2020 05:01:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1596855706; bh=6szJ+MFGGB9m6HT6XK04jpARPIREpSTCmzCKBzIaKTw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mbRwRCycHOhcbuW/XDo2Uf4OoarVbOmjhuogZCo+Nap0IS8oqwq0HzUiEpeBibNfV
         m9J6kZv+BXTt2nbJQ/senh2Rh7v5nwCPIIXPjAHYDIg/nsqt2cIGzJGWddktdhWFAX
         Oa5U2L6Zph55yyTLKveFhUJQfAYnln25tX+yHj+mnIECZcMTvgSgfSAdEAbOQVlYsJ
         AVy0H/sazU4kuA/3K8euBGd3dvdXd5/d+LCSCExg/H0QzdJTXOQ3rZ6Z2hMhw9AAn/
         LiY74d2ZUjN/p3UrmA2LnrsB3MrtoQ2CQ0QcsJi39TAvq+z1maw1gKWa04iLqnbU2O
         asZCci5z/17mQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Sat, 8 Aug 2020 05:01:44 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: common: usb-conn-gpio: Print error on failure
 to get VBUS
Message-ID: <20200808030144.GB1658@qmqm.qmqm.pl>
References: <20200806160248.3936771-1-thierry.reding@gmail.com>
 <20200806160248.3936771-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200806160248.3936771-2-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Aug 06, 2020 at 06:02:48PM +0200, Thierry Reding wrote:
> The exact error that happened trying to get the VBUS supply can be
> useful to troubleshoot what's going on.
[...]
> --- a/drivers/usb/common/usb-conn-gpio.c
> +++ b/drivers/usb/common/usb-conn-gpio.c
> @@ -206,7 +206,7 @@ static int usb_conn_probe(struct platform_device *pdev)
>  
>  	if (IS_ERR(info->vbus)) {
>  		if (PTR_ERR(info->vbus) != -EPROBE_DEFER)
> -			dev_err(dev, "failed to get vbus\n");
> +			dev_err(dev, "failed to get vbus: %ld\n", PTR_ERR(info->vbus));

There is now a nice "%pe" format, that can make this even better.

Best Regards,
Micha³ Miros³aw
