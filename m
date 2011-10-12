From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: What's in the tegra for-3.2 branches
Date: Wed, 12 Oct 2011 15:54:23 -0700
Message-ID: <20111012225423.GA25602@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

Just a short summary of what we've collected in the tegra tree for-3.2/*
branches. Some of them are already in the arm-soc tree, pull request for the
others are going out shortly.

If you're missing something that you have posted, please let me know.


Marc Dietrich (5):
      ARM: tegra: paz00: add support serial port on JP1
      ARM: tegra: paz00: enable rfkill for internal wifi card
      ARM: tegra: paz00: enable wifi led
      ARM: tegra: paz00: reorder the SDHCI channel init
      ARM: tegra: paz00: add clocks required for usb operation

Olof Johansson (14):
      ARM: tegra: annotate IO_*_VIRT pointers
      ARM: tegra: timer: don't cast __iomem pointers
      ARM: tegra: tegra2_clocks: don't cast __iomem pointers
      ARM: tegra: tegra2_clocks: 0 -> NULL changes
      ARM: tegra: pcie: don't cast __iomem pointers
      ARM: tegra: pcie: include board.h
      ARM: tegra: pcie: 0 -> NULL changes
      ARM: tegra: tegra_init_cache should be static
      ARM: tegra: tegra_rtc_read_ms should be static
      ARM: tegra: tegra_powergate_is_powered should be static
      ARM: tegra: tegra2_clocks: don't export some tables
      ARM: tegra: dma: staticify some tables and functions
      ARM: tegra: cpu-tegra: sparse type fix
      ARM: tegra: cpu-tegra: unexport two functions

Peter De Schrijver (3):
      arm/tegra: prepare Seaboard pinmux code for derived boards
      arm/tegra: add support for ventana pinmuxing
      arm/tegra: device tree support for ventana board

Stephen Warren (10):
      ARM: Tegra: Harmony: Add USB device
      ARM: Tegra: Seaboard board updates for audio
      ARM: Tegra: Seaboard: Add USB devices
      ARM: Tegra: Force PORT_TEGRA as the UART type
      arm/dt: Tegra: Add support-8bit to SDHCI nodes
      arm/tegra: Prep boards for gpio/pinmux conversion to pdevs
      arm/dt: Tegra: Add pinmux node to tegra20.dtsi
      arm/tegra: Convert pinmux driver to a platform device
      arm/tegra: pinmux: ioremap registers
      arm/tegra: Harmony: Configure PMC for low-level interrupts
