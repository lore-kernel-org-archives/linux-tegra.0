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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78409C433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 13:39:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FBE961983
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 13:39:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbhCWNi1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 09:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231584AbhCWNhx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 09:37:53 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B99EAC061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 06:37:52 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id ce10so27137540ejb.6
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 06:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=p9bSVVzekojjatQS+g6a7TVAbjRfZNZ7xJRUuEXyXVw=;
        b=BoL5KlbmUWAirwSWbevPqJkqoeNmFpdaxciOeTrIKpyzW+EkDW/Ni2jaQ+dHlFetYk
         PqTMOG2qzlStwY2BjzyPv0LgKlWwHswYqBAsgf4nbRTrJ9FwZNU/alqR7MBJxSEYc7Sz
         AWUWtV0JQ/LWNbpatho62529Ln17QZqqNa8susD3Aj3yv8kkJhrwRPFgr1MwolPh1uOU
         0UxAyS8c+ii9O6Rz15vqL9mSX5bPCiNI9A7zC9gPelwa09pDEXtzyJ3FLsJjlLCNX61O
         EF39IN3ugPdoLCrlRvIWIL4zS9tfB39ozJhg8PTcU0SGhMnSTR/C8GB9TutZR9iPJM5K
         WjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=p9bSVVzekojjatQS+g6a7TVAbjRfZNZ7xJRUuEXyXVw=;
        b=YxgxnyAwYWn6Lv4E3LsMIXmZ0qMmrSCao2kZAJyufkfw9E4TBrH6IcMJt8esZ2aSfW
         ZM2BxarDGyqdpsF9EtTrNG9AUfJXNJ38bCw/xGFpPHp75TL4c2Qi6uQM3A3u7vJrh2qa
         /Fwu4VzsC9Jios16G5yrsRNuuIumBgvalj3bOBbiXfP/yeNjtA1wFGsbGm7B7wEkaWKz
         Y9MyoBW360YNACnHrOTsYYzQ8iXxmstejJ3RTnnxWFIh85OfdpEhv6xOqfoDvoLbFucI
         Sa9dH5JV+Sgp9RHYq71VG6AkFRH4txrRObfbLZ2hhioM1N+nftfWS3Ewu8/g8l6LabkW
         bR2A==
X-Gm-Message-State: AOAM53289aLK9i8ABwK+VqdsJYH0KPQ6hfwNGMghP2FOc+wZwoJql/pt
        vd20gQrdP6hMnw2Ax02OK8k=
X-Google-Smtp-Source: ABdhPJx8nNVxKkN4pX6KACd4NZ87KR+0WS9u+TnbEk9KXlcvcEq9XNN1KWLYAttJwyGtVyTOUqhMWg==
X-Received: by 2002:a17:906:f1c8:: with SMTP id gx8mr5074346ejb.385.1616506671460;
        Tue, 23 Mar 2021 06:37:51 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f19sm13065818edu.12.2021.03.23.06.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 06:37:49 -0700 (PDT)
Date:   Tue, 23 Mar 2021 14:38:09 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     jonathanh@nvidia.com, digetx@gmail.com, airlied@linux.ie,
        daniel@ffwll.ch, linux-tegra@vger.kernel.org, talho@nvidia.com,
        bhuntsman@nvidia.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 20/21] drm/tegra: Implement job submission part of new
 UAPI
