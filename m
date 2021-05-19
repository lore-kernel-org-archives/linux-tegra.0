Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CEEC43460
	for <linux-tegra@archiver.kernel.org>; Wed, 19 May 2021 20:09:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FAE2613AE
	for <linux-tegra@archiver.kernel.org>; Wed, 19 May 2021 20:09:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232858AbhESULL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 19 May 2021 16:11:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:49686 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232832AbhESULI (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 May 2021 16:11:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA4866135A;
        Wed, 19 May 2021 20:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621454988;
        bh=DxYkIdB3NoXfp/b7anhxq8gErDgzv0UGLQqtSRtpyY8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D4KRXBPap1zrtJwSFdZnqTNedw9xbrBfR8ibW5cTaxFVYcIND6gzzSVL1SFhSQLI7
         J7Pjxf3qeuzGHelHlVwbn3LdK2UrEFUiM/42Hmm7UhcP3Ep+0tIPaJmEGE2LWcYY00
         JMHNDx01zOu0dJdjUibtc9PYHUFja9fuFWy7Lb2An2weX40JPZt2grWnA+JZOz39im
         x9uQrJI8Psk/tJhhUYr8uKJ/u6t0JAa1xdxjaEb0RrRc0exUAPbdIsEDcDZa+kvs7S
         0qNjlgko7Az81mExs/bWaluUV0mIoyCS2x9AXTqpVxW8DBlEMPHExvSCz4sfRLjKmM
         xs9QoWmc1WuHg==
Date:   Wed, 19 May 2021 21:09:02 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] ASoC: tegra: Unify ASoC machine drivers
Message-ID: <20210519200902.GJ4224@sirena.org.uk>
References: <20210518001356.19227-1-digetx@gmail.com>
 <20210518001356.19227-3-digetx@gmail.com>
 <20210518180949.GA949047@robh.at.kernel.org>
 <20210518183455.GE4358@sirena.org.uk>
 <b924f76a-56dd-5ca3-229d-293f7ff1e81a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mFHiwr52TKrxpkjc"
Content-Disposition: inline
In-Reply-To: <b924f76a-56dd-5ca3-229d-293f7ff1e81a@gmail.com>
X-Cookie: There's no time like the pleasant.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--mFHiwr52TKrxpkjc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 18, 2021 at 11:16:48PM +0300, Dmitry Osipenko wrote:
> 18.05.2021 21:34, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> > It's generally the clocking configuration, things with fancy clock trees
> > don't play so nicely with generic systems where we want to configure
> > them at runtime, or things with complex routing in the CPU where we
> > only recently started getting bindings that were functional enough to
> > use.  Tegra is fairly complex internally.

> This is true, but still it's more optimal to use flags in a single
> common driver for the minor differences rather than to duplicate 90% of
> the code. In practice majority of tegra boards are derived from the same
> reference design, thus the h/w configurations are mostly the same.

If you can do it yes, though some of the CODECs can have sufficiently
interesting clocking to make it useful to do something different - not
sure if any of those are upstream though, WM8903 ought to with the right
board I think.

--mFHiwr52TKrxpkjc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmClcF4ACgkQJNaLcl1U
h9BMAgf+IBN65r2SkPO0SKO4VuwUiRBm9DNsLKDipdewyG5L+/rgOIOe8OIhjICd
b87aOjXfu/XWDF0dUuRp2d/WgkrakunNEbTO9SlNtGu5VWjfdbXZ4tEx8qHj7I+7
N5GSBVHeZ8NALnMOT+IoOUjSvHA7ZqGIj2Sd5vXjXOJJPsgeV3qKkJAgDfoY3Dv6
ZLVIyahTKvwnS4pV9n8NN7icxMvshmAo8jcMheNUfCabY9YM0YwYDORFPwIdKJHw
YLegZydKUAOuUcztxQw/GJbhYq0T7VBCFg7TH66dY8nleAvLVbVcQlCNaUPQ0+Lt
KZwwTHTaD3PbHYQXiOmw7y3h8LkXrg==
=JoYf
-----END PGP SIGNATURE-----

--mFHiwr52TKrxpkjc--
