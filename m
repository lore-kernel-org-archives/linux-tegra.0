Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C01BC433DB
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 16:43:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC64864FE9
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 16:43:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbhCKQmz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 Mar 2021 11:42:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:57940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229601AbhCKQme (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Mar 2021 11:42:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4193864F9C;
        Thu, 11 Mar 2021 16:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615480953;
        bh=/6vQFL+YC53+oP6/fdeoiyO4ZhYeLe3QT/YKKRdQyYY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eR71nWvdnbgmZqCoFZFfpumRGVzmdJTDmB64hingCLqVQQRXFhTLfcutl2Bfsxy01
         28MHy50cfVkV4BQeNI1j4muoeiVmyUbFZmmFI5HyicrY7tSRG15MqLD1xwvt704x9O
         8Zm5HWkhWFUI07wObuNbzQHeYgxuARESL4yTNGHOjX5bOumTWAesVqQnk7K09G9O16
         GZA3troXIT6iGqun/ydwipRCYdN1Y3PuuVmAWzdjsfC1snmJYfcw9rZdO5PD+GK70h
         mRbXGC4DNt0VNFS5UWyRYTklKGLqSLWDYNwJhURI2IwTRw0+0nkuIbmhw54rVRWNGm
         pjOXWwstfsySg==
Date:   Thu, 11 Mar 2021 16:41:21 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Michael Walle <michael@walle.cc>
Cc:     Sameer Pujar <spujar@nvidia.com>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, jonathanh@nvidia.com,
        kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, robh@kernel.org, sharadg@nvidia.com,
        thierry.reding@gmail.com
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
Message-ID: <20210311164121.GH4962@sirena.org.uk>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
 <20210309144156.18887-1-michael@walle.cc>
 <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
 <611ed3362dee3b3b7c7a80edfe763fd0@walle.cc>
 <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
 <eb26f8e0a4c99d0c9de9d92612102718@walle.cc>
 <fa654e7a-80cc-7ae8-15c6-780e7fa29bb1@nvidia.com>
 <cadc59f29bbb2e0d02235d4c10cb7f4d@walle.cc>
 <36c37df5-dffb-9168-d92f-4b3e482602fa@nvidia.com>
 <d4947632a8b3ebefff7fb6751d05a9bd@walle.cc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gKijDXBCEH69PxaN"
Content-Disposition: inline
In-Reply-To: <d4947632a8b3ebefff7fb6751d05a9bd@walle.cc>
X-Cookie: I'm rated PG-34!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--gKijDXBCEH69PxaN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 11, 2021 at 04:43:20PM +0100, Michael Walle wrote:

> This could be a last resort, yes. But I'd rather see a flag which
> indicates whether the simple-audio-card should control the (first)
> clock of the codec or not. Because until now, this wasn't the case.
> And I don't know if this was an oversight or on purpose. Kuninori would
> need to comment on that. And with the "we change mclk by default", we
> break codecs with automatic sysclk generation.

It shouldn't break anything so long as the clock ends up correct via
some path.  Where there's multiple options we can also try going through
them in some order, preferring the clock in the CODEC would probably
make sense from both a compatibility and quality point of view.

> > > And its fetching just the first clock, doesn't it? What happens if a
> > > codec has two clock inputs?

> > Yes, it would have been more descriptive if it were specifically
> > looking for clock "mclk". I think the original assumption was codec
> > takes one input clock (MCLK) and uses it for sysclk.

> Yeah, I've just noticed that the clk_get_rate() also only works
> for the first clock of the codec.

simple-audio-card isn't really intended to work with complex devices,
it's very much only for the simplest of use cases.

--gKijDXBCEH69PxaN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBKSDAACgkQJNaLcl1U
h9BNawf9GPsQcYK9qmE3//5SNFERoM69/yBv84rbvNTtsS0rkB4/XlhUxFM/yrhI
6PbCDI9RiR1smLwcBsrRv9z3/NPQ2sVeW8uOWvWQvXjPMWxSqNSU6XRVUBFBwuZv
m4UZqd9ldjRxLGajUkhVCWKCAJ4cx0hx3TvwBjAbKYCfsfFpC6Xx+UcNxsOnMeXt
FuzFO4NZ7zmnCBRpsa74nvjfoWdb+FCvh15SVz4anlEeD8fagk5Nf4QZT+KgE+nD
xyqchbWdLgFDs4lLfHlxAt/Pu62fPs8gcNPbfVFO8m4Ge638UVbFipmEhoMaubt0
TsIEC7GPWF9EMTk0JQs5kHnrAAAoQA==
=EORL
-----END PGP SIGNATURE-----

--gKijDXBCEH69PxaN--
