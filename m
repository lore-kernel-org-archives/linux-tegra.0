From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1] dmaengine: tegra-apb: Support per-burst residue
 granularity
Date: Wed, 19 Jun 2019 11:13:50 +0100
Message-ID: <e443c114-167f-6e93-c3dc-0bd09fda3f6c@nvidia.com>
References: <20190613210849.10382-1-digetx@gmail.com>
 <f2290604-12f4-019b-47e7-4e4e29a433d4@codethink.co.uk>
 <7354d471-95e1-ffcd-db65-578e9aa425ac@gmail.com>
 <1db9bac2-957d-3c0a-948a-429bc59f1b72@nvidia.com>
 <0f797be6-9b80-7c31-44ef-0df68d36252e@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0f797be6-9b80-7c31-44ef-0df68d36252e@codethink.co.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>, Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 19/06/2019 11:08, Ben Dooks wrote:
> On 19/06/2019 11:04, Jon Hunter wrote:
>>
>> On 19/06/2019 00:27, Dmitry Osipenko wrote:
>>> 19.06.2019 1:22, Ben Dooks =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> On 13/06/2019 22:08, Dmitry Osipenko wrote:
>>>>> Tegra's APB DMA engine updates words counter after each transferred
>>>>> burst
>>>>> of data, hence it can report transfer's residual with more fidelity
>>>>> which
>>>>> may be required in cases like audio playback. In particular this fixe=
s
>>>>> audio stuttering during playback in a chromiuim web browser. The
>>>>> patch is
>>>>> based on the original work that was made by Ben Dooks [1]. It was
>>>>> tested
>>>>> on Tegra20 and Tegra30 devices.
>>>>>
>>>>> [1]
>>>>> https://lore.kernel.org/lkml/20190424162348.23692-1-ben.dooks@codethi=
nk.co.uk/
>>>>>
>>>>>
>>>>> Inspired-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>>> ---
>>>>> =C2=A0=C2=A0 drivers/dma/tegra20-apb-dma.c | 35
>>>>> ++++++++++++++++++++++++++++-------
>>>>> =C2=A0=C2=A0 1 file changed, 28 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/drivers/dma/tegra20-apb-dma.c
>>>>> b/drivers/dma/tegra20-apb-dma.c
>>>>> index 79e9593815f1..c5af8f703548 100644
>>>>> --- a/drivers/dma/tegra20-apb-dma.c
>>>>> +++ b/drivers/dma/tegra20-apb-dma.c
>>>>> @@ -797,12 +797,36 @@ static int tegra_dma_terminate_all(struct
>>>>> dma_chan *dc)
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>> =C2=A0=C2=A0 }
>>>>> =C2=A0=C2=A0 +static unsigned int tegra_dma_update_residual(struct
>>>>> tegra_dma_channel *tdc,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 struct tegra_dma_sg_req *sg_req,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 struct tegra_dma_desc *dma_desc,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned int residual)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 unsigned long status, wcount =3D 0;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 if (!list_is_first(&sg_req->node, &tdc->pending_s=
g_req))
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return residual;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 if (tdc->tdma->chip_data->support_separate_wcount=
_reg)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wcount =3D tdc_read(tdc, =
TEGRA_APBDMA_CHAN_WORD_TRANSFER);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 status =3D tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS=
);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 if (!tdc->tdma->chip_data->support_separate_wcoun=
t_reg)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wcount =3D status;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 if (status & TEGRA_APBDMA_STATUS_ISE_EOC)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return residual - sg_req-=
>req_len;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 return residual - get_current_xferred_count(tdc, =
sg_req, wcount);
>>>>> +}
>>>>
>>>> I am unfortunately nowhere near my notes, so can't completely
>>>> review this. I think the complexity of my patch series is due
>>>> to an issue with the count being updated before the EOC IRQ
>>>> is actually flagged (and most definetly before it gets to the
>>>> CPU IRQ handler).
>>>>
>>>> The test system I was using, which i've not really got any
>>>> access to at the moment would show these internal inconsistent
>>>> states every few hours, however it was moving 48kHz 8ch 16bit
>>>> TDM data.
>>>>
>>>> Thanks for looking into this, I am not sure if I am going to
>>>> get any time to look into this within the next couple of
>>>> months.
>>>
>>> I'll try to add some debug checks to try to catch the case where
>>> count is updated before EOC
>>> is set. Thank you very much for the clarification of the problem. So
>>> far I haven't spotted
>>> anything going wrong.
>>>
>>> Jon / Laxman, are you aware about the possibility to get such
>>> inconsistency of words count
>>> vs EOC? Assuming the cyclic transfer mode.
>>
>> I can't say that I am. However, for the case of cyclic transfer, given
>> that the next transfer is always programmed into the registers before
>> the last one completes, I could see that by the time the interrupt is
>> serviced that the DMA has moved on to the next transfer (which I assume
>> would reset the count).
>>
>> Interestingly, our downstream kernel implemented a change to avoid the
>> count appearing to move backwards. I am curious if this also works,
>> which would be a lot simpler that what Ben has implemented and may
>> mitigate that race condition that Ben is describing.
>=20
> That might be the same thing we saw. IIRC it looks like the DMA has
> moved on, but the count gets re-set before the EOC? I can't see that
> git site so can't comment.

That's odd, that should be a public site AFAIK. Does the following not
work ...

https://nv-tegra.nvidia.com/gitweb/

Jon

--=20
nvpublic
