Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D9EC433DB
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Mar 2021 15:41:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E72F164EBD
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Mar 2021 15:41:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhCOPku (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 15 Mar 2021 11:40:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:34180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229878AbhCOPkk (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 Mar 2021 11:40:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C873D64E83;
        Mon, 15 Mar 2021 15:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615822840;
        bh=MS5Knu7+w8zdHfWpQWdZkvJd0j/NrYsIJsEVkwhZVDQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e64CxbdGXxbBfrxyhDLcr7WRIhiuR0a+/AVwYupgntpowlAHQLiRpuTzJvJ5dImec
         FyCjaw9bWiJ1XmtwLNXIw5yM8LX2t/xrGBVxJaoTZiBd0vy9k6sxpoQMoWbEwDFlEp
         YfpIK5M7p+80lajKUg7sIvMt8pLuctDMypsMMkDyxJVwlrm7ZQ+z9Z62+FSdvMgu1R
         5OJ3C0WeMrUJq/xrsEEuP6OCFSzWbu06Bn1aFETfDmMJ3JWGmfDekIJzrU5Vbpz/Ga
         sTZa7s81g4I78AHRLUPunzc5wBHPH5tNAyKtHkvhNLJ+6/Bpgp4Pf1N7HaIFK3xi8l
         dfwkaAmGrA1aw==
Date:   Mon, 15 Mar 2021 15:39:25 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     Michael Walle <michael@walle.cc>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, jonathanh@nvidia.com,
        kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, robh@kernel.org, sharadg@nvidia.com,
        thierry.reding@gmail.com
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
Message-ID: <20210315153925.GC4595@sirena.org.uk>
References: <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
 <20210311161558.GG4962@sirena.org.uk>
 <f21b87f1afb3eda54b5f00f2d1c146d3@walle.cc>
 <20210312113544.GB5348@sirena.org.uk>
 <6ed28bb5330879b1919aced5174f319f@walle.cc>
 <20210312120456.GD5348@sirena.org.uk>
 <684332700f8be9f77348a510eb6eba22@walle.cc>
 <20210312134642.GF5348@sirena.org.uk>
 <8cdf1cfa971945792b509a687a4de735@walle.cc>
 <6af6439c-bdb8-cd0f-635d-069040ba5b65@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uXxzq0nDebZQVNAZ"
Content-Disposition: inline
In-Reply-To: <6af6439c-bdb8-cd0f-635d-069040ba5b65@nvidia.com>
X-Cookie: Close cover before striking.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--uXxzq0nDebZQVNAZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 15, 2021 at 08:49:00PM +0530, Sameer Pujar wrote:
> On 3/15/2021 5:35 PM, Michael Walle wrote:
> > Am 2021-03-12 14:46, schrieb Mark Brown:

> > Sameer, it looks like the proper fix should be to add the clock
> > support to your codec.

> I agree that complicated clock relationships should be handled within the
> codec itself, however MCLK rate setting depends on "mclk-fs" factor and this
> property is specified as part of simple-card/audio-graph-card codec subnode.
> Right now codec, in general, does not have a way to know this. The
> set_sysclk() callback takes rate argument and not the factor. Moreover the

I just don't understand what you're saying here at all.  At the point
where the card is setting the clock API clock rate it can just as well
set a sysclk, these are equivalent operations.

> same codec is used by other platform vendors too and unless a new DT
> property is added for codec, runtime MCLK update based on the scaling factor
> cannot be supported. This would mean that we will be having two methods to
> specify "mclk-fs" factor, one from simple-card/audio-graph-card and one from
> respective codec nodes, which does not seem ideal.

Again I just can't follow what you're saying here at all.  Again, if the
card is able to set a clock API clock rate it can just as well set a
clock rate via sysclk.

> Yes this is a problem, unfortunately I missed checking some of the
> simple-card examples. I wonder we should be specifically looking for "mclk"
> clock here.

That would definitely help mitigate the problem but I really think it's
cleaner and safer to just push this down to set_sysclk().

--uXxzq0nDebZQVNAZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBPf6wACgkQJNaLcl1U
h9Anfwf+NP6HDFtTMIGn540KNLqeTA05Iyt+oW7RwSiBDgEcmupxmx+Zg3B5DtBv
91x/ITUTS+eelZ+Vt2drZY36xNxgj1rY5Zp0P4iI0+dsUabcPlueyYy34Rt8kjip
jyNpLbAJb4RjpfEVssyo2UGKRdon7YwHbz+zgBQt6dxUAumaQa9HrsNDZhxQxe/A
KAeErTEhg62Z9lazAxPupmgLZyGwa4E6z80yb4t6snS182xNsGGz1iwV0F+9Ccr6
Rw3bR3UXovnJXjv7sDgJGBL7MQ/W0TAs3wmbnkAYtQ2Px/WQgvvxPHgGN0cWebKE
xGoRNVLAazs4y/mJB7875+CfQ1plPA==
=Fwtg
-----END PGP SIGNATURE-----

--uXxzq0nDebZQVNAZ--