Message-ID: <YFnvQYvT7E/kCAuj@orome.fritz.box>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-21-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jc4GjS8xwUd/3Cp7"
Content-Disposition: inline
In-Reply-To: <20210111130019.3515669-21-mperttunen@nvidia.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--jc4GjS8xwUd/3Cp7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2021 at 03:00:18PM +0200, Mikko Perttunen wrote:
> Implement the job submission IOCTL with a minimum feature set.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v5:
> * Add 16K size limit to copies from userspace.
> * Guard RELOC_BLOCKLINEAR flag handling to only exist in ARM64
>   to prevent oversized shift on 32-bit platforms.
> v4:
> * Remove all features that are not strictly necessary.
> * Split into two patches.
> v3:
> * Remove WRITE_RELOC. Relocations are now patched implicitly
>   when patching is needed.
> * Directly call PM runtime APIs on devices instead of using
>   power_on/power_off callbacks.
> * Remove incorrect mutex unlock in tegra_drm_ioctl_channel_open
> * Use XA_FLAGS_ALLOC1 instead of XA_FLAGS_ALLOC
> * Accommodate for removal of timeout field and inlining of
>   syncpt_incrs array.
> * Copy entire user arrays at a time instead of going through
>   elements one-by-one.
> * Implement waiting of DMA reservations.
> * Split out gather_bo implementation into a separate file.
> * Fix length parameter passed to sg_init_one in gather_bo
> * Cosmetic cleanup.
> ---
>  drivers/gpu/drm/tegra/Makefile         |   2 +
>  drivers/gpu/drm/tegra/drm.c            |   2 +
>  drivers/gpu/drm/tegra/uapi/gather_bo.c |  86 +++++
>  drivers/gpu/drm/tegra/uapi/gather_bo.h |  22 ++
>  drivers/gpu/drm/tegra/uapi/submit.c    | 428 +++++++++++++++++++++++++
>  drivers/gpu/drm/tegra/uapi/submit.h    |  17 +
>  6 files changed, 557 insertions(+)
>  create mode 100644 drivers/gpu/drm/tegra/uapi/gather_bo.c
>  create mode 100644 drivers/gpu/drm/tegra/uapi/gather_bo.h
>  create mode 100644 drivers/gpu/drm/tegra/uapi/submit.c
>  create mode 100644 drivers/gpu/drm/tegra/uapi/submit.h
>=20
> diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makef=
ile
> index 0abdb21b38b9..059322e88943 100644
> --- a/drivers/gpu/drm/tegra/Makefile
> +++ b/drivers/gpu/drm/tegra/Makefile
> @@ -4,6 +4,8 @@ ccflags-$(CONFIG_DRM_TEGRA_DEBUG) +=3D -DDEBUG
>  tegra-drm-y :=3D \
>  	drm.o \
>  	uapi/uapi.o \
> +	uapi/submit.o \
> +	uapi/gather_bo.o \
>  	gem.o \
>  	fb.o \
>  	dp.o \
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index 6a51035ce33f..60eab403ae9b 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -737,6 +737,8 @@ static const struct drm_ioctl_desc tegra_drm_ioctls[]=
 =3D {
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_UNMAP, tegra_drm_ioctl_channel_unmap,
>  			  DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_SUBMIT, tegra_drm_ioctl_channel_submit,
> +			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE, tegra_drm_ioctl_gem_create,
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP, tegra_drm_ioctl_gem_mmap,
> diff --git a/drivers/gpu/drm/tegra/uapi/gather_bo.c b/drivers/gpu/drm/teg=
ra/uapi/gather_bo.c
> new file mode 100644
> index 000000000000..b487a0d44648
> --- /dev/null
> +++ b/drivers/gpu/drm/tegra/uapi/gather_bo.c
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2020 NVIDIA Corporation */
> +
> +#include <linux/scatterlist.h>
> +#include <linux/slab.h>
> +
> +#include "gather_bo.h"
> +
> +static struct host1x_bo *gather_bo_get(struct host1x_bo *host_bo)
> +{
> +	struct gather_bo *bo =3D container_of(host_bo, struct gather_bo, base);
> +
> +	kref_get(&bo->ref);
> +
> +	return host_bo;
> +}
> +
> +static void gather_bo_release(struct kref *ref)
> +{
> +	struct gather_bo *bo =3D container_of(ref, struct gather_bo, ref);
> +
> +	kfree(bo->gather_data);
> +	kfree(bo);
> +}
> +
> +void gather_bo_put(struct host1x_bo *host_bo)
> +{
> +	struct gather_bo *bo =3D container_of(host_bo, struct gather_bo, base);
> +
> +	kref_put(&bo->ref, gather_bo_release);
> +}
> +
> +static struct sg_table *
> +gather_bo_pin(struct device *dev, struct host1x_bo *host_bo, dma_addr_t =
*phys)
> +{
> +	struct gather_bo *bo =3D container_of(host_bo, struct gather_bo, base);
> +	struct sg_table *sgt;
> +	int err;
> +
> +	if (phys) {
> +		*phys =3D virt_to_phys(bo->gather_data);
> +		return NULL;
> +	}
> +
> +	sgt =3D kzalloc(sizeof(*sgt), GFP_KERNEL);
> +	if (!sgt)
> +		return ERR_PTR(-ENOMEM);
> +
> +	err =3D sg_alloc_table(sgt, 1, GFP_KERNEL);
> +	if (err) {
> +		kfree(sgt);
> +		return ERR_PTR(err);
> +	}
> +
> +	sg_init_one(sgt->sgl, bo->gather_data, bo->gather_data_words*4);
> +
> +	return sgt;
> +}
> +
> +static void gather_bo_unpin(struct device *dev, struct sg_table *sgt)
> +{
> +	if (sgt) {
> +		sg_free_table(sgt);
> +		kfree(sgt);
> +	}
> +}
> +
> +static void *gather_bo_mmap(struct host1x_bo *host_bo)
> +{
> +	struct gather_bo *bo =3D container_of(host_bo, struct gather_bo, base);
> +
> +	return bo->gather_data;
> +}
> +
> +static void gather_bo_munmap(struct host1x_bo *host_bo, void *addr)
> +{
> +}
> +
> +const struct host1x_bo_ops gather_bo_ops =3D {
> +	.get =3D gather_bo_get,
> +	.put =3D gather_bo_put,
> +	.pin =3D gather_bo_pin,
> +	.unpin =3D gather_bo_unpin,
> +	.mmap =3D gather_bo_mmap,
> +	.munmap =3D gather_bo_munmap,
> +};
> diff --git a/drivers/gpu/drm/tegra/uapi/gather_bo.h b/drivers/gpu/drm/teg=
ra/uapi/gather_bo.h
> new file mode 100644
> index 000000000000..6b4c9d83ac91
> --- /dev/null
> +++ b/drivers/gpu/drm/tegra/uapi/gather_bo.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright (c) 2020 NVIDIA Corporation */
> +
> +#ifndef _TEGRA_DRM_SUBMIT_GATHER_BO_H
> +#define _TEGRA_DRM_SUBMIT_GATHER_BO_H
> +
> +#include <linux/host1x.h>
> +#include <linux/kref.h>
> +
> +struct gather_bo {
> +	struct host1x_bo base;
> +
> +	struct kref ref;
> +
> +	u32 *gather_data;
> +	size_t gather_data_words;
> +};
> +
> +extern const struct host1x_bo_ops gather_bo_ops;
> +void gather_bo_put(struct host1x_bo *host_bo);
> +
> +#endif
> diff --git a/drivers/gpu/drm/tegra/uapi/submit.c b/drivers/gpu/drm/tegra/=
uapi/submit.c
> new file mode 100644
> index 000000000000..398be3065e21
> --- /dev/null
> +++ b/drivers/gpu/drm/tegra/uapi/submit.c
> @@ -0,0 +1,428 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2020 NVIDIA Corporation */
> +
> +#include <linux/dma-fence-array.h>
> +#include <linux/file.h>
> +#include <linux/host1x.h>
> +#include <linux/iommu.h>
> +#include <linux/kref.h>
> +#include <linux/list.h>
> +#include <linux/nospec.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/sync_file.h>
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_file.h>
> +
> +#include "../uapi.h"
> +#include "../drm.h"
> +#include "../gem.h"
> +
> +#include "gather_bo.h"
> +#include "submit.h"
> +
> +static struct tegra_drm_mapping *
> +tegra_drm_mapping_get(struct tegra_drm_channel_ctx *ctx, u32 id)
> +{
> +	struct tegra_drm_mapping *mapping;
> +
> +	xa_lock(&ctx->mappings);
> +	mapping =3D xa_load(&ctx->mappings, id);
> +	if (mapping)
> +		kref_get(&mapping->ref);
> +	xa_unlock(&ctx->mappings);
> +
> +	return mapping;
> +}
> +
> +static void *alloc_copy_user_array(void __user *from, size_t count, size=
_t size)
> +{
> +	unsigned long copy_err;
> +	size_t copy_len;
> +	void *data;
> +
> +	if (check_mul_overflow(count, size, &copy_len))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (copy_len > 0x4000)
> +		return ERR_PTR(-E2BIG);
> +
> +	data =3D kvmalloc(copy_len, GFP_KERNEL);
> +	if (!data)
> +		return ERR_PTR(-ENOMEM);
> +
> +	copy_err =3D copy_from_user(data, from, copy_len);
> +	if (copy_err) {
> +		kvfree(data);
> +		return ERR_PTR(-EFAULT);
> +	}
> +
> +	return data;
> +}
> +
> +static int submit_copy_gather_data(struct drm_device *drm,
> +				   struct gather_bo **pbo,
> +				   struct drm_tegra_channel_submit *args)
> +{
> +	unsigned long copy_err;
> +	struct gather_bo *bo;
> +	size_t copy_len;
> +
> +	if (args->gather_data_words =3D=3D 0) {
> +		drm_info(drm, "gather_data_words can't be 0");
> +		return -EINVAL;
> +	}
> +
> +	if (check_mul_overflow((size_t)args->gather_data_words, (size_t)4, &cop=
y_len))
> +		return -EINVAL;
> +
> +	bo =3D kzalloc(sizeof(*bo), GFP_KERNEL);
> +	if (!bo)
> +		return -ENOMEM;
> +
> +	kref_init(&bo->ref);
> +	host1x_bo_init(&bo->base, &gather_bo_ops);
> +
> +	bo->gather_data =3D kmalloc(copy_len, GFP_KERNEL | __GFP_NOWARN);
> +	if (!bo->gather_data) {
> +		kfree(bo);
> +		return -ENOMEM;
> +	}
> +
> +	copy_err =3D copy_from_user(bo->gather_data,
> +				  u64_to_user_ptr(args->gather_data_ptr),
> +				  copy_len);
> +	if (copy_err) {
> +		kfree(bo->gather_data);
> +		kfree(bo);
> +		return -EFAULT;
> +	}
> +
> +	bo->gather_data_words =3D args->gather_data_words;
> +
> +	*pbo =3D bo;
> +
> +	return 0;
> +}
> +
> +static int submit_write_reloc(struct gather_bo *bo,
> +			      struct drm_tegra_submit_buf *buf,
> +			      struct tegra_drm_mapping *mapping)
> +{
> +	/* TODO check that target_offset is within bounds */
> +	dma_addr_t iova =3D mapping->iova + buf->reloc.target_offset;
> +	u32 written_ptr =3D (u32)(iova >> buf->reloc.shift);
> +
> +#ifdef CONFIG_ARM64
> +	if (buf->flags & DRM_TEGRA_SUBMIT_BUF_RELOC_BLOCKLINEAR)
> +		written_ptr |=3D BIT(39);
> +#endif

Sorry, but this still isn't correct. written_ptr is still only 32-bits
wide, so your BIT(39) is going to get discarded even on 64-bit ARM. The
idiomatic way to do this is to make written_ptr dma_addr_t and use a
CONFIG_ARCH_DMA_ADDR_T_64BIT guard.

But even with that this looks wrong because you're OR'ing this in after
shifting by buf->reloc.shift. Doesn't that OR it in at the wrong offset?
Should you perhaps be doing this instead:

	#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
		if (buf->flags & DRM_TEGRA_SUBMIT_BUF_RELOC_BLOCKLINEAR)
			iova |=3D BIT(39);
	#endif

	written_ptr =3D (u32)(iova >> buf->reloc_shift);

?

Also, on a side-note: BLOCKLINEAR really isn't the right term here. I
recently dealt with this for display (though I haven't sent out that
patch yet) and this is actually a bit that selects which sector layout
swizzling is being applied. That's independent of block linear format
and I think you can have different sector layouts irrespective of the
block linear format (though I don't think that's usually done).

That said, I wonder if a better interface here would be to reuse format
modifiers here. That would allow us to more fully describe the format of
a surface in case we ever need it, and it already includes the sector
layout information as well.

Thierry

--jc4GjS8xwUd/3Cp7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBZ7z8ACgkQ3SOs138+
s6F9AA//ZfIRC8cao4sgMiQwX+4X4FgrysoBHa7rAaQiFxK4nuJnqnp82hxadUEQ
UZoVMrAnCAvi5598IkITUa1qfQNVGi/7KiIatqbcO+C7Dws/cHEG4lVbxx4F4PxJ
LkkjvWVNN4MEy1pjc1dwUjuS2FuM564JA8DszcMKTB2M2yNmTEaz8dRXJNDY1apc
mz7XB++L2uCa6jtkP/ePnuG0vGXd+KP+H7BSHBs1oNCbEizXGcEQ1QCHWByOGvv9
n3/jqeaDl1un0ieD8F9Xl+8m+GTwvrdbDgwPWTJD4pFFmlaDMMcwhvcXm7fF/7ds
04TJHmEN9r2zXv7nGpBwHHrXvJptleAYhplbM7TR7KGwwj4IaJQ7qn5x0ASoI8Vx
FD7vxSjwnPDf0XhG0aRSuYVBSk/2U8uG3Qk25t886dw5C8V/M7lrJrp2yiIJsJoK
DBEkuLt2XQzqFsPINnI426pbtcMDI7++uk79KT2oHTAU8L+Mnx1UWh42e3vkNFhn
eeHkb1Q8NWiPX45yDmNLawy1HMVkqplJ32NDLbbVHP/f1XuZruvGt1Da6s9aLTXz
Mnyl3OyZxIBklDkp9/Ix15QEmN5FL5lPWNxDqwk81XHnbmip4ZMYHSoBh1IrMISn
ebgZn5QW7AGajmUXBzTks5XYDS/eTLdKsFMKYz50JT18Uh+TaAI=
=ITMn
-----END PGP SIGNATURE-----

--jc4GjS8xwUd/3Cp7--
