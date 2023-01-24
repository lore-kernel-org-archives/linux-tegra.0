Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B35C54E94
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Jan 2023 14:25:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233417AbjAXOZ0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Jan 2023 09:25:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233640AbjAXOZZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Jan 2023 09:25:25 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E16147EE3
        for <linux-tegra@vger.kernel.org>; Tue, 24 Jan 2023 06:25:13 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id mg12so39443543ejc.5
        for <linux-tegra@vger.kernel.org>; Tue, 24 Jan 2023 06:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIMyErG+OVIh5p0fgULl+rOlC1Su3gu7uJSu2roAbGU=;
        b=WZ3Yqhc3WZmVM59o/HzJp/LG1ClvnjEt3flFxZQah1PpPu8iHc79QRxNj4Fmiuz22Y
         Rx2ppJX04oSxQ/kD/P/hGJ/zls0BP4WL+T119YF5NjGU5qpBLGgx1VsbwwtdCJnlG9Yu
         6GA2XChc1k3fNtveNFRfurdqgM7C74giWq3rROLHfO2Hi7w6aBiHxLm7rxEHaaPLkjQd
         zDdlzD3f7bMmILAXO3ToPARYbwnBr6K/AHJVXHB7BzitBepYit9olDYfZ0/1wJbK6Hn3
         gVLmTglNCGtPs/WDEY8u9ZDpJRbfYZIx3DKjxed4BXcHfX0VC1qTuGCzvReRZ3+Lmhxo
         UEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sIMyErG+OVIh5p0fgULl+rOlC1Su3gu7uJSu2roAbGU=;
        b=UmairpYZjQwA7YSJN13k/Bs0PuPHQEhAp0sGYRWCEuNixAOyFGaJm//eqy05dwdgpF
         uAmeuToANCyL4H+npSGFhIGcAE4XcPy7zKjhzzrGUBGD1BYUo41yJA8+i9R0GPwNiDgM
         QtAQb6WtDHkm1C4jdRmM38qKZy4nek/F4+aU1UITDW8cXtb3dWdZv/hntKvgaCj8Zi1B
         bnBabfZc9NStgg07lhjpKwLYiYoqH7JC9/gK+WLN/+PihyCL7Rj+1GUBb51wj1v5b7EK
         R53WkKrwT3NMkB1W2pcTKBrAJYRZ7M7dIHhyEgG0EJMQK1nITEnHXs50LUjBaL2/kCuf
         5kow==
X-Gm-Message-State: AFqh2kq+XT6xNLdAblsSbZdwffXlt5hZgfrLB9kp2XsdXlc3oprwzADO
        LfqejolDBA0x1IeuURUmy4uCE1MpXbQ=
X-Google-Smtp-Source: AMrXdXs8JKABBjaVVUebXdjIIN41uhyKPWyVnAAPELdp0ZMB+qqLWvqQyI8nH/RNlIFI4COoaYZWFw==
X-Received: by 2002:a17:906:bc5a:b0:871:ed54:60a3 with SMTP id s26-20020a170906bc5a00b00871ed5460a3mr31874640ejv.23.1674570311925;
        Tue, 24 Jan 2023 06:25:11 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id xa4-20020a170907b9c400b008762e2b7004sm939156ejc.208.2023.01.24.06.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 06:25:11 -0800 (PST)
Date:   Tue, 24 Jan 2023 15:25:09 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     airlied@redhat.com, daniel@ffwll.ch, jonathanh@nvidia.com,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/tegra: handle implicit scanout modifiers
Message-ID: <Y8/qRSBm715P3EnB@orome>
References: <20230120105858.214440-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="00AUL/KaA0KSyTwk"
Content-Disposition: inline
In-Reply-To: <20230120105858.214440-1-diogo.ivo@tecnico.ulisboa.pt>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--00AUL/KaA0KSyTwk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 20, 2023 at 10:58:56AM +0000, Diogo Ivo wrote:
> Hello!
>=20
> This patch series adds support for correctly displaying tiled
> framebuffers when no modifiers are reported by userspace.
>=20
> Patch 1 adds the sector_layout parameter to the SET/GET_TILING
> IOCTLs so that userspace can set this field appropriately.
>=20
> Patch 2 adds handling of the case where the buffer object
> passed to create a framebuffer is allocated with non-linear
> tiling but no modifier is reported.
>=20
> Diogo Ivo (2):
>   drm/tegra: add sector layout to SET/GET_TILING IOCTLs
>   drm/tegra: add scanout support for implicit tiling parameters
>=20
>  drivers/gpu/drm/tegra/drm.c  | 29 ++++++++++++++++++
>  drivers/gpu/drm/tegra/fb.c   | 59 ++++++++++++++++++++++++++++++++++--
>  include/uapi/drm/tegra_drm.h | 16 ++++++----
>  3 files changed, 96 insertions(+), 8 deletions(-)

We really don't want to use SET_TILING and GET_TILING IOCTLs anymore.
These only exist for backwards compatibility with very old userspace.
New code should use standard DRM/KMS mechanisms to deal with
framebuffer modifiers.

Thierry

--00AUL/KaA0KSyTwk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmPP6kMACgkQ3SOs138+
s6Hr4w//feZUk45lhbHhtpvjHRVcxs/T5+FWY2LO73MKXxH1doa3XOqx4HWQ2d0n
v5r+xLI7ueoZONt1LKTjVdV/z2wd/BQdkScxZIoJvKXWQieT+wlSNxVaXaR87slg
7yPE29aBc5pCgwjtOz7GQRnOmjeETbPKqMDUijpA8Dbk8dHM02JruXHjj/vPTGSu
r9OyeGFOqjUrJuPtjln2ZqnTKqHZ5ED78/aJ5qo88ibE5epDee0i+TJe2fPI9MHJ
pGXR+MqptINMkIg3++zd40W0j29WYFUPxR1xQSv87O1yNNkqU7Br1iE7eT/H1oM5
9We/4w2szEQelkOvt6og7fFWFyD39+1QpLYXhTBggq5p+LntX1vdnw/YBLI/5htG
bqxkz4+8GMYI54kaknHMeRz0SxoWDyzKOLxLARnPoJdR5WPzUSI1hD6brhrmfu7M
jzDRVGtlRpGmjsqwJW2GIsYzgvPcpPzeZod+y0pjwid/UDuyA5q1oOY98EAGwVwu
p1tMkxItkn+voPSvGRZo4EZ6DHWrsAOPquKpQkSIVEH/LimGwXmoN5mI2cEHApjf
kDY6EPm67I1UdN7CLDc/kFhBV3izuzu/wgrQqtj3r05jFf1rfboxdZu4/2SMBkGp
jf9CRtJTntHtVZ4nRrWgHYtolEApolWPoBJqb7hVJpD+tGEVYKg=
=3UOd
-----END PGP SIGNATURE-----

--00AUL/KaA0KSyTwk--
