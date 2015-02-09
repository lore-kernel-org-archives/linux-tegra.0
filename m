From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mmc: tegra: Write xfer_mode, CMD regs in together
Date: Mon, 9 Feb 2015 15:22:49 +0900
Message-ID: <CAAVeFu+T-b9Nk5ZpDBfoC4a9=SzKV6_1h+kEzHaL8oKPOKfSqA@mail.gmail.com>
References: <1422379410-7127-1-git-send-email-rklein@nvidia.com>
 <CAAVeFuJKxY36BpA_dYhNnhH0v8ERaRYK9Be_hQNtG0H898U8EQ@mail.gmail.com> <54C90E97.2010104@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54C90E97.2010104-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chris Ball <chris-OsFVWbfNK3isTnJN9+BGXg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, pkunapuli-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 29, 2015 at 1:30 AM, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On 1/28/2015 1:06 AM, Alexandre Courbot wrote:
>> On Wed, Jan 28, 2015 at 2:23 AM, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>> From: Pavan Kunapuli <pkunapuli-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> If there is a gap between xfer mode and command register writes,
>>> tegra SDMMC controller can sometimes issue a spurious command before
>>> the CMD register is written. To avoid this, these two registers need
>>> to be written together in a single write operation.
>>>
>>> Signed-off-by: Pavan Kunapuli <pkunapuli-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>  drivers/mmc/host/sdhci-tegra.c |   31 ++++++++++++++++++++++++++++++-
>>>  1 file changed, 30 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
>>> index 59797106af93..3d34de47e57e 100644
>>> --- a/drivers/mmc/host/sdhci-tegra.c
>>> +++ b/drivers/mmc/host/sdhci-tegra.c
>>> @@ -41,6 +41,7 @@
>>>  #define NVQUIRK_DISABLE_SDR50          BIT(3)
>>>  #define NVQUIRK_DISABLE_SDR104         BIT(4)
>>>  #define NVQUIRK_DISABLE_DDR50          BIT(5)
>>> +#define NVQUIRK_SHADOW_XFER_MODE_REG   BIT(6)
>>>
>>>  struct sdhci_tegra_soc_data {
>>>         const struct sdhci_pltfm_data *pdata;
>>> @@ -67,6 +68,32 @@ static u16 tegra_sdhci_readw(struct sdhci_host *host, int reg)
>>>         return readw(host->ioaddr + reg);
>>>  }
>>>
>>> +static void tegra_sdhci_writew(struct sdhci_host *host, u16 val, int reg)
>>> +{
>>> +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>>> +       struct sdhci_tegra *tegra_host = pltfm_host->priv;
>>> +       const struct sdhci_tegra_soc_data *soc_data = tegra_host->soc_data;
>>> +
>>> +       if (soc_data->nvquirks * NVQUIRK_SHADOW_XFER_MODE_REG) {
>>
>> Isn't the '*' supposed to be a '&' here?
>
> Yah .. not sure how that happened, but it should be '&' good catch.
>
>>
>>> +               switch (reg) {
>>> +               case SDHCI_TRANSFER_MODE:
>>> +                       /*
>>> +                        * Postpone this write, we must do it together with a
>>> +                        * command write that is down below.
>>> +                        */
>>> +                       pltfm_host->xfer_mode_shadow = val;
>>> +                       return;
>>> +               case SDHCI_COMMAND:
>>> +                       writel((val << 16) | pltfm_host->xfer_mode_shadow,
>>> +                               host->ioaddr + SDHCI_TRANSFER_MODE);
>>> +                       pltfm_host->xfer_mode_shadow = 0;
>>
>> That last line is probably not needed and could actually be harmful -
>> if we try to write SDHCI_COMMAND twice in a raw without a write to
>> SDHCI_TRANSFER_MODE in between, the zero will overwrite the previous
>> value of SDHCI_TRANSFER_MODE.
>
> True, will remove it.
>
>>
>>> +                       return;
>>> +               }
>>> +       }
>>> +
>>> +       writew(val, host->ioaddr + reg);
>>> +}
>>> +
>>>  static void tegra_sdhci_writel(struct sdhci_host *host, u32 val, int reg)
>>>  {
>>>         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>>> @@ -147,6 +174,7 @@ static void tegra_sdhci_set_bus_width(struct sdhci_host *host, int bus_width)
>>>  static const struct sdhci_ops tegra_sdhci_ops = {
>>>         .get_ro     = tegra_sdhci_get_ro,
>>>         .read_w     = tegra_sdhci_readw,
>>> +       .write_w    = tegra_sdhci_writew,
>>>         .write_l    = tegra_sdhci_writel,
>>>         .set_clock  = sdhci_set_clock,
>>>         .set_bus_width = tegra_sdhci_set_bus_width,
>>> @@ -201,7 +229,8 @@ static struct sdhci_tegra_soc_data soc_data_tegra114 = {
>>>         .pdata = &sdhci_tegra114_pdata,
>>>         .nvquirks = NVQUIRK_DISABLE_SDR50 |
>>>                     NVQUIRK_DISABLE_DDR50 |
>>> -                   NVQUIRK_DISABLE_SDR104,
>>> +                   NVQUIRK_DISABLE_SDR104 |
>>> +                   NVQUIRK_SHADOW_XFER_MODE_REG,
>>>  };
>>
>> Since this only applies to Tegra114 (?), I wonder whether it would not
>> be better to have a dedicated tegra114_sdhci_ops that implements
>> tegra_sdhci_writew, and use it only in tegra_sdhci_writew. That way
>> you could get rid of the NVQUIRK_SHADOW_XFER_MODE_REG and the test for
>> it in tegra_sdhci_writew(), and chips prior to Tegra114 will not have
>> to needlessly check for it every time they write a register.
>
> The reason I did it this way, is that this doesn't explicitly just apply
> to T114. It actually applies to T114, T124 and T132. In that case, I
> think it makes sense to keep the QUIRK and I can update the commit
> description to reflect that.

All the same, I don't see what advantage we have checking for that
condition for every single write while we could simply set the right
function to use at probe time?
