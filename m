From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Subject: Re: [PATCH v5 1/5] mmc: core: Extend mmc_of_parse() to parse CQE
 bindings
Date: Tue, 12 May 2020 09:16:38 +0800
Message-ID: <1589246198.612.1.camel@mtkswgap22>
References: <1588031768-23677-1-git-send-email-chun-hung.wu@mediatek.com>
 <1588031768-23677-2-git-send-email-chun-hung.wu@mediatek.com>
 <9bc2454f-0b42-e256-7927-2564b56f369f@codeaurora.org>
 <CAPDyKFq7ffHeWg-S41tLvScg_BXCUULig=G=EzD_to1TG0NhVg@mail.gmail.com>
 <f9fa0232-3945-4e47-9238-0b51f6531199@codeaurora.org>
 <CAPDyKFoAa3=Rg77Af7nNQOZN13m9NQYERosrqiK_kuL3s-YECA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
In-Reply-To: <CAPDyKFoAa3=Rg77Af7nNQOZN13m9NQYERosrqiK_kuL3s-YECA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Kate Stewart <kstewart@linuxfoundation.org>, wsd_upstream <wsd_upstream@mediatek.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Al Cooper <alcooperx@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra <linux-tegra@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Pavel Machek <pavel@ucw.cz>, Florian Fainelli <f.fainelli@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Allison Randal <allison@lohutok.net>, Android Kernel Team <kernel-team@android.com>, Pan Bian <bianpan2016@163.com>, Veerabhadrarao Badiganti <vbadigan@codeaurora.org>, DTML <devicetree@vger.kernel.org>, Martin Blumenstingl <martin.blumenstingl@goog>
List-Id: linux-tegra@vger.kernel.org

On Fri, 2020-05-08 at 13:05 +0800, Ulf Hansson wrote:
> On Thu, 7 May 2020 at 18:33, Veerabhadrarao Badiganti
> <vbadigan@codeaurora.org> wrote:
> >
> >
> > On 5/6/2020 10:06 PM, Ulf Hansson wrote:
> > > On Wed, 6 May 2020 at 15:01, Veerabhadrarao Badiganti
> > > <vbadigan@codeaurora.org> wrote:
> > >>
> > >> On 4/28/2020 5:26 AM, Chun-Hung Wu wrote:
> > >>> Parse CQE bindings "supports-cqe" and "disable-cqe-dcmd"
> > >>> in mmc_of_parse().
> > >>>
> > >>> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> > >>> ---
> > >>>    drivers/mmc/core/host.c | 5 +++++
> > >>>    1 file changed, 5 insertions(+)
> > >>>
> > >>> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> > >>> index c876872..47521c6 100644
> > >>> --- a/drivers/mmc/core/host.c
> > >>> +++ b/drivers/mmc/core/host.c
> > >>> @@ -302,6 +302,11 @@ int mmc_of_parse(struct mmc_host *host)
> > >>>                host->caps2 |= MMC_CAP2_NO_SD;
> > >>>        if (device_property_read_bool(dev, "no-mmc"))
> > >>>                host->caps2 |= MMC_CAP2_NO_MMC;
> > >>> +     if (device_property_read_bool(dev, "supports-cqe"))
> > >>> +             host->caps2 |= MMC_CAP2_CQE;
> > >> This change is breaking emmc driver on qcom platforms where this dt
> > >> property is defined.
> > >>
> > >> [    1.543453]  cqhci_deactivate+0xc/0x38
> > >> [    1.545627]  sdhci_msm_reset+0x40/0x58
> > >> [    1.549447]  sdhci_do_reset+0x48/0x7c
> > >> [    1.553180]  __sdhci_read_caps+0x7c/0x214
> > >> [    1.556913]  sdhci_setup_host+0x58/0xce8
> > >> [    1.560905]  sdhci_msm_probe+0x588/0x8a4
> > >> [    1.564900]  platform_drv_probe+0x4c/0xb0
> > >>
> > >> So, we cant have this flag defined before sdhci_setup_host().
> > >>
> > >> I will have to clear this cap and re-enable it in our initialization.
> > > Thanks for reporting! I have dropped all the four patches from
> > > Chun-Hung, so we can figure out how to fix this.
> > >
> > > Please help to review the next version of the series.
> >
> > Thanks Ulf.
> >
> > Hi Chun-Hung,
> >
> > On qcom controller CQE also gets reset when SDHC is reset. So we have to
> > explicitly disable CQE
> > by invoking  cqhci_deactivate() during sdhc reset
> >
> > SDHC gets reset in sdhci_setup_host() even before cqe is initialized.
> > With MMC_CAP2_CQE_DCMD cap set even before sdhci_set_host(), we are
> > getting null pointer access with cqhci_deactivate().
> >
> > If CQE getting reset with SDHC reset is generic (applicable to other
> > controllers) then you have revisit your logic.
> > If its not the case then only qcom driver would get affected.
> 
> Thanks for clarifying the problem, much appreciated.
> 
> To me, it looks like the DT parsing of the CQE properties are better
> suited to be managed by each sdhci variant, to continue to leave some
> room for flexibility.
> 
> Chun-Hung, can you please drop patch 1 and patch2 from the series and
> adapt to this change in the mediatek variant?
Ok, I will rollback patch1 and patch2 from series and keep DT parsing
of the CQE properties by each sdhci/msdc variant.
CQE properties will move to mediatek variant.
> 
> [...]
> 
> Kind regards
> Uffe
