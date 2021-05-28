Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3903AC4708D
	for <linux-tegra@archiver.kernel.org>; Fri, 28 May 2021 16:53:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 132DF613E5
	for <linux-tegra@archiver.kernel.org>; Fri, 28 May 2021 16:53:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233845AbhE1QzE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 28 May 2021 12:55:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbhE1QzC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 May 2021 12:55:02 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F59CC061574;
        Fri, 28 May 2021 09:53:26 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id l1so6351429ejb.6;
        Fri, 28 May 2021 09:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8/Q1T7/H3Ga42CpeeXwBtnXyWFCr/Nsv9NyGJyZCOVw=;
        b=EMVcyf6Vgozn5JaYJzcv45C5rVttjwZhqro7BUHd7I3jakgKq8Pbk7u9QzQGlo5MAD
         Dk2qFwXmHzAWKZpmpX8mTMlTgCUh5e8M0Nk7GJL8ar5Ok2CraN8y81cNbPrE2vGRTbrH
         KGHuKPgYre/zEvkyFVKxIXf5edK1SPiaq04y/2nS3EQKznllAGzpPmcaJaxJJTYueipU
         s7oNVNfnGFb2EZQOoWBsiAbTLe+413OVfW/uCjolzRCxjaXXncFbnhT6agwrdh/HKtWJ
         qicDai95PQu5/TK8Fx3dccPsg+kEPUX4nY2Ipb+N8VYr0SkT92c0IlyFSA0E9A8g6kRB
         fcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8/Q1T7/H3Ga42CpeeXwBtnXyWFCr/Nsv9NyGJyZCOVw=;
        b=uod3f/ozGvcyo6/DxLUlcR3WDK+3BO7aPi4xVSxYqTrYb/aSIQTspCmro81YIGhEbM
         ZigznA+G2gho748JGlW0sfI9Vuvzrzz191F2CD63DRGO7mzvOqk/xF3sc5EDUtzkAe+c
         KIU6abESHayqCeGNSlNCJyNWtTbC2nkJz2842wkrQfiQBRhoDX4evJYAyBDL8M6X79Rb
         /ThcTqZ+NjOOJaD2SxH4SpOQCxaCT5fCmy55w8sg5oYqj01jkzdkMvTZiUMMucPtQx/2
         BgAkF1D439BbS8rJ7qcgK/54zMxpjr44b9JG10osgwXAtwqY0Fgml2PY4dcbcHA4HkG2
         pQNg==
X-Gm-Message-State: AOAM533xSw+VGKC7aju/xqLy2MTHGTrheGAuJLkUHwMvJOK8p4MaevNW
        qxkbSN+xCweIcF5XCQ8U/Leh+4jZCWY=
X-Google-Smtp-Source: ABdhPJw+KFj6oh+Lnn+VyF4bZ3YYAp39NuBtIqWCrkvnE4kOjTZxgBquKlUXFUfzQ3Ajk/jPxTuIHQ==
X-Received: by 2002:a17:906:6dd0:: with SMTP id j16mr10062452ejt.208.1622220804798;
        Fri, 28 May 2021 09:53:24 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id l11sm2600520ejd.103.2021.05.28.09.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 09:53:23 -0700 (PDT)
Date:   Fri, 28 May 2021 18:54:55 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: reserved-memory: Document memory
 region specifier
Message-ID: <YLEgXyLBF8PEFNw2@orome.fritz.box>
References: <20210423163234.3651547-1-thierry.reding@gmail.com>
 <20210423163234.3651547-2-thierry.reding@gmail.com>
 <20210520220306.GA1976116@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Q8VGTr6iP6guEeJM"
