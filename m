From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [RFC PATCH v9 6/9] media: tegra: Add Tegra210 Video input driver
Date: Thu, 23 Apr 2020 09:48:11 +0200
Message-ID: <ae6dfd6b-4b0b-db73-54cf-a16e59476f38@xs4all.nl>
References: <1587536339-4030-1-git-send-email-skomatineni@nvidia.com>
 <1587536339-4030-7-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1587536339-4030-7-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: digetx@gmail.com, sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 22/04/2020 08:18, Sowjanya Komatineni wrote:
> Tegra210 contains a powerful Video Input (VI) hardware controller
> which can support up to 6 MIPI CSI camera sensors.
> 
> Each Tegra CSI port can be one-to-one mapped to VI channel and can
> capture from an external camera sensor connected to CSI or from
> built-in test pattern generator.
> 
> Tegra210 supports built-in test pattern generator from CSI to VI.
> 
> This patch adds a v4l2 capture driver with media interface for
> Tegra210 built-in CSI to VI test pattern generator.
> 
> This patch includes TPG support only and all the video pipeline
> configuration happens through the video device node.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/staging/media/Kconfig          |    2 +
>  drivers/staging/media/Makefile         |    1 +
>  drivers/staging/media/tegra/Kconfig    |   13 +
>  drivers/staging/media/tegra/Makefile   |    8 +
>  drivers/staging/media/tegra/TODO       |   10 +
>  drivers/staging/media/tegra/common.h   |  262 ++++++++
>  drivers/staging/media/tegra/csi.c      |  606 +++++++++++++++++
>  drivers/staging/media/tegra/csi.h      |  149 +++++
>  drivers/staging/media/tegra/tegra210.c |  709 ++++++++++++++++++++
>  drivers/staging/media/tegra/tegra210.h |  190 ++++++
>  drivers/staging/media/tegra/vi.c       | 1132 ++++++++++++++++++++++++++++++++
>  drivers/staging/media/tegra/vi.h       |   83 +++
>  drivers/staging/media/tegra/video.c    |  153 +++++
>  drivers/staging/media/tegra/video.h    |   34 +
>  14 files changed, 3352 insertions(+)
>  create mode 100644 drivers/staging/media/tegra/Kconfig
>  create mode 100644 drivers/staging/media/tegra/Makefile
>  create mode 100644 drivers/staging/media/tegra/TODO
>  create mode 100644 drivers/staging/media/tegra/common.h
>  create mode 100644 drivers/staging/media/tegra/csi.c
>  create mode 100644 drivers/staging/media/tegra/csi.h
>  create mode 100644 drivers/staging/media/tegra/tegra210.c
>  create mode 100644 drivers/staging/media/tegra/tegra210.h
>  create mode 100644 drivers/staging/media/tegra/vi.c
>  create mode 100644 drivers/staging/media/tegra/vi.h
>  create mode 100644 drivers/staging/media/tegra/video.c
>  create mode 100644 drivers/staging/media/tegra/video.h

With 'make menuconfig' I get this:

scripts/kconfig/mconf  Kconfig

WARNING: unmet direct dependencies detected for TEGRA_HOST1X
  Depends on [n]: HAS_IOMEM [=y] && (ARCH_TEGRA || ARM && COMPILE_TEST [=y])
  Selected by [y]:
  - VIDEO_TEGRA [=y] && STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=y] && (ARCH_TEGRA || COMPILE_TEST [=y])

This is an x86_64 build with COMPILE_TEST set. I can provide my full .config if you need it.

CONFIG_TEGRA_HOST1X=y
CONFIG_VIDEO_TEGRA=y

Regards,

	Hans
