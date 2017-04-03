From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH v2 0/4] reset: APIs to manage a list of resets
Date: Mon,  3 Apr 2017 19:11:58 +0530
Message-ID: <1491226922-20307-1-git-send-email-vivek.gautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Cc: p.zabel@pengutronix.de, swarren@wwwdotorg.org, thierry.reding@gmail.com, balbi@kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>
List-Id: linux-tegra@vger.kernel.org

Set of patches to support getting and de/asserting a list (array)
of reset controllers available with the device.

These patches address the comments received for the earlier
posted series [1,2].
The users can pass a list of reset controllers and the number of
resets available in the driver or the ones using device tree can
request the total number of reset controllers available in the
device node and pass the information to reset_control_array_* APIs
to _get(), _assert() and _deassert() the list of resets.

Changes since v1:
 - Addressed comment for error handling in of_reset_control_get_count()
 - Added patch to manage reset controller array.
 - Rebased dwc3-of-simple changes based on the new set of APIs
   for reset control array.
 - Added a patch for soc/tegra/pmc driver to use the new set of
   reset control array APIs.

-- Based on Torvald's master branch.
-- Tested usb on db820c target for dwc3-of-simple driver.
-- Build tested for tegra/pmc driver. Needs testing.

[1] https://lkml.org/lkml/2017/2/22/12
[2] https://lkml.org/lkml/2017/2/22/11

Vivek Gautam (4):
  reset: Add API to count number of reset available with device
  reset: Add APIs to manage array of resets
  usb: dwc3: of-simple: Add support to get resets for the device
  soc/tegra: pmc: Use the new reset APIs to manage reset controllers

 drivers/reset/core.c              | 191 ++++++++++++++++++++++++++++++++++++++
 drivers/soc/tegra/pmc.c           |  92 ++++++++----------
 drivers/usb/dwc3/dwc3-of-simple.c |  45 +++++++++
 include/linux/reset.h             | 114 +++++++++++++++++++++++
 4 files changed, 389 insertions(+), 53 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
