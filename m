Return-Path: <SRS0=rHad=D3=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E25BC433E7
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Oct 2020 11:40:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90B562224B
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Oct 2020 11:40:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="kUxMXXT+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393471AbgJTLkg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Oct 2020 07:40:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393470AbgJTLkf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Oct 2020 07:40:35 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01F87C061755
        for <linux-tegra@vger.kernel.org>; Tue, 20 Oct 2020 04:40:33 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id n3so1819860oie.1
        for <linux-tegra@vger.kernel.org>; Tue, 20 Oct 2020 04:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xMX7MNCWZjl9PP8Rm7CjZAvBjAWz5zpwC20q/M6z71s=;
        b=kUxMXXT+EDFVWag4WZq9cgBI5uuAebK9+BipbDBIWez14jK1A9PCMBlSQ27pa1+Ptq
         sfKHA4/b9d9C7SYhMMU4uJedsH5bI70Rjl2w0n2XEIv/b+lftqDOsoOT65iZ/S8WBjVi
         Ir7EThjY7xGbxidsrp8/ODzIyQTMH2mxKlkv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xMX7MNCWZjl9PP8Rm7CjZAvBjAWz5zpwC20q/M6z71s=;
        b=n1Nlxa5tNFBBrzhleG93Na3klOfWUifF1yp2Pve1C4m/cfVx5T6iCIQrcaSYvnL3RT
         mdMN1SnYBiF02zjYD9JTbPiP8BzMp/EPIIgpBbM2zKFLNadhlc35OdlJO2CCre+cSH75
         YpBoSHuOv8Oi1YFhAR6+wqhaLy+NTvSbbLw4Ci0pE2kCzjQ0iP5byFO2YXuI5wSNhV7S
         KNyANVL/XMCHZTOlQmTtfbjMzOMrmxF8DNEVXyrm9QmM168stmqP4xV5FReadvvAjSsk
         T3040TZiBud1oY7/u8Ur3OWywfNMOAeaJZW22infDvcYzoUTkqz8dRKTvOOx/38Za/d4
         pi1g==
X-Gm-Message-State: AOAM530ZXeVOTc10mhbdHQXSrgNz8r+NVDU7C5EDUw1CjMx8lbJ/r86R
        JwjLqiyf8fMToDQ3iTATqIpo8yA9LbLRnk0l/d9y5A==
X-Google-Smtp-Source: ABdhPJzVzUVjFbHV43pokPGDC+2R9dXIhmSjLmp8+cMpFSCiTmcFymsX6Re44FboW91u/vpEnxEF2HXWp/DwiUlAt4g=
X-Received: by 2002:aca:39d6:: with SMTP id g205mr1520167oia.14.1603194033341;
 Tue, 20 Oct 2020 04:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
 <20201007171238.1795964-20-mperttunen@nvidia.com> <dd13ec2c-1e01-ca61-656c-b23b156b100f@gmail.com>
 <b33a5084-7dc3-a865-2f36-274ecebf2ee7@kapsi.fi> <1f3267a9-37b4-2cff-08a2-2ca7c905ce01@gmail.com>
In-Reply-To: <1f3267a9-37b4-2cff-08a2-2ca7c905ce01@gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 20 Oct 2020 13:40:21 +0200
Message-ID: <CAKMK7uFWyMZQauakjzSWa9r494R4JKDkAk6ABZOLLsCXb6_yHg@mail.gmail.com>
Subject: Re: [PATCH v3 19/20] drm/tegra: Implement new UAPI
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Dave Airlie <airlied@linux.ie>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>, talho@nvidia.com,
        bhuntsman@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Oct 19, 2020 at 7:27 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 19.10.2020 11:13, Mikko Perttunen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On 10/19/20 5:21 AM, Dmitry Osipenko wrote:
> >> 07.10.2020 20:12, Mikko Perttunen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> +int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data,
> >>> +                struct drm_file *file)
> >>> +{
> >>
> >> Hello, Mikko!
> >>
> >> Could you please tell what are the host1x clients that are going to be
> >> upstreamed and will need this IOCTL?
> >>
> >
> > Hi Dmitry!
> >
> > It is needed for any engine/job that wants to access memory, as this
> > IOCTL must be used to map memory for the engine. So all of them.
> >
> > Downstream doesn't have an equivalent IOCTL because it (currently) does
> > mapping at submit time, but that is suboptimal because
> >
> > - it requires doing relocations in the kernel which isn't required for
> > T186+
> > - it's a big performance penalty, due to which the downstream kernel ha=
s
> > the "deferred dma-buf unmapping" feature, where unmapping a dma_buf may
> > not immediately unmap it in case it's used later, so that the "mapping"
> > later is faster. A feature which we'd preferably get rid of.
> > - because of the above feature not being controlled by the user, it can
> > cause variance in submit times.
> >
> > On the other hand, we cannot (at least always) do the mapping at
> > allocation/import time, because
> >
> > - A single FD may have multiple channel_ctx's, and an allocation/import
> > may need to be used in any subset of them
> > - The import IOCTL is fixed and doesn't have the parameters we'd need t=
o
> > do this at import time
> > - Overall it's more orthogonal to have GEM object acquirement in one
> > step and mapping in another.
> >
> > Maybe that's not quite what you asked, but it's some background anyway =
:)
>
> I'm asking this question because right now there is only one potential
> client for this IOCTL, the VIC. If other clients aren't supposed to be a
> part of the DRM driver, like for example NVDEC which probably should be
> a V4L driver, then DRM driver will have only a single VIC and in this
> case we shouldn't need this IOCTL because DRM and V4L should use generic
> dmabuf API for importing and exporting buffers.

Randomly jumping in here ...

So if you have a drm driver with userspace in mesa3d already, the
usual approach is to have a libva implementation (ideally in mesa3d
too, using the gallium framework so that a lot of the boring
integration glue is taken care of already) directly on top of drm. No
v4l driver needed at all here.

And it sounds like this nvdec thing would fit that bill pretty neatly.

> I'm also not quite sure about whether the current model of the unified
> Tegra DRM driver is suitable for having the separated engines. Perhaps
> each separated engine should just have its own rendering node?

Above model using libva driver in userspace for nvdec would avoid this
issue too.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
