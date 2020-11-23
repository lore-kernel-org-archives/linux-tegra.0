Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F08C63777
	for <linux-tegra@archiver.kernel.org>; Mon, 23 Nov 2020 03:08:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E716F2168B
	for <linux-tegra@archiver.kernel.org>; Mon, 23 Nov 2020 03:08:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=vanguardiasur-com-ar.20150623.gappssmtp.com header.i=@vanguardiasur-com-ar.20150623.gappssmtp.com header.b="y7kbd8EC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbgKWDIH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 22 Nov 2020 22:08:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbgKWDIH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 22 Nov 2020 22:08:07 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC8C9C061A4C
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2020 19:08:06 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id mc24so151749ejb.6
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2020 19:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=X/h8mnbAUuvIjH6Tba/THN9fIiEUryqxQTJ1lpmtNis=;
        b=y7kbd8ECOpDrtxh6QBb19MEWdUVAFBR3AzXzNV6TFTaa8LQHh0waCoKoLOZTWu2Sz3
         r9dEondUCP29tJNwj6XIO/inCY9Y/6X/7lmDcDCzsSyZxuWSpAZ6wWpkdqeUs0EbnQyy
         Rdjm7CO7c/42wqJ1rpoy8eeLd7aHX4CR0DX0E39tnUZEnrUPvYW6F3QdHDP+wrhjAhtR
         ZCPRPqVJlkwxTyk1+POJA00SiTh3g0rgvVMNLQwnCanPvuDAZ2O1K+/UpzaKUJm5HBaa
         MkcgzVOlKha0NoNHEQOhSuvcCeQQ4fqujOG8aB/8EUjVhzfh0wCgmduKbA8laYIonyKQ
         +dqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=X/h8mnbAUuvIjH6Tba/THN9fIiEUryqxQTJ1lpmtNis=;
        b=Cpindpmowa4KfayglmacScs+191PqtxI29jeZUD2FCZJzC0ggtXzVVFXHb+qc8pvN1
         hDUOhb1XlzN4liRKQvy6FMpAqdsuW5Jz7Z22SRkk4iNgNtLA+HIlw5FL8KNr3gNqdFuc
         mnYSZ5IgT1NiNIQGOiUkYI9u2DFqLInWkeb7yAFzdLrlqmNxk5txZxVv2pIEWFwIKtZt
         QRCny5KLoDlkyJhCEKRWjzW3PXh9ACT6p4TEPz6gzDvlthZ/5LeOrNirE+/DUoUVDF9z
         HiH85HrMDDidpm0dqBJYE1qUq/boItzpyqhVz61rKY3yPiWjL/C4t1WlYpHXDHgiwXrH
         7dhw==
X-Gm-Message-State: AOAM533zoCaUzE4JpA/NR80nrAo76DZME+odKlMr9zxuyMfH+FxSvLLl
        WQYc0PEILi7eBGEAgz9O94z0HQB1io1FaKgtqF8O3Q==
X-Google-Smtp-Source: ABdhPJwU0MxV1+uBRTiVT8JVaHkd74D4cjl2EjekvPyzveVzCXAZrz8+0U9zue39xgA3JwkJ3gYm70Q/DXMwUnrD4QU=
X-Received: by 2002:a17:906:8c7:: with SMTP id o7mr36471249eje.413.1606100885616;
 Sun, 22 Nov 2020 19:08:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1513038011.git.digetx@gmail.com> <3d565db80f8dccafd14224924305243b37b75a07.1513038011.git.digetx@gmail.com>
 <CAAEAJfBZD0u6MDxcp3See-agzyCSJS7dKpwK28LMJwPvE9DLtQ@mail.gmail.com> <5665b221-04d7-6be9-2377-8006b9563d4b@gmail.com>
In-Reply-To: <5665b221-04d7-6be9-2377-8006b9563d4b@gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Mon, 23 Nov 2020 00:07:57 -0300
Message-ID: <CAAEAJfAdGeFK7DNY3QzRZEsZx+PGbQtxyyOPwawmMsx2JByt8g@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] staging: media: Introduce NVIDIA Tegra video
 decoder driver
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-media <linux-media@vger.kernel.org>,
        devel@driverdev.osuosl.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, 21 Nov 2020 at 23:01, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 22.11.2020 04:02, Ezequiel Garcia =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Hi Dmitry,
> >
> ...
> >> +++ b/drivers/staging/media/tegra-vde/TODO
> >> @@ -0,0 +1,4 @@
> >> +TODO:
> >> +       - Implement V4L2 API once it gains support for stateless decod=
ers.
> >> +
> >> +Contact: Dmitry Osipenko <digetx@gmail.com>
> >
> > The API for H264 stateless decoding is ready.
> > See https://lkml.org/lkml/2020/11/18/795.
>
> Hello Ezequiel,
>
> Thank you for the notification! My last attempt at implementing V4L API
> support was about a year ago and it stopped once I realized that there
> is no userspace which uses that API. FFMPEG and chromium browser had
> some kind of V4L support, but it all was oriented at downstream driver
> stacks, and thus, not usable. Do you know what is the current status?
>

The bulk of the API, which relies on the stateless decoder interface [1],
and H264 stateless V4L2 controls has been ready for some time now,
and there are various implementations supporting it.

Chromium supports it [2], and I've tested it on chromebooks,
through chromeos builds. We haven't tried a non-chromeos build,
and I would say it's quite some work.

GStreamer support is available as well. See [3] which should
work for the latest H264 controls (the ones being moved out of staging).

LibreELEC developers maintain an Ffmpeg branch [4], I expect it will
be updated for the latest H264 controls soon, and hopefully merged
in mainline Ffmpeg.

GStreamer and Ffmpeg are relatively straightforward to build and test.

Thanks,
Ezequiel

[1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-stat=
eless-decoder.html
[2] https://github.com/chromium/chromium/tree/master/media/gpu/v4l2
[3] https://gitlab.freedesktop.org/ezequielgarcia/gst-plugins-bad/-/tree/h2=
64_stable_uapi
[4] https://github.com/Kwiboo/FFmpeg/tree/v4l2-request-hwaccel-4.3.


> > One minor comment below.
> >
> ...
> >> +       // PPS
> >> +       __u8  pic_init_qp;
> >> +       __u8  deblocking_filter_control_present_flag;
> >> +       __u8  constrained_intra_pred_flag;
> >> +       __u8  chroma_qp_index_offset;
> >> +       __u8  pic_order_present_flag;
> >> +
> >
> > This seems to be bottom_field_pic_order_in_frame_present_flag,
> > as there is no "pic_order_present_flag" syntax element.
>
> Correct, looks like I borrowed that name from the libvdpau API.
>
> https://vdpau.pages.freedesktop.org/libvdpau/struct_vdp_picture_info_h264=
.html#a405f7ef26ea76bb2c446e151062fc001
