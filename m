From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 1/2] net: stmmac: Fix possible deadlock when disabling
 EEE support
Date: Wed, 26 Jun 2019 09:10:55 -0700 (PDT)
Message-ID: <20190626.091055.2250153974662071717.davem@davemloft.net>
References: <20190626102322.18821-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190626102322.18821-1-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jonathanh@nvidia.com
Cc: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Jon Hunter <jonathanh@nvidia.com>
Date: Wed, 26 Jun 2019 11:23:21 +0100

> When stmmac_eee_init() is called to disable EEE support, then the timer
> for EEE support is stopped and we return from the function. Prior to
> stopping the timer, a mutex was acquired but in this case it is never
> released and so could cause a deadlock. Fix this by releasing the mutex
> prior to returning from stmmax_eee_init() when stopping the EEE timer.
> 
> Fixes: 74371272f97f ("net: stmmac: Convert to phylink and remove phylib logic")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

When targetting net-next for a set of changes, make this explicit and clear
by saying "[PATCH net-next ...] ..." in your Subject lines in the future.

Applied.
