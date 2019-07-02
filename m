From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v3] dmaengine: tegra-apb: Support per-burst residue
 granularity
Date: Tue, 2 Jul 2019 14:41:33 +0100
Message-ID: <e7199039-c4e5-304d-3d60-58ecd6648771@nvidia.com>
References: <20190627194728.8948-1-digetx@gmail.com>
 <dab25158-272c-a18f-a858-433f7f9000e0@nvidia.com>
 <3a5403fe-b81f-993c-e7c0-407387e001d9@gmail.com>
 <b50045f9-7d8f-d91a-8629-625bcd7057bc@nvidia.com>
 <ed84cc7d-08de-dbd7-40e2-bc84c5debe1a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ed84cc7d-08de-dbd7-40e2-bc84c5debe1a@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 02/07/2019 14:22, Dmitry Osipenko wrote:
> 02.07.2019 15:54, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>> On 02/07/2019 12:37, Dmitry Osipenko wrote:
>>> 02.07.2019 14:20, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>
>>>> On 27/06/2019 20:47, Dmitry Osipenko wrote:
>>>>> Tegra's APB DMA engine updates words counter after each transferred b=
urst
>>>>> of data, hence it can report transfer's residual with more fidelity w=
hich
>>>>> may be required in cases like audio playback. In particular this fixe=
s
>>>>> audio stuttering during playback in a chromium web browser. The patch=
 is
