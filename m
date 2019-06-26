From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 2/2] net: stmmac: Fix crash observed if PHY does not
 support EEE
Date: Wed, 26 Jun 2019 09:11:01 -0700 (PDT)
Message-ID: <20190626.091101.141287264489993877.davem@davemloft.net>
References: <20190626102322.18821-1-jonathanh@nvidia.com>
        <20190626102322.18821-2-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190626102322.18821-2-jonathanh@nvidia.com>
Sender: netdev-owner@vger.kernel.org
To: jonathanh@nvidia.com
Cc: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Jon Hunter <jonathanh@nvidia.com>
Date: Wed, 26 Jun 2019 11:23:22 +0100

> If the PHY does not support EEE mode, then a crash is observed when the
> ethernet interface is enabled. The crash occurs, because if the PHY does
> not support EEE, then although the EEE timer is never configured, it is
> still marked as enabled and so the stmmac ethernet driver is still
> trying to update the timer by calling mod_timer(). This triggers a BUG()
> in the mod_timer() because we are trying to update a timer when there is
> no callback function set because timer_setup() was never called for this
> timer.
> 
> The problem is caused because we return true from the function
> stmmac_eee_init(), marking the EEE timer as enabled, even when we have
> not configured the EEE timer. Fix this by ensuring that we return false
> if the PHY does not support EEE and hence, 'eee_active' is not set.
> 
> Fixes: 74371272f97f ("net: stmmac: Convert to phylink and remove phylib logic")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Applied.
