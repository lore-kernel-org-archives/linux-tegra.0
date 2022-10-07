Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD66C433F5
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Oct 2022 15:28:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbiJGP2e (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Oct 2022 11:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbiJGP2Z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Oct 2022 11:28:25 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09BF710B7B6;
        Fri,  7 Oct 2022 08:28:23 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id y100so7534382ede.6;
        Fri, 07 Oct 2022 08:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8c0/8HIOq/PIbWVNjjFp6NRHcbzokah4nna60H7n7sE=;
        b=MFUgzWSsnnru7oPOA1hYPFHvQXICjAdf+AnpEembao4pW77IFt2IdH2JnDLMrWDZso
         STerBh8O+hAvfvf51ZUOnmN1nR+KCNZud9MnipCXow3s+3VlGSkQkvPgUEp3TdrBUS4h
         PL8iWe7heqj8HvpZNQPWsXHPDDJqmPDUQOJexNdeilw7yVHedYViDh9C8Qk4OJ+1G4lH
         W2wPAUPagJkdwAo7ZEs1FO4ZYUd95Qxcsb063ZtHwb4iJQgpuNvFxhZ2igDd0ecUL6Yl
         369SVK7TOX0XL9Bd8Y3XwG8N9kTt08Da29R8BbxdvInbbLA+qTz6jl191lQmXZ3PHaRy
         Im3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8c0/8HIOq/PIbWVNjjFp6NRHcbzokah4nna60H7n7sE=;
        b=7FF2OzXXcbrSqNUcgCNtzqZvbu3DfGaPEk7VnxrBGhffZuQsgdfcDxEkF6ZiFTDYqK
         bkMA3RftPn49RjpJ56YTA86CUBRlSEyV3/MI8pY/HFJ6zWYCKQ4LiBTDDD4Hv9bSXaXZ
         41U0CX9HpXJrirygCQzI1Y2UYWpxeyycgmEFPEo/OQuQfMWHpf9Y/yuoa6dCCpmZ0EWA
         08/FUGRhGemiMPO63etsMimvRaN+5mR3NDkhA01y0ol4CCurrAOM/iO+gCrXYs8mhU7e
         nZdyJ7mQbAYnIK0TkItqWSwzU3UU6/rh0JUS6KCaSd4AB4M5HuG41lAeOT1S/w32KA1h
         MDdg==
X-Gm-Message-State: ACrzQf3rpW/nfJ6eyW4XCGSVgqrgVrz4ml5f6OgOMf8so2XQ+IEhcTQO
        6q9KAtvfGto613T1fzQJX/k=
X-Google-Smtp-Source: AMsMyM44HTKFvrlQes0BRrqTLcQ0xv8gnBPt7OYX6nLWaO5HpMl45NVngeEc66hrOy4taEGQjFmMPQ==
X-Received: by 2002:a05:6402:5193:b0:459:edad:2243 with SMTP id q19-20020a056402519300b00459edad2243mr5118913edd.297.1665156502128;
        Fri, 07 Oct 2022 08:28:22 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id f4-20020a17090631c400b0078135401b9csm1367618ejf.130.2022.10.07.08.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 08:28:20 -0700 (PDT)
Date:   Fri, 7 Oct 2022 17:28:18 +0200
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
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 2/5] iommu: Implement of_iommu_get_resv_regions()
Message-ID: <Y0BFkudEGLlAqeFj@orome>
References: <20220923123557.866972-1-thierry.reding@gmail.com>
 <20220923123557.866972-3-thierry.reding@gmail.com>
 <c95801a2-4d37-ecd9-fc01-e2c32b6a6fdc@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zV1FvPVy90L3DL3S"
