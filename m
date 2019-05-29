From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH V2 02/12] pinctrl: tegra: add suspend and resume support
Date: Wed, 29 May 2019 13:11:08 -0700
Message-ID: <0f087659-cdde-9f89-55a2-d399ee539431@nvidia.com>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
 <1559084936-4610-3-git-send-email-skomatineni@nvidia.com>
 <6273a790-d4b7-c501-3fec-d9816288b139@gmail.com>
 <d9d54f05-b0bf-6e65-9308-45e94454301e@nvidia.com>
 <11fe4d9a-6d8e-bc4f-b764-a849571fb6b0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <11fe4d9a-6d8e-bc4f-b764-a849571fb6b0@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 5/29/19 12:32 PM, Dmitry Osipenko wrote:
> 29.05.2019 21:14, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 5/29/19 8:29 AM, Dmitry Osipenko wrote:
>>> 29.05.2019 2:08, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> This patch adds suspend and resume support for Tegra pinctrl driver
>>>> and registers them to syscore so the pinmux settings are restored
>>>> before the devices resume.
>>>>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>>  =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra.c=C2=A0=C2=A0=C2=A0 | 68
>>>> +++++++++++++++++++++++++++++++-
>>>>  =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 3 ++
>>>>  =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra114.c |=C2=A0 1 +
>>>>  =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra124.c |=C2=A0 1 +
>>>>  =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra20.c=C2=A0 |=C2=A0 1 +
>>>>  =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra210.c |=C2=A0 1 +
>>>>  =C2=A0 drivers/pinctrl/tegra/pinctrl-tegra30.c=C2=A0 |=C2=A0 1 +
>>>>  =C2=A0 7 files changed, 75 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>> b/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>> index a5008c066bac..bdc47e62c457 100644
>>>> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>> @@ -28,11 +28,18 @@
>>>>  =C2=A0 #include <linux/pinctrl/pinmux.h>
>>>>  =C2=A0 #include <linux/pinctrl/pinconf.h>
>>>>  =C2=A0 #include <linux/slab.h>
>>>> +#include <linux/syscore_ops.h>
>>>>  =C2=A0 =C2=A0 #include "../core.h"
>>>>  =C2=A0 #include "../pinctrl-utils.h"
>>>>  =C2=A0 #include "pinctrl-tegra.h"
>>>>  =C2=A0 +#define EMMC2_PAD_CFGPADCTRL_0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1c8
>>>> +#define EMMC4_PAD_CFGPADCTRL_0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1e0
>>>> +#define EMMC_DPD_PARKING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (0x1fff << 14)
>>>> +
>>>> +static struct tegra_pmx *pmx;
>>>> +
>>>>  =C2=A0 static inline u32 pmx_readl(struct tegra_pmx *pmx, u32 bank, u=
32 reg)
>>>>  =C2=A0 {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return readl(pmx->regs[bank] + reg);
>>>> @@ -629,6 +636,50 @@ static void
>>>> tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>  =C2=A0 }
>>>>  =C2=A0 +static int __maybe_unused tegra_pinctrl_suspend(void)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 u32 *backup_regs =3D pmx->backup_regs;
>>>> +=C2=A0=C2=A0=C2=A0 u32 *regs;
>>>> +=C2=A0=C2=A0=C2=A0 int i, j;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < pmx->nbanks; i++) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regs =3D pmx->regs[i];
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (j =3D 0; j < pmx->reg=
_bank_size[i] / 4; j++)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *b=
ackup_regs++ =3D readl(regs++);
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return pinctrl_force_sleep(pmx->pctl);
>>>> +}
>>>> +
>>>> +static void __maybe_unused tegra_pinctrl_resume(void)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 u32 *backup_regs =3D pmx->backup_regs;
>>>> +=C2=A0=C2=A0=C2=A0 u32 *regs;
>>>> +=C2=A0=C2=A0=C2=A0 u32 val;
>>>> +=C2=A0=C2=A0=C2=A0 int i, j;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < pmx->nbanks; i++) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regs =3D pmx->regs[i];
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (j =3D 0; j < pmx->reg=
_bank_size[i] / 4; j++)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wr=
itel(*backup_regs++, regs++);
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (pmx->soc->has_park_padcfg) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D pmx_readl(pmx, 0, =
EMMC2_PAD_CFGPADCTRL_0);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val &=3D ~EMMC_DPD_PARKING=
;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmx_writel(pmx, val, 0, EM=
MC2_PAD_CFGPADCTRL_0);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D pmx_readl(pmx, 0, =
EMMC4_PAD_CFGPADCTRL_0);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val &=3D ~EMMC_DPD_PARKING=
;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmx_writel(pmx, val, 0, EM=
MC4_PAD_CFGPADCTRL_0);
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +}
>>>>
>>> But the CFGPADCTRL registers are already programmed by restoring the
>>> backup_regs and hence the relevant EMMC's are already unparked. Hence
>>> why do you need to force-unpark both of the EMMC's? What if EMMC is
>>> unpopulated on a board, why do you need to unpark it then?
>> PARK bit for EMMC2/EMMC4 (EMMC2_PAD_CFGPADCTRL and EMMC4_PAD_CFGPADCTRL)
>> are not part of pinmux.
>>
>> They are part of CFGPADCTRL register so pinctrl driver pingroup doesn't
>> include these registers.
> I'm looking at the tegra210_groups and it clearly has these both
> registers as a part of pinctrl setup because the rest of the bits
> configure drive of the pads.
>
>  From pinctrl-tegra210.c:
>
> #define DRV_PINGROUP_REG_A		0x8d4	/* bank 0 */
>
> DRV_PINGROUP(sdmmc2, 0xa9c, 2,  6,  8,  6,  28, 2,  30, 2),
> DRV_PINGROUP(sdmmc4, 0xab4, 2,  6,  8,  6,  28, 2,  30, 2),
>
> ...
>
> 0xa9c - 0x8d4 =3D 0x1c8
> 0xab4 - 0x8d4 =3D 0x1e0
>
> Hence the PARK bits are already getting unset by restoring the
> backup_regs because the CFGPADCTRL registers are a part of the "bank 0"
> registers.
>
> Am I still missing something?

DRV_PINGROUP parked_bit is -1 and will not be programmed so store and=20
restore will not take care of it.

Also EMMC PADCFG is the only padcfg register which has parked bit and=20
for other IO pads its part of pinmux

>> backup_regs doesn't take care of this and need to handled separately for
>> Tegra210.
>>
>>
>> During resume we have to clear PARK bit for the pads on Tegra210 and
>> this is not related to presence/absence of eMMC on the board.
> Okay, thank you for the clarification.
>
>> PAD is parked during LP0 entry to have it in DPD mode and it stays in
>> DPD till its cleared by SW on resume.
> Yes, this is documented in the public TRM. My main point is that it
> looks like the PARK bits are unneedlessly getting unset twice in your
> code (and it still looks like that to me).
