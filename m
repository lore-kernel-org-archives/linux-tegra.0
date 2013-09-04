From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 1/6] host1x: hdmi: Add Tegra114 support
Date: Wed, 04 Sep 2013 12:39:59 -0600
Message-ID: <52277E7F.5050609@wwwdotorg.org>
References: <1377704922-2824-1-git-send-email-mperttunen@nvidia.com> <1377704922-2824-2-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1377704922-2824-2-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/28/2013 09:48 AM, Mikko Perttunen wrote:
> Add Tegra114 TMDS configuration, add new peak_current field and
> use new place for drive current override bit on Tegra114 platform.

> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c

>  static struct of_device_id host1x_of_match[] = {
> +	{ .compatible = "nvidia,tegra114-host1x", .data = &host1x01_info, },

We should add that value to the host1x DT binding documentation.

> diff --git a/drivers/gpu/host1x/drm/hdmi.c b/drivers/gpu/host1x/drm/hdmi.c

>  static const struct tegra_hdmi_audio_config *
>  tegra_hdmi_get_audio_config(unsigned int audio_freq, unsigned int pclk)
>  {
> @@ -593,8 +673,20 @@ static void tegra_hdmi_setup_tmds(struct tegra_hdmi *hdmi,
>  	tegra_hdmi_writel(hdmi, tmds->pll1, HDMI_NV_PDISP_SOR_PLL1);
>  	tegra_hdmi_writel(hdmi, tmds->pe_current, HDMI_NV_PDISP_PE_CURRENT);
>  
> -	value = tmds->drive_current | DRIVE_CURRENT_FUSE_OVERRIDE;
> -	tegra_hdmi_writel(hdmi, value, HDMI_NV_PDISP_SOR_LANE_DRIVE_CURRENT);
> +	if (of_device_is_compatible(hdmi->dev->of_node,
> +		"nvidia,tegra114-hdmi")) {

We shouldn't do this at run-time. Rather, set tegra_hdmi_of_match[]'s
.data field to a structure that represents the various features of the
HW, and then make this code conditional upon a feature flag in that
structure.
