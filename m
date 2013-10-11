From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 25/27] gpu: host1x: Add MIPI pad calibration support
Date: Fri, 11 Oct 2013 16:37:35 -0600
Message-ID: <52587DAF.9080003@wwwdotorg.org>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com> <1381134884-5816-26-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-26-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/07/2013 02:34 AM, Thierry Reding wrote:
> This driver adds support to perform calibration of the MIPI pads for CSI
> and DSI.

> diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c

> +int tegra_mipi_calibrate(struct device *device)
...
> +	err = of_parse_phandle_with_args(device->of_node, "calibrate",
> +					 "#calibrate-cells", 0, &args);
...
> +static struct of_device_id tegra_mipi_of_match[] = {
> +	{ .compatible = "nvidia,tegra114-mipi", },

Is the DT binding for that compatible value documented anywhere? I'm not
sure what #calibrate-cells means; it doesn't seem to be used...
