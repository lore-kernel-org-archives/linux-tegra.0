From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V6 0/7] Add CPUidle support for Tegra210
Date: Sat, 2 Feb 2019 00:16:47 +0800
Message-ID: <20190201161654.18315-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This patch series adds CPUidle support for Tegra210, which supports
power-down state (C7) for CPU cores. And due to arch timer cannot work
across CPU core power-down and power on reset signal event. We introduce
Tegra210 timer driver to work as clock event device. So it can be the
wake-up source of CPU cores when they idled in the power-down state.

Fix in V6:
 * refine the timer defines in the timer driver (PATCH 2)
 * add ack tags from Jon Hunter.

Fixed in V5:
 * Just resend this whole series again with timer and Tegra maintainers
   included

Fixed in V4:
 * merge timer-tegra210.c into timer-tegra20.c
 * add a new patch to select TEGRA_TIMER by default for Tegra210

Fixed in V3:
 * use timer-of API for Tegra210 timer driver

Fixed in V2:
 * list all the timer IRQs in the binding doc and dts file
 * add error clean-up code in timer driver
 * add entry-latency-us and exit-latency-us properties for idle-states
   DT node

Joseph Lo (7):
  dt-bindings: timer: add Tegra210 timer
  clocksource: tegra: add Tegra210 timer support
  soc/tegra: default select TEGRA_TIMER for Tegra210
  arm64: dts: tegra210: fix timer node
  arm64: dts: tegra210: add CPU idle states properties
  arm64: dts: tegra210-p2180: Enable CPU idle support
  arm64: dts: tegra210-smaug: Enable CPU idle support

 .../bindings/timer/nvidia,tegra210-timer.txt  |  36 ++
 .../arm64/boot/dts/nvidia/tegra210-p2180.dtsi |   6 +
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts |   7 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi      |  33 +-
 drivers/clocksource/Kconfig                   |   2 +-
 drivers/clocksource/timer-tegra20.c           | 371 +++++++++++++-----
 drivers/soc/tegra/Kconfig                     |   1 +
 include/linux/cpuhotplug.h                    |   1 +
 8 files changed, 350 insertions(+), 107 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/nvidia,tegra210-timer.txt

-- 
2.20.1
