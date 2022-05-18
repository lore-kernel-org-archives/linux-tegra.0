Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A2FC433FE
	for <linux-tegra@archiver.kernel.org>; Wed, 18 May 2022 15:29:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbiERP3a (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 18 May 2022 11:29:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239283AbiERP32 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 May 2022 11:29:28 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88C481BE972;
        Wed, 18 May 2022 08:29:26 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id h14so3229630wrc.6;
        Wed, 18 May 2022 08:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=L9LLbTJecM2+Gol/XKLTvu9gjYd8YO6104B2zHq2tR8=;
        b=ltUs138Bdx3d66Ugiw+/V53Zi29vH+2z11EU5nuF+tYbIPOm04PRN3WFguQYw4YjwQ
         Azn4YmzIS32VsEs7zLtmsxKfapNIm3f0o/Ga6GQtu8rl1NOsXzt41knSkK/jiY/NdYpB
         CTYUGFUssWTTxD2jSU0ag+CwgCXpvAJ4mnDsgL6RYRHk1ilsfYkTktS4WvibXK71Xl9N
         P/5pVAjE5k/d4VxFwAnZUokWb4fREaoNQ1qxbOE401peIDrqvDHVsXSlLFdxKCTYX9Sh
         WzofBGEuSGp1l8AMWhqRLm8EaFMYHgFFdXSuQRq98rYTEXDrdclIsyBq7lxw1LWSnGaE
         lpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=L9LLbTJecM2+Gol/XKLTvu9gjYd8YO6104B2zHq2tR8=;
        b=l6Dkbt/kjuCr6VRWVLKQJpf+ljmFMx3euv0A22OUiuHT9pI+ICFb+iF4bwLNOltMbK
         V72xVjulr6A4RFylrnUjA3rFmGpnrqfgTFFDG8DRj9jUtnL8zAmYX6DfNZe/6M0prLmN
         lQqaJvu911LUf1eMLtaZ21EVKshe+BIHq13Ai2AY7BBSc81Ol0onFZZfyLMw5JKUFIeh
         lbXxLcKtj1NjJqjZN/zFRQ9zHgHvY52Toc4IsRM6HRajB+Vjmrjy98j1MBQtLi2LKLYf
         eQyoNVelKXL4g1jzc9ksTonWuv1MqPxmCW+FMumWHNmGBCcRidhYAI91x9LpbFCo0YGD
         e5bQ==
X-Gm-Message-State: AOAM533t9P9MY8nLaKFc1HOZmpnViPiIctrRPh9/ZxQTHsa1I4gs7QPC
        gwc6lzrkzJaaMA7Ua6HozNM=
X-Google-Smtp-Source: ABdhPJyNBVv6hgk0mSbEMs8PC438YDcloF/c3bcW5X/NP/lgqjAY83XT59kEsZDMtpdWf3kBkE58lg==
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id b13-20020adff90d000000b0020cde324d35mr179613wrr.583.1652887764738;
        Wed, 18 May 2022 08:29:24 -0700 (PDT)
Received: from orome ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c1d1000b0039444973258sm6173377wms.0.2022.05.18.08.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 08:29:23 -0700 (PDT)
Date:   Wed, 18 May 2022 17:29:20 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Janne Grunau <j@jannau.net>
Cc:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sameer Pujar <spujar@nvidia.com>, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        asahi@lists.linux.dev
Subject: Re: [PATCH v5 0/5] iommu: Support mappings/reservations in
 reserved-memory regions
Message-ID: <YoUQ0HlhwGiFPUrz@orome>
References: <20220512190052.1152377-1-thierry.reding@gmail.com>
 <20220515103544.GC26732@jannau.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JWsdxCgDOF9zoQXr"
Content-Disposition: inline
In-Reply-To: <20220515103544.GC26732@jannau.net>
User-Agent: Mutt/2.2.4 (c3baa83e) (2022-04-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--JWsdxCgDOF9zoQXr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 15, 2022 at 12:35:44PM +0200, Janne Grunau wrote:
> Hej,
>=20
> I'm working on the display controller for Apple silicon SoCs and will=20
> add some comments with support for it in mind.
>=20
> added asahi@lists.linux.dev to CC for the Apple silicon related aspects
>=20
> On 2022-05-12 21:00:47 +0200, Thierry Reding wrote:
> >=20
> > this is another attempt at solving the problem of passing IOMMU
> > configuration via device tree. It has significantly evolved since the
> > last attempt, based on the discussion that followed. The discussion can
> > be found here:
> >=20
> >   https://lore.kernel.org/all/20210423163234.3651547-1-thierry.reding@g=
mail.com/
> >=20
> > Rather than using a memory-region specifier, this new version introduces
> > a new "iommu-addresses" property for the reserved-memory regions
> > themselves.
>=20
> If experimented with both proposed bindings for dcp and I think this=20
> binding is easer to understand and to work with.
>=20
> > These are used to describe either a static mapping or
> > reservation that should be created for a given device. If both "reg" and
> > "iommu-addresses" properties are given, a mapping will be created
> > (typically this would be an identity mapping)
>=20
> dcp on Apple silicon will not use identity mappings. The IOMMU supports=
=20
> identity mapping but the pre-configured mappings setup by Apple's system=
=20
> firmware will not work with identity mapping. It maps multiple regions=20
> which are incompatible with a linear identity mapping. In addition the=20
> embbeded aarch64 micro controllers used in the display subsystem appears=
=20
> to use a heap mapped at low IOVA space starting at 0.
>=20
> > whereas if only an "iommu-addresses" property is specified, a=20
> > reservation for the specified range will be installed.
> >=20
> > An example is included in the DT bindings, but here is an extract of
> > what I've used to test this:
> >=20
> > 	reserved-memory {
> > 		#address-cells =3D <2>;
> > 		#size-cells =3D <2>;
> > 		ranges;
> >=20
> > 		/*
> > 		 * Creates an identity mapping for the framebuffer that
> > 		 * the firmware has setup to scan out a bootsplash from.
> > 		 */
> > 		fb: framebuffer@92cb2000 {
> > 			reg =3D <0x0 0x92cb2000 0x0 0x00800000>;
> > 			iommu-addresses =3D <&dc0 0x0 0x92cb2000 0x0 0x00800000>;
> > 		};
>=20
> The binding supports mapping the same region to multiple devices. The=20
> code supports that and it will be used on Apple silicon. Not necessary=20
> to extend and complicate the example for I wanted to mention it=20
> explicitly.
>=20
> >=20
> > 		/*
> > 		 * Creates a reservation in the IOVA space to prevent
> > 		 * any buffers from being mapped to that region. Note
> > 		 * that on Tegra the range is actually quite different
> > 		 * from this, but it would conflict with the display
> > 		 * driver that I tested this against, so this is just
> > 		 * a dummy region for testing.
> > 		 */
> > 		adsp: reservation-adsp {
> > 			iommu-addresses =3D <&dc0 0x0 0x90000000 0x0 0x00010000>;
> > 		};
> > 	};
> >=20
> > 	host1x@50000000 {
> > 		dc@54200000 {
> > 			memory-region =3D <&fb>, <&adsp>;
> > 		};
> > 	};
> >=20
> > This is abbreviated a little to focus on the essentials. Note also that
> > the ADSP reservation is not actually used on this device and the driver
> > for this doesn't exist yet, but I wanted to include this variant for
> > testing, because we'll want to use these bindings for the reservation
> > use-case as well at some point.
> >=20
> > Adding Alyssa and Janne who have in the past tried to make these
> > bindings work on Apple M1. Also adding Sameer from the Tegra audio team
> > to look at the ADSP reservation and double-check that this is suitable
> > for our needs.
>=20
> The binding itself is sufficient for the needs of the display subsystem=
=20
> on Apple silicon. The device tree parsing code for reserved regions is=20
> of limited use in it's current form. We will have either to extend or=20
> duplicate it to retrieve the non-identity mappings. That's our problem=20
> to solve.

I had looked at it a bit to see if I could easily implement that, but
the direct mapping support in the IOMMU subsystem currently only
supports either reservations or identity mappings, so arbitrary mappings
would either have to be added to that code, or it would have to take a
different code path that basically goes through the same steps, except
that it uses different physical and I/O virtual addresses.

The easiest, I think, would be for struct iommu_resv_region to be
extended with a pair of start/length fields for the I/O virtual address
and then the rest of the code should mostly work. This shouldn't even be
very invasive, maybe just adding a version of iommu_alloc_resv_region()
that takes the I/O virtual addresses as additional parameters.

Come to think of it, the current code could probably be improved a bit
by checking if the addresses in the reg and iommu-addresses properties
match. Currently the code just ignores the reserved memory region's
"reg" property, so one could technically set up a mapping that points to
physical memory that the device doesn't "own".

Thierry

--JWsdxCgDOF9zoQXr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmKFEM4ACgkQ3SOs138+
s6FH5hAAltE4HtuVrS9ClCWOHTJmFHhrFtlbv9trGdfDlv3UdPT41oShZt9bt0gh
0daHxlzSmUsMU0YTDmUx3CQQK7ec9z+DktHV9n9eU6HyehBWTjttJzJf1L4CaUTc
MjNCm1R1O8ytiH3H5mcPIVpiw17X3cKYeuwS0TcUgEmEknPVAHViHFvW01toaZSN
0L6PBANJsZjJ2sGFxNQs+Hj6xcwxdlq8Ub+AKxz0zcV/Z7IHclr/+yNNzUbQC67R
gZMkGkWm665ucqA3sFXuDM+gaR7bfCsDYDpP/M62yM3MwKL/CR8ALk6t5/dFIsRj
47hhFH0znXng1+KmSISQ1UWA2LUpJz4IwR+JCXob2z7cJOjzC8RY/8tSGfNsJRs6
cgaBoa+i1ApCnkX6PvnDWcgGB/tG+GDQgI0O955XOGaskNjy5jNcJWk04++gAQbz
ZrSMIxi2rBTQZLaxzc5s+MKInI2o0VTWQqkTw5ClW1uXNNqBpqV+D62uSc70GW1H
jOrbZ3RkhmVRvXr5iWKMnne7XBGky7J4gc4UpA/7iUdi0qYRd4ju+8KpsRfeWhq6
nP6vLONYS5IXgGxR3zvEhWqrtjQTWUrW8EUCbwylo2Lm0pmlCDAadoTWMHq/wry6
2c/MYkpNS8jJNtJoLkIhr+rIloUpci6apBVn3HM+2vicQYVYnEc=
=2ao1
-----END PGP SIGNATURE-----

--JWsdxCgDOF9zoQXr--