Content-Disposition: inline
In-Reply-To: <c95801a2-4d37-ecd9-fc01-e2c32b6a6fdc@arm.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--zV1FvPVy90L3DL3S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 07, 2022 at 02:47:23PM +0100, Robin Murphy wrote:
> On 2022-09-23 13:35, Thierry Reding wrote:
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
> >    - warn about non-direct mappings since they are not supported yet
> >    - cleanup code to require less indentation
> >    - narrow scope of variables
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
> >    memory region specifier (as defined by #memory-region-cells) to allow
> >    per-reference flags to be used
> >=20
> > Changes in v2:
> > - use "active" property to determine whether direct mappings are needed
> >=20
> >   drivers/iommu/of_iommu.c | 104 +++++++++++++++++++++++++++++++++++++++
> >   include/linux/of_iommu.h |   8 +++
> >   2 files changed, 112 insertions(+)
> >=20
> > diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> > index 5696314ae69e..0bf2b08bca0a 100644
> > --- a/drivers/iommu/of_iommu.c
> > +++ b/drivers/iommu/of_iommu.c
> > @@ -11,6 +11,7 @@
> >   #include <linux/module.h>
> >   #include <linux/msi.h>
> >   #include <linux/of.h>
> > +#include <linux/of_address.h>
> >   #include <linux/of_iommu.h>
> >   #include <linux/of_pci.h>
> >   #include <linux/pci.h>
> > @@ -172,3 +173,106 @@ const struct iommu_ops *of_iommu_configure(struct=
 device *dev,
> >   	return ops;
> >   }
> > +
> > +static inline bool check_direct_mapping(struct device *dev, struct res=
ource *phys,
>=20
> Where "phys" is the virtual address, right? :(

No, phys is actually res passed in from of_iommu_get_resv_regions()
where it is the address read from the "reg" property. So that's the
physical address of the reserved region. Perhaps it'd be useful to
rename "res" to "phys" in that function to be a little more consistent.
It's actually the "start" and "end" values that are passed into this
function that refer to the I/O virtual addresses from iommu-addresses.

>=20
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
> > +				length =3D of_read_number(maps + na, ns);
> > +
> > +				/*
> > +				 * IOMMU regions without an associated physical region cannot be
> > +				 * mapped and are simply reservations.
> > +				 */
> > +				if (res.end > res.start) {
> > +					phys_addr_t end =3D start + length - 1;
> > +
> > +					if (check_direct_mapping(dev, &res, start, end))
> > +						type =3D IOMMU_RESV_DIRECT_RELAXABLE;
>=20
> Again I really don't think we should assume relaxable by default.
>=20
> Looking at the shape of things now, it seems like check_direct_mappings()
> wants to subsume the check on res as well and grow in to a more general
> function for determining the iommu_resv_type. Then we've got a clear place
> to start special-casing things like simple-framebuffer that we do know a =
bit
> more about.

Okay, I think I know where you're going with this. Let me see what I can
come up with.

Thierry

>=20
> Thanks,
> Robin.
>=20
> > +					else
> > +						type =3D IOMMU_RESV_RESERVED;
> > +				} else {
> > +					type =3D IOMMU_RESV_RESERVED;
> > +				}
> > +
> > +				region =3D iommu_alloc_resv_region(start, length, prot, type);
> > +				if (region)
> > +					list_add_tail(&region->list, list);
> > +			}
> > +
> > +			maps +=3D na + ns;
> > +		}
> > +	}
> > +#endif
> > +}
> > +EXPORT_SYMBOL(of_iommu_get_resv_regions);
> > diff --git a/include/linux/of_iommu.h b/include/linux/of_iommu.h
> > index 55c1eb300a86..9a5e6b410dd2 100644
> > --- a/include/linux/of_iommu.h
> > +++ b/include/linux/of_iommu.h
> > @@ -12,6 +12,9 @@ extern const struct iommu_ops *of_iommu_configure(str=
uct device *dev,
> >   					struct device_node *master_np,
> >   					const u32 *id);
> > +extern void of_iommu_get_resv_regions(struct device *dev,
> > +				      struct list_head *list);
> > +
> >   #else
> >   static inline const struct iommu_ops *of_iommu_configure(struct devic=
e *dev,
> > @@ -21,6 +24,11 @@ static inline const struct iommu_ops *of_iommu_confi=
gure(struct device *dev,
> >   	return NULL;
> >   }
> > +static inline void of_iommu_get_resv_regions(struct device *dev,
> > +					     struct list_head *list)
> > +{
> > +}
> > +
> >   #endif	/* CONFIG_OF_IOMMU */
> >   #endif /* __OF_IOMMU_H */

--zV1FvPVy90L3DL3S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNARZIACgkQ3SOs138+
s6EQShAAiCjxk1ZIQLgHhBiA2UipVjGtgAMqZvoXxQSooMjNHZixW7KpKUjQe/bI
nrPckrTcsUqGQVBj+FvZcRT3ndnCiPXouzUuMVng8oBmzuh8n4r9i9oDpSKrr/GH
ySCmNw43kma+Iwdckl70HiyXNAXOEs/fjAr9Hy3uDn/12zreVyFDYUc2BskRNToL
HmRJvqwyR09zgIoUUym4IFhtlIDVL/R6ICKKeqmkFq6koNyZQ+B/xQ62R4Haoj3S
pL420yCWSK+2VYqzQiYdTNAdFVJTLtWC8/wpjXCOIxI74DdA7kG7cFeEBb5xBwfB
L0YUfpGNEvukGSIln3xDVbbaGGbL6pqjUpku57QB5bDMCis9rEPTwQfgM59C68MW
wRUII/p/oA6SHjsmcKntvWTkNLCoPLGkaicpMQZujGXRNbbvLVasKa88wXRtYU4o
6UQlK3XdI81YhOH9ZT6IAEd7chMjn8TC/363nfOXFgndBXtBeiQCnjKHbiBgZa6Y
yyLDGqiYuDDcTM53bGO0lppIbl8k/eZppBFfZIsHb/UvI63ZfyBNP8IvyW7TtPs7
pmgFDXQ5ZOfcC6h/i4jQqr981N30VaHzs2Yp034SU9STUM2mGZCkqvhVV+vkEO6Y
RpCt0U4/R6z5owwKnEpreN4HRNjiTJymzte0PJffQrIoRKuXu7o=
=+6On
-----END PGP SIGNATURE-----

--zV1FvPVy90L3DL3S--
