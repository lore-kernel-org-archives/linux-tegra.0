From: jeffy <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [v2] timers: Fix excessive granularity of new timers after a
 nohz idle
Date: Wed, 23 Aug 2017 16:38:14 +0800
Message-ID: <599D3EF6.9030000@rock-chips.com>
References: <20170815134114.17547-6-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170815134114.17547-6-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

i hit a compile error with this patch:

   CC      drivers/gpu/drm/tegra/trace.o
In file included from drivers/gpu/drm/tegra/trace.h:68:0,
                  from drivers/gpu/drm/tegra/trace.c:2:
./include/trace/define_trace.h:88:43: fatal error: ./trace.h: No such 
file or directory
compilation terminated.
scripts/Makefile.build:311: recipe for target 
'drivers/gpu/drm/tegra/trace.o' failed


On 08/22/2017 04:43 PM, Nicholas Piggin wrote:
> +++ b/drivers/gpu/drm/tegra/Makefile
> @@ -24,4 +24,6 @@ tegra-drm-$(CONFIG_ARCH_TEGRA_186_SOC) += \
>   	parker/dsi.o \
>   	parker/sor.o
>
> +tegra-drm-y += trace.o
> +

maybe we need this:

+++ b/drivers/gpu/drm/tegra/Makefile
@@ -19,4 +19,6 @@ tegra-drm-y := \

  tegra-drm-y += trace.o

+CFLAGS_trace.o := -I$(src)
+
  obj-$(CONFIG_DRM_TEGRA) += tegra-drm.o
