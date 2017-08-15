From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 05/10] drm/tegra: sor: Use unsigned int for register offsets
Date: Tue, 15 Aug 2017 15:41:09 +0200
Message-ID: <20170815134114.17547-5-thierry.reding@gmail.com>
References: <20170815134114.17547-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170815134114.17547-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Register offsets are usually fairly small numbers, so an unsigned int is
more than enough to represent them.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/sor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 0ac845291cb4..020792eb2724 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -235,13 +235,13 @@ static inline struct tegra_sor *to_sor(struct tegra_output *output)
 	return container_of(output, struct tegra_sor, output);
 }
 
-static inline u32 tegra_sor_readl(struct tegra_sor *sor, unsigned long offset)
+static inline u32 tegra_sor_readl(struct tegra_sor *sor, unsigned int offset)
 {
 	return readl(sor->regs + (offset << 2));
 }
 
 static inline void tegra_sor_writel(struct tegra_sor *sor, u32 value,
-				    unsigned long offset)
+				    unsigned int offset)
 {
 	writel(value, sor->regs + (offset << 2));
 }
-- 
2.13.3
