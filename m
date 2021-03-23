Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A158C433C1
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 10:53:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA111619BD
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 10:53:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbhCWKwj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 06:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbhCWKw3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 06:52:29 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FF38C061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 03:52:27 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id jy13so26285257ejc.2
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 03:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ekezBksCai23W9zotU93ajpucFIiXrXR4Hh8/Rvk98U=;
        b=ZzogXS/c8v+VJVV6DvhX91h2J0dlSXhiWZTiYEmVpQK0lS6HxClNKKAbqk452Pk46m
         dX4x2tvlflTJ725/pHr/XQ2zfJpxSfi2hhKhHR0/ns+ghcT7YTCNDCNIyNJJhnoj9ffA
         jILO8ofBlLWFGABx27Q/a9aD3IRhGO1F5eojhTjcQxU668jBEBYoGvTqBuxA7I0eMx0Y
         RcugQS3CEK/D8jlWxsomLDgCIzppL/nZ1ab0aic/cK0ralo6ohNa5BKx3QpDjhqWe4O6
         +3HkbIF8qPDxS3q7Dasfk3FeugScuA7rZAxVcYmRrv9tT3BdmK39q/lq+iaNla9r6mds
         BZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ekezBksCai23W9zotU93ajpucFIiXrXR4Hh8/Rvk98U=;
        b=pfx3cRyD696hv41iXrOUCu0Acrj0UudEcc5LBclQPzw24DkU07O1o7+p9c118RCdkJ
         AkvjSH7r0yg9B+SexgfyR1kbbDt4Zu8NKZw6bFML9o4ThNqj6w0Wh0DPs+v+eS20cemz
         L+aup1cwDwcZQDdOxkombRjj6DxXKjYN3UB6CnhA5MxI/8Ree6eUBB62mjOtfC6R7KaE
         +A5MNyzzAEw0PTZKxL1N8WYnATXatIcfctaw95qkr+91dJf4STWE3ubNZZvZpAkc6ETh
         xleugziIs4Ty8plYdleyz2XCQYWEd2grMVECiwQtqE2wEvSbrSLFUaC2rIKzV2WB8GyP
         RNaA==
X-Gm-Message-State: AOAM5306GnUHlScGm3Lwxh9TcSM9umEL+u0sEXcdhx7AIrAV4GUmsrdd
        ya2+1g4Y5FppX9fkOs3TiwPV4yqCcXg=
X-Google-Smtp-Source: ABdhPJxhLpAUc2e/Ee7w8JZsGRdD0I9d0qkaLn9P3aD4/kmyPgxhMB1TnWmBITCbBf2PL/yLRm/7oQ==
X-Received: by 2002:a17:907:d09:: with SMTP id gn9mr4148012ejc.538.1616496746173;
        Tue, 23 Mar 2021 03:52:26 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g22sm11132808ejm.69.2021.03.23.03.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 03:52:21 -0700 (PDT)
Date:   Tue, 23 Mar 2021 11:52:41 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     jonathanh@nvidia.com, digetx@gmail.com, airlied@linux.ie,
        daniel@ffwll.ch, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, talho@nvidia.com,
        bhuntsman@nvidia.com
Subject: Re: [PATCH v5 07/21] gpu: host1x: Introduce UAPI header
Message-ID: <YFnIef+dDuqLv5Ek@orome.fritz.box>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-8-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="A/geuaajCLwgXRh+"
Content-Disposition: inline
In-Reply-To: <20210111130019.3515669-8-mperttunen@nvidia.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--A/geuaajCLwgXRh+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2021 at 03:00:05PM +0200, Mikko Perttunen wrote:
> Add the userspace interface header, specifying interfaces
> for allocating and accessing syncpoints from userspace,
> and for creating sync_file based fences based on syncpoint
> thresholds.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  include/uapi/linux/host1x.h | 134 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 134 insertions(+)
>  create mode 100644 include/uapi/linux/host1x.h

What's the number of these syncpoints that we expect userspace to
create? There's a limited amount of open file descriptors available by
default, so this needs to be kept reasonably low.

> diff --git a/include/uapi/linux/host1x.h b/include/uapi/linux/host1x.h
> new file mode 100644
> index 000000000000..9c8fb9425cb2
> --- /dev/null
> +++ b/include/uapi/linux/host1x.h
> @@ -0,0 +1,134 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/* Copyright (c) 2020 NVIDIA Corporation */
> +
> +#ifndef _UAPI__LINUX_HOST1X_H
> +#define _UAPI__LINUX_HOST1X_H
> +
> +#include <linux/ioctl.h>
> +#include <linux/types.h>
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +struct host1x_allocate_syncpoint {
> +	/**
> +	 * @fd: [out]
> +	 *
> +	 * New file descriptor representing the allocated syncpoint.
> +	 */
> +	__s32 fd;
> +
> +	__u32 reserved[3];
> +};
> +
> +struct host1x_syncpoint_info {
> +	/**
> +	 * @id: [out]
> +	 *
> +	 * System-global ID of the syncpoint.
> +	 */
> +	__u32 id;
> +
> +	__u32 reserved[3];
> +};

Given that this has only out parameters, I expect this will be called on
the FD returned by HOST1X_IOCTL_ALLOCATE_SYNCPOINT? It might be worth
pointing that out explicitly in a comment.

> +
> +struct host1x_syncpoint_increment {
> +	/**
> +	 * @count: [in]
> +	 *
> +	 * Number of times to increment the syncpoint. The syncpoint can
> +	 * be observed at in-between values, but each increment is atomic.
> +	 */
> +	__u32 count;
> +};

This seems like it would have to be called on the FD as well...

