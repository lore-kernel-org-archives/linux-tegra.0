From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 0/4] Restore ULPI USB on Tegra20
Date: Sun, 6 May 2018 15:01:57 +0300
Message-ID: <ca6ec165-9d63-69cd-27a1-051c1be9f35a@gmail.com>
References: <20180503225537.20748-1-digetx@gmail.com>
 <1525440829.6296.22.camel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525440829.6296.22.camel@ziswiler.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Marc Dietrich <marvin24@gmx.de>
Cc: linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04.05.2018 16:33, Marcel Ziswiler wrote:
> Hi Dmitry
> 
> On Fri, 2018-05-04 at 01:55 +0300, Dmitry Osipenko wrote:
>> Hello,
>>
>> This series of patches fixes ULPI USB on Tegra20. The original
>> problem
>> was reported by Marcel Ziswiler, he found that "ulpi-link" clock was
>> incorrectly set to CDEV2 instead of PLL_P_OUT4. Marcel made a patch
>> that changed the "ulpi-link" clock to PLL_P_OUT4 and that fixed issue
>> with the USB for the devices that have CDEV2 being enabled by
>> bootloader.
>> The patch got into the kernel and later Marc Dietrich found that USB
>> stopped working on the "paz00" Tegra20 board. After a bit of
>> discussion
>> was revealed that PLL_P_OUT4 is the parent clock of the CDEV2 and
>> clock
>> driver was setting CDEV2's parent incorrectly. The parent clock is
>> actually
>> determined by the pinmuxing config of CDEV2 pingroup. This patchset
>> fixes
>> the parent of CDEV2 clock by making Tegra's pinctrl driver a clock
>> provider,
>> providing CDEV1/2 clock muxes (thanks to Peter De Schrijver for the
>> suggestion), and then setting these clock muxes as parents for the
>> CDEV1/2
>> clocks. In the end Marcel's CDEV2->PLL_P_OUT4 change is reverted
>> since CDEV2
>> (aka MCLK2) is the actual clock source for "ulpi-link".
>>
>> Changelog:
>>
>> v2:
>> 	- Added new patch "Add quirk for getting CDEV1/2 clocks",
>> assuring
>> 	  that clk user won't get CDEV1/2 clocks until parent clk muxes
>> 	  are available, i.e. resolves potential issue with CDEV-user
>> driver
>> 	  vs pinctrl driver probe order.
>>
>> 	- Factored out "pinctrl" patch from the patchset as was
>> requested by
>> 	  Linus Walleij.
>>
>> 	- Addressed v1 review comments: fixed swapped DEV1/2 clk div
>> bits,
>> 	  made DEV1/2 divs read-only, etc minor changes.
>>
>> Dmitry Osipenko (4):
>>   clk: tegra20: Add DEV1/DEV2 OSC dividers
>>   clk: tegra20: Correct parents of CDEV1/2 clocks
>>   clk: tegra: Add quirk for getting CDEV1/2 clocks
>>   ARM: dts: tegra20: Revert "Fix ULPI regression on Tegra20"
>>
>>  arch/arm/boot/dts/tegra20.dtsi  |  2 +-
>>  drivers/clk/tegra/clk-tegra20.c | 20 +++++++++++++++----
>>  drivers/clk/tegra/clk.c         | 34
>> ++++++++++++++++++++++++++++++++-
>>  3 files changed, 50 insertions(+), 6 deletions(-)
> 
> Beautiful (;-p).
> 
> root@colibri-t20:~# cat /sys/kernel/debug/clk/clk_summary | grep -E
> 'pll_p_out4|cdev2'
>           pll_p_out4_div              1        1        0    24000000  
>         0 0  
>              pll_p_out4               2        2        0    24000000  
>         0 0  
>                 cdev2_mux             1        1        0    24000000  
>         0 0  
>                    cdev2              1        1        0    24000000  
>         0 0  
> 
> You may add my reviewed and tested bys to the remaining patches as
> well.
> 
> Thanks!
Awesome, thank you!
