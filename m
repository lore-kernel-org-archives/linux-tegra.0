From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 04/14] gpu: host1x: Print address/offset pairs consistently
Date: Mon, 13 Oct 2014 12:21:45 +0200
Message-ID: <1413195715-4719-4-git-send-email-thierry.reding@gmail.com>
References: <1413195715-4719-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1413195715-4719-1-git-send-email-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Consistently use a format of %pad+%#x to print address/offset in debug
messages.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/hw/cdma_hw.c  | 4 ++--
 drivers/gpu/host1x/hw/debug_hw.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/host1x/hw/cdma_hw.c b/drivers/gpu/host1x/hw/cdma_hw.c
index 072d8209c06c..305ea8f3382d 100644
--- a/drivers/gpu/host1x/hw/cdma_hw.c
+++ b/drivers/gpu/host1x/hw/cdma_hw.c
@@ -54,8 +54,8 @@ static void cdma_timeout_cpu_incr(struct host1x_cdma *cdma, u32 getptr,
 		u32 *p = (u32 *)(pb->mapped + getptr);
 		*(p++) = HOST1X_OPCODE_NOP;
 		*(p++) = HOST1X_OPCODE_NOP;
-		dev_dbg(host1x->dev, "%s: NOP at %#llx\n", __func__,
-			(u64)pb->phys + getptr);
+		dev_dbg(host1x->dev, "%s: NOP at %pad+%#x\n", __func__,
+			&pb->phys, getptr);
 		getptr = (getptr + 8) & (pb->size_bytes - 1);
 	}
 	wmb();
diff --git a/drivers/gpu/host1x/hw/debug_hw.c b/drivers/gpu/host1x/hw/debug_hw.c
index f72c873eff81..791de9351eeb 100644
--- a/drivers/gpu/host1x/hw/debug_hw.c
+++ b/drivers/gpu/host1x/hw/debug_hw.c
@@ -163,8 +163,8 @@ static void show_channel_gathers(struct output *o, struct host1x_cdma *cdma)
 				continue;
 			}
 
-			host1x_debug_output(o, "    GATHER at %#llx+%04x, %d words\n",
-					    (u64)g->base, g->offset, g->words);
+			host1x_debug_output(o, "    GATHER at %pad+%#x, %d words\n",
+					    &g->base, g->offset, g->words);
 
 			show_gather(o, g->base + g->offset, g->words, cdma,
 				    g->base, mapped);
-- 
2.1.2
