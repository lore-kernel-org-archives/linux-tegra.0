From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] net: stmmac: Do not output error on deferred probe
Date: Tue, 28 May 2019 19:25:48 +0200
Message-ID: <20190528172548.GS18059@lunn.ch>
References: <20190527105251.11198-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190527105251.11198-1-thierry.reding@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Jon Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, May 27, 2019 at 12:52:51PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> If the subdriver defers probe, do not show an error message. It's
> perfectly fine for this error to occur since the driver will get another
> chance to probe after some time and will usually succeed after all of
> the resources that it requires have been registered.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
