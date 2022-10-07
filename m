Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00FA1C433FE
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Oct 2022 15:22:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiJGPW2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Oct 2022 11:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiJGPW1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Oct 2022 11:22:27 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ADB4102517;
        Fri,  7 Oct 2022 08:22:25 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id z3so6515101edc.10;
        Fri, 07 Oct 2022 08:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+El8A1P1S/zXel3Nequ87VItdNh3NPA1dXujJmoYOXk=;
        b=R8nscShiJ4u+0sTGiav+3+Ex1pUvbKm3kIdYDUam8/6TsjAQWrhix/TlKOT5j8pbtd
         4CSwwu5oP0qft57eLUnB6P8tysG8oCrRYcHOMnrnC1NOMXpBMVUEEPx/dG+ILMtyWANW
         6jrXug1ap1+hHhdGqpVg9kOgCI4vFp2j3ystxYisA4ajCQjV1NjF6YkvvqTafT0YYqEP
         1/VlXMdUdfHRKk59lj3Usgttove6VF2S7LisXNmYxb7m73dYLM/gLMEaChnVGZ2Pv9dY
         z78pG8+2FashQAEQ/CrM7LcCGdY5Atsv6LXQsGPHlV7P5tFyqa5cDmP+KJ4RBpOQVQeD
         xq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+El8A1P1S/zXel3Nequ87VItdNh3NPA1dXujJmoYOXk=;
        b=QiTdFej65Nh1Vry1bonLYflN0HGAKkY/d169KWWwvHgsfSkaDUkVoBmvJDHtlHwG0u
         ZshEaXFesSjsogU962UQldB/gGTkBsVpYXyOqZq9OuVV0+6rwQjQPc5Z28K2JFFPdEa0
         L/8It/pxsv9vOuRuTnpTFXqSVrvxIxc7K/NIRngDl4Mmhy0U3VuMnu+npWGs1sGIXN/P
         FCjevgU8I4em3t7KWQOD+GxHdwZYwdVPlGMG/mAO9aMAf3huW7bd+G3oJGoJ8BIHhweM
         vFsPrNE4W/LiyARKCXZXEd0dQR7UIvkhNVcNY0uwCk/I+neKMvHiD55ydRjJu1KfpNNr
         izFQ==
X-Gm-Message-State: ACrzQf38bkeYjQA+bhhmweWOPAAqPvNrZSNTHmD2LJdYuVa+BhSKiv4T
        fH0WhFjcDVgrRKlS7KX0YfW07OOXB44=
X-Google-Smtp-Source: AMsMyM64pxlk0Q2rX8xynlf1HAWCmrrGeyUbN5wqj6UXON1FnS76vurUVYCh3xSq3RCT/YrPpa7P2w==
X-Received: by 2002:a05:6402:1910:b0:458:8b32:4752 with SMTP id e16-20020a056402191000b004588b324752mr5059019edz.302.1665156144032;
        Fri, 07 Oct 2022 08:22:24 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id o29-20020a509b1d000000b00459c5c2138csm1678498edi.32.2022.10.07.08.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 08:22:22 -0700 (PDT)
Date:   Fri, 7 Oct 2022 17:22:21 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 1/5] dt-bindings: reserved-memory: Document
 iommu-addresses
Message-ID: <Y0BELav7cgHdW0eT@orome>
References: <20220923123557.866972-1-thierry.reding@gmail.com>
 <20220923123557.866972-2-thierry.reding@gmail.com>
 <3fb949ad-74c4-1bac-7e14-5d056afcef5f@arm.com>
 <Y0AvkshNYmqc3UGo@orome>
 <75bebf10-6b89-464c-f9ad-c53f9f830c20@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ReXUlrLGezBjaiaj"
Content-Disposition: inline
In-Reply-To: <75bebf10-6b89-464c-f9ad-c53f9f830c20@arm.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ReXUlrLGezBjaiaj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 07, 2022 at 03:21:46PM +0100, Robin Murphy wrote:
> On 2022-10-07 14:54, Thierry Reding wrote:
> > On Fri, Oct 07, 2022 at 02:45:31PM +0100, Robin Murphy wrote:
> > > On 2022-09-23 13:35, Thierry Reding wrote:
> > > > From: Thierry Reding <treding@nvidia.com>
> > > >=20
> > > > This adds the "iommu-addresses" property to reserved-memory nodes, =
which
> > > > allow describing the interaction of memory regions with IOMMUs. Two=
 use-
