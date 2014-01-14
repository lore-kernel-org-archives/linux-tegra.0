From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 2/2] drm/tegra: Obtain head number from DT
Date: Tue, 14 Jan 2014 10:53:19 -0700
Message-ID: <52D5798F.1020500@wwwdotorg.org>
References: <1389710758-29444-1-git-send-email-treding@nvidia.com> <1389710758-29444-3-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389710758-29444-3-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/14/2014 07:45 AM, Thierry Reding wrote:
> The head number of a given display controller is fixed in hardware and
> required to program outputs appropriately. Relying on the driver probe
> order to determine this number will not work, since that could yield a
> situation where the second head was probed first and would be assigned
> head number 0 instead of 1.
> 
> By explicitly specifying the head number in the device tree, it is no
> longer necessary to rely on these assumptions. As a fallback, if the
> property isn't available, derive the head number from the display
> controller node's position in the device tree. That's somewhat more
> reliable than the previous default but not a proper solution.

The series,
Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This patch should really have been sent to the DT maintainers and list
since it changes a DT binding...

> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c

> +static int tegra_dc_parse_dt(struct tegra_dc *dc)
> +{
> +	struct device_node *np;
> +	u32 value = 0;
> +	int err;
> +
> +	err = of_property_read_u32(dc->dev->of_node, "nvidia,head", &value);

If of_property_read_u32() returns an error, does it guarantee that value
is left unchanged? I suspect it'd be safer to add ...

> +	if (err < 0) {
> +		dev_err(dc->dev, "missing \"nvidia,head\" property\n");
> +
> +		/*
> +		 * If the nvidia,head property isn't present, try to find the
> +		 * correct head number by looking up the position of this
> +		 * display controller's node within the device tree. Assuming
> +		 * that the nodes are ordered properly in the DTS file and
> +		 * that the translation into a flattened device tree blob
> +		 * preserves that ordering this will actually yield the right
> +		 * head number.
> +		 *
> +		 * If those assumptions don't hold, this will still work for
> +		 * cases where only a single display controller is used.
> +		 */

... "value = 0;" here?

> +		for_each_matching_node(np, tegra_dc_of_match) {
> +			if (np == dc->dev->of_node)
> +				break;
> +
> +			value++;
> +		}
> +	}
> +
> +	dc->pipe = value;
