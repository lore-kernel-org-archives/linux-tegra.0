From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v3 0/2] net: stmmac: Enhanced addressing mode for DWMAC 4.10
Date: Fri, 20 Sep 2019 19:00:34 +0200
Message-ID: <20190920170036.22610-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Florian Fainelli <f.fainelli@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, netdev@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The DWMAC 4.10 supports the same enhanced addressing mode as later
generations. Parse this capability from the hardware feature registers
and set the EAME (Enhanced Addressing Mode Enable) bit when necessary.

Thierry

Thierry Reding (2):
  net: stmmac: Only enable enhanced addressing mode when needed
  net: stmmac: Support enhanced addressing mode for DWMAC 4.10

 drivers/net/ethernet/stmicro/stmmac/dwmac4.h  |  1 +
 .../ethernet/stmicro/stmmac/dwmac4_descs.c    |  4 ++--
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  | 22 +++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.h  |  3 +++
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |  5 ++++-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  6 +++++
 include/linux/stmmac.h                        |  1 +
 7 files changed, 39 insertions(+), 3 deletions(-)

-- 
2.23.0