Content-Disposition: inline
In-Reply-To: <20210520220306.GA1976116@robh.at.kernel.org>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Q8VGTr6iP6guEeJM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 20, 2021 at 05:03:06PM -0500, Rob Herring wrote:
> On Fri, Apr 23, 2021 at 06:32:30PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Reserved memory region phandle references can be accompanied by a
> > specifier that provides additional information about how that specific
> > reference should be treated.
> >=20
> > One use-case is to mark a memory region as needing an identity mapping
> > in the system's IOMMU for the device that references the region. This is
> > needed for example when the bootloader has set up hardware (such as a
> > display controller) to actively access a memory region (e.g. a boot
> > splash screen framebuffer) during boot. The operating system can use the
> > identity mapping flag from the specifier to make sure an IOMMU identity
> > mapping is set up for the framebuffer before IOMMU translations are
> > enabled for the display controller.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  .../reserved-memory/reserved-memory.txt       | 21 +++++++++++++++++++
> >  include/dt-bindings/reserved-memory.h         |  8 +++++++
> >  2 files changed, 29 insertions(+)
> >  create mode 100644 include/dt-bindings/reserved-memory.h
>=20
> Sorry for being slow on this. I have 2 concerns.
>=20
> First, this creates an ABI issue. A DT with cells in 'memory-region'=20
> will not be understood by an existing OS. I'm less concerned about this=
=20
> if we address that with a stable fix. (Though I'm pretty sure we've=20
> naively added #?-cells in the past ignoring this issue.)

A while ago I had proposed adding memory-region*s* as an alternative
name for memory-region to make the naming more consistent with other
types of properties (think clocks, resets, gpios, ...). If we added
that, we could easily differentiate between the "legacy" cases where
no #memory-region-cells was allowed and the new cases where it was.

> Second, it could be the bootloader setting up the reserved region. If a=
=20
> node already has 'memory-region', then adding more regions is more=20
> complicated compared to adding new properties. And defining what each=20
> memory-region entry is or how many in schemas is impossible.

It's true that updating the property gets a bit complicated, but it's
not exactly rocket science. We really just need to splice the array. I
have a working implemention for this in U-Boot.

For what it's worth, we could run into the same issue with any new
property that we add. Even if we renamed this to iommu-memory-region,
it's still possible that a bootloader may have to update this property
if it already exists (it could be hard-coded in DT, or it could have
been added by some earlier bootloader or firmware).

> Both could be addressed with a new property. Perhaps something like=20
> 'iommu-memory-region =3D <&phandle>;'. I think the 'iommu' prefix is=20
> appropriate given this is entirely because of the IOMMU being in the=20
> mix. I might feel differently if we had other uses for cells, but I=20
> don't really see it in this case.=20

I'm afraid that down the road we'll end up with other cases and then we
might proliferate a number of *-memory-region properties with varying
prefixes.

I am aware of one other case where we might need something like this: on
some Tegra SoCs we have audio processors that will access memory buffers
using a DMA engine. These processors are booted from early firmware
using firmware from system memory. In order to avoid trashing the
firmware, we need to reserve memory. We can do this using reserved
memory nodes. However, the audio DMA engine also uses the SMMU, so we
need to make sure that the firmware memory is marked as reserved within
the SMMU. This is similar to the identity mapping case, but not exactly
the same. Instead of creating a 1:1 mapping, we just want that IOVA
region to be reserved (i.e. IOMMU_RESV_RESERVED instead of
IOMMU_RESV_DIRECT{,_RELAXABLE}).

That would also fall into the IOMMU domain, but we can't reuse the
iommu-memory-region property for that because then we don't have enough
information to decide which type of reservation we need.

We could obviously make iommu-memory-region take a specifier, but we
could just as well use memory-regions in that case since we have
something more generic anyway.

With the #memory-region-cells proposal, we can easily extend the cell in
the specifier with an additional MEMORY_REGION_IOMMU_RESERVE flag to
take that other use case into account. If we than also change to the new
memory-regions property name, we avoid the ABI issue (and we gain a bit
of consistency while at it).

Thierry

--Q8VGTr6iP6guEeJM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmCxIF0ACgkQ3SOs138+
s6GgVBAAvM4rKjwwQlq4GSoJz946gpHZ/v8WPH/wvUQcsnFUrNIGJsLNItv+oeNC
WSP4nCxc4cEhpi0Jl9MUM24e0I9BM1eL5x9t86XdssjF8ElmHeO6uUPL3zKUmhrv
C94rix/U5H4oDUANv22Fi2GCVAMLjnCRAgz0jOzAmpRnR8CfpGhC8HD9+vsIOuyl
jr0zb5JdJQntp9KfagD2sxrrMp3bkb3AURhgxvMzu+jMgsjAsg65LxZkrmwfLUOg
Dt8LDNcbx42zE3ioF+F+fT7mHRfMPsxyAM9dYtFbjeGr4/+vdwEIuySRXW4lY9+U
j1Lc/M5Fperag6as/U7dGSNutUBzWRJTKe9AmCgJ4+O0Z3GZJCl1ziuUjI7WmMxv
6E2s5Mg0CImYe4rMFVy065os+saYdiLy4xJy2sjnt71qsa0GMzJ0k8H07E9RYQ9g
l4RRkfj21qt/PuMAh9TuFewQIJxgVHUmOWFQ/qATYqTGKAmXriVBolY7wO/KuwTe
zgo8dShCCO92KASb9NFZEqCg9Igi5c+5hzU5oi3tXKG54uCfWnhNn/HVN1viCbzi
jr1cm5Bn/kj1id1xeHdPKPCIONcDEQYv/slUpRsMo3hTQzgpkxKP5OH7CbAxLo3Y
/RPDyN8wSreHg3SM97nqYGade6GOZVug0oFC5RoL4oQaU02immw=
=1rTq
-----END PGP SIGNATURE-----

--Q8VGTr6iP6guEeJM--
