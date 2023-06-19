Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 133D4EB64DB
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Jun 2023 07:26:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbjFSH01 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 19 Jun 2023 03:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjFSH00 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 19 Jun 2023 03:26:26 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EFE31A4;
        Mon, 19 Jun 2023 00:26:25 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 1FEF05C01C1;
        Mon, 19 Jun 2023 03:26:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 19 Jun 2023 03:26:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1687159582; x=1687245982; bh=ZN
        Vhpvgukfm6Pxdscg2Aaz6zO8nOY6hpsxHfjM3TO50=; b=Wm64XCQC6PFy+qm63/
        piDawXvmSvvsHQDW7W0vcVvwYrLqhasceDAtcJ1tWGbKEXv0qvYbCZn18oTcJjBB
        4GUGEqrErxk5174k8A3Y5EAUdbdmawN5FK8tT8nzzifuxYn3nLfBKYFfq4Kcfcdq
        iuGC1QvLBQXHaL1sSOITappNyxVkV/ur0W9hqDnQ01Xyci8Fm05U+WpXv81wr/FQ
        9fnI3+vlkJ6hkdXLN2FJVA7LXDjOCnQhHGn3zh0I24RdM1ZWelRczz/eTp8nl63K
        S93+8XqWDazMm3dslnJEoHBbdPuXNqbelH8WQEP4wYD80ZypOOPVDWWc8zv6I73Q
        3ejg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1687159582; x=1687245982; bh=ZNVhpvgukfm6P
        xdscg2Aaz6zO8nOY6hpsxHfjM3TO50=; b=H5ZkRC5y06qaujpMjpUvlve1hEHvl
        zQRnE/9o2O2623CiHUDXViD5tRUr1uOtKsTXbLbBWkF3jDwxnW3lGUDEG+Rl0ZAP
        WK1SJipDS9t373fFMWD1LFpMODkiaMozXAVphx98xfPwi5CMICnQhv0/Xq98MWK4
        a0IDHPSwiIApdD0cfJMh02ZYJmqKlQZGSFIhcuqmI/IgnRB/hW5IZpyZjTi2Y2p8
        QT3Ob4BSpB+8rx3bVbjDZx/tOwTetm8zBjjfuuledGHdwEMuOhN3RD2wZaFv1GGF
        L+qm0MNCeqP+SyU6wTgj3f8u7W8cgS8e7V3kOGC5ihta5QSMpmDVdyzwQ==
X-ME-Sender: <xms:HQOQZHcySC9lT2cvZKy045V6t9MhKvso0JIjQSlR8NXoOBhbLrWZbw>
    <xme:HQOQZNOCvv6tXhuXaYVPWoHykdOXBUUWEA0VHzWPy9pcSLYuKVi993H_EQBtNASaN
    T7aQYMDiUSxVqFOD_w>
X-ME-Received: <xmr:HQOQZAieiyzw1LVITz50Z1S5ILBeLImdFz1iw28h5_FXAtOhc6Cn3vrteMApggIG0N7f_NkraJtqgAug2T8Y-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeefuddguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtdfsredttdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepueeuteetgfduveeuueejiedtvefgtefhgeeiieelfeeuuefgveduieel
    gfffgfeknecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
    vggthh
X-ME-Proxy: <xmx:HQOQZI_lsEt4fEcwMngCM9sc9dGaM0XykO8Nel4O569x0S-vEr2DpA>
    <xmx:HQOQZDv8pwbHSG7U5dlmC5o7DhV4k4F3iOPdkT23Fk_1UJy7kbOXRw>
    <xmx:HQOQZHEDbvOP7jfhBDCr04Dqmqsm5Xd6d1W1EPXfJadm1glDYBDHGQ>
    <xmx:HgOQZM9naoUyDJ8urtS-8MI8fq7jL6CQyQ-1f6VvpPTKf7-GkVSRdg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jun 2023 03:26:21 -0400 (EDT)
Date:   Mon, 19 Jun 2023 09:26:19 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 65/68] clk: tegra: super: Switch to determine_rate
Message-ID: <rgvgzbebuvehxhjxgalkqswodyt5mvh7vr57synt3gsuadlpj2@j2mlwe2tozeb>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
 <20221018-clk-range-checks-fixes-v4-65-971d5077e7d2@cerno.tech>
 <700c0c62-defd-01c1-3b1d-8a760dfa194f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="csfklsakzv3gu57q"
