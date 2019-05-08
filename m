From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] dmaengine: tegra-apb: Handle DMA_PREP_INTERRUPT flag
 properly
Date: Wed, 8 May 2019 15:37:14 +0300
Message-ID: <cbe8352c-c1c7-12a7-c658-82e7ffee0be8@gmail.com>
References: <20190505181235.14798-1-digetx@gmail.com>
 <287d7e67-1572-b4f2-d4bb-b1f02f534d47@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <287d7e67-1572-b4f2-d4bb-b1f02f534d47@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

08.05.2019 12:24, Jon Hunter пишет:
> 
> On 05/05/2019 19:12, Dmitry Osipenko wrote:
>> The DMA_PREP_INTERRUPT flag means that descriptor's callback should be
>> invoked upon transfer completion and that's it. For some reason driver
>> completely disables the hardware interrupt handling, leaving channel in
>> unusable state if transfer is issued with the flag being unset. Note
>> that there are no occurrences in the relevant drivers that do not set
>> the flag, hence this patch doesn't fix any actual bug and merely fixes
>> potential problem.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> 
> From having a look at this, I am guessing that we have never really
> tested the case where DMA_PREP_INTERRUPT flag is not set because as you
> mentioned it does not look like this will work at all!
> 
> Is there are use-case you are looking at where you don't set the
> DMA_PREP_INTERRUPT flag?

No. I just noticed it while was checking whether we really need to
handle the BUSY bit state for the Ben's "accurate reporting" patch.

> If not I am wondering if we should even bother supporting this and warn
> if it is not set. AFAICT it does not appear to be mandatory, but maybe
> Vinod can comment more on this.

The warning message will be also okay if it's not mandatory.
