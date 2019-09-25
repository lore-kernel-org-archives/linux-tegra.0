From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v3 0/2] net: stmmac: Enhanced addressing mode for DWMAC
 4.10
Date: Wed, 25 Sep 2019 13:33:53 +0200 (CEST)
Message-ID: <20190925.133353.1445361137776125638.davem@davemloft.net>
References: <20190920170036.22610-1-thierry.reding@gmail.com>
        <20190924.214508.1949579574079200671.davem@davemloft.net>
        <BN8PR12MB3266F851B071629898BB775AD3870@BN8PR12MB3266.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <BN8PR12MB3266F851B071629898BB775AD3870@BN8PR12MB3266.namprd12.prod.outlook.com>
Sender: netdev-owner@vger.kernel.org
To: Jose.Abreu@synopsys.com
Cc: thierry.reding@gmail.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, f.fainelli@gmail.com, jonathanh@nvidia.com, bbiswas@nvidia.com, netdev@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Jose Abreu <Jose.Abreu@synopsys.com>
Date: Wed, 25 Sep 2019 10:44:53 +0000

> From: David Miller <davem@davemloft.net>
> Date: Sep/24/2019, 20:45:08 (UTC+00:00)
> 
>> From: Thierry Reding <thierry.reding@gmail.com>
>> Date: Fri, 20 Sep 2019 19:00:34 +0200
>> 
>> Also, you're now writing to the high 32-bits unconditionally, even when
>> it will always be zero because of 32-bit addressing.  That looks like
>> a step backwards to me.
> 
> Don't agree. As per previous discussions and as per my IP knowledge, if 
> EAME is not enabled / not supported the register can still be written. 
> This is not fast path and will not impact any remaining operation. Can 
> you please explain what exactly is the concern about this ?
> 
> Anyway, this is an important feature for performance so I hope Thierry 
> re-submits this once -next opens and addressing the review comments.

Perhaps I misunderstand the context, isn't this code writing the
descriptors for every packet?
