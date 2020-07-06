From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [RFC PATCH v2 11/18] media: tegra-video: Add support for external
 sensor capture
Date: Mon, 6 Jul 2020 13:49:45 +0200
Message-ID: <0e25a523-c911-0973-65ba-49883d2383fd@xs4all.nl>
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
 <1592358094-23459-12-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1592358094-23459-12-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 17/06/2020 03:41, Sowjanya Komatineni wrote:
> This patch adds support to capture from the external sensor
> based on device graph in the device tree.
> 
> Driver walks through the device graph to create media links
> between the entities and registers and unregisters video devices
> when the corresponding sub-devices are bound and unbound.
> 
> Channel formats are enumerated based on available formats from
> the sensor and the corresponding matched formats from the Tegra
> supported video formats list.
> 
> Each Tegra CSI instance can be configured as 4-lane or 2-lane
> based on supported lane configuration from the sensor through
> the device tree.
> 
> Currently this driver supports V4L2 video node centric only.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/staging/media/tegra-video/Kconfig    |   1 +
>  drivers/staging/media/tegra-video/csi.c      | 128 +++++-
>  drivers/staging/media/tegra-video/csi.h      |   1 +
>  drivers/staging/media/tegra-video/tegra210.c |   2 +-
>  drivers/staging/media/tegra-video/vi.c       | 623 +++++++++++++++++++++++++--
>  drivers/staging/media/tegra-video/vi.h       |  23 +-
>  6 files changed, 726 insertions(+), 52 deletions(-)
> 

<snip>

> +static int tegra_csi_channels_alloc(struct tegra_csi *csi)
> +{
> +	struct device_node *node = csi->dev->of_node;
> +	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };

A bus_type value of 0 is deprecated, this should be set to a valid
bus_type (probably V4L2_MBUS_CSI2_DPHY).

Regards,

	Hans
