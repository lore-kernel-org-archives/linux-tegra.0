Return-Path: <SRS0=PTnO=BS=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0060AC433DF
	for <linux-tegra@archiver.kernel.org>; Sat,  8 Aug 2020 02:56:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88D562177B
	for <linux-tegra@archiver.kernel.org>; Sat,  8 Aug 2020 02:56:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b="C6xO8fNr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgHHC4g (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Aug 2020 22:56:36 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:36793 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726200AbgHHC4g (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 7 Aug 2020 22:56:36 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4BNn1Y4hyPz7N;
        Sat,  8 Aug 2020 04:56:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1596855393; bh=Vh7YFGbzDOR7ik3mvvRFVPqD1usJubGlhKBM6eerwtI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C6xO8fNrYAsg9oVoM9GM8omPHmTRp+8e0s3cPlLNAAf3mZrtLDQJOn3DA2iOJOt3t
         f7a46X5j3mw3Kbm0DAM4hUspXwdKxVnyOGQcmr9iRh7AG76GGyEU4z0irWjkJiaLcR
         hSbetalgP2hDTzwS+OkDwa+yh0cDy1LCm4IhaQBIgD0wvCa/HgxoGJ9e3+w+CVJA9c
         /GqEmP8Ytk5tO37u26lh5NSXW+JZ6t3+D4Jx3HzDQB64/akBbG3EAdUfrdOoAssjaO
         ppjZRz5hcSfdJI6Ml5e32OHEw/fl+cw53+NJKN55O9ivGHHG25xeb2BnTqIUxFNd93
         /lVehLF81bRbg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Sat, 8 Aug 2020 04:56:29 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/4] arm64: tegra: Add VBUS supply for micro USB port on
 Jetson Nano
Message-ID: <20200808025629.GA1658@qmqm.qmqm.pl>
References: <20200806154111.3917284-1-thierry.reding@gmail.com>
 <20200806154111.3917284-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200806154111.3917284-2-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Aug 06, 2020 at 05:41:09PM +0200, Thierry Reding wrote:
> The VBUS supply for the micro USB port on Jetson Nano is derived from
> the main system supply and always on. Describe in nevertheless to fix
> warnings during boot.
[...]
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> @@ -541,6 +541,8 @@ usb2-0 {
>  				mode = "peripheral";
>  				usb-role-switch;
>  
> +				vbus-supply = <&vdd_5v0_usb>;
[...]

If it's not controllable then this is equivalent to setting vdd_5v0_sys
here, isn't it?

Best Regards,
Micha³ Miros³aw
