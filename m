From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V5 00/21] Tegra XUSB OTG support
Date: Mon, 10 Feb 2020 13:41:26 +0530
Message-ID: <1581322307-11140-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This patch series adds OTG support on XUSB hardware used in Tegra210 and
Tegra186 SoCs.

This patchset is composed with :
 - dt bindings of XUSB Pad Controller
 - dt bindings for XUSB device Driver
 - Tegra PHY driver for usb-role-switch and usb-phy
 - Tegra XUSB host mode driver to support OTG mode
 - Tegra XUSB device mode driver to use usb-phy and multi device mode
 - dts for XUSB pad controller
 - dts for xudc for Jetson TX1 and TX2
 - dts for Jetson-TK1
 - dts for Jetson-Nano

Tegra Pad controller driver register for role switch updates for
OTG/peripheral capable USB ports and adds usb-phy for that corresponding
USB ports.

Host and Device mode drivers gets usb-phy from USB2's phy and registers
notifier for role changes to perform corresponding role tasks.

Order of merging Patches:
Please merge DT changes first followed Tegra PHY driver changes and then
USB driver changes.

Tests done:
 - device mode support using micro-B USB cable connection between ubuntu
   host and DUT on micro-AB port
 - host mode support by connecting pen-drive to micro-AB USB port on DUT
   using standard-A to micro-A converter.
 - toggling between these 2 modes by hot plugging corresponding cables.

DUT: Jetson-tx1, Jetson tx2, Jetson Nano(device mode test only).

V5:
 - Jetson Nano DT changes are added in the series
 - Removed select USB_ROLE_SWITCH from Kconfig in the change corresponding
   to removal off role switch support from XUDC driver.
V4:
 - Owner info is updated to port->dev for which USB role switch is used.
 - Updated function name in logs, unsigned int usage as per comments.
 - usb_phy_event is used instead of usb_role to detect role changes as
   notifier arguments of usb-phy is used for charging current updates.
 - Added ACKed-by info for corresponding patches.
 - Jetson TK1 DT changes added to remove USB2-0 port from padctl node.
V3:
 - Port and cable names updated in "Tests done" section of cover letter as
   per JC inputs.
 - Fixed arguments allignments in USB padctl driver.
 - Padctl driver aborts if usb-role-switch is not present in dt for
   peripheral/otg roles.
 - Added Reviewed and ACKed details for corresponding patches.
V2:
 - Updated usb-role-switch documentation for Padctl driver.
 - Update XUDC bindings doc as suggested by Rob.
 - Used standard error codes for error return.
 - Added of_platform_depopulate during error and driver removal.
 - Updated error variable during phy initialization in XUDC driver.
 - Updated Tegra210 soc dtb file as per changes to binding doc.
 
Nagarjuna Kristam (21):
  dt-bindings: phy: tegra-xusb: Add usb-role-switch
  dt-bindings: usb: Add NVIDIA Tegra XUSB device mode controller binding
  phy: tegra: xusb: Add usb-role-switch support
  phy: tegra: xusb: Add usb-phy support
  phy: tegra: xusb: Add support to get companion USB 3 port
  phy: tegra: xusb: Add set_mode support for USB 2 phy on Tegra210
  phy: tegra: xusb: Add set_mode support for UTMI phy on Tegra186
  usb: xhci-tegra: Add OTG support
  usb: gadget: tegra-xudc: Remove usb-role-switch support
  usb: gadget: tegra-xudc: Add usb-phy support
  usb: gadget: tegra-xudc: use phy_set_mode to set/unset device mode
  usb: gadget: tegra-xudc: support multiple device modes
  arm64: tegra: update OTG port entries for jetson-tx1
  arm64: tegra: update OTG port entries for jetson-tx2
  arm64: tegra: Add xudc node for Tegra210
  arm64: tegra: Enable xudc on Jetson TX1
  arm64: tegra: Add xudc node for Tegra186
  arm64: tegra: Enable xudc node on Jetson TX2
  ARM: tegra: Remove USB 2-0 port from Jetson TK1 padctl
  arm64: tegra: update OTG port entries for jetson-nano
  arm64: tegra: Enable xudc node on Jetson nano

 .../bindings/phy/nvidia,tegra124-xusb-padctl.txt   |   6 +
 .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml | 190 ++++++++++++++
 arch/arm/boot/dts/tegra124-jetson-tk1.dts          |   6 -
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |  23 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  19 ++
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |  34 ++-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  22 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  19 ++
 drivers/phy/tegra/Kconfig                          |   1 +
 drivers/phy/tegra/xusb-tegra186.c                  | 114 +++++++--
 drivers/phy/tegra/xusb-tegra210.c                  | 131 ++++++++--
 drivers/phy/tegra/xusb.c                           | 172 +++++++++++++
 drivers/phy/tegra/xusb.h                           |   5 +
 drivers/usb/gadget/udc/Kconfig                     |   1 -
 drivers/usb/gadget/udc/tegra-xudc.c                | 273 ++++++++++++++-------
 drivers/usb/host/xhci-tegra.c                      | 228 ++++++++++++++++-
 include/linux/phy/tegra/xusb.h                     |   2 +
 17 files changed, 1098 insertions(+), 148 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml

-- 
2.7.4
