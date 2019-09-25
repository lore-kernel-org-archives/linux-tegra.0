From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v3 0/2] net: stmmac: Enhanced addressing mode for DWMAC
 4.10
Date: Wed, 25 Sep 2019 10:31:13 -0700
Message-ID: <9f0e2386-c4b1-52b0-6881-e72093eb1b05@gmail.com>
References: <20190920170036.22610-1-thierry.reding@gmail.com>
 <20190924.214508.1949579574079200671.davem@davemloft.net>
 <BN8PR12MB3266F851B071629898BB775AD3870@BN8PR12MB3266.namprd12.prod.outlook.com>
 <20190925.133353.1445361137776125638.davem@davemloft.net>
 <BN8PR12MB3266A2F1F5F3F18F3A80BFC1D3870@BN8PR12MB3266.namprd12.prod.outlook.com>
 <BN8PR12MB32667F9FDDB2161E9B63C1AFD3870@BN8PR12MB3266.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <BN8PR12MB32667F9FDDB2161E9B63C1AFD3870@BN8PR12MB3266.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Jose Abreu <Jose.Abreu@synopsys.com>, David Miller <davem@davemloft.net>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>, "alexandre.torgue@st.com" <alexandre.torgue@st.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "bbiswas@nvidia.com" <bbiswas@nvidia.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 9/25/19 4:46 AM, Jose Abreu wrote:
> From: Jose Abreu <joabreu@synopsys.com>
> Date: Sep/25/2019, 12:41:04 (UTC+00:00)
> 
>> From: David Miller <davem@davemloft.net>
>> Date: Sep/25/2019, 12:33:53 (UTC+00:00)
>>
>>> From: Jose Abreu <Jose.Abreu@synopsys.com>
>>> Date: Wed, 25 Sep 2019 10:44:53 +0000
>>>
>>>> From: David Miller <davem@davemloft.net>
>>>> Date: Sep/24/2019, 20:45:08 (UTC+00:00)
>>>>
>>>>> From: Thierry Reding <thierry.reding@gmail.com>
>>>>> Date: Fri, 20 Sep 2019 19:00:34 +0200
>>>>>
>>>>> Also, you're now writing to the high 32-bits unconditionally, even when
>>>>> it will always be zero because of 32-bit addressing.  That looks like
>>>>> a step backwards to me.
>>>>
>>>> Don't agree. As per previous discussions and as per my IP knowledge, if 
>>>> EAME is not enabled / not supported the register can still be written. 
>>>> This is not fast path and will not impact any remaining operation. Can 
>>>> you please explain what exactly is the concern about this ?
>>>>
>>>> Anyway, this is an important feature for performance so I hope Thierry 
>>>> re-submits this once -next opens and addressing the review comments.
>>>
>>> Perhaps I misunderstand the context, isn't this code writing the
>>> descriptors for every packet?
>>
>> No, its just setting up the base address for the descriptors which is 
>> done in open(). The one that's in the fast path is the tail address, 
>> which is always the lower 32 bits.
> 
> Oops, sorry. Indeed it's done in refill operation in function 
> dwmac4_set_addr() for rx/tx which is fast path so you do have a point 
> that I was not seeing. Thanks for bringing this up!
> 
> Now, the point would be:
> 	a) Is it faster to have an condition check in dwmac4_set_addr(), or
> 	b) Always write to descs the upper 32 bits. Which always exists in the 
> IP and is a standard write to memory.

The way I would approach it (as done in bcmgenet.c) is that if the
platform both has CONFIG_PHYS_ADDR_T_64BIT=y and supports > 32-bits
addresses, then you write the upper 32-bits otherwise, you do not. Given
you indicate that the registers are safe to write regardless, then maybe
just the check on CONFIG_PHYS_ADDR_T_64BIT is enough for your case. The
rationale in my case is that register writes to on-chip descriptors are
fairly expensive (~200ns per operation) and get in the hot-path.

The CONFIG_PHYS_ADDR_T_64BIT check addresses both native 64-bit
platforms (e.g.: ARM64) and those that do support LPAE (ARM LPAE for
instance).
-- 
Florian
