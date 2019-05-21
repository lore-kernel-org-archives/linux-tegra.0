From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] dmaengine: tegra-apb: Handle DMA_PREP_INTERRUPT flag
 properly
Date: Tue, 21 May 2019 16:46:24 +0300
Message-ID: <973513f9-0d87-4c39-6b29-f98a1d9dc00c@gmail.com>
References: <20190505181235.14798-1-digetx@gmail.com>
 <287d7e67-1572-b4f2-d4bb-b1f02f534d47@nvidia.com>
 <20190521045545.GP15118@vkoul-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190521045545.GP15118@vkoul-mobl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

21.05.2019 7:55, Vinod Koul пишет:
> On 08-05-19, 10:24, Jon Hunter wrote:
>>
>> On 05/05/2019 19:12, Dmitry Osipenko wrote:
>>> The DMA_PREP_INTERRUPT flag means that descriptor's callback should be
>>> invoked upon transfer completion and that's it. For some reason driver
>>> completely disables the hardware interrupt handling, leaving channel in
>>> unusable state if transfer is issued with the flag being unset. Note
>>> that there are no occurrences in the relevant drivers that do not set
>>> the flag, hence this patch doesn't fix any actual bug and merely fixes
>>> potential problem.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>
>> >From having a look at this, I am guessing that we have never really
>> tested the case where DMA_PREP_INTERRUPT flag is not set because as you
>> mentioned it does not look like this will work at all!
> 
> That is a fair argument
>>
>> Is there are use-case you are looking at where you don't set the
>> DMA_PREP_INTERRUPT flag?
>>
>> If not I am wondering if we should even bother supporting this and warn
>> if it is not set. AFAICT it does not appear to be mandatory, but maybe
>> Vinod can comment more on this.
> 
> This is supposed to be used in the cases where you submit a bunch of
> descriptors and selectively dont want an interrupt in few cases...
> 
> Is this such a case?

The flag is set by device drivers. AFAIK, none of the drivers that are
used on Tegra SoC's make a use of that flag, at least not in upstream.
