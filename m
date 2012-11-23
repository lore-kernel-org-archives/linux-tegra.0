From: Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/6] gpu: drm: tegra: Remove redundant host1x
Date: Fri, 23 Nov 2012 10:24:04 +0200
Message-ID: <20121123082404.GA10090@sivaramn-lnx>
References: <1353586614-7308-1-git-send-email-tbergstrom@nvidia.com>
 <1353586614-7308-4-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353586614-7308-4-git-send-email-tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 22, 2012 at 01:16:51PM +0100, Terje Bergstrom wrote:
> From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 

<snip>

> +
> +int tegra_drm_unregister_client(struct tegra_drm_client *client)
> +{
> +       int ret = 0;
> +
> +       list_for_each_entry(client, &tegra_drm_subdrv_list, list) {
> +
> +               struct platform_device *pdev = to_platform_device(client->dev);
> +
> +               if (client->ops && client->ops->drm_exit) {
> +                       int err = client->ops->drm_exit(client);

Shadow error variable err (ret is not used)

> +                       if (err < 0)
> +                               dev_dbg(client->dev, "drm_exit() failed for %s: %d\n",
> +                                       dev_name(client->dev), err);
> +               }
> +
> +               /* if this is the last device, unregister the drm driver */
> +               if (client->list.next == &tegra_drm_subdrv_list)
> +                       drm_platform_exit(&tegra_drm_driver, pdev);
> +
> +               list_del_init(&client->list);
> +       }
> +
> +       return ret;
> +}
> +
> +static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
> +{
> +       struct tegra_drm_client *client;
> +       int err;
> +
> +       drm_mode_config_init(drm);
> +
> +       list_for_each_entry(client, &tegra_drm_subdrv_list, list) {
> +               if (client->ops && client->ops->drm_init) {
> +                       int err = client->ops->drm_init(client, drm);

Shadow variable

-Sivaram
