Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38293C433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Feb 2022 14:58:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241820AbiBWO6h (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 23 Feb 2022 09:58:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236488AbiBWO6h (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 23 Feb 2022 09:58:37 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DF0FAC936
        for <linux-tegra@vger.kernel.org>; Wed, 23 Feb 2022 06:58:09 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id a23so52783132eju.3
        for <linux-tegra@vger.kernel.org>; Wed, 23 Feb 2022 06:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fv8FmGALKcXXiC61Pb90szGF4PWZeFkoGuOLIz8Tk0o=;
        b=lEoeTEWcwx6ipDZoNfBYvGV7e/qMOP9sRZQ24TQdjehlsnUQSmOvgT+6P56eQan/Fx
         Emr5/z6BDELDQbVmPH2inLMClTalmO9F+K2SGPNC9psZmJLFquSJxDXoUFG7mpVzm+5d
         aF4z29enzixkctxJmVgrETr22tI9lDwZ1u826+kZBjImzzNeI41vAXTiTJFz9nYSOHUl
         wcwnIbp1nFGCjle4WGjnnRqSPjnE3+zy4Cp/979hDp8P3S2q9oKIo2raMG+0FP2D/a5t
         e85x0P9ro4v7d4avkYUFiWFqCdNOgDGHYcng9dXmblfnuUl1FV99T/UdLYfCLXldsOqk
         Z/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fv8FmGALKcXXiC61Pb90szGF4PWZeFkoGuOLIz8Tk0o=;
        b=HdyNl8bWsvpg9YG9PVX4t1Zngb51LoT5iVXCPf/p1yKCsuSwgjfDY6SVjtkbL2Y/1P
         iPxLC9TtwzcBzBvUb9lNAjHCQY5fqfRWjhBLMWKWdU+DClmXAdkryK1exIualjeqTTet
         Ney/uhoyHlcVWxOcRQLUPAnyA6i/PxDiCDFRdnmr5prWGM901oNFGNbeuMrcVpsDweYX
         Az0eCcgQWYzJqxu66e1t9e0k7e5xDpNcRTVwDQ34AUozH0uHT/IxvxdTk5CYrOyPvLbp
         XpSuWg7tWe3A93ghru5sAvkCECZODGaduWjGabPpm89r84Va2ff+0qrtCRb2Yk9jCuXQ
         7DnA==
X-Gm-Message-State: AOAM530fnmEl1HeokrVsi5g98aSszd5ENSN2yJUJLpFhsXj6sOGAOA/A
        jvLObs/2a7VhYLFkAmeFhw8=
X-Google-Smtp-Source: ABdhPJwCWND5sWX1yn3B580BuH8sQgsQoadtauR/T9KSpLCR3SB13SGmbHIrz7PWjAy1JAZ/PWPuZA==
X-Received: by 2002:a17:906:c0c8:b0:6d0:562c:2894 with SMTP id bn8-20020a170906c0c800b006d0562c2894mr67880ejb.625.1645628287545;
        Wed, 23 Feb 2022 06:58:07 -0800 (PST)
Received: from orome (p200300e41f0a6900000000000000043a.dip0.t-ipconnect.de. [2003:e4:1f0a:6900::43a])
        by smtp.gmail.com with ESMTPSA id c3sm7605177ejc.120.2022.02.23.06.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 06:58:06 -0800 (PST)
Date:   Wed, 23 Feb 2022 15:58:04 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mikko Perttunen <cyndis@kapsi.fi>
Cc:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH libdrm v2 20/25] tests: tegra: Add VIC 4.0 support
Message-ID: <YhZLfDL0TO7W8mAi@orome>
References: <20220217191931.2534836-1-thierry.reding@gmail.com>
 <20220217191931.2534836-15-thierry.reding@gmail.com>
 <aecb46db-20c6-61d4-ffde-798b42842a7d@kapsi.fi>
 <YhZIqTCn/NmR7KAF@orome>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/fwrtCeFF/sTXthu"
Content-Disposition: inline
In-Reply-To: <YhZIqTCn/NmR7KAF@orome>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--/fwrtCeFF/sTXthu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2022 at 03:46:01PM +0100, Thierry Reding wrote:
> On Fri, Feb 18, 2022 at 11:29:34AM +0200, Mikko Perttunen wrote:
> > On 2/17/22 21:19, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > >=20
> > > The Video Image Composer (VIC) 4.0 can be found on NVIDIA Tegra210 So=
Cs.
> > > It uses a different class (B0B6) that is slightly incompatible with t=
he
> > > class found on earlier generations.
> > >=20
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > >   tests/tegra/meson.build |   2 +
> > >   tests/tegra/vic.c       |   7 +
> > >   tests/tegra/vic40.c     | 370 +++++++++++++++++++++++++++++++++++++=
+++
> > >   tests/tegra/vic40.h     | 285 +++++++++++++++++++++++++++++++
> > >   4 files changed, 664 insertions(+)
> > >   create mode 100644 tests/tegra/vic40.c
> > >   create mode 100644 tests/tegra/vic40.h
> > >=20
> > > diff --git a/tests/tegra/meson.build b/tests/tegra/meson.build
> > > index 1ee29d0afe1b..e9c2bc875a01 100644
> > > --- a/tests/tegra/meson.build
> > > +++ b/tests/tegra/meson.build
> > > @@ -36,6 +36,8 @@ libdrm_test_tegra =3D static_library(
> > >       'vic.h',
> > >       'vic30.c',
> > >       'vic30.h',
> > > +    'vic40.c',
> > > +    'vic40.h',
> > >     ), config_file ],
> > >     include_directories : [inc_root, inc_drm, inc_tegra],
> > >     link_with : libdrm,
> > > diff --git a/tests/tegra/vic.c b/tests/tegra/vic.c
> > > index f24961ac5c6d..e0a97c059eca 100644
> > > --- a/tests/tegra/vic.c
> > > +++ b/tests/tegra/vic.c
> > > @@ -134,6 +134,10 @@ void vic_image_dump(struct vic_image *image, FIL=
E *fp)
> > >   int vic30_new(struct drm_tegra *drm, struct drm_tegra_channel *chan=
nel,
> > >                 struct vic **vicp);
> > > +/* from vic40.c */
> > > +int vic40_new(struct drm_tegra *drm, struct drm_tegra_channel *chann=
el,
> > > +              struct vic **vicp);
> > > +
> > >   int vic_new(struct drm_tegra *drm, struct drm_tegra_channel *channe=
l,
> > >               struct vic **vicp)
> > >   {
> > > @@ -144,6 +148,9 @@ int vic_new(struct drm_tegra *drm, struct drm_teg=
ra_channel *channel,
> > >       switch (version) {
> > >       case 0x40:
> > >           return vic30_new(drm, channel, vicp);
> > > +
> > > +    case 0x21:
> > > +        return vic40_new(drm, channel, vicp);
> > >       }
> > >       return -ENOTSUP;
> > > diff --git a/tests/tegra/vic40.c b/tests/tegra/vic40.c
> > > new file mode 100644
> > > index 000000000000..1a5d2af6b0b6
> > > --- /dev/null
> > > +++ b/tests/tegra/vic40.c
> > > @@ -0,0 +1,370 @@
> > > +/*
> > > + * Copyright =C2=A9 2018 NVIDIA Corporation
> > > + *
> > > + * Permission is hereby granted, free of charge, to any person obtai=
ning a
> > > + * copy of this software and associated documentation files (the "So=
ftware"),
> > > + * to deal in the Software without restriction, including without li=
mitation
> > > + * the rights to use, copy, modify, merge, publish, distribute, subl=
icense,
> > > + * and/or sell copies of the Software, and to permit persons to whom=
 the
> > > + * Software is furnished to do so, subject to the following conditio=
ns:
> > > + *
> > > + * The above copyright notice and this permission notice shall be in=
cluded in
> > > + * all copies or substantial portions of the Software.
> > > + *
> > > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, E=
XPRESS OR
> > > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTA=
BILITY,
> > > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVEN=
T SHALL
> > > + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAM=
AGES OR
> > > + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERW=
ISE,
> > > + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE US=
E OR
> > > + * OTHER DEALINGS IN THE SOFTWARE.
> > > + */
> > > +
> > > +#include <errno.h>
> > > +#include <string.h>
> > > +
> > > +#include "private.h"
> > > +#include "tegra.h"
> > > +#include "vic.h"
> > > +#include "vic40.h"
> > > +
> > > +struct vic40 {
> > > +    struct vic base;
> > > +
> > > +    struct {
> > > +        struct drm_tegra_mapping *map;
> > > +        struct drm_tegra_bo *bo;
> > > +    } config;
> > > +
> > > +    struct {
> > > +        struct drm_tegra_mapping *map;
> > > +        struct drm_tegra_bo *bo;
> > > +    } filter;
> > > +
> > > +    struct {
> > > +        struct drm_tegra_mapping *map;
> > > +        struct drm_tegra_bo *bo;
> > > +    } hist;
> > > +};
> >=20
> > Histogram buffer not necessary at least on VIC4.0 and later. (Same appl=
ies
> > to VIC4.1 and VIC4.2 patches).
>=20
> I'm pretty sure that I saw SMMU faults without this on all of Tegra210,
> Tegra186 and Tegra194. I'll go and test this once more.

Nevermind, I see now that this buffer isn't used at all on VIC 4.0, 4.1
and 4.2. I misread your comment as this buffer not needing to be
supplied in the command streams.

Removed all code related to that from the newer versions of VIC.

Thierry

--/fwrtCeFF/sTXthu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmIWS3wACgkQ3SOs138+
s6ENOhAAntVyL0wZTsJJrDEpx7/xlgaVUGBqln5Qsely5uqstqyMDkFJsGW33qrK
5lfHoQSvym46b6uG9JJxI+JMTvprXLU/NCWyBi6hjLvorkZ92HhSrgn4gijfkD0U
0ObCPB+6BmKfBEEVC4tIVMaQIjiD2l4sHjULwXPaDpP2f9CoYZrqax70CWr8SAjO
0uqVgoU5Bzp+4yuMSwreqglu4zjuQl7RbwSuoK5yFgn3H5qDPCZBj0GQWY7F9bDN
CmfEmKTjSbaokoJjCTyg0w/pQTIuYY2lQgy68TLX43pBcZi1K/dwA893SBb/z5Lj
XlSOYGG3e7S0HaqOCFDNLGMggGB7bzOQKkYESh1ie3U3zDVl8XkgX1kKzqIlcfPp
iTSjZ/OuzDR6KSOYMfCADYypz55jh8zr9uhBqlKbVOFNXJz9zUXjN8sT5gtuQqdB
HDoErxXyRXEI2Mi+R7x6LMUTG4AHiLPI/QTXv+4E6PRTIjlf1KCPeEP2OSfCaSf+
oPbgY4VyMqKIHsIpiml6i2Qdb1OxCd9OEv9qJIA2QTJYa4RKKIws9hAF1hIwSnek
7ojnvOYWMHGVrhic80jL46Aly0dffboSDpXJrCtRazDTL/KuKNXn5lET309vzrro
m29/dweo6ByuSEx5ghTErcURS4Jaaw86DZOLoH1RNrw07LSkoK4=
=s36U
-----END PGP SIGNATURE-----

--/fwrtCeFF/sTXthu--
