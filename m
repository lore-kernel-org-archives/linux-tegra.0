From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V3 02/17] pinctrl: tegra: add suspend and resume support
Date: Tue, 18 Jun 2019 23:00:05 +0300
Message-ID: <232324b1-c0eb-ba1b-0fd0-31fcbd701e07@gmail.com>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-3-git-send-email-skomatineni@nvidia.com>
 <7706a287-44b7-3ad6-37ff-47e97172a798@gmail.com>
 <a23ffbae-dd85-c023-7aae-3b81e0b17ebc@gmail.com>
 <fd415362-7479-6f98-c8db-1b7758fd3f1d@wwwdotorg.org>
 <e53bf16a-681e-da31-1e9c-4ed2a24ed3a6@nvidia.com>
 <cff9b6a2-dc33-d03b-9945-799b158deb07@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cff9b6a2-dc33-d03b-9945-799b158deb07@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

18.06.2019 20:34, Sowjanya Komatineni пишет:
> 
> On 6/18/19 9:50 AM, Sowjanya Komatineni wrote:
>>
>> On 6/18/19 8:41 AM, Stephen Warren wrote:
>>> On 6/18/19 3:30 AM, Dmitry Osipenko wrote:
>>>> 18.06.2019 12:22, Dmitry Osipenko пишет:
>>>>> 18.06.2019 10:46, Sowjanya Komatineni пишет:
>>>>>> This patch adds suspend and resume support for Tegra pinctrl driver
>>>>>> and registers them to syscore so the pinmux settings are restored
>>>>>> before the devices resume.
>>>>>>
>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>> ---
>>>>>>   drivers/pinctrl/tegra/pinctrl-tegra.c    | 62 ++++++++++++++++++++++++++++++++
>>>>>>   drivers/pinctrl/tegra/pinctrl-tegra.h    |  5 +++
>>>>>>   drivers/pinctrl/tegra/pinctrl-tegra114.c |  1 +
>>>>>>   drivers/pinctrl/tegra/pinctrl-tegra124.c |  1 +
>>>>>>   drivers/pinctrl/tegra/pinctrl-tegra20.c  |  1 +
>>>>>>   drivers/pinctrl/tegra/pinctrl-tegra210.c | 13 +++++++
>>>>>>   drivers/pinctrl/tegra/pinctrl-tegra30.c  |  1 +
>>>>>>   7 files changed, 84 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>>>> b/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>>>> index 34596b246578..ceced30d8bd1 100644
>>>>>> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>>>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>>>> @@ -20,11 +20,16 @@
>>>>>>   #include <linux/pinctrl/pinmux.h>
>>>>>>   #include <linux/pinctrl/pinconf.h>
>>>>>>   #include <linux/slab.h>
>>>>>> +#include <linux/syscore_ops.h>
>>>>>>     #include "../core.h"
>>>>>>   #include "../pinctrl-utils.h"
>>>>>>   #include "pinctrl-tegra.h"
>>>>>>   +#define EMMC2_PAD_CFGPADCTRL_0            0x1c8
>>>>>> +#define EMMC4_PAD_CFGPADCTRL_0            0x1e0
>>>>>> +#define EMMC_DPD_PARKING            (0x1fff << 14)
>>>>>> +
>>>>>>   static inline u32 pmx_readl(struct tegra_pmx *pmx, u32 bank, u32 reg)
>>>>>>   {
>>>>>>       return readl(pmx->regs[bank] + reg);
>>>>>> @@ -619,6 +624,48 @@ static void tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
>>>>>>               pmx_writel(pmx, val, g->mux_bank, g->mux_reg);
>>>>>>           }
>>>>>>       }
>>>>>> +
>>>>>> +    if (pmx->soc->has_park_padcfg) {
>>>>>> +        val = pmx_readl(pmx, 0, EMMC2_PAD_CFGPADCTRL_0);
>>>>>> +        val &= ~EMMC_DPD_PARKING;
>>>>>> +        pmx_writel(pmx, val, 0, EMMC2_PAD_CFGPADCTRL_0);
>>>>>> +
>>>>>> +        val = pmx_readl(pmx, 0, EMMC4_PAD_CFGPADCTRL_0);
>>>>>> +        val &= ~EMMC_DPD_PARKING;
>>>>>> +        pmx_writel(pmx, val, 0, EMMC4_PAD_CFGPADCTRL_0);
>>>>>> +    }
>>>>>> +}
>>>>>
>>>>> Is there any reason why parked_bit can't be changed to parked_bitmask like I was
>>>>> asking in a comment to v2?
>>>>>
>>>>> I suppose that it's more preferable to keep pinctrl-tegra.c platform-agnostic for
>>>>> consistency when possible, hence adding platform specifics here should be discouraged.
>>>>> And then the parked_bitmask will also result in a proper hardware description in the code.
>>>>>
>>>>
>>>> I'm now also vaguely recalling that Stephen Warren had some kind of a "code generator"
>>>> for the pinctrl drivers. So I guess all those tables were auto-generated initially.
>>>>
>>>> Stephen, maybe you could adjust the generator to take into account the bitmask (of
>>>> course if that's a part of the generated code) and then re-gen it all for Sowjanya?
>>>
>>> https://github.com/NVIDIA/tegra-pinmux-scripts holds the scripts that generate
>>> tegra-pinctrlNNN.c. See soc-to-kernel-pinctrl-driver.py. IIRC, tegra-pinctrl.c (the core
>>> file) isn't auto-generated. Sowjanya is welcome to send a patch to that repo if the code
>>> needs to be updated.
>>
>>
>> Hi Dmitry,
>>
>> Just want to be clear on my understanding of your request.
>>
>> "change parked_bit to parked_bitmask" are you requested to change parked_bit of PINGROUP
>> and DRV_PINGROUP to use bitmask value rather than bit position inorder to have parked bit
>> configuration for EMMC PADs as well to happen by masking rather than checking for
>> existence of parked_bit?
>>
>> Trying to understand the reason/benefit for changing parked_bit to parked_bitmask.
> Also, Park bits in CFGPAD registers are not common for all CFGPAD registers. Park bits are
> available only for EMMC and also those bits are used for something else on other CFGPAD
> registers so bitmask can't be common and this also need an update to DRV_PINGROUP macro args
> just only to handle EMMC parked_bitmask. So not sure of the benefit in using bitmask rather

Hi Sowjanya,

The main motivation is to describe hardware properly in the drivers. Why to make a
hacky-looking workaround while you can make things properly? Especially if that doesn't take
much effort.

Stephen, thank you very much for the pointer to the script. Looks like it should be easy to
modify the script accordingly to the required change.

Sowjanya, below is a draft of the change that I'm suggesting. I see this as two separate
patches: first converts drivers to use parked_bitmask, second adds suspend-resume support.

Please note that in the end it's up to you and Tegra/PINCTRL maintainers to decide if this
is a worthwhile change that I'm suggesting. In my opinion it is much better to have a
generic solution rather than to have a special quirk solely for T210.

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 34596b246578..4150da74bd44 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -613,9 +613,9 @@ static void tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)

 	for (i = 0; i < pmx->soc->ngroups; ++i) {
 		g = &pmx->soc->groups[i];
-		if (g->parked_bit >= 0) {
+		if (g->parked_bitmask != -1) {
 			val = pmx_readl(pmx, g->mux_bank, g->mux_reg);
-			val &= ~(1 << g->parked_bit);
+			val &= ~g->parked_bitmask;
 			pmx_writel(pmx, val, g->mux_bank, g->mux_reg);
 		}
 	}
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
index 287702660783..875eb7a1d838 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.h
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
@@ -96,7 +96,7 @@ struct tegra_function {
  * @tri_reg:		Tri-state register offset.
  * @tri_bank:		Tri-state register bank.
  * @tri_bit:		Tri-state register bit.
- * @parked_bit:		Parked register bit. -1 if unsupported.
+ * @parked_bitmask:	Parked register bitmask. -1 if unsupported.
  * @einput_bit:		Enable-input register bit.
  * @odrain_bit:		Open-drain register bit.
  * @lock_bit:		Lock register bit.
@@ -146,7 +146,7 @@ struct tegra_pingroup {
 	s32 mux_bit:6;
 	s32 pupd_bit:6;
 	s32 tri_bit:6;
-	s32 parked_bit:6;
+	s32 parked_bitmask:26;
 	s32 einput_bit:6;
 	s32 odrain_bit:6;
 	s32 lock_bit:6;
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c b/drivers/pinctrl/tegra/pinctrl-tegra210.c
index 0b56ad5c9c1c..d2ba13466e06 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
@@ -1302,7 +1302,7 @@ static struct tegra_function tegra210_functions[] = {
 		.lock_bit = 7,						\
 		.ioreset_bit = -1,					\
 		.rcv_sel_bit = PINGROUP_BIT_##e_io_hv(10),		\
-		.parked_bit = 5,					\
+		.parked_bitmask = BIT(5),				\
 		.hsm_bit = PINGROUP_BIT_##hsm(9),			\
 		.schmitt_bit = 12,					\
 		.drvtype_bit = PINGROUP_BIT_##drvtype(13),		\
@@ -1320,7 +1320,7 @@ static struct tegra_function tegra210_functions[] = {
 	}

 #define DRV_PINGROUP(pg_name, r, drvdn_b, drvdn_w, drvup_b, drvup_w,	\
-		     slwr_b, slwr_w, slwf_b, slwf_w)			\
+		     slwr_b, slwr_w, slwf_b, slwf_w, prk_mask)		\
 	{								\
 		.name = "drive_" #pg_name,				\
 		.pins = drive_##pg_name##_pins,				\
@@ -1335,7 +1335,7 @@ static struct tegra_function tegra210_functions[] = {
 		.rcv_sel_bit = -1,					\
 		.drv_reg = DRV_PINGROUP_REG(r),				\
 		.drv_bank = 0,						\
-		.parked_bit = -1,					\
+		.parked_bitmask = prk_mask,				\
 		.hsm_bit = -1,						\
 		.schmitt_bit = -1,					\
 		.lpmd_bit = -1,						\
@@ -1516,31 +1516,31 @@ static const struct tegra_pingroup tegra210_groups[] = {
 	PINGROUP(pz5,                  SOC,        RSVD1,  RSVD2, RSVD3, 0x3290, N,   N,       N,
     -1,    -1,      -1,      -1,      -1,      -1,     -1,     -1,     -1),

 	/* pg_name, r, drvdn_b, drvdn_w, drvup_b, drvup_w, slwr_b, slwr_w, slwf_b, slwf_w */
-	DRV_PINGROUP(pa6,    0x9c0, 12, 5,  20, 5,  -1, -1, -1, -1),
-	DRV_PINGROUP(pcc7,   0x9c4, 12, 5,  20, 5,  -1, -1, -1, -1),
-	DRV_PINGROUP(pe6,    0x9c8, 12, 5,  20, 5,  -1, -1, -1, -1),
-	DRV_PINGROUP(pe7,    0x9cc, 12, 5,  20, 5,  -1, -1, -1, -1),
-	DRV_PINGROUP(ph6,    0x9d0, 12, 5,  20, 5,  -1, -1, -1, -1),
-	DRV_PINGROUP(pk0,    0x9d4, -1, -1, -1, -1, 28, 2,  30, 2),
-	DRV_PINGROUP(pk1,    0x9d8, -1, -1, -1, -1, 28, 2,  30, 2),
-	DRV_PINGROUP(pk2,    0x9dc, -1, -1, -1, -1, 28, 2,  30, 2),
-	DRV_PINGROUP(pk3,    0x9e0, -1, -1, -1, -1, 28, 2,  30, 2),
-	DRV_PINGROUP(pk4,    0x9e4, -1, -1, -1, -1, 28, 2,  30, 2),
-	DRV_PINGROUP(pk5,    0x9e8, -1, -1, -1, -1, 28, 2,  30, 2),
-	DRV_PINGROUP(pk6,    0x9ec, -1, -1, -1, -1, 28, 2,  30, 2),
-	DRV_PINGROUP(pk7,    0x9f0, -1, -1, -1, -1, 28, 2,  30, 2),
-	DRV_PINGROUP(pl0,    0x9f4, -1, -1, -1, -1, 28, 2,  30, 2),
-	DRV_PINGROUP(pl1,    0x9f8, -1, -1, -1, -1, 28, 2,  30, 2),
-	DRV_PINGROUP(pz0,    0x9fc, 12, 7,  20, 7,  -1, -1, -1, -1),
-	DRV_PINGROUP(pz1,    0xa00, 12, 7,  20, 7,  -1, -1, -1, -1),
-	DRV_PINGROUP(pz2,    0xa04, 12, 7,  20, 7,  -1, -1, -1, -1),
-	DRV_PINGROUP(pz3,    0xa08, 12, 7,  20, 7,  -1, -1, -1, -1),
-	DRV_PINGROUP(pz4,    0xa0c, 12, 7,  20, 7,  -1, -1, -1, -1),
-	DRV_PINGROUP(pz5,    0xa10, 12, 7,  20, 7,  -1, -1, -1, -1),
-	DRV_PINGROUP(sdmmc1, 0xa98, 12, 7,  20, 7,  28, 2,  30, 2),
-	DRV_PINGROUP(sdmmc2, 0xa9c, 2,  6,  8,  6,  28, 2,  30, 2),
-	DRV_PINGROUP(sdmmc3, 0xab0, 12, 7,  20, 7,  28, 2,  30, 2),
-	DRV_PINGROUP(sdmmc4, 0xab4, 2,  6,  8,  6,  28, 2,  30, 2),
+	DRV_PINGROUP(pa6,    0x9c0, 12, 5,  20, 5,  -1, -1, -1, -1, -1),
+	DRV_PINGROUP(pcc7,   0x9c4, 12, 5,  20, 5,  -1, -1, -1, -1, -1),
+	DRV_PINGROUP(pe6,    0x9c8, 12, 5,  20, 5,  -1, -1, -1, -1, -1),
+	DRV_PINGROUP(pe7,    0x9cc, 12, 5,  20, 5,  -1, -1, -1, -1, -1),
+	DRV_PINGROUP(ph6,    0x9d0, 12, 5,  20, 5,  -1, -1, -1, -1, -1),
+	DRV_PINGROUP(pk0,    0x9d4, -1, -1, -1, -1, 28, 2,  30, 2, -1),
+	DRV_PINGROUP(pk1,    0x9d8, -1, -1, -1, -1, 28, 2,  30, 2, -1),
+	DRV_PINGROUP(pk2,    0x9dc, -1, -1, -1, -1, 28, 2,  30, 2, -1),
+	DRV_PINGROUP(pk3,    0x9e0, -1, -1, -1, -1, 28, 2,  30, 2, -1),
+	DRV_PINGROUP(pk4,    0x9e4, -1, -1, -1, -1, 28, 2,  30, 2, -1),
+	DRV_PINGROUP(pk5,    0x9e8, -1, -1, -1, -1, 28, 2,  30, 2, -1),
+	DRV_PINGROUP(pk6,    0x9ec, -1, -1, -1, -1, 28, 2,  30, 2, -1),
+	DRV_PINGROUP(pk7,    0x9f0, -1, -1, -1, -1, 28, 2,  30, 2, -1),
+	DRV_PINGROUP(pl0,    0x9f4, -1, -1, -1, -1, 28, 2,  30, 2, -1),
+	DRV_PINGROUP(pl1,    0x9f8, -1, -1, -1, -1, 28, 2,  30, 2, -1),
+	DRV_PINGROUP(pz0,    0x9fc, 12, 7,  20, 7,  -1, -1, -1, -1, -1),
+	DRV_PINGROUP(pz1,    0xa00, 12, 7,  20, 7,  -1, -1, -1, -1, -1),
+	DRV_PINGROUP(pz2,    0xa04, 12, 7,  20, 7,  -1, -1, -1, -1, -1),
+	DRV_PINGROUP(pz3,    0xa08, 12, 7,  20, 7,  -1, -1, -1, -1, -1),
+	DRV_PINGROUP(pz4,    0xa0c, 12, 7,  20, 7,  -1, -1, -1, -1, -1),
+	DRV_PINGROUP(pz5,    0xa10, 12, 7,  20, 7,  -1, -1, -1, -1, -1),
+	DRV_PINGROUP(sdmmc1, 0xa98, 12, 7,  20, 7,  28, 2,  30, 2, -1),
+	DRV_PINGROUP(sdmmc2, 0xa9c, 2,  6,  8,  6,  28, 2,  30, 2, 0x7ffc000),
+	DRV_PINGROUP(sdmmc3, 0xab0, 12, 7,  20, 7,  28, 2,  30, 2, -1),
+	DRV_PINGROUP(sdmmc4, 0xab4, 2,  6,  8,  6,  28, 2,  30, 2, 0x7ffc000),
 };

 static const struct tegra_pinctrl_soc_data tegra210_pinctrl = {
