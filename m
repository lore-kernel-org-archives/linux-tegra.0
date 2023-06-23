Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A81FBEB64DD
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Jun 2023 14:51:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232109AbjFWOve (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 23 Jun 2023 10:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbjFWOvd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Jun 2023 10:51:33 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0855F13E;
        Fri, 23 Jun 2023 07:51:32 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-311099fac92so865843f8f.0;
        Fri, 23 Jun 2023 07:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687531890; x=1690123890;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GWPNefMDyAgtV32k/k9l/iTX+NrL3zYtWQJRkI2m1Y=;
        b=NNl4mtfIF8WBE4F6i7MROzM0ImHtSLxi7Hya+i1wfGV4EBPwpAcr+Hc9dAsuaGj0Z8
         SVq9Ycnakb9iA8uThDmp8VdMH+afH6fHbMMO3njb8o1xMmpYve7dgNEszctyBPY/uso9
         d/BTaRY4m2Gw3C4H/dqOV7nO98ViotLIcuvz8AD06vzWSBvrfjzoIIYooHq3dG3F44wF
         iv+4BTVmeOg9ZGtNoC/NRnYLQ2vXrbLq3bPTEYE6BaiagXr2uUYnvbbjCDdSq/OiyQkS
         b5mQJDIGNtEzt+RPV8P/0utYygiHV9zYFGNRfTqQ4BNhTg8VRGBTyYkpTGA2ILKG+lw8
         gyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531890; x=1690123890;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GWPNefMDyAgtV32k/k9l/iTX+NrL3zYtWQJRkI2m1Y=;
        b=JhhQ1D546rimmtaS++PhUmzvuU2uPnXerK5jbnB7Ks98DcrRvl4QOB0i+8F5xxUT9/
         fM/9DqOjnRH0rr74YgExjs6jCYVMFczS9RgmD0SqXhevJ/emta3X+pYzQrjs4/EVdHaM
         mBRcBiwgxZbIpCdHlVFrc2dwCBPozf9U/gaIjw4Cs3Qev1iAvkF8fGl2ZdCO5KpKvIDv
         XkJ2Nb5wfgIVgvy8xYQPirlU7jqaLIWr9VnTcA0n0rnSLhT2ATpmvBxpJl7Yul/Xj2DO
         peytAACblpkjZz5xaDtW0XAWPPzEb0J3bLr8YV4aihrdpF4PWlLduT0GqbkydvqIyfE+
         /GAQ==
X-Gm-Message-State: AC+VfDwTr1Z4wp7UNtzE1gZT/S/tf5A4MqTYsrVzsGrTKWai41gpRVHq
        XFT71L0tvtSA1mgbSG+aGsM=
X-Google-Smtp-Source: ACHHUZ67a7sNPn2DrAUfig8qsrTDuH8nDqZc9PjE2leY+3VaCgEhkT+Wwj14GmCB3eKk5nPlIraXig==
X-Received: by 2002:a5d:5608:0:b0:30e:3f55:ebc9 with SMTP id l8-20020a5d5608000000b0030e3f55ebc9mr18667510wrv.13.1687531890070;
        Fri, 23 Jun 2023 07:51:30 -0700 (PDT)
Received: from orome (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id m18-20020adfdc52000000b003113b3bc9d7sm9657765wrj.32.2023.06.23.07.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:51:29 -0700 (PDT)
Date:   Fri, 23 Jun 2023 16:51:27 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 65/68] clk: tegra: super: Switch to determine_rate
Message-ID: <ZJWxbyCFQVr6K3d3@orome>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
 <20221018-clk-range-checks-fixes-v4-65-971d5077e7d2@cerno.tech>
 <700c0c62-defd-01c1-3b1d-8a760dfa194f@gmail.com>
 <rgvgzbebuvehxhjxgalkqswodyt5mvh7vr57synt3gsuadlpj2@j2mlwe2tozeb>
 <ebfdd001b9e83199ec618362b79f689c.sboyd@kernel.org>
 <ZJMYrVl--rCcj1cB@orome>
 <p2qdhxxadsxakzgr2c5n6vs5tbfnjd22faynsl45jzooh7eejf@b5hzujmccljl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="z74TEtZTFTDhuuuB"
Content-Disposition: inline
In-Reply-To: <p2qdhxxadsxakzgr2c5n6vs5tbfnjd22faynsl45jzooh7eejf@b5hzujmccljl>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--z74TEtZTFTDhuuuB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2023 at 01:24:12PM +0200, Maxime Ripard wrote:
> Hi,
>=20
> On Wed, Jun 21, 2023 at 05:35:09PM +0200, Thierry Reding wrote:
> > On Tue, Jun 20, 2023 at 12:09:09PM -0700, Stephen Boyd wrote:
> > > Quoting Maxime Ripard (2023-06-19 00:26:19)
> > > > On Mon, Jun 19, 2023 at 02:38:59AM +0300, Dmitry Osipenko wrote:
> > > > > 05.05.2023 14:26, Maxime Ripard =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > > > >=20
> > > > > > diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/=
clk-super.c
> > > > > > index 3f3a7a203c5f..7ec47942720c 100644
> > > > > > --- a/drivers/clk/tegra/clk-super.c
> > > > > > +++ b/drivers/clk/tegra/clk-super.c
> > > > > > @@ -142,15 +142,22 @@ static const struct clk_ops tegra_clk_sup=
er_mux_ops =3D {
> > > > > >     .restore_context =3D clk_super_mux_restore_context,
> > > > > >  };
> > > > > > =20
> > > > > > -static long clk_super_round_rate(struct clk_hw *hw, unsigned l=
ong rate,
> > > > > > -                            unsigned long *parent_rate)
> > > > > > +static int clk_super_determine_rate(struct clk_hw *hw,
> > > > > > +                               struct clk_rate_request *req)
> > > > > >  {
> > > > > >     struct tegra_clk_super_mux *super =3D to_clk_super_mux(hw);
> > > > > >     struct clk_hw *div_hw =3D &super->frac_div.hw;
> > > > > > +   unsigned long rate;
> > > > > > =20
> > > > > >     __clk_hw_set_clk(div_hw, hw);
> > > > > > =20
> > > > > > -   return super->div_ops->round_rate(div_hw, rate, parent_rate=
);
> > > > > > +   rate =3D super->div_ops->round_rate(div_hw, req->rate,
> > > > > > +                                     &req->best_parent_rate);
> > > > > > +   if (rate < 0)
> > >=20
> > > There's the report that this condition is never possible. Maybe the
> > > previous code was relying on an error value sometimes. Can we add
> > > determine_rate to the div_ops and simplify this code? I asked on the
> > > list for that earlier.
> >=20
> > I was able to reproduce this on a Tegra30 Beaver, but the problem is
> > more straightforward than this. The crash I was seeing during boot was
> > because cclk_super_determine_rate() was still calling the round_rate()
> > callback from tegra_clk_super_ops, which this patch removed (and added
> > determine_rate() instead).
> >=20
> > The following fixes the problem for me. It's basically converting the
> > round_rate() call to an equivalent determine_rate() call.
>=20
> Thanks for figuring it out :)
>=20
> > Dmitry, can you verify that this fixes the issue that you were seeing?
> >=20
> > Thierry
> >=20
> > --- >8 ---
> > diff --git a/drivers/clk/tegra/clk-tegra-super-cclk.c b/drivers/clk/teg=
ra/clk-tegra-super-cclk.c
> > index 68d7bcd5fc8a..8a2bb4ae4fd2 100644
> > --- a/drivers/clk/tegra/clk-tegra-super-cclk.c
> > +++ b/drivers/clk/tegra/clk-tegra-super-cclk.c
> > @@ -86,9 +86,16 @@ static int cclk_super_determine_rate(struct clk_hw *=
hw,
> >  	if (rate <=3D pllp_rate) {
> >  		if (super->flags & TEGRA20_SUPER_CLK)
> >  			rate =3D pllp_rate;
> > -		else
> > -			rate =3D tegra_clk_super_ops.round_rate(hw, rate,
> > -							      &pllp_rate);
> > +		else {
> > +			struct clk_rate_request parent =3D {
> > +				.rate =3D req->rate,
> > +				.best_parent_rate =3D pllp_rate,
> > +			};
>=20
> If it works and you submit a patch later, this needs to be changed to
> clk_hw_init_rate_request()

I've tried this and while it seems to work, this doesn't seem to be
exactly the same as what the original code does. From what I understand
the parent clock can be either pll-p or pll-x, but what we want to do in
this branch is check what a configuration would look like for pll-p as
the parent. clk_hw_init_rate_request() would initialize the request with
data for the current parent, even if that's not pll-p, so I'm a bit
hesitant to go with that instead of manually hard-coding this to pll-p.

Thierry

--z74TEtZTFTDhuuuB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmSVsW0ACgkQ3SOs138+
s6FdHA//W2/6ccLPcG/8/sUaC/XVmd3gK0LNaPUZlgxMO2TTvmH3racL1A9vjpOw
M2LIWVvfMeMbGjR7MOxpYRFCiFcao5K59ZEjEh8iIDhq53RmcVnK5V/Za1j178EG
cuAWQQM249KGDgxBn00h9Z2KmbBr/umv1tYDH+46/l4txMw6Nk/82J6Zspt4xph8
aTHFC/Q4FaeqONZqLbzz/cgNMz/xqYDvS7CWGWErPJSFn49PRyPrZaqoaDJsUnh5
gtYwW1jRm33T+k46jazEQeI8IksZ2l7cbilrprviQ8Pn0e6CDSs/Q6Yhf6vAWgF5
sPZmUC22nbVWkRb5XZJDw6LBpsDyxV4+Eh2euGcliCdzBJgjKtdL3xe4WJNmQTuu
Wvv64rudJiWGxJpSO5MxHZQovMr0bngxBKuciI5M7j7xSGMAknvUMRwz93WfVqEL
iFgWxU5/tyNlba0jIyRXUr8wY6Ug327jeiVqghTH5b/u5M0nssNIFOaLtvxUEPQ0
Gj9vx1zAKA+IS3rys+2q6oqR26hrMis1CB+tx1Gs+uhRZkBxDAps5EbUEwN3iSO5
H2TgJQctqX3tmrKrY65FPkLe3WtJKZQoLBVGMHJvX7zePxnmBVmiKE3xZMBbhyJZ
WygGpbbzG2hykH8VW5/ATsZC+6t3+rjUP7rxHBHP4fG8v16b+Pk=
=zjNc
-----END PGP SIGNATURE-----

--z74TEtZTFTDhuuuB--
