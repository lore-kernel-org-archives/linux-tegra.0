Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24853C433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 20 Oct 2022 14:34:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbiJTOeZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 20 Oct 2022 10:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbiJTOeX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 20 Oct 2022 10:34:23 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B1C2102D;
        Thu, 20 Oct 2022 07:34:21 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id sc25so47832785ejc.12;
        Thu, 20 Oct 2022 07:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dZpl7PAKnUHG/bo7IiH7C/vg2bw1JjzUYKFeB9b92M=;
        b=Aep/KhxbdLJAmRUS4CIyUdTz/GhaPghFBF/BevU6OQZJyev4OtgYZiubXXEb/LJV4m
         eEdtJK3B9s5VnrBBlPHHrkNikc/ZCPx4oe1m6s1rTvXOFIKR/ZyQjzOn/P16BpdWqJak
         idC4v4dKtzPj9WH42McDhPIOOr8CESHjqis3h35eWskf+Fp02KbtZ8uTZF7gmxmsAP9h
         kdw/gh+SUM0DktdP9AvaIwUCjcjo1CfKMAMqYs4AOgANVSy4IBvc0bN3dcJkTDDOoqRF
         U84n1iKj0ykZyAH1FmTXl3UOxB0rLWFi5uzeBqO/75ZNk59mhtVshn0qmjUBd+Ozsntg
         Uglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8dZpl7PAKnUHG/bo7IiH7C/vg2bw1JjzUYKFeB9b92M=;
        b=jr6V+nZnQc0JoNV5fLosAxVjh4zGvEAcE3Vh2VIY0LltB/rsRkK+4QiwAXvP8C22sC
         PopU2yn28KrDz1hJfg7vaqSqAxCNQHg8fKVVh3vpzoVFYVtLpRmHgo+BEJfCi4tZZT7v
         KzhzE/DJTvcx/akgjuL2+gDq1Z8wRPofnXX7EMdk3zot0VqxV+9tfvFVnIBC7gzX4oyi
         91q0eYtpO5/y82IxaoEj8QkuXKZaa1ZPtmyDGkVo3Yrrw1eRQGZVpM/YXgigIzl3kRgn
         TDfs6v5O4dCB6bWgt8I+4VvT0dvmDOQjYX9XdNv6ijBxH46U8q1NymL3O+MZcN2k1QCn
         eqhQ==
X-Gm-Message-State: ACrzQf3lzl5hTf6dK6q1+Lc5KhBwP+hiZEW5zODXpCNP40dfa/Owj/K2
        ttr282STrTmOXLhm8xi+yKdfy4dsosI=
X-Google-Smtp-Source: AMsMyM6JGkn3KoS/CA7gZW3htSpXsnS9e2iqYS3fUSSbYdKdIKBdbxQ/6lcFMrCaEpkoRsONWT7BMw==
X-Received: by 2002:a17:907:a48:b0:77c:51b0:5aeb with SMTP id be8-20020a1709070a4800b0077c51b05aebmr11517724ejc.61.1666276459223;
        Thu, 20 Oct 2022 07:34:19 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 21-20020a170906329500b00730b3bdd8d7sm10442755ejw.179.2022.10.20.07.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 07:34:18 -0700 (PDT)
Date:   Thu, 20 Oct 2022 16:34:16 +0200
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
Message-ID: <Y1FcaNgVXYsfm77f@orome>
References: <20220923123557.866972-1-thierry.reding@gmail.com>
 <20220923123557.866972-3-thierry.reding@gmail.com>
 <Y1A78xWWJTCfsdGL@orome>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="C8KFzC3JLrgNSjam"
Content-Disposition: inline
In-Reply-To: <Y1A78xWWJTCfsdGL@orome>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--C8KFzC3JLrgNSjam
Content-Type: multipart/mixed; boundary="dCBbHJqO6VA9aoz5"
Content-Disposition: inline


