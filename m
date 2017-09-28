From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Build error for NVIDIA Tegra DRM since 4.14-rc1
Date: Thu, 28 Sep 2017 09:30:05 +0100
Message-ID: <5ebf7a87-4625-aa5d-0351-0db275875ea0@nvidia.com>
References: <20170928071054.GD6726@otheros>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170928071054.GD6726@otheros>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Linus_L=c3=bcssing?= <linus.luessing-djzkFPsfvsizQB+pC5nmwQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Linus,

On 28/09/17 08:10, Linus Lüssing wrote:
> Hi,
> 
> Sorry, did not search for the exact commit yet, but since v4.14-rc1
> I get a build error when trying to build the ARM multi_v7_defconfig
> target:
> 
> ~~~~~~~~~~
> $ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- LOADADDR=0x00208000 zImage uImage modules dtbs
> [...]
>   CHK     include/config/kernel.release
>   CHK     include/generated/uapi/linux/version.h
>   CHK     include/generated/utsrelease.h
>   CHK     include/generated/bounds.h
>   CHK     include/generated/timeconst.h
>   CHK     include/generated/asm-offsets.h
>   CALL    scripts/checksyscalls.sh
>   CHK     scripts/mod/devicetable-offsets.h
>   CHK     include/generated/compile.h
>   CHK     include/generated/at91_pm_data-offsets.h
>   CC      drivers/gpu/drm/tegra/trace.o
> In file included from drivers/gpu/drm/tegra/trace.h:68:0,
>                  from drivers/gpu/drm/tegra/trace.c:2:
> ./include/trace/define_trace.h:88:42: fatal error: ./trace.h: No such file or directory
>  #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
>                                           ^
> compilation terminated.
> scripts/Makefile.build:311: recipe for target 'drivers/gpu/drm/tegra/trace.o' failed
> make[4]: *** [drivers/gpu/drm/tegra/trace.o] Error 1
> scripts/Makefile.build:570: recipe for target 'drivers/gpu/drm/tegra' failed
> make[3]: *** [drivers/gpu/drm/tegra] Error 2
> scripts/Makefile.build:570: recipe for target 'drivers/gpu/drm' failed
> make[2]: *** [drivers/gpu/drm] Error 2
> scripts/Makefile.build:570: recipe for target 'drivers/gpu' failed
> make[1]: *** [drivers/gpu] Error 2
> Makefile:1019: recipe for target 'drivers' failed
> make: *** [drivers] Error 2
> ~~~~~~~~~~
> 
> v4.14-rc2 fails, too. v4.13.2 and v4.13.3 worked fine with multi_v7_defconfig.
> 
> Setting CONFIG_DRM_TEGRA=n for v4.14-rc1 or v4.14-rc2 helps for
> the build to succeed, too.

Yes, sorry about this, we are aware [0] and there is a fix on its way
upstream [1].

Cheers
Jon

[0] https://www.spinics.net/lists/linux-tegra/msg30857.html
[1] https://lkml.org/lkml/2017/9/26/242

-- 
nvpublic
