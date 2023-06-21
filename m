Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23EDBEB64D8
	for <linux-tegra@archiver.kernel.org>; Wed, 21 Jun 2023 17:21:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbjFURVV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 21 Jun 2023 13:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjFURVU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 21 Jun 2023 13:21:20 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E252AE42
        for <linux-tegra@vger.kernel.org>; Wed, 21 Jun 2023 10:21:18 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-bacf685150cso5934498276.3
        for <linux-tegra@vger.kernel.org>; Wed, 21 Jun 2023 10:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687368078; x=1689960078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSAk//p3tdpjYImZmcR5EhVEtjoOajC1V7uGVNMF2Bg=;
        b=q/QuiXaZ88rtUbd3QeAHuuJ5YdEG8Dj33lwUpfxAKx2j6K8dza966+C6Vx9qTjeHAC
         dvjLDPex73PhJtmsc00qVmNWc81PBSoK5/DqmDEkoQRwZg7wdCgDYwv6KNw7NQHQg0ss
         QCxMpM2hyzH5EJ0IKPpWTrAOr75BDqkN90Q3p4Z+NGub6vJjdVMSx+/dWrdARkm/qa+K
         j6nLL7mAq/4hVfWhFluDu/adCBBVVG4zebIR3JHTZ/osWCH9Wbr92Ycmird8V3zgA09l
         iM+oXXoIN7YX8PqJDsa+yxmqavyepFXWWbCVfvkQEus4wkvqcgdDn/f+isiJhlvZC9Fa
         qF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687368078; x=1689960078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fSAk//p3tdpjYImZmcR5EhVEtjoOajC1V7uGVNMF2Bg=;
        b=XCXNE7y6NnbXiYJhpKQVQa1mM9j4AuH7XX7dM6KWEmO4m4bwstqGW+Kkdi7AkG7oDO
         mYFzH58XENh79lMDTRte0fMiBWDQo7BYfF/ADrtlca5rKFZPNbMFlDdjgc9u51HSL2no
         aFOXdVtZjU6mZYvIlx8vV5X67qlhb6S/AEfR0YnsKm4vT+kY6dPxWjbAotIudGXNbnAf
         6vhb+TPe36DL+IavJQcSFc6Ck0Mv3QMBFhauq56wtBP3xyIJ5D+12K7nY677BVCtusRG
         jCDQQSDgiKx+tw+duQzap9mIhTvy9fAwKTzRpm8u3w0hROvH/GmnrLnu9Yrl5njg9ikK
         bHyw==
X-Gm-Message-State: AC+VfDwfOvuEwprcG5oFEjaJg1Kh4ql/9lf1HukozHxH0391CNHpQW3G
        R3P44hTUe2g9H4J3+UE0kIqK/QRZwMyzwhzlusyEPQ==
X-Google-Smtp-Source: ACHHUZ6QsXC3OAIyOliYBKtqphS99pcdIqKPy8YCP9uA7AvPGJKpRGqoCdEsBhlAqNN17J1t3eSvc6iLsH8DsBI66fE=
X-Received: by 2002:a25:d3c6:0:b0:bcb:f3cc:e965 with SMTP id
 e189-20020a25d3c6000000b00bcbf3cce965mr12582408ybf.11.1687368078014; Wed, 21
 Jun 2023 10:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230529223935.2672495-1-dmitry.osipenko@collabora.com> <20230529223935.2672495-3-dmitry.osipenko@collabora.com>
In-Reply-To: <20230529223935.2672495-3-dmitry.osipenko@collabora.com>
From:   "T.J. Mercier" <tjmercier@google.com>
Date:   Wed, 21 Jun 2023 10:21:07 -0700
Message-ID: <CABdmKX2RU2iYyUssBpwS17zA1dfegjzdo4pxp0r8cOCWcY9=kg@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] dma-buf/heaps: Don't assert held reservation lock
 for dma-buf mmapping
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <jstultz@google.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tomi Valkeinen <tomba@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        kernel@collabora.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, May 29, 2023 at 3:46=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Don't assert held dma-buf reservation lock on memory mapping of exported
> buffer.
>
> We're going to change dma-buf mmap() locking policy such that exporters
> will have to handle the lock. The previous locking policy caused deadlock
> problem for DRM drivers in a case of self-imported dma-bufs once these
> drivers are moved to use reservation lock universally. The problem
> solved by moving the lock down to exporters. This patch prepares dma-buf
> heaps for the locking policy update.
>
Hi Dmitry,

I see that in patch 6 of this series calls to
dma_resv_lock/dma_resv_unlock have been added to the
drm_gem_shmem_helper functions and some exporters. But I'm curious why
no dma_resv_lock/dma_resv_unlock calls were added to these two dma-buf
heap exporters for mmap?

Thanks,
T.J.

> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/dma-buf/heaps/cma_heap.c    | 3 ---
>  drivers/dma-buf/heaps/system_heap.c | 3 ---
>  2 files changed, 6 deletions(-)
>
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma=
_heap.c
> index 1131fb943992..28fb04eccdd0 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -13,7 +13,6 @@
>  #include <linux/dma-buf.h>
>  #include <linux/dma-heap.h>
>  #include <linux/dma-map-ops.h>
> -#include <linux/dma-resv.h>
>  #include <linux/err.h>
>  #include <linux/highmem.h>
>  #include <linux/io.h>
> @@ -183,8 +182,6 @@ static int cma_heap_mmap(struct dma_buf *dmabuf, stru=
ct vm_area_struct *vma)
>  {
>         struct cma_heap_buffer *buffer =3D dmabuf->priv;
>
> -       dma_resv_assert_held(dmabuf->resv);
> -
>         if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) =3D=3D 0)
>                 return -EINVAL;
>
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/=
system_heap.c
> index e8bd10e60998..fcf836ba9c1f 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -13,7 +13,6 @@
>  #include <linux/dma-buf.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dma-heap.h>
> -#include <linux/dma-resv.h>
>  #include <linux/err.h>
>  #include <linux/highmem.h>
>  #include <linux/mm.h>
> @@ -202,8 +201,6 @@ static int system_heap_mmap(struct dma_buf *dmabuf, s=
truct vm_area_struct *vma)
>         struct sg_page_iter piter;
>         int ret;
>
> -       dma_resv_assert_held(dmabuf->resv);
> -
>         for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
>                 struct page *page =3D sg_page_iter_page(&piter);
>
> --
> 2.40.1
>
