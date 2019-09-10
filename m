From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: Support enhanced addressing
 mode for DWMAC 4.10
Date: Tue, 10 Sep 2019 12:01:01 -0700
Message-ID: <c8d419d3-6cf6-e260-a2e2-6a339c6c321b@gmail.com>
References: <20190909152546.383-1-thierry.reding@gmail.com>
 <20190909152546.383-2-thierry.reding@gmail.com>
 <BN8PR12MB3266AAC6FF4819EC25CB087BD3B70@BN8PR12MB3266.namprd12.prod.outlook.com>
 <20190909191329.GB23804@mithrandir>
 <BN8PR12MB3266F021DFC2C61CDEC83418D3B60@BN8PR12MB3266.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <BN8PR12MB3266F021DFC2C61CDEC83418D3B60@BN8PR12MB3266.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Jose Abreu <Jose.Abreu@synopsys.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jon Hunter <jonathanh@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 9/10/19 1:35 AM, Jose Abreu wrote:
> From: Thierry Reding <thierry.reding@gmail.com>
> Date: Sep/09/2019, 20:13:29 (UTC+00:00)
> 
>> On Mon, Sep 09, 2019 at 04:05:52PM +0000, Jose Abreu wrote:
>>> From: Thierry Reding <thierry.reding@gmail.com>
>>> Date: Sep/09/2019, 16:25:46 (UTC+00:00)
>>>
>>>> @@ -79,6 +79,10 @@ static void dwmac4_dma_init_rx_chan(void __iomem *ioaddr,
>>>>  	value = value | (rxpbl << DMA_BUS_MODE_RPBL_SHIFT);
>>>>  	writel(value, ioaddr + DMA_CHAN_RX_CONTROL(chan));
>>>>  
>>>> +	if (dma_cfg->eame)
>>>
>>> There is no need for this check. If EAME is not enabled then upper 32 
>>> bits will be zero.
>>
>> The idea here was to potentially guard against this register not being
>> available on some revisions. Having the check here would avoid access to
>> the register if the device doesn't support enhanced addressing.
> 
> I see your point but I don't think there will be any problems unless you 
> have some strange system that doesn't handle the write accesses to 
> unimplemented features properly ...

Is not it then just safer to not do the write to a register that you do
not know how the implementation is going to respond to with one of a
target abort, timeout, decoding error, just dead lock?

Also, would it make sense to consider adding an #ifdef
CONFIG_PHYS_ADDR_T_64BIT plus the conditional check so that you can be
slightly more optimal in the hot-path here?
-- 
Florian
