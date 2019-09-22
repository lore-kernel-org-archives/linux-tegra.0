From: Jakub Kicinski <jakub.kicinski@netronome.com>
Subject: Re: [PATCH] net: stmmac: Fix page pool size
Date: Sun, 22 Sep 2019 15:31:32 -0700
Message-ID: <20190922153132.0c328fe7@cakuba.netronome.com>
References: <20190920170127.22850-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190920170127.22850-1-thierry.reding@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Florian Fainelli <f.fainelli@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, netdev@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, 20 Sep 2019 19:01:27 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The size of individual pages in the page pool in given by an order. The
> order is the binary logarithm of the number of pages that make up one of
> the pages in the pool. However, the driver currently passes the number
> of pages rather than the order, so it ends up wasting quite a bit of
> memory.
> 
> Fix this by taking the binary logarithm and passing that in the order
> field.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Since this is a fix could we get a Fixes tag pointing to the commit
which introduced the regression?
