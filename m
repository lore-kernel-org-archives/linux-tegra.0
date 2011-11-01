From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] ASoc : Tegra : Add audio map for Asymptote
Date: Tue, 1 Nov 2011 09:55:59 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173EDABA51@HQMAIL01.nvidia.com>
References: <1320165173-3951-1-git-send-email-thutt@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1320165173-3951-1-git-send-email-thutt-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Taylor Hutt <thutt-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "miletus-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <miletus-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Liam Girdwood <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Taylor Hutt wrote at Tuesday, November 01, 2011 10:33 AM:
> Details
> 
>   Add pin connections and audio map for the Asymptote board.
> 
> Testing
> 
>   Visual inspection with Chromium OS 2.6.38 code.
>   Built kernel
>   Built chromium os image
>   Booted image on asymptote
>   Booted image on kaen

Presumably all that testing was within the chromeos-3.0 kernel, not
mainline; asymptote isn't supported in mainline.

This patch can't be applied for a few reasons:

a) Asymptote isn't in mainline's arch/arm/tools/mach-types. This means
that function machine_is_asymptote() doesn't exists, and this code can't
compile.

b) Even if the machine were in mach-types, there's no board file for
asymptote, so Russell King's automated mach-types cleanup script would
flag asymptote for removal and eventually it'd go away. This is the same
reason we recently removed Ventana support from tegra_wm8903.c. I'm not
sure how this will work once we have device-tree-only boards; I guess
we need to remove all the machine_is_foo() checks from the code and
parameterize everything from DT instead.

-- 
nvpublic
