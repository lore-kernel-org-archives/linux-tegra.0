From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V5 0/7] Add CPUidle support for Tegra210
Date: Fri, 1 Feb 2019 12:49:03 +0000
Message-ID: <1e8434d3-99aa-5d5f-3f2a-15f87f03e2e4@nvidia.com>
References: <20190201033621.16814-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190201033621.16814-1-josephl@nvidia.com>
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
To: Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


On 01/02/2019 03:36, Joseph Lo wrote:
> This patch series adds CPUidle support for Tegra210, which supports
> power-down state (C7) for CPU cores. And due to arch timer cannot work
> across CPU core power-down and power on reset signal event. We introduce
> Tegra210 timer driver to work as clock event device. So it can be the
> wake-up source of CPU cores when they idled in the power-down state.
> 
> Fixed in V5:
>  * Just resend this whole series again with timer and Tegra maintainers
>    included
> 
> Fixed in V4:
>  * merge timer-tegra210.c into timer-tegra20.c
>  * add a new patch to select TEGRA_TIMER by default for Tegra210
> 
> Fixed in V3:
>  * use timer-of API for Tegra210 timer driver
> 
> Fixed in V2:
>  * list all the timer IRQs in the binding doc and dts file
>  * add error clean-up code in timer driver
>  * add entry-latency-us and exit-latency-us properties for idle-states
>    DT node
> 
> Joseph Lo (7):
>   dt-bindings: timer: add Tegra210 timer
>   clocksource: tegra: add Tegra210 timer support
>   soc/tegra: default select TEGRA_TIMER for Tegra210
>   arm64: dts: tegra210: fix timer node
>   arm64: dts: tegra210: add CPU idle states properties
>   arm64: dts: tegra210-p2180: Enable CPU idle support
>   arm64: dts: tegra210-smaug: Enable CPU idle support
> 
>  .../bindings/timer/nvidia,tegra210-timer.txt  |  36 ++
>  .../arm64/boot/dts/nvidia/tegra210-p2180.dtsi |   6 +
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts |   7 +
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi      |  33 +-
>  drivers/clocksource/Kconfig                   |   2 +-
>  drivers/clocksource/timer-tegra20.c           | 369 +++++++++++++-----
>  drivers/soc/tegra/Kconfig                     |   1 +
>  include/linux/cpuhotplug.h                    |   1 +
>  8 files changed, 352 insertions(+), 103 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/timer/nvidia,tegra210-timer.txt

Series looks good to me. Just a minor comment on patch 2/7 but otherwise
for the series ...

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
