Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE26C433FE
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Oct 2022 18:16:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbiJQSQP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 Oct 2022 14:16:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbiJQSQN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Oct 2022 14:16:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A867974B95;
        Mon, 17 Oct 2022 11:16:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 689AAB819DC;
        Mon, 17 Oct 2022 18:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC24C433D6;
        Mon, 17 Oct 2022 18:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666030570;
        bh=bC+/cya3KMQ7ZR+S6dM4jCfaG/o95my92WsHxec/tmM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Im0QvOQkcDh9n/LSlegRTaIMhk5lyz2BSvjq5rvEsDq0IG7qKGQN20KDnI3i79h38
         MUrrpL5+lJJ8X2RG8JTGEvkUdp02CHhQ20z8AXwx9CxWx35ninpuctfnlCGT/X4FFJ
         Jk+XYZB1BjGW5r9eIgE50k86kgGBb1WxUQb4YkaSLOw3qyQMhKQh+1HTlz2dZppMJu
         NCsJ6Y062GuIMf+C6o6uYfzWTOTrQqi6XEwlXcyBB8CdNFoOIhBAecUpt4lyNM24Eq
         mTWxjf8Rousv0+85TXufRq2Ngwx+sK+xxPDUYaowtpQmfhLsYH5qw7EaNr2v+ChHFh
         /cax+mCkLrGmg==
Received: by mail-vs1-f48.google.com with SMTP id h29so12325617vsq.9;
        Mon, 17 Oct 2022 11:16:09 -0700 (PDT)
X-Gm-Message-State: ACrzQf03ppCdOs8Be/HcRLpigamMwnteZBtX0kdliGBJQQNXsmr1FvWb
        Y4PDSnJzffgJwOUQK67YlKNYaqBqPO9SCtE21Q==
X-Google-Smtp-Source: AMsMyM7chLsN+79vZUm6IwwIyOYTUmu0e5xkXf8cjzjCxvNdC3kO2CvscxuAQOwHWh/CFI3aR3PwKfF6K+NsaTmlV0c=
X-Received: by 2002:a67:e19a:0:b0:3a7:6b54:cc63 with SMTP id
 e26-20020a67e19a000000b003a76b54cc63mr5305559vsl.26.1666030568947; Mon, 17
 Oct 2022 11:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20221007124946.406808-1-thierry.reding@gmail.com>
 <20221007124946.406808-5-thierry.reding@gmail.com> <dd869713-6eb2-fadd-fdef-6ca155198a8c@suse.de>
 <Y01sunkDsQQQhXuC@orome>
In-Reply-To: <Y01sunkDsQQQhXuC@orome>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 17 Oct 2022 13:15:59 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKzSife8_ob3P=KVVcQ_ny=ppMF5LsjLxvYz95roy-y2A@mail.gmail.com>
Message-ID: <CAL_JsqKzSife8_ob3P=KVVcQ_ny=ppMF5LsjLxvYz95roy-y2A@mail.gmail.com>
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

On Mon, Oct 17, 2022 at 9:54 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Mon, Oct 10, 2022 at 10:12:34AM +0200, Thomas Zimmermann wrote:
> > Hi
> >
> > Am 07.10.22 um 14:49 schrieb Thierry Reding:
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > Simple framebuffers can be set up in system memory, which cannot be
> > > requested and/or I/O remapped using the I/O resource helpers. Add a
> > > separate code path that obtains system memory framebuffers from the
> > > reserved memory region referenced in the memory-region property.
> > >
> > > v2: make screen base a struct iosys_map to avoid sparse warnings

[...]

> > > +static int simple_framebuffer_init(struct reserved_mem *rmem)
> > > +{
> > > +   pr_info("framebuffer memory at %pa, size %lu bytes\n", &rmem->base,
> > > +           (unsigned long)rmem->size);
> > > +
> > > +   rmem->ops = &simple_framebuffer_ops;
> > > +
> > > +   return 0;
> > > +}
> > > +RESERVEDMEM_OF_DECLARE(simple_framebuffer, "framebuffer", simple_framebuffer_init);
> >
> > What's the prupose of these code at all?  I looked through the kernel, but
> > there aren't many other examples of it.
>
> This is a fairly standard construct to deal with early memory
> reservations. What happens is roughly this: during early kernel boot,
> the reserved-memory core code will iterate over all children of the top-
> level reserved-memory node and see if they have a compatible string that
> matches one of the entries in the table created by these
> RESERVEDMEM_OF_DECLARE entries. It will then call the init function for
> a matched entry and register a struct reserved_mem for these. The init
> function in this case just dumps an informational message to the boot
> log to provide some information about the framebuffer region that was
> reserved (which can be used for example for troubleshooting purposes)
> and sets the device init/release operations (which will be called when a
> device is associated with the reserved memory region, i.e. when the
> of_reserved_mem_device_init_by_idx() function is called).
>
> The reason why there aren't many examples of this is because these are
> special memory regions that (at least upstream) kernels seldom support.
> Perhaps the most common use-cases are the shared DMA pools (such as
> CMA).

Also, not all regions need to be handled 'early' before slab allocator
or drivers are probed. Do you need early handling here? I can't see
why other than if fbcon is up early.

Rob
