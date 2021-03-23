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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FEE6C433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 11:04:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2D8161923
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 11:04:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbhCWLDU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 07:03:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhCWLCj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 07:02:39 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1E57C061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 04:02:22 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id y6so22953550eds.1
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 04:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xaUecr/yu5fibos0JaL1aoINNMXudgcFAySWCmTHdQY=;
        b=QZKDJIWzTTfrKTgBb4eIOl8C5Y5sQAg9M6bfe46G80eT2iqyNzeKhMYrFtwu1fMLaX
         LNFuhPE1+UGS6trGqcNu7ARNpP6c6jCEuILrf6v4F6cuX7tehxuZl/shdFGS6uuQ89vl
         zGmw2C6KA6EtjNPB5I1oYp7L7w4Oz/t6JKGzHWZUAZhAehA2Ivw6E5VtXvcKPo+cybXr
         KeurU2FGPYqN6ylH4+aBqXMZj5/TmqJ7lcA6Ih7SrzzN0RLIB3ZSTH9ZW6lA2mmEh52k
         ueZlAFlyY28Cuy2X/1b2zr+gAe6DLz8RSVf5ZUxph7L3a/1Z+K54p/dHLUZ3zewTckqV
         BI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xaUecr/yu5fibos0JaL1aoINNMXudgcFAySWCmTHdQY=;
        b=Ha+lkCgj2U44CSeeh8aBkSP39IPX2bqi8v2g8JdB/TNwNbKklnMENZJWulc6NdtdGj
         5N8ACqrnMIZcubWPUA1gz+zeXE9CHLaN1DRnr6rEx4psg3DbS331fDMKm2D0NECc+8y5
         YqIxbhuAQpkldoc60YVZ39ZEmeO/HExkNhnlbFRuBDbHhiP6STCttId5D9f1kFZxwoqI
         4sQUkizd53mQLMHZI7KdoeRHOwLfKc0qMeuQaMTnS/qa3MR9NC9M8tK470B/djXfH1WH
         coFnMS7/kiptMAbx0YKJXTQpbbRy1aygbar+gd9X5sdac4CwHTS8A3bwQen1G7zscDX+
         tHdQ==
X-Gm-Message-State: AOAM533AAntbyG0+fs+8YevzaT0DZvN/MDM0BFCK7nutx0tNtBD2rcJW
        FN7RNh/TqXXJHfkzqBY+n5k=
X-Google-Smtp-Source: ABdhPJz5Bg4RAoXiN8LDTpYeKJ1QSNNeGF0O9yGANjFowdlSWgu5ShXPkCC1bKrvdDWr+CI+4rRfFg==
X-Received: by 2002:a05:6402:4309:: with SMTP id m9mr4171268edc.25.1616497341272;
        Tue, 23 Mar 2021 04:02:21 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id ld19sm10958276ejb.102.2021.03.23.04.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 04:02:18 -0700 (PDT)
Date:   Tue, 23 Mar 2021 12:02:39 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     jonathanh@nvidia.com, digetx@gmail.com, airlied@linux.ie,
        daniel@ffwll.ch, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, talho@nvidia.com,
        bhuntsman@nvidia.com
Subject: Re: [PATCH v5 08/21] gpu: host1x: Implement /dev/host1x device node
Message-ID: <YFnKz9eCndMnOB61@orome.fritz.box>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-9-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XHRrZryMDjr3qRhw"
Content-Disposition: inline
In-Reply-To: <20210111130019.3515669-9-mperttunen@nvidia.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--XHRrZryMDjr3qRhw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2021 at 03:00:06PM +0200, Mikko Perttunen wrote:
> Add the /dev/host1x device node, implementing the following
> functionality:
>=20
> - Reading syncpoint values
> - Allocating syncpoints (providing syncpoint FDs)
> - Incrementing syncpoints (based on syncpoint FD)
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v4:
> * Put UAPI under CONFIG_DRM_TEGRA_STAGING
> v3:
> * Pass process name as syncpoint name when allocating
>   syncpoint.
> ---
>  drivers/gpu/host1x/Makefile |   1 +
>  drivers/gpu/host1x/dev.c    |   9 ++
>  drivers/gpu/host1x/dev.h    |   3 +
>  drivers/gpu/host1x/uapi.c   | 282 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/host1x/uapi.h   |  22 +++
>  include/linux/host1x.h      |   2 +
>  6 files changed, 319 insertions(+)
>  create mode 100644 drivers/gpu/host1x/uapi.c
>  create mode 100644 drivers/gpu/host1x/uapi.h
>=20
> diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
> index 096017b8789d..882f928d75e1 100644
> --- a/drivers/gpu/host1x/Makefile
> +++ b/drivers/gpu/host1x/Makefile
> @@ -9,6 +9,7 @@ host1x-y =3D \
>  	job.o \
>  	debug.o \
>  	mipi.o \
> +	uapi.o \
>  	hw/host1x01.o \
>  	hw/host1x02.o \
>  	hw/host1x04.o \
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index d0ebb70e2fdd..641317d23828 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -461,6 +461,12 @@ static int host1x_probe(struct platform_device *pdev)
>  		goto deinit_syncpt;
>  	}
> =20
> +	err =3D host1x_uapi_init(&host->uapi, host);

