From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next 1/2] net: stmmac: Make MDIO bus reset optional
Date: Sat, 27 Jul 2019 13:52:39 -0700 (PDT)
Message-ID: <20190727.135239.1789409094437500386.davem@davemloft.net>
References: <20190726102741.27872-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190726102741.27872-1-thierry.reding@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: thierry.reding@gmail.com
Cc: joabreu@synopsys.com, alexandre.torgue@st.com, peppe.cavallaro@st.com, jonathanh@nvidia.com, netdev@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <thierry.reding@gmail.com>
Date: Fri, 26 Jul 2019 12:27:40 +0200

> From: Thierry Reding <treding@nvidia.com>
> 
> The Tegra EQOS driver already resets the MDIO bus at probe time via the
> reset GPIO specified in the phy-reset-gpios device tree property. There
> is no need to reset the bus again later on.
> 
> This avoids the need to query the device tree for the snps,reset GPIO,
> which is not part of the Tegra EQOS device tree bindings. This quiesces
> an error message from the generic bus reset code if it doesn't find the
> snps,reset related delays.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Applied.
