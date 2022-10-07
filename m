Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EC1C433F5
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Oct 2022 12:52:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiJGMv7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Oct 2022 08:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbiJGMv6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Oct 2022 08:51:58 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E621FBCBA6;
        Fri,  7 Oct 2022 05:51:57 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id z97so6894328ede.8;
        Fri, 07 Oct 2022 05:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVR4A7rTDXaDZT2ap3V+IDUaXiwWgE+SqvzF3iigsYM=;
        b=Dzw3kT/irBpT48ntV/1nFrgfbswZ7E69GOVn7keVyflPBLViOYJ9hzLNiOuekVDCQI
         13mi33qu0hnQxkbA/pyteGQ9o2b6QaKUo78KHCl/r/5pXctYZhMWbAu/e360d2aDBHlK
         YAiE6IZVBQCzNFD/xgRxuHhFuD1u2rIx+nTCJ0eAUKjXZl8jpwrKYwXVXlHmaywfUMYd
         XxJO9nuSOLsr+7NsQmAXGxesLNdYREunmNZtmzaQsyWZdOVzOpUY9EM77oKc3O6KfeCa
         kxCINd0LDTdsK4bDekAuqdtSrhNHHuBUMrRHCTblrhEHbZAExgCLQWMs3YGfVTOmklO8
         O5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UVR4A7rTDXaDZT2ap3V+IDUaXiwWgE+SqvzF3iigsYM=;
        b=XgAZzbQsb6Tzdwp2CD6aZ4qAcJDsVVllKf+Tp18y+/kSgZEZB05dZiwFkhqJPhBOlN
         ELVnDgAEUJkeoS0LxtRjRxCVlx/jzZl7T1ZrnoE9A/seDW1MAg6a+Z5rIbJ4PW6qKicR
         Wnj6PPLeTcpAxGxdcf3elJSeVh+xYk/s/HNWLL52UBDPduB2EYH7AGIBiwwPuoOe7OrL
         5Ys2/C/xTLjwb0XVy6y6lQaKCMNMZn0Po2rJUq5NTWSAdvWnEJPwG2SJ6QJ7Tu4GtfHW
         jglG8buO+B+g/cDbXh32ZYoOeWdqCBxBeq+ZcOt/j/LT5P39G8GmCoinrk6y2LR3kYuh
         6MFg==
X-Gm-Message-State: ACrzQf1npuLkchal9Ii8YX5LSN1lvXEBXcAGWe6VzS+WfHgpXe1Rzkjn
        IK6N8FLJZH7CcXm4vpuDRy4=
X-Google-Smtp-Source: AMsMyM72M6aPDsfwBObYtVFL0p8t0YHAzYNzlKS+HyicbULufboz6R4lgnogFL6VLCkU+wcFIWnz5A==
X-Received: by 2002:a05:6402:35d3:b0:459:ddca:4db7 with SMTP id z19-20020a05640235d300b00459ddca4db7mr4377016edc.393.1665147116313;
        Fri, 07 Oct 2022 05:51:56 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ti5-20020a170907c20500b0073d9630cbafsm1171837ejc.126.2022.10.07.05.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 05:51:55 -0700 (PDT)
Date:   Fri, 7 Oct 2022 14:51:53 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH v9 0/5] iommu: Support mappings/reservations in
 reserved-memory regions
