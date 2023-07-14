Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F48EB64DC
	for <linux-tegra@archiver.kernel.org>; Fri, 14 Jul 2023 15:16:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235825AbjGNPQ2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 14 Jul 2023 11:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235588AbjGNPQ2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 Jul 2023 11:16:28 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5A42702
        for <linux-tegra@vger.kernel.org>; Fri, 14 Jul 2023 08:16:26 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-992f6d7c7fbso268633666b.3
        for <linux-tegra@vger.kernel.org>; Fri, 14 Jul 2023 08:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689347785; x=1691939785;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTLGuXDFzImwaRpNe95xm4WgKHTnAEcD/16SgEV7LAw=;
        b=euVCZ1gJcZqYv5LzFXGm1i0eZYkxtri45SweyulgO0Vxf6yPyP0qPwO0dbZDvD7onk
         y58eSxuacw2MXG9b627HKIUoeqRQ/NuiMsnTvT46knYqBjPR4BeyG7pQ4d/rG53zERz9
         my427EkunUFJd9S3p7NlYK6vRRcHcVDpj5aesVPSKfbhWEjBfnXI/+8OhvskxO9gGlIk
         M2AWsEOrE7OyiJ1Y0Iaf3J0LOTo0xA1jIib/lxx4i/iUx3aoIeHyvVNo0FQcTcSxvSbx
         brNqKlupJVOvcxa8HeuuhUqq4HMfK9UeXgylQMrnDVyqrep7VdWtqCHN/STLCf7Y6q2F
         oheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689347785; x=1691939785;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tTLGuXDFzImwaRpNe95xm4WgKHTnAEcD/16SgEV7LAw=;
        b=h6yG37GJfu2GOO0FJKKEY45fabMlKi1tlNTa5C4ud9pzLzK3hiC+awtqDOqiOrF+D5
         0ExRuzoRPORQnXG/wx2nHtnxBqiX5EpXifXZoZYXFe+qplch8eyMn9HN147mqwnGLrUe
         D0EpYILuSTt+ZmLipr86BF/tPyGsqdLPO5YOj7L5IFFP9RcDfOEyjXTZ+fw+PZ9Lp1/U
         C9k9J6Pq7/he5LuTuO27GPb0wFiPhNy6hbei2JQErWrHkVDFyJvIXRcJgCb2QcHpRofZ
         6bqBf2ZKjFRNMMj26nc7csa9vRpdJXmUfVxF5X0X8D0WD2x0eTlYn/3mUywwz65cXelD
         Rtcg==
X-Gm-Message-State: ABy/qLbzuPD0bkcF1wROPfzGB+kM48zGzSNWl06fQqD8RxSekjczD2ZA
        dHsOsEsUsJybKHLSVYKwE3w=
X-Google-Smtp-Source: APBJJlGGdwhjQATtzFEjaq35hGHodIJMu4x7Hu57gIGOu1N3RQ4vsgmOPDVEtECU/7yPj5ta0efUkw==
X-Received: by 2002:a17:906:51d1:b0:994:539d:f97f with SMTP id v17-20020a17090651d100b00994539df97fmr1316573ejk.37.1689347784784;
        Fri, 14 Jul 2023 08:16:24 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id md11-20020a170906ae8b00b009828e26e519sm5483843ejb.122.2023.07.14.08.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 08:16:24 -0700 (PDT)
Date:   Fri, 14 Jul 2023 17:16:22 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        Ion Agorria <ion@agorria.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Pedro =?utf-8?Q?=C3=82ngelo?= <pangelo@void.io>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Zack Pearsall <zpearsall@yahoo.com>,
        linux-tegra@vger.kernel.org
Subject: Re: LVDS panel compatible strings
Message-ID: <ZLFmxuVuO2FWy1as@orome>
References: <ZLFd_L_Uw1PmpSep@orome>
 <CAPVz0n3fj77JEzJbYve9-5pjjVt+yJHNcFGqJr0HFSJnaOtbzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jaRx9L7WuvZyKljW"
