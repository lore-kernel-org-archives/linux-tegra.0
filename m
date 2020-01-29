From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v5 08/14] dmaengine: tegra-apb: Fix coding style problems
Date: Wed, 29 Jan 2020 17:31:06 +0300
Message-ID: <5f540eb8-07ab-eb42-b5de-e198d5439cbd@gmail.com>
References: <20200123230325.3037-1-digetx@gmail.com>
 <20200123230325.3037-9-digetx@gmail.com>
 <f724fd45-aa91-face-a267-5ea4caf6d8d5@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f724fd45-aa91-face-a267-5ea4caf6d8d5@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

29.01.2020 14:03, Jon Hunter пишет:
> On 23/01/2020 23:03, Dmitry Osipenko wrote:
>>  	ahb_seq = TEGRA_APBDMA_AHBSEQ_INTR_ENB;
>> @@ -1269,7 +1284,6 @@ static int tegra_dma_alloc_chan_resources(struct dma_chan *dc)
>>  	int ret;
>>  
>>  	dma_cookie_init(&tdc->dma_chan);
>> -	tdc->config_init = false;
> 
> Please put this in a separate patch. It is easily overlooked in this big
> change.

Somehow I missed context of yours reply to the v4 of this patch and was
thinking that you were talking about the "unsigned int".. sorry :)

I'll factor out this change into a separate patch in v6.
