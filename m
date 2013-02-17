From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [v3 0/6] ARM: tegra: convert device tree files to use CLK defines
Date: Sun, 17 Feb 2013 14:20:03 -0800
Message-ID: <CAPnjgZ0Bkk0Ock5_WQxsni+qNMQnWURrLLqfNFVfKczN6OgLoQ@mail.gmail.com>
References: <1360917814-27236-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360917814-27236-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Hiroshi,

On Fri, Feb 15, 2013 at 12:43 AM, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Hi,
>
> With new dtc+cpp feature, we could get rid of magic numbers in dts*
> files. This patch replaces CLK IDs.
>
> We also plan to share those DT header files with kernel source
> later[1].
>
> This series depends on:
>   [PATCH 0/9] ARM: tegra: use new dtc+cpp feature
>   http://lists.infradead.org/pipermail/linux-arm-kernel/2013-February/149613.html
>
> [5/6] and [6/6] depend on:
>   [PATCH v6 00/10] Tegra114 clockframework
>   http://lists.infradead.org/pipermail/linux-arm-kernel/2013-February/148895.html
>
> v2:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2013-February/149816.html
>
> v1:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2013-February/149672.html
>
> [1] http://lists.infradead.org/pipermail/linux-arm-kernel/2013-February/149804.html
>
>
> Hiroshi Doyu (6):
>   ARM: tegra20: create a DT header defining CLK IDs
>   ARM: tegra20: convert device tree files to use CLK defines
>   ARM: tegra30: create a DT header defining CLK IDs
>   ARM: tegra30: convert device tree files to use CLK defines
>   ARM: tegra114: create a DT header defining CLK IDs
>   ARM: tegra114: convert device tree files to use CLK defines

I wonder what sort of error message do you get when you make a mistake
in the .dts or one of the .dtsi includes? If cpp is handling the
including, does dtc just see a single file, in which case are the line
numbers printed with each error not much use? Or does dtc handle the
#line directives?

Just curious...

Regards,
Simon

>
>  .../bindings/clock/nvidia,tegra114-car.txt         |  261 +------------------
>  .../bindings/clock/nvidia,tegra20-car.txt          |  150 +----------
>  .../bindings/clock/nvidia,tegra30-car.txt          |  207 +--------------
>  arch/arm/boot/dts/tegra114-car.h                   |  272 ++++++++++++++++++++
>  arch/arm/boot/dts/tegra114.dtsip                   |   13 +-
>  arch/arm/boot/dts/tegra20-car.h                    |  158 ++++++++++++
>  arch/arm/boot/dts/tegra20-paz00.dtsp               |    2 +-
>  arch/arm/boot/dts/tegra20.dtsip                    |   85 +++---
>  arch/arm/boot/dts/tegra30-car.h                    |  218 ++++++++++++++++
>  arch/arm/boot/dts/tegra30.dtsip                    |   87 +++----
>  10 files changed, 746 insertions(+), 707 deletions(-)
>  create mode 100644 arch/arm/boot/dts/tegra114-car.h
>  create mode 100644 arch/arm/boot/dts/tegra20-car.h
>  create mode 100644 arch/arm/boot/dts/tegra30-car.h
>
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
