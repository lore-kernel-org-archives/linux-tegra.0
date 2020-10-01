Return-Path: <SRS0=WsFM=DI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8854C4741F
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 19:07:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B5FA21D24
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 19:07:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b="Sz0EJjwT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730017AbgJATHi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 15:07:38 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:4893 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729418AbgJATHi (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 1 Oct 2020 15:07:38 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4C2N130q5Sz5q;
        Thu,  1 Oct 2020 21:07:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1601579255; bh=ExLBEjOkPAKZY4CTfp2wxnMR3zRyIOPgeBy2wLsMIwc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Sz0EJjwTa3tpON/hc29MK011y7SJzcSEjSyox5yA0zDnMshZbLRdXUNtNrf1oD9Gm
         eXEe81ZubdIS21bxDS3RrZCBA56PYrEl01+WwktudpPIFpchHzRRPkYadPuJAGTyK6
         hiUJGX7vDXRSrEVpLPKJ9VR75Y5JbkdhKl2pVRsvr8lEEzYlfAja5i8mdLZjhOfRAt
         LhG6hWKoD4JppKejIzmviNnNd1R/KuSKgC0zE9VRTS8fx/+2y7up1rm0eJ7R3dalwp
         2bMLEgnLEwNkJkKxOClp32SPe0e7fQOj/V/IsmwV8yCGmwdSO/ZS8sl3EIuaQrSiJV
         3UQZFvsDsoHiQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Thu, 1 Oct 2020 21:07:33 +0200
From:   =?iso-8859-2?B?TWljaGGzoE1pcm9zs2F3?= <mirq-linux@rere.qmqm.pl>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org,
        kuninori.morimoto.gx@renesas.com,
        pierre-louis.bossart@linux.intel.com, perex@perex.cz,
        tiwai@suse.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        sharadg@nvidia.com, mkumard@nvidia.com, viswanathl@nvidia.com,
        rlokhande@nvidia.com, dramesh@nvidia.com, atalambedu@nvidia.com,
        nwartikar@nvidia.com, swarren@nvidia.com, nicoleotsuka@gmail.com
Subject: Re: [PATCH v3 10/13] ASoC: tegra: Add audio graph based card driver
Message-ID: <20201001190733.GD23339@qmqm.qmqm.pl>
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
 <1601573587-15288-11-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1601573587-15288-11-git-send-email-spujar@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Oct 01, 2020 at 11:03:04PM +0530, Sameer Pujar wrote:
> Add Tegra audio machine driver which is based on generic audio graph card
> driver. It re-uses most of the common stuff from audio graph driver and
> uses the same DT binding. Required Tegra specific customizations are done
> in the driver.
[...]
> +	switch (srate) {
> +	case 11025:
> +	case 22050:
> +	case 44100:
> +	case 88200:
> +	case 176400:
> +		plla_out0_rate = chip_data->plla_out0_rates[x11_RATE];
> +		plla_rate = chip_data->plla_rates[x11_RATE];
> +		break;
> +	case 8000:
> +	case 16000:
> +	case 32000:
> +	case 48000:
> +	case 96000:
> +	case 192000:
[...]

Do you really need to enumerate the frequencies? Wouldn't just checking
srate % 11025 be enough to divide the set in two? Or just calculating
the PLLA base rate by multiplying?

Best Regards,
Micha³ Miros³aw