Message-ID: <Y0Ag6QkQ+DPOElhm@orome>
References: <20220923123557.866972-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JGYHqtEsfJ0xq16p"
Content-Disposition: inline
In-Reply-To: <20220923123557.866972-1-thierry.reding@gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--JGYHqtEsfJ0xq16p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 23, 2022 at 02:35:52PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Hi,
>=20
> This version has several fixes over the previous v8, which can be found
> here:
>=20
>   https://lore.kernel.org/all/20220905170833.396892-1-thierry.reding@gmai=
l.com/
>=20
> An example is included in the DT bindings, but here is an extract of
> what I've used to test this:
>=20
>         reserved-memory {
>                 #address-cells =3D <2>;
>                 #size-cells =3D <2>;
>                 ranges;
>=20
>                 /*
>                  * Creates an identity mapping for the framebuffer that
>                  * the firmware has setup to scan out a bootsplash from.
>                  */
>                 fb: framebuffer@92cb2000 {
>                         reg =3D <0x0 0x92cb2000 0x0 0x00800000>;
>                         iommu-addresses =3D <&dc0 0x0 0x92cb2000 0x0 0x00=
800000>;
>                 };
>=20
>                 /*
>                  * Creates a reservation in the IOVA space to prevent
>                  * any buffers from being mapped to that region. Note
>                  * that on Tegra the range is actually quite different
>                  * from this, but it would conflict with the display
>                  * driver that I tested this against, so this is just
>                  * a dummy region for testing.
>                  */
>                 adsp: reservation-adsp {
>                         iommu-addresses =3D <&dc0 0x0 0x90000000 0x0 0x00=
010000>;
>                 };
>         };
>=20
>         host1x@50000000 {
>                 dc@54200000 {
>                         memory-region =3D <&fb>, <&adsp>;
>                 };
>         };
>=20
> This is abbreviated a little to focus on the essentials. Note also that
> the ADSP reservation is not actually used on this device and the driver
> for this doesn't exist yet, but I wanted to include this variant for
> testing, because we'll want to use these bindings for the reservation
> use-case as well at some point.
>=20
> I've also been able to make use of this binding and the IOMMU code in
> conjunction with the simple-framebuffer driver to hand over a display
> configuration set up by UEFI to the Linux kernel.
>=20
> Janne has confirmed[0] this to be suitable for indirect mappings as
> well, though these patches don't implement that feature yet. Potential
> extensions to this have been discussed but are not yet included at this
> time to not further complicate things.
>=20
> Thierry
>=20
> [0]: https://lore.kernel.org/all/20220909144504.GA4024@jannau.net/
>=20
> Navneet Kumar (1):
>   iommu/tegra-smmu: Support managed domains
>=20
> Thierry Reding (4):
>   dt-bindings: reserved-memory: Document iommu-addresses
>   iommu: Implement of_iommu_get_resv_regions()
>   iommu: dma: Use of_iommu_get_resv_regions()
>   iommu/tegra-smmu: Add support for reserved regions
>=20
>  .../reserved-memory/reserved-memory.yaml      |  70 ++++++++++++
>  drivers/iommu/dma-iommu.c                     |   3 +
>  drivers/iommu/of_iommu.c                      | 104 ++++++++++++++++++
>  drivers/iommu/tegra-smmu.c                    |  86 ++++++++++++---
>  include/linux/of_iommu.h                      |   8 ++
>  5 files changed, 254 insertions(+), 17 deletions(-)

Joerg, if there are no further concerns on this, can you pick this up
once v6.1-rc1 is released?

Thanks,
Thierry

--JGYHqtEsfJ0xq16p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNAIOkACgkQ3SOs138+
s6HMOw/9EzfFTbPIHJ55dk8c2dHNzdSSSd0VIS6K9XFP1CTDRcmSNrM32GN1jL5X
Eo/cDhXNNj8hBHOK8ejI0QP2mSRaEGOEQ4AN+a/I4FKQ6UQqRR6S9h14eyCkWoIm
s0IbugJCLcKIJ6pZ+TrzdbqicAZHTUih0r5BWfaMGWi6Dz4GC0YD+xflDKm3Ysp2
DOpEzGHOYfOTJ3DIilCWiMMHqSXFeuexMj9WYoSoH192BClik3JEHUJEk9VpI+fo
YvFLmbsutf4YapyUcyV2jJ8rA9gFmccCmtSg5xziqnoHnmRqlnSECDimDVMlfr2s
HwbS0mLUe9nYxlpRWk5e/i63lEJx/5/EhXWeXp9zP7mIXnWC4/BAfpSXq6A8Dv3v
vmTEuzadcWkrAPcz6o4aeVb7S/34IAkTEBr7jzV37Mm2i20E065FlXuOeUpwv+1j
ePyqbDfAOvnFnnNpdZHlcIEJoXL5+pUaPcuNx+2PlPnS8ychYfoZxkStRueEqAfs
SfrtV4T02Pq+ASUya8i6Qd80q06uNwzA0gtY4+R+Vu/K27b5TH3Eze1Sr9jhiJM1
5t37qbbzC3chPFc9uPLr6aDBhEC5uZg1xLFMOVDEiKSsMJiuRY0tRyebh8++RB8Y
yT4/+IAy8b0SUKyxpNIomSfBpIVya2B7cGuL1hkICSM+wo/8Ksk=
=OhtH
-----END PGP SIGNATURE-----

--JGYHqtEsfJ0xq16p--
