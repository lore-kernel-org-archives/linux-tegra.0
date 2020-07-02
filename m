From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [RFC PATCH v2 00/18] Support for Tegra video capture from
 external sensor
Date: Thu, 2 Jul 2020 16:08:22 +0200
Message-ID: <68d5b863-2ff1-203c-bd30-9ad0dcdf76f7@xs4all.nl>
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1592358094-23459-1-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Sowjanya,

On 17/06/2020 03:41, Sowjanya Komatineni wrote:
> This series adds support for video capture from external camera sensor to
> Tegra video driver.
> 
> Jetson TX1 has camera expansion connector and supports custom camera module
> designed as per TX1 design specification.
> 
> This series also enables camera capture support for Jetson Nano which has
> Raspberry PI camera header.
> 
> This series is tested with IMX219 camera sensor.
> 
> This series include,
> 
> VI I2C related fixes
> - Camera sensor programming happens through VI I2C which is on host1x bus.
> - These patches includes device tree and I2C driver fixes for VI I2C.
> 
> Tegra video driver updates
> - TPG Vs Non-TPG based on Kconfig
> - Support for external sensor video capture based on device graph from DT.
> - Support for selection ioctl operations
> - Tegra MIPI CSI pads calibration
> - CSI T-CLK and T-HS settle time computation based on clock rates.
> 
> Host1x driver updates
> - Adds API to allow creating mipi device for specific device node.
> - Splits MIPI pads calibrate start and waiting for calibration to be done.
> 
> Device tree updates
> - Adds camera connector 2V8, 1V8, 1V2 regulator supplies to Jetson TX1 DT.
> - Enabled VI and CSI support in Jetson Nano DT.

I tested all this with imx219 and imx274. It all looks good. I'll do a last
code review on Monday.

I posted a few imx219 and imx274 patches to fix v4l2-compliance issues (also
updated that tool itself since it had a bug).

There is one remaining compliance failure with the imx274, but that is also
due to a bug in the imx274: it's missing a bunch of enum ops and it is doing
weird things with the COMPOSE selection. I think that's completely wrong, but
I need more time to dig into that.

Regards,

	Hans

> 
> 
> Delta between patch versions:
> 
> [v2]:	Includes below changes based on v1 feedback
> 	- dt-binding document and the driver update for device graph to use
> 	  separate ports for sink endpoint and source endpoint for csi.
> 	- Use data-lanes endpoint property for csi.
> 	- Update tegra_mipi_request() to take device node pointer argument
> 	  rather than adding extra API.
> 	- Remove checking for clk pointer before clk_disable.
> 
> 
> Sowjanya Komatineni (18):
>   dt-bindings: i2c: tegra: Document Tegra210 VI I2C clocks and
>     power-domains
>   arm64: tegra: Add missing clocks and power-domains to Tegra210 VI I2C
>   i2c: tegra: Don't mark VI I2C as IRQ safe runtime PM
>   i2c: tegra: Fix the error path in tegra_i2c_runtime_resume
>   i2c: tegra: Fix runtime resume to re-init VI I2C
>   i2c: tegra: Avoid tegra_i2c_init_dma() for Tegra210 vi i2c
>   media: tegra-video: Fix channel format alignment
>   media: tegra-video: Enable TPG based on kernel config
>   media: tegra-video: Update format lookup to offset based
>   dt-bindings: tegra: Update VI and CSI bindings with port info
>   media: tegra-video: Add support for external sensor capture
>   media: tegra-video: Add support for selection ioctl ops
>   gpu: host1x: mipi: Update tegra_mipi_request() to be node based
>   gpu: host1x: mipi: Split tegra_mipi_calibrate and tegra_mipi_wait
>   media: tegra-video: Add CSI MIPI pads calibration
>   media: tegra-video: Compute settle times based on the clock rate
>   arm64: tegra: jetson-tx1: Add camera supplies
>   arm64: tegra: Enable Tegra VI CSI support for Jetson Nano
> 
>  .../display/tegra/nvidia,tegra20-host1x.txt        |  92 ++-
>  .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |  19 +-
>  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |  41 ++
>  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  10 +
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   6 +
>  drivers/gpu/drm/tegra/dsi.c                        |   9 +-
>  drivers/gpu/host1x/mipi.c                          |  30 +-
>  drivers/i2c/busses/i2c-tegra.c                     |  39 +-
>  drivers/staging/media/tegra-video/Kconfig          |   7 +
>  drivers/staging/media/tegra-video/csi.c            | 245 ++++++-
>  drivers/staging/media/tegra-video/csi.h            |   8 +
>  drivers/staging/media/tegra-video/tegra210.c       |  25 +-
>  drivers/staging/media/tegra-video/vi.c             | 770 +++++++++++++++++++--
>  drivers/staging/media/tegra-video/vi.h             |  23 +-
>  drivers/staging/media/tegra-video/video.c          |  23 +-
>  include/linux/host1x.h                             |   4 +-
>  16 files changed, 1251 insertions(+), 100 deletions(-)
> 
