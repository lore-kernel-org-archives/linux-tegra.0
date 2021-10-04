Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6150C433EF
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 21:08:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B23F7613A3
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 21:08:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234573AbhJDVKG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 4 Oct 2021 17:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233373AbhJDVKD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 4 Oct 2021 17:10:03 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B80C061745;
        Mon,  4 Oct 2021 14:08:13 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id a131-20020a1c7f89000000b0030d4c90fa87so1076483wmd.2;
        Mon, 04 Oct 2021 14:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ExpNAyWtxfRkOyLgK6OlAfk7qe6BMUPwRZV46lDYHcE=;
        b=hb8jWPpZFR4heOnocdeksnz2zZJPLhcVrFELpv/R21PfY05WtrxjAK8rBndwxQxbTR
         1rxpujlybysSb1w/pJYWeOEB6DnyoOKZH7y19y581y9IB5cPMLDHwai8z3FH3iHZvNyC
         r65BXKnPRB9XmmCH8ZV9XXXWduqPUoB+LqJRAcWg7J4j901lHnpBjy7soP10BYcNScyx
         G02dJBCbm8Y5+IkrTwUspWwc3XmUggFCNnVthUPtHDrnvt/rcdH3scJUASUyE0XBMkxr
         2syG6Kj7tLSfK2ii+dIMF/VuJ+MRWftL5lIQlwAGssa2+FLq3No/g1yDQylM3eAhxAOv
         UmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ExpNAyWtxfRkOyLgK6OlAfk7qe6BMUPwRZV46lDYHcE=;
        b=zJRVtgqdsIEtmtWrfTOPknl4pT2p4Rz6jrOJcFXOJ/Y0pI30tCz4+lc8WjscBgHgnS
         RNQP5WAXB1Cuc95cAFSWsE4m946hDM3HsItq7glOm7sH6W8vlfeKQSxlAQOMZ8+7IRrj
         WAKVwoeUxjn5WaikO9kNl4hs5bZU0vnZbif8zbtiOvZ4WuUSLXTt/U8A+oDg2ljpvYgh
         wh3mxUJCStwVO82gnbRUIIZgGcukNaKWDF1i/9WVG4hCC3uZoS0i3DwYejgJgXO5gDOt
         zOdzTGU5Tf0/FtgyLMuDNN2FzAkKZQxj3GFY0sowDKPvxBsLB4PdviB84v/lK6sCrS/E
         /y8g==
X-Gm-Message-State: AOAM533tg499XKpi1j5TjWxoVp0dF06X9mJz1l3iHTyQT9QlZPfGMkxE
        iWzWCCg+y45fbDIczV+kRl4=
X-Google-Smtp-Source: ABdhPJwX5lJDMvteY95tpaZB8pZG4/3NpvDNL9LwxZCgE3IcKc1/BtGNoEcSgY2xQK5mkyfoUavFXA==
X-Received: by 2002:a1c:80c8:: with SMTP id b191mr800519wmd.36.1633381692538;
        Mon, 04 Oct 2021 14:08:12 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id h18sm15164938wrs.75.2021.10.04.14.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 14:08:11 -0700 (PDT)
Date:   Mon, 4 Oct 2021 23:08:10 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        David Heidelberg <david@ixit.cz>, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v7 2/7] dt-bindings: phy: tegra20-usb-phy: Document
 properties needed for OTG mode
Message-ID: <YVttOi4pd9edd481@orome.fritz.box>
References: <20210912181718.1328-1-digetx@gmail.com>
 <20210912181718.1328-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vK21ZnETKhpCC7zZ"
Content-Disposition: inline
In-Reply-To: <20210912181718.1328-3-digetx@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--vK21ZnETKhpCC7zZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 12, 2021 at 09:17:13PM +0300, Dmitry Osipenko wrote:
> In order to support OTG mode we need these new properties:
>=20
> 	- interrupt
> 	- nvidia,pmc
>=20
> Add the new properties to the binding.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/phy/nvidia,tegra20-usb-phy.yaml     | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--vK21ZnETKhpCC7zZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFbbToACgkQ3SOs138+
s6ENVQ/9FU5WfmJN9bUqZjMXfl5Lc5KMWTsOD43CkASRJJ6wZFLPfAztJKo6tprG
/sfW6iZFRWiEimPuuiku3YWPvoLUDxBuMCrYnVM8BQC0kDyI8MCedBK9pPulEN+I
yP4s63ksl+Xnp2/kgStHG61gW26clu4S88yx4cIEyvzKlO/vnNt4BjeEHe05D/pa
/4NBCImfk7XIPyFeBmmO5oRqXeSceXPYaUfHbTM7EVhq1KwoHtd+QN2R/Wd8Cgn4
nBBBNAJHbB7+IOhyAyaegw8AA6Rvd+lQRTSg6bNtX2Yle9yKcZcaTqwAGF9UZklo
YGCsBK6E92+6oWaS2aLDluspquqbwzT7jmb2+pQISUE73IOTZcC0kaLhCMrdZgqD
FsshNl0aFdaym91b2SLnHsaseTNCAy43gizFophOkewV73H0KWo/dB9ViMJd4/L4
18K9eStTXTkpsEGRSxAj+EwzuFHUpyQ8TX4SehRBWe6GmLf/rTtBIbVa1wZRCTHU
7kSkrq9MD7/KEc9DW2UddYicFZWcBn7Tc+1nEdD9yrP/rsmu6QEySLuNHMBi/GuM
wjXe1digHo2YCK4op7JPe/HZnDalLYzMiI1B9fbNaKfZgwquxrur2CLExcWI7nBT
4nir3eONy7TnE6zWWbtE5CY46MaEue3HHstbR/DRi2a2DkpDq84=
=8etT
-----END PGP SIGNATURE-----

--vK21ZnETKhpCC7zZ--
