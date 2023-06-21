Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CF0C001DD
	for <linux-tegra@archiver.kernel.org>; Wed, 21 Jun 2023 15:35:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233597AbjFUPfc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 21 Jun 2023 11:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232527AbjFUPfO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 21 Jun 2023 11:35:14 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E81194;
        Wed, 21 Jun 2023 08:35:13 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f9c2913133so7145585e9.1;
        Wed, 21 Jun 2023 08:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687361712; x=1689953712;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQQCdT9kFN5noSXpvp4FBe6GB2Q2xfzWCNR/tOO33ns=;
        b=mgIRc+hnxngr1gDWnmJ9iMtI0dDiuTb/eSJcDavAw6DQPKqRd8r1Sb1ENbVPxRP4bl
         dvRwvsF6p47dN0OQHmYcPHHwrIL9zuN5c9U1lVaAfUFwNNNRg9e00wTKfJ+1quN8Ugk2
         TsWp2uV6DtBpq8PlMmnWqnHwzq+Pd/J81u3W8k0TTQk8LhpJ2vSRWstzhcoLgBrS9LDK
         fCCyK6ON2sQ9H/2ntrAhftfxrDEdadLxcV6AFFW9ieTu+zTg6cCd+Qhnq2OxllPPF4Jn
         X9xT+/JCLPD3pr8fu8zCSU18ZhvZJLxklioPmjlCAqchoutQzZU3sD+um5/9odfE1r72
         LHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687361712; x=1689953712;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQQCdT9kFN5noSXpvp4FBe6GB2Q2xfzWCNR/tOO33ns=;
        b=G8yeoSYy22XHkw14hhUpt5tNavu+BuuvSLepxg4PmQzXDbVRLE+kSTbzU+Babkxept
         O/k+f6Q+plMvt6OATa4uLLloROvpdy7vjOKs9RleAT1pHgsCjmJZNM5urK8+u95h2QEA
         kFYQlw0qiQKSA6xblkUeSV5ZvqREbKpkuBNYWTp+nKuUPbokjlRUbQGLhXhXGTUwftQE
         rBJeYv+gj+Hrr9YjQXu+UVPidgFdV1GrS7NYE3sW1oGb3vtE/ymWAhaush09MUzbi+nt
         ZYjRdE2r6B1TWBSMnxLP3iIlakay6/7jMlYLKXBwFHAKqLC27Xb/WjCKtNRVfJV/yF/N
         ZXJw==
X-Gm-Message-State: AC+VfDynkbyCvsxlLDNYNP8u/fdosCg8frEWB3E9zQy38G/xj8OnW4Dj
        lvNRPhdpm45RafFUtp3+HNg=
X-Google-Smtp-Source: ACHHUZ5W49puGNiRRZjADYwx2U2LpnoH5sf1f+o4kr2GCoxLquk53BaJyqdKKUr2Cc673tXBsNdU2g==
X-Received: by 2002:a7b:cb4e:0:b0:3f7:f884:7be3 with SMTP id v14-20020a7bcb4e000000b003f7f8847be3mr12358924wmj.4.1687361711670;
        Wed, 21 Jun 2023 08:35:11 -0700 (PDT)
Received: from orome (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n6-20020a05600c294600b003f7e4639aabsm16462057wmd.10.2023.06.21.08.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 08:35:10 -0700 (PDT)
Date:   Wed, 21 Jun 2023 17:35:09 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Stephen Boyd <sboyd@kernel.org>, Dmitry Osipenko <digetx@gmail.com>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 65/68] clk: tegra: super: Switch to determine_rate
Message-ID: <ZJMYrVl--rCcj1cB@orome>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
 <20221018-clk-range-checks-fixes-v4-65-971d5077e7d2@cerno.tech>
 <700c0c62-defd-01c1-3b1d-8a760dfa194f@gmail.com>
 <rgvgzbebuvehxhjxgalkqswodyt5mvh7vr57synt3gsuadlpj2@j2mlwe2tozeb>
 <ebfdd001b9e83199ec618362b79f689c.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0CHBxGtZUoMcPTc1"
