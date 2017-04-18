From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH V3 0/4] reset: APIs to manage a list of resets
Date: Tue, 18 Apr 2017 16:51:24 +0530
Message-ID: <1492514488-27385-1-git-send-email-vivek.gautam@codeaurora.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Set of patches to support getting and de/asserting a list (array)
of reset controllers available with the device.
This series also contains reset controls patches for dwc3-of-simple
and tegra pmc drivers.

This V3 version addresses Philipp's review comments to make the
APIs inline with gpiod APIs. So, the reset framework does all the
job of storing the reset controls and their count.
The users can just pass the device pointer/node along with 'optional'
'shared' flags.
The *_reset_control_array_* APIs _assert() and _deassert() required
'struct reset_control_array' to handle the reset controls.

The series is tested on torvald's master branch with following support -
a) pza/linux - reset/next
b) gregkh/usb - usb-next
c) agross/linux - for-next
d) device tree patches to enable usb on db820c.

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
  reset: Add API to count number of reset available with device
  reset: Add APIs to manage array of resets
  usb: dwc3: of-simple: Add support to get resets for the device
  soc/tegra: pmc: Use the new reset APIs to manage reset controllers

 drivers/reset/core.c              | 200 ++++++++++++++++++++++++++++++++++++++
 drivers/soc/tegra/pmc.c           |  99 +++++++------------
 drivers/usb/dwc3/dwc3-of-simple.c |  36 +++++++
 include/linux/reset.h             |  99 +++++++++++++++++++
 4 files changed, 371 insertions(+), 63 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
