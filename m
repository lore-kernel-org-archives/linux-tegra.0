From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v4 0/2] net: stmmac: Enhanced addressing mode
 for DWMAC 4.10
Date: Wed, 02 Oct 2019 17:24:24 -0700 (PDT)
Message-ID: <20191002.172424.2266851696540625754.davem@davemloft.net>
References: <20191002145258.178745-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20191002145258.178745-1-thierry.reding@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: thierry.reding@gmail.com
Cc: joabreu@synopsys.com, alexandre.torgue@st.com, peppe.cavallaro@st.com, f.fainelli@gmail.com, jonathanh@nvidia.com, bbiswas@nvidia.com, netdev@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <thierry.reding@gmail.com>
Date: Wed,  2 Oct 2019 16:52:56 +0200

> From: Thierry Reding <treding@nvidia.com>
> 
> The DWMAC 4.10 supports the same enhanced addressing mode as later
> generations. Parse this capability from the hardware feature registers
> and set the EAME (Enhanced Addressing Mode Enable) bit when necessary.

Series applied.
