From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH net-next v4 0/2] net: stmmac: Enhanced addressing mode for DWMAC 4.10
Date: Wed,  2 Oct 2019 16:52:56 +0200
Message-ID: <20191002145258.178745-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>
Cc: Jose Abreu <joabreu@synopsys.com>, Alexandre Torgue <alexandre.torgue@st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Florian Fainelli <f.fainelli@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, netdev@vger.kernel.org, linux-tegra@vger.kernel.org
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
 .../ethernet/stmicro/stmmac/dwmac4_descs.c    |  4 +--
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  | 28 +++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.h  |  3 ++
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |  5 +++-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  7 +++++
 include/linux/stmmac.h                        |  1 +
 7 files changed, 46 insertions(+), 3 deletions(-)

-- 
2.23.0
