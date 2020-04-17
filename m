From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] sdhci: tegra: Implement Tegra specific set_timeout callback
Date: Fri, 17 Apr 2020 10:04:42 +0200
Message-ID: <CAPDyKFohGL-401DVb1NYf3YUwbokcDR5++8t5o+y+3yy5XbGyQ@mail.gmail.com>
References: <1583886030-11339-1-git-send-email-skomatineni@nvidia.com>
 <CA+G9fYvreAv5HmZg0O4VvLvf_PYSvzD1rp08XONNQGExctgQ0Q@mail.gmail.com>
 <CAPDyKFpZEiqTdD6O-y6Sw7ifXF__MHAv0zKT=RFKs+Fmvr-K_Q@mail.gmail.com>
 <753ec108-858c-660e-af0a-f57922134609@nvidia.com> <512441d1-a9ba-912f-ed2e-46edad22278b@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <512441d1-a9ba-912f-ed2e-46edad22278b-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Naresh Kamboju <naresh.kamboju-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "(Exiting) Baolin Wang" <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kate Stewart <kstewart-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Bradley Bolen <bradleybolen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Aniruddha Tvs Rao <anrao-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkft-triage-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux- stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 16 Apr 2020 at 21:39, Sowjanya Komatineni
<skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
>
> On 4/16/20 9:29 AM, Sowjanya Komatineni wrote:
> >
> > On 4/16/20 3:59 AM, Ulf Hansson wrote:
> >> External email: Use caution opening links or attachments
> >>
> >>
> >> On Wed, 15 Apr 2020 at 19:55, Naresh Kamboju
> >> <naresh.kamboju-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> >>> On Fri, 13 Mar 2020 at 06:41, Sowjanya Komatineni
> >>> <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> >>>> Tegra host supports HW busy detection and timeouts based on the
> >>>> count programmed in SDHCI_TIMEOUT_CONTROL register and max busy
> >>>> timeout it supports is 11s in finite busy wait mode.
> >>>>
> >>>> Some operations like SLEEP_AWAKE, ERASE and flush cache through
> >>>> SWITCH commands take longer than 11s and Tegra host supports
> >>>> infinite HW busy wait mode where HW waits forever till the card
> >>>> is busy without HW timeout.
> >>>>
> >>>> This patch implements Tegra specific set_timeout sdhci_ops to allow
> >>>> switching between finite and infinite HW busy detection wait modes
> >>>> based on the device command expected operation time.
> >>>>
> >>>> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>> ---
> >>>>   drivers/mmc/host/sdhci-tegra.c | 31 +++++++++++++++++++++++++++++++
> >>>>   1 file changed, 31 insertions(+)
> >>>>
> >>>> diff --git a/drivers/mmc/host/sdhci-tegra.c
> >>>> b/drivers/mmc/host/sdhci-tegra.c
> >>>> index a25c3a4..fa8f6a4 100644
> >>>> --- a/drivers/mmc/host/sdhci-tegra.c
> >>>> +++ b/drivers/mmc/host/sdhci-tegra.c
> >>>> @@ -45,6 +45,7 @@
> >>>>   #define SDHCI_TEGRA_CAP_OVERRIDES_DQS_TRIM_SHIFT       8
> >>>>
> >>>>   #define SDHCI_TEGRA_VENDOR_MISC_CTRL 0x120
> >>>> +#define SDHCI_MISC_CTRL_ERASE_TIMEOUT_LIMIT BIT(0)
> >>>>   #define SDHCI_MISC_CTRL_ENABLE_SDR104                  0x8
> >>>>   #define SDHCI_MISC_CTRL_ENABLE_SDR50 0x10
> >>>>   #define SDHCI_MISC_CTRL_ENABLE_SDHCI_SPEC_300 0x20
> >>>> @@ -1227,6 +1228,34 @@ static u32 sdhci_tegra_cqhci_irq(struct
> >>>> sdhci_host *host, u32 intmask)
> >>>>          return 0;
> >>>>   }
> >>>>
> >>>> +static void tegra_sdhci_set_timeout(struct sdhci_host *host,
> >>>> +                                   struct mmc_command *cmd)
> >>>> +{
> >>>> +       u32 val;
> >>>> +
> >>>> +       /*
> >>>> +        * HW busy detection timeout is based on programmed data
> >>>> timeout
> >>>> +        * counter and maximum supported timeout is 11s which may
> >>>> not be
> >>>> +        * enough for long operations like cache flush, sleep
> >>>> awake, erase.
> >>>> +        *
> >>>> +        * ERASE_TIMEOUT_LIMIT bit of VENDOR_MISC_CTRL register allows
> >>>> +        * host controller to wait for busy state until the card is
> >>>> busy
> >>>> +        * without HW timeout.
> >>>> +        *
> >>>> +        * So, use infinite busy wait mode for operations that may
> >>>> take
> >>>> +        * more than maximum HW busy timeout of 11s otherwise use
> >>>> finite
> >>>> +        * busy wait mode.
> >>>> +        */
> >>>> +       val = sdhci_readl(host, SDHCI_TEGRA_VENDOR_MISC_CTRL);
> >>>> +       if (cmd && cmd->busy_timeout >= 11 * HZ)
> >>>> +               val |= SDHCI_MISC_CTRL_ERASE_TIMEOUT_LIMIT;
> >>>> +       else
> >>>> +               val &= ~SDHCI_MISC_CTRL_ERASE_TIMEOUT_LIMIT;
> >>>> +       sdhci_writel(host, val, SDHCI_TEGRA_VENDOR_MISC_CTRL);
> >>>> +
> >>>> +       __sdhci_set_timeout(host, cmd);
> >>> kernel build on arm and arm64 architecture failed on stable-rc 4.19
> >>> (arm), 5.4 (arm64) and 5.5 (arm64)
> >>>
> >>> drivers/mmc/host/sdhci-tegra.c: In function 'tegra_sdhci_set_timeout':
> >>> drivers/mmc/host/sdhci-tegra.c:1256:2: error: implicit declaration of
> >>> function '__sdhci_set_timeout'; did you mean
> >>> 'tegra_sdhci_set_timeout'? [-Werror=implicit-function-declaration]
> >>>    __sdhci_set_timeout(host, cmd);
> >>>    ^~~~~~~~~~~~~~~~~~~
> >>>    tegra_sdhci_set_timeout
> >>>
> >>> Full build log,
> >>> https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-stable-rc-5.5/DISTRO=lkft,MACHINE=am57xx-evm,label=docker-lkft/83/consoleText
> >>>
> >>> https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-stable-rc-5.4/DISTRO=lkft,MACHINE=juno,label=docker-lkft/158/consoleText
> >>>
> >>> https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-stable-rc-4.19/DISTRO=lkft,MACHINE=am57xx-evm,label=docker-lkft/511/consoleText
> >>>
> >>>
> >>> - Naresh
> >> Thanks for reporting! What a mess.
> >>
> >> It turns out that the commit that was queued for stable that is
> >> causing the above errors, also requires another commit.
> >>
> >> The commit that was queued:
> >> 5e958e4aacf4 ("sdhci: tegra: Implement Tegra specific set_timeout
> >> callback")
> >>
> >> The additional commit needed (which was added in v5.6-rc1):
> >> 7d76ed77cfbd ("mmc: sdhci: Refactor sdhci_set_timeout()")
> >>
> >> However, the above commit needs a manual backport (quite trivial, but
> >> still) for the relevant stable kernels, to allow it to solve the build
> >> problems.
> >>
> >> Greg, Sasha - I suggest you to drop the offending commit from the
> >> stable kernels, for now. I think it's better to let Sowjanya deal with
> >> the backports, then send them in small series instead.
> >>
> >> Kind regards
> >> Uffe
> >
> > Hi Ufee,
> >
> > Will back-porting below commit cause any issues to other vendors?
> >
> > 7d76ed77cfbd ("mmc: sdhci: Refactor sdhci_set_timeout()")
> >
> sdhci-tegra driver in 4.19 is using same sdhci_ops for Tegra114 and
> Tegra210 and separate sdhci_ops for T210 started from 4.20.
>
> 5e958e4aacf4 ("sdhci: tegra: Implement Tegra specific set_timeout callback")
>
> So above commit can't be applied to 4.19. So probably a separate patch
> need to be created to apply for 4.19 and back port above commit along
> with its dependency commit (7d76ed77cfbd ("mmc: sdhci: Refactor
> sdhci_set_timeout()") for 5.4 and 5.4.

Alright, seems reasonable. Just keep me/Adrian on cc when/if you post
the patches so we can ack them.

Kind regards
Uffe
