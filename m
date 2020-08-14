Return-Path: <SRS0=fbtN=BY=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B3D3C433E1
	for <linux-tegra@archiver.kernel.org>; Fri, 14 Aug 2020 12:12:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73BB1208E4
	for <linux-tegra@archiver.kernel.org>; Fri, 14 Aug 2020 12:12:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="SshzTGVT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbgHNMMw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 14 Aug 2020 08:12:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbgHNMMv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 Aug 2020 08:12:51 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3EB8C061385
        for <linux-tegra@vger.kernel.org>; Fri, 14 Aug 2020 05:12:50 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id c4so7331546otf.12
        for <linux-tegra@vger.kernel.org>; Fri, 14 Aug 2020 05:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pealV+VydqDZW06bmrAL2YWzJvMklEWwyLNagmsldhI=;
        b=SshzTGVTX9qSp4jXsV9wNHDUrUp0DTAC7I1wEKGvJcu+kWKbql/3afrqqWf5m0DhfS
         3AhB0fxrKzQLTMmhw8HURKJZeQYmZ2sRJjjMexL45rjDuZBGRxkaak+c74FTfGiWIL4N
         4osh+nq1UXZGhhgnSm7T9BepqjYyjWlQTKP4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pealV+VydqDZW06bmrAL2YWzJvMklEWwyLNagmsldhI=;
        b=j6trK3oUXYsKd66mGH/csRi9PlNkcGiET/3p+4K8Eq/rboInfUKOnN7jjJDwPYTrCd
         NBcyb+ZsOObPhnzNpo2gh21zSPaGCa9u4RuBdF1ygf8wTFXvebbkUFUTcjaEgjpPjYtV
         Z3wPJiB3FB/9O5v9BYBjg25JXfJkmnQW5rCP7F96Zzrhdy9VHEk9mBl3UuUVMDmQYedb
         WYfBP3m34pY+HjR7SUjVp2MdBoL0cjrq2zHqpLqnTdwGQhIBzaRDgdoYj4mPpe0RWtt8
         7vwyxpM1hZF2sYuVh1/LkgkbgDmpRQlQ0Dj3USa0szEOzW5M32T52YjyDhWAVMHP0v6W
         dBLA==
X-Gm-Message-State: AOAM530scn7nEWiR2PtOimAwkwMmP1gqGklXZuFIznMFXxGDhN8Db7kp
        E+SbWj0wi/jLP75tgwzawBdOgnAP2wQd+ytNUk0UbYUCbpQ=
X-Google-Smtp-Source: ABdhPJzjIk+koLVPuyqLeA1q3XTupnXm3QaHEKeMDW+mnwE9sPDMUOhSRRI5znL0kjiqqjI+AojPRr1bQ3FPyNkRa/U=
X-Received: by 2002:a05:6830:1e71:: with SMTP id m17mr1780869otr.188.1597407169658;
 Fri, 14 Aug 2020 05:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <57062477-30e7-a3de-6723-a50d03a402c4@kapsi.fi>
In-Reply-To: <57062477-30e7-a3de-6723-a50d03a402c4@kapsi.fi>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Fri, 14 Aug 2020 14:12:38 +0200
Message-ID: <CAKMK7uEatNdZ64QmGXLY3GCqDquAr0rcTFF0006K7+L_vySYzg@mail.gmail.com>
Subject: Re: Role of DMA Heaps vs GEM in allocation
To:     Mikko Perttunen <cyndis@kapsi.fi>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Aug 14, 2020 at 1:34 PM Mikko Perttunen <cyndis@kapsi.fi> wrote:
>
> Hi,
>
> I'm currently working on a new UAPI for Host1x/TegraDRM (see first draft
> in thread "[RFC] Host1x/TegraDRM UAPI"[1]). One question that has come
> up is regarding the buffer allocation mechanism. Traditionally, DRM
> drivers provide custom GEM allocation IOCTLs. However, we now have DMA
> Heaps, which would be sufficient for TegraDRM's needs, so we could skip
> implementing any GEM IOCTLs in the TegraDRM UAPI, and rely on importing
> DMA-BUFs. This would mean less code on TegraDRM's side.
>
> However, one complication with using DMA Heaps is that it only provides
> DMA-BUF FDs, so it is possible that a user application could run out of
> free file descriptors if it is not adjusting its soft FD limit. This
> would especially be a problem for existing applications that might have
> worked with the traditional GEM model and didn't need to adjust their FD
> limits, but would then fail in some situations with the increased FD
> usage of DMA-BUF FDs.
>
> My question is then: what is the role of DMA Heaps? If it is to be used
> as a central allocator, should the FD issue be left to the application,
> or addressed somehow? Should it be considered a potential alternative
> for GEM allocations?

Atm no one knows. What's for sure is that dma-buf fd are meant to
establish sharing, and then once imported everywhere, closed again.
dma-buf heaps might or might be useful for sharing the cross-device
memory allocator problem (the rough idea is that in sysfs every device
lists all the heaps it can use, and then you pick the common one that
works for all devices). But that's for shared buffers only.

For an acceleration driver you want drm gem ids, because yes fd
limits. Also constantly having to reimport dma-buf for every cs ioctl
doesn't sound like a bright idea either, there's a reason we have the
drm_prime cache and all that stuff.

I have also no idea why you wouldn't want to use the existing drm
infrastructure, it's all there.

Cheers, Daniel

>
> Thanks,
> Mikko
>
> [1] https://www.spinics.net/lists/dri-devel/msg262021.html
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
