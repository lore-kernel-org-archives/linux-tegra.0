From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Introducing support for Page
 Pool
Date: Tue, 23 Jul 2019 12:58:55 +0100
Message-ID: <8093e352-d992-e17f-7168-5afbd9d3fb3f@nvidia.com>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <29dcc161-f7c8-026e-c3cc-5adb04df128c@nvidia.com>
 <BN8PR12MB32661E919A8DEBC7095BAA12D3C80@BN8PR12MB3266.namprd12.prod.outlook.com>
 <20190722101830.GA24948@apalos>
 <CADnJP=thexf2sWcVVOLWw14rpteEj0RrfDdY8ER90MpbNN4-oA@mail.gmail.com>
 <BN8PR12MB326661846D53AAEE315A7434D3C40@BN8PR12MB3266.namprd12.prod.outlook.com>
 <11557fe0-0cba-cb49-0fb6-ad24792d4a53@nvidia.com>
 <BN8PR12MB3266664ECA192E02C06061EED3C40@BN8PR12MB3266.namprd12.prod.outlook.com>
 <BYAPR12MB3269A725AFDDA21E92946558D3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
 <ab14f31f-2045-b1be-d31f-2a81b8527dac@nvidia.com>
 <BYAPR12MB32692AF2BA127C5DA5B74804D3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
 <2ad7bf21-1f1f-db0f-2358-4901b7988b7d@nvidia.com>
 <BYAPR12MB3269D050556BD51030DCDDFCD3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB3269D050556BD51030DCDDFCD3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jose Abreu <Jose.Abreu@synopsys.com>, Lars Persson <lists@bofh.nu>, Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Ripard <maxime.ripard@bootlin.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S . Miller" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org


On 23/07/2019 11:49, Jose Abreu wrote:
> From: Jon Hunter <jonathanh@nvidia.com>
> Date: Jul/23/2019, 11:38:33 (UTC+00:00)
> 
>>
>> On 23/07/2019 11:07, Jose Abreu wrote:
>>> From: Jon Hunter <jonathanh@nvidia.com>
>>> Date: Jul/23/2019, 11:01:24 (UTC+00:00)
>>>
>>>> This appears to be a winner and by disabling the SMMU for the ethernet
>>>> controller and reverting commit 954a03be033c7cef80ddc232e7cbdb17df735663
>>>> this worked! So yes appears to be related to the SMMU being enabled. We
>>>> had to enable the SMMU for ethernet recently due to commit
>>>> 954a03be033c7cef80ddc232e7cbdb17df735663.
>>>
>>> Finally :)
>>>
>>> However, from "git show 954a03be033c7cef80ddc232e7cbdb17df735663":
>>>
>>> +         There are few reasons to allow unmatched stream bypass, and
>>> +         even fewer good ones.  If saying YES here breaks your board
>>> +         you should work on fixing your board.
>>>
>>> So, how can we fix this ? Is your ethernet DT node marked as 
>>> "dma-coherent;" ?
>>
>> TBH I have no idea. I can't say I fully understand your change or how it
>> is breaking things for us.
>>
>> Currently, the Tegra DT binding does not have 'dma-coherent' set. I see
>> this is optional, but I am not sure how you determine whether or not
>> this should be set.
> 
> From my understanding it means that your device / IP DMA accesses are coherent regarding the CPU point of view. I think it will be the case if GMAC is not behind any kind of IOMMU in the HW arch.

I understand what coherency is, I just don't know how you tell if this
implementation of the ethernet controller is coherent or not.

Jon

-- 
nvpublic
