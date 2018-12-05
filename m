From: Joseph Lo <josephl@nvidia.com>
Subject: Re: [PATCH 00/19] Tegra210 DFLL support
Date: Wed, 5 Dec 2018 14:11:50 +0800
Message-ID: <43c59781-3548-b643-3c5e-9d2dcab422f2@nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204151059.GA23827@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181204151059.GA23827@ulmo>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


On 12/4/18 11:10 PM, Thierry Reding wrote:
> On Tue, Dec 04, 2018 at 05:25:29PM +0800, Joseph Lo wrote:
>> This series introduces support for the DFLL as a CPU clock source
>> on Tegra210. As Jetson TX1 uses a PWM controlled regulator IC which
>> is driven directly by the DFLLs PWM output, we also introduce support
>> for PWM regulators next to I2C controlled regulators. The DFLL output
>> frequency is directly controlled by the regulator voltage. The registers
>> for controlling the PWM are part of the DFLL IP block, so there's no
>> separate linux regulator object involved because the regulator IC only
>> supplies the rail powering the CPUs. It doesn't have any other controls.
>>
>> The patch 1~4 are the patches of DT bindings update for DFLL clock and
>> Tegra124 cpufreq, which add PWM and Tegra210 support for DFLL clock and
>> remove deprecate properties for Tegra124 cpufreq bindings.
>>
>> The patch 5~10 are the patches for DFLL clock driver update for PWM-mode
>> DFLL support.
>>
>> The patch 11 and 12 are the Tegra124 cpufreq driver update to make it
>> work with Tegra210.
>>
>> The patch 13~18 are the devicetree files update for Tegra210 SoC and
>> platforms. Two platforms are updated here for different DFLL mode usage.
>> The Tegra210-p2371-2180 (a.k.a. Jetson Tx1) uses DFLL-PWM and the
>> Tegra210-smaug (a.k.a. Pixel C) uses DFLL-I2C. So two different modes
>> are verified with this series.
>>
>> The patch 19 is the patch for enabling the CPU regulator for Smaug
>> board.
>>
>> Joseph Lo (16):
>>    dt-bindings: clock: tegra124-dfll: add Tegra210 support
>>    dt-bindings: cpufreq: tegra124: remove vdd-cpu-supply from required
>>      properties
>>    dt-bindings: cpufreq: tegra124: remove cpu_lp clock from required
>>      properties
>>    clk: tegra: dfll: CVB calculation alignment with the regulator
>>    clk: tegra: dfll: support PWM regulator control
>>    clk: tegra: dfll: round down voltages based on alignment
>>    clk: tegra: dfll: add CVB tables for Tegra210
>>    cpufreq: tegra124: do not handle the CPU rail
>>    cpufreq: tegra124: extend to support Tegra210
>>    arm64: dts: tegra210: add DFLL clock
>>    arm64: dts: tegra210: add CPU clocks
>>    arm64: dts: tegra210-p2597: add pinmux for PWM-based DFLL support
>>    arm64: dts: tegra210-p2371-2180: enable DFLL clock
>>    arm64: dts: tegra210-smaug: add CPU power rail regulator
>>    arm64: dts: tegra210-smaug: enable DFLL clock
>>    arm64: defconfig: Enable MAX8973 regulator
>>
>> Peter De Schrijver (3):
>>    dt-bindings: clock: tegra124-dfll: Update DFLL binding for PWM
>>      regulator
>>    clk: tegra: dfll: registration for multiple SoCs
>>    clk: tegra: dfll: build clk-dfll.c for Tegra124 and Tegra210
>>
>>   .../bindings/clock/nvidia,tegra124-dfll.txt   |  77 ++-
>>   .../cpufreq/nvidia,tegra124-cpufreq.txt       |   6 +-
>>   .../boot/dts/nvidia/tegra210-p2371-2180.dts   |  20 +
>>   .../arm64/boot/dts/nvidia/tegra210-p2597.dtsi |  14 +
>>   arch/arm64/boot/dts/nvidia/tegra210-smaug.dts |  31 +
>>   arch/arm64/boot/dts/nvidia/tegra210.dtsi      |  25 +
>>   arch/arm64/configs/defconfig                  |   1 +
>>   drivers/clk/tegra/Kconfig                     |   5 +
>>   drivers/clk/tegra/Makefile                    |   2 +-
>>   drivers/clk/tegra/clk-dfll.c                  | 455 ++++++++++++---
>>   drivers/clk/tegra/clk-dfll.h                  |   6 +-
>>   drivers/clk/tegra/clk-tegra124-dfll-fcpu.c    | 536 +++++++++++++++++-
>>   drivers/clk/tegra/cvb.c                       |  12 +-
>>   drivers/clk/tegra/cvb.h                       |   7 +-
>>   drivers/cpufreq/Kconfig.arm                   |   2 +-
>>   drivers/cpufreq/tegra124-cpufreq.c            |  29 +-
>>   16 files changed, 1095 insertions(+), 133 deletions(-)
> 
> Hi Joseph,
> 
> can you highlight the build and runtime dependencies between the various
> patches? For example, can I pick up all the arch/arm64 patches into the
> Tegra tree without breaking anything?
> 

Hi Thierry,

The patches for DFLL clock and dts have build dependency, which means we 
need to follow the patch sequence to apply these patches (They can be 
applied separately.). The runtime dependency depends on two sub-series, 
"DFLL clock + cpufreq" patches and the dts series. We can just apply the 
changes for "arch/arm64" but the functionality needs to wait for another 
sub-series.

Thanks,
Joseph