It's a bit pointless to pass &host->uapi and host to the function since
you can access the former through the latter.

> +	if (err) {
> +		dev_err(&pdev->dev, "failed to initialize uapi\n");

s/uapi/UAPI/, and perhaps include the error code to give a better hint
as to why things failed.

> +		goto deinit_intr;
> +	}
> +
>  	host1x_debug_init(host);
> =20
>  	if (host->info->has_hypervisor)
> @@ -480,6 +486,8 @@ static int host1x_probe(struct platform_device *pdev)
>  	host1x_unregister(host);
>  deinit_debugfs:
>  	host1x_debug_deinit(host);
> +	host1x_uapi_deinit(&host->uapi);
> +deinit_intr:
>  	host1x_intr_deinit(host);
>  deinit_syncpt:
>  	host1x_syncpt_deinit(host);
> @@ -501,6 +509,7 @@ static int host1x_remove(struct platform_device *pdev)
> =20
>  	host1x_unregister(host);
>  	host1x_debug_deinit(host);
> +	host1x_uapi_deinit(&host->uapi);
>  	host1x_intr_deinit(host);
>  	host1x_syncpt_deinit(host);
>  	reset_control_assert(host->rst);
> diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
> index 63010ae37a97..7b8b7e20e32b 100644
> --- a/drivers/gpu/host1x/dev.h
> +++ b/drivers/gpu/host1x/dev.h
> @@ -17,6 +17,7 @@
>  #include "intr.h"
>  #include "job.h"
>  #include "syncpt.h"
> +#include "uapi.h"
> =20
>  struct host1x_syncpt;
>  struct host1x_syncpt_base;
> @@ -143,6 +144,8 @@ struct host1x {
>  	struct list_head list;
> =20
>  	struct device_dma_parameters dma_parms;
> +
> +	struct host1x_uapi uapi;
>  };
> =20
>  void host1x_hypervisor_writel(struct host1x *host1x, u32 r, u32 v);
> diff --git a/drivers/gpu/host1x/uapi.c b/drivers/gpu/host1x/uapi.c
> new file mode 100644
> index 000000000000..27b8761c3f35
> --- /dev/null
> +++ b/drivers/gpu/host1x/uapi.c
> @@ -0,0 +1,282 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * /dev/host1x syncpoint interface
> + *
> + * Copyright (c) 2020, NVIDIA Corporation.
> + */
> +
> +#include <linux/anon_inodes.h>
> +#include <linux/cdev.h>
> +#include <linux/file.h>
> +#include <linux/fs.h>
> +#include <linux/host1x.h>
> +#include <linux/nospec.h>
> +
> +#include "dev.h"
> +#include "syncpt.h"
> +#include "uapi.h"
> +
> +#include <uapi/linux/host1x.h>
> +
> +static int syncpt_file_release(struct inode *inode, struct file *file)
> +{
> +	struct host1x_syncpt *sp =3D file->private_data;
> +
> +	host1x_syncpt_put(sp);
> +
> +	return 0;
> +}
> +
> +static int syncpt_file_ioctl_info(struct host1x_syncpt *sp, void __user =
*data)
> +{
> +	struct host1x_syncpoint_info args;
> +	unsigned long copy_err;
> +
> +	copy_err =3D copy_from_user(&args, data, sizeof(args));
> +	if (copy_err)
> +		return -EFAULT;
> +
> +	if (args.reserved[0] || args.reserved[1] || args.reserved[2])
> +		return -EINVAL;

Yes! \o/

> +
> +	args.id =3D sp->id;
> +
> +	copy_err =3D copy_to_user(data, &args, sizeof(args));
> +	if (copy_err)
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +static int syncpt_file_ioctl_incr(struct host1x_syncpt *sp, void __user =
*data)
> +{
> +	struct host1x_syncpoint_increment args;
> +	unsigned long copy_err;
> +	u32 i;
> +
> +	copy_err =3D copy_from_user(&args, data, sizeof(args));
> +	if (copy_err)
> +		return -EFAULT;
> +
> +	for (i =3D 0; i < args.count; i++) {
> +		host1x_syncpt_incr(sp);
> +		if (signal_pending(current))
> +			return -EINTR;
> +	}
> +
> +	return 0;
> +}
> +
> +static long syncpt_file_ioctl(struct file *file, unsigned int cmd,
> +			      unsigned long arg)
> +{
> +	void __user *data =3D (void __user *)arg;
> +	long err;
> +
> +	switch (cmd) {
> +	case HOST1X_IOCTL_SYNCPOINT_INFO:
> +		err =3D syncpt_file_ioctl_info(file->private_data, data);
> +		break;
> +
> +	case HOST1X_IOCTL_SYNCPOINT_INCREMENT:
> +		err =3D syncpt_file_ioctl_incr(file->private_data, data);
> +		break;
> +
> +	default:
> +		err =3D -ENOTTY;
> +	}
> +
> +	return err;
> +}

I wonder if it's worth adding some more logic to this demuxing. I'm
thinking along the lines of what the DRM IOCTL demuxer does, which
ultimately allows the IOCTLs to be extended. It does this by doing a
bit of sanitizing and removing the parameter size field from the cmd
argument so that the same IOCTL may handle different parameter sizes.

> +static const struct file_operations syncpt_file_fops =3D {
> +	.owner =3D THIS_MODULE,
> +	.release =3D syncpt_file_release,
> +	.unlocked_ioctl =3D syncpt_file_ioctl,
> +	.compat_ioctl =3D syncpt_file_ioctl,
> +};
> +
> +struct host1x_syncpt *host1x_syncpt_fd_get(int fd)
> +{
> +	struct host1x_syncpt *sp;
> +	struct file *file =3D fget(fd);
> +
> +	if (!file)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (file->f_op !=3D &syncpt_file_fops) {
> +		fput(file);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	sp =3D file->private_data;
> +
> +	host1x_syncpt_get(sp);
> +
> +	fput(file);
> +
> +	return sp;
> +}
> +EXPORT_SYMBOL(host1x_syncpt_fd_get);
> +
> +static int dev_file_open(struct inode *inode, struct file *file)

Maybe use the more specific host1x_ as prefix instead of the generic
dev_? That might make things like stack traces more readable.

Otherwise looks good.

Thierry

--XHRrZryMDjr3qRhw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBZys8ACgkQ3SOs138+
s6E9cRAApnL+EGqB5GYHbwFkfePGKPGN9q6NuSqff/MFYDyw/AczWypGmF8rUAch
OXpgzB+kcpITTUV3ONqPNLvrrVW0lYwRvIU/c09ur1KmJsQGDfUgjTcSjBmSiRyd
gYxemODMnEMhUHDZOOVW+SNo+o4MJqsYOV1Qr0y2rvOsjAplevjyRXYvVhj9W5Dk
uthpVJTVRFwFTv7VGnGg8KRmj9I2Fs86iYQfd8Oy3NcUzsrEgm2FYp3zsC4Ag9eL
34IcNKwl1tS9/0kEGAnhLXwFQiuE5omGOLV1YzC2rKbcQxo63H6oyMuHQ2MA0UM2
b+KOg4/2DYyksiQ7189CvG88uPiyU3jtcdL8/WdQ26yB/kI0RcF3D4/yDCcAidWw
rRYrqXnIFkYF3Lr8Xse7Cxq8Sq0yeN8EThQwKVyh8/zfAhPVM4jHgMe/lLdGNb3M
A4zTcDZbk70DPg2XOdqtxpoevE1NY0bbBaFDiKuqnGLT4/NFyG29SJN9aBdttsb7
d7RIfoIEg6CApoaCRayJLdcEcNhhbs+jig85n4BDVulKIKYQuKnuVpy6pCxkcsWS
bQU01Xn4sWZLbDljfEUfkZjC3agyihk1Cin0q5kHe1I1g6IyYEuZXVX6u7YOPJzc
20q10fPNjOOsUULSrrShdwt5B7vGSpqYZTzMBQGrVu9IBr/qMqM=
=HkN6
-----END PGP SIGNATURE-----

--XHRrZryMDjr3qRhw--
