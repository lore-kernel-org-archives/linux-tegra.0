From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH V3 02/17] pinctrl: tegra: add suspend and resume support
Date: Tue, 18 Jun 2019 10:34:59 -0700
Message-ID: <cff9b6a2-dc33-d03b-9945-799b158deb07@nvidia.com>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-3-git-send-email-skomatineni@nvidia.com>
 <7706a287-44b7-3ad6-37ff-47e97172a798@gmail.com>
 <a23ffbae-dd85-c023-7aae-3b81e0b17ebc@gmail.com>
 <fd415362-7479-6f98-c8db-1b7758fd3f1d@wwwdotorg.org>
 <e53bf16a-681e-da31-1e9c-4ed2a24ed3a6@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e53bf16a-681e-da31-1e9c-4ed2a24ed3a6@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Dmitry Osipenko <digetx@gmail.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 6/18/19 9:50 AM, Sowjanya Komatineni wrote:
>
> On 6/18/19 8:41 AM, Stephen Warren wrote:
>> On 6/18/19 3:30 AM, Dmitry Osipenko wrote:
>>> 18.06.2019 12:22, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> 18.06.2019 10:46, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> This patch adds suspend and resume support for Tegra pinctrl driver
>>>>> and registers them to syscore so the pinmux settings are restored
>>>>> before the devices resume.
>>>>>
>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>> ---
>>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra.c=C2=A0=C2=A0=C2=A0 | 62=20
>>>>> ++++++++++++++++++++++++++++++++
>>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 5 +++
>>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra114.c |=C2=A0 1 +
>>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra124.c |=C2=A0 1 +
>>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra20.c=C2=A0 |=C2=A0 1 +
>>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra210.c | 13 +++++++
>>>>> =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra30.c=C2=A0 |=C2=A0 1 +
>>>>> =C2=A0 7 files changed, 84 insertions(+)
>>>>>
>>>>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c=20
>>>>> b/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>>> index 34596b246578..ceced30d8bd1 100644
>>>>> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>>> @@ -20,11 +20,16 @@
>>>>> =C2=A0 #include <linux/pinctrl/pinmux.h>
>>>>> =C2=A0 #include <linux/pinctrl/pinconf.h>
>>>>> =C2=A0 #include <linux/slab.h>
>>>>> +#include <linux/syscore_ops.h>
>>>>> =C2=A0 =C2=A0 #include "../core.h"
>>>>> =C2=A0 #include "../pinctrl-utils.h"
>>>>> =C2=A0 #include "pinctrl-tegra.h"
>>>>> =C2=A0 +#define EMMC2_PAD_CFGPADCTRL_0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1c8
>>>>> +#define EMMC4_PAD_CFGPADCTRL_0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1e0
>>>>> +#define EMMC_DPD_PARKING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (0x1fff << 14)
>>>>> +
>>>>> =C2=A0 static inline u32 pmx_readl(struct tegra_pmx *pmx, u32 bank, u=
32=20
>>>>> reg)
>>>>> =C2=A0 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return readl(pmx->regs[bank] + reg);
>>>>> @@ -619,6 +624,48 @@ static void=20
>>>>> tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 pmx_writel(pmx, val, g->mux_bank, g->mux_reg);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 if (pmx->soc->has_park_padcfg) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D pmx_readl(pmx, 0,=
 EMMC2_PAD_CFGPADCTRL_0);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val &=3D ~EMMC_DPD_PARKIN=
G;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmx_writel(pmx, val, 0, E=
MMC2_PAD_CFGPADCTRL_0);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D pmx_readl(pmx, 0,=
 EMMC4_PAD_CFGPADCTRL_0);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val &=3D ~EMMC_DPD_PARKIN=
G;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmx_writel(pmx, val, 0, E=
MMC4_PAD_CFGPADCTRL_0);
>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>> +}
>>>>
>>>> Is there any reason why parked_bit can't be changed to=20
>>>> parked_bitmask like I was
>>>> asking in a comment to v2?
>>>>
>>>> I suppose that it's more preferable to keep pinctrl-tegra.c=20
>>>> platform-agnostic for
>>>> consistency when possible, hence adding platform specifics here=20
>>>> should be discouraged.
>>>> And then the parked_bitmask will also result in a proper hardware=20
>>>> description in the code.
>>>>
>>>
>>> I'm now also vaguely recalling that Stephen Warren had some kind of=20
>>> a "code generator"
>>> for the pinctrl drivers. So I guess all those tables were=20
>>> auto-generated initially.
>>>
>>> Stephen, maybe you could adjust the generator to take into account=20
>>> the bitmask (of
>>> course if that's a part of the generated code) and then re-gen it=20
>>> all for Sowjanya?
>>
>> https://github.com/NVIDIA/tegra-pinmux-scripts holds the scripts that=20
>> generate tegra-pinctrlNNN.c. See soc-to-kernel-pinctrl-driver.py.=20
>> IIRC, tegra-pinctrl.c (the core file) isn't auto-generated. Sowjanya=20
>> is welcome to send a patch to that repo if the code needs to be updated.
>
>
> Hi Dmitry,
>
> Just want to be clear on my understanding of your request.
>
> "change parked_bit to parked_bitmask" are you requested to change=20
> parked_bit of PINGROUP and DRV_PINGROUP to use bitmask value rather=20
> than bit position inorder to have parked bit configuration for EMMC=20
> PADs as well to happen by masking rather than checking for existence=20
> of parked_bit?
>
> Trying to understand the reason/benefit for changing parked_bit to=20
> parked_bitmask.
Also, Park bits in CFGPAD registers are not common for all CFGPAD=20
registers. Park bits are available only for EMMC and also those bits are=20
used for something else on other CFGPAD registers so bitmask can't be=20
common and this also need an update to DRV_PINGROUP macro args just only=20
to handle EMMC parked_bitmask. So not sure of the benefit in using=20
bitmask rather than parked_bit
>
> thanks
>
> Sowjanya
>
