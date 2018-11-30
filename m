From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2] net: stmmac: Move debugfs init/exit to
 ->probe()/->remove()
Date: Fri, 30 Nov 2018 13:16:48 -0800 (PST)
Message-ID: <20181130.131648.1001002082761494151.davem@davemloft.net>
References: <20181123122122.18957-1-thierry.reding@gmail.com>
        <20181127132143.10473-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181127132143.10473-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com
Cc: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, netdev@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <thierry.reding@gmail.com>
Date: Tue, 27 Nov 2018 14:21:43 +0100

> From: Thierry Reding <treding@nvidia.com>
> 
> Setting up and tearing down debugfs is current unbalanced, as seen by
> this error during resume from suspend:
> 
>     [  752.134067] dwc-eth-dwmac 2490000.ethernet eth0: ERROR failed to create debugfs directory
>     [  752.134347] dwc-eth-dwmac 2490000.ethernet eth0: stmmac_hw_setup: failed debugFS registration
> 
> The imbalance happens because the driver creates the debugfs hierarchy
> when the device is opened and tears it down when the device is closed.
> There's little gain in that, and it could be argued that it is even
> surprising because it's not usually done for other devices. Fix the
> imbalance by moving the debugfs creation and teardown to the driver's
> ->probe() and ->remove() implementations instead.
> 
> Note that the ring descriptors cannot be read while the interface is
> down, so make sure to return an empty file when the descriptors_status
> debugfs file is read.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> This applies on top of net-next.
> 
> Changes in v2:
> - avoid access to ring descriptors when interface is down

Applied, thanks.
