Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C3CC433FE
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Nov 2022 16:34:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241618AbiKRQe3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Nov 2022 11:34:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235230AbiKRQe2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Nov 2022 11:34:28 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FA635C763;
        Fri, 18 Nov 2022 08:34:27 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id l11so7890855edb.4;
        Fri, 18 Nov 2022 08:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNVdoCJOEmGKRPr7JE/NblxZ8eYI1vXfs6NClf7SbNU=;
        b=g5wUOO7LZRQMj6zXQm8VDcXkSEHRndBjvEEU1w8vj6JOPq+pze4BSsZ4QEJ1vydv0c
         E+MNJ5+k6CIsuj+dDllGgdF7K5iaNx9mQc8uMUI5v4ww7c3v1fM1JLEzQ6b0ceXdsvWf
         VQDAD0HH1czivYQzLaXRaggBegA12xdAHeEjRtrL/j+w5u04qUsnTABElfnY3YarSlRL
         h0hmMoDG2API7NX78MjfNCGi+26hrhdCT/OKL5pyiOvo8SpDOZIb6R1ioOSI+BF7FuZV
         ez1Et5Wf/NB4f/k2HZScxslKui/C4zCq+ZoDxp1VdFguHP1nyHQpyrmWanZYdfb1fMFJ
         F2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNVdoCJOEmGKRPr7JE/NblxZ8eYI1vXfs6NClf7SbNU=;
        b=Qsz394BooPZzP+e7vWASMnK1sjTqPoTvQtSNEWsUH+I1LzbR/0P+eOCxtme07N/s2I
         8xWAN3JyzdjPuiXc4QERl8G6zg0XEPvjD75zoxY26VGLqUt7PjwTypekNILiLgGtRJRK
         1Hi/kkO21n1+Fet1vP+at+4YGGFzQ5NaL51JIQXe/G1lqEKtv94Qb+C7KlYayy6gvNKj
         AcPgjTY/m2VlRKvLweQi9cM7HoLdU9BIHItMdZhv1KLei2Fc9DKVlck31rXP6g5e4Gc9
         4eud5q8oAvXBArCliwYo8eUwa2WuQ/uSM33Uv0g5DQQSQAwSrades20WcVDQuZ88frh8
         SfrA==
X-Gm-Message-State: ANoB5pmTSSl7VS3VmuGQgfJxEun4RHravoNX5cqP++PMB1koD0A04kCg
        p4qBpXqlOsEUIyhKxqmWSL4/qD73OEI=
X-Google-Smtp-Source: AA0mqf74yBnMsNXdHV6F8dNKg1w9YXVx53dcKVVcmrVMWD5/xGr/tYEAF66OeQR9wZpj7/T9Tldi1Q==
X-Received: by 2002:aa7:c754:0:b0:469:1ddf:9251 with SMTP id c20-20020aa7c754000000b004691ddf9251mr2476952eds.110.1668789265361;
        Fri, 18 Nov 2022 08:34:25 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id i26-20020a1709063c5a00b007ae035374a0sm1885029ejg.214.2022.11.18.08.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 08:34:24 -0800 (PST)
Date:   Fri, 18 Nov 2022 17:34:23 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        David Airlie <airlied@redhat.com>,
        Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v3 7/8] drm/simpledrm: Support the XB24/AB24 format
Message-ID: <Y3e0D2BmSt2Ftlbd@orome>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
 <20221117184039.2291937-8-thierry.reding@gmail.com>
 <7018f094-e1f8-d82d-f4b2-b1ae833d1c47@suse.de>
 <Y3eoeLLOxHaruPOV@orome>
 <dbfd2e78-3250-ba4b-b8e0-96df46ce33a5@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ldz8iAyLzBuJ8Wi1"
