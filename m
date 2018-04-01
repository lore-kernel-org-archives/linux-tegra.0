From: Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] phy: tegra: Remote self cast in tegra_xusb_port_find_lane
Date: Sat, 31 Mar 2018 23:57:43 -0700
Message-ID: <20180401065743.GA30363@flashbox>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Nathan Chancellor <natechancellor@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Clang warns about casting variables to themselves because it is rarely
necessary. Removing the cast should not change anything regarding the
code and silences the warning.

../drivers/phy/tegra/xusb.c:421:11: warning: explicitly assigning value
of variable of type 'const struct tegra_xusb_lane_map *' to itself
[-Wself-assign]
        for (map = map; map->type; map++) {
             ~~~ ^ ~~~

Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
I am not entirely sure if this is the correct solution, especially since
I don't have the hardware and I am not too familiar with this code. If
there is a better solution, please let me know.

 drivers/phy/tegra/xusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 63e916d4d069..11aa5902a9ac 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -418,7 +418,7 @@ tegra_xusb_port_find_lane(struct tegra_xusb_port *port,
 {
 	struct tegra_xusb_lane *lane, *match = ERR_PTR(-ENODEV);
 
-	for (map = map; map->type; map++) {
+	for (; map->type; map++) {
 		if (port->index != map->port)
 			continue;
 
-- 
2.16.3
