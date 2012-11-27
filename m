From: Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC v2 1/8] video: tegra: Add nvhost driver
Date: Tue, 27 Nov 2012 12:52:30 +0200
Message-ID: <20121127105230.GD10090@sivaramn-lnx>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com>
 <1353935954-13763-2-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353935954-13763-2-git-send-email-tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 26, 2012 at 02:19:07PM +0100, Terje Bergstrom wrote:
> +
> +struct nvhost_chip_support *nvhost_chip_ops;

should be static?

> +static int __devinit nvhost_alloc_resources(struct nvhost_master *host)
> +{
> +       int err;
> +
> +       err = nvhost_init_chip_support(host);
> +       if (err)
> +               return err;
> +
> +       return 0;

nit: why not just return err - the 'if(err)' is unnecessary)?

> +
> +       nvhost = host;

I think this should be delayed until the init is complete as this
variable is not cleared if there is a failure during init. Also I feel
that the name nvhost is a bit short for an exported variable.

> +static void to_state_running_locked(struct platform_device *dev)
> +{
> +       struct nvhost_device_data *pdata = platform_get_drvdata(dev);
> +       int prev_state = pdata->powerstate;
> +
> +       if (pdata->powerstate == NVHOST_POWER_STATE_POWERGATED)
> +               to_state_clockgated_locked(dev);
> +
> +       if (pdata->powerstate == NVHOST_POWER_STATE_CLOCKGATED) {
> +               int i;
> +
> +               if (dev->dev.parent)
> +                       nvhost_module_busy(to_platform_device(dev->dev.parent));
> +
> +               for (i = 0; i < pdata->num_clks; i++) {
> +                       int err = clk_prepare_enable(pdata->clk[i]);
> +                       if (err) {
> +                               dev_err(&dev->dev, "Cannot turn on clock %s",
> +                                       pdata->clocks[i].name);
> +                               return;

In case of an error, returning here leaves some clocks turned on. 

Sivaram
