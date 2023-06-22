Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B12DEB64DB
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Jun 2023 11:24:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbjFVLYT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 22 Jun 2023 07:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbjFVLYS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Jun 2023 07:24:18 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CA0519B7;
        Thu, 22 Jun 2023 04:24:16 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 630BC5C0115;
        Thu, 22 Jun 2023 07:24:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 22 Jun 2023 07:24:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1687433055; x=1687519455; bh=o2
        MmCJ8HMUDAShZVi0Bh2snz/uRcvgvR9MHnuWwH1qI=; b=m93HAc0bh1BmldktsZ
        RPyEeHvnYyyyx9uXDZMcXsKvt+1PVkw/kJ6FYXFHt83MnZZU98+sPdXGLc5sX8ds
        VfJD5dUkj+tNuqEFaMMXob8Xnv3bTFplcntvTDFvS9fCtuIDEMVGqQuZStyydqjP
        T+d/DiSxTDnlnvGOxSWf4jCK7aCKDqIHGpkJr0RVGceF9NcT7gi/IKeBp7WoovW5
        XfnlY13bpYuLNF5R5iXVHO4/KpJRNWcwWnbZ66152n5i4a8aJBDVuZVBlHuE8/jJ
        S/oUKqrWx0KYew6wVB+scbgC/83K2Qzltm6anrs9lZafFoAGf15QBw+7YDjiXgm/
        zVGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1687433055; x=1687519455; bh=o2MmCJ8HMUDAS
        hZVi0Bh2snz/uRcvgvR9MHnuWwH1qI=; b=bzKsA0gys5YJNYQgtL/Y8WjnHXMIm
        s/izMqemQfWem6l2paOlQBwlVQr3Wm8U/2tXbHcJNdWRhQIvplJv3zygy5GTi8p/
        3eXieLsXa3eJgma+9pUCzUojGLAPQBsLcmEoaywIf0JPXLCFZVlskEcapnS9eSoF
        WdE4h+qB9xzYmWnyvQ6WxmVyYpTuhDuDJNLg8hkvceajJxC4WEvCZZLsS7EWcjX/
        XnhTQHzzYiPT5LfSxZ8mFtp+UyT1tczT4iE8dPmxQEUnYhtfUpT+AMrhGq51nUoC
        3ejTp4ugql2ZHRd1KGWpHVRQTpMvJeqBhNX2olrGc4QiJsrK5FY60lCdQ==
X-ME-Sender: <xms:Xy-UZAxJispdhHG6UKwIi82uXa-1pwJBUrR800gs-DZPQyNVJ6B4YA>
    <xme:Xy-UZET-h4E3Q_XHfSLDljPpX7KyDiHef9Z-KnOl9grZa1c31cqG8SxZNAfxgZavM
    8S1DGbdFxHtejcj4kQ>
X-ME-Received: <xmr:Xy-UZCWzaKsUgAItvV16b5IwzaRikIMKPibzMKFGsPa5qL_APXoNKZ6OIJ7Fib0fVRRUDZb9waiiEWIgdVVckQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeguddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtjeenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeeludefgeduheevleejiefgheetvdffheejvdejvefhudeuveehueevvdev
    veeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Xy-UZOjwho2YoDC2tXK5E9OEVRsKFgRnGru31DhOL-jP8W-NxgaGeA>
    <xmx:Xy-UZCDHCAGspnZxsAELENtVznumZmlKtlTqBa-jWsvq2knLbxRCVQ>
    <xmx:Xy-UZPIkCiZzsBhtjYawiN87UgCeAnhEWchK7dN4AZ55fyAKa4M5fA>
    <xmx:Xy-UZIChvZz4U7U7_emu6rqn8BlTMkFOqYCMUjbFdBP_bS_T1gvfeg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jun 2023 07:24:14 -0400 (EDT)
Date:   Thu, 22 Jun 2023 13:24:12 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 65/68] clk: tegra: super: Switch to determine_rate
Message-ID: <p2qdhxxadsxakzgr2c5n6vs5tbfnjd22faynsl45jzooh7eejf@b5hzujmccljl>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
 <20221018-clk-range-checks-fixes-v4-65-971d5077e7d2@cerno.tech>
 <700c0c62-defd-01c1-3b1d-8a760dfa194f@gmail.com>
 <rgvgzbebuvehxhjxgalkqswodyt5mvh7vr57synt3gsuadlpj2@j2mlwe2tozeb>
 <ebfdd001b9e83199ec618362b79f689c.sboyd@kernel.org>
 <ZJMYrVl--rCcj1cB@orome>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gholgrwc3kzuoraf"