> +
> +struct host1x_read_syncpoint {
> +	/**
> +	 * @id: [in]
> +	 *
> +	 * ID of the syncpoint to read.
> +	 */
> +	__u32 id;
> +
> +	/**
> +	 * @value: [out]
> +	 *
> +	 * Current value of the syncpoint.
> +	 */
> +	__u32 value;
> +};

=2E.. but then, all of a sudden you seem to switch things around and allow
reading the value of an arbitrary syncpoint specified by ID.

Now, I suspect that's because reading the syncpoint is harmless and does
not allow abuse, whereas incrementing could be abused if allowed on an
arbitrary syncpoint ID. But I think it's worth spelling all that out in
some documentation to make this clear from a security point of view and
=66rom a usability point of view for people trying to figure out how to
use these interfaces.

> +
> +struct host1x_create_fence {
> +	/**
> +	 * @id: [in]
> +	 *
> +	 * ID of the syncpoint to create a fence for.
> +	 */
> +	__u32 id;
> +
> +	/**
> +	 * @threshold: [in]
> +	 *
> +	 * When the syncpoint reaches this value, the fence will be signaled.
> +	 * The syncpoint is considered to have reached the threshold when the
> +	 * following condition is true:
> +	 *
> +	 * 	((value - threshold) & 0x80000000U) =3D=3D 0U
> +	 *
> +	 */
> +	__u32 threshold;
> +
> +	/**
> +	 * @fence_fd: [out]
> +	 *
> +	 * New sync_file file descriptor containing the created fence.
> +	 */
> +	__s32 fence_fd;
> +
> +	__u32 reserved[1];
> +};

Again this takes an arbitrary syncpoint ID as input, so I expect that
the corresponding IOCTL will have to be called on the host1x device
node? Again, I think it would be good to either point that out for each
structure or IOCTL, or alternatively maybe reorder these such that this
becomes clearer.

> +
> +struct host1x_fence_extract_fence {
> +	__u32 id;
> +	__u32 threshold;
> +};
> +
> +struct host1x_fence_extract {
> +	/**
> +	 * @fence_fd: [in]
> +	 *
> +	 * sync_file file descriptor
> +	 */
> +	__s32 fence_fd;
> +
> +	/**
> +	 * @num_fences: [in,out]
> +	 *
> +	 * In: size of the `fences_ptr` array counted in elements.
> +	 * Out: required size of the `fences_ptr` array counted in elements.
> +	 */
> +	__u32 num_fences;
> +
> +	/**
> +	 * @fences_ptr: [in]
> +	 *
> +	 * Pointer to array of `struct host1x_fence_extract_fence`.
> +	 */
> +	__u64 fences_ptr;
> +
> +	__u32 reserved[2];
> +};

For the others it's pretty clear to me what the purpose is, but I'm at a
complete loss with this one. What's the use-case for this?

In general I think it'd make sense to add a bit more documentation about
how all these IOCTLs are meant to be used to give people a better
understanding of why these are needed.

Thierry

> +
> +#define HOST1X_IOCTL_ALLOCATE_SYNCPOINT  _IOWR('X', 0x00, struct host1x_=
allocate_syncpoint)
> +#define HOST1X_IOCTL_READ_SYNCPOINT      _IOR ('X', 0x01, struct host1x_=
read_syncpoint)
> +#define HOST1X_IOCTL_CREATE_FENCE        _IOWR('X', 0x02, struct host1x_=
create_fence)
> +#define HOST1X_IOCTL_SYNCPOINT_INFO      _IOWR('X', 0x03, struct host1x_=
syncpoint_info)
> +#define HOST1X_IOCTL_SYNCPOINT_INCREMENT _IOWR('X', 0x04, struct host1x_=
syncpoint_increment)
> +#define HOST1X_IOCTL_FENCE_EXTRACT       _IOWR('X', 0x05, struct host1x_=
fence_extract)
> +
> +#if defined(__cplusplus)
> +}
> +#endif
> +
> +#endif
> --=20
> 2.30.0
>=20

--A/geuaajCLwgXRh+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBZyHYACgkQ3SOs138+
s6HW3xAAsE7JAumqdzGOamidUGrFbCo8ffKmgfNbG5oyr4HtIvJ1MfWm1PLQ+YVn
idW7lsSqM70gFv/uBNR80j9eIuSatpwjfb8NJ3P3TqenfkU3cc2KZsZbvuAphQEm
rIESnb0sfUxFyRyx80pwggmEREFtDPbNFksm8Q6mz3SdhYVfmD/FxUsE4T4/8Sr9
T8COtjgp9wWrUFWpeiGdxvm69iX8cxfxpk36ZEnmapnaN0zxgulEX+Cd9k734PMb
hFkjIacoqoinMM/6nQ2HOSI5M6lZfPboYzZON3Hp4SyFj1CHuypQAXUSrZB5fXyg
mEP2nlF89yN9zA2U8l5BQS0dnDG2i8VIQKzorROFnGPzTKrQbIKtK5GnGK2HasPy
sHvcgpklkcgItcaqjMuLQQWw5FuqlsFGWuQUB7N4/lTd+8/5LyLkycU8SWixWwGF
CtMWdCfyUNvgD8SBviqTMpv/Owl7GFDSiNC1r+/7B1FKIQeiAov8d4rchovZZrDR
QaDUk7hqc4fLUo6WzpclgKa2uZ5us54EqCePdwOI5WG/KkR0CMtHp48iUgYuZYYM
msSy8Lpgs7h4Q/lomHAuzASdgqkp7yO3aAvE+aTZ8DhOuVX/60Jx+hXrEo7hVXbg
b/O+0dkeVFqIZxb5yzsEqWqrasMaBv7JWas2mewy29TIIwyKVEw=
=T8bl
-----END PGP SIGNATURE-----

--A/geuaajCLwgXRh+--
