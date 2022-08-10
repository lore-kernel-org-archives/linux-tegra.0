Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24585C00140
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Aug 2022 08:34:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231639AbiHJIeL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 10 Aug 2022 04:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231682AbiHJIdk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Aug 2022 04:33:40 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D33E58B40
        for <linux-tegra@vger.kernel.org>; Wed, 10 Aug 2022 01:33:34 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id p132so16864061oif.9
        for <linux-tegra@vger.kernel.org>; Wed, 10 Aug 2022 01:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=qng18ezuViFS4JHv1suUwHMOD3dA0ddp/TS8ruYkzxY=;
        b=Xo7HewGoXQ93vdJ673ZkR+tcoUdDl9VfPro55Vby9VrJvIMSVQRWW+l8IzswksIecM
         FJ23GJpiXQh/pyuvnpU5g3iQbV02xodcvNiDJwDMgL67ZXX2fNtmG9OBAvT/AJiLKz1O
         m57OQJzScr8ptLkEC3wAZsB50Mtf/5dHx8myw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=qng18ezuViFS4JHv1suUwHMOD3dA0ddp/TS8ruYkzxY=;
        b=NO6IjfBnWACsT5AexKKm7zCq6Y3xF0qgsj1Xn4iJ8J+M7eGWyDsfKInNBLpk5AD7kK
         ANt1AycIBPG5Rhp1bZf5GZg4awU8ZYrVrSrlwlQiMXwi/Kqgo4FzskQTfHcFMpINtdIK
         VO4hP6DxXEOyEtkNL6YPRLnzk1mDqT0MqNDP0KaPyVur18x08FAUlyGco460ArUS3JoC
         6JZkNhADL/3ihjV/cTQQc83DyP/lxOFrKcfUa1PFJrkG05aZagRHBHqEQRBYIxVzrYp3
         b2iRRkH7NyxTeXnBEQJ651rzCLBDKLqHwgvzKAxB4+1z+rbFJRI0FlDAKCGAHqZ9lchX
         sC0Q==
X-Gm-Message-State: ACgBeo02fwHGDtdugumSe8BOELkoh6+2oNJ1ZjTLE/diZPF0i3L8bcRR
        1eoeDXKUCbpTI6DqkWProOdkQ1oR5dazZYeBmIuLzg==
X-Google-Smtp-Source: AA6agR6cStCNNsa+U2EXzNpks0Z071z2RD/SJln63AZJsOezVgSlE5S5WcCDeNCK/XxqGOBfJDhs4RSMetdDlNSIpBY=
X-Received: by 2002:a05:6808:1489:b0:33a:861c:838e with SMTP id
 e9-20020a056808148900b0033a861c838emr895072oiw.228.1660120413972; Wed, 10 Aug
 2022 01:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220701090240.1896131-1-dmitry.osipenko@collabora.com>
 <20220701090240.1896131-2-dmitry.osipenko@collabora.com> <a42237c9-6304-4b06-cede-2175c7e7b87d@amd.com>
 <YvKO5r5Sr56e9vBf@phenom.ffwll.local> <e760f555-7f2d-dea9-70b2-c0881adc3afc@amd.com>
In-Reply-To: <e760f555-7f2d-dea9-70b2-c0881adc3afc@amd.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 10 Aug 2022 10:33:22 +0200
Message-ID: <CAKMK7uEd1xX6P4YRgYOfjvqpwVmQ0YZPkHdK=4auwrkBE9CEzQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] drm/gem: Properly annotate WW context on
 drm_gem_lock_reservations() error
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        David Airlie <airlied@linux.ie>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Chia-I Wu <olvaffe@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, kernel@collabora.com,
        virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 10 Aug 2022 at 08:52, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> Am 09.08.22 um 18:44 schrieb Daniel Vetter:
> > On Tue, Jul 05, 2022 at 01:33:51PM +0200, Christian K=C3=B6nig wrote:
> >> Am 01.07.22 um 11:02 schrieb Dmitry Osipenko:
> >>> Use ww_acquire_fini() in the error code paths. Otherwise lockdep
> >>> thinks that lock is held when lock's memory is freed after the
> >>> drm_gem_lock_reservations() error. The ww_acquire_context needs to be
> >>> annotated as "released", which fixes the noisy "WARNING: held lock fr=
eed!"
> >>> splat of VirtIO-GPU driver with CONFIG_DEBUG_MUTEXES=3Dy and enabled =
lockdep.
> >>>
> >>> Cc: stable@vger.kernel.org
> >>> Fixes: 7edc3e3b975b5 ("drm: Add helpers for locking an array of BO re=
servations.")
> >>> Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Also added this r-b tag when merging to drm-misc-next-fixes.
>
> IIRC I've already pushed this to drm-misc-fixes with a CC stable tag
> about 2 weeks ago.
>
> Please double check, it probably just hasn't come down the stream again y=
et.

Hm quickly check and I didn't spot it? There's a few patches from
Dmitry in the last few pulls, and some more stuff pending, but not
these two afaics?
-Daniel

>
> Christian.
>
> > -Daniel
> >
> >>> ---
> >>>    drivers/gpu/drm/drm_gem.c | 4 ++--
> >>>    1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> >>> index eb0c2d041f13..86d670c71286 100644
> >>> --- a/drivers/gpu/drm/drm_gem.c
> >>> +++ b/drivers/gpu/drm/drm_gem.c
> >>> @@ -1226,7 +1226,7 @@ drm_gem_lock_reservations(struct drm_gem_object=
 **objs, int count,
> >>>             ret =3D dma_resv_lock_slow_interruptible(obj->resv,
> >>>                                                              acquire_=
ctx);
> >>>             if (ret) {
> >>> -                   ww_acquire_done(acquire_ctx);
> >>> +                   ww_acquire_fini(acquire_ctx);
> >>>                     return ret;
> >>>             }
> >>>     }
> >>> @@ -1251,7 +1251,7 @@ drm_gem_lock_reservations(struct drm_gem_object=
 **objs, int count,
> >>>                             goto retry;
> >>>                     }
> >>> -                   ww_acquire_done(acquire_ctx);
> >>> +                   ww_acquire_fini(acquire_ctx);
> >>>                     return ret;
> >>>             }
> >>>     }
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
