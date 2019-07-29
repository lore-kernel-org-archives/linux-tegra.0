From: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Introducing support for Page
 Pool
Date: Mon, 29 Jul 2019 12:45:25 +0300
Message-ID: <299d1803-fc5c-9298-3d10-582e76b47a9e@kapsi.fi>
References: <cover.1562149883.git.joabreu@synopsys.com>
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
 <8093e352-d992-e17f-7168-5afbd9d3fb3f@nvidia.com>
 <BYAPR12MB3269EC45ABAF8F279288B003D3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
 <f3525260-c43f-c983-0b5b-34a83bd53283@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <f3525260-c43f-c983-0b5b-34a83bd53283@nvidia.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Hunter <jonathanh@nvidia.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Lars Persson <lists@bofh.nu>, Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Ripard <maxime.ripard@bootlin.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

My understanding is that Tegra186 does not have DMA coherency, but 
Tegra194 does.

Mikko

On 23.7.2019 16.34, Jon Hunter wrote:
> 
> On 23/07/2019 13:51, Jose Abreu wrote:
>> From: Jon Hunter <jonathanh@nvidia.com>
>> Date: Jul/23/2019, 12:58:55 (UTC+00:00)
>>
>>>
>>> On 23/07/2019 11:49, Jose Abreu wrote:
>>>> From: Jon Hunter <jonathanh@nvidia.com>
>>>> Date: Jul/23/2019, 11:38:33 (UTC+00:00)
>>>>
>>>>>
>>>>> On 23/07/2019 11:07, Jose Abreu wrote:
>>>>>> From: Jon Hunter <jonathanh@nvidia.com>
>>>>>> Date: Jul/23/2019, 11:01:24 (UTC+00:00)
>>>>>>
>>>>>>> This appears to be a winner and by disabling the SMMU for the ethernet
>>>>>>> controller and reverting commit 954a03be033c7cef80ddc232e7cbdb17df735663
>>>>>>> this worked! So yes appears to be related to the SMMU being enabled. We
>>>>>>> had to enable the SMMU for ethernet recently due to commit
>>>>>>> 954a03be033c7cef80ddc232e7cbdb17df735663.
>>>>>>
>>>>>> Finally :)
>>>>>>
>>>>>> However, from "git show 954a03be033c7cef80ddc232e7cbdb17df735663":
>>>>>>
>>>>>> +         There are few reasons to allow unmatched stream bypass, and
>>>>>> +         even fewer good ones.  If saying YES here breaks your board
>>>>>> +         you should work on fixing your board.
>>>>>>
>>>>>> So, how can we fix this ? Is your ethernet DT node marked as
>>>>>> "dma-coherent;" ?
>>>>>
>>>>> TBH I have no idea. I can't say I fully understand your change or how it
>>>>> is breaking things for us.
>>>>>
>>>>> Currently, the Tegra DT binding does not have 'dma-coherent' set. I see
>>>>> this is optional, but I am not sure how you determine whether or not
>>>>> this should be set.
>>>>
>>>>  From my understanding it means that your device / IP DMA accesses are coherent regarding the CPU point of view. I think it will be the case if GMAC is not behind any kind of IOMMU in the HW arch.
>>>
>>> I understand what coherency is, I just don't know how you tell if this
>>> implementation of the ethernet controller is coherent or not.
>>
>> Do you have any detailed diagram of your HW ? Such as blocks / IPs
>> connection, address space wiring , ...
> 
> Yes, this can be found in the Tegra X2 Technical Reference Manual [0].
> Unfortunately, you need to create an account to download it.
> 
> Jon
> 
> [0] https://developer.nvidia.com/embedded/dlc/parker-series-trm
> 
