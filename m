From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 0/3] Add DT Binding for Power-Supply power-supplies property
Date: Mon, 1 Apr 2013 17:45:52 -0400
Message-ID: <1364852755-17425-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anton Vorontsov <cbou-JGs/UdohzUI@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This series defines a common way for devicetree initialized
power_supplies to define their relationships between chargers and
supplicants.

This series adds a supplied_from array to complement the supplied_to
array and to allow supplies to define the list of supplies which
supply them.

Then once this property is supported, we can use a new property for
devicetree to define the relationships between nodes, and read in this
property to generate the supplied_from list.

With this logic in place, all drivers need to do to add support for
this mechanism, is to store their device tree node in the power_supply
struct. They should also handle EPROBE_DEFER properly.

Changes since:
v2:
 - Changed __power_supply_is_supplied_by to a boolean function and
   corrected return paths around it
 - took loop invariant tests out of loops
 - Fixed multiline comment style
 - fixed up return paths around power_supplies_check_supplies

RFC v2:
 - Changed to official Patch set rather than RFC
 - defined supplied_from char ** array rather than complicated
   struct device_node related array

RFC v1:
 - Inverted the logic so that supplies (batteries) contain a list of
   the supplies (chargers) which supply them.

Rhyland Klein (3):
  power_supply: Define Binding for power-supplies
  power: power_supply: Add core support for supplied_from
  power: power_supply_core: Add support for supplied_from

 .../bindings/power_supply/power_supply.txt         |   23 +++
 drivers/power/power_supply_core.c                  |  187 ++++++++++++++++++--
 include/linux/power_supply.h                       |    6 +
 3 files changed, 203 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power_supply/power_supply.txt

-- 
1.7.9.5
