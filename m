Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B5C5C43217
	for <linux-tegra@archiver.kernel.org>; Tue, 18 Oct 2022 15:32:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbiJRPce (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 18 Oct 2022 11:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230436AbiJRPc3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Oct 2022 11:32:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2347EA98D8;
        Tue, 18 Oct 2022 08:32:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F177CB81FE8;
        Tue, 18 Oct 2022 15:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC9DDC43144;
        Tue, 18 Oct 2022 15:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666107139;
        bh=QX/EKb7llb6QCtdExPCwBkvhptpa3K+vuo/INCClXNs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DYulS4PmxUsNXR2nvBTvFkxjf458bejDLyltERt4EgttiUEKphVaPkbTko10Rk/fu
         Qd3j8YOZLbAW05xchAKVVR6tSvx3lnUv9aeXHfS0SOOi0efDxz8xE//NaBmLDZFAf+
         2/3Wy345G9NhNUD/dLODhflnzZi5+5GiekG5jlAUV3Drref1igak4Q98IFEt1Srd6i
         9h3f5O5d43m60Nvbj1gSEdCV0KaDRpd6xGEbzy7LiRMxXXJYhieKJws+p/MkrjFGrQ
         8+9HFsF+foUDX2PHq5Eq+x8sftWmSIhr+gX4++cfQRDJIY32og6ZAMPEC4l08oPmj+
         SUl3i8pjE3BJQ==
Received: by mail-ua1-f48.google.com with SMTP id f4so5663743uav.3;
        Tue, 18 Oct 2022 08:32:19 -0700 (PDT)
X-Gm-Message-State: ACrzQf2d5tpplEPsT8gsej5kc5C+SvLLYQunNd9TFscQTI43OZ4JEQ7H
        V8pervRthKGnuKN6cDc1J3Oecah9Va0Rvjb13A==
X-Google-Smtp-Source: AMsMyM77fSY/875/XYF2nRfIhuJTbqdgQF8AwoUuEq4yUADekjhaA9uPXi+KY0pQHENOQNzEt9XJNGVhuBror0Z7l4Q=
X-Received: by 2002:a9f:29a3:0:b0:3d6:4c6f:9d92 with SMTP id
 s32-20020a9f29a3000000b003d64c6f9d92mr1880398uas.43.1666107138562; Tue, 18
 Oct 2022 08:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221007124946.406808-1-thierry.reding@gmail.com>
 <20221007124946.406808-5-thierry.reding@gmail.com> <dd869713-6eb2-fadd-fdef-6ca155198a8c@suse.de>
 <Y01sunkDsQQQhXuC@orome> <CAL_JsqKzSife8_ob3P=KVVcQ_ny=ppMF5LsjLxvYz95roy-y2A@mail.gmail.com>
 <Y06EHB8D1ip3PVyb@orome>
In-Reply-To: <Y06EHB8D1ip3PVyb@orome>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 18 Oct 2022 10:32:09 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJGx6-wSDd=-g84dUY-=kPu5ikCyggMnTVEGMq8K7d0Jw@mail.gmail.com>
Message-ID: <CAL_JsqJGx6-wSDd=-g84dUY-=kPu5ikCyggMnTVEGMq8K7d0Jw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] drm/simpledrm: Add support for system memory framebuffers
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Oct 18, 2022 at 5:47 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Mon, Oct 17, 2022 at 01:15:59PM -0500, Rob Herring wrote:
> > On Mon, Oct 17, 2022 at 9:54 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> > >
> > > On Mon, Oct 10, 2022 at 10:12:34AM +0200, Thomas Zimmermann wrote:
> > > > Hi
> > > >
> > > > Am 07.10.22 um 14:49 schrieb Thierry Reding:
> > > > > From: Thierry Reding <treding@nvidia.com>
> > > > >
> > > > > Simple framebuffers can be set up in system memory, which cannot be
> > > > > requested and/or I/O remapped using the I/O resource helpers. Add a
> > > > > separate code path that obtains system memory framebuffers from the
> > > > > reserved memory region referenced in the memory-region property.
> > > > >
> > > > > v2: make screen base a struct iosys_map to avoid sparse warnings
> >
> > [...]
> >
> > > > > +static int simple_framebuffer_init(struct reserved_mem *rmem)
> > > > > +{
> > > > > +   pr_info("framebuffer memory at %pa, size %lu bytes\n", &rmem->base,
> > > > > +           (unsigned long)rmem->size);
> > > > > +
> > > > > +   rmem->ops = &simple_framebuffer_ops;
> > > > > +
> > > > > +   return 0;
> > > > > +}
> > > > > +RESERVEDMEM_OF_DECLARE(simple_framebuffer, "framebuffer", simple_framebuffer_init);
> > > >
> > > > What's the prupose of these code at all?  I looked through the kernel, but
> > > > there aren't many other examples of it.
> > >
> > > This is a fairly standard construct to deal with early memory
> > > reservations. What happens is roughly this: during early kernel boot,
> > > the reserved-memory core code will iterate over all children of the top-
> > > level reserved-memory node and see if they have a compatible string that
> > > matches one of the entries in the table created by these
> > > RESERVEDMEM_OF_DECLARE entries. It will then call the init function for
> > > a matched entry and register a struct reserved_mem for these. The init
> > > function in this case just dumps an informational message to the boot
> > > log to provide some information about the framebuffer region that was
> > > reserved (which can be used for example for troubleshooting purposes)
> > > and sets the device init/release operations (which will be called when a
> > > device is associated with the reserved memory region, i.e. when the
> > > of_reserved_mem_device_init_by_idx() function is called).
> > >
> > > The reason why there aren't many examples of this is because these are
> > > special memory regions that (at least upstream) kernels seldom support.
> > > Perhaps the most common use-cases are the shared DMA pools (such as
> > > CMA).
> >
> > Also, not all regions need to be handled 'early' before slab allocator
> > or drivers are probed. Do you need early handling here? I can't see
> > why other than if fbcon is up early.
>
> No, I don't think this needs early handling. Obviously we want this to
> be available as soon as possible, but since the framebuffer driver is
> built on top of DRM and that all becomes available fairly late, I don't
> think this could ever run *that* early.
>
> So are you saying that in general if we don't need early handling we
> should avoid RESERVEDMEM_OF_DECLARE and instead manually resolve the
> memory regions and inspect them? In other words, RESERVEDMEM_OF_DECLARE
> should only ever be used when this early handling is needed?

Right. Like all the other *_OF_DECLARE() macros, they are only for
when needed before driver probe time. Lots of shared memory mailbox
drivers use reserved-memory regions if you need examples.

Rob