Content-Disposition: inline
In-Reply-To: <ZJMYrVl--rCcj1cB@orome>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--gholgrwc3kzuoraf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 21, 2023 at 05:35:09PM +0200, Thierry Reding wrote:
> On Tue, Jun 20, 2023 at 12:09:09PM -0700, Stephen Boyd wrote:
> > Quoting Maxime Ripard (2023-06-19 00:26:19)
> > > On Mon, Jun 19, 2023 at 02:38:59AM +0300, Dmitry Osipenko wrote:
> > > > 05.05.2023 14:26, Maxime Ripard =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > > >=20
> > > > > diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/cl=
k-super.c
> > > > > index 3f3a7a203c5f..7ec47942720c 100644
> > > > > --- a/drivers/clk/tegra/clk-super.c
> > > > > +++ b/drivers/clk/tegra/clk-super.c
> > > > > @@ -142,15 +142,22 @@ static const struct clk_ops tegra_clk_super=
_mux_ops =3D {
> > > > >     .restore_context =3D clk_super_mux_restore_context,
> > > > >  };
> > > > > =20
> > > > > -static long clk_super_round_rate(struct clk_hw *hw, unsigned lon=
g rate,
> > > > > -                            unsigned long *parent_rate)
> > > > > +static int clk_super_determine_rate(struct clk_hw *hw,
> > > > > +                               struct clk_rate_request *req)
> > > > >  {
> > > > >     struct tegra_clk_super_mux *super =3D to_clk_super_mux(hw);
> > > > >     struct clk_hw *div_hw =3D &super->frac_div.hw;
> > > > > +   unsigned long rate;
> > > > > =20
> > > > >     __clk_hw_set_clk(div_hw, hw);
> > > > > =20
> > > > > -   return super->div_ops->round_rate(div_hw, rate, parent_rate);
> > > > > +   rate =3D super->div_ops->round_rate(div_hw, req->rate,
> > > > > +                                     &req->best_parent_rate);
> > > > > +   if (rate < 0)
> >=20
> > There's the report that this condition is never possible. Maybe the
> > previous code was relying on an error value sometimes. Can we add
> > determine_rate to the div_ops and simplify this code? I asked on the
> > list for that earlier.
>=20
> I was able to reproduce this on a Tegra30 Beaver, but the problem is
> more straightforward than this. The crash I was seeing during boot was
> because cclk_super_determine_rate() was still calling the round_rate()
> callback from tegra_clk_super_ops, which this patch removed (and added
> determine_rate() instead).
>=20
> The following fixes the problem for me. It's basically converting the
> round_rate() call to an equivalent determine_rate() call.

Thanks for figuring it out :)

> Dmitry, can you verify that this fixes the issue that you were seeing?
>=20
> Thierry
>=20
> --- >8 ---
> diff --git a/drivers/clk/tegra/clk-tegra-super-cclk.c b/drivers/clk/tegra=
/clk-tegra-super-cclk.c
> index 68d7bcd5fc8a..8a2bb4ae4fd2 100644
> --- a/drivers/clk/tegra/clk-tegra-super-cclk.c
> +++ b/drivers/clk/tegra/clk-tegra-super-cclk.c
> @@ -86,9 +86,16 @@ static int cclk_super_determine_rate(struct clk_hw *hw,
>  	if (rate <=3D pllp_rate) {
>  		if (super->flags & TEGRA20_SUPER_CLK)
>  			rate =3D pllp_rate;
> -		else
> -			rate =3D tegra_clk_super_ops.round_rate(hw, rate,
> -							      &pllp_rate);
> +		else {
> +			struct clk_rate_request parent =3D {
> +				.rate =3D req->rate,
> +				.best_parent_rate =3D pllp_rate,
> +			};

If it works and you submit a patch later, this needs to be changed to
clk_hw_init_rate_request()

Maxime

--gholgrwc3kzuoraf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZJQvXAAKCRDj7w1vZxhR
xTjxAP9ehs86l6sru4prW3L7eAyFmbShO1bdRkjCqNyQL7z5bAD6A012+Eo014am
UvaiwGOrgvvMLCQzwa69Spo0j7liEws=
=fuL3
-----END PGP SIGNATURE-----

--gholgrwc3kzuoraf--
