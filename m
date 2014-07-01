From: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/3] Tegra USB probe order issue fix
Date: Wed, 2 Jul 2014 00:08:40 +0300
Message-ID: <1404248923-21086-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tuomas.tynkkynen-X3B1VOXEql0@public.gmane.org, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi all,

This series fixes a probe order issue with the Tegra EHCI driver.
Basically, the register area of the 1st USB controller contains some
registers that are global to all of the controllers, but that are also
cleared when reset is asserted to the 1st controller. So if (say) the
3rd controller would be the first one to finish probing successfully,
then the reset that happens during the 1st controller's probe would
result in broken USB. So the before doing anything with the USB HW,
we should reset the 1st controller once, and then never ever reset
it again.

However, fixing this without breaking existing device trees is very
complicated, as the 2nd and 3rd Tegra EHCI controllers don't have a
phandle to the 1st controller's reset handle, so we have to find it
the hard way. This is done in patch 2.

Patch 1 is a prerequisite change to the reset control API, so that we
can get a reset controller reference without a struct device *.

While testing that the 1st USB controller still works without a reset
when the driver is unbound and bound again, I discovered an unbalanced
regulator_disable + clk_disable_unprepare in the PHY code if the EHCI
driver is unbound and rebound. This is fixed in patch 3.

Tested on the Jetson TK1 that the 3rd USB port still works when the
1st controller is enabled and moved so that it's the last USB
node in the DT. Also tested that the 1st controller still works
after an unbind + rebind, even though it's not getting resetted
during the probe.

Thanks,
Tuomas

Tuomas Tynkkynen (3):
  reset: Re-export of_reset_control_get
  USB: EHCI: tegra: Fix probe order issue leading to broken USB
  USB: PHY: tegra: Call tegra_usb_phy_close only on device removal

 drivers/usb/host/ehci-tegra.c   | 111 ++++++++++++++++++++++++++++++++++++++--
 drivers/usb/phy/phy-tegra-usb.c |   8 ++-
 include/linux/reset.h           |   8 +++
 3 files changed, 119 insertions(+), 8 deletions(-)

-- 
1.8.1.5
