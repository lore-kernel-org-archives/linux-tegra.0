Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC80C433E6
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 11:17:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41A7464FDE
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 11:17:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232626AbhCKLQv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 Mar 2021 06:16:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232633AbhCKLQY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Mar 2021 06:16:24 -0500
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52E3CC061574;
        Thu, 11 Mar 2021 03:16:24 -0800 (PST)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 6029C221E7;
        Thu, 11 Mar 2021 12:16:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1615461382;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Rcfxj52DqopNjOhZUxoHuR9lkTIwGeoSy4LzOhaFOmY=;
        b=ARvYEuyu+pMa0B2ZS3+5vKtk+3BXirjUsv561Kr7NZSIjFUZfdWAmkzGdMH7vrO1G2t/ky
        ft1QoO12xA8cE2RVR2ZAG57GEjnWCQD+lrWBurP/tmGmay8SsljWestVMOTkLNQ34EQNE8
        GnYF0LKkTL1vagKu6fjp74SaiDozVz0=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 11 Mar 2021 12:16:22 +0100
From:   Michael Walle <michael@walle.cc>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     alsa-devel@alsa-project.org, broonie@kernel.org,
        devicetree@vger.kernel.org, jonathanh@nvidia.com,
        kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, robh@kernel.org, sharadg@nvidia.com,
        thierry.reding@gmail.com
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
In-Reply-To: <fa654e7a-80cc-7ae8-15c6-780e7fa29bb1@nvidia.com>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
 <20210309144156.18887-1-michael@walle.cc>
 <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
 <611ed3362dee3b3b7c7a80edfe763fd0@walle.cc>
 <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
 <eb26f8e0a4c99d0c9de9d92612102718@walle.cc>
 <fa654e7a-80cc-7ae8-15c6-780e7fa29bb1@nvidia.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <cadc59f29bbb2e0d02235d4c10cb7f4d@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Am 2021-03-11 12:05, schrieb Sameer Pujar:

> It would work and initially I had similar patch, see [0] and related
> series. Suggestion is to always use "clocks" property with devices
> only.

I see. But again, I don't think it is correct to change the clock of
the codec by default. What happens if this is for example a
compatible = "fixed-clock"?

As you pointed out in the referred thread [0]. simple-audio-card has
that clock and judging from the code it is exactly for this reason:
to either change/enable it or not.

With this patch you'll switch that to "always change it". Therefore,
shouldn't there be a dt flag to indicate wheter simple-audio-card/graph
should be in charge of the codecs clock input?

And its fetching just the first clock, doesn't it? What happens if a
codec has two clock inputs?

-michael

[0] 
https://patchwork.kernel.org/project/alsa-devel/patch/1611944866-29373-4-git-send-email-spujar@nvidia.com/