Content-Disposition: inline
In-Reply-To: <dbfd2e78-3250-ba4b-b8e0-96df46ce33a5@suse.de>
User-Agent: Mutt/2.2.8 (2022-11-05)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ldz8iAyLzBuJ8Wi1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2022 at 05:10:38PM +0100, Thomas Zimmermann wrote:
> Hi
>=20
> Am 18.11.22 um 16:44 schrieb Thierry Reding:
> > On Fri, Nov 18, 2022 at 04:08:23PM +0100, Thomas Zimmermann wrote:
> > > Hi
> > >=20
> > > Am 17.11.22 um 19:40 schrieb Thierry Reding:
> > > > From: Thierry Reding <treding@nvidia.com>
> > > >=20
> > > > Add XB24 and AB24 to the list of supported formats. The format help=
ers
> > > > support conversion to these formats and they are documented in the
> > > > simple-framebuffer device tree bindings.
> > > >=20
> > > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > > ---
> > > > Changes in v2:
> > > > - treat AB24 as XB24 and support both at the same time
> > > >=20
> > > >    drivers/gpu/drm/tiny/simpledrm.c       | 2 ++
> > > >    include/linux/platform_data/simplefb.h | 1 +
> > > >    2 files changed, 3 insertions(+)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tin=
y/simpledrm.c
> > > > index 7f39bc58da52..ba1c2057fc65 100644
> > > > --- a/drivers/gpu/drm/tiny/simpledrm.c
> > > > +++ b/drivers/gpu/drm/tiny/simpledrm.c
> > > > @@ -483,6 +483,8 @@ static int simpledrm_device_init_regulators(str=
uct simpledrm_device *sdev)
> > > >    static const uint32_t simpledrm_primary_plane_formats[] =3D {
> > > >    	DRM_FORMAT_XRGB8888,
> > > >    	DRM_FORMAT_ARGB8888,
> > > > +	DRM_FORMAT_XBGR8888,
> > > > +	DRM_FORMAT_ABGR8888,
> > >=20
> > > Does the hardware *really* support AB42 on its primary plane?
> >=20
> > Yes, Tegra display hardware supports this format on the primary plane.
> >=20
> > > We recently had a discussion about the exported formats and the conse=
nsus is
> > > that we only want the hardware's native formats plus XRGB888. That's =
not
> > > implemented yet in simpledrm, but this format list will soon see a la=
rger
> > > cleanup.
> > >=20
> > > So I think ARGB8888 likely shouldn't be on the list here.
> >=20
> > This is for consistency with the list below. If a device tree claims
> > that the framebuffer is ABGR8888 using the "a8b8g8r8" string, then
> > shouldn't we support it?
>=20
> The situation is complicated. Several DTs claim that their framebuffers
> support Alpha+RGB when they actually mean X+RGB. But for compatibility, we
> cannot change this now AFAIU. So we're stuck with X+RGB framebuffers that
> claim that they have an alpha channel. OTOH, other hardware might actually
> support the announced alpha channel. Trying to render into an alpha chann=
el
> would therefore produce undefined output.

As long as we output 0xff into the alpha channel we should be able to
support those modes as well, shouldn't we? This would effectively be the
same as XRGB variants, except that the native mode could still be
reflected. It probably doesn't make sense to have an alpha channel for
these use-cases (what would we blend with), but I don't see how it would
hurt.

> The consensus is that we only want to announce XRGB8888 plus the native
> format to userspace. But if the native format has an alpha channel, we'd
> announce the non-alpha format instead. Our format-conversion helpers would
> then fill the alpha channel automatically with 0xff during the pageflip.
>=20
> (This hasn't yet been fully implemented because we first need to fix a few
> things in fbdev emulation to make it work.)
>=20
> Therefore ABGR8888 shouldn't be on the list. Note that a native DRM driver
> for your display hardware would be free to export ABGR8888. We only have
> this rule for the hardware-agnostic drivers.

I don't feel strongly about it, so I can also drop that format. Do we
also want to drop ARGB8888 and ARGB2101010 while we're at it? In a
separate patch of course.

Thierry

--ldz8iAyLzBuJ8Wi1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmN3tA8ACgkQ3SOs138+
s6EyWQ/+KexJpcXO2wTvhVu/Sv7E3aNuZIELCIDdJo6FB3S8+k8xV1eZsiFj9iB1
PJddcc3VkNjzsU/7ltfKE0b/hhEzgQAJABU7LFWLxpqGtifhScASHGzMMYBqKLAk
1FpZpxDJu5AGSAVbBFQaiJoJL1/EWHipfn8hysNzJ98Wf/AS5rIZgJvEFhqPvkQz
FRFATOe2hqIb5E0PpNW1cEye8lWGvQL2FVUaOHG8H5vGDS3/FDa3LtdWlt+NYdar
rWmWQXdMmhIh74bjoV1+FM7GzWytNT2K7rKch9JOvdnFwiH8hJIp7ZoLulZWyCHe
2aQ8B8uUbexcBXDUFvuLhDTNfGKkhZWfUAC6JqoqCw2xaa1alO4R6SskQDfM4/5U
fz5Pu038nogFhqGCTinY64A8HSY/AtzL0qPB/kxd9YQjlz3TcZvdr2CXSJMPe7tx
zX1LLFoVo6Efno4yVVMUcpLfxX5wnRZ1MApXF7acKapDIsEUAX+5Vgpn1jIs7ivs
XICv1fv43wf233tq6AxD8DhLZVYVZdJRazlMMdGluzGOdbonV3LUMFNtJWDy16MY
lnqAIF5rCTUebO1qOQKX96GwE4ZX5ZUXTOodCxac/90Pf9IN+fThLoLZvs8F5WxT
vVDw8wVlp+ylb3zJTn51i6Lk+QbqQaaJx1OGC6VyBeDp/3a4eyI=
=/UDo
-----END PGP SIGNATURE-----

--ldz8iAyLzBuJ8Wi1--
