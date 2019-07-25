From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Introducing support for Page
 Pool
Date: Thu, 25 Jul 2019 10:45:46 +0100
Message-ID: <d2658b7d-1f24-70f7-fafe-b60a0fd7d240@nvidia.com>
References: <BYAPR12MB32692AF2BA127C5DA5B74804D3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
 <6c769226-bdd9-6fe0-b96b-5a0d800fed24@arm.com>
 <8756d681-e167-fe4a-c6f0-47ae2dcbb100@nvidia.com>
 <20190723.115112.1824255524103179323.davem@davemloft.net>
 <20190724085427.GA10736@apalos>
 <BYAPR12MB3269AA9955844E317B62A239D3C60@BYAPR12MB3269.namprd12.prod.outlook.com>
 <20190724095310.GA12991@apalos>
 <BYAPR12MB3269C5766F553438ECFF2C9BD3C60@BYAPR12MB3269.namprd12.prod.outlook.com>
 <33de62bf-2f8a-bf00-9260-418b12bed24c@nvidia.com>
 <BYAPR12MB32696F0A2BFDF69F31C4311CD3C60@BYAPR12MB3269.namprd12.prod.outlook.com>
 <a07c3480-af03-a61b-4e9c-d9ceb29ce622@nvidia.com>
 <BYAPR12MB3269F4E62B64484B08F90998D3C10@BYAPR12MB3269.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB3269F4E62B64484B08F90998D3C10@BYAPR12MB3269.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jose Abreu <Jose.Abreu@synopsys.com>, Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: David Miller <davem@davemloft.net>, "robin.murphy@arm.com" <robin.murphy@arm.com>, "lists@bofh.nu" <lists@bofh.nu>, "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>, "alexandre.torgue@st.com" <alexandre.torgue@st.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "wens@csie.org" <wens@csie.org>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org


On 25/07/2019 08:44, Jose Abreu wrote:

...

> OK. Can you please test what Ilias mentioned ?
> 
> Basically you can hard-code the order to 0 in 
> alloc_dma_rx_desc_resources():
> - pp_params.order = DIV_ROUND_UP(priv->dma_buf_sz, PAGE_SIZE);
> + pp_params.order = 0;
> 
> Unless you use a MTU > PAGE_SIZE.

I made the change but unfortunately the issue persists.

Jon

-- 
nvpublic
