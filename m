Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 223B9C433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Dec 2021 16:11:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240415AbhLMQLD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Dec 2021 11:11:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236838AbhLMQLD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Dec 2021 11:11:03 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C8AC061574
        for <linux-tegra@vger.kernel.org>; Mon, 13 Dec 2021 08:11:02 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id b19so22604464ljr.12
        for <linux-tegra@vger.kernel.org>; Mon, 13 Dec 2021 08:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=I4Hnvjx6MuM87EzOXgfXE4nVKSyG6Ghzd6vhrBX1834=;
        b=eSgm/J6pGWpoUnLTVv/tq3SvpSf8op73oEadNgtgMQX0HWj5ldsbtX1VgxYofOtgRe
         wyYr9sgUV39oNTLKLMPE6hbnEk4SzTkE82JMjDYeow8nMbIWqzrZ3su6dzs2x7LKSvX/
         rEMCo6eJsCjZl555l1+oDL0Saf2r476oGmOXyk82MssTVVN9ZKFUcQiaJVwLjvx0CPza
         oBympG2iC6/cKP1y7n34UjQ9KlvoVfprBeJ3D5Cg9FPj86uZfBnecLx6HpmPzdKbijrc
         KitXBn2Es6Bsj47BNL1n/lg4LekXxm5cS2Qjp3lAq5vsGxID1ijF+Cnseh32YZBjyw94
         GRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=I4Hnvjx6MuM87EzOXgfXE4nVKSyG6Ghzd6vhrBX1834=;
        b=Z36KyPyDmT7fCEAmedBC7Nd689sgCjSJ+cBW8ZKBxTjWp65c5Ya5yJ3MOGGv9RbOwC
         1hY/27UO+D8RJaFCT7JVa0eCYbM5D4a13vvJptgEB+DxTXTVoPGLUmCYv81lx9u45oxu
         isMDVVunUCAdmjofz4empvsmv7ARvc21boxGg7FjvkRKFZrYGz7EGvi7dKyaYz10hfV+
         byTFp1zojoeSRbhwl3QF6axTigRTszu4Nq2GiouVwcVlLHPrhUTYDASk2am5AAE+V0De
         rd/zJdywIj1GBXqiRweZ7SSDOrBI1w3zxi3LltVqC0LYMxpyM3sdT66Bl80Bo5g//KkB
         ChfQ==
X-Gm-Message-State: AOAM5331YOF3/1rwlMyt0IgWxw2PdETwaGV9UxAUvTBoDE/wvi/OsHxu
        Xhd8GXBWPztyQfhoXLtfA2w=
X-Google-Smtp-Source: ABdhPJwF2nd78tg4f4FloeEX0X6nRL7YwueOliyxs7gmFUL/MLqJ1CYhx9BQ0eYkb8WhcJDt4D+ijA==
X-Received: by 2002:a2e:a901:: with SMTP id j1mr29920811ljq.40.1639411861110;
        Mon, 13 Dec 2021 08:11:01 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id k14sm1509673ljk.57.2021.12.13.08.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 08:11:00 -0800 (PST)
Date:   Mon, 13 Dec 2021 17:10:58 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 22/25] ARM: tegra: Move I2C clock frequency to bus nodes
Message-ID: <Ybdwkul6RrmLvXND@orome>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-23-thierry.reding@gmail.com>
 <4865a5b6-c841-99c6-f132-24967a349f9b@gmail.com>
 <YbNrxsv6Gd9jvx7l@orome>
 <8bb98f01-5cd6-ec17-fdfe-13557d79d590@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GYPNqmm5FWe6onEN"
Content-Disposition: inline
In-Reply-To: <8bb98f01-5cd6-ec17-fdfe-13557d79d590@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--GYPNqmm5FWe6onEN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 10, 2021 at 07:08:22PM +0300, Dmitry Osipenko wrote:
> 10.12.2021 18:01, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Dec 09, 2021 at 09:57:08PM +0300, Dmitry Osipenko wrote:
> >> 09.12.2021 20:33, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> The "clock-frequency" property for an I2C controller needs to be
> >>> specified at the bus level.
> >>>
> >>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>> ---
> >>>  arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi | 3 ++-
> >>>  arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi | 4 ++--
> >>>  2 files changed, 4 insertions(+), 3 deletions(-)
> >>
> >> The clock-frequency is specified in the parent-common N7 DTSI, NAK.
> >>
> >> There is already patch from David that removes the clock-frequency from
> >> NFC node [1], please use it.
> >>
> >> Please never again rewrite the preexisting patches, this makes you loo=
k odd.
> >=20
> > Again, please don't make this into something it isn't.
> >=20
> >> I suggest to collect *all* patches (not only your own) into single
> >> for-next branch, resolving all conflicts, making sure that you don't
> >> duplicate the effort and letting it all to be tested before it will hit
> >> the bus.
> >=20
> > You know, if you guys communicated better over existing channels or
> > actually let me know of what's going on then a lot of this could've been
> > avoided. I don't have visibility into what you're all up to, so I can't
> > take that into account.
>=20
> All the messages from me and David are in yours email inbox and on
> #tegra IRC. You have the complete visibility. Either you don't have time
> to take a look and then forget about it or I don't know what's the proble=
m.
>=20
> > If I happen to start working on something that someone else is also
> > doing in their corner, that's by accident, not because I have bad
> > intentions or because "I want to do everything myself", or whatever
> > other reason you keep coming up with.
> >=20
> > Stop insinuating things that aren't true.
>=20
> My point is that you're ignoring the existing patches. It may not look
> like a big problem to you since you can apply patches directly and I
> understand that own patches are always the most important ones, but this
> is a problem for everyone around you.

I wish my own patches were always the important ones. If you care you
can take a look at how many of my own patches actually make it upstream
each release. My patch stack regularly grows beyond a couple of hundred
because I don't always prioritize my own work.

Thierry

--GYPNqmm5FWe6onEN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG3cJEACgkQ3SOs138+
s6GcSA//SEJKnzLfCQ2SVeMV1OjYI/tTZQ++NRZqaLY5Ovx1yCA8hMTXy19mnudD
s1gAELGEnY2xx43hWtkX6GbDKSX6lHU6ZS3zY8zT8kY8if8eHRjE2hVwhlUIkwUa
itSMA8//Xkh0cFjfO1To36C16NhsPH+lljhspbHwd+CSCocM1MMPD35MGBmZSV8P
Q45WDSxuVbuIb0ZGcmp/1K7zakBCsOS+LpLseJS3h5v0B4X0LL40HewV2xP++OsP
rFtp+MiJmhn5lUN+3x5Askq6HjmNiYuF5VEf097UTZrGcUOrFBL0tlkUBzr8AxkI
35rs6A49ODNN0aGj3U6fAWwYfNhsQwIQ1dXqDlyg1mBaiWIeVNDP2wRWpHYz7AAs
ibg2TyZA4fcrNaR/ZT2GrKO41IqFtsT3/KFAKfCwq0a4DUYzsLwZrRaAGGx2R5Ot
0YSN2d6+YZrmXI7leQC5KX1Ujr4O6G9XCTjNjEoXanl4k3ToI25hBLwItjnXl31q
4aBimQKiKzchVSQhGleq99ga5AGIZZjLvFGTUl5kK9Jr4cvwAP+Xg40cUOvwr1es
NzVk6FuwOm/I2MmMvkGZJzALoPmK6OXPot4EV8e68xY2UN0/+K8Tr12MGt4ChK6t
nFuDwh/pP+bj5XtdAF7FU3xze3V9ho6I9qbsa1/Gd8KbIORovY8=
=mDgW
-----END PGP SIGNATURE-----

--GYPNqmm5FWe6onEN--
