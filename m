Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB613C07E9C
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 08:28:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C268A613AF
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 08:28:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238432AbhGNIbQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Jul 2021 04:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238375AbhGNIbO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Jul 2021 04:31:14 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 813CAC06175F
        for <linux-tegra@vger.kernel.org>; Wed, 14 Jul 2021 01:28:22 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id g16so2140983wrw.5
        for <linux-tegra@vger.kernel.org>; Wed, 14 Jul 2021 01:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ivKO9rn/nP2b/CMoka/2OrZBQ/V1ctLVZiqoNJxWfo0=;
        b=h0ZbIHzxJyLCHwToOuf3Z+2sZj3796pTavGiEpN6/G0b4znq21Lycbz3BvuV1eYoVU
         4vR7jJk4eELqYI9tC4bTyrt5e8l0DEPOr+ySiHCcKDd1ri9sjv4hTKwyv1iWsO8k9jM0
         f4GH0EUjh8riOgJbif1jMbxazFC4SSBAWEeIJXCse37eLn+HJvgd8lsBrMn5knC/s5Af
         OkC6j3hxUCxfCNo6x6vLbgCjaXM1sYVVgiVb8ODHMmv8Woi1Bvm8c8RS6Oa4QwNkmZYD
         vPwk9V6D6Z7MP+YhIZOfqmqOHn781yNljXbGpfyJSFimAGGmgNmCiDOq6x8Xk0KUFBJO
         oK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ivKO9rn/nP2b/CMoka/2OrZBQ/V1ctLVZiqoNJxWfo0=;
        b=SJlmvHs5Rlgqpl4BvKumPYpoUOsKIiD1cQkCS3kwWafud41gStSy9qJVnJSvF3B784
         66vUflJ+GnZfcPf9eqkPyfEVrrD7+t3dnIu0mtl7+7ftqaPSQ/DFDew63+UONj/gCvMA
         cdKlDBqHecyfo0/ugkNYu6SGomHJ7+HCowSqr4uBIBYgBfv8J1oStWFUL0Ecjl8Uzlz0
         kGE6b1cJRP3XRuSm/zkQfKZyO571t2e0EKBewLS/62MXUSmz8HLFvTsG+M7GMWMK8j2K
         cfuT5Q/dL2hFchaPIxUfdVzdZuiu4PTLzDnsKBJ4rMTryHfO2tvRk1hvyJqzxhQIi9VY
         vo2w==
X-Gm-Message-State: AOAM530FTaMuLFDRgYOBZPgF4BBgV5cY/6SMy7Go3HX5ZMgJ0K8yLX1o
        LbJYqBTWhtNvRvuTE6+bJc4=
X-Google-Smtp-Source: ABdhPJxCZbc6ZLE8hZgyj0nChQi/HNBMI7wf/+9xAxuo6LrTonov2XyRGDaEwsXMy4t4VJerwbRk4A==
X-Received: by 2002:a05:6000:44:: with SMTP id k4mr11381145wrx.174.1626251301148;
        Wed, 14 Jul 2021 01:28:21 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p5sm1350431wme.2.2021.07.14.01.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 01:28:19 -0700 (PDT)
Date:   Wed, 14 Jul 2021 10:30:19 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v8 00/14] drm/tegra: Introduce a modern UABI
Message-ID: <YO6gm0PgMGNovk+4@orome.fritz.box>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
 <42252a14-f6b8-7e1b-90c2-1c741ba8223f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="iaNpXtGtXkWeBPvi"
Content-Disposition: inline
In-Reply-To: <42252a14-f6b8-7e1b-90c2-1c741ba8223f@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--iaNpXtGtXkWeBPvi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 10, 2021 at 12:16:28AM +0300, Dmitry Osipenko wrote:
> Hello Thierry,
>=20
> 09.07.2021 22:31, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Hi all,
> >=20
> > Mikko has been away for a few weeks, so I've been testing and revising
> > the new UABI patches in the meantime. There are very minor changes to
> > the naming of some of the UABI fields, but other than that it's mostly
> > unchanged from v7.
>=20
> Why you haven't addressed any of the previous review comments? There
> were some obvious problems in v7 and v8 still has them.
>=20
> > One notable change is that mappings can now be read-only, write-only,
> > read-write or none of them (rather than just read-only or read-write),
> > since those combinations are all supported by the IOMMUs and it might
> > be useful to make some mappings write-only.
> >=20
> > For a full list of changes in v8, see the changelog in patch 6.
> >=20
> > I've also updated the libdrm_tegra library to work against this version
> > of the UABI. A branch can be found here:
> >=20
> >   https://gitlab.freedesktop.org/tagr/drm/-/commits/drm-tegra-uabi-v8
> >=20
> > That contains helper APIs for the concepts introduced in this series and
> > shows how they can be used in various tests that can be run for sanity
> > checking.
> >=20
> > In addition, Mikko has made updates to the following projects, though
> > they may need to be updated for the minor changes in v8:
> >=20
> > * vaapi-tegra-driver - https://github.com/cyndis/vaapi-tegra-driver
> >   Experimental support for MPEG2 and H264 decoding on T210, T186
> >   and T194.
> >=20
> > * xf86-video-opentegra - https://github.com/grate-driver/xf86-video-ope=
ntegra
> >   X11 userspace acceleration driver for Tegra20, Tegra30, and Tegra114.
> >=20
> > * grate - https://github.com/grate-driver/grate
> >   3D rendering testbed for Tegra20, Tegra30, and Tegra114
> >=20
> > I plan on putting this into linux-next soon after v5.14-rc1 so that this
> > can get some soak time.
>=20
> It should be a bit too early to push it into kernel. The UAPI is not
> ready because it's missing essential features. We can't call this a
> 'modern UABI' until it's fully implemented. The design decisions are
> still questionable because this UAPI is built around the proprietary
> firmware (and based on UAPI of downstream driver) which doesn't fit well
> into DRM world. I haven't got all the answers to my previous questions,
> should I repeat them?

