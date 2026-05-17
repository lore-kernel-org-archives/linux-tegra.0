Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5574630B50A
	for <linux-tegra@vger.kernel.org>; Sun, 17 May 2026 20:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779048152; cv=pass; b=bAu0oElCbAMaOyzH495pKJwieCTBx9ycLWwVtDtnhg0yfBT/Xu5h0GDtLC3HyJoTzCBVal8BOK9WIWJlUl1fW65TEgZEVF12NxB1rdwSDBEklRO1DPib/yloEKK3dYswB5hw75PW+5sAGZNmWyC/Du7QVQcAIKnjPBG0dz6GKfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779048152; c=relaxed/simple;
	bh=LlLdrL/zBn8T95413g7ANq16IuDR4BlrJv3pOEnw8mk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BC0Ug+0iML/HHD5dldza7eLggkeUR10Sav/zOBaTPtTc/kJ85rvwe7U24GdSRdZ/1XEbgAhw3pz6eRS/lZYgX5UWlQrwtZ1PFnQOLcEDeSYdNmuW4LZ9Yz7CsmycaZtDfxErNNEmcq3KDtjtHFoGIoF0eQmm/y/pzlHHEbX4KnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivOvlvhM; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivOvlvhM"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38e7c3a2deaso15616561fa.2
        for <linux-tegra@vger.kernel.org>; Sun, 17 May 2026 13:02:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779048148; cv=none;
        d=google.com; s=arc-20240605;
        b=Qqwhu8gViNWpN46qzT+c5rR7oakDa6fnZiQhU4guJx0Wq3iO8f2wusCMsKJmhZknZH
         P1B3Bul4/I6GgIdLcK7c+hl7nFZ4Jc8IIum8re15qHMD+hW/WG2d7dg44Et9miK3KyNI
         HHMty36DNJKhtdqihlcTybz+0tSWo9hMMJEtHdjbhFYMznMBoeFT0RV1wSXveptz8MWF
         ErG7OSpFIQIR96NnVEbvWZSdDvqrrqfDCT6H4S9BMMeNd3HK0vwL8mhdkcTihDQW1kq4
         zlvfqwaTJlVTHw/sZKm3gh8IZME4U5nMBtFZSgfEUMZfx1NyC2aEtBcJGOxX1wEmma0V
         faKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nlr2qnovcb3Be3djUSZsGiNTerFiMk2kk6Bag5mm8cQ=;
        fh=hdYp5wUhejAGRtoN44bgEuvdHyOy8X+cLkkcoxuQTp0=;
        b=IcIY+3j5opyrof7iZ2/lalvrEs/THlIK+Ti+ubikgcVSS5sNTthLoDeIuEe7JlhSCa
         wshuA2i5vfVcHpglSfFONzNbp2KuL6oxFhm/7IeogPOB+nR4fYYaZRGdRSAK1AwQYUVs
         lvzgK4RQAt344zKTGlLw3bqnlHI0z9s7N0lKKfNVg7mIl6fOsu41NMGG/sQINH9FrI7f
         H0qyqHBNgLm8/+L8lPNud0fUVnC4OdVQJBJBczagUczSJDuSrebPNlUqp16iQFKd5aOY
         FCLOkSAYBSSFcVHPh3wEMWkjGqQ0HtiqWhtlWp8+DbmcMGptJnOiaui0jClwcFR28msr
         DA2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779048148; x=1779652948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nlr2qnovcb3Be3djUSZsGiNTerFiMk2kk6Bag5mm8cQ=;
        b=ivOvlvhMUXlOvDa2X+lSQrV47VNm0VoNRNxNmFZF0HFN79kP1tb/Sf/1o531dFGsQW
         ZxLZzfgkZgQUGpZajBlBWEz1w6sIYrEamLOHAGg11nJSoP2HGtzbnbZiOTmzjn2NmJ4/
         ZNK9RQPG5+REmtMTANsgyGwHdpFM7881W0oehOJxwfH6F+LvHWiVF/kfPcpIzUaY3F/y
         bATQ95HG64VLlpvel2+h993Yp1u6LMquO/Nu9cJEOuAYljO8dhKWXZ0lr6yLzZqpf6QR
         ZfhjGYrRiC8XqPFfzUoNDY64Iewy3ln2MO6Gd+ecZ8BdJwpCrGNQpF/9O9yNVpruGe29
         3sIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779048148; x=1779652948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nlr2qnovcb3Be3djUSZsGiNTerFiMk2kk6Bag5mm8cQ=;
        b=SA9LibmP7+TKjsZ/QSnq4FU7fXW0bSQTIUtKO9yAEe6rvEIJ804GcG7gjzKLEidNU6
         QSRsKjYLnTSZw5s0fNfd8actJ0S2tj+RtSa3fYlzkqgy6v1Oy4rDkbxpJJekKtvcWwYK
         NhKZRXmhtoyObirofWjiCjZ1fRbsfCDsjL0aWFAp9PGY+i6WRnArShyFgZO+k9pKSdBk
         +eIlv5O408pko2CjFWRdbKRQDoBSGVpxfKXEgaY+vcdsI+r2YUlmybryYfLlAS26RKUQ
         3NhSuHi8IGmW+ktFyHvYkhIMXwAJ0KrSH/Qgs7mT/IuxOzQBdkv9ElaHu9IwBhVZJNgX
         YT0g==
