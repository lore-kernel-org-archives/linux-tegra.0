From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH 0/8] Add EMC scaling support for Tegra210
Date: Fri, 29 Mar 2019 16:41:19 +0200
Message-ID: <20190329144119.GB12975@pdeschrijver-desktop.Nvidia.com>
References: <20190325074523.26456-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190325074523.26456-1-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joseph Lo <josephl@nvidia.com>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Looks ok to me.

Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>

On Mon, Mar 25, 2019 at 03:45:15PM +0800, Joseph Lo wrote:
> This series introduces the EMC clock scaling support for Tegra210. There
> are three parts of this series.
> 
> i. The DT bindings of the EMC table and how to deal with them.
> To support LPDDR4 DRAM devices, the EMC table with timing data must be
> trained before it can be used. The bootloader firmware will help to do
> that at the early boot stage. And help to merge the trained timing data
> into the DTB that EMC driver in the kernel will use later for EMC clock
> scaling.
> 
> And for backward compatibility to support the upstreaming devices, like
> Jetson TX1 and Shield, the bindings should remain the same. Which means
> we may not able to change the bindings currently.
> 
> ii. The EMC driver will use the trained EMC table with the ram code that
> the platform used to update the EMC registers for clock scaling. And to
> support higher rates (above 800MHz), periodic training is needed. This
> will be done by a timer. And two EMC sources will be used (PLL_M and
> 		PLL_MB) for the rate switching above or equal to 665MHz.
> It will check the current source and switch to another one dynamically.
> 
> iii. The detail sequence for EMC scaling support, this includes how we
> update the table to EMC registers and the periodic training support.
> 
> Here are the details and dependency of these patches.
> Patch 1 is the binding document of the EMC node and table.
> Patch 2 is the clock driver update for EMC scaling support. Need to note
> that with the update of the MC clock, the patch 3 (EMC clock driver) and
> patch 6 (EMC node in DT) will be needed to make MC clock to work
> normally.
> Patch 3 is the EMC clock driver. It can get the trained table from the
> firmware and know the current EMC status, like the rate and source
> clock.
> Patch 4 adds more APIs and support code. Tha will be needed for the EMC
> scaling sequence.
> Patch 5 adds the EMC scaling sequence code. With this, we can support
> EMC clock scaling now.
> Patch 6 introduces the EMC node in DT.
> Patch 7 adds EMC table of ram code 0.
> Patch 8 adds EMC table of ram code 1.
> 
> Joseph Lo (8):
>   dt-bindings: memory: tegra: Add Tegra210 EMC bindings
>   clk: tegra: clock changes for emc scaling support on Tegra210
>   memory: tegra: Add Tegra210 EMC clock driver
>   memory: tegra: add EMC scaling support code for Tegra210
>   memory: tegra: Add EMC scaling sequence code for Tegra210
>   arm64: tegra: Add external memory controller node for Tegra210
>   arm64: tegra: Add EMC table of ram code 0 for Tegra210 Shield platform
>   arm64: tegra: Add EMC table of ram code 1 for Tegra210 Shield platform
> 
>  .../nvidia,tegra210-emc.txt                   |   605 +
>  .../boot/dts/nvidia/tegra210-p2894-emc.dtsi   | 24851 ++++++++++++++++
>  .../arm64/boot/dts/nvidia/tegra210-p2894.dtsi |     1 +
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi      |    23 +
>  drivers/clk/tegra/clk-tegra210.c              |   112 +-
>  drivers/memory/tegra/Kconfig                  |    10 +
>  drivers/memory/tegra/Makefile                 |     1 +
>  drivers/memory/tegra/tegra210-dt-parse.c      |   340 +
>  drivers/memory/tegra/tegra210-emc-cc-r21021.c |  1962 ++
>  drivers/memory/tegra/tegra210-emc-reg.h       |  1482 +
>  drivers/memory/tegra/tegra210-emc.c           |  1814 ++
>  include/dt-bindings/clock/tegra210-car.h      |     4 +-
>  include/linux/clk/tegra.h                     |     5 +
>  13 files changed, 31192 insertions(+), 18 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-p2894-emc.dtsi
>  create mode 100644 drivers/memory/tegra/tegra210-dt-parse.c
>  create mode 100644 drivers/memory/tegra/tegra210-emc-cc-r21021.c
>  create mode 100644 drivers/memory/tegra/tegra210-emc-reg.h
>  create mode 100644 drivers/memory/tegra/tegra210-emc.c
> 
> -- 
> 2.21.0
> 
