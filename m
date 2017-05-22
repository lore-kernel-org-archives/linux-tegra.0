From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH v4 0/4] reset: APIs to manage a list of resets
Date: Mon, 22 May 2017 16:53:23 +0530
Message-ID: <1495452207-6129-1-git-send-email-vivek.gautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, jonathanh@nvidia.com, balbi@kernel.org, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>
List-Id: linux-tegra@vger.kernel.org

Set of patches to support getting and de/asserting a list (array)
of reset controllers available with the device.
This series also contains reset controls patches for dwc3-of-simple
and tegra pmc drivers.
A small patch is added in this series to correctly re-order the
resource handling in dwc3_of_simple_remove().

The series is tested on torvald's master branch the device tree
patches to enable usb on db820c.

Changes since v3:
 - Squashed of_reset_control_get_count() patch in the second patch that
   adds the reset control array APIs.
 - The error path after getting count through of_reset_control_get_count()
   now returns NULL pointer in case when 'optional' flag is true.
 - Added code in reset_control_array_assert() to deassert the
   already asserted resets in the error case.
 - Using of_reset_control_array_get_optional_exclusive() in dwc3 patch
   to request the reset control array.
 - Added a patch to fix the order in which resources are handled in
   dwc3_of_simple_remove() path.
 - Added tegra_powergate->reset to take care of single reset control
   passed from the client drivers.

Changes since v2:
 - Addressed comments to make APIs inline with gpiod API.
 - Moved number of reset controls in 'struct reset_control_array'
   so that the footprint is reduced.
 - of_reset_control_array_get() and devm_reset_control_array_get()
   now return pointer to the newly created reset control array.
 - Added comments to mention that the reset control array APIs don't
   guarantee any particular order when handling the reset controls.
 - Dropped 'name' from reset_control_array' since the interface is meant
   for a bunch of anonymous resets that can all be asserted or deasserted
   in arbitrary order.
 - Fixed returns for APIs reported by kbuild.
 - Fixed 'for' clause guards reported by kbuild.

Changes since v1:
 - Addressed comment for error handling in of_reset_control_get_count()
 - Added patch to manage reset controller array.
 - Rebased dwc3-of-simple changes based on the new set of APIs
   for reset control array.
 - Added a patch for soc/tegra/pmc driver to use the new set of
   reset control array APIs.

Vivek Gautam (4):
  usb: dwc3: of-simple: Re-order resource handling in remove
  reset: Add APIs to manage array of resets
  usb: dwc3: of-simple: Add support to get resets for the device
  soc/tegra: pmc: Use the new reset APIs to manage reset controllers

 drivers/reset/core.c              | 204 ++++++++++++++++++++++++++++++++++++++
 drivers/soc/tegra/pmc.c           |  91 ++++++-----------
 drivers/usb/dwc3/dwc3-of-simple.c |  29 +++++-
 include/linux/reset.h             |  93 +++++++++++++++++
 4 files changed, 354 insertions(+), 63 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
