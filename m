From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [RFC PATCH v1 4/5] media: tegra: Add Tegra Video input driver for
 Tegra210
Date: Thu, 30 Jan 2020 15:45:34 +0100
Message-ID: <60357c4c-13cc-f623-12c5-92dfdc3ae21d@xs4all.nl>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <1580235801-4129-5-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1580235801-4129-5-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 1/28/20 7:23 PM, Sowjanya Komatineni wrote:
> Tegra210 contains a powerful Video Input (VI) hardware controller
> which can support up to 6 MIPI CSI camera sensors.
> 
> Each Tegra CSI port can be one-to-one mapped to VI channel and can
> capture from an external camera sensor connected to CSI or from
> built-in test pattern generator.
> 
> Tegra210 supports built-in test pattern generator from CSI to VI.
> 
> This patch adds a V4L2 media controller and capture driver support
> for Tegra210 built-in CSI to VI test pattern generator.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/staging/media/Kconfig               |   2 +
>  drivers/staging/media/Makefile              |   1 +
>  drivers/staging/media/tegra/Kconfig         |  12 +
>  drivers/staging/media/tegra/Makefile        |  11 +
>  drivers/staging/media/tegra/TODO            |  10 +
>  drivers/staging/media/tegra/csi.h           | 111 +++++
>  drivers/staging/media/tegra/csi2_fops.c     | 335 +++++++++++++++
>  drivers/staging/media/tegra/csi2_fops.h     |  15 +
>  drivers/staging/media/tegra/host1x-video.c  | 120 ++++++
>  drivers/staging/media/tegra/host1x-video.h  |  33 ++
>  drivers/staging/media/tegra/mc_common.h     | 131 ++++++
>  drivers/staging/media/tegra/tegra-channel.c | 628 ++++++++++++++++++++++++++++
>  drivers/staging/media/tegra/tegra-core.c    | 111 +++++
>  drivers/staging/media/tegra/tegra-core.h    | 125 ++++++
>  drivers/staging/media/tegra/tegra-csi.c     | 380 +++++++++++++++++
>  drivers/staging/media/tegra/tegra-vi.c      | 351 ++++++++++++++++
>  drivers/staging/media/tegra/tegra-vi.h      | 101 +++++
>  drivers/staging/media/tegra/vi2_fops.c      | 364 ++++++++++++++++
>  drivers/staging/media/tegra/vi2_fops.h      |  15 +
>  drivers/staging/media/tegra/vi2_formats.h   | 119 ++++++
>  drivers/staging/media/tegra/vi2_registers.h | 194 +++++++++

Please add an entry to the MAINTAINERS file for this new driver.

Also, checkpatch.pl --strict complains about the SPDX tag in the headers:

WARNING: Improper SPDX comment style for 'drivers/staging/media/tegra/csi.h', please use '/*' instead
#141: FILE: drivers/staging/media/tegra/csi.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

(same warning for all headers)

Please fix for v2.

Regards,

	Hans
