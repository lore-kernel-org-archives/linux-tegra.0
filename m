From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net: stmmac: Do not output error on deferred probe
Date: Tue, 28 May 2019 11:00:42 -0700 (PDT)
Message-ID: <20190528.110042.807042977833322022.davem@davemloft.net>
References: <20190527105251.11198-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190527105251.11198-1-thierry.reding@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: thierry.reding@gmail.com
Cc: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, jonathanh@nvidia.com, netdev@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <thierry.reding@gmail.com>
Date: Mon, 27 May 2019 12:52:51 +0200

> From: Thierry Reding <treding@nvidia.com>
> 
> If the subdriver defers probe, do not show an error message. It's
> perfectly fine for this error to occur since the driver will get another
> chance to probe after some time and will usually succeed after all of
> the resources that it requires have been registered.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Applied.
