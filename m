From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next 2/2] net: stmmac: Do not request stmmaceth
 clock
Date: Sat, 27 Jul 2019 13:52:45 -0700 (PDT)
Message-ID: <20190727.135245.191991967753814130.davem@davemloft.net>
References: <20190726102741.27872-1-thierry.reding@gmail.com>
        <20190726102741.27872-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190726102741.27872-2-thierry.reding@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: thierry.reding@gmail.com
Cc: joabreu@synopsys.com, alexandre.torgue@st.com, peppe.cavallaro@st.com, jonathanh@nvidia.com, netdev@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <thierry.reding@gmail.com>
Date: Fri, 26 Jul 2019 12:27:41 +0200

> From: Thierry Reding <treding@nvidia.com>
> 
> The stmmaceth clock is specified by the slave_bus and apb_pclk clocks in
> the device tree bindings for snps,dwc-qos-ethernet-4.10 compatible nodes
> of this IP.
> 
> The subdrivers for these bindings will be requesting the stmmac clock
> correctly at a later point, so there is no need to request it here and
> cause an error message to be printed to the kernel log.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Applied.
