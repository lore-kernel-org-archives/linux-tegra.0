Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4CFC433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 23 May 2022 20:12:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232434AbiEWUL6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 23 May 2022 16:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232739AbiEWULW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 May 2022 16:11:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5BEC95FBE
        for <linux-tegra@vger.kernel.org>; Mon, 23 May 2022 13:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1653336679;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aeYANgG6QafvRhsuT7XrX05LA9JnznyUmzj/VsLlMdA=;
        b=Yj8WS3TgyBWol0zwqpFX+oCfO0TClAbApWel0y8Lm2JZ0NoBTC7UFIcg/x7dRPpbzrdd+4
        YhRnXDgMd3yf4ndEhZyZdSnaPYbQI6XRBRDVtsyB1740VfasjhQd/3fJegwO52BAYNa9ws
        0rHB5vN/hRisH2M1cGrotITU4zX9cIc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-b346Y9o2PJiOjmrGRVWUUg-1; Mon, 23 May 2022 16:11:12 -0400
X-MC-Unique: b346Y9o2PJiOjmrGRVWUUg-1
Received: by mail-qk1-f199.google.com with SMTP id h10-20020a05620a13ea00b006a34abd77c9so7278066qkl.15
        for <linux-tegra@vger.kernel.org>; Mon, 23 May 2022 13:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=aeYANgG6QafvRhsuT7XrX05LA9JnznyUmzj/VsLlMdA=;
        b=4g6OdtzyY4x7jb84FGK8mg6a0Xn+XD1IRidhXPA8jDbDrgzHKWygnQ45XURs9MNM3d
         krdRy2dCrGbkr8a87rnxIeKGJss6imcXzGezw+h0NnWN6LF32ZEZo05ZfNl57ZWBlwVN
         KGcIXU4mOOHx38QiQEtC5Lq/SruPP64Tu7CM4uL753bWZpP8A+Dnm9Ezz+rbfWt5gjMW
         YupIHPYLVIV6Md9NFJnhbfLE6FFTAiS2UarK97tGg1ZbGj0AofSkbpB7cO+MX2haEA4I
         gEXZi3BOZkm/3ucM2y+MF+5xYefjwjD5v90fYMRbemgm7lFGsbvcv6Wns2V+G0To9QDg
         XosA==
X-Gm-Message-State: AOAM531C9CrehckzNkgIuwzGk8uQe7Iapsk3meqFEVdpRBaJhI/KUBSo
        COKGHz3gi3Awdw47CnIBvU+fJy1VIemqtMmAN7DbUG2m9+0coluVThVm9bmxX4/gBPHM1ZqmlbI
        yvKnJqCJMFxrVjD6GZ3TIXwg=
X-Received: by 2002:a0c:ea34:0:b0:456:319f:f3aa with SMTP id t20-20020a0cea34000000b00456319ff3aamr18692666qvp.18.1653336670105;
        Mon, 23 May 2022 13:11:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIbD5TagG8AM+h1aWON0DBIBdEu6ADrvmmcaZwyFRUjX0un+O0w38rbCqt0Cq79b62hJyx0w==
X-Received: by 2002:a0c:ea34:0:b0:456:319f:f3aa with SMTP id t20-20020a0cea34000000b00456319ff3aamr18692652qvp.18.1653336669916;
        Mon, 23 May 2022 13:11:09 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net. [71.184.137.158])
        by smtp.gmail.com with ESMTPSA id c15-20020ac81e8f000000b002f39b99f69fsm5231205qtm.57.2022.05.23.13.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 13:11:09 -0700 (PDT)
Message-ID: <4212b4d087c68a5c32e92cfe2609221a5ecac71d.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/tegra: remove needless NULL check
From:   Lyude Paul <lyude@redhat.com>
To:     Guo Zhengkui <guozhengkui@vivo.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Karol Herbst <kherbst@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, Joerg Roedel <jroedel@suse.de>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" 
        <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" 
        <nouveau@lists.freedesktop.org>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Cc:     zhengkui_guo@outlook.com
Date:   Mon, 23 May 2022 16:11:07 -0400
In-Reply-To: <20220519072950.128268-1-guozhengkui@vivo.com>
References: <20220519072950.128268-1-guozhengkui@vivo.com>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to the appropriate branch in a moment

On Thu, 2022-05-19 at 15:29 +0800, Guo Zhengkui wrote:
> There has already been NULL check in clk_prepare_enable() and
> clk_disable_unprepare(), so remove needless NULL check before
> calling them.
> 
> Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> index 2ed528c065fa..ac9e122586bc 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> @@ -41,11 +41,9 @@ nvkm_device_tegra_power_up(struct nvkm_device_tegra
> *tdev)
>         ret = clk_prepare_enable(tdev->clk);
>         if (ret)
>                 goto err_clk;
> -       if (tdev->clk_ref) {
> -               ret = clk_prepare_enable(tdev->clk_ref);
> -               if (ret)
> -                       goto err_clk_ref;
> -       }
> +       ret = clk_prepare_enable(tdev->clk_ref);
> +       if (ret)
> +               goto err_clk_ref;
>         ret = clk_prepare_enable(tdev->clk_pwr);
>         if (ret)
>                 goto err_clk_pwr;
> @@ -70,8 +68,7 @@ nvkm_device_tegra_power_up(struct nvkm_device_tegra *tdev)
>  err_clamp:
>         clk_disable_unprepare(tdev->clk_pwr);
>  err_clk_pwr:
> -       if (tdev->clk_ref)
> -               clk_disable_unprepare(tdev->clk_ref);
> +       clk_disable_unprepare(tdev->clk_ref);
>  err_clk_ref:
>         clk_disable_unprepare(tdev->clk);
>  err_clk:
> @@ -87,8 +84,7 @@ nvkm_device_tegra_power_down(struct nvkm_device_tegra
> *tdev)
>         int ret;
>  
>         clk_disable_unprepare(tdev->clk_pwr);
> -       if (tdev->clk_ref)
> -               clk_disable_unprepare(tdev->clk_ref);
> +       clk_disable_unprepare(tdev->clk_ref);
>         clk_disable_unprepare(tdev->clk);
>         udelay(10);
>  

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

