Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 110ADC433FE
	for <linux-tegra@archiver.kernel.org>; Wed, 19 Oct 2022 18:03:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbiJSSDl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 19 Oct 2022 14:03:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbiJSSDk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 Oct 2022 14:03:40 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F5001C73FE;
        Wed, 19 Oct 2022 11:03:37 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id bu30so30429815wrb.8;
        Wed, 19 Oct 2022 11:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xq2G8P0XcWZlec1xAQsXMClpeEpgdBC4SuRpNQneoJg=;
        b=EG2SCsqoLP4xpGn9MS0EY9rWkZbT2LPZqxFag9LlDbjhqjecHsxIaOT0p3orES75bs
         Dy6mdD+jlzqfwH6JLwIpxe7TEkAqyj+cYJh/0CsktmEG+vpi/xhc8pturGxyKRDLVfq+
         3Mv9ZaDxIoFGvYn34QKzjfIUNJD8xyNVZBSjwnFJBv7h6+SoTauiJ70RffaSPuXdXcLV
         YlIx2p9FcJ1XTu2IPt4pbQng5GLwHRBEvZdHL4Ho5/VmR7leHwU/cNGVII58p9rjjmHj
         7nBQywCpdyNjCM2yAm/6sUU2TIbGbqLB/EKPP0LRUFbAVXTbk3fLWhOvw1Kk44+BR6iY
         U/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xq2G8P0XcWZlec1xAQsXMClpeEpgdBC4SuRpNQneoJg=;
        b=1Wzd2DgvTGiqwxxp5iCufkvTjhffV+7QX0/lt0q3vqqRneUneWqlQn3pBeYy7lX7gK
         UgRvhQDi6crr27Qm7l2VZaKdzrsekPyHyfC/9pjQ8KDVQu4lvF7ldCDXnEn6Ld2HvJCp
         hTcDxD2lJtR0WKh+uz3d/ArxEMKliipJnYtywXTxdW7xLIvYE7tQ6vQ8fIt0aw8OAuZK
         5vNnTVtTHwiKbgUv0OFLNTrXYI6ZjkM2/a2aT1oOtEKZnngBVbFONT7tgC5Dx62pu/NG
         gllTzJqRgaJIPqAvUedegbWp4e04Je/FF7lLzjNYSTS06IA93Tj+BJXKQvS91p1UzO+o
         oUbA==
X-Gm-Message-State: ACrzQf0ICp+BKiQMM1KxOGltKLttc6oujf3AdPioWUBWto3q7WrjxMTB
        1hYRsNtsNdB3pkXc/vxwi0k=
X-Google-Smtp-Source: AMsMyM6FC+ajC/WBdUmh/DcvJGhoTjwLSuVIdQPQj9iOc5jM2kDPQkvbHek9GM5B8LAFSeyae9m69g==
X-Received: by 2002:adf:f501:0:b0:22c:cbea:240a with SMTP id q1-20020adff501000000b0022ccbea240amr6238752wro.78.1666202615315;
        Wed, 19 Oct 2022 11:03:35 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id t18-20020a5d6a52000000b0022af865810esm14096229wrw.75.2022.10.19.11.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 11:03:33 -0700 (PDT)
Date:   Wed, 19 Oct 2022 20:03:31 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 2/5] iommu: Implement of_iommu_get_resv_regions()
Message-ID: <Y1A78xWWJTCfsdGL@orome>
References: <20220923123557.866972-1-thierry.reding@gmail.com>
 <20220923123557.866972-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gvCbHzF82XlnTgiW"
