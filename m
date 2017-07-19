From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v7 0/4] reset: APIs to manage a list of resets
Date: Wed, 19 Jul 2017 17:59:04 +0200
Message-ID: <1500479948-29988-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Vivek Gautam <vivek.gautam@codeaurora.org>, Jon Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>
List-Id: linux-tegra@vger.kernel.org

A set of patches to allow consumers to get and de/assert or trigger
a number of resets at the same time. A patch on top of Vivek's original
API extension is added to hide the reset_control_array behind a struct
reset_control so that the consumer doesn't have to care about the difference
between a singular reset control and a reset control controlling an array
of resets, except when requesting it.

This series also contains reset controls patches for dwc3-of-simple
and tegra pmc drivers.
A small patch is added in this series to correctly re-order the
resource handling in dwc3_of_simple_remove().

The series is tested on torvald's master branch the device tree
patches to enable usb on db820c.

Changes since v6:
 - Removed leftover reset_control_array_put stub.

Changes since v5:
 - Fixed devm/of_reset_control_array_get stub return values in the
   "reset: hide reset control arrays behind struct reset_control" patch.
 - Merged "reset: hide reset control arrays behind struct reset_control" patch
   into "reset: Add APIs to manage array of resets" patch, to avoid adding
   new API functions in one patch that are removed in the other.
 - Updated commit message of "soc/tegra: pmc: Use the new reset APIs to manage
   reset controllers" patch.
 - Dropped already merged "reset: use kref for reference counting" patch.

Changes since v4:
 - Added a patch to hide reset control arrays behind struct reset_control
   and adapted the consumer patches. This could be merged with the reset
   array API patch if we think this is a good idea.

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
  reset: Add APIs to manage array of resets
  usb: dwc3: of-simple: Re-order resource handling in remove
  usb: dwc3: of-simple: Add support to get resets for the device
  soc/tegra: pmc: Use the new reset APIs to manage reset controllers

 drivers/reset/core.c              | 211 +++++++++++++++++++++++++++++++++++++-
 drivers/soc/tegra/pmc.c           |  82 ++++-----------
 drivers/usb/dwc3/dwc3-of-simple.c |  29 +++++-
 include/linux/reset.h             |  68 ++++++++++++
 4 files changed, 324 insertions(+), 66 deletions(-)

-- 
2.11.0
