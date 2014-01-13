From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] drm/tegra: Obtain head number from DT
Date: Mon, 13 Jan 2014 10:46:45 -0700
Message-ID: <52D42685.1040603@wwwdotorg.org>
References: <1389622894-9574-1-git-send-email-treding@nvidia.com> <1389622894-9574-3-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389622894-9574-3-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/13/2014 07:21 AM, Thierry Reding wrote:
> The head number of a given display controller is fixed in hardware and
> required to program outputs appropriately. Relying on the driver probe
> order to determine this number will not work, since that could yield a
> situation where the second head was probed first and would be assigned
> head number 0 instead of 1.

This change makes the new properties mandatory, yet they aren't part of
the DT files yet. So, won't this patch break all display on Tegra?

To avoid having to modify the Tegra DTs in this patch, can't the code
fall back to the existing broken algorithm if the property is missing, i.e.:

> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c

> -	dc->pipe = tegra->drm->mode_config.num_crtc;

Instead,:

	if (dc->pipe == -1)
		dc->pipe = tegra->drm->mode_config.num_crtc;

> +static int tegra_dc_parse_dt(struct tegra_dc *dc)
> +{
> +	u32 value;
> +	int err;
> +
> +	err = of_property_read_u32(dc->dev->of_node, "nvidia,head", &value);
> +	if (err < 0)
> +		return err;
> +
> +	dc->pipe = value;

Instead:

	err = ...
	if (!err)
		dc->pipe = value;
	else
		/* Perhaps also emit an error message here */
		dc->pipe = -1;
