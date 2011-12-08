From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: tegra for-next and for-3.3/ branches updated
Date: Wed, 7 Dec 2011 22:11:40 -0800
Message-ID: <20111208061140.GB20760@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

I've pushed a new set of for-3.3 branches, contents below.

I decided to start a for-3.3/dt branch that holds all the devicetree-enablement
patches since there were some cross-dependencies between /soc and /board
if some of the later patches would just go in one. I thus moved some of the
previous patches that were in /soc and /boards over to /dt instead.

It does make sense to have the dt-enablement stuff in a separate topic
branch anyway, so that fits everything quite well.

I have a few patches I will post hopefully within the next few days,
and I expect that the Tegra3 series should be posted soon so we can get
it into 3.3.


for-3.3/cleanup:
Olof Johansson (1):
      arm/tegra: fix variable formatting in makefile

Stephen Warren (1):
      arm/tegra: Remove code that's ifndef CONFIG_ARM_GIC

pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org (1):
      arm/tegra: remove unused defines

for-3.3/dt:
Marc Dietrich (1):
      arm/dt: tegra: add dts file for paz00

Olof Johansson (2):
      arm/dt: add basic usb nodes to tegra device trees
      USB: ehci-tegra: add probing through device tree

Stephen Warren (9):
      arm/dt: tegra: Clean up I2S and DAS nodes
      arm/tegra: Add device-tree support for TrimSlice board
      arm/tegra: board-dt: Fix AUXDATA typo
      arm/tegra: board-dt: Enable audio-related clocks
      arm/dt: tegra: Remove /memreserve/ from device-tree files
      arm/dt: tegra: Remove /chosen node
      arm/dt: tegra: Fix I2C nodes to match board files
      arm/dt: tegra: Fix serial nodes to match board files
      arm/dt: tegra: Fix SDHCI nodes to match board files

pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org (1):
      arm/tegra: convert tegra20 to GIC devicetree binding

for-3.3/soc:
Peter De Schrijver (1):
      arm/tegra: clk_get should not be fatal

for-3.3/boards:
Leon Romanovsky (1):
      ARM: tegra: paz00: Fix board pinmux table.

Marc Dietrich (1):
      ARM: tegra: paz00: add support for wakeup gpio key
