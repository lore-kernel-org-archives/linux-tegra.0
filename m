From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 06/13] memory: tegra: Extract memory client SID programming
Date: Sun, 22 Dec 2019 15:10:28 +0100
Message-ID: <20191222141035.1649937-7-thierry.reding@gmail.com>
References: <20191222141035.1649937-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191222141035.1649937-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Move programming of the memory client to SID mapping into a separate
function so that it can be reused from multiple call sites.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/tegra186.c | 49 ++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index ad5c353dba6e..57895116c8e5 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -32,6 +32,32 @@ struct tegra186_mc {
 	const struct tegra186_mc_soc *soc;
 };
 
+static void tegra186_mc_program_sid(struct tegra186_mc *mc)
+{
+	unsigned int i;
+
+	for (i = 0; i < mc->soc->num_clients; i++) {
+		const struct tegra186_mc_client *client = &mc->soc->clients[i];
+		u32 override, security;
+
+		override = readl(mc->regs + client->regs.override);
+		security = readl(mc->regs + client->regs.security);
+
+		dev_dbg(mc->dev, "client %s: override: %x security: %x\n",
+			client->name, override, security);
+
+		dev_dbg(mc->dev, "setting SID %u for %s\n", client->sid,
+			client->name);
+		writel(client->sid, mc->regs + client->regs.override);
+
+		override = readl(mc->regs + client->regs.override);
+		security = readl(mc->regs + client->regs.security);
+
+		dev_dbg(mc->dev, "client %s: override: %x security: %x\n",
+			client->name, override, security);
+	}
+}
+
 static const struct tegra186_mc_client tegra186_mc_clients[] = {
 	{
 		.name = "ptcr",
@@ -549,7 +575,6 @@ static int tegra186_mc_probe(struct platform_device *pdev)
 {
 	struct tegra186_mc *mc;
 	struct resource *res;
-	unsigned int i;
 	int err;
 
 	mc = devm_kzalloc(&pdev->dev, sizeof(*mc), GFP_KERNEL);
@@ -565,28 +590,8 @@ static int tegra186_mc_probe(struct platform_device *pdev)
 
 	mc->dev = &pdev->dev;
 
-	for (i = 0; i < mc->soc->num_clients; i++) {
-		const struct tegra186_mc_client *client = &mc->soc->clients[i];
-		u32 override, security;
-
-		override = readl(mc->regs + client->regs.override);
-		security = readl(mc->regs + client->regs.security);
-
-		dev_dbg(&pdev->dev, "client %s: override: %x security: %x\n",
-			client->name, override, security);
-
-		dev_dbg(&pdev->dev, "setting SID %u for %s\n", client->sid,
-			client->name);
-		writel(client->sid, mc->regs + client->regs.override);
-
-		override = readl(mc->regs + client->regs.override);
-		security = readl(mc->regs + client->regs.security);
-
-		dev_dbg(&pdev->dev, "client %s: override: %x security: %x\n",
-			client->name, override, security);
-	}
-
 	platform_set_drvdata(pdev, mc);
+	tegra186_mc_program_sid(mc);
 
 	return err;
 }
-- 
2.24.1
