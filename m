Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DB1C6FD20
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Mar 2023 09:46:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231395AbjCXJqf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Mar 2023 05:46:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231504AbjCXJqK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Mar 2023 05:46:10 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A675F252A8
        for <linux-tegra@vger.kernel.org>; Fri, 24 Mar 2023 02:46:05 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so561450wmq.3
        for <linux-tegra@vger.kernel.org>; Fri, 24 Mar 2023 02:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1679651164;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gJJPNwdnhB7IEUXT0JnB6iYS0mxcFwN9Ppf5t8hZzl0=;
        b=Qa5OozZIoo53C5F+9azNMKZ21DB0vyydBQZAXgS8Chw91SQ1BJh/YnRGO1VlHf+QDW
         NqJGq+76prl0S1xv0UN00iYF2Bcwn9MwJ2u+hl338DaU0W7zfnh0k0xaTP+snNZR8wXB
         NVhLlHPLJoaHlxMr4jMkL1ELSluWeVhWBZxTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679651164;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gJJPNwdnhB7IEUXT0JnB6iYS0mxcFwN9Ppf5t8hZzl0=;
        b=VN8tOQ9Cw0ouKLuIZL6mBULXSS8mIWQ59G5sGOwO/aJl9u+cZDRUtApUg4/CPZvxI9
         xOuLp+993StQWnMmPzyNfG29T10RCyqNG6Ne02TP8Sxx6uiT323B9qrs1cExogGoFzHx
         lKgAX+qdehC3vX1fjRMnkDVeL/xoNwqVC8ftFlTjJUNvPtqJ+H2N5FB74D0gQpWTTu9x
         8xI3N7tAAW6crXrNhG0a4UCHjAcjNC1BBq7lmEwOLLq63Ex05CPG3N+oqV+FppvhnVqw
         b2PNzhh/9xo6CCoQhRaPW3hI49I5ah6AVzB2f8LElZsAHcwrl9fRmQVmN0SLaRRZcBIx
         3e0Q==
X-Gm-Message-State: AO0yUKU/x1xyZ9030q3ng8takGEYrUddED6xldTcr823vVmiSvjkJjhJ
        vrBAKHp1Mxwdk/Ef87bAN4SI9/yzcOjwRQaPEX8=
X-Google-Smtp-Source: AK7set/XwgOJNEXGcex+NV0vGUZdreitg2m5Y+Upud+kwI0Y7U+h+kwJ6hiaNA1oq8/pyWeh2R5p1g==
X-Received: by 2002:a05:600c:4fc1:b0:3ed:2a41:8529 with SMTP id o1-20020a05600c4fc100b003ed2a418529mr1438389wmq.2.1679651164092;
        Fri, 24 Mar 2023 02:46:04 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id 14-20020a05600c024e00b003ed2384566fsm4369256wmj.21.2023.03.24.02.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 02:46:03 -0700 (PDT)
Date:   Fri, 24 Mar 2023 10:46:01 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] gpu: host1x: fix uninitialized variable use
Message-ID: <ZB1xWRo0rkhku2BS@phenom.ffwll.local>
Mail-Followup-To: Jon Hunter <jonathanh@nvidia.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, Mikko Perttunen <mperttunen@nvidia.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230127221418.2522612-1-arnd@kernel.org>
 <Y/eULFO4jbivQ679@dev-arch.thelio-3990X>
 <20230308165644.GA1181835@dev-arch.thelio-3990X>
 <67f9fe7f-392a-9acd-1a4d-0a43da634367@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67f9fe7f-392a-9acd-1a4d-0a43da634367@nvidia.com>
X-Operating-System: Linux phenom 6.1.0-6-amd64 
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Mar 08, 2023 at 05:28:06PM +0000, Jon Hunter wrote:
> 
> 
> On 08/03/2023 16:56, Nathan Chancellor wrote:
> > Ping? This warning is now in 6.3-rc1.
> 
> Thierry is away at the moment.
> 
> David, Daniel, do you want to pick this up directly in the meantime as a fix
> for 6.3? Mikko has already reviewed and FWIW ...

Generally first fallback should be drm-misc maintainers (or anyone else
with commit rights), but since this fell through cracks for weeks it seems
I'll pick it up to drm-fixes now directly.
-Daniel

> 
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> 
> Thanks
> Jon
> 
> 
> > On Thu, Feb 23, 2023 at 09:28:28AM -0700, Nathan Chancellor wrote:
> > > Hi Thierry, Daniel, and David,
> > > 
> > > On Fri, Jan 27, 2023 at 11:14:00PM +0100, Arnd Bergmann wrote:
> > > > From: Arnd Bergmann <arnd@arndb.de>
> > > > 
> > > > The error handling for platform_get_irq() failing no longer
> > > > works after a recent change, clang now points this out with
> > > > a warning:
> > > > 
> > > > drivers/gpu/host1x/dev.c:520:6: error: variable 'syncpt_irq' is uninitialized when used here [-Werror,-Wuninitialized]
> > > >          if (syncpt_irq < 0)
> > > >              ^~~~~~~~~~
> > > > 
> > > > Fix this by removing the variable and checking the correct
> > > > error status.
> > > > 
> > > > Fixes: 625d4ffb438c ("gpu: host1x: Rewrite syncpoint interrupt handling")
> > > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > > > ---
> > > >   drivers/gpu/host1x/dev.c | 5 ++---
> > > >   1 file changed, 2 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> > > > index 4872d183d860..aae2efeef503 100644
> > > > --- a/drivers/gpu/host1x/dev.c
> > > > +++ b/drivers/gpu/host1x/dev.c
> > > > @@ -487,7 +487,6 @@ static int host1x_get_resets(struct host1x *host)
> > > >   static int host1x_probe(struct platform_device *pdev)
> > > >   {
> > > >   	struct host1x *host;
> > > > -	int syncpt_irq;
> > > >   	int err;
> > > >   	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
> > > > @@ -517,8 +516,8 @@ static int host1x_probe(struct platform_device *pdev)
> > > >   	}
> > > >   	host->syncpt_irq = platform_get_irq(pdev, 0);
> > > > -	if (syncpt_irq < 0)
> > > > -		return syncpt_irq;
> > > > +	if (host->syncpt_irq < 0)
> > > > +		return host->syncpt_irq;
> > > >   	mutex_init(&host->devices_lock);
> > > >   	INIT_LIST_HEAD(&host->devices);
> > > > -- 
> > > > 2.39.0
> > > > 
> > > 
> > > Apologies if this has been reported already or has a solution in
> > > progress but mainline is now broken because this change got separated
> > > from the change it is fixing:
> > > 
> > > https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/4249931209/jobs/7391912774
> > > https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integration2/builds/2M7y9HpiXB13qiC2mkHMyeZOcLW/build.log
> > > 
> > > I see this change sitting in the drm-tegra tree [1], which is getting
> > > merged into -next, so it is fixed there, which is why we did not notice
> > > any issues until the drm-next tree was merged into mainline. Can this be
> > > fast tracked to Linus to unbreak clang builds with -Werror?
> > > 
> > > [1]: https://gitlab.freedesktop.org/drm/tegra/-/commit/b9930311641cf2ed905a84aabe27e8f3868aee4a
> 
> -- 
> nvpublic

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
