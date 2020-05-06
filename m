From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/5] mmc: core: Extend mmc_of_parse() to parse CQE bindings
Date: Wed, 6 May 2020 18:36:12 +0200
Message-ID: <CAPDyKFq7ffHeWg-S41tLvScg_BXCUULig=G=EzD_to1TG0NhVg@mail.gmail.com>
References: <1588031768-23677-1-git-send-email-chun-hung.wu@mediatek.com>
 <1588031768-23677-2-git-send-email-chun-hung.wu@mediatek.com> <9bc2454f-0b42-e256-7927-2564b56f369f@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9bc2454f-0b42-e256-7927-2564b56f369f-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Veerabhadrarao Badiganti <vbadigan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Chun-Hung Wu <chun-hung.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chaotian Jing <chaotian.jing-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Kate Stewart <kstewart-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 6 May 2020 at 15:01, Veerabhadrarao Badiganti
<vbadigan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>
>
> On 4/28/2020 5:26 AM, Chun-Hung Wu wrote:
> > Parse CQE bindings "supports-cqe" and "disable-cqe-dcmd"
> > in mmc_of_parse().
> >
> > Signed-off-by: Chun-Hung Wu <chun-hung.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >   drivers/mmc/core/host.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> > index c876872..47521c6 100644
> > --- a/drivers/mmc/core/host.c
> > +++ b/drivers/mmc/core/host.c
> > @@ -302,6 +302,11 @@ int mmc_of_parse(struct mmc_host *host)
> >               host->caps2 |= MMC_CAP2_NO_SD;
> >       if (device_property_read_bool(dev, "no-mmc"))
> >               host->caps2 |= MMC_CAP2_NO_MMC;
> > +     if (device_property_read_bool(dev, "supports-cqe"))
> > +             host->caps2 |= MMC_CAP2_CQE;
>
> This change is breaking emmc driver on qcom platforms where this dt
> property is defined.
>
> [    1.543453]  cqhci_deactivate+0xc/0x38
> [    1.545627]  sdhci_msm_reset+0x40/0x58
> [    1.549447]  sdhci_do_reset+0x48/0x7c
> [    1.553180]  __sdhci_read_caps+0x7c/0x214
> [    1.556913]  sdhci_setup_host+0x58/0xce8
> [    1.560905]  sdhci_msm_probe+0x588/0x8a4
> [    1.564900]  platform_drv_probe+0x4c/0xb0
>
> So, we cant have this flag defined before sdhci_setup_host().
>
> I will have to clear this cap and re-enable it in our initialization.

Thanks for reporting! I have dropped all the four patches from
Chun-Hung, so we can figure out how to fix this.

Please help to review the next version of the series.

>
> > +     if (!device_property_read_bool(dev, "disable-cqe-dcmd")) {
> > +             host->caps2 |= MMC_CAP2_CQE_DCMD;
> > +     }
> >
> >       /* Must be after "non-removable" check */
> >       if (device_property_read_u32(dev, "fixed-emmc-driver-type", &drv_type) == 0) {

Kind regards
Uffe