I don't know what you means by "built around the proprietary firmware".
Yes, this ends up using proprietary firmware for some of the hardware
engines that host1x drives, but that's completely orthogonal to the
UABI. No matter what UABI we'd be introducing, we'd be using that same
firmware.

And yes, this is based on the UABI of the downstream drivers. The design
is guided by what we've learned over the last decade working with this
hardware in use-cases that customers need. It'd be dumb not to use that
knowledge to our advantage. This is the only way to ensure we can
deliver an upstream driver that's on par with our downstream drivers and
therefore make it possible to eventually adopt the upstream driver.

And frankly, you did get answers to previous questions, though perhaps
not all, but I'm out of patience. We've been going in circles and at
some point we have to make a decision so we can make progress.

I made several attempts over the years to get something usable merged
upstream so that we can finally make use of this hardware and get it
supported upstream and each time I made the mistake of trying to make it
perfect and accomodate all wishlist items. The result is that I wasted a
lot of time and have nothing to show for it.

I've also been very hard Mikko with his work on this and I think we've
stretched this as far as we can without compromising too much on what we
are going to need from this UABI in the future.

We've gone through the process of making sure all existing userspace can
and does work with this new UABI and even left the old UABI in place in
case we need it.

I'm reasonably satisfied with what we have now and I don't see any
reason to hold this back any further. We always have the option of
adding UABI if we need it for something, or extend functionality of
existing UABI where it makes sense. But we also do have to start
somewhere, otherwise we're just not going to get anywhere, as the last
10 years have shown.

> UAPI is not the only problem that we have. The performance and stability
> of the driver are in a very bad shape too. The modern UAPI can't be
> built on top of the old code. It's clear now that this is a very serious
> problem that must be addressed along with the UAPI work and I'm getting
> silence from you guys.

We've been over this multiple times before, though perhaps never over
email. So let me make this clear here again and for future reference: we
will *not* be rewriting the driver from scratch.

If there are any serious performance and stability issues, then we'll
find them and address them incrementally, like we always do in the
kernel.

Thierry

--iaNpXtGtXkWeBPvi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDuoJkACgkQ3SOs138+
s6EV+g//bdNe9WGb3R8br/zGvyc0rsk8VnqtU4c85ANO8FQ8HgYDTVSwJ0rH2/Ne
Gh+NPCW4MXoCK0lmzPXVTz+GhuuUaQuR5KrC0ng1vG3auvBYKEfUvLf6wnGDAHIv
YbxFEz5Bk+Pu0TfNortVtDToOfNsokc7adsEkwb+bs04vatp83QHzEZ6DipEg3cL
mizhJNvuo0mx0D2ApSj315VcOh55VhZl7IroAAGMlxDF3JlJhuIyphcav1DgJvdz
NZdSW43xopUQ2EkoBDnETK9xGds3PGkFzWdKoE1MRcECAHlOia7vA1ejtxYP5sgi
DXYHGtJDZ2gIXLSyUc61MFckyhzV3bZwIyvKm1HBiPzaR/BtsCp4gs100cojmb1+
gyrcM9KdVwLr4CcRsRznW0p8OVarQWSqNcnMku7XimNLX47J5d54/Cm6KfJ7+key
qW49begJ/ziUI8/weGaKetYwpLeNLd6mipySNjYb+9Uf8TQj70YW7DYx5rgMPve+
icY4b07smjP4o5b+ERO9y27/chfudFmXmdTRyR4MP6HqUXIjNh/BuGWLyd/rA7n8
BkI6uNo370yzQNV6zx0gim51mts0cuHWnBTVT34mGaKhCMm9E8+mbJDwCToZPmQE
nLgFj5FULdGdxunIu0wB94wcSV/6OazySON5gmf17WjrF8sfN1U=
=KoTy
-----END PGP SIGNATURE-----

--iaNpXtGtXkWeBPvi--
