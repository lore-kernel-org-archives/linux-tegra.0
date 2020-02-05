From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RFC PATCH v1 4/5] media: tegra: Add Tegra Video input driver for Tegra210
Date: Wed, 05 Feb 2020 11:26:19 -0800
Message-ID: <20200205192620.3A1F620720@mail.kernel.org>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com> <1580235801-4129-5-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1580235801-4129-5-git-send-email-skomatineni@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: frankc@nvidia.com, hverkuil@xs4all.nl, jonathanh@nvidia.com, skomatineni@nvidia.com, thierry.reding@gmail.com
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Sowjanya Komatineni (2020-01-28 10:23:20)
> diff --git a/drivers/staging/media/tegra/Kconfig b/drivers/staging/media/=
tegra/Kconfig
> new file mode 100644
> index 000000000000..443b99f2e2c9
> --- /dev/null
> +++ b/drivers/staging/media/tegra/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config VIDEO_TEGRA
> +       tristate "NVIDIA Tegra VI driver"
> +       depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
> +       depends on COMMON_CLK

What depends on the common clk framework? I don't see any clk-provider.h
includes here.

> +       depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> +       depends on MEDIA_CONTROLLER
> +       select TEGRA_HOST1X
> +       select VIDEOBUF2_DMA_CONTIG
> +       select V4L2_FWNODE
> +       help
> +         Say yes here to enable support for Tegra video input hardware
