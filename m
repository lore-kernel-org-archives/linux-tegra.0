From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv4 5/8] drm: tegra: Remove redundant host1x
Date: Thu, 3 Jan 2013 19:58:12 +0200
Message-ID: <50E5C6B4.6080606@nvidia.com>
References: <1356089964-5265-1-git-send-email-tbergstrom@nvidia.com> <1356089964-5265-6-git-send-email-tbergstrom@nvidia.com> <20121221143614.GA16167@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121221143614.GA16167-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org" <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 21.12.2012 16:36, Thierry Reding wrote:
> On Fri, Dec 21, 2012 at 01:39:21PM +0200, Terje Bergstrom wrote:
>> +static void tegra_drm_close(struct drm_device *drm, struct drm_file *filp)
>> +{
>> +
>> +}
>> +
> 
> This can be removed, right?

Yes, done.

> 
>> +static struct platform_driver tegra_drm_platform_driver = {
>> +	.driver = {
>> +		.name = "tegradrm",
> 
> This should be "tegra-drm" to match the module name.

Done.

>> -struct host1x_client;
>> +struct tegra_drm_client;
> 
> I don't see the point in renaming this. All of the devices are still
> host1x clients, right? This patch would be a whole shorter if we didn't
> rename these. None of these symbols are exported either so there's not
> much chance for them to clash with anything.

Yep, we renamed it back to make the patch smaller.

>> diff --git a/include/drm/tegra_drm.h b/include/drm/tegra_drm.h
>> new file mode 100644
>> index 0000000..8632f49
>> --- /dev/null
>> +++ b/include/drm/tegra_drm.h
>> @@ -0,0 +1,20 @@
>> +/*
>> + * Copyright (c) 2012, NVIDIA CORPORATION.  All rights reserved.
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
>> +#ifndef _TEGRA_DRM_H_
>> +#define _TEGRA_DRM_H_
>> +
>> +#endif
> 
> This can be removed as well.

Removed.

I posted another proposal on how to handle initialization in tegradrm.
It removes a lot of code and relies more on platform_bus keeping track
of devices. Have you had time to look into it?

Terje
