From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] dmaengine: tegra: Use relaxed versions of readl/writel
Date: Fri, 26 Apr 2019 15:19:22 +0300
Message-ID: <68c342e2-5662-5632-82aa-659da0381f54@gmail.com>
References: <20190424231708.21219-1-digetx@gmail.com>
 <20190426120148.GB28103@vkoul-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190426120148.GB28103@vkoul-mobl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

26.04.2019 15:01, Vinod Koul пишет:
> On 25-04-19, 02:17, Dmitry Osipenko wrote:
>> The readl/writel functions are inserting memory barrier in order to
>> ensure that memory stores are completed. On Tegra20 and Tegra30 this
>> results in L2 cache syncing which isn't a cheapest operation. The
>> tegra20-apb-dma driver doesn't need to synchronize generic memory
>> accesses, hence use the relaxed versions of the functions.
> 
> Subsystem name is **dmaengine** not dma! Please fix that
> 

Looks like you answered to a wrong email.
