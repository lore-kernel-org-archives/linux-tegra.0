Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9419C19F2D
	for <linux-tegra@archiver.kernel.org>; Tue,  9 Aug 2022 16:44:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244645AbiHIQo3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 9 Aug 2022 12:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244627AbiHIQo2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 9 Aug 2022 12:44:28 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E2F81FCC8
        for <linux-tegra@vger.kernel.org>; Tue,  9 Aug 2022 09:44:27 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id c187-20020a1c35c4000000b003a30d88fe8eso9203264wma.2
        for <linux-tegra@vger.kernel.org>; Tue, 09 Aug 2022 09:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc;
        bh=kG73ZFGwpqA9MEsaOhGxOyq0S5W0g/PKck6MJrQJjh4=;
        b=IjvlDT3GgnKcWar5hWlV3kmPtlMIw3szkL6RRUTSuwPJE7rdHudxhXegyQLbP/fx1M
         NhNiueI3flr6TSRZBFjxGWtzcrHT0mmP3lo5PnjVx5SsmwuMN8QhC2d/mki5v4qH7HDx
         8w91tH2jhqzru340MMXj1N/ZvULmrkBUYw3Is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc;
        bh=kG73ZFGwpqA9MEsaOhGxOyq0S5W0g/PKck6MJrQJjh4=;
        b=OiCnwuEcG0X9rHNaspI2RoljsyAygrTDsnI+RzIf3zbVk8hechJnSBRSkHeKRBeTqM
         kWsBAwwc3Es7oa9jQfaUQBB79YPYom4lGx6CQbBgw+rt6cCkjSkyHTUK4yXoJVPF1xkZ
         D2tABOr1PsvXOsZcYeK3h9rci9IppR3EBSp48QcfmVW7eLuMRcrh+OqVFW+eo+XKgMTn
         60SZQrODX+I3dRMNCzmyxlgmyL1IppMdWlsKVggTyRBddrwvScn/XjyeqOkSdGzpw6BY
         X3HHX+HGYgb0QkszcMjcsZ16Vj3uzeauLC1YwUr8Kn1J66AnOCtM8jEOBVCxIMISSW8Z
         vFLg==
X-Gm-Message-State: ACgBeo01TrcX45SpZ8E22GN8PHI32BeCuZBREOif9ilMGaoJvy8VBwbR
        QfTrDs/xxLWHnpMaAKyVKuST8w==
X-Google-Smtp-Source: AA6agR7Mh8M3suAF/jwjxN+ICA7FrHXNw3HuqSciA+CCbg9rxGZ4/Yyg824wTV/ciSBKOP3NeoJYRQ==
X-Received: by 2002:a1c:f60f:0:b0:3a0:3e0c:1de1 with SMTP id w15-20020a1cf60f000000b003a03e0c1de1mr21550404wmc.56.1660063465672;
        Tue, 09 Aug 2022 09:44:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id h19-20020a05600c351300b003a501ad8648sm18098101wmq.40.2022.08.09.09.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 09:44:25 -0700 (PDT)
Date:   Tue, 9 Aug 2022 18:44:22 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        David Airlie <airlied@linux.ie>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas_os@shipmail.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, kernel@collabora.com,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v8 1/2] drm/gem: Properly annotate WW context on
 drm_gem_lock_reservations() error
Message-ID: <YvKO5r5Sr56e9vBf@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Chia-I Wu <olvaffe@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas_os@shipmail.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org,
        kernel@collabora.com, virtualization@lists.linux-foundation.org
References: <20220701090240.1896131-1-dmitry.osipenko@collabora.com>
 <20220701090240.1896131-2-dmitry.osipenko@collabora.com>
 <a42237c9-6304-4b06-cede-2175c7e7b87d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a42237c9-6304-4b06-cede-2175c7e7b87d@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jul 05, 2022 at 01:33:51PM +0200, Christian König wrote:
> Am 01.07.22 um 11:02 schrieb Dmitry Osipenko:
> > Use ww_acquire_fini() in the error code paths. Otherwise lockdep
> > thinks that lock is held when lock's memory is freed after the
> > drm_gem_lock_reservations() error. The ww_acquire_context needs to be
> > annotated as "released", which fixes the noisy "WARNING: held lock freed!"
> > splat of VirtIO-GPU driver with CONFIG_DEBUG_MUTEXES=y and enabled lockdep.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 7edc3e3b975b5 ("drm: Add helpers for locking an array of BO reservations.")
> > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>

Also added this r-b tag when merging to drm-misc-next-fixes.
-Daniel

> 
> > ---
> >   drivers/gpu/drm/drm_gem.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index eb0c2d041f13..86d670c71286 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -1226,7 +1226,7 @@ drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
> >   		ret = dma_resv_lock_slow_interruptible(obj->resv,
> >   								 acquire_ctx);
> >   		if (ret) {
> > -			ww_acquire_done(acquire_ctx);
> > +			ww_acquire_fini(acquire_ctx);
> >   			return ret;
> >   		}
> >   	}
> > @@ -1251,7 +1251,7 @@ drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
> >   				goto retry;
> >   			}
> > -			ww_acquire_done(acquire_ctx);
> > +			ww_acquire_fini(acquire_ctx);
> >   			return ret;
> >   		}
> >   	}
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
