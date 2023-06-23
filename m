Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5B3EB64D7
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Jun 2023 15:02:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232214AbjFWPCt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 23 Jun 2023 11:02:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231433AbjFWPCs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Jun 2023 11:02:48 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47F8010F6;
        Fri, 23 Jun 2023 08:02:46 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id EF7E35C00E5;
        Fri, 23 Jun 2023 11:02:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 23 Jun 2023 11:02:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1687532562; x=1687618962; bh=9H
        BC451nYmRe1mMwl7YlJpIjFCmK1bCb8pE/bk/d8TA=; b=3C1bcvS7mOwr6y0PfA
        U5DANpibBdDEqo6HUePEjacFKBr3Hk7dR+ud79/Ai4X6aG9tvyQ8/DVHCoZffWfV
        43J6Wu6Vz/j1Be2LtTqjTsWjfxD+d4Jyfc/T30awy0He8mKHV6KYJDicY9dzfFsn
        28Uh/uzAg+uXF3MpuTCwC/f6iiElx7rW3LkzqhL9zIJuPdXVZzniilCo+CyLxb2S
        I9sP2rx0qMtBfQSZyFuWEiUWpVabqnKfY2/ltXi852T0NZD3D4ewdkXE/mVsk8o+
        FCMjOmQIp1ebhGMvRWNtSidlcHD5RYtSlm/i4N2GWVI+W7IGetjYxl8xlE4uRGFK
        NrpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1687532562; x=1687618962; bh=9HBC451nYmRe1
        mMwl7YlJpIjFCmK1bCb8pE/bk/d8TA=; b=P3HDaludACD9PEwcD16ogmZcGvoia
        ftNQhlzLXvG/lfQ06A/7U9sykIJz8TIdI6OXbY5Zpz5DA0MFuvyh2agVXZi7Qkrg
        eg0Qj9t5Fw+ixhVPyrzZC9EPol7SYRfcgRrYU57CSCeO9UDSpv7vwvqEr+NVG0hC
        2fiza7lXvW5X/vlZjefHZWKew+99vfV/MfOB2bfPEJWDXscvs2cAxSVc9Kkw++PQ
        S6lgWzs6z74O6L9GZyQzkuhkSOh/XCt6Vkqej3B15SJkMaws73tUD44/XTwonpU1
        GerZMJCc2RmhwKtMqFjWnewM5wAioh4dLVznfOaoll99F1UTgEJ0AhXyQ==
X-ME-Sender: <xms:ErSVZKA1E2EERnFzwwDTaoWCn_f25kCQA3b0nG2cei2R6SUCOu9pwQ>
    <xme:ErSVZEix0Q5PnIojS8FVsxtKevDGXIxcASKFM1vNoJvHlhm8t2Szpm-V0p2k4_CoY
    PJH5HTzybg6NuvHYWo>
X-ME-Received: <xmr:ErSVZNmDT4qiIThmdVKm9eQXKioi9gkweEOsrE4pidpyN4cFocKhwACQOg7oKVbEDtQ7m3rczbw0eUV-njP9GQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeggedgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtjeenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeeludefgeduheevleejiefgheetvdffheejvdejvefhudeuveehueevvdev
    veeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ErSVZIyFP1Mjv60rMsKRfT4wqjg0GWonCK9UO1zbbrxinRwUc6ZB8A>
    <xmx:ErSVZPRoW0UH-BrrSs9JJykTuOIsdxOa9yEPaMPs4C2NTZoiaJ63lw>
    <xmx:ErSVZDaEDYKs_MPkCRNPeSoWRHkF0_qZu6kGPKwVcGCYhz-UMhiSFQ>
    <xmx:ErSVZIQdqq3csLPqVu9XnaG9nOpKDs1FNNARZ3rl1sJiSNVkg15vjQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Jun 2023 11:02:41 -0400 (EDT)
Date:   Fri, 23 Jun 2023 17:02:34 +0200
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
Message-ID: <ndbpoa3d53xzfcnpqilipvrt7jggn2ye6hld5idvgl5dty6qax@hh25esensjpy>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
 <20221018-clk-range-checks-fixes-v4-65-971d5077e7d2@cerno.tech>
 <700c0c62-defd-01c1-3b1d-8a760dfa194f@gmail.com>
 <rgvgzbebuvehxhjxgalkqswodyt5mvh7vr57synt3gsuadlpj2@j2mlwe2tozeb>
 <ebfdd001b9e83199ec618362b79f689c.sboyd@kernel.org>
 <ZJMYrVl--rCcj1cB@orome>
 <p2qdhxxadsxakzgr2c5n6vs5tbfnjd22faynsl45jzooh7eejf@b5hzujmccljl>
 <ZJWxbyCFQVr6K3d3@orome>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kiqchr65ncyvwplr"
