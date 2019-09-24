From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v3 0/2] net: stmmac: Enhanced addressing mode for DWMAC
 4.10
Date: Tue, 24 Sep 2019 21:45:08 +0200 (CEST)
Message-ID: <20190924.214508.1949579574079200671.davem@davemloft.net>
References: <20190920170036.22610-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190920170036.22610-1-thierry.reding@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: thierry.reding@gmail.com
Cc: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, f.fainelli@gmail.com, jonathanh@nvidia.com, bbiswas@nvidia.com, netdev@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <thierry.reding@gmail.com>
Date: Fri, 20 Sep 2019 19:00:34 +0200

> From: Thierry Reding <treding@nvidia.com>
> 
> The DWMAC 4.10 supports the same enhanced addressing mode as later
> generations. Parse this capability from the hardware feature registers
> and set the EAME (Enhanced Addressing Mode Enable) bit when necessary.

This looks like an enhancement and/or optimization rather than a bug fix.

Also, you're now writing to the high 32-bits unconditionally, even when
it will always be zero because of 32-bit addressing.  That looks like
a step backwards to me.

I'm not applying this.
