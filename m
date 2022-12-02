Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87DD7C4321E
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Dec 2022 14:37:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbiLBOhj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Dec 2022 09:37:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232038AbiLBOhj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Dec 2022 09:37:39 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20C8F25E0;
        Fri,  2 Dec 2022 06:37:36 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id h4-20020a1c2104000000b003d0760654d3so5192658wmh.4;
        Fri, 02 Dec 2022 06:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jC6vYmHZlOprUlpnLMqFysjiPAVXh21XNPM4ynQXCDY=;
        b=ietSvAUrLth+t0R+nc4ixCzn/qh8qt++AMGX2loy/vL9pkx0FpoNlaR5MCP8dx3ItT
         D8s+MSR1ONl0JhcRQFmb+YxBB4Gdi/dPctVv6EStnzH5CWjPaREWbD4zYvhNU1XH/FEQ
         Xd7c5GMsGNF8IG5DNM822Fik9BdAa4dhm4zhjt2VXm2IYAmrclvWB0O7lSXrs4wEjWPn
         D2c/47JQCPE9DcQVdGgTx5x/00YALCc2afwIUGNLZUhpOQFIcKlfmtRT511bIRIcv9nl
         ulYua/BgyMIYGsDIT1Hx7DPViQfYVDv8kle+hhEsz+021AOEtDYpI0rdE1WMcqD2dM3m
         W1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jC6vYmHZlOprUlpnLMqFysjiPAVXh21XNPM4ynQXCDY=;
        b=naNWhpL/ncNDzXgc3Bn23Vx+uEB3YmmYZS2hn8MDXNlKAPt5/ykCCkdFeQLgUQrqjE
         v+nMfDtwbenoJeZFYgW02kqF//51qL1g11MQF6WSxY+LjOCiy7ICfSWHzMoX7JsWAqgo
         nF6MwMVCyKgHZkGJv4Fn5+GEjU2vGznBvnl+dVoRxCgdmxYMKVNM28mFLWSKYdrx6Lgv
         tttv5ij8t+VMGCnq8/zkxvNlCB49thlWC7u72cPMQHaqyConGRJ//gjUdwbvRW22GlWt
         FK+nnHKZpfZgXpx2cXowHxee8DcGGGR5ntx8HFMmPhCnDPkBOkrCFYz8L+spTrthZB1M
         YDIw==
X-Gm-Message-State: ANoB5pnjZSfcu/TNTBazKkq37zugOINr4Vh74TcX+eUVk5rO7O8CtvL/
        Bg9TP1GBJrkRd9kaOw04bSIl0ULWFf8=
X-Google-Smtp-Source: AA0mqf4EjSy7EEunpV07jBxCO5DnpW94nJlCI10IF2GIDt6jbzlgD25xftYCJB5Ci5wl/rAHI8XSXA==
X-Received: by 2002:a1c:6a13:0:b0:3cf:7801:c780 with SMTP id f19-20020a1c6a13000000b003cf7801c780mr53015523wmc.29.1669991854412;
        Fri, 02 Dec 2022 06:37:34 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id j33-20020a05600c1c2100b003b4ff30e566sm15247155wms.3.2022.12.02.06.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 06:37:33 -0800 (PST)
Date:   Fri, 2 Dec 2022 15:37:31 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Ashish Mhetre <amhetre@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v12 3/4] iommu: Implement of_iommu_get_resv_regions()
Message-ID: <Y4oNq7bZGrmZ7Hvd@orome>
References: <20221117185424.2359687-1-thierry.reding@gmail.com>
 <20221117185424.2359687-4-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uP83EJqHt8cZ6GFS"
Content-Disposition: inline
In-Reply-To: <20221117185424.2359687-4-thierry.reding@gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--uP83EJqHt8cZ6GFS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2022 at 07:54:23PM +0100, Thierry Reding wrote:
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
> Changes in v10:
> - extract more code into the new iommu_resv_region_get_type() function
> - rename variables for physical and I/O virtual addresses for clarity
> - default to IOMMU_RESV_DIRECT instead of IOMMU_RESV_DIRECT_RELAXABLE
> - use newly introduced of_translate_dma_region()
>=20
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
>  drivers/iommu/of_iommu.c | 94 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/of_iommu.h |  8 ++++
>  2 files changed, 102 insertions(+)

Hi Robin,

can you take a look at this to see if all your concerns have now been
addressed?

Thanks,
Thierry

> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index 5696314ae69e..fa7c63a4abbf 100644
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
> @@ -172,3 +173,96 @@ const struct iommu_ops *of_iommu_configure(struct de=
vice *dev,
> =20
>  	return ops;
>  }
> +
> +static enum iommu_resv_type iommu_resv_region_get_type(struct device *de=
v, struct resource *phys,
> +						       phys_addr_t start, size_t length)
> +{
> +	phys_addr_t end =3D start + length - 1;
> +
> +	/*
> +	 * IOMMU regions without an associated physical region cannot be
> +	 * mapped and are simply reservations.
> +	 */
> +	if (phys->start >=3D phys->end)
> +		return IOMMU_RESV_RESERVED;
> +
> +	/* may be IOMMU_RESV_DIRECT_RELAXABLE for certain cases */
> +	if (start =3D=3D phys->start && end =3D=3D phys->end)
> +		return IOMMU_RESV_DIRECT;
> +
> +	dev_warn(dev, "treating non-direct mapping [%pr] -> [%pap-%pap] as rese=
rvation\n", &phys,
> +		 &start, &end);
> +	return IOMMU_RESV_RESERVED;
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
> +		struct resource phys;
> +		int size;
> +
> +		memset(&phys, 0, sizeof(phys));
> +
> +		/*
> +		 * The "reg" property is optional and can be omitted by reserved-memor=
y regions
> +		 * that represent reservations in the IOVA space, which are regions th=
at should
> +		 * not be mapped.
> +		 */
> +		if (of_find_property(it.node, "reg", NULL)) {
> +			err =3D of_address_to_resource(it.node, 0, &phys);
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
> +
> +			phandle =3D be32_to_cpup(maps++);
> +			np =3D of_find_node_by_phandle(phandle);
> +
> +			if (np =3D=3D dev->of_node) {
> +				int prot =3D IOMMU_READ | IOMMU_WRITE;
> +				struct iommu_resv_region *region;
> +				enum iommu_resv_type type;
> +				phys_addr_t iova;
> +				size_t length;
> +
> +				maps =3D of_translate_dma_region(np, maps, &iova, &length);
> +				type =3D iommu_resv_region_get_type(dev, &phys, iova, length);
> +
> +				region =3D iommu_alloc_resv_region(iova, length, prot, type,
> +								 GFP_KERNEL);
> +				if (region)
> +					list_add_tail(&region->list, list);
> +			}
> +		}
> +	}
> +#endif
> +}
> +EXPORT_SYMBOL(of_iommu_get_resv_regions);
> diff --git a/include/linux/of_iommu.h b/include/linux/of_iommu.h
> index 55c1eb300a86..9a5e6b410dd2 100644
> --- a/include/linux/of_iommu.h
> +++ b/include/linux/of_iommu.h
> @@ -12,6 +12,9 @@ extern const struct iommu_ops *of_iommu_configure(struc=
t device *dev,
>  					struct device_node *master_np,
>  					const u32 *id);
> =20
> +extern void of_iommu_get_resv_regions(struct device *dev,
> +				      struct list_head *list);
> +
>  #else
> =20
>  static inline const struct iommu_ops *of_iommu_configure(struct device *=
dev,
> @@ -21,6 +24,11 @@ static inline const struct iommu_ops *of_iommu_configu=
re(struct device *dev,
>  	return NULL;
>  }
> =20
> +static inline void of_iommu_get_resv_regions(struct device *dev,
> +					     struct list_head *list)
> +{
> +}
> +
>  #endif	/* CONFIG_OF_IOMMU */
> =20
>  #endif /* __OF_IOMMU_H */
> --=20
> 2.38.1
>=20

--uP83EJqHt8cZ6GFS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmOKDakACgkQ3SOs138+
s6FlSxAAq5gWDsz/6v2mXHjiXDx0XkZ85ofrfSX3o6+tAviMiToIwE36lsIaPzpI
ZFaVu8XbZ5pDkLft9AjYxn7P+aC1VaqXjJ45CJGdq+nBrWuc+g8x2mvfIFfg/frg
5WgRJkaaLcgGWYctl98zcBMKu73jNOVSiW5qM+TjUBEG78T8f5purUWeDEwOooIm
HSXYbWM3IbJZK3kKwB/Osydj2+7Xv8AHuI6T6fsHmmqGMy8qwV9Qo3abaQu8X9yu
ze6ianVSLzeW1nj+fTSDTewqW0/9QY/GhTz5SsZ1SjgYhqZuGt1JU3eCuHQZYtbA
Bteag/ePfM1TLGkZbMSYlK77G3koXW3/Gu6DjIqXGlJF40UJWY3tw3CEGLCYVJ0O
YTWSVToylHIHMD0eeB7P0E1B35Ngw9AWYKTCxOKbNQsH8VSyV5gb6YZm07J9XqR1
DvUir5JMZ8GSNp/m1bNaED1yJpEltKFE2Wfqw70N6uJrKRh07FeBE9IAsOwByyM/
OuN3DPHfpZSob6CwEB9Ygo7IvwDwokMgnW0dvcgRKp11fBPfFnQphP1xNyw+GaeA
c0orYBcwi0MCD3S2uTyVMV+HEliz6eUodyoHcOSLpGmnJZ5/ysvc1w92r70aWsTH
EOVzZ4RqZVZpXbTRLVVoSyPrSTEtdMS1FhmYO1auric0vHFU0p8=
=eCh8
-----END PGP SIGNATURE-----

--uP83EJqHt8cZ6GFS--
