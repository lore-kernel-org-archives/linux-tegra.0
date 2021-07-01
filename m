Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7024EC11F64
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Jul 2021 18:12:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55CCD61417
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Jul 2021 18:12:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233194AbhGASOi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Jul 2021 14:14:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233140AbhGASOi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Jul 2021 14:14:38 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A5A4C061762;
        Thu,  1 Jul 2021 11:12:06 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id gt10so10527850ejc.5;
        Thu, 01 Jul 2021 11:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=F36MKMagRhGCfKVfRAwtt9xJFZWHcYRQG0ajOVreECg=;
        b=sXBMX71ZsDJHpmuzo1jBlRAOpZcNUKocEYuEHW/ck2Jnkb/4Qk7+Rma8JfUKZcdxp1
         aXAN24ht8QX03jvqqW4shnVflz+OJrtLZkM/pUdQHUn5hnxtdox12AZpa5U9GfJnRU8X
         ZiJJQJkF6NxHGlj2Qu++GhT6c60dy9HcyMx79WlC4vK7CEyTj4F/gRtWLpJZ5eqKHAbr
         eaIhM2R5DFou7f6IOI4eEhjeH/+Ys42UrYDqxPRcETg2MpxJBLDzPkD74EDK+t2Zc6yt
         Nyp81qJQ0VZHi137abD9SySk+srqxQoI44zjenl2QnVG+vXVUaGDFOFoQKe74c3dq7yM
         2pcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=F36MKMagRhGCfKVfRAwtt9xJFZWHcYRQG0ajOVreECg=;
        b=hqWwa7JpLupAtTpynHFZTpCrlxx6LcdxH+zvfRao/a9iYCYBxckPktOOHlCvH2/BHY
         hTKm8cJNJ2mbH+cVoktaIrgSAwPdXa8Azx8b4FhVssDKZuCibv/JMhc+/AxlojBHxFhg
         922pQEajHqA54tBwWoLkdSF1oqEGNeLcil6d2zK12ON/Q5Y9csZw2pRO3SgtIMgaizz7
         kuqw4ylfjztAzrD7G3qfFzfCWHlMH6g+YeDDPXZMIb4eKS0/mhOxGgYqo+ANzdKhmjw6
         FS4LYcUaTV1cAvl4jQLRPe3xY6sBr75Y4B3eKpfQfmCn8x0/tN49ihn0ghdIDsRz+2k4
         6PvQ==
X-Gm-Message-State: AOAM533oB9xaiUVF8t05resHSyU1hbWaj7wWgq658R2NsZZx5gxv6reX
        eObxfi5984+lRTMzBPXs7ek=
X-Google-Smtp-Source: ABdhPJx04srL5Kqb+Afxp55H3f+2E1NfRi73cTc19jrKbgpZQZM7MrtQy1ibUdloVutzgPzTdIq0MA==
X-Received: by 2002:a17:907:207c:: with SMTP id qp28mr1204891ejb.311.1625163124916;
        Thu, 01 Jul 2021 11:12:04 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id j22sm185495eje.123.2021.07.01.11.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 11:12:03 -0700 (PDT)
Date:   Thu, 1 Jul 2021 20:14:22 +0200
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
Message-ID: <YN4F/nH/9tDuWDnQ@orome.fritz.box>
References: <20210423163234.3651547-1-thierry.reding@gmail.com>
 <20210423163234.3651547-2-thierry.reding@gmail.com>
 <20210520220306.GA1976116@robh.at.kernel.org>
 <YLEgXyLBF8PEFNw2@orome.fritz.box>
 <YL+gHN4YZ4vt1vPk@orome.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6YBegNniYlMh6yBT"
