From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] of: Make <linux/of_reserved_mem.h> self-contained
Date: Wed,  6 May 2020 14:32:35 +0200
Message-ID: <20200506123236.7463-2-geert+renesas@glider.be>
References: <20200506123236.7463-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200506123236.7463-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Joseph Lo <josephl@nvidia.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-tegra@vger.kernel.org

<linux/of_reserved_mem.h> is not self-contained, as it uses
_OF_DECLARE() to define RESERVEDMEM_OF_DECLARE(), but does not include
<linux/of.h>.

Fix this by adding the missing include.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/linux/of_reserved_mem.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index a1b427ac291bf73d..8216a415626372ca 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -3,6 +3,7 @@
 #define __OF_RESERVED_MEM_H
 
 #include <linux/device.h>
+#include <linux/of.h>
 
 struct of_phandle_args;
 struct reserved_mem_ops;
-- 
2.17.1
