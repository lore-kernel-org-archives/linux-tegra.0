Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E6FC47094
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Jun 2021 09:21:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72552613ED
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Jun 2021 09:21:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbhFJJXF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Jun 2021 05:23:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbhFJJXB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Jun 2021 05:23:01 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5BAC061574
        for <linux-tegra@vger.kernel.org>; Thu, 10 Jun 2021 02:21:04 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id t6so8461252qvp.5
        for <linux-tegra@vger.kernel.org>; Thu, 10 Jun 2021 02:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=P4iEhDem4kZK+SyUyBPttrlpuO+aLuZVSlxOmTIA50w=;
        b=qVkWH4RnV6lnk+N0kipQ0LUeMbBIPfTBjgz7Bn++bEj02Yak31f7aFlKdIuJTtz5TQ
         tnw5Up1LQtz7kKB/aDUPkOdCQtsikVSBSVRwqsJdOhK9WAb0B9izPnvPEQGJpFBMPeLr
         JT+PRh53KIuMz+rY40ic9eJAoSVtmJ68V3msPDFdym7WhN/hNV3ocWBm4//ZfGPs2WLD
         Uy2/w9qGa0gq40MO42xAvKdFTnbHODQn4O7SuzaKkYR8tORAm/rsQbXl/AKVJBjitxDg
         fw3NQzxSOaz8/eN83N7HefbAURto4NHhp0LQVD3KyPftkcOnEptPAcs8faMJnPhhynXE
         KYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=P4iEhDem4kZK+SyUyBPttrlpuO+aLuZVSlxOmTIA50w=;
        b=QQUiNYCg8bMoRhRSEQExeXsn0LyI6UhFcPpGGxGPq/r2qodn9qyqEC4Kg1YGdZAhvG
         a/MjXcI9VSxdfRTFQ9x98Nq/JCQtKPoFqb07Vx7/rQ15K/2J83F1JlWVkhlU8G7ZljTQ
         15nISKCpujN94xQUHpVhtBsKHoV4fQmS5a2a6wmavLKgnlSbGDo8EzgvCSPOKRmf2Xwb
         LBKB++w2aiN4KjrTNrnZ7FaESQ6Qi5AgzlhSxMyutV7Mmwfo43sac3wTwQJjdquQAEHW
         2QwSAlmuUwdEPHNQV0E2vEugmTCByuajsd1U6Ci11NoFBpnZ0rH06N7T9h0o44CBR4SD
         tKsA==
X-Gm-Message-State: AOAM533AkOYtpJMDWfhUvk1VEUYfLIuFVV5bjGSQvWpSw9SG069cFzCW
        XobatAZVLl8Y7bmjyP2zHAxfbG7WLRTlEJAQAJnSrT5INT8=
X-Google-Smtp-Source: ABdhPJwhXLh64zHDWG2mptUnFVGdHO2Sbc8j3h5R1chhHutwY1ett/fLW3sF8OgRKC+x7iYZapFSyWZQNtgMeqcUi6E=
X-Received: by 2002:a05:6214:764:: with SMTP id f4mr4032377qvz.60.1623316863810;
 Thu, 10 Jun 2021 02:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210609172902.1937-1-christian.koenig@amd.com>
In-Reply-To: <20210609172902.1937-1-christian.koenig@amd.com>
From:   Matthew Auld <matthew.william.auld@gmail.com>
Date:   Thu, 10 Jun 2021 10:20:37 +0100
Message-ID: <CAM0jSHPXTtqQ+E7+yOXnzyOPj4GX_wfiky92RYMMQWxTEM9BEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: init the base GEM fields for internal BOs
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     imirkin@alum.mit.edu, cyndis@kapsi.fi, linux-tegra@vger.kernel.org,
        nouveau@lists.freedesktop.org, ray.huang@amd.com,
        Matthew Auld <matthew.auld@intel.com>,
        ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 9 Jun 2021 at 18:29, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> TTMs buffer objects are based on GEM objects for quite a while
> and rely on initializing those fields before initializing the TTM BO.
>
> Noveau now doesn't init the GEM object for internally allocated BOs,
> so make sure that we at least initialize some necessary fields.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

fwiw,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouve=
au/nouveau_bo.c
> index 520b1ea9d16c..085023624fb0 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -149,6 +149,8 @@ nouveau_bo_del_ttm(struct ttm_buffer_object *bo)
>          */
>         if (bo->base.dev)
>                 drm_gem_object_release(&bo->base);
> +       else
> +               dma_resv_fini(&bo->base._resv);
>
>         kfree(nvbo);
>  }
> @@ -330,6 +332,10 @@ nouveau_bo_new(struct nouveau_cli *cli, u64 size, in=
t align,
>         if (IS_ERR(nvbo))
>                 return PTR_ERR(nvbo);
>
> +       nvbo->bo.base.size =3D size;
> +       dma_resv_init(&nvbo->bo.base._resv);
> +       drm_vma_node_reset(&nvbo->bo.base.vma_node);
> +
>         ret =3D nouveau_bo_init(nvbo, size, align, domain, sg, robj);
>         if (ret)
>                 return ret;
> --
> 2.25.1
>
