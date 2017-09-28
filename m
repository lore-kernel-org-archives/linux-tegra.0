From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 4/5] dmaengine: Add driver for NVIDIA Tegra AHB DMA
 controller
Date: Thu, 28 Sep 2017 17:35:59 +0300
Message-ID: <260fa409-0d07-ec9e-9e3b-fb08255026d8@gmail.com>
References: <cover.1506380746.git.digetx@gmail.com>
 <0a45e058baba72124b91c663ce1d908d275f4044.1506380746.git.digetx@gmail.com>
 <20170928092949.GB30097@localhost>
 <b601b829-d87f-99e0-dcf9-ad3f9a7195df@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b601b829-d87f-99e0-dcf9-ad3f9a7195df@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 28.09.2017 17:06, Dmitry Osipenko wrote:
> On 28.09.2017 12:29, Vinod Koul wrote:
>>> +	default:
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	ahb_seq  = burst << TEGRA_AHBDMA_CHANNEL_AHB_BURST_SHIFT;
>>> +	ahb_seq |= TEGRA_AHBDMA_CHANNEL_ADDR_WRAP;
>>> +	ahb_seq |= TEGRA_AHBDMA_CHANNEL_INTR_ENB;
>>> +
>>> +	writel_relaxed(ahb_seq,
>>> +		       ahbdma_chan->regs + TEGRA_AHBDMA_CHANNEL_AHB_SEQ);
>>> +
>>> +	writel_relaxed(ahb_addr,
>>> +		       ahbdma_chan->regs + TEGRA_AHBDMA_CHANNEL_AHB_PTR);
>>
>> oh no, you don't write to HW here. This can be called anytime when you have
>> txn running! You should save these and use them in prep_ calls.
>>
> 
> BTW, some of the DMA drivers have exactly the same problem. I now see that it is
> actually documented explicitly in provider.txt, but that's inconsistent across
> the actual drivers.
> 

Also, shouldn't prep_ and dma_slave_config be protected with locking? I don't
see DMA core doing any locking and seems none of the drivers too.

-- 
Dmitry
