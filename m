From: Venu Byravarasu <vbyravarasu@nvidia.com>
Subject: [PATCH 0/4] usb: Supporting patches for registering Tegra USB PHY as a platform driver
Date: Wed, 16 Jan 2013 19:00:18 +0530
Message-ID: <1358343022-28919-1-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, balbi@ti.com, stern@rowland.harvard.edu
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, swarren@wwwdotorg.org, linux-doc@vger.kernel.org, linux-tegra@vger.kernel.org, Venu Byravarasu <vbyravarasu@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

As part of registering tegra USB PHY as platform driver, prepared
patches to add separate DT nodes describing Tegra USB PHY properties.
Modified instance number based processing to make use of the added
DT properties. As PHY will be registered as separate driver, removed
ehci register access from PHY driver and added APIs to ehci driver for
this purpose.

Venu Byravarasu (4):
  arm: tegra: Add DT nodes for Tegra USB PHY
  USB: PHY: Get rid of instance number to differentiate legacy
    controller
  USB: PHY: Tegra: Get rid of instance number to differentiate PHY type
  usb: Add APIs to access host registers from Tegra PHY

 .../bindings/usb/nvidia,tegra20-ehci.txt           |    1 +
 .../bindings/usb/nvidia,tegra20-usb-phy.txt        |   14 +++
 arch/arm/boot/dts/tegra20.dtsi                     |   22 +++++
 drivers/usb/host/ehci-tegra.c                      |   71 ++++++++++++++-
 drivers/usb/phy/tegra_usb_phy.c                    |  100 +++++++-------------
 include/linux/usb/tegra_usb_phy.h                  |    8 ++
 6 files changed, 149 insertions(+), 67 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt
