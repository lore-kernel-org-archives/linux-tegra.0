From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH] dmaengine: tegra210-adma: Use struct_size() in
 devm_kzalloc()
Date: Sun, 20 Jan 2019 10:48:36 +0530
Message-ID: <20190120051836.GJ4635@vkoul-mobl>
References: <20190107170631.GA32119@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190107170631.GA32119@embeddedor>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 07-01-19, 11:06, Gustavo A. R. Silva wrote:
> One of the more common cases of allocation size calculations is finding
> the size of a structure that has a zero-sized array at the end, along
> with memory for some number of elements for that array. For example:
> 
> struct foo {
>     int stuff;
>     void *entry[];
> };
> 
> instance = devm_kzalloc(dev, sizeof(struct foo) + sizeof(void *) * count, GFP_KERNEL);
> 
> Instead of leaving these open-coded and prone to type mistakes, we can
> now use the new struct_size() helper:
> 
> instance = devm_kzalloc(dev, struct_size(instance, entry, count), GFP_KERNEL);
> 
> This code was detected with the help of Coccinelle.

Applied, thanks

-- 
~Vinod
