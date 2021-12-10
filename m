Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06FE3C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Dec 2021 12:17:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236068AbhLJMVI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 10 Dec 2021 07:21:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbhLJMVI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Dec 2021 07:21:08 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F338FC061746
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 04:17:32 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id v11so14572830wrw.10
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 04:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HSEdPBDPX+gdhClLmDp0y7TAdLojPAK0Bl5S/iPqSzo=;
        b=ByBfgC1M61gCH9tfVq5mKhQCub3P2YNM37nipzmS3R2cZD/HbPzqxn1sTLis9wNChd
         DRi4+z4eUiSuJF9VJTLz6wzbBzzb6qDM9u5PzhVxJMLE73G2l8s9BTdyrAF1exkPddNf
         y5fo0NEueBsH5t0QHxs5eUCey9JRaAZLVEGzU6McvpPwZ4Y43sqT+zQgOpaIt+clP3D6
         OMM0kA6HNr5A9Kxh+1bMNIDrWFnpXDuRUhRAuVNQ8QTVa0PRl+YcStf+Wswe34mNWYpI
         ONn/7p2noWFYNoeqlO7p15pK7hnhFKT5kn4JV3AQ95dSTeKkKBRkcAZ8KLK1JqfbFbsJ
         QDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HSEdPBDPX+gdhClLmDp0y7TAdLojPAK0Bl5S/iPqSzo=;
        b=B4dUNpVU0S2N84SpD/lXbxkG10t4ktZWpq2gTeslml4448DAOfFxJp0vKezprnZHj0
         GdpWvNU9j2lp7wULGMm5VnEDcMrqNWaFnQ66vX99oLb6BEsyDFBj8pM6xKKEXXpv7RiV
         wARxcpyu5GAkVCU2ZcuJS76o5vK4gfAJTQlqMbIuVN5AmLCsFAmcBsUV9F76YB8E18Oi
         FyUyKuNHTTXB5PCCQuRqHyng5DtAWEJZjWI6AdT3QhpevSQAG1CjLTF6GFOObWULW1mU
         uGTp/GROhz95XPMNW4jKoplfDGi1+3Xc5RtOP43a5lXSgpgqhj9wJh2pAIzs3sCt+LdG
         IHEA==
X-Gm-Message-State: AOAM530e2mP2DOWrGdRLM/CNDn7k1leojDWshTcLbws8jUGGddezcoBN
        k2tTs2vt1TH7wBYJnWhuZEo=
X-Google-Smtp-Source: ABdhPJyQKw21WZ+q+XO3WBKZJJn8k+RsDjhzHRuOimgSZ/U1iuvjwx9SQwj13avKvy4YRKlvdRna+g==
X-Received: by 2002:a5d:45c4:: with SMTP id b4mr13509766wrs.222.1639138651420;
        Fri, 10 Dec 2021 04:17:31 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id az15sm2654333wmb.0.2021.12.10.04.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 04:17:30 -0800 (PST)
Date:   Fri, 10 Dec 2021 13:17:27 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 01/25] ARM: tegra: Clean up external memory controller
 nodes
Message-ID: <YbNFVznlT+ErMfSf@orome>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-2-thierry.reding@gmail.com>
 <ec912e49-5ac6-476c-903e-cf1ad08e62bb@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Q2WBmmuvboH5xNq6"
Content-Disposition: inline
In-Reply-To: <ec912e49-5ac6-476c-903e-cf1ad08e62bb@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Q2WBmmuvboH5xNq6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 11:01:10PM +0300, Dmitry Osipenko wrote:
> 09.12.2021 20:33, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The external memory controller should be sorted after the memory
> > controller to keep the ordering by unit-address intact.
>=20
> "sorted after the memory controller, I don't understand what this means.
> Please clarify.

In device tree we sort nodes by unit-address. In these files the
external memory controller device tree nodes (which have a higher unit-
address than the memory controller device tree nodes) was listed before
the memory controller device tree node. This fixes the order by sorting
the nodes correctly.

Guess "sort after" doesn't really exist, but I thought it'd be clear
enough in the context to avoid using so many words. Guess I was wrong.

>=20
> > While at it,
> > rename the emc-timings and timing nodes to avoid including the RAM code
> > and clock frequency in their names. There is no requirement to do this,
> > so we can use simple enumerations instead.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  arch/arm/boot/dts/tegra124-apalis-emc.dtsi    |  483 +++--
> >  .../arm/boot/dts/tegra124-jetson-tk1-emc.dtsi |  699 +++---
> >  arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi  | 1918 +++++++++--------
> >  .../arm/boot/dts/tegra124-nyan-blaze-emc.dtsi |  639 +++---
> >  4 files changed, 1900 insertions(+), 1839 deletions(-)
>=20
> It's very suspicious that you changed only T124. This all doesn't look
> good to me.
>=20
> Please either explain it all or drop this patch.

Well, on other SoCs the order of the MC vs. EMC was correct, so I didn't
have to touch those and therefore didn't fix up the numbering while at
it. What exactly is suspicous about that?

I'll go and update all of those files as well if that makes you happy.

Thierry

--Q2WBmmuvboH5xNq6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGzRVUACgkQ3SOs138+
s6FrehAAiK3CGe8SpLmz9u0ls0ULKlDMP978AHM0zbguxOagUXmFrymb60uLYFbo
0qnUsZIgOMzhyfyFZdvxDVIi+hH3f1iVQUWwE0+8Jy5K4DDfPbniKHhSHAFMnmBT
+FOrewFV/6M39NxUcKnjn9QBqhVuIBb2COvJJwvy3geM78emDy+LXuWfGiL/nw9C
SpEQj6DBi0q1RnbBmgp56IcIVv1fJjRtx+od1gX2IuDWClYYNBf0k+lvfyYV0rzU
2uiflwA4j6t/BrHqAB5ux7uHNT592S7b3oI1GPvgJx75UB24Nc/EyquSzg1q4E2i
F8q/M/geehGWsg5XacvUq7DIf2nNbKNfndDJdvVfXsuLojnKpRYpe324q3him59c
ejdoURH8hjefJkoxN6LC9yCRlEaGdWc3BhKlby+gBx667IqYXVnO9zxGd2VnOInQ
k+Z8mZn234fSgluK5eWKNwOqB8OQR3/MMPHcPjZv1LvQWyiNVZfjrnSkw1N2epYM
b6XsWKZq1hZJ8GJydqVGjh+FhriJbI3esEEqDg4dJrWyQNUYRJhwkC99eD4uOAAE
fhsDV3FxjVQRR+xxHMd3+pcuIt4o/4AVqCm3DfKXlRMz2JwGKUrbaO0oStCzVnvE
z/SuZIXJrzMBCxXcrEyDeI51yZPWpp9rbOjX0yKeZXQdIe4MzBw=
=TFGi
-----END PGP SIGNATURE-----

--Q2WBmmuvboH5xNq6--
