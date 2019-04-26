From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1] dmaengine: tegra: Use relaxed versions of readl/writel
Date: Fri, 26 Apr 2019 10:52:15 +0100
Message-ID: <d789f1bc-44d1-abf6-a046-7cf835416e8f@nvidia.com>
References: <20190424231708.21219-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190424231708.21219-1-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 25/04/2019 00:17, Dmitry Osipenko wrote:
> The readl/writel functions are inserting memory barrier in order to
> ensure that memory stores are completed. On Tegra20 and Tegra30 this
> results in L2 cache syncing which isn't a cheapest operation. The
> tegra20-apb-dma driver doesn't need to synchronize generic memory
> accesses, hence use the relaxed versions of the functions.

Do you mean device-io accesses here as this is not generic memory?

Although there may not be any issues with this change, I think I need a
bit more convincing that we should do this given that we have had it
this way for sometime and I would not like to see us introduce any
regressions as this point without being 100% certain we would not.
Ideally, if I had some good extensive tests I could run to hammer the
DMA for all configurations with different combinations of channels
running simultaneously then we could test this, but right now I don't :-(

Have you ...
1. Tested both cyclic and scatter-gather transfers?
2. Stress tested simultaneous transfers with various different
   configurations?
3. Quantified the actual performance benefit of this change so we can
   understand how much of a performance boost this offers?

Cheers
Jon