Content-Disposition: inline
In-Reply-To: <CAPVz0n3fj77JEzJbYve9-5pjjVt+yJHNcFGqJr0HFSJnaOtbzw@mail.gmail.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--jaRx9L7WuvZyKljW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 06:00:43PM +0300, Svyatoslav Ryhel wrote:
> =D0=BF=D1=82, 14 =D0=BB=D0=B8=D0=BF. 2023=E2=80=AF=D1=80. =D0=BE 17:38 Th=
ierry Reding <thierry.reding@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > Hi everyone,
> >
> > I've been working on converting all Tegra-related device tree bindings
> > to json-schema so that eventually we can fully validate device tree
> > files. Getting all the bindings reviewed and merged has been slow, but
> > I have a local tree where pretty much all validation errors and warnings
> > have been fixed. The remaining warnings that I'm not sure how to resolve
> > are these:
> >
> >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: dis=
play-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05', 'tbs,=
a711-panel']
> >         from schema $id: http://devicetree.org/schemas/display/panel/pa=
nel-lvds.yaml#
> >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: dis=
play-panel: compatible: ['panel-lvds'] is too short
> >         from schema $id: http://devicetree.org/schemas/display/panel/pa=
nel-lvds.yaml#
> >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-tilapia-E1565.dtb: dis=
play-panel: Unevaluated properties are not allowed ('compatible' was unexpe=
cted)
> >         from schema $id: http://devicetree.org/schemas/display/panel/pa=
nel-lvds.yaml#
> >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: dis=
play-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05', 'tbs,=
a711-panel']
> >         from schema $id: http://devicetree.org/schemas/display/panel/pa=
nel-lvds.yaml#
> >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: dis=
play-panel: compatible: ['panel-lvds'] is too short
> >         from schema $id: http://devicetree.org/schemas/display/panel/pa=
nel-lvds.yaml#
> >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: dis=
play-panel: Unevaluated properties are not allowed ('compatible' was unexpe=
cted)
> >         from schema $id: http://devicetree.org/schemas/display/panel/pa=
nel-lvds.yaml#
> >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: dis=
play-panel: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05', 'tbs,=
a711-panel']
> >         from schema $id: http://devicetree.org/schemas/display/panel/pa=
nel-lvds.yaml#
> >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: dis=
play-panel: compatible: ['panel-lvds'] is too short
> >         from schema $id: http://devicetree.org/schemas/display/panel/pa=
nel-lvds.yaml#
> >     arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-PM269.dtb: dis=
play-panel: Unevaluated properties are not allowed ('compatible' was unexpe=
cted)
> >         from schema $id: http://devicetree.org/schemas/display/panel/pa=
nel-lvds.yaml#
> >     arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: display-pane=
l: compatible:0: 'panel-lvds' is not one of ['auo,b101ew05', 'tbs,a711-pane=
l']
> >         from schema $id: http://devicetree.org/schemas/display/panel/pa=
nel-lvds.yaml#
> >     arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: display-pane=
l: compatible: ['panel-lvds'] is too short
> >         from schema $id: http://devicetree.org/schemas/display/panel/pa=
nel-lvds.yaml#
> >     arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dtb: display-pane=
l: Unevaluated properties are not allowed ('compatible' was unexpected)
> >         from schema $id: http://devicetree.org/schemas/display/panel/pa=
nel-lvds.yaml#
>=20
> Hello Thierry! Pegatron Chagall uses a Hannstar similar to one used in
> ASUS TF201 but unfortunately it is not compatible with existing simple
> panel setup (blurry image if used). My assumption is that chagall as
> different revision of this panel like HSD101PWW3-B00 or
> HSD101PWW1-A00 which is more likely or panel is highly modified which
> is unlikely. I propose to use "hannstar,hsd101pww1" which is more wide
> spread.

Interesting. So is the problem the HSD101PWW2 timings that are off, or
is it because the panel-lvds code does something special to make this
blurry image go away?

Thierry

--jaRx9L7WuvZyKljW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmSxZsYACgkQ3SOs138+
s6HWYRAAgUAnGEK4QPQ4H+6KkQSngrtbKh7u30gjxTz3Fykn0thqCZdKqgvs8Avc
RYlMnjLx+k5Takz5zQiJXw+O95/7kb1jZ6zHUpvj+QmR4iwTfdnTlWuElPPwwO9j
B/0gMxmPQsN+dnt0RApLJeQho+SSmzvH/Z9W3ReOCy2UZDZi2SA8aCP4irtCZDlB
2K6ys61QQKFRdFvG1eilQsMb2qzeYPuEepC95/P9/KSZ1hZ6Zzm+rO7Q7jgIsOtL
vVUpQL2QJ4uxPGbGvKSaRvFEUzEzjo/p5FWnE/f9UDGjqOiXb505DoHG/C8Ef422
UCd6lrusvph1/ZG2JtRt48nsabfopCDKobbdK7/Pp1l94TgKfeXClognWreJXhrH
mobDDsSgOX57HdfCbkTJYO5eXciFX133gRgFFRtaINarveD89c7Qq3FIVIG/mSX2
1QFYm9nU9TE/FpQgAYtF6iz4tyFn81ZKq2qkNePSM7WkDCmzSCRLvSyE1qCyB6A6
YVLMxb9Qe6vbbKQlm2GHiIoKkJdkkxBYgmM5dVBgfHfE5gWBoTyh4PG9lhJ8I0dS
SCkkXxZztkrXQTE5WOvtus82LX+D61QEOR1UNAhzpjFGTMUTk5OH8OfSvEe3NcyR
Ave+ontnecNSc3rKcj6V0azNKzQVB54EbjC/bmjS8zQ/b+wc1k0=
=2VNz
-----END PGP SIGNATURE-----

--jaRx9L7WuvZyKljW--
