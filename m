From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 00/16] PCI generic configuration space accessors
Date: Fri,  9 Jan 2015 20:34:34 -0600
Message-ID: <1420857290-8373-1-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Greg Ungerer <gerg-JBU5SbJe1FlAfugRpC6u6w@public.gmane.org>, Koichi Yasutake <yasutake.koichi-NAum8xwdG0+S7A1Ibl2khg@public.gmane.org>, Krzysztof Halasa <khalasa-NlWvg49iv0c@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, cbe-oss-dev@lists.
List-Id: linux-tegra@vger.kernel.org

This series adds common accessor functions for PCI configuration space
accesses. This supports most PCI hosts with memory mapped configuration
space like ECAM or hosts with memory mapped address/data registers. ECAM
is not generically supported by this series, but could be added on top
of this. While some hosts have standard address decoding which could be 
common as well, the various checks on bus numbers and device numbers are 
quite varied. It is unclear how much of that is really necessary or 
could be common. 

The first 4 patches are preparatory cleanup. Patch 5 introduces the
common accessors. The remaining patches convert several PCI host
controllers. This is in no way a complete list of host controllers. The
conversion of more hosts should be possible. The Designware controller
in particular should be able to be converted, but its config space
accessors are a mess of override-able functions that I've not gotten my
head around.

This series is available here [1].

Rob

[1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git pci-config-access

Rob Herring (16):
  frv: add struct pci_ops member names to initialization
  mips: add struct pci_ops member names to initialization
  mn10300: add struct pci_ops member names to initialization
  powerpc: add struct pci_ops member names to initialization
  pci: introduce common pci config space accessors
  ARM: cns3xxx: convert PCI to use generic config accesses
  ARM: integrator: convert PCI to use generic config accesses
  ARM: sa1100: convert PCI to use generic config accesses
  ARM: ks8695: convert PCI to use generic config accesses
  powerpc: fsl_pci: convert PCI to use generic config accesses
  powerpc: powermac: convert PCI to use generic config accesses
  pci/host: generic: convert to use generic config accesses
  pci/host: rcar-gen2: convert to use generic config accesses
  pci/host: tegra: convert to use generic config accesses
  pci/host: xgene: convert to use generic config accesses
  pci/host: xilinx: convert to use generic config accesses

 arch/arm/mach-cns3xxx/pcie.c                   |  52 ++----
 arch/arm/mach-integrator/pci_v3.c              |  61 +-------
 arch/arm/mach-ks8695/pci.c                     |  77 +--------
 arch/arm/mach-sa1100/pci-nanoengine.c          |  94 +----------
 arch/frv/mb93090-mb00/pci-vdk.c                |   4 +-
 arch/mips/pci/pci-bcm1480.c                    |   4 +-
 arch/mips/pci/pci-octeon.c                     |   4 +-
 arch/mips/pci/pcie-octeon.c                    |  12 +-
 arch/mn10300/unit-asb2305/pci.c                |   4 +-
 arch/powerpc/platforms/cell/celleb_scc_pciex.c |   4 +-
 arch/powerpc/platforms/powermac/pci.c          | 209 +++++--------------------
 arch/powerpc/sysdev/fsl_pci.c                  |  46 +-----
 drivers/pci/access.c                           |  87 ++++++++++
 drivers/pci/host/pci-host-generic.c            |  51 +-----
 drivers/pci/host/pci-rcar-gen2.c               |  51 +-----
 drivers/pci/host/pci-tegra.c                   |  55 +------
 drivers/pci/host/pci-xgene.c                   | 150 ++----------------
 drivers/pci/host/pcie-xilinx.c                 |  88 ++---------
 include/linux/pci.h                            |  11 ++
 19 files changed, 212 insertions(+), 852 deletions(-)

-- 
2.1.0
