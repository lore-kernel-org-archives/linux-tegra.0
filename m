From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 5/5] drm/tegra: Add minimal power management
Date: Tue, 23 Dec 2014 15:32:43 +0800
Message-ID: <54991A9B.5070703@nvidia.com>
References: <1419002698-4963-1-git-send-email-thierry.reding@gmail.com> <1419002698-4963-5-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419002698-4963-5-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

+1

Mark
On 12/19/2014 11:24 PM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> For now only disable the KMS hotplug polling helper logic upon suspend
> and re-enable it on resume.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/drm.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index 272c2dca3536..16c44b9abbd8 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -889,6 +889,30 @@ static int host1x_drm_remove(struct host1x_device *dev)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_PM_SLEEP
> +static int host1x_drm_suspend(struct device *dev)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +
> +	drm_kms_helper_poll_disable(drm);
> +
> +	return 0;
> +}
> +
> +static int host1x_drm_resume(struct device *dev)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +
> +	drm_kms_helper_poll_enable(drm);
> +
> +	return 0;
> +}
> +#endif
> +
> +static const struct dev_pm_ops host1x_drm_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(host1x_drm_suspend, host1x_drm_resume)
> +};
> +
>  static const struct of_device_id host1x_drm_subdevs[] = {
>  	{ .compatible = "nvidia,tegra20-dc", },
>  	{ .compatible = "nvidia,tegra20-hdmi", },
> @@ -910,6 +934,7 @@ static const struct of_device_id host1x_drm_subdevs[] = {
>  static struct host1x_driver host1x_drm_driver = {
>  	.driver = {
>  		.name = "drm",
> +		.pm = &host1x_drm_pm_ops,
>  	},
>  	.probe = host1x_drm_probe,
>  	.remove = host1x_drm_remove,
> 