--dCBbHJqO6VA9aoz5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2022 at 08:03:31PM +0200, Thierry Reding wrote:
> On Fri, Sep 23, 2022 at 02:35:54PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > This is an implementation that IOMMU drivers can use to obtain reserved
> > memory regions from a device tree node. It uses the reserved-memory DT
> > bindings to find the regions associated with a given device. If these
> > regions are marked accordingly, identity mappings will be created for
> > them in the IOMMU domain that the devices will be attached to.
> >=20
> > Cc: Frank Rowand <frowand.list@gmail.com>
> > Cc: devicetree@vger.kernel.org
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v9:
> > - address review comments by Robin Murphy:
> >   - warn about non-direct mappings since they are not supported yet
> >   - cleanup code to require less indentation
> >   - narrow scope of variables
> >=20
> > Changes in v8:
> > - cleanup set-but-unused variables
> >=20
> > Changes in v6:
> > - remove reference to now unused dt-bindings/reserved-memory.h include
> >=20
> > Changes in v5:
> > - update for new "iommu-addresses" device tree bindings
> >=20
> > Changes in v4:
> > - fix build failure on !CONFIG_OF_ADDRESS
> >=20
> > Changes in v3:
> > - change "active" property to identity mapping flag that is part of the
> >   memory region specifier (as defined by #memory-region-cells) to allow
> >   per-reference flags to be used
> >=20
> > Changes in v2:
> > - use "active" property to determine whether direct mappings are needed
> >=20
> >  drivers/iommu/of_iommu.c | 104 +++++++++++++++++++++++++++++++++++++++
> >  include/linux/of_iommu.h |   8 +++
> >  2 files changed, 112 insertions(+)
> >=20
> > diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> > index 5696314ae69e..0bf2b08bca0a 100644
> > --- a/drivers/iommu/of_iommu.c
> > +++ b/drivers/iommu/of_iommu.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/module.h>
> >  #include <linux/msi.h>
> >  #include <linux/of.h>
> > +#include <linux/of_address.h>
> >  #include <linux/of_iommu.h>
> >  #include <linux/of_pci.h>
> >  #include <linux/pci.h>
> > @@ -172,3 +173,106 @@ const struct iommu_ops *of_iommu_configure(struct=
 device *dev,
> > =20
> >  	return ops;
> >  }
> > +
> > +static inline bool check_direct_mapping(struct device *dev, struct res=
ource *phys,
> > +					phys_addr_t start, phys_addr_t end)
> > +{
> > +	if (start !=3D phys->start || end !=3D phys->end) {
> > +		dev_warn(dev, "treating non-direct mapping [%pr] -> [%pap-%pap] as r=
eservation\n",
> > +			 &phys, &start, &end);
> > +		return false;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> > +/**
> > + * of_iommu_get_resv_regions - reserved region driver helper for devic=
e tree
> > + * @dev: device for which to get reserved regions
> > + * @list: reserved region list
> > + *
> > + * IOMMU drivers can use this to implement their .get_resv_regions() c=
allback
> > + * for memory regions attached to a device tree node. See the reserved=
-memory
> > + * device tree bindings on how to use these:
> > + *
> > + *   Documentation/devicetree/bindings/reserved-memory/reserved-memory=
=2Etxt
> > + */
> > +void of_iommu_get_resv_regions(struct device *dev, struct list_head *l=
ist)
> > +{
> > +#if IS_ENABLED(CONFIG_OF_ADDRESS)
> > +	struct of_phandle_iterator it;
> > +	int err;
> > +
> > +	of_for_each_phandle(&it, err, dev->of_node, "memory-region", NULL, 0)=
 {
> > +		const __be32 *maps, *end;
> > +		struct resource res;
> > +		int size;
> > +
> > +		memset(&res, 0, sizeof(res));
> > +
> > +		/*
> > +		 * The "reg" property is optional and can be omitted by reserved-mem=
ory regions
> > +		 * that represent reservations in the IOVA space, which are regions =
that should
> > +		 * not be mapped.
> > +		 */
> > +		if (of_find_property(it.node, "reg", NULL)) {
> > +			err =3D of_address_to_resource(it.node, 0, &res);
> > +			if (err < 0) {
> > +				dev_err(dev, "failed to parse memory region %pOF: %d\n",
> > +					it.node, err);
> > +				continue;
> > +			}
> > +		}
> > +
> > +		maps =3D of_get_property(it.node, "iommu-addresses", &size);
> > +		if (!maps)
> > +			continue;
> > +
> > +		end =3D maps + size / sizeof(__be32);
> > +
> > +		while (maps < end) {
> > +			struct device_node *np;
> > +			u32 phandle;
> > +			int na, ns;
> > +
> > +			phandle =3D be32_to_cpup(maps++);
> > +			np =3D of_find_node_by_phandle(phandle);
> > +			na =3D of_n_addr_cells(np);
> > +			ns =3D of_n_size_cells(np);
> > +
> > +			if (np =3D=3D dev->of_node) {
> > +				int prot =3D IOMMU_READ | IOMMU_WRITE;
> > +				struct iommu_resv_region *region;
> > +				enum iommu_resv_type type;
> > +				phys_addr_t start;
> > +				size_t length;
> > +
> > +				start =3D of_translate_dma_address(np, maps);
>=20
> I just came across an issue when extending the testing from simple-
> framebuffer to the full display engine, with the main difference being
> that the fill display engine is hooked up both to the IOMMU and to the
> memory controller via the interconnects property ("dma-mem").
>=20
> The latter seems to throw off the of_translate_dma_address() because we
> have a top-level bus@0 node that sets #address-cells =3D <1> and #size-
> cells =3D <1>, which is sufficient to represent the "reg" entries for the
> devices. However, for the reserved-memory node needs #address-cells =3D
> <2> and #size-cells =3D <2> to make sure we can describe memory regions
> above the 4 GiB boundary (and potentially larger than 4 GiB, too).
>=20
> What happens now is that of_translate_dma_address() will find the DMA
> parent for the display engine, which is the memory controller, which
> also has #address-cells =3D <2> and #size-cells =3D <2> for the same reas=
on
> as the reserved-memory node. In other words, what this tries to model is
> that for DMA accesses, we span more than the 4 GiB range that is
> sufficient to address registers for IP blocks.
>=20
> However, of_translate_dma_address() then ends up getting #address-cells
> and #size-cells from the *parent* of the DMA parent. And then everything
> falls apart during translation.
>=20
> Any idea if I'm doing something wrong? Or is the code wrong and it's not
> actually using the right cell counts? Should it be using the cell counts
> from the DMA parent rather than its parent bus?

I came up with the attached patch. This works for my case, but will
abort the DMA parent traversal early on some devices. I'm not sure how
much this would matter in practice.

A safer way would be to create a new variant of __of_get_dma_parent()
that doesn't have the of_get_parent() fallback. That's assuming that we
agree on the concept of having potentially different cell counts, and
effectively DMA busses that are separate from the traditional control
busses in DT.

Do we also need separate DMA cell counts so that one node can be a DMA
bus and a control bus at the same time? Or is this overcomplicating
things and a simpler approach would be to propagate the cell counts all
the way to the top level? I think this all might work with the existing
code if I make bus@0's cell count 2 & 2 for Tegra SoC DTSI files. It's a
lot of churn and seems more like a workaround rather than a correct
model of the busses.

Thierry

--dCBbHJqO6VA9aoz5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline;
	filename="0001-of-Stop-DMA-translation-at-last-DMA-parent.patch"
Content-Transfer-Encoding: quoted-printable

=46rom 7f63e7c86fa43f6c7d9254323606daeeb442cf48 Mon Sep 17 00:00:00 2001
=46rom: Thierry Reding <treding@nvidia.com>
Date: Thu, 20 Oct 2022 15:21:10 +0200
Subject: [PATCH] of: Stop DMA translation at last DMA parent

DMA parent devices can define separate DMA busses via the "dma-ranges"
and "#address-cells" and "#size-cells" properties. If the DMA bus has
different cell counts than its parent, this can cause the translation
of DMA address to fails (e.g. truncation from 2 to 1 address cells).

Avoid this by stopping to search for DMA parents when a parent without
a "dma-ranges" property is encountered. Also, since it is the DMA parent
that defines the DMA bus, use the bus' cell counts instead of its parent
cell counts.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/of/address.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 14f137a21b0c..e2f45bdbc41a 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -475,6 +475,7 @@ static u64 __of_translate_address(struct device_node *d=
ev,
 				  const __be32 *in_addr, const char *rprop,
 				  struct device_node **host)
 {
+	bool dma =3D rprop && !strcmp(rprop, "dma-ranges");
 	struct device_node *parent =3D NULL;
 	struct of_bus *bus, *pbus;
 	__be32 addr[OF_MAX_ADDR_CELLS];
@@ -494,7 +495,12 @@ static u64 __of_translate_address(struct device_node *=
dev,
 	bus =3D of_match_bus(parent);
=20
 	/* Count address cells & copy address locally */
-	bus->count_cells(dev, &na, &ns);
+	if (dma) {
+		na =3D of_bus_n_addr_cells(parent);
+		ns =3D of_bus_n_size_cells(parent);
+	} else {
+		bus->count_cells(dev, &na, &ns);
+	}
 	if (!OF_CHECK_COUNTS(na, ns)) {
 		pr_debug("Bad cell count for %pOF\n", dev);
 		goto bail;
@@ -515,7 +521,7 @@ static u64 __of_translate_address(struct device_node *d=
ev,
 		parent =3D get_parent(dev);
=20
 		/* If root, we have finished */
-		if (parent =3D=3D NULL) {
+		if (parent =3D=3D NULL || (dma && !of_get_property(parent, "dma-ranges",=
 NULL))) {
 			pr_debug("reached root node\n");
 			result =3D of_read_number(addr, na);
 			break;
@@ -536,7 +542,12 @@ static u64 __of_translate_address(struct device_node *=
dev,
=20
 		/* Get new parent bus and counts */
 		pbus =3D of_match_bus(parent);
-		pbus->count_cells(dev, &pna, &pns);
+		if (dma) {
+			pna =3D of_bus_n_addr_cells(parent);
+			pns =3D of_bus_n_size_cells(parent);
+		} else {
+			pbus->count_cells(dev, &pna, &pns);
+		}
 		if (!OF_CHECK_COUNTS(pna, pns)) {
 			pr_err("Bad cell count for %pOF\n", dev);
 			break;
--=20
2.37.3


--dCBbHJqO6VA9aoz5--

--C8KFzC3JLrgNSjam
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNRXGUACgkQ3SOs138+
s6HDlg/+I1R2a7WXzRmfGuzmKMXBXVfnhHUqLPiNnT7raUMzjn8W8Iv3q3sGhoiM
zEg2f5jyYrJpyiEeGqHpLsntFnppIJjfCDgaZXiJcqmeQFV+Lf01UMewnFEYQ6/N
ED7U8SDeOUQzAyiXQHNHi8RsJfZNj5+L3L7IsQFlJzp2s1U3V7l5N6FiNRHdRpqa
sZOmjx4DtEGv4A6fuhun27Dkufh6MB1dP4vay7pkgnxvUKzB82px7odS2occn0+3
IlgsoJ+2cpsmMl8z40OSENQCSo19bocoKcD1h5uQap8P5GEk/mI04YHobwGHiVV9
w+6jPsCFBbcFvlIvxY5XvJhKhOfnRfQ9B3nmQiIBgThUZZQWVnuxHxNQQwbqNa7I
ylMCHidZUk5703rZT2K0Pj837X4e1xBTdOUeLbBBLuuFGdgmVOU3WQfQDhVb08jE
npzahkvpT0tlCoNVGZLztUwriTMd8jsCpUqyIdshzhbLawt03yYg1sLReYyc5L0B
2O4WDdtFZeRzXFDgcGpof1bFI8kzlvM/pL1NCCpgBx5kEfHS8vXhOQrVvk07Sc35
tehVWVooPXDAmBeFyg6+N6acz96472SviaIrJIzdHAHjx0eWQ6VJthXrhZM0eljH
SgEFcKCI69nnXYoXMANf/irsLMHLHSTzW8ZGgLFzFuwUZRrfhIo=
=vCci
-----END PGP SIGNATURE-----

--C8KFzC3JLrgNSjam--
