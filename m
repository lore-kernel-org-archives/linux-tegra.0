From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/2] sdhci: tegra: Implement Tegra specific set_timeout
 callback
Date: Thu, 16 Apr 2020 12:38:55 -0700
Message-ID: <512441d1-a9ba-912f-ed2e-46edad22278b@nvidia.com>
References: <1583886030-11339-1-git-send-email-skomatineni@nvidia.com>
 <CA+G9fYvreAv5HmZg0O4VvLvf_PYSvzD1rp08XONNQGExctgQ0Q@mail.gmail.com>
 <CAPDyKFpZEiqTdD6O-y6Sw7ifXF__MHAv0zKT=RFKs+Fmvr-K_Q@mail.gmail.com>
 <753ec108-858c-660e-af0a-f57922134609@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <753ec108-858c-660e-af0a-f57922134609-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Naresh Kamboju <naresh.kamboju-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "(Exiting) Baolin Wang" <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kate Stewart <kstewart-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Bradley Bolen <bradleybolen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Aniruddha Tvs Rao <anrao-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkft-triage-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux- stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 4/16/20 9:29 AM, Sowjanya Komatineni wrote:
>
> On 4/16/20 3:59 AM, Ulf Hansson wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> On Wed, 15 Apr 2020 at 19:55, Naresh Kamboju=20
>> <naresh.kamboju-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>> On Fri, 13 Mar 2020 at 06:41, Sowjanya Komatineni
>>> <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>>> Tegra host supports HW busy detection and timeouts based on the
>>>> count programmed in SDHCI_TIMEOUT_CONTROL register and max busy
>>>> timeout it supports is 11s in finite busy wait mode.
>>>>
>>>> Some operations like SLEEP_AWAKE, ERASE and flush cache through
>>>> SWITCH commands take longer than 11s and Tegra host supports
>>>> infinite HW busy wait mode where HW waits forever till the card
>>>> is busy without HW timeout.
>>>>
>>>> This patch implements Tegra specific set_timeout sdhci_ops to allow
>>>> switching between finite and infinite HW busy detection wait modes
>>>> based on the device command expected operation time.
>>>>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>> ---
>>>> =C2=A0 drivers/mmc/host/sdhci-tegra.c | 31 +++++++++++++++++++++++++++=
++++
>>>> =C2=A0 1 file changed, 31 insertions(+)
>>>>
>>>> diff --git a/drivers/mmc/host/sdhci-tegra.c=20
>>>> b/drivers/mmc/host/sdhci-tegra.c
>>>> index a25c3a4..fa8f6a4 100644
>>>> --- a/drivers/mmc/host/sdhci-tegra.c
>>>> +++ b/drivers/mmc/host/sdhci-tegra.c
>>>> @@ -45,6 +45,7 @@
>>>> =C2=A0 #define SDHCI_TEGRA_CAP_OVERRIDES_DQS_TRIM_SHIFT=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 8
>>>>
>>>> =C2=A0 #define SDHCI_TEGRA_VENDOR_MISC_CTRL 0x120
>>>> +#define SDHCI_MISC_CTRL_ERASE_TIMEOUT_LIMIT BIT(0)
>>>> =C2=A0 #define SDHCI_MISC_CTRL_ENABLE_SDR104=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x8
>>>> =C2=A0 #define SDHCI_MISC_CTRL_ENABLE_SDR50 0x10
>>>> =C2=A0 #define SDHCI_MISC_CTRL_ENABLE_SDHCI_SPEC_300 0x20
>>>> @@ -1227,6 +1228,34 @@ static u32 sdhci_tegra_cqhci_irq(struct=20
>>>> sdhci_host *host, u32 intmask)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> =C2=A0 }
>>>>
>>>> +static void tegra_sdhci_set_timeout(struct sdhci_host *host,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mmc_com=
mand *cmd)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 val;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * HW busy detection timeou=
t is based on programmed data=20
>>>> timeout
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * counter and maximum supp=
orted timeout is 11s which may=20
>>>> not be
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * enough for long operatio=
ns like cache flush, sleep=20
>>>> awake, erase.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * ERASE_TIMEOUT_LIMIT bit =
of VENDOR_MISC_CTRL register allows
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * host controller to wait =
for busy state until the card is=20
>>>> busy
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * without HW timeout.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * So, use infinite busy wa=
it mode for operations that may=20
>>>> take
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * more than maximum HW bus=
y timeout of 11s otherwise use=20
>>>> finite
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * busy wait mode.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D sdhci_readl(host, SDHCI_=
TEGRA_VENDOR_MISC_CTRL);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (cmd && cmd->busy_timeout >=
=3D 11 * HZ)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 val |=3D SDHCI_MISC_CTRL_ERASE_TIMEOUT_LIMIT;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 val &=3D ~SDHCI_MISC_CTRL_ERASE_TIMEOUT_LIMIT;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sdhci_writel(host, val, SDHCI_TE=
GRA_VENDOR_MISC_CTRL);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __sdhci_set_timeout(host, cmd);
>>> kernel build on arm and arm64 architecture failed on stable-rc 4.19
>>> (arm), 5.4 (arm64) and 5.5 (arm64)
>>>
>>> drivers/mmc/host/sdhci-tegra.c: In function 'tegra_sdhci_set_timeout':
>>> drivers/mmc/host/sdhci-tegra.c:1256:2: error: implicit declaration of
>>> function '__sdhci_set_timeout'; did you mean
>>> 'tegra_sdhci_set_timeout'? [-Werror=3Dimplicit-function-declaration]
>>> =C2=A0=C2=A0 __sdhci_set_timeout(host, cmd);
>>> =C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~
>>> =C2=A0=C2=A0 tegra_sdhci_set_timeout
>>>
>>> Full build log,
>>> https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-stable-rc-5=
.5/DISTRO=3Dlkft,MACHINE=3Dam57xx-evm,label=3Ddocker-lkft/83/consoleText=20
>>>
>>> https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-stable-rc-5=
.4/DISTRO=3Dlkft,MACHINE=3Djuno,label=3Ddocker-lkft/158/consoleText=20
>>>
>>> https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-stable-rc-4=
.19/DISTRO=3Dlkft,MACHINE=3Dam57xx-evm,label=3Ddocker-lkft/511/consoleText=
=20
>>>
>>>
>>> - Naresh
>> Thanks for reporting! What a mess.
>>
>> It turns out that the commit that was queued for stable that is
>> causing the above errors, also requires another commit.
>>
>> The commit that was queued:
>> 5e958e4aacf4 ("sdhci: tegra: Implement Tegra specific set_timeout=20
>> callback")
>>
>> The additional commit needed (which was added in v5.6-rc1):
>> 7d76ed77cfbd ("mmc: sdhci: Refactor sdhci_set_timeout()")
>>
>> However, the above commit needs a manual backport (quite trivial, but
>> still) for the relevant stable kernels, to allow it to solve the build
>> problems.
>>
>> Greg, Sasha - I suggest you to drop the offending commit from the
>> stable kernels, for now. I think it's better to let Sowjanya deal with
>> the backports, then send them in small series instead.
>>
>> Kind regards
>> Uffe
>
> Hi Ufee,
>
> Will back-porting below commit cause any issues to other vendors?
>
> 7d76ed77cfbd ("mmc: sdhci: Refactor sdhci_set_timeout()")
>
sdhci-tegra driver in 4.19 is using same sdhci_ops for Tegra114 and=20
Tegra210 and separate sdhci_ops for T210 started from 4.20.

5e958e4aacf4 ("sdhci: tegra: Implement Tegra specific set_timeout callback"=
)

So above commit can't be applied to 4.19. So probably a separate patch=20
need to be created to apply for 4.19 and back port above commit along=20
with its dependency commit (7d76ed77cfbd ("mmc: sdhci: Refactor=20
sdhci_set_timeout()") for 5.4 and 5.4.


> Thanks
Sowjanya
>
