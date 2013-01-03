From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/9] ARM: Initial support for Tegra 114 SoC.
Date: Thu, 3 Jan 2013 15:06:56 +0100
Message-ID: <20130103.160656.1043855724416946158.hdoyu@nvidia.com>
References: <1355996654-6579-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355996654-6579-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org" <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org" <johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, "tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org" <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org" <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "andrew-g2DYL2Zd6BY@public.gmane.org" <andrew-g2DYL2Zd6BY@public.gmane.org>, "plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org" <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote @ Thu, 20 Dec 2012 10:43:58 +0100:

> Hi,
> 
> This patchset adds initial support for the NVIDIA's new Tegra 114
> SoC (T114) based on the ARM Cortex-A15 MP. It has the minimal support
> to allow the kernel to boot up into shell console. This can be used as
> a basis for adding other device drivers for this SoC. Currently there
> are 2 evaluation boards available, "Dalmore" and "Pluto".

I'll resend v2 of this series just with /cpus node in DT added. The
rest would be same since TSC initialization and dynamic core
detections are still necessary/valid for Tegra as backup of /cpus DT
failure. Or if you take this series as is first, I'll make a /cpus DT
patchset agaist this series.

> This patchset is against Stephen Warren's linux-next_common branch:
> 
>   git://nv-tegra.nvidia.com/user/swarren/linux-2.6 linux-next_common
> 
> For those who want to try:
> 
>   $ make ARCH=arm tegra_defconfig
>   $ scripts/config -e ARCH_TEGRA_114_SOC -d DRM -d SUSPEND \
>     	-d PM_RUNTIME -d CPU_FREQ -d CPU_IDLE
>   $ make ARCH=arm menuconfig # if needed to configure more
>   $ make ARCH=arm all -j9
> 
> Verified that this single image booted up with "Dalmore(T114)",
> "Pluto(T114)" and "Cardhu(T30)". For "Cardhu(T30)" with this single
> image, SPI driver doesn't seem to afford the above configuration , it
> hangs at boot-up. With SPI disabled, it's ok.
> 
> 
> Hiroshi Doyu (9):
>   ARM: tegra: fuse: Add chipid TEGRA114 0x35
>   HACK: ARM: tegra: Use CLK_IGNORE_UNUSED for Tegra 114 SoC
>   ARM: tegra: # of CPU cores detection w/ & w/o HAVE_ARM_SCU
>   clocksource: tegra: Reorganize funcs by clock functionarities
>   clocksource: tegra: Enable ARM arch_timer with TSC
>   ARM: dt: tegra114: Add new SoC base, Tegra 114 SoC
>   ARM: dt: tegra114: Add new board, Dalmore
>   ARM: dt: tegra114: Add new board, Pluto
>   ARM: tegra: Add initial support for Tegra 114 SoC.
> 
>  .../bindings/arm/tegra/nvidia,tegra114-tsc.txt     |   11 +
>  arch/arm/boot/dts/Makefile                         |    4 +-
>  arch/arm/boot/dts/tegra114-dalmore.dts             |   21 ++
>  arch/arm/boot/dts/tegra114-pluto.dts               |   21 ++
>  arch/arm/boot/dts/tegra114.dtsi                    |   89 ++++++++
>  arch/arm/mach-tegra/Kconfig                        |   10 +
>  arch/arm/mach-tegra/Makefile                       |    1 +
>  arch/arm/mach-tegra/board-dt-tegra114.c            |   48 +++++
>  arch/arm/mach-tegra/common.c                       |    1 +
>  arch/arm/mach-tegra/fuse.h                         |    1 +
>  arch/arm/mach-tegra/platsmp.c                      |   31 ++-
>  arch/arm/mach-tegra/tegra30_clocks_data.c          |    2 +
>  drivers/clocksource/tegra20_timer.c                |  222 +++++++++++++-------
>  13 files changed, 384 insertions(+), 78 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra114-tsc.txt
>  create mode 100644 arch/arm/boot/dts/tegra114-dalmore.dts
>  create mode 100644 arch/arm/boot/dts/tegra114-pluto.dts
>  create mode 100644 arch/arm/boot/dts/tegra114.dtsi
>  create mode 100644 arch/arm/mach-tegra/board-dt-tegra114.c
> 
> -- 
> 1.7.9.5
> 