Content-Disposition: inline
In-Reply-To: <700c0c62-defd-01c1-3b1d-8a760dfa194f@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--csfklsakzv3gu57q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Mon, Jun 19, 2023 at 02:38:59AM +0300, Dmitry Osipenko wrote:
> 05.05.2023 14:26, Maxime Ripard =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > The Tegra super clocks implements a mux with a set_parent hook, but
> > doesn't provide a determine_rate implementation.
> >=20
> > This is a bit odd, since set_parent() is there to, as its name implies,
> > change the parent of a clock. However, the most likely candidate to
> > trigger that parent change is a call to clk_set_rate(), with
> > determine_rate() figuring out which parent is the best suited for a
> > given rate.
> >=20
> > The other trigger would be a call to clk_set_parent(), but it's far less
> > used, and it doesn't look like there's any obvious user for that clock.
> >=20
> > So, the set_parent hook is effectively unused, possibly because of an
> > oversight. However, it could also be an explicit decision by the
> > original author to avoid any reparenting but through an explicit call to
> > clk_set_parent().
> >=20
> > The driver does implement round_rate() though, which means that we can
> > change the rate of the clock, but we will never get to change the
> > parent.
> >=20
> > However, It's hard to tell whether it's been done on purpose or not.
> >=20
> > Since we'll start mandating a determine_rate() implementation, let's
> > convert the round_rate() implementation to a determine_rate(), which
> > will also make the current behavior explicit. And if it was an
> > oversight, the clock behaviour can be adjusted later on.
> >=20
> > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
> > Cc: Prashant Gaikwad <pgaikwad@nvidia.com>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: linux-tegra@vger.kernel.org
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/clk/tegra/clk-super.c | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-supe=
r.c
> > index 3f3a7a203c5f..7ec47942720c 100644
> > --- a/drivers/clk/tegra/clk-super.c
> > +++ b/drivers/clk/tegra/clk-super.c
> > @@ -142,15 +142,22 @@ static const struct clk_ops tegra_clk_super_mux_o=
ps =3D {
> >  	.restore_context =3D clk_super_mux_restore_context,
> >  };
> > =20
> > -static long clk_super_round_rate(struct clk_hw *hw, unsigned long rate,
> > -				 unsigned long *parent_rate)
> > +static int clk_super_determine_rate(struct clk_hw *hw,
> > +				    struct clk_rate_request *req)
> >  {
> >  	struct tegra_clk_super_mux *super =3D to_clk_super_mux(hw);
> >  	struct clk_hw *div_hw =3D &super->frac_div.hw;
> > +	unsigned long rate;
> > =20
> >  	__clk_hw_set_clk(div_hw, hw);
> > =20
> > -	return super->div_ops->round_rate(div_hw, rate, parent_rate);
> > +	rate =3D super->div_ops->round_rate(div_hw, req->rate,
> > +					  &req->best_parent_rate);
> > +	if (rate < 0)
> > +		return rate;
> > +
> > +	req->rate =3D rate;
> > +	return 0;
> >  }
> > =20
> >  static unsigned long clk_super_recalc_rate(struct clk_hw *hw,
> > @@ -193,7 +200,7 @@ const struct clk_ops tegra_clk_super_ops =3D {
> >  	.get_parent =3D clk_super_get_parent,
> >  	.set_parent =3D clk_super_set_parent,
> >  	.set_rate =3D clk_super_set_rate,
> > -	.round_rate =3D clk_super_round_rate,
> > +	.determine_rate =3D clk_super_determine_rate,
> >  	.recalc_rate =3D clk_super_recalc_rate,
> >  	.restore_context =3D clk_super_restore_context,
> >  };
> >=20
>=20
> Tegra30 doesn't boot anymore with this change. Best would be to keep the
> old behaviour for both sclk and periph tegra clocks.

I took a closer look at the patch and can't find anything different to
what the core is doing if there's a round_rate implementation:
https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk.c#L1459

Also, it's not clear to me how that driver is used. It looks like
div_ops is always supposed to be set, and super clocks are registered
with either tegra_clk_register_super_clk() or tegra_clk_register_super_mux()

tegra_clk_register_super_clk() sets the div_ops pointer to
tegra_clk_super_ops, but tegra30 doesn't seem to call it.

tegra_clk_register_super_mux() doesn't set the div_ops pointer, but is
used by tegra30, so I would assume that it's the broken one. But I'm
confused, since div_ops doesn't seem to be set anywhere?

Maxime

--csfklsakzv3gu57q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZJADGwAKCRDj7w1vZxhR
xfiwAPwPgxvKf+gKQ5dGbQVX/L6f5eXnGdA/sgm/pCKCM4V8RAD/a/IvIwgq0Asy
uMzj8S/CjwfhElVTrDigcvCAb6ZqLgc=
=LWDU
-----END PGP SIGNATURE-----

--csfklsakzv3gu57q--
