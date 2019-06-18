From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] dmaengine: tegra-apb: Support per-burst residue
 granularity
Date: Wed, 19 Jun 2019 02:27:22 +0300
Message-ID: <7354d471-95e1-ffcd-db65-578e9aa425ac@gmail.com>
References: <20190613210849.10382-1-digetx@gmail.com>
 <f2290604-12f4-019b-47e7-4e4e29a433d4@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f2290604-12f4-019b-47e7-4e4e29a433d4@codethink.co.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>, Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

19.06.2019 1:22, Ben Dooks пишет:
> On 13/06/2019 22:08, Dmitry Osipenko wrote:
>> Tegra's APB DMA engine updates words counter after each transferred burst
>> of data, hence it can report transfer's residual with more fidelity which
>> may be required in cases like audio playback. In particular this fixes
>> audio stuttering during playback in a chromiuim web browser. The patch is
>> based on the original work that was made by Ben Dooks [1]. It was tested
>> on Tegra20 and Tegra30 devices.
>>
>> [1] https://lore.kernel.org/lkml/20190424162348.23692-1-ben.dooks@codethink.co.uk/
>>
>> Inspired-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>   drivers/dma/tegra20-apb-dma.c | 35 ++++++++++++++++++++++++++++-------
>>   1 file changed, 28 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
>> index 79e9593815f1..c5af8f703548 100644
>> --- a/drivers/dma/tegra20-apb-dma.c
>> +++ b/drivers/dma/tegra20-apb-dma.c
>> @@ -797,12 +797,36 @@ static int tegra_dma_terminate_all(struct dma_chan *dc)
>>       return 0;
>>   }
>>   +static unsigned int tegra_dma_update_residual(struct tegra_dma_channel *tdc,
>> +                          struct tegra_dma_sg_req *sg_req,
>> +                          struct tegra_dma_desc *dma_desc,
>> +                          unsigned int residual)
>> +{
>> +    unsigned long status, wcount = 0;
>> +
>> +    if (!list_is_first(&sg_req->node, &tdc->pending_sg_req))
>> +        return residual;
>> +
>> +    if (tdc->tdma->chip_data->support_separate_wcount_reg)
>> +        wcount = tdc_read(tdc, TEGRA_APBDMA_CHAN_WORD_TRANSFER);
>> +
>> +    status = tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS);
>> +
>> +    if (!tdc->tdma->chip_data->support_separate_wcount_reg)
>> +        wcount = status;
>> +
>> +    if (status & TEGRA_APBDMA_STATUS_ISE_EOC)
>> +        return residual - sg_req->req_len;
>> +
>> +    return residual - get_current_xferred_count(tdc, sg_req, wcount);
>> +}
> 
> I am unfortunately nowhere near my notes, so can't completely
> review this. I think the complexity of my patch series is due
> to an issue with the count being updated before the EOC IRQ
> is actually flagged (and most definetly before it gets to the
> CPU IRQ handler).
> 
> The test system I was using, which i've not really got any
> access to at the moment would show these internal inconsistent
> states every few hours, however it was moving 48kHz 8ch 16bit
> TDM data.
> 
> Thanks for looking into this, I am not sure if I am going to
> get any time to look into this within the next couple of
> months.

I'll try to add some debug checks to try to catch the case where count is updated before EOC
is set. Thank you very much for the clarification of the problem. So far I haven't spotted
anything going wrong.

Jon / Laxman, are you aware about the possibility to get such inconsistency of words count
vs EOC? Assuming the cyclic transfer mode.