> > > > cases are supported:
> > > >=20
> > > >     1. Static mappings can be described by pairing the "iommu-addre=
sses"
> > > >        property with a "reg" property. This is mostly useful for ad=
opting
> > > >        firmware-allocated buffers via identity mappings. One common=
 use-
> > > >        case where this is required is if early firmware or bootload=
ers
> > > >        have set up a bootsplash framebuffer that a display controll=
er is
> > > >        actively scanning out from during the operating system boot
> > > >        process.
> > > >=20
> > > >     2. If an "iommu-addresses" property exists without a "reg" prop=
erty,
> > > >        the reserved-memory node describes an IOVA reservation. Such=
 memory
> > > >        regions are excluded from the IOVA space available to operat=
ing
> > > >        system drivers and can be used for regions that must not be =
used to
> > > >        map arbitrary buffers.
> > >=20
> > > Bah, I've only just realised: don't we also need to change the "oneOf:
> > > required: ..." schema to permit "iommu-addresses" without "reg" or "s=
ize"?
> >=20
> > Hm... good point. I think at least we'll want another:
> >=20
> >       - required:
> >           - iommu-addresses
> >=20
> > in there. I wonder if we also need to avoid the combination of "size"
> > and "iommu-addresses". When "size" is specified, is it guaranteed that
> > those regions will be allocated before the direct mapping needs to be
> > created?
>=20
> Well, it couldn't really be a direct mapping anyway. In general I don't
> think that combination makes any sense, since the presence of
> "iommu-addresses" means one of two things; either it says the IOVA range =
is
> carved out for some special purpose or just unusable, in which case
> allocating any memory to back it would surely be pointless, or it's saying
> don't touch these addresses because the device is already accessing them,
> thus the underlying physical memory must be allocated somewhere already.

I thought perhaps there could be cases where it is known that a
controller needs to access memory in a certain I/O virtual region but
doesn't actually care where that lives in physical memory and also does
not rely on that memory have been previously set up (pre-filled, or
whatever). Say you've got a micro-controller in a system that needs its
firmware in a given region, but the OS can set up that region without
any other limitations. One could use "size" and "iommu-addresses" to
make sure the region is allocated with a specific size and located in a
specific I/O virtual region. Not sure if that's perhaps a bit exotic,
though.

Thierry

--ReXUlrLGezBjaiaj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNARCwACgkQ3SOs138+
s6G/wBAAq+jpQ9peE9xOPuucGTxcDci018hQWZ5ZsRlBmFmyT5BzIX0cT4DGGJsZ
6vf3ALxD4/NH5cdcWFj8OSlgLwo7E08+5cDI/aTL9688j9iKoUt8Lc2rWdUaSvlb
Mdv6KtE8+Isl4cZktPz+MwyGO7tV+khGGXcNYN0F+Y7qByk8l1/WyaRy/618qa6W
iQ8bkg3I6GhLInwBIzbTYTVr+AaWtZsYVCRkUDBz5QmmOsQJX1eCiUsn2+gjJ+UZ
+2aL72uC8QW5SyQ8HYJwTdBikhNli5wEQj+J7Lat398uhjLNqmvczJubFk2HTbXD
dIfhhLWqWwQfBkNYoOLhTk5mZWaS3SceEEHRaBHMCW/diav/yQeqN3WsyvWnqsHp
FHgrqVHy0VilyHsxape6LtHTdjTvCBEC39MnMDyQQstGCedlI9o+FKiUI7bYcwDp
nAL+wi/3y8u3NReOEvjTiwVqIFTn7KkxNio3WsFPTDsaIYIfJXqFZVD5FyqIT+ia
ew1Tly8J5ciU8coSbnKfdWF4K2669b/YrM6hPCXrfSkPP7uVVUtb64KoRveuhAUp
0tP0EAfXTGzIgZB9Z7vVCwnVtNRzRB3sXJmPefMiWgc2Fl1T1HdoIOw93Oz1sUFR
0sRscCxk1jNDynPz344SyQikVfaF9D0SmuS/xzP24yyJJ372jUg=
=pvnC
-----END PGP SIGNATURE-----

--ReXUlrLGezBjaiaj--
