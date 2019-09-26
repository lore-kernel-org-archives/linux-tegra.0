From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next] net: stmmac: Fix page pool size
Date: Thu, 26 Sep 2019 09:28:49 +0200 (CEST)
Message-ID: <20190926.092849.214919483212512707.davem@davemloft.net>
References: <20190923095915.11588-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190923095915.11588-1-thierry.reding@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: thierry.reding@gmail.com
Cc: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, f.fainelli@gmail.com, jakub.kicinski@netronome.com, jonathanh@nvidia.com, bbiswas@nvidia.com, netdev@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <thierry.reding@gmail.com>
Date: Mon, 23 Sep 2019 11:59:15 +0200

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
> Fixes: 2af6106ae949 ("net: stmmac: Introducing support for Page Pool")
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Not only should this have been marked v2, it should have targetted 'net'
instead of 'net-next'.

In any event, I've applied it, thanks.