X-Forwarded-Encrypted: i=1; AFNElJ+hTJkxdEG9GYfADUiERILSYQTZiFCHmrwnScMSDzX9/s5t8+QJb57ov8XB04bLSY3WI3G/HYIsW2zrtA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+pncNIT7toStuk6CyhpZntHLw1gBu29nH4IwR52Ok6D60zLKM
	LUjC9ZGOEdVMoZNqpV8IKK83iRzxRVvOrco8r6DF/+sAZZypB0IkiAmC7Sb4HLGAlXdDIjFYh70
	TeQ+X36a2pP6ObeRgEOQjQSQcYgUP7Lk=
X-Gm-Gg: Acq92OHZB7pLNU1QVQN+eRxyrFU/EAyaHFJ4bP1WiNQ0oYumdYO0M4wrs7z4kZhWa1s
	b2lmOU2ThkcRs0+sf6E7hwCJrDJ9yS0lckuQsC1XSCW7ePny4nAQyhW0yMd603zMMtR+R9a9cj0
	hDaOcczp/uQQbNyzRooQbPfnN+1hmczj8caD9pRLOkW22PGYV1vQv1kdjuZQa7vbg/mSG4c4mpU
	oPNMGmBw6KkUQ9QyW8Ls1igTVnLJvSInc7azdi2D9KInkrAm9rjSn8aY6EMD9UfsYDzu7of8SBU
	gKhu2i/7ECrc0h8AtMZy2YHIiU7sJF4hQk1gWr4WoBkoBKtXJuDwxGJ5mnvfOdOlzJdW
X-Received: by 2002:a2e:9ec1:0:b0:393:903c:2258 with SMTP id
 38308e7fff4ca-39561c3d930mr25204241fa.16.1779048148159; Sun, 17 May 2026
 13:02:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515-host1x-bocache-leak-v1-0-a0375f68aeab@nvidia.com> <20260515-host1x-bocache-leak-v1-1-a0375f68aeab@nvidia.com>