Content-Disposition: inline
In-Reply-To: <YL+gHN4YZ4vt1vPk@orome.fritz.box>
User-Agent: Mutt/2.1 (4b100969) (2021-06-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--6YBegNniYlMh6yBT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 08, 2021 at 06:51:40PM +0200, Thierry Reding wrote:
> On Fri, May 28, 2021 at 06:54:55PM +0200, Thierry Reding wrote:
> > On Thu, May 20, 2021 at 05:03:06PM -0500, Rob Herring wrote:
> > > On Fri, Apr 23, 2021 at 06:32:30PM +0200, Thierry Reding wrote:
> > > > From: Thierry Reding <treding@nvidia.com>
> > > >=20
> > > > Reserved memory region phandle references can be accompanied by a
> > > > specifier that provides additional information about how that speci=
fic
> > > > reference should be treated.
> > > >=20
> > > > One use-case is to mark a memory region as needing an identity mapp=
ing
> > > > in the system's IOMMU for the device that references the region. Th=
is is
> > > > needed for example when the bootloader has set up hardware (such as=
 a
> > > > display controller) to actively access a memory region (e.g. a boot
> > > > splash screen framebuffer) during boot. The operating system can us=
e the
> > > > identity mapping flag from the specifier to make sure an IOMMU iden=
tity
> > > > mapping is set up for the framebuffer before IOMMU translations are
> > > > enabled for the display controller.
> > > >=20
> > > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > > ---
> > > >  .../reserved-memory/reserved-memory.txt       | 21 +++++++++++++++=
++++
> > > >  include/dt-bindings/reserved-memory.h         |  8 +++++++
> > > >  2 files changed, 29 insertions(+)
> > > >  create mode 100644 include/dt-bindings/reserved-memory.h
> > >=20
> > > Sorry for being slow on this. I have 2 concerns.
> > >=20
> > > First, this creates an ABI issue. A DT with cells in 'memory-region'=
=20
> > > will not be understood by an existing OS. I'm less concerned about th=
is=20
> > > if we address that with a stable fix. (Though I'm pretty sure we've=
=20
> > > naively added #?-cells in the past ignoring this issue.)
> >=20
> > A while ago I had proposed adding memory-region*s* as an alternative
> > name for memory-region to make the naming more consistent with other
> > types of properties (think clocks, resets, gpios, ...). If we added
> > that, we could easily differentiate between the "legacy" cases where
> > no #memory-region-cells was allowed and the new cases where it was.
> >=20
> > > Second, it could be the bootloader setting up the reserved region. If=
 a=20
> > > node already has 'memory-region', then adding more regions is more=20
> > > complicated compared to adding new properties. And defining what each=
=20
> > > memory-region entry is or how many in schemas is impossible.
> >=20
> > It's true that updating the property gets a bit complicated, but it's
> > not exactly rocket science. We really just need to splice the array. I
> > have a working implemention for this in U-Boot.
> >=20
> > For what it's worth, we could run into the same issue with any new
> > property that we add. Even if we renamed this to iommu-memory-region,
> > it's still possible that a bootloader may have to update this property
> > if it already exists (it could be hard-coded in DT, or it could have
> > been added by some earlier bootloader or firmware).
> >=20
> > > Both could be addressed with a new property. Perhaps something like=
=20
> > > 'iommu-memory-region =3D <&phandle>;'. I think the 'iommu' prefix is=
=20
> > > appropriate given this is entirely because of the IOMMU being in the=
=20
> > > mix. I might feel differently if we had other uses for cells, but I=
=20
> > > don't really see it in this case.=20
> >=20
> > I'm afraid that down the road we'll end up with other cases and then we
> > might proliferate a number of *-memory-region properties with varying
> > prefixes.
> >=20
> > I am aware of one other case where we might need something like this: on
> > some Tegra SoCs we have audio processors that will access memory buffers
> > using a DMA engine. These processors are booted from early firmware
> > using firmware from system memory. In order to avoid trashing the
> > firmware, we need to reserve memory. We can do this using reserved
> > memory nodes. However, the audio DMA engine also uses the SMMU, so we
> > need to make sure that the firmware memory is marked as reserved within
> > the SMMU. This is similar to the identity mapping case, but not exactly
> > the same. Instead of creating a 1:1 mapping, we just want that IOVA
> > region to be reserved (i.e. IOMMU_RESV_RESERVED instead of
> > IOMMU_RESV_DIRECT{,_RELAXABLE}).
> >=20
> > That would also fall into the IOMMU domain, but we can't reuse the
> > iommu-memory-region property for that because then we don't have enough
> > information to decide which type of reservation we need.
> >=20
> > We could obviously make iommu-memory-region take a specifier, but we
> > could just as well use memory-regions in that case since we have
> > something more generic anyway.
> >=20
> > With the #memory-region-cells proposal, we can easily extend the cell in
> > the specifier with an additional MEMORY_REGION_IOMMU_RESERVE flag to
> > take that other use case into account. If we than also change to the new
> > memory-regions property name, we avoid the ABI issue (and we gain a bit
> > of consistency while at it).
>=20
> Ping? Rob, do you want me to add this second use-case to the patch
> series to make it more obvious that this isn't just a one-off thing? Or
> how do we proceed?

Rob, given that additional use-case, do you want me to run with this
proposal and send out an updated series?

Thierry

--6YBegNniYlMh6yBT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDeBfsACgkQ3SOs138+
s6FEoRAArgfUJ2pN2AQEZGJFT3iV5IkbrhYdC58xmVQA7m0oyqllaDYcVzehvr3K
/srNiOAoCsVqY0NX2oHNjS5osnC8j9spEG70LqEt3EuThasMFU4D2Z3Ron1IV6v3
j0ycepZfYlxeCl/gHgvFIevQA8sWabNx+qjuSJoAjqgFALMdv0wBrdCdG0oOsqCI
Z9a0B2TQG0JX+TSrlJNbM25zH/g1orMvWRo5H1cBDxCXSeRbbdJNZ/K+DY12kAVW
dKWogA+wwereYONfIzQsCS/HqfT7dSSiA0sqBpAO78NfbD26OGMqd3Ue+mFp55mM
dDca4qoEe8n9Je6Smu3YHMNcbkjgS5WZ2yklg8uDTkiQZBt70ZIFU5sgDsx9/I5d
jEl6s20aCI7N8Bnj2zALU8VbZyBEUdGjGpgz9m+4Z2MXuPIEW0zcv63OdLPfapD3
1D5DfGQrpkHzcjmCXf5usPTtHm6oi5iRb2xn9khuShYc9td2ZpxhSP7yugtbtbdO
Vq2mf5wJO+hJeHSkRZlwQAW+lQ6eduHUAzI8f85+388XBC++pdcAA2Ku4rwzTVf1
VSCL+6LBoTA+qVsGtFUIuXH+vJnO2cXz+WQf7mZ5j0a5dqaNNjHlQsWgkAvewt3M
4UpP+4zqqb8fAupzRTIuC+8oZQ+szDDS8r0RMYqePR0w/1uYjAw=
=/Iz1
-----END PGP SIGNATURE-----

--6YBegNniYlMh6yBT--
