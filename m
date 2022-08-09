Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF19C19F2D
	for <linux-tegra@archiver.kernel.org>; Tue,  9 Aug 2022 16:41:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235725AbiHIQlQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 9 Aug 2022 12:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231409AbiHIQlO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 9 Aug 2022 12:41:14 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80532B483
        for <linux-tegra@vger.kernel.org>; Tue,  9 Aug 2022 09:41:13 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id a7so23236204ejp.2
        for <linux-tegra@vger.kernel.org>; Tue, 09 Aug 2022 09:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc;
        bh=naNpYkxE68tX1ARbD3iQv+CO+kO6ut9LpVz/MEIjf2U=;
        b=iX9Se9TiI3Acb0PyhnYkVRNdA7lVQuf4CJDx2D6WpGaKbYqVnU4KX3GTPDDKS7PYVg
         gZCH6sdLyyngWxfgd5D+yNp6kzG+ewgTuTXqWMqSckX17sr8zonXMCWzvhLjGrjQGv/c
         ell5/FxG7+4Gqy9X+TsWsq7ykFiSjP9m/Frk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc;
        bh=naNpYkxE68tX1ARbD3iQv+CO+kO6ut9LpVz/MEIjf2U=;
        b=AwLb48bbwEwQrw9uG+nSVIdsU/hXR/sXaedRyu/sjtI3xyr5C/S6+zEQG9OEFqm3kg
         Yp25BrzZd8qaCCllgK0LhsIMj/Zo5oCl1a27+Slpk5yeLMPW6kF9she5PST8aZxGsr3r
         n5l+6ya7boUIkmzm2+sTrRIkLl4e72vKsanyYWHcpuw0VL5C3e8pjcPGf8wpyangwSXL
         6FvRYI7w+NWVGCJsge8XFyZtdwQd02RmS1T8nEuNKHaJqgUzkODNbpRS7PjK7d4drpuy
         P9dCYb4OufisKSzR7PWcFnP+5p2o8l0JaswMeq6pPjCwplp+64+luksYahhZixDMThDr
         fLqg==
X-Gm-Message-State: ACgBeo2tgoE6rp5jmwhWNOK7nNfSyYvNUBrXonc71No+L8tBF+Uer+S7
        74nVM0BZr9LiCszMnP5+Jcv8nw==
X-Google-Smtp-Source: AA6agR5JiN6PB/2pP/tfQ4vgKWFUin1cCx29k5oNnI6uFJ+xd5aN1v/0W1ws1t92QMVelRHOPdZjFw==
X-Received: by 2002:a17:907:3f98:b0:730:cfce:9c0f with SMTP id hr24-20020a1709073f9800b00730cfce9c0fmr18168166ejc.475.1660063272111;
        Tue, 09 Aug 2022 09:41:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id n25-20020a056402515900b0043d1a9f6e4asm6277567edd.9.2022.08.09.09.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 09:41:11 -0700 (PDT)
Date:   Tue, 9 Aug 2022 18:41:09 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc:     David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas_os@shipmail.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, kernel@collabora.com,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v7 1/2] drm/gem: Properly annotate WW context on
 drm_gem_lock_reservations() error
Message-ID: <YvKOJRbTsBk91aPO@phenom.ffwll.local>
Mail-Followup-To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Chia-I Wu <olvaffe@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas_os@shipmail.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org,
        kernel@collabora.com, virtualization@lists.linux-foundation.org
References: <20220630200405.1883897-1-dmitry.osipenko@collabora.com>
 <20220630200405.1883897-2-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220630200405.1883897-2-dmitry.osipenko@collabora.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jun 30, 2022 at 11:04:04PM +0300, Dmitry Osipenko wrote:
> Use ww_acquire_fini() in the error code paths. Otherwise lockdep
> thinks that lock is held when lock's memory is freed after the
> drm_gem_lock_reservations() error. The ww_acquire_context needs to be
> annotated as "released", which fixes the noisy "WARNING: held lock freed!"
> splat of VirtIO-GPU driver with CONFIG_DEBUG_MUTEXES=y and enabled lockdep.
> 
> Cc: stable@vger.kernel.org
> Fixes: 7edc3e3b975b5 ("drm: Add helpers for locking an array of BO reservations.")
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

I merged this one to drm-misc-next-fixes. The other one looks like there's
still opens pending, pls resubmit appropriately (and maybe with some
analysis in the commit message of how exactly this impacts other drivers).
-Daniel

> ---
>  drivers/gpu/drm/drm_gem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index eb0c2d041f13..86d670c71286 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1226,7 +1226,7 @@ drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
>  		ret = dma_resv_lock_slow_interruptible(obj->resv,
>  								 acquire_ctx);
>  		if (ret) {
> -			ww_acquire_done(acquire_ctx);
> +			ww_acquire_fini(acquire_ctx);
>  			return ret;
>  		}
>  	}
> @@ -1251,7 +1251,7 @@ drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
>  				goto retry;
>  			}
>  
> -			ww_acquire_done(acquire_ctx);
> +			ww_acquire_fini(acquire_ctx);
>  			return ret;
>  		}
>  	}
> -- 
> 2.36.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
