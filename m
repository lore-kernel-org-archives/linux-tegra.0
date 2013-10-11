From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 17/27] drm/tegra: Add Tegra114 HDMI support
Date: Fri, 11 Oct 2013 16:19:19 -0600
Message-ID: <52587967.6050806@wwwdotorg.org>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com> <1381134884-5816-18-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-18-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/07/2013 02:34 AM, Thierry Reding wrote:
> From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Tegra114 TMDS configuration requires a new peak_current field and the
> driver current override bit has changed position.

> diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c

>  static const struct tmds_config tegra2_tmds_config[] = {
> @@ -223,6 +224,85 @@ static const struct tmds_config tegra3_tmds_config[] = {

Not related to this patch, but those should have been named
tegra20_tmds_config[] and tegra30_tmds_config[].

>  static void tegra_hdmi_setup_tmds(struct tegra_hdmi *hdmi,

> -	value = tmds->drive_current | DRIVE_CURRENT_FUSE_OVERRIDE;
> -	tegra_hdmi_writel(hdmi, value, HDMI_NV_PDISP_SOR_LANE_DRIVE_CURRENT);
> +	if (of_device_is_compatible(np, "nvidia,tegra114-hdmi")) {

Let's not check this at run-time. Instead, host1x_drm_subdevs[]'s .data
field should be used to contain either flags or a pointer to a
configuration structure, either of which can be directly consulted to
determine the properties of the HW in a feature-oriented/semantic way.

drivers/gpio/gpio-tegra.c's
tegra20_gpio_config/tegra30_gpio_config/tegra_gpio_of_match provide a
good example of this.

This means that if Tegra124 is identical to Tegra114, yet a hypothetical
Tegra999 is different, you don't have to keep adjusting these if
conditions throughout the code; they can simply refer to the same
feature bit forever.