>>>>> based on the original work that was made by Ben Dooks and a patch fro=
m
>>>>> downstream kernel. It was tested on Tegra20 and Tegra30 devices.
>>>>>
>>>>> Link: https://lore.kernel.org/lkml/20190424162348.23692-1-ben.dooks@c=
odethink.co.uk/
>>>>> Link: https://nv-tegra.nvidia.com/gitweb/?p=3Dlinux-4.4.git;a=3Dcommi=
t;h=3Dc7bba40c6846fbf3eaad35c4472dcc7d8bbc02e5
>>>>> Inspired-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>>> ---
>>>>>
>>>>> Changelog:
>>>>>
>>>>> v3:  Added workaround for a hardware design shortcoming that results
>>>>>      in a words counter wraparound before end-of-transfer bit is set
>>>>>      in a cyclic mode.
>>>>>
>>>>> v2:  Addressed review comments made by Jon Hunter to v1. We won't try
>>>>>      to get words count if dma_desc is on free list as it will result
>>>>>      in a NULL dereference because this case wasn't handled properly.
>>>>>
>>>>>      The residual value is now updated properly, avoiding potential
>>>>>      integer overflow by adding the "bytes" to the "bytes_transferred=
"
>>>>>      instead of the subtraction.
>>>>>
>>>>>  drivers/dma/tegra20-apb-dma.c | 69 +++++++++++++++++++++++++++++++--=
--
>>>>>  1 file changed, 62 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-=
dma.c
>>>>> index 79e9593815f1..71473eda28ee 100644
>>>>> --- a/drivers/dma/tegra20-apb-dma.c
>>>>> +++ b/drivers/dma/tegra20-apb-dma.c
>>>>> @@ -152,6 +152,7 @@ struct tegra_dma_sg_req {
>>>>>  	bool				last_sg;
>>>>>  	struct list_head		node;
>>>>>  	struct tegra_dma_desc		*dma_desc;
>>>>> +	unsigned int			words_xferred;
>>>>>  };
>>>>> =20
>>>>>  /*
>>>>> @@ -496,6 +497,7 @@ static void tegra_dma_configure_for_next(struct t=
egra_dma_channel *tdc,
>>>>>  	tdc_write(tdc, TEGRA_APBDMA_CHAN_CSR,
>>>>>  				nsg_req->ch_regs.csr | TEGRA_APBDMA_CSR_ENB);
>>>>>  	nsg_req->configured =3D true;
>>>>> +	nsg_req->words_xferred =3D 0;
>>>>> =20
>>>>>  	tegra_dma_resume(tdc);
>>>>>  }
>>>>> @@ -511,6 +513,7 @@ static void tdc_start_head_req(struct tegra_dma_c=
hannel *tdc)
>>>>>  					typeof(*sg_req), node);
>>>>>  	tegra_dma_start(tdc, sg_req);
>>>>>  	sg_req->configured =3D true;
>>>>> +	sg_req->words_xferred =3D 0;
>>>>>  	tdc->busy =3D true;
>>>>>  }
>>>>> =20
>>>>> @@ -797,6 +800,61 @@ static int tegra_dma_terminate_all(struct dma_ch=
an *dc)
>>>>>  	return 0;
>>>>>  }
>>>>> =20
>>>>> +static unsigned int tegra_dma_sg_bytes_xferred(struct tegra_dma_chan=
nel *tdc,
>>>>> +					       struct tegra_dma_sg_req *sg_req)
>>>>> +{
>>>>> +	unsigned long status, wcount =3D 0;
>>>>> +
>>>>> +	if (!list_is_first(&sg_req->node, &tdc->pending_sg_req))
>>>>> +		return 0;
>>>>> +
>>>>> +	if (tdc->tdma->chip_data->support_separate_wcount_reg)
>>>>> +		wcount =3D tdc_read(tdc, TEGRA_APBDMA_CHAN_WORD_TRANSFER);
>>>>> +
>>>>> +	status =3D tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS);
>>>>> +
>>>>> +	if (!tdc->tdma->chip_data->support_separate_wcount_reg)
>>>>> +		wcount =3D status;
>>>>> +
>>>>> +	if (status & TEGRA_APBDMA_STATUS_ISE_EOC)
>>>>> +		return sg_req->req_len;
>>>>> +
>>>>> +	wcount =3D get_current_xferred_count(tdc, sg_req, wcount);
>>>>> +
>>>>> +	if (!wcount) {
>>>>> +		/*
>>>>> +		 * If wcount wasn't ever polled for this SG before, then
>>>>> +		 * simply assume that transfer hasn't started yet.
>>>>> +		 *
>>>>> +		 * Otherwise it's the end of the transfer.
>>>>> +		 *
>>>>> +		 * The alternative would be to poll the status register
>>>>> +		 * until EOC bit is set or wcount goes UP. That's so
>>>>> +		 * because EOC bit is getting set only after the last
>>>>> +		 * burst's completion and counter is less than the actual
>>>>> +		 * transfer size by 4 bytes. The counter value wraps around
>>>>> +		 * in a cyclic mode before EOC is set(!), so we can't easily
>>>>> +		 * distinguish start of transfer from its end.
>>>>> +		 */
>>>>> +		if (sg_req->words_xferred)
>>>>> +			wcount =3D sg_req->req_len - 4;
>>>>> +
>>>>> +	} else if (wcount < sg_req->words_xferred) {
>>>>> +		/*
>>>>> +		 * This case shall not ever happen because EOC bit
>>>>> +		 * must be set once next cyclic transfer is started.
>>>>
>>>> I am not sure I follow this and why this condition cannot happen for
>>>> cyclic transfers. What about non-cyclic transfers?
>>>
>>> It cannot happen because the EOC bit will be set in that case. The coun=
ter wraps
>>> around when the transfer of a last burst happens, EOC bit is guaranteed=
 to be set
>>> after completion of the last burst. That's my observation after a thoro=
ugh testing,
>>> it will be very odd if EOC setting happened completely asynchronously.
>>
>> I see how you know that the EOC is set. Anyway, you check if the EOC is
>> set before and if so return sg_req->req_len prior to this test.
>>
>> Maybe I am missing something, but what happens if we are mid block when
>> dmaengine_tx_status() is called? That happen asynchronously right?
>=20
>=20
> Do you mean asynchronously in regards to the ISR? Or something else?

In the sense that the client can call dmaengine_tx_status() at anytime
to check the status of a transfer.

Cheers
Jon

--=20
nvpublic
