Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 516B9C77B62
	for <linux-tegra@archiver.kernel.org>; Tue,  4 Apr 2023 10:49:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234539AbjDDKtv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 4 Apr 2023 06:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234658AbjDDKth (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Apr 2023 06:49:37 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44ED430C1;
        Tue,  4 Apr 2023 03:49:05 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id er13so87770689edb.9;
        Tue, 04 Apr 2023 03:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680605342;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uo2dsZHMDA307Qy7YQHiBXCMTSafolwb+rytgxF+BW8=;
        b=X1u/MucY2jXtZcrtrmX+dbyLtJYfSWGQUKk1CphnpEm++aYLkFKIFJKtS3MGFVEDZF
         Ho0vhNt2OK5ztYctUnb0hXC4M4wuopeO8D8nBVFSSVlVPjGhCxl5G24lhPsnjcK1L7eW
         hk4soGH+EpIqDfmc1zTi2+0Lp8AmnWbqF46P7yLhy+/LOE40DjNZop99W5LUbEgp6lL4
         tM0vFPWiUJfQB/GVabdVR2Hw4AOHHPDUwJB0QPpQ0oQY4Tet7ozIFMBuycW734pQZWfT
         3ANICfxq4hDzS0joFc1WA7Fm//YKIlKdJKyX0hBJA4bMxz8565sMNfEFQKQ1HG9mTg6I
         2OoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680605342;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uo2dsZHMDA307Qy7YQHiBXCMTSafolwb+rytgxF+BW8=;
        b=ygLtfdjSw/2LQunmLGyNYWkDu7TvzTsTY5ZR6zBf6jxIYTNwXZKo8bS8cxzOqEWgFa
         xVRk+rnWJOSiWGHI8Qhe7PppXyhO8naNHsLh3pYRQ7t+NmtS4yprykQCZQ+178yNc7i4
         MvEYMYW8LKoR+ZBRCQTT9Y/HtOMZqBp3vFzgWZv+jrSoHklstNWj4yInXnPQ+LqdUDM5
         WGZT45BCBbUUlFgMNbicpVA06FjIxH9Gj1wAy/Sixx3dnQ0wcSsAgdNF2uWxAiKgnR64
         hxtWy1U8UZWRIJvANXOb6CppBioNvlk+LCYbiG3ijZawH+uUFlM4o0vq3mheOBV9VR4L
         YCfw==
X-Gm-Message-State: AAQBX9dQo6LgNKUrVQts94MkA4PuOrjMvXTmgqm/XMvGKdFlll8v4PZQ
        ClJRR+bqwAnAi/api585OMY=
X-Google-Smtp-Source: AKy350ZUOSc+KrA7acPoBQJ9X0omQm0CxXs6rb5DP7ZJqi0NyE0wNtmNVVoR+jCFOUzE43KNPDl1vQ==
X-Received: by 2002:a17:906:9404:b0:8b1:7eba:de5 with SMTP id q4-20020a170906940400b008b17eba0de5mr20565738ejx.10.1680605342547;
        Tue, 04 Apr 2023 03:49:02 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id tp24-20020a170907c49800b00948c320fcfdsm1906761ejc.202.2023.04.04.03.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 03:49:02 -0700 (PDT)
Date:   Tue, 4 Apr 2023 12:49:00 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: Document additional Jetson Orin NX SKUs
Message-ID: <ZCwAnBbeYVVUMti8@orome>
References: <20230331163159.17145-1-thierry.reding@gmail.com>
 <3a8724bc-fb44-0080-fd24-c04e3841385e@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OW0oWpKmJn5VRdWH"
Content-Disposition: inline
In-Reply-To: <3a8724bc-fb44-0080-fd24-c04e3841385e@linaro.org>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--OW0oWpKmJn5VRdWH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2023 at 10:19:00PM +0200, Krzysztof Kozlowski wrote:
> On 31/03/2023 18:31, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Beyond the original 16 GiB SKU (0), additional SKUs exist, such as the 8
> > GiB SKU (1) and an internal-only SKU (2) that comes with an equipeed SD
>=20
> typo: equipped
>=20
> > card slot.
>=20
> Is there a point in documenting all of them if there is no DTS? Also,
> size of storage (eMMC?) pretty often is runtime-detectable, so you do no
> need a new DTS and new compatible.

This is for the sake of completeness since these compatible strings
correspond to the part numbers that will show up on stickers on these
modules. In practice, yes, most of the differences will be runtime-
detected and the DT updated to reflect the SKU differences by UEFI.

As far as I know, UEFI doesn't actually do anything with the compatible
strings themselves, but that's potentially something that could happen
at some point. The SKU numbers also show up in EEPROMs, so I think
having one place where these are documented might be helpful to people.

The 16 GiB in this case is actually DRAM, but it's also detected at
runtime. We don't actually plan on upstreaming DTS files for all of
these, since we don't expect all SKUs to be widely used (the internal
one, for example) so we should be able to cover pretty much all variants
with just two DTS files.

Thierry

--OW0oWpKmJn5VRdWH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQsAJwACgkQ3SOs138+
s6ExkA//YIrfJ98mD99HbCbEuhWJanzVWK4QK1XJwwG/8zNV5/nSObNwRnjWGyYZ
b407vHqf8exnnzUvF4pLTv3gXgnhiizh45g6hSqTh/Wo+wVF67zhlIF9yItMFtuI
EhKvk4yVMpTHBQuzegcOAIu55sU7f57+vxjOIQ2+AoOUrwwlguKBshXXNMswsnV4
3lyQDrXFKcynh1ZzNbFzekieL2xn9GpcfejSEdHMoTyb7pS5KMtJypIWinEq1o38
4gmHEnPmeabaU7LZggIDEwpNmlxTuwOAMEixeU0bimF/f2wqYNJnlf2EmsrN/w7p
y1wjoynShO4OgEMhJPYXRUXk7+Ri/cnARuG6entPA0q1Jtq7IEXuKxExLy9Q/lEy
6YlfFh700v6mwHGH5ypem8xnxsGnSAAAKG6VWEWFevwp7/zZ58DuiJSNQDaTvWCZ
fPHy0kFpubqWwyD3+BCCuxw14CJnuHeQjRRFCD/Ly3tA2XSJRKanM0vuVbso2twW
oSdjPK3uDf52pUx71RqZ81bCL7SgkmyYze0hBjHY6T1vKMv7wCNu2hIt8fLr/qvk
jNaRaCCwYKnS3HnWPPkl7KpUGD3ZmMguZy+A21n1rcEb4Q4ioUY8Oiw5qa+Pr+AD
bCGG8JeFTCBD5A/w8yhB9AFhvoC9q0uaBoTM1acYSvSQjKcINtU=
=ksTa
-----END PGP SIGNATURE-----

--OW0oWpKmJn5VRdWH--