Content-Disposition: inline
In-Reply-To: <20220923123557.866972-3-thierry.reding@gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--gvCbHzF82XlnTgiW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 23, 2022 at 02:35:54PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> This is an implementation that IOMMU drivers can use to obtain reserved
> memory regions from a device tree node. It uses the reserved-memory DT
> bindings to find the regions associated with a given device. If these
> regions are marked accordingly, identity mappings will be created for
> them in the IOMMU domain that the devices will be attached to.
>=20
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v9:
> - address review comments by Robin Murphy:
>   - warn about non-direct mappings since they are not supported yet
>   - cleanup code to require less indentation
>   - narrow scope of variables
>=20
> Changes in v8:
> - cleanup set-but-unused variables
>=20
> Changes in v6:
> - remove reference to now unused dt-bindings/reserved-memory.h include
>=20
> Changes in v5:
> - update for new "iommu-addresses" device tree bindings
>=20
> Changes in v4:
> - fix build failure on !CONFIG_OF_ADDRESS
>=20
> Changes in v3:
> - change "active" property to identity mapping flag that is part of the
>   memory region specifier (as defined by #memory-region-cells) to allow
>   per-reference flags to be used
>=20
> Changes in v2:
> - use "active" property to determine whether direct mappings are needed
>=20
>  drivers/iommu/of_iommu.c | 104 +++++++++++++++++++++++++++++++++++++++
>  include/linux/of_iommu.h |   8 +++
>  2 files changed, 112 insertions(+)
>=20
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index 5696314ae69e..0bf2b08bca0a 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -11,6 +11,7 @@
>  #include <linux/module.h>
>  #include <linux/msi.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/of_iommu.h>
>  #include <linux/of_pci.h>
>  #include <linux/pci.h>
> @@ -172,3 +173,106 @@ const struct iommu_ops *of_iommu_configure(struct d=
evice *dev,
> =20
>  	return ops;
>  }
> +
> +static inline bool check_direct_mapping(struct device *dev, struct resou=
rce *phys,
> +					phys_addr_t start, phys_addr_t end)
> +{
> +	if (start !=3D phys->start || end !=3D phys->end) {
> +		dev_warn(dev, "treating non-direct mapping [%pr] -> [%pap-%pap] as res=
ervation\n",
> +			 &phys, &start, &end);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +/**
> + * of_iommu_get_resv_regions - reserved region driver helper for device =
tree
> + * @dev: device for which to get reserved regions
> + * @list: reserved region list
> + *
> + * IOMMU drivers can use this to implement their .get_resv_regions() cal=
lback
> + * for memory regions attached to a device tree node. See the reserved-m=
emory
> + * device tree bindings on how to use these:
> + *
> + *   Documentation/devicetree/bindings/reserved-memory/reserved-memory.t=
xt
> + */
> +void of_iommu_get_resv_regions(struct device *dev, struct list_head *lis=
t)
> +{
> +#if IS_ENABLED(CONFIG_OF_ADDRESS)
> +	struct of_phandle_iterator it;
> +	int err;
> +
> +	of_for_each_phandle(&it, err, dev->of_node, "memory-region", NULL, 0) {
> +		const __be32 *maps, *end;
> +		struct resource res;
> +		int size;
> +
> +		memset(&res, 0, sizeof(res));
> +
> +		/*
> +		 * The "reg" property is optional and can be omitted by reserved-memor=
y regions
> +		 * that represent reservations in the IOVA space, which are regions th=
at should
> +		 * not be mapped.
> +		 */
> +		if (of_find_property(it.node, "reg", NULL)) {
> +			err =3D of_address_to_resource(it.node, 0, &res);
> +			if (err < 0) {
> +				dev_err(dev, "failed to parse memory region %pOF: %d\n",
> +					it.node, err);
> +				continue;
> +			}
> +		}
> +
> +		maps =3D of_get_property(it.node, "iommu-addresses", &size);
> +		if (!maps)
> +			continue;
> +
> +		end =3D maps + size / sizeof(__be32);
> +
> +		while (maps < end) {
> +			struct device_node *np;
> +			u32 phandle;
> +			int na, ns;
> +
> +			phandle =3D be32_to_cpup(maps++);
> +			np =3D of_find_node_by_phandle(phandle);
> +			na =3D of_n_addr_cells(np);
> +			ns =3D of_n_size_cells(np);
> +
> +			if (np =3D=3D dev->of_node) {
> +				int prot =3D IOMMU_READ | IOMMU_WRITE;
> +				struct iommu_resv_region *region;
> +				enum iommu_resv_type type;
> +				phys_addr_t start;
> +				size_t length;
> +
> +				start =3D of_translate_dma_address(np, maps);

I just came across an issue when extending the testing from simple-
framebuffer to the full display engine, with the main difference being
that the fill display engine is hooked up both to the IOMMU and to the
memory controller via the interconnects property ("dma-mem").

The latter seems to throw off the of_translate_dma_address() because we
have a top-level bus@0 node that sets #address-cells =3D <1> and #size-
cells =3D <1>, which is sufficient to represent the "reg" entries for the
devices. However, for the reserved-memory node needs #address-cells =3D
<2> and #size-cells =3D <2> to make sure we can describe memory regions
above the 4 GiB boundary (and potentially larger than 4 GiB, too).

What happens now is that of_translate_dma_address() will find the DMA
parent for the display engine, which is the memory controller, which
also has #address-cells =3D <2> and #size-cells =3D <2> for the same reason
as the reserved-memory node. In other words, what this tries to model is
that for DMA accesses, we span more than the 4 GiB range that is
sufficient to address registers for IP blocks.

However, of_translate_dma_address() then ends up getting #address-cells
and #size-cells from the *parent* of the DMA parent. And then everything
falls apart during translation.

Any idea if I'm doing something wrong? Or is the code wrong and it's not
actually using the right cell counts? Should it be using the cell counts
=66rom the DMA parent rather than its parent bus?

Thierry

--gvCbHzF82XlnTgiW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNQO/EACgkQ3SOs138+
s6GiVw//Rt0WZudr7yKNPo4DHkqkQqPgm679wTYK2vd8F6vk9+NmIe2SR+9L54s2
G9YYbsEusjC+8mxsozgr1ze2gJhwsDv0kMgIgS7HseZYDUmorPUA38q6nDsMyYJl
m9UG7f2z7lBQ/u1dLrZgToz/ym+U2rAZiZTPJ+G5tPvdhSKCBMK5KlatFDlcNM09
Lr2EXutWTX9LkwMUKlvPITYNA5S0i/7kHEk7/rTWKj70PbSFuhPNW5BvNUs9aXki
jDQK6/CBnXXLj2Dp14B6HYrlwZiYu0E63itYPyZMx5mfO9i1pxyVHe/s+VS7vtMt
q0RMKPdTfWHCCopYhMI72M4Ri2PJtgB7g2zqkEpXytOn1jJy4c2P0cu1Y+T7nGpE
plOwpeWDb5CrOPDYiGGPRRb6lE/zRO5Mfwefp7TnJ81Eet+LI2kVy4FeUe5Oross
o4A7xBoAZKSkaWyhon0oIB7IqetTzDMeQEanKTbdK6kPusxO3VPOUyarVkAx3s8J
5KWRlOUEmu19ASRjYF4nMKK8PYA+0uqwYXAaDgXIFTcEPfzrylQNTgfsjZz1RTEJ
L1MmObgjOn+CReAbVbLooI4cp+jhDYV66poT298ifi9oHuTOTf6/9ULbfaUnuGmr
zWm8ePp4oWnHEA5nOczB7tiRVQlIP2O4vFaY6hrnhF5etUhbzfE=
=Xlzl
-----END PGP SIGNATURE-----

--gvCbHzF82XlnTgiW--
