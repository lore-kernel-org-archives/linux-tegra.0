From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/8] clk: Minor cleanups
Date: Wed, 08 Apr 2015 15:22:11 +0200
Message-ID: <1428499339-29569-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Max Filippov <jcmvbkbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,


Small cleanups for different clock drivers.

The first two patches are independent.

Rest of the patches (these related to constifying parent names)
depend on the third patch: "clk: Constify pointers to parent
names in init data".


Tested on Arndale Octa (Exynos5420) and Trats2 (Exynos4412). Other
drivers (and MIPS related) only compile tested plus some static
checkers.

Best regards,
Krzysztof


Krzysztof Kozlowski (8):
  clk: rockchip: Staticize file-scope declarations
  clk: exynos: Staticize file-scope declarations
  clk: Constify pointers to parent names in init data
  clk: tegra: Fix duplicate const for parent names
  clk: cdce706: Constify parent names in clock init data
  clk: sirf: Constify parent names in clock init data
  clk: ls1x: Fix duplicate const for parent names
  MIPS: Alchemy: Remove unneeded cast removing const

 arch/mips/alchemy/common/clock.c     |  6 +--
 drivers/clk/clk-cdce706.c            |  4 +-
 drivers/clk/clk-composite.c          |  2 +-
 drivers/clk/clk-ls1x.c               |  6 +--
 drivers/clk/clk-mux.c                |  8 ++--
 drivers/clk/rockchip/clk-rk3188.c    |  2 +-
 drivers/clk/rockchip/clk-rk3288.c    |  2 +-
 drivers/clk/samsung/clk-exynos5260.c | 74 ++++++++++++++++++------------------
 drivers/clk/samsung/clk-exynos5420.c | 10 ++---
 drivers/clk/sirf/clk-common.c        | 12 +++---
 drivers/clk/tegra/clk-emc.c          |  2 +-
 include/linux/clk-provider.h         | 12 +++---
 12 files changed, 70 insertions(+), 70 deletions(-)

-- 
1.9.1
