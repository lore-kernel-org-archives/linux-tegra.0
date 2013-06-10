From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/4] Fix and start using supplied_from logic
Date: Mon, 10 Jun 2013 17:26:38 -0400
Message-ID: <1370899602-22123-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anton Vorontsov <cbou-JGs/UdohzUI@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch series first fixes a refcount issue with the dt nodes
that was introduced with the supplied_from patch series. We add
a call to of_node_put to decrement the refcount for each node we get
from calling of_parse_phandle.

After that, this series enables using the supplied_from automatic
population from dt by passing in the dt nodes for the sbs battery
driver and the tps65090-charger driver.

Finally, the last patch creates this link for the tegra114-dalmore
board.

Rhyland Klein (4):
  power_supply: Add of_node_put to fix refcount
  power: sbs-battery: Add dt to power_supply struct
  power: tps65090-charger: Add dt node to power_supply
  arm: tegra: Add power-supplies link between battery and charger

 arch/arm/boot/dts/tegra114-dalmore.dts |    3 ++-
 drivers/power/power_supply_core.c      |    4 ++++
 drivers/power/sbs-battery.c            |    1 +
 drivers/power/tps65090-charger.c       |    1 +
 4 files changed, 8 insertions(+), 1 deletion(-)

-- 
1.7.9.5
