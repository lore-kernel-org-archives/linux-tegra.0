From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 2/9] memory: tegra: add mc flush support
Date: Thu, 12 Feb 2015 17:56:27 +0900
Message-ID: <CAAVeFuLx5fr_kQonRZzTgsw-wND==jNwvMs9LkzhWrE0rRQ76w@mail.gmail.com>
References: <1421216372-8025-1-git-send-email-vinceh@nvidia.com> <1421216372-8025-3-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421216372-8025-3-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 14, 2015 at 3:19 PM, Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> The flush operation of memory clients is needed for various IP blocks in
> the Tegra SoCs to perform a clean reset.
>
> Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/memory/tegra/mc.c       | 132 ++++++++++++++++++++++++++++++++++++++++
>  drivers/memory/tegra/tegra114.c |   2 +-
>  drivers/memory/tegra/tegra30.c  |   2 +-
>  include/soc/tegra/mc.h          |  41 ++++++++++++-
>  4 files changed, 173 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> index fe3c44e7e1d1..35f769f9f1cd 100644
> --- a/drivers/memory/tegra/mc.c
> +++ b/drivers/memory/tegra/mc.c
> @@ -11,6 +11,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>
> @@ -62,6 +63,130 @@ static const struct of_device_id tegra_mc_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, tegra_mc_of_match);
>
> +static struct tegra_mc_swgroup *find_swgroup(struct tegra_mc *mc,
> +               unsigned int swgroup)

Indentation looks a little bit weird here.

> +{
> +       struct tegra_mc_swgroup *sg;
> +
> +       list_for_each_entry(sg, &mc->swgroups, head) {
> +               if (sg->id == swgroup)
> +                       return sg;
> +       }
> +
> +       return NULL;
> +}
> +
> +static struct tegra_mc_swgroup *add_swgroup(struct tegra_mc *mc,
> +       unsigned int swgroup)

Here too. Also even though they are static, these functions should
probably be prefixed with tegra_mc or something.

> +int tegra_mc_flush(struct tegra_mc_swgroup *sg)
> +{
> +       struct tegra_mc *mc;
> +       const struct tegra_mc_hotreset *client;
> +       int i;
> +
> +       if (!sg || !sg->mc)
> +               return -EINVAL;;
> +
> +       mc = sg->mc;
> +       if (!mc->soc->ops || !mc->soc->ops->flush)
> +               return -EINVAL;;
> +
> +       client = mc->soc->hotresets;
> +
> +       for (i = 0; i < mc->soc->num_hotresets; i++, client++) {
> +               if (sg->id == client->swgroup)
> +                       return mc->soc->ops->flush(mc, client);
> +       }
> +
> +       return -EINVAL;
> +}
> +EXPORT_SYMBOL(tegra_mc_flush);
> +
> +int tegra_mc_flush_done(struct tegra_mc_swgroup *sg)
> +{
> +       struct tegra_mc *mc;
> +       const struct tegra_mc_hotreset *client;
> +       int i;
> +
> +       if (!sg || !sg->mc)
> +               return -EINVAL;;
> +
> +       mc = sg->mc;
> +       if (!mc->soc->ops || !mc->soc->ops->flush)
> +               return -EINVAL;;
> +
> +       client = mc->soc->hotresets;
> +
> +       for (i = 0; i < mc->soc->num_hotresets; i++, client++) {
> +               if (sg->id == client->swgroup)
> +                       return mc->soc->ops->flush_done(mc, client);
> +       }
> +
> +       return -EINVAL;
> +}
> +EXPORT_SYMBOL(tegra_mc_flush_done);

These functions are identical, excepted for the callback they are
invoking. Could you merge the common part into a function that returns
the right client to call the callback on, or ERR_PTR(-EINVAL) in case
of failure?

> +
> +static int tegra_mc_build_swgroup(struct tegra_mc *mc)
> +{
> +       int i;
> +
> +       for (i = 0; i < mc->soc->num_clients; i++) {
> +               struct tegra_mc_swgroup *sg;
> +
> +               sg = find_swgroup(mc, mc->soc->clients[i].swgroup);
> +
> +               if (!sg) {
> +                       sg = add_swgroup(mc,  mc->soc->clients[i].swgroup);
> +                       if (IS_ERR(sg))
> +                               return PTR_ERR(sg);
> +               }
> +
> +               list_add_tail(&mc->soc->clients[i].head, &sg->clients);
> +       }
> +
> +       return 0;
> +}
> +
>  static int tegra_mc_setup_latency_allowance(struct tegra_mc *mc)
>  {
>         unsigned long long tick;
> @@ -229,6 +354,13 @@ static int tegra_mc_probe(struct platform_device *pdev)
>         /* length of MC tick in nanoseconds */
>         mc->tick = 30;
>
> +       INIT_LIST_HEAD(&mc->swgroups);
> +       err = tegra_mc_build_swgroup(mc);
> +       if (err) {
> +               dev_err(&pdev->dev, "failed to build swgroup: %d\n", err);
> +               return err;
> +       }
> +
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         mc->regs = devm_ioremap_resource(&pdev->dev, res);
>         if (IS_ERR(mc->regs))
> diff --git a/drivers/memory/tegra/tegra114.c b/drivers/memory/tegra/tegra114.c
> index 511e9a25c151..92ab5552fcee 100644
> --- a/drivers/memory/tegra/tegra114.c
> +++ b/drivers/memory/tegra/tegra114.c
> @@ -15,7 +15,7 @@
>
>  #include "mc.h"
>
> -static const struct tegra_mc_client tegra114_mc_clients[] = {
> +static struct tegra_mc_client tegra114_mc_clients[] = {

Why is this needed? I cannot see anything in this patch that would
require dropping the const here.
