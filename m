From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH 0/4] Allow xHCI drivers to be built as separate modules
Date: Wed,  9 Jul 2014 18:05:46 -0700
Message-ID: <1404954350-26343-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Alan Stern <stern@rowland.harvard.edu>, Julius Werner <jwerner@chromium.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>
List-Id: linux-tegra@vger.kernel.org

It was suggested in the review of the Tegra xHCI driver [1] that we
allow xHCI drivers to be built as individual modules (like EHCI) instead
of building them all into the single xhci-hcd module as they are today.

Patches 1-3 prepare for making the xHCI PCI and platform drivers able
to be built as individual modules and patch 4 actually creates the 3
separate modules (core, platform, PCI).

Based on 3.16-rc4.

[1] http://patchwork.ozlabs.org/patch/361265/

Andrew Bresticker (4):
  xhci: Introduce xhci_init_driver()
  xhci: Check for XHCI_COMP_MODE_QUIRK when disabling D3cold
  xhci: Export symbols used by host-controller drivers
  xhci: Allow xHCI drivers to be built as separate modules

 drivers/usb/host/Kconfig     |  5 +++
 drivers/usb/host/Makefile    | 10 ++---
 drivers/usb/host/xhci-dbg.c  |  1 +
 drivers/usb/host/xhci-pci.c  | 80 +++++++-----------------------------
 drivers/usb/host/xhci-plat.c | 69 +++++--------------------------
 drivers/usb/host/xhci.c      | 96 +++++++++++++++++++++++++++++++++-----------
 drivers/usb/host/xhci.h      | 23 +----------
 7 files changed, 111 insertions(+), 173 deletions(-)

-- 
2.0.0.526.g5318336