Content-Disposition: inline
In-Reply-To: <ZJWxbyCFQVr6K3d3@orome>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--kiqchr65ncyvwplr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 23, 2023 at 04:51:27PM +0200, Thierry Reding wrote:
> On Thu, Jun 22, 2023 at 01:24:12PM +0200, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Wed, Jun 21, 2023 at 05:35:09PM +0200, Thierry Reding wrote:
> > > On Tue, Jun 20, 2023 at 12:09:09PM -0700, Stephen Boyd wrote:
> > > > Quoting Maxime Ripard (2023-06-19 00:26:19)
> > > > > On Mon, Jun 19, 2023 at 02:38:59AM +0300, Dmitry Osipenko wrote:
> > > > > > 05.05.2023 14:26, Maxime Ripard =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > > > > >=20
> > > > > > > diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegr=
a/clk-super.c
> > > > > > > index 3f3a7a203c5f..7ec47942720c 100644
> > > > > > > --- a/drivers/clk/tegra/clk-super.c
> > > > > > > +++ b/drivers/clk/tegra/clk-super.c
> > > > > > > @@ -142,15 +142,22 @@ static const struct clk_ops tegra_clk_s=
uper_mux_ops =3D {
> > > > > > >     .restore_context =3D clk_super_mux_restore_context,
> > > > > > >  };
> > > > > > > =20
> > > > > > > -static long clk_super_round_rate(struct clk_hw *hw, unsigned=
 long rate,
> > > > > > > -                            unsigned long *parent_rate)
> > > > > > > +static int clk_super_determine_rate(struct clk_hw *hw,
> > > > > > > +                               struct clk_rate_request *req)
> > > > > > >  {
> > > > > > >     struct tegra_clk_super_mux *super =3D to_clk_super_mux(hw=
);
> > > > > > >     struct clk_hw *div_hw =3D &super->frac_div.hw;
> > > > > > > +   unsigned long rate;
> > > > > > > =20
> > > > > > >     __clk_hw_set_clk(div_hw, hw);
> > > > > > > =20
> > > > > > > -   return super->div_ops->round_rate(div_hw, rate, parent_ra=
te);
> > > > > > > +   rate =3D super->div_ops->round_rate(div_hw, req->rate,
> > > > > > > +                                     &req->best_parent_rate);
> > > > > > > +   if (rate < 0)
> > > >=20
> > > > There's the report that this condition is never possible. Maybe the
> > > > previous code was relying on an error value sometimes. Can we add
> > > > determine_rate to the div_ops and simplify this code? I asked on the
> > > > list for that earlier.
> > >=20
> > > I was able to reproduce this on a Tegra30 Beaver, but the problem is
> > > more straightforward than this. The crash I was seeing during boot was
> > > because cclk_super_determine_rate() was still calling the round_rate()
> > > callback from tegra_clk_super_ops, which this patch removed (and added
> > > determine_rate() instead).
> > >=20
> > > The following fixes the problem for me. It's basically converting the
> > > round_rate() call to an equivalent determine_rate() call.
> >=20
> > Thanks for figuring it out :)
> >=20
> > > Dmitry, can you verify that this fixes the issue that you were seeing?
> > >=20
> > > Thierry
> > >=20
> > > --- >8 ---
> > > diff --git a/drivers/clk/tegra/clk-tegra-super-cclk.c b/drivers/clk/t=
egra/clk-tegra-super-cclk.c
> > > index 68d7bcd5fc8a..8a2bb4ae4fd2 100644
> > > --- a/drivers/clk/tegra/clk-tegra-super-cclk.c
> > > +++ b/drivers/clk/tegra/clk-tegra-super-cclk.c
> > > @@ -86,9 +86,16 @@ static int cclk_super_determine_rate(struct clk_hw=
 *hw,
> > >  	if (rate <=3D pllp_rate) {
> > >  		if (super->flags & TEGRA20_SUPER_CLK)
> > >  			rate =3D pllp_rate;
> > > -		else
> > > -			rate =3D tegra_clk_super_ops.round_rate(hw, rate,
> > > -							      &pllp_rate);
> > > +		else {
> > > +			struct clk_rate_request parent =3D {
> > > +				.rate =3D req->rate,
> > > +				.best_parent_rate =3D pllp_rate,
> > > +			};
> >=20
> > If it works and you submit a patch later, this needs to be changed to
> > clk_hw_init_rate_request()
>=20
> I've tried this and while it seems to work, this doesn't seem to be
> exactly the same as what the original code does. From what I understand
> the parent clock can be either pll-p or pll-x, but what we want to do in
> this branch is check what a configuration would look like for pll-p as
> the parent. clk_hw_init_rate_request() would initialize the request with
> data for the current parent, even if that's not pll-p, so I'm a bit
> hesitant to go with that instead of manually hard-coding this to pll-p.

Ah, yes, sorry.

Maybe we need some kind of variant to address this then, but for the
time being you can at least set req->min_rate and req->max_rate using
clk_hw_get_rate_range.

Maxime

--kiqchr65ncyvwplr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZJW0CgAKCRDj7w1vZxhR
xck6AP47jjiyIfFjhhpeDI4+/14ZAIO+9jSyjHNkE/ehNkrcLwEA2RCqRJO2QWME
zvVMKV63J34Zd1ilFsSnX7zvlRWu1w4=
=Y4Yr
-----END PGP SIGNATURE-----

--kiqchr65ncyvwplr--
