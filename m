From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] memory: tegra: EMC scaling is not a clock provider
Date: Wed,  6 May 2020 14:32:34 +0200
Message-ID: <20200506123236.7463-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Joseph Lo <josephl@nvidia.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-tegra@vger.kernel.org

	Hi all,

The Tegra EMC scaling support code is not a clock provider, but merely a
clock consumer, and thus does not need to include
<linux/clk-provider.h>.

However, drivers/memory/tegra/tegra210-emc-table.c relies on
tegra210-emc.h to include <linux/of.h> through <linux/clk-provider.h>.
Hence the first patch makes <linux/of_reserved_mem.h> self-contained
first.

Thanks for your comments!

Geert Uytterhoeven (2):
  of: Make <linux/of_reserved_mem.h> self-contained
  memory: tegra: Drop <linux/clk-provider.h>

 drivers/memory/tegra/tegra210-emc-core.c | 1 -
 drivers/memory/tegra/tegra210-emc.h      | 1 -
 include/linux/of_reserved_mem.h          | 1 +
 3 files changed, 1 insertion(+), 2 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
