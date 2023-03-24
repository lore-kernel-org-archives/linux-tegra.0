Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62B3C6FD20
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Mar 2023 10:50:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbjCXKui (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Mar 2023 06:50:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbjCXKu1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Mar 2023 06:50:27 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FCDC149BD
        for <linux-tegra@vger.kernel.org>; Fri, 24 Mar 2023 03:50:26 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id d22-20020a9d5e16000000b0069b5252ced7so662645oti.13
        for <linux-tegra@vger.kernel.org>; Fri, 24 Mar 2023 03:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1679655025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LA3Zcbbrd2EPDNxAP1qxAnsroRRZb68Sab3Jkh0P0Sc=;
        b=Ml2sbeXt/dJV+DVGdd+scTwplDkwCY6tNDAarNSO3EkTPvCC5TMw0SXUB/1GzsyHlb
         Q/hm5Fs1tVJHZiaUSjpj4ilnnjhayYRhd1Jb5N8YsoVyBUjufC8K2OsitmUyB/8AVL9F
         fH381F+xJ4iNHp8+pGopMBOJLEhExFdBuAkHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679655025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LA3Zcbbrd2EPDNxAP1qxAnsroRRZb68Sab3Jkh0P0Sc=;
        b=c3IYZYALaO2sNzc4qyIdm963iW31zhPM3oQTEVpGuNHTh6UqnW0mVe+NKl6ae1rXog
         HmlbLDncA8NnuzAkg6mUaK8aEqRF8fDHfFD3N1RTaOJTXnTEFlI/KN3AFgHdhoWOpCLW
         dLYhCjQFAI2s0XVYJnRxEe8qqN4dqM8X3tjNNCXaZ2swKB8b07Bvau9ZPcFQP3V00JN4
         h3T30xJYVDhOsVcKD81DtmbiOHMI0YMsnCpTCmmdwyEVsNYqpfeBHh2+ImiIEwL/2Ty4
         8YKcmT7ZfUZAuK/Mm1qm54ioAabvQV3NmUMsDd8XvPmqx4Vz/aVbTyIyy99V89KGyBK+
         YETA==
X-Gm-Message-State: AO0yUKVd4OP6DNJLllVS0cfi5ujc2MhvBQzF1pdjCaYS+Jaly0pXdFUk
        6/eVsw89fl5mjvpHVpiF+kDkPc1ygDqsPLW/8RjjPA==
X-Google-Smtp-Source: AK7set9XwOprmvMSZxE219+neH4dJVe0b6v5IUqmo46jRmevl4lz/+ilhJWCP96nyC4V+5+FhrFrE2HhdAGzya1YoHU=
X-Received: by 2002:a9d:4f15:0:b0:699:7d71:d2dc with SMTP id
 d21-20020a9d4f15000000b006997d71d2dcmr916625otl.6.1679655025541; Fri, 24 Mar
 2023 03:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230127221418.2522612-1-arnd@kernel.org> <Y/eULFO4jbivQ679@dev-arch.thelio-3990X>
 <20230308165644.GA1181835@dev-arch.thelio-3990X> <67f9fe7f-392a-9acd-1a4d-0a43da634367@nvidia.com>
 <ZB1xWRo0rkhku2BS@phenom.ffwll.local> <CAKMK7uF4tYyw6Eio6YkWZpBej1J8_5+VLU_hvVbL-Lnk06=v1g@mail.gmail.com>
 <ZB19rRHIeLxyzDrX@orome>
In-Reply-To: <ZB19rRHIeLxyzDrX@orome>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Fri, 24 Mar 2023 11:50:14 +0100
Message-ID: <CAKMK7uGP+n6CkMLq4N006Mctj6ta7NV3iSBt7qZiisptTBVv8w@mail.gmail.com>
Subject: Re: [PATCH] gpu: host1x: fix uninitialized variable use
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Nathan Chancellor <nathan@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 24 Mar 2023 at 11:38, Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Fri, Mar 24, 2023 at 10:59:23AM +0100, Daniel Vetter wrote:
> > On Fri, 24 Mar 2023 at 10:46, Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Wed, Mar 08, 2023 at 05:28:06PM +0000, Jon Hunter wrote:
> > > >
> > > >
> > > > On 08/03/2023 16:56, Nathan Chancellor wrote:
> > > > > Ping? This warning is now in 6.3-rc1.
> > > >
> > > > Thierry is away at the moment.
> > > >
> > > > David, Daniel, do you want to pick this up directly in the meantime as a fix
> > > > for 6.3? Mikko has already reviewed and FWIW ...
> > >
> > > Generally first fallback should be drm-misc maintainers (or anyone else
> > > with commit rights), but since this fell through cracks for weeks it seems
> > > I'll pick it up to drm-fixes now directly.
> >
> > Ok I think I found out why this fell through cracks, MAINTAINERS isn't
> > updated that host1x&tegra is maintained in drm-misc.
> >
> > John, since Thierry is out, can you pls create the MAINTAINERS patch to
> > - point at drm-misc git repo everywhere needed
> > - add any missing host1x paths to the drm-misc entry so that
> > get_maintainers.pl adds the right people for this patch (currently it
> > doesn't)
> >
> > Also should we have at least a 2nd person for tegra stuff (or well
> > maybe nvidia stuff in general) for drm-misc? Currently it's just
> > Thierry, and I don't think that's enough. Whomever gets volunteered
> > please follow
> >
> > https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html#drm-misc
>
> We never actually moved host1x and Tegra DRM to drm-misc completely.
> There's still a separate tree that feeds into linux-next. This made
> sense a while ago because there was a lot going on, but development
> speed has decreased recently, so we may want to fix that. The big
> benefit is that drm-misc is better oiled than drm-tegra, so getting
> things merged would be easier for everyone.

Hm I thought you had a split where you feed -fixes through misc and
features through tegra.git? Just listing both trees would cover that.

> I'm all in favor of adding a second Tegra person to take pick up the
> slack when necessary.

Imo features still through tegra.git with just you is fine, there's
not going to be anyone else (like ci farms) blocked if that's held up
for a bit. It's more the bugfixes where a 2nd nvidia person would be
great.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
