From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv5,RESEND 5/8] drm: tegra: Move drm to live under host1x
Date: Mon, 4 Feb 2013 20:45:36 -0800
Message-ID: <51108E70.5000602@nvidia.com>
References: <1358250244-9678-1-git-send-email-tbergstrom@nvidia.com> <1358250244-9678-6-git-send-email-tbergstrom@nvidia.com> <20130204110804.GA595@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130204110804.GA595-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04.02.2013 03:08, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Tue, Jan 15, 2013 at 01:44:01PM +0200, Terje Bergstrom wrote:
> [...]
>> diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
>> index 697d49a..ffc8bf1 100644
>> --- a/drivers/gpu/host1x/Makefile
>> +++ b/drivers/gpu/host1x/Makefile
>> @@ -12,4 +12,10 @@ host1x-y = \
>>  	hw/host1x01.o
>>  
>>  host1x-$(CONFIG_TEGRA_HOST1X_CMA) += cma.o
>> +
>> +ccflags-y += -Iinclude/drm
>> +ccflags-$(CONFIG_DRM_TEGRA_DEBUG) += -DDEBUG
>> +
>> +host1x-$(CONFIG_DRM_TEGRA) += drm/drm.o drm/fb.o drm/dc.o drm/host1x.o
>> +host1x-$(CONFIG_DRM_TEGRA) += drm/output.o drm/rgb.o drm/hdmi.o
>>  obj-$(CONFIG_TEGRA_HOST1X) += host1x.o
> 
> Can this be moved into a separate Makefile in the drm subdirectory?

I tried, and kernel build helpfully created two .ko files. As having
cyclic dependencies between two modules isn't nice, I merged them to
same module and that seemed to force merging Makefile.

If anybody has an idea on how to do it otherwise, I'd be happy to keep
the Makefiles separate.

> 
>> diff --git a/drivers/gpu/host1x/host1x_client.h b/drivers/gpu/host1x/host1x_client.h
> [...]
>> new file mode 100644
>> index 0000000..fdd2920
>> --- /dev/null
>> +++ b/drivers/gpu/host1x/host1x_client.h
>> @@ -0,0 +1,25 @@
>> +/*
>> + * Copyright (c) 2013, NVIDIA Corporation.
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#ifndef HOST1X_CLIENT_H
>> +#define HOST1X_CLIENT_H
>> +
>> +struct platform_device;
>> +
>> +void host1x_set_drm_data(struct platform_device *pdev, void *data);
>> +void *host1x_get_drm_data(struct platform_device *pdev);
>> +
>> +#endif
> 
> These aren't defined or used yet.

Hmm, right, they would go to patch 7.

Terje
