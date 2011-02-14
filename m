From: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/1] [tegra] Make syncpt routines accessible by drivers
Date: Mon, 14 Feb 2011 15:40:16 -0800
Message-ID: <AANLkTinvpo=R1pjvykEZVXV08D+uXLJa=R8CDcMFWWpT@mail.gmail.com>
References: <1297726034-32762-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1297726034-32762-1-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

If you want to use syncpts you should be an nvhost_driver link the dc.

On Mon, Feb 14, 2011 at 3:27 PM,  <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> From: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Make some Tegra syncpt routines accessible by kernel drivers that nee=
d
> to use the syncpt mechanism. =A0This is similar to how some nvmap stu=
ff
> is made accessible to kernel drivers.
>
> Change-Id: Id6cd2800e75223e5da29d6c0764bac5b233be185
> Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> =A0arch/arm/mach-tegra/include/mach/nvsyncpt.h | =A0 36 +++++++++++++=
++++++++++++++
> =A0drivers/video/tegra/host/dev.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
4 +++
> =A0drivers/video/tegra/host/nvhost_syncpt.c =A0 =A0| =A0 =A07 +++++
> =A0drivers/video/tegra/host/nvhost_syncpt.h =A0 =A0| =A0 =A02 +
> =A04 files changed, 49 insertions(+), 0 deletions(-)
> =A0create mode 100644 arch/arm/mach-tegra/include/mach/nvsyncpt.h
>
> diff --git a/arch/arm/mach-tegra/include/mach/nvsyncpt.h b/arch/arm/m=
ach-tegra/include/mach/nvsyncpt.h
> new file mode 100644
> index 0000000..021d498
> --- /dev/null
> +++ b/arch/arm/mach-tegra/include/mach/nvsyncpt.h
> @@ -0,0 +1,36 @@
> +/*
> + * Tegra host syncpt exports
> + *
> + * Copyright (c) 2009-2010, NVIDIA Corporation.
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, b=
ut WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILIT=
Y or
> + * FITNESS FOR A PARTICULAR PURPOSE. =A0See the GNU General Public L=
icense for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License=
 along
> + * with this program; if not, write to the Free Software Foundation,=
 Inc.,
> + * 51 Franklin Street, Fifth Floor, Boston, MA =A002110-1301, USA.
> + */
> +
> +#ifndef __NVSYNCPT_H
> +#define __NVSYNCPT_H
> +
> +#if defined(__KERNEL__)
> +
> +struct nvhost_syncpt;
> +
> +extern struct nvhost_syncpt *nvhost_getsyncpt(void);
> +extern u32 nvhost_syncpt_read(struct nvhost_syncpt *sp, u32 id);
> +extern int nvhost_syncpt_wait_timeout(struct nvhost_syncpt *sp,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 u32 id, u32 thresh, u32 timeout);
> +extern void nvhost_syncpt_cpu_incr(struct nvhost_syncpt *sp, u32 id)=
;
> +
> +#endif
> +
> +#endif
> diff --git a/drivers/video/tegra/host/dev.c b/drivers/video/tegra/hos=
t/dev.c
> index 20a4eda..af70a41 100644
> --- a/drivers/video/tegra/host/dev.c
> +++ b/drivers/video/tegra/host/dev.c
> @@ -721,6 +721,8 @@ static int __devinit nvhost_probe(struct platform=
_device *pdev)
>
> =A0 =A0 =A0 =A0nvhost_debug_init(host);
>
> + =A0 =A0 =A0 nvhost_syncpt =3D &host->syncpt;
> +
> =A0 =A0 =A0 =A0dev_info(&pdev->dev, "initialized\n");
> =A0 =A0 =A0 =A0return 0;
>
> @@ -734,6 +736,8 @@ fail:
>
> =A0static int __exit nvhost_remove(struct platform_device *pdev)
> =A0{
> + =A0 =A0 =A0 nvhost_syncpt =3D NULL;
> +
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> diff --git a/drivers/video/tegra/host/nvhost_syncpt.c b/drivers/video=
/tegra/host/nvhost_syncpt.c
> index dd2ab0d..315050d 100644
> --- a/drivers/video/tegra/host/nvhost_syncpt.c
> +++ b/drivers/video/tegra/host/nvhost_syncpt.c
> @@ -27,6 +27,8 @@
> =A0#define syncpt_to_dev(sp) container_of(sp, struct nvhost_master, s=
yncpt)
> =A0#define SYNCPT_CHECK_PERIOD 2*HZ
>
> +struct nvhost_syncpt *nvhost_syncpt;
> +
> =A0static bool check_max(struct nvhost_syncpt *sp, u32 id, u32 real)
> =A0{
> =A0 =A0 =A0 =A0u32 max;
> @@ -254,3 +256,8 @@ void nvhost_syncpt_debug(struct nvhost_syncpt *sp=
)
>
> =A0 =A0 =A0 =A0}
> =A0}
> +
> +struct nvhost_syncpt *nvhost_getsyncpt(void)
> +{
> + =A0 =A0 =A0 return nvhost_syncpt;
> +}
> diff --git a/drivers/video/tegra/host/nvhost_syncpt.h b/drivers/video=
/tegra/host/nvhost_syncpt.h
> index f161f20..65f0c95 100644
> --- a/drivers/video/tegra/host/nvhost_syncpt.h
> +++ b/drivers/video/tegra/host/nvhost_syncpt.h
> @@ -72,6 +72,8 @@ struct nvhost_syncpt {
> =A0 =A0 =A0 =A0u32 base_val[NV_HOST1X_SYNCPT_NB_BASES];
> =A0};
>
> +extern struct nvhost_syncpt *nvhost_syncpt;
> +
> =A0/**
> =A0* Updates the value sent to hardware.
> =A0*/
> --
> 1.7.0.4
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
