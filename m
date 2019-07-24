From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Introducing support for Page
 Pool
Date: Wed, 24 Jul 2019 11:54:27 +0300
Message-ID: <20190724085427.GA10736@apalos>
References: <BYAPR12MB32692AF2BA127C5DA5B74804D3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
 <6c769226-bdd9-6fe0-b96b-5a0d800fed24@arm.com>
 <8756d681-e167-fe4a-c6f0-47ae2dcbb100@nvidia.com>
 <20190723.115112.1824255524103179323.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190723.115112.1824255524103179323.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: jonathanh@nvidia.com, robin.murphy@arm.com, Jose.Abreu@synopsys.com, lists@bofh.nu, Joao.Pinto@synopsys.com, alexandre.torgue@st.com, maxime.ripard@bootlin.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, wens@csie.org, mcoquelin.stm32@gmail.com, linux-tegra@vger.kernel.org, peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Hi David, 

> From: Jon Hunter <jonathanh@nvidia.com>
> Date: Tue, 23 Jul 2019 13:09:00 +0100
> 
> > Setting "iommu.passthrough=1" works for me. However, I am not sure where
> > to go from here, so any ideas you have would be great.
> 
> Then definitely we are accessing outside of a valid IOMMU mapping due
> to the page pool support changes.

Yes. On the netsec driver i did test with and without SMMU to make sure i am not
breaking anything.
Since we map the whole page on the API i think some offset on the driver causes
that. In any case i'll have another look on page_pool to make sure we are not
missing anything. 

> 
> Such a problem should be spotted with swiommu enabled with debugging.

Thanks
/Ilias
