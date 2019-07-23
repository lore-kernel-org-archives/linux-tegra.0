From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Introducing support for Page
 Pool
Date: Tue, 23 Jul 2019 11:51:12 -0700 (PDT)
Message-ID: <20190723.115112.1824255524103179323.davem@davemloft.net>
References: <BYAPR12MB32692AF2BA127C5DA5B74804D3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
        <6c769226-bdd9-6fe0-b96b-5a0d800fed24@arm.com>
        <8756d681-e167-fe4a-c6f0-47ae2dcbb100@nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8756d681-e167-fe4a-c6f0-47ae2dcbb100@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jonathanh@nvidia.com
Cc: robin.murphy@arm.com, Jose.Abreu@synopsys.com, lists@bofh.nu, ilias.apalodimas@linaro.org, Joao.Pinto@synopsys.com, alexandre.torgue@st.com, maxime.ripard@bootlin.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, wens@csie.org, mcoquelin.stm32@gmail.com, linux-tegra@vger.kernel.org, peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

From: Jon Hunter <jonathanh@nvidia.com>
Date: Tue, 23 Jul 2019 13:09:00 +0100

> Setting "iommu.passthrough=1" works for me. However, I am not sure where
> to go from here, so any ideas you have would be great.

Then definitely we are accessing outside of a valid IOMMU mapping due
to the page pool support changes.

Such a problem should be spotted with swiommu enabled with debugging.
