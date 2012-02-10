From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: Re: [U-Boot] [PATCH v3 0/9] tegra: Add I2C driver and associated parts
Date: Fri, 10 Feb 2012 07:22:28 +0100
Message-ID: <4F34B7A4.70908@denx.de>
References: <1328318041-10943-1-git-send-email-sjg@chromium.org>
 <4F336F75.3010202@denx.de>
 <5FBF8E85CA34454794F0F7ECBA79798F3792269860@HQMAIL04.nvidia.com>
Reply-To: hs-ynQEQJNshbs@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <5FBF8E85CA34454794F0F7ECBA79798F3792269860-wAPRp6hVlRhDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hello tom,

Tom Warren wrote:
> Heiko,
> 
>> -----Original Message-----
>> From: Heiko Schocher [mailto:hs-ynQEQJNshbs@public.gmane.org]
>> Sent: Thursday, February 09, 2012 12:02 AM
>> To: Simon Glass
>> Cc: U-Boot Mailing List; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Tom Warren
>> Subject: Re: [U-Boot] [PATCH v3 0/9] tegra: Add I2C driver and associated
>> parts
>>
>> Hello Tom,
>>
>> Simon Glass wrote:
>>> This series brings in an I2C driver for Tegra which can be configured
>>> by a flat device tree.
>>>
>>> It supports 8- and 16-bit addresses and both the normal I2C ports and
>>> the DVC port (for controlling the power management unit (PMU)).
>>>
>>> Recent Linux bindings are used, based on example .dts files found in
>>> branch for-3.3/dt at:
>>>
>>> git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git
>>>
>>> (I could not find the actual binding documentation to include here)
>>>
>>> Note: There is still an open question on I2C2 pinmux. The idea of an
>>> 'nvidia,pinmux-config' settings did not find favour, so we have no way
>>> of passing the correct config to funcmux for this port. Therefore we
>>> have disabled it for now. The impact on Seaboard is that the TPM and
>>> battery charger cannot be accessed.
>>>
>>> I am sending this series to the linux-tegra list also, and will do so
>>> for future series also. This is because anything to do with fdt also
>>> affects the kernel bindings. Please advise if this is not useful.
>>>
>>> Changes in v2:
>>> - Add build warning if CONFIG_SYS_I2C_INIT_BOARD is not defined
>>> - Adjust definitions to fit new peripheral clock bindings
>>> - Change 'speed' to 'clock-frequency'
>>> - Change i2c array to static
>>> - Disable port 2 as it is not used
>>> - Make i2c/dvc decision come from fdt
>>> - Remove i2c configuring using CONFIG (use fdt instead)
>>> - Remove u-boot,pinmux binding (sadly)
>>> - Return an error if an unavailable i2c bus is selected
>>> - Simplify code in i2c_addr_ok()
>>> - Tidy comment style
>>> - Use DIV_ROUND_UP() instead of a home-grown macro
>>> - Use new fdtdec alias decode function
>>>
>>> Changes in v3:
>>> - Add TEGRA_I2C_NUM_CONTROLLERS to select number of I2C ports
>>> - Add comment on how to select pinmux for I2C2
>>> - Add comments and warning for mixed alias use in fdtdec
>>> - Add new patch to support 16-bit clock divisors required by I2C
>>> - Change i2c_init() to reset speed and override the fdt setting
>>> - Fix i2c_addr_ok() function to check addresses correctly
>>> - Move speed setting from tegra20.dtsi to board .dts file
>>> - Rename driver to tegra_i2c since it will later be shared with Tegra3
>>> - Tidy up I2C speed selection to use the peripheral clock
>>> - Use CONFIG_TEGRA_I2C instead of CONFIG_TEGRA2_I2C
>>>
>>> Simon Glass (8):
>>>   tegra: Rename NV_PA_PMC_BASE to TEGRA2_PMC_BASE
>>>   fdt: Add function to allow aliases to refer to multiple nodes
>>>   tegra: Enhance clock support to handle 16-bit clock divisors
>>>   tegra: fdt: i2c: Add extra I2C bindings for U-Boot
>>>   tegra: i2c: Initialise I2C on Nvidia boards
>>>   tegra: i2c: Select I2C ordering for Seaboard
>>>   tegra: i2c: Select number of controllers for Tegra2 boards
>>>   tegra: i2c: Enable I2C on Seaboard
>>>
>>> Yen Lin (1):
>>>   tegra: i2c: Add I2C driver
>>>
>>>  arch/arm/cpu/armv7/tegra2/ap20.c             |   10 +-
>>>  arch/arm/cpu/armv7/tegra2/board.c            |    2 +-
>>>  arch/arm/cpu/armv7/tegra2/clock.c            |   63 ++-
>>>  arch/arm/dts/tegra20.dtsi                    |    6 +-
>>>  arch/arm/include/asm/arch-tegra2/clk_rst.h   |   10 +-
>>>  arch/arm/include/asm/arch-tegra2/tegra2.h    |    4 +-
>>>  arch/arm/include/asm/arch-tegra2/tegra_i2c.h |  160 ++++++++
>>>  board/nvidia/common/board.c                  |    7 +
>>>  board/nvidia/dts/tegra2-seaboard.dts         |   21 +
>>>  drivers/i2c/Makefile                         |    1 +
>>>  drivers/i2c/tegra_i2c.c                      |  566
>> ++++++++++++++++++++++++++
>>>  include/configs/seaboard.h                   |    8 +
>>>  include/configs/tegra2-common.h              |    3 +
>>>  include/fdtdec.h                             |   25 ++
>>>  lib/fdtdec.c                                 |   24 +-
>>>  15 files changed, 873 insertions(+), 37 deletions(-)  create mode
>>> 100644 arch/arm/include/asm/arch-tegra2/tegra_i2c.h
>>>  create mode 100644 drivers/i2c/tegra_i2c.c
>> Do you want to pick up this patchserie? So I can send my Ack for it.
>> If I should pick it up, please send your Acked-by, thanks!
> 
> I'm not sure what you mean by 'pick up' this patch series. I'm applying these (USB, then I2C) to u-boot-tegra as they are Acked in toto. USB is still pending a single (#10 of 18) Ack by Stephen Warren for the CAR binding rewrite. I2C depends on the fdt stuff in the USB series, so it's blocked until USB is resolved.

Ok, thanks for the explanation!

> I've put the latest USB patchset (v5/v6) in a 'test' branch in u-boot-tegra - I'll push that to denx.de. I can also add the I2C patchset (assuming it applies w/o error) and push that, too, if it would help anyone. But I can't in good conscience apply it to u-boot-tegra/master or /next until it's fully Acked.  And I don't have enough fdt, USB or I2C knowledge to do the Acking myself.  If you are offering to Ack the entire I2C series, that's great, and will speed up getting it into u-boot-tegra once the USB issue is resolved (hopefully next week).

Ok, so I ack them.

bye,
Heiko
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
