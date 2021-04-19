Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA26FC433ED
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Apr 2021 14:51:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFDE861245
	for <linux-tegra@archiver.kernel.org>; Mon, 19 Apr 2021 14:51:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232560AbhDSOva (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 19 Apr 2021 10:51:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232184AbhDSOv3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 19 Apr 2021 10:51:29 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BAE2C06174A
        for <linux-tegra@vger.kernel.org>; Mon, 19 Apr 2021 07:50:58 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id s7so34268018wru.6
        for <linux-tegra@vger.kernel.org>; Mon, 19 Apr 2021 07:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DIGmEW/vcq4kZMsRXR+iAqjCi+nWjUL/Ybzjfr/TH9s=;
        b=ntDHkU5k0adFuq4ulHWrLNwdV5tvw5/Bb3S41mgYueUJMEYgF8YjhEfGUQVjK1FAPv
         JNwJYpT1jOFhKiR9uEID7jn9y/iN1s/S7/3z0ru/lPW11cFQ0DbrFdCSp5oLE8teHDIq
         VSYGKCP/Fn0utDDr9sQSkwUMtFFO856kq/u4DZY3ZxC5oyqoD5vfZSiDeFUK3UENAoTF
         wpN7f5dmxQO/ymVwZ2edu1NbkIrMP5TOBEp0DyVF3cBaxgKFXjag70seEnxShbgda2Fr
         nqqjjOPAXZcKgtjGqOBCPwCZzSseqVadCJtbN7WCOoEvaTdk75K/GdIa0/bSQx61PFAC
         yUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DIGmEW/vcq4kZMsRXR+iAqjCi+nWjUL/Ybzjfr/TH9s=;
        b=TIzQw7mUcARKZdva+z5eWeBpiun/eGn6z5oA4Dp7hUBQblE2IrFKlRg4jAjEwILpz3
         Fe2GUDj5Sm4RWdnyBw/D8ziXgbFY6cpPiy5bpKgL1vLYgwwZXjOugeZ1oHeocZ9x0PhM
         6BPir8kSQXwtsy3M4w8ei0KWnN7vBOBGA/jo38A0XDmY6N1n+tPETHMxtr9Z7/AMYFv8
         Mti3UkgrNUJ09HmYjAs50g8OXCTaNj1AYJbPI09o3kjQy3GtVg65PO6kk1vf2+l3Lepl
         +sPHDuHVhPIoYLvGBLQ014zdbsg/whbT1pKaDcULjyg9cRl8vzdlxOaJs5XOi7MvffpK
         JZwA==
X-Gm-Message-State: AOAM5310ZpVusyWVGmkdNkdgmswrfXElHdIMwZH4m4mu8LfsYL5rNXNV
        h1jSD4rTvvQwWBKTmAs8r18=
X-Google-Smtp-Source: ABdhPJx4uP8qa6y0FNCUUXKNVyhVzXldoYsXPkr7jPV7lGwcVHbeGbuS4ldAvlT3+Wqv935bJOcsVQ==
X-Received: by 2002:adf:9567:: with SMTP id 94mr15033446wrs.401.1618843857154;
        Mon, 19 Apr 2021 07:50:57 -0700 (PDT)
Received: from localhost (p2e5be10e.dip0.t-ipconnect.de. [46.91.225.14])
        by smtp.gmail.com with ESMTPSA id n9sm19406460wmo.27.2021.04.19.07.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 07:50:56 -0700 (PDT)
Date:   Mon, 19 Apr 2021 16:51:42 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Jon Hunter <jonathanh@nvidia.com>, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: simple-card-utils: Increase maximum number of
 links to 128
Message-ID: <YH2Y/rd2/q5qHvnz@orome.fritz.box>
References: <20210416071147.2149109-1-thierry.reding@gmail.com>
 <20210416071147.2149109-2-thierry.reding@gmail.com>
 <8735vn59sw.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="iMzAVtxpDlqW14Ll"
Content-Disposition: inline
In-Reply-To: <8735vn59sw.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--iMzAVtxpDlqW14Ll
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 19, 2021 at 10:42:55AM +0900, Kuninori Morimoto wrote:
>=20
> Hi Thierry
>=20
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > On Tegra186 and later, the number of links can go up to 72, so bump the
> > maximum number of links to the next power of two (128).
> >=20
> > Fixes: f2138aed231c ("ASoC: simple-card-utils: enable flexible CPU/Code=
c/Platform")
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> (snip)
> > +#define SNDRV_MAX_LINKS 128
> > +
> >  struct link_info {
> >  	int link; /* number of link */
> >  	int cpu;  /* turn for CPU / Codec */
> > -	struct prop_nums num[SNDRV_MINOR_DEVICES];
> > +	struct prop_nums num[SNDRV_MAX_LINKS];
> >  };
>=20
>=20
> How many numbers do you really need ?

As I mentioned in the commit message, the maximum I've seen is 72.
Rounding up to the next power of two seemed like a good idea to give a
bit of extra headroom.

> Because simple-card needs many parameters,
> thus I will get below warning.
> # It is not yet happen on upstream kernel, but will be
>=20
> 	warning: the frame size of 2280 bytes is larger than 2048 bytes [-Wframe=
-larger-than=3D]
>=20
> This warning doesn't appear if SNDRV_MAX_LINKS was 64.
> Can we reduce it ?

Reducing from 128 to, say, 80 should eliminate that warning, but I
wonder if perhaps a better solution for the longer term would be to
allocate this structure on the heap rather than on the stack? That
way we don't risk triggering this warning again in the future.

The data structure seems to be only used during initialization, so
something like a kzalloc()/kfree() pair doesn't seem like it would
hurt much performance-wise. Add in the devm_ variants and the code
complexity should also remain moderately low.

Thierry

--iMzAVtxpDlqW14Ll
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmB9mPwACgkQ3SOs138+
s6ENKxAAkw5sPV/Q2SbHVc3kGcucct8r8qVGXa44bJNevX3NB64616yyVavBG46U
xCcoLWoPvCJLpD8rE1EGDUBcF79qPWt4SxIOmAyveQyT5lFO3DH22vnyqh5jA3fP
XFAYK3bMgLpM6Hz32ffhmaWzpTacIDOd6Zr+l99tCEiXpq7VjB7xLioJyTCSOXMo
lVt5MNCfzySM7aOsOgxVpiNC8QjsEZSbyOfdFoM+UspoCFoe1Jg13gBqgWlhZNFh
Vqx4bvlfoqMtTBNCBjcUB3XKAsrRWDhH/QfTjb8T2r+1OHnkFT0P3B+a5dp5fF/M
idH19a0x4u7xhz9tiEzgLH1CoIGkwBEjtXe92WFuyAh3/vl4UHoNW/ffx5g3zrca
Lx49CS1llv3R3WoluShEqBxPI9tmv3rEO+HB/ps/DgFB2FPm8Xiu/l9p1yxzBFuj
YeySyq+DUy7d3E8r5Lfp5HN6QBwXLdna5hGHl13yz3pu/jeFQ4PO+7IvjIgD7vNU
mGkT2NziUxtdI5WXgmA4yFXUC4SxaATRD+81E1Zx5jz8LbKGG0GBvT+D31399QJC
/hlro1tCi5bAXeM7s57Rhqhhl41yNX/BDky4+wYG3qlOGXda3sZFa66keFcjcara
qYkdlNRYMF4IPX1BDOZqbAqucIbjwAZpO+lzLsTEvZA+MBr/VPU=
=wbaQ
-----END PGP SIGNATURE-----

--iMzAVtxpDlqW14Ll--
