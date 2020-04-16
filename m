From: Alan Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] [2/5] mmc: host: Remove redundant host CQE bindings
Date: Thu, 16 Apr 2020 14:25:52 -0400
Message-ID: <CAOGqxeWvo0Dd6DaSEnosFV8xWngUq9By-hdtu4yJZwh6R=PgLw@mail.gmail.com>
References: <1586165281-11888-1-git-send-email-chun-hung.wu@mediatek.com>
 <1586165281-11888-3-git-send-email-chun-hung.wu@mediatek.com>
 <CAOGqxeUjx+OWRhwWznk-uHZ9op7WTZaAGq6xd4Z4QdL+Hja2yA@mail.gmail.com> <1586823738.16047.7.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1586823738.16047.7.camel@mtkswgap22>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chun-Hung Wu <chun-hung.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chaotian Jing <chaotian.jing-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Kate Stewart <kstewart-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Martin Blumenstingl <martin.bl>
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 13, 2020 at 8:22 PM Chun-Hung Wu <chun-hung.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>
> On Mon, 2020-04-06 at 09:59 -0400, Alan Cooper wrote:
> > On Mon, Apr 6, 2020 at 5:28 AM Chun-Hung Wu <chun-hung.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > >
> > > CQE bindings "supports-cqe" and "disable-cqe-dcmd" is parsed
> > > in mmc_of_parse(). Remove vendor code which parses CQE bindings,
> > > and use mmc_host->caps2 to decide support CQE or not.
> > >
> > > Signed-off-by: Chun-Hung Wu <chun-hung.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > ---
> > >  drivers/mmc/host/sdhci-brcmstb.c   | 11 ++++++-----
> > >  drivers/mmc/host/sdhci-msm.c       |  3 +--
> > >  drivers/mmc/host/sdhci-of-arasan.c |  3 ---
> > >  drivers/mmc/host/sdhci-tegra.c     |  2 +-
> > >  4 files changed, 8 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
> > > index ad01f64..07c90c6 100644
> > > --- a/drivers/mmc/host/sdhci-brcmstb.c
> > > +++ b/drivers/mmc/host/sdhci-brcmstb.c
> > > @@ -247,10 +247,6 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
> > >                 return res;
> > >
> > >         memset(&brcmstb_pdata, 0, sizeof(brcmstb_pdata));
> > > -       if (device_property_read_bool(&pdev->dev, "supports-cqe")) {
> > > -               has_cqe = true;
> > > -               match_priv->ops->irq = sdhci_brcmstb_cqhci_irq;
> >
> > The above line that sets the irq was moved to later in the function,
> > but needs to come before sdhci_pltfm_init()
> >
> > Al
> After check the code in sdhci_pltfm_init(), I don't see where
> match_priv->ops->irq being used in code section.
> Only "host->ops = pdata->ops;" is assigned, may I know why should
> we put match_priv->ops->irq = sdhci_brcmstb_cqhci_irq; before
> sdhci_pltfm_init()?
> By the way, host only added to kernel after sdhci_brcmstb_add_host(),
> So, I suppose isr assignment is ok before anywhere of it.

I thought I remembered having to move the "set irq" to before
sdhci_pltfm_init() when I first added the functionality, but it looks
like it isn't necessary
I tested your changes and they worked correctly.
Acked-by: Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>



> >
> > > -       }
> > >         brcmstb_pdata.ops = match_priv->ops;
> > >         host = sdhci_pltfm_init(pdev, &brcmstb_pdata,
> > >                                 sizeof(struct sdhci_brcmstb_priv));
> > > @@ -261,7 +257,6 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
> > >
> > >         pltfm_host = sdhci_priv(host);
> > >         priv = sdhci_pltfm_priv(pltfm_host);
> > > -       priv->has_cqe = has_cqe;
> > >
> > >         /* Map in the non-standard CFG registers */
> > >         iomem = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > > @@ -276,6 +271,12 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
> > >         if (res)
> > >                 goto err;
> > >
> > > +       if (host->mmc->caps2 & MMC_CAP2_CQE) {
> > > +               has_cqe = true;
> > > +               match_priv->ops->irq = sdhci_brcmstb_cqhci_irq;
> > > +       }
> > > +       priv->has_cqe = has_cqe;
> > > +
> > >         /*
> > >          * If the chip has enhanced strobe and it's enabled, add
> > >          * callback
> > > diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> > > index c3a160c..fbb2f57 100644
> > > --- a/drivers/mmc/host/sdhci-msm.c
> > > +++ b/drivers/mmc/host/sdhci-msm.c
> > > @@ -1880,7 +1880,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
> > >         u8 core_major;
> > >         const struct sdhci_msm_offset *msm_offset;
> > >         const struct sdhci_msm_variant_info *var_info;
> > > -       struct device_node *node = pdev->dev.of_node;
> > >
> > >         host = sdhci_pltfm_init(pdev, &sdhci_msm_pdata, sizeof(*msm_host));
> > >         if (IS_ERR(host))
> > > @@ -2076,7 +2075,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
> > >         pm_runtime_use_autosuspend(&pdev->dev);
> > >
> > >         host->mmc_host_ops.execute_tuning = sdhci_msm_execute_tuning;
> > > -       if (of_property_read_bool(node, "supports-cqe"))
> > > +       if (host->mmc->caps2 & MMC_CAP2_CQE)
> > >                 ret = sdhci_msm_cqe_add_host(host, pdev);
> > >         else
> > >                 ret = sdhci_add_host(host);
> > > diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
> > > index e49b44b..359eff6 100644
> > > --- a/drivers/mmc/host/sdhci-of-arasan.c
> > > +++ b/drivers/mmc/host/sdhci-of-arasan.c
> > > @@ -1281,9 +1281,6 @@ static int sdhci_arasan_probe(struct platform_device *pdev)
> > >                                         sdhci_arasan_voltage_switch;
> > >                 sdhci_arasan->has_cqe = true;
> > >                 host->mmc->caps2 |= MMC_CAP2_CQE;
> > > -
> > > -               if (!of_property_read_bool(np, "disable-cqe-dcmd"))
> > > -                       host->mmc->caps2 |= MMC_CAP2_CQE_DCMD;
> > >         }
> > >
> > >         ret = sdhci_arasan_add_host(sdhci_arasan);
> > > diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> > > index 403ac44..d09abdd 100644
> > > --- a/drivers/mmc/host/sdhci-tegra.c
> > > +++ b/drivers/mmc/host/sdhci-tegra.c
> > > @@ -715,7 +715,7 @@ static void tegra_sdhci_parse_dt(struct sdhci_host *host)
> > >         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > >         struct sdhci_tegra *tegra_host = sdhci_pltfm_priv(pltfm_host);
> > >
> > > -       if (device_property_read_bool(host->mmc->parent, "supports-cqe"))
> > > +       if (host->mmc->caps2 & MMC_CAP2_CQE)
> > >                 tegra_host->enable_hwcq = true;
> > >         else
> > >                 tegra_host->enable_hwcq = false;
> > > --
> > > 1.9.1
>