In-Reply-To: <20260515-host1x-bocache-leak-v1-1-a0375f68aeab@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Sun, 17 May 2026 15:02:16 -0500
X-Gm-Features: AVHnY4JnVJM3r5xSc7l2rPlheXstiTlhDqt50QsQvQZlFCWPse_PuhNA6GF9D0Q
Message-ID: <CALHNRZ8-UKV1aVf6z_8uKOQ5eP1aP_7SEVJAtQ0fvCuAybb37Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpu: host1x: Allow entries in BO caches to be freed
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, Akhil R <akhilrajeev@nvidia.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 9:35=E2=80=AFPM Mikko Perttunen <mperttunen@nvidia.=
com> wrote:
>
> When a buffer object is pinned via host1x_bo_pin() with a cache, the
> resulting mapping is kept in the cache so it can be reused on subsequent
> pins. Each mapping held a reference to the underlying host1x_bo (taken
> in tegra_bo_pin / gather_bo_pin), so as long as a mapping was cached,
> the bo itself could not be freed.
>
> However, the only way to remove the cached mapping was through the free
> path of the buffer object. This meant that if a bo got cached, it could
> never get freed again.
>
> Resolve the circularity by holding a weak reference to the bo from the
> cache side. This is done by having the .pin callbacks not bump the bo's
> refcount -- instead the common Host1x bo code does so, except for the
> cache reference.
>
> Also move the remove-cache-mapping-on-free code into a common function
> inside Host1x code. This is only called from the TegraDRM GEM buffers
> since those are the only ones that can be cached at the moment.
>
> Reported-by: Aaron Kling <webgeek1234@gmail.com>
> Fixes: 1f39b1dfa53c ("drm/tegra: Implement buffer object cache")
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/gem.c    | 13 ++-------
>  drivers/gpu/drm/tegra/submit.c |  3 +--
>  drivers/gpu/host1x/bus.c       | 60 ++++++++++++++++++++++++++++++++++++=
+++++-
>  include/linux/host1x.h         |  7 +++++
>  4 files changed, 69 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index d2bae88ad545..2377e2b76397 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -69,7 +69,7 @@ static struct host1x_bo_mapping *tegra_bo_pin(struct de=
vice *dev, struct host1x_
>                 return ERR_PTR(-ENOMEM);
>
>         kref_init(&map->ref);
> -       map->bo =3D host1x_bo_get(bo);
> +       map->bo =3D bo;
>         map->direction =3D direction;
>         map->dev =3D dev;
>
> @@ -170,7 +170,6 @@ static void tegra_bo_unpin(struct host1x_bo_mapping *=
map)
>                 kfree(map->sgt);
>         }
>
> -       host1x_bo_put(map->bo);
>         kfree(map);
>  }
>
> @@ -509,17 +508,9 @@ static struct tegra_bo *tegra_bo_import(struct drm_d=
evice *drm,
>  void tegra_bo_free_object(struct drm_gem_object *gem)
>  {
>         struct tegra_drm *tegra =3D gem->dev->dev_private;
> -       struct host1x_bo_mapping *mapping, *tmp;
>         struct tegra_bo *bo =3D to_tegra_bo(gem);
>
> -       /* remove all mappings of this buffer object from any caches */
> -       list_for_each_entry_safe(mapping, tmp, &bo->base.mappings, list) =
{
> -               if (mapping->cache)
> -                       host1x_bo_unpin(mapping);
> -               else
> -                       dev_err(gem->dev->dev, "mapping %p stale for devi=
ce %s\n", mapping,
> -                               dev_name(mapping->dev));
> -       }
> +       host1x_bo_clear_cached_mappings(&bo->base);
>
>         if (tegra->domain) {
>                 tegra_bo_iommu_unmap(tegra, bo);
> diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submi=
t.c
> index 3009b8b9e619..e5841857c937 100644
> --- a/drivers/gpu/drm/tegra/submit.c
> +++ b/drivers/gpu/drm/tegra/submit.c
> @@ -76,7 +76,7 @@ gather_bo_pin(struct device *dev, struct host1x_bo *bo,=
 enum dma_data_direction
>                 return ERR_PTR(-ENOMEM);
>
>         kref_init(&map->ref);
> -       map->bo =3D host1x_bo_get(bo);
> +       map->bo =3D bo;
>         map->direction =3D direction;
>         map->dev =3D dev;
>
> @@ -117,7 +117,6 @@ static void gather_bo_unpin(struct host1x_bo_mapping =
*map)
>         dma_unmap_sgtable(map->dev, map->sgt, map->direction, 0);
>         sg_free_table(map->sgt);
>         kfree(map->sgt);
> -       host1x_bo_put(map->bo);
>
>         kfree(map);
>  }
> diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
> index f814eb4941c0..772e05a7b45b 100644
> --- a/drivers/gpu/host1x/bus.c
> +++ b/drivers/gpu/host1x/bus.c
> @@ -887,6 +887,20 @@ int host1x_client_resume(struct host1x_client *clien=
t)
>  }
>  EXPORT_SYMBOL(host1x_client_resume);
>
> +/**
> + * host1x_bo_pin() - Create a DMA mapping for the buffer object
> + * @dev: Device onto which DMA map to
> + * @bo: Buffer object to map
> + * @dir: DMA direction
> + * @cache: Cache in which to store mapping, or NULL
> + *
> + * Creates a DMA mapping pointing to @bo for @dev. The refcount of @bo i=
s incremented
> + * until host1x_bo_unpin is called.
> + *
> + * If @cache is specified, the mapping is also stored in the cache and n=
ot released
> + * until @bo is freed (refcount drops to zero). This improves performanc=
e when a buffer
> + * is pinned and unpinned frequently as in the case of display use.
> + */
>  struct host1x_bo_mapping *host1x_bo_pin(struct device *dev, struct host1=
x_bo *bo,
>                                         enum dma_data_direction dir,
>                                         struct host1x_bo_cache *cache)
> @@ -899,6 +913,7 @@ struct host1x_bo_mapping *host1x_bo_pin(struct device=
 *dev, struct host1x_bo *bo
>                 list_for_each_entry(mapping, &cache->mappings, entry) {
>                         if (mapping->bo =3D=3D bo && mapping->direction =
=3D=3D dir) {
>                                 kref_get(&mapping->ref);
> +                               host1x_bo_get(bo);
>                                 goto unlock;
>                         }
>                 }
> @@ -908,6 +923,8 @@ struct host1x_bo_mapping *host1x_bo_pin(struct device=
 *dev, struct host1x_bo *bo
>         if (IS_ERR(mapping))
>                 goto unlock;
>
> +       host1x_bo_get(bo);
> +
>         spin_lock(&mapping->bo->lock);
>         list_add_tail(&mapping->list, &bo->mappings);
>         spin_unlock(&mapping->bo->lock);
> @@ -918,7 +935,12 @@ struct host1x_bo_mapping *host1x_bo_pin(struct devic=
e *dev, struct host1x_bo *bo
>
>                 list_add_tail(&mapping->entry, &cache->mappings);
>
> -               /* bump reference count to track the copy in the cache */
> +               /*
> +                * Bump the mapping reference count to track the mapping =
in the cache,
> +                * but do not bump the BO's refcount. This allows the BO =
to still get freed,
> +                * triggering the release of the cache mapping through
> +                * host1x_bo_clear_cached_mappings.
> +                */
>                 kref_get(&mapping->ref);
>         }
>
> @@ -948,9 +970,17 @@ static void __host1x_bo_unpin(struct kref *ref)
>         mapping->bo->ops->unpin(mapping);
>  }
>
> +/**
> + * host1x_bo_unpin() - Release an established DMA mapping of a buffer ob=
ject
> + * @mapping: Mapping to release
> + *
> + * Unmaps the given @mapping, unless it is cached. Decreases the refcoun=
t on
> + * the underlying buffer object.
> + */
>  void host1x_bo_unpin(struct host1x_bo_mapping *mapping)
>  {
>         struct host1x_bo_cache *cache =3D mapping->cache;
> +       struct host1x_bo *bo =3D mapping->bo;
>
>         if (cache)
>                 mutex_lock(&cache->lock);
> @@ -959,5 +989,33 @@ void host1x_bo_unpin(struct host1x_bo_mapping *mappi=
ng)
>
>         if (cache)
>                 mutex_unlock(&cache->lock);
> +
> +       host1x_bo_put(bo);
>  }
>  EXPORT_SYMBOL(host1x_bo_unpin);
> +
> +/**
> + * host1x_bo_clear_cached_mappings() - Remove all cached mappings pointi=
ng at a bo
> + * @bo: Buffer object to release mappings of
> + *
> + * Drops references to any mappings pointing to @bo left in any caches. =
This must
> + * be called by any host1x_bo implementers that may be pinned with cachi=
ng enabled
> + * before freeing the bo.
> + */
> +void host1x_bo_clear_cached_mappings(struct host1x_bo *bo)
> +{
> +       struct host1x_bo_mapping *mapping, *tmp;
> +       struct host1x_bo_cache *cache;
> +
> +       list_for_each_entry_safe(mapping, tmp, &bo->mappings, list) {
> +               cache =3D mapping->cache;
> +               if (WARN_ON(!cache))
> +                       continue;
> +
> +               mutex_lock(&mapping->cache->lock);
> +               WARN_ON(kref_read(&mapping->ref) !=3D 1);
> +               __host1x_bo_unpin(&mapping->ref);
> +               mutex_unlock(&mapping->cache->lock);
> +       }
> +}
> +EXPORT_SYMBOL(host1x_bo_clear_cached_mappings);
> diff --git a/include/linux/host1x.h b/include/linux/host1x.h
> index 5e7a63143a4a..d8f052a85b75 100644
> --- a/include/linux/host1x.h
> +++ b/include/linux/host1x.h
> @@ -143,6 +143,12 @@ static inline struct host1x_bo_mapping *to_host1x_bo=
_mapping(struct kref *ref)
>         return container_of(ref, struct host1x_bo_mapping, ref);
>  }
>
> +/**
> + * struct host1x_bo_ops - operations implemented by a host1x_bo provider
> + *
> + * @pin: create a DMA mapping. Implementation must not touch the bo's re=
fcount.
> + * @unpin: destroy a DMA mapping. Implementation must not touch the bo's=
 refcount.
> + */
>  struct host1x_bo_ops {
>         struct host1x_bo *(*get)(struct host1x_bo *bo);
>         void (*put)(struct host1x_bo *bo);
> @@ -181,6 +187,7 @@ struct host1x_bo_mapping *host1x_bo_pin(struct device=
 *dev, struct host1x_bo *bo
>                                         enum dma_data_direction dir,
>                                         struct host1x_bo_cache *cache);
>  void host1x_bo_unpin(struct host1x_bo_mapping *map);
> +void host1x_bo_clear_cached_mappings(struct host1x_bo *bo);
>
>  static inline void *host1x_bo_mmap(struct host1x_bo *bo)
>  {
>
> --
> 2.53.0
>

I have verified this on a Jetson AGX Xavier devkit, a Jetson Xavier NX
devkit, a Jetson TX2 devkit, and a Jetson TX2 NX in a p3509 carrier.
No longer seeing allocation failures nor am I seeing any obvious
regressions. I am currently unable to boot any t210 device to Android
userspace to verify those for various preexisting reasons, and Android
recovery does not reallocate buffers to stress this issue.

Tested-by: Aaron Kling <webgeek1234@gmail.com>

Aaron
