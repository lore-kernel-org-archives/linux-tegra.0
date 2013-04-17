From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/3] regulator: palmas: add support for LDO8 tracking
 mode
Date: Wed, 17 Apr 2013 21:44:17 +0530
Message-ID: <516ECA59.3050200@nvidia.com>
References: <1366191793-13934-1-git-send-email-ldewangan@nvidia.com> <1366191793-13934-3-git-send-email-ldewangan@nvidia.com> <516EA998.3050008@slimlogic.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <516EA998.3050008-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Graeme Gregory <gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
Cc: "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 17 April 2013 07:24 PM, Graeme Gregory wrote:
> Looks good to me, I don't actually know the use case for this feature!
>
> Acked-by: Graeme Gregory <gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
>

This is require for Tegra.
The always ON section of Tegra (say vdd_ao) need to be same as the core 
voltage(vdd_core) when system is active/idle. Hence the vdd_ao should be 
track to vdd_core and for this we need to configure the rail in tracking 
mode.