Content-Disposition: inline
In-Reply-To: <ebfdd001b9e83199ec618362b79f689c.sboyd@kernel.org>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--0CHBxGtZUoMcPTc1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2023 at 12:09:09PM -0700, Stephen Boyd wrote:
> Quoting Maxime Ripard (2023-06-19 00:26:19)
> > On Mon, Jun 19, 2023 at 02:38:59AM +0300, Dmitry Osipenko wrote:
> > > 05.05.2023 14:26, Maxime Ripard =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > >=20
> > > > diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-=
super.c
> > > > index 3f3a7a203c5f..7ec47942720c 100644
> > > > --- a/drivers/clk/tegra/clk-super.c
> > > > +++ b/drivers/clk/tegra/clk-super.c
> > > > @@ -142,15 +142,22 @@ static const struct clk_ops tegra_clk_super_m=
ux_ops =3D {
> > > >     .restore_context =3D clk_super_mux_restore_context,
> > > >  };
> > > > =20
> > > > -static long clk_super_round_rate(struct clk_hw *hw, unsigned long =
rate,
> > > > -                            unsigned long *parent_rate)
> > > > +static int clk_super_determine_rate(struct clk_hw *hw,
> > > > +                               struct clk_rate_request *req)
> > > >  {
> > > >     struct tegra_clk_super_mux *super =3D to_clk_super_mux(hw);
> > > >     struct clk_hw *div_hw =3D &super->frac_div.hw;
> > > > +   unsigned long rate;
> > > > =20
> > > >     __clk_hw_set_clk(div_hw, hw);
> > > > =20
> > > > -   return super->div_ops->round_rate(div_hw, rate, parent_rate);
> > > > +   rate =3D super->div_ops->round_rate(div_hw, req->rate,
> > > > +                                     &req->best_parent_rate);
> > > > +   if (rate < 0)
>=20
> There's the report that this condition is never possible. Maybe the
> previous code was relying on an error value sometimes. Can we add
> determine_rate to the div_ops and simplify this code? I asked on the
> list for that earlier.

I was able to reproduce this on a Tegra30 Beaver, but the problem is
more straightforward than this. The crash I was seeing during boot was
because cclk_super_determine_rate() was still calling the round_rate()
callback from tegra_clk_super_ops, which this patch removed (and added
determine_rate() instead).

The following fixes the problem for me. It's basically converting the
round_rate() call to an equivalent determine_rate() call.

Dmitry, can you verify that this fixes the issue that you were seeing?

Thierry

--- >8 ---
diff --git a/drivers/clk/tegra/clk-tegra-super-cclk.c b/drivers/clk/tegra/c=
lk-tegra-super-cclk.c
index 68d7bcd5fc8a..8a2bb4ae4fd2 100644
--- a/drivers/clk/tegra/clk-tegra-super-cclk.c
+++ b/drivers/clk/tegra/clk-tegra-super-cclk.c
@@ -86,9 +86,16 @@ static int cclk_super_determine_rate(struct clk_hw *hw,
 	if (rate <=3D pllp_rate) {
 		if (super->flags & TEGRA20_SUPER_CLK)
 			rate =3D pllp_rate;
-		else
-			rate =3D tegra_clk_super_ops.round_rate(hw, rate,
-							      &pllp_rate);
+		else {
+			struct clk_rate_request parent =3D {
+				.rate =3D req->rate,
+				.best_parent_rate =3D pllp_rate,
+			};
+
+			tegra_clk_super_ops.determine_rate(hw, &parent);
+			pllp_rate =3D parent.best_parent_rate;
+			rate =3D parent.rate;
+		}
=20
 		req->best_parent_rate =3D pllp_rate;
 		req->best_parent_hw =3D pllp_hw;
--- >8 ---

--0CHBxGtZUoMcPTc1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmSTGKoACgkQ3SOs138+
s6EZQg/+O4ZRm3luIZ13ZHbeIFzu4acT+CgKduUPLsIj8pjh3U5kfaWiJ8zhvqUN
L4Urspttq6V+ml1+d/uE/4UuPNo6llwhqgVOiostSvZb5Y001sm3hAArMNThqcsQ
XPOITfDi2Y6ATzCbcmV7BK5dHm5P/AwVhv54V+YH8eMquaQ+Vdq0t9AiBneVsQ0R
NxfCKeBPbdli/d0O9qMcSs9tBz2KYjTKb4BWiq9Oadn05eikjUiRI9zZeGbD8VCI
cdm0p6EPPIJNJne+8NjMET8aXW4NGLrpCly1kTSw+k7EmvxUwJnVkKdL0rdzo0K1
Q5NP2SWA6+i5+USIvJSGa9TxAD4pcp8a5SdjcxFTs1ZHIpAgNWpiaBp89x36sUsi
MOytgJZsDMByNh39YxlGvz38E9fsmkWPqZZAoMAPL11PyodL9f0rwcw1DZGJOYUH
+bGU+d4FWISHq2sg1rQ0AxpoCEw+3AswWKUDYeFXvGRNIe8wLmhkPEABugD+HHu2
0TcDfBlMgJQWUX01T7IxuhwnOQf7a6qK4Gv+02Vu6YR+veVnx54MNdW1Nvo2NXMP
DLZ/QBK7dP/iErjFKCfIxI31Y8m5tNShQewTvv5UOMgGLw8pe3AUtZ+JOFcmnjJX
b/MePVJdb/MUNUUHhTraLhi5ERWYEatZiWGZNYDUIx9m/nFF5Bw=
=UPiR
-----END PGP SIGNATURE-----

--0CHBxGtZUoMcPTc1--
