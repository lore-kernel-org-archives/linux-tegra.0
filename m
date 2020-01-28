From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 08/14] dmaengine: tegra-apb: Fix coding style problems
Date: Tue, 28 Jan 2020 14:05:17 +0000
Message-ID: <bab1eec0-8b1d-6005-e9eb-05e93da844aa@nvidia.com>
References: <20200112173006.29863-1-digetx@gmail.com>
 <20200112173006.29863-9-digetx@gmail.com>
 <844c4ace-d043-a908-823d-545b5b753008@nvidia.com>
 <134adcfb-83fb-4bb7-986e-65217bc4f821@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <134adcfb-83fb-4bb7-986e-65217bc4f821-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 16/01/2020 17:37, Dmitry Osipenko wrote:
> 15.01.2020 12:49, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>>
>> On 12/01/2020 17:30, Dmitry Osipenko wrote:
>>> This patch fixes few dozens of coding style problems reported by
>>> checkpatch and prettifies code where makes sense.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>  drivers/dma/tegra20-apb-dma.c | 276 ++++++++++++++++++----------------
>>>  1 file changed, 144 insertions(+), 132 deletions(-)
>>>
>>> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dm=
a.c
>>> index dff21e80ffa4..7158bd3145c4 100644
>>> --- a/drivers/dma/tegra20-apb-dma.c
>>> +++ b/drivers/dma/tegra20-apb-dma.c
>>
>> ...
>>
>>> @@ -1003,20 +1014,23 @@ static void tegra_dma_prep_wcount(struct tegra_=
dma_channel *tdc,
>>>  		ch_regs->csr |=3D len_field;
>>>  }
>>> =20
>>> -static struct dma_async_tx_descriptor *tegra_dma_prep_slave_sg(
>>> -	struct dma_chan *dc, struct scatterlist *sgl, unsigned int sg_len,
>>> -	enum dma_transfer_direction direction, unsigned long flags,
>>> -	void *context)
>>> +static struct dma_async_tx_descriptor *
>>> +tegra_dma_prep_slave_sg(struct dma_chan *dc,
>>> +			struct scatterlist *sgl,
>>> +			unsigned int sg_len,
>>> +			enum dma_transfer_direction direction,
>>> +			unsigned long flags,
>>> +			void *context)
>>>  {
>>>  	struct tegra_dma_channel *tdc =3D to_tegra_dma_chan(dc);
>>> +	struct tegra_dma_sg_req *sg_req =3D NULL;
>>> +	u32 csr, ahb_seq, apb_ptr, apb_seq;
>>> +	enum dma_slave_buswidth slave_bw;
>>>  	struct tegra_dma_desc *dma_desc;
>>> -	unsigned int i;
>>> -	struct scatterlist *sg;
>>> -	unsigned long csr, ahb_seq, apb_ptr, apb_seq;
>>>  	struct list_head req_list;
>>> -	struct tegra_dma_sg_req  *sg_req =3D NULL;
>>> -	u32 burst_size;
>>> -	enum dma_slave_buswidth slave_bw;
>>> +	struct scatterlist *sg;
>>> +	unsigned int burst_size;
>>> +	unsigned int i;
>>
>> This is not really consistent with the rest of the changes by having 'i'
>> and 'burst_size' on separate lines.
>=20
> The goal wasn't to squash everything into a single line, but to make
> code more readable. In this particular case the separated lines look
> better to me.
>=20
>>> =20
>>>  	if (!tdc->config_init) {
>>>  		dev_err(tdc2dev(tdc), "DMA channel is not configured\n");
>>> @@ -1028,7 +1042,7 @@ static struct dma_async_tx_descriptor *tegra_dma_=
prep_slave_sg(
>>>  	}
>>> =20
>>>  	if (get_transfer_param(tdc, direction, &apb_ptr, &apb_seq, &csr,
>>> -				&burst_size, &slave_bw) < 0)
>>> +			       &burst_size, &slave_bw) < 0)
>>>  		return NULL;
>>> =20
>>>  	INIT_LIST_HEAD(&req_list);
>>> @@ -1074,7 +1088,7 @@ static struct dma_async_tx_descriptor *tegra_dma_=
prep_slave_sg(
>>>  		len =3D sg_dma_len(sg);
>>> =20
>>>  		if ((len & 3) || (mem & 3) ||
>>> -				(len > tdc->tdma->chip_data->max_dma_count)) {
>>> +		    len > tdc->tdma->chip_data->max_dma_count) {
>>>  			dev_err(tdc2dev(tdc),
>>>  				"DMA length/memory address is not supported\n");
>>>  			tegra_dma_desc_put(tdc, dma_desc);
>>> @@ -1126,20 +1140,21 @@ static struct dma_async_tx_descriptor *tegra_dm=
a_prep_slave_sg(
>>>  	return &dma_desc->txd;
>>>  }
>>> =20
>>> -static struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
>>> -	struct dma_chan *dc, dma_addr_t buf_addr, size_t buf_len,
>>> -	size_t period_len, enum dma_transfer_direction direction,
>>> -	unsigned long flags)
>>> +static struct dma_async_tx_descriptor *
>>> +tegra_dma_prep_dma_cyclic(struct dma_chan *dc, dma_addr_t buf_addr,
>>> +			  size_t buf_len,
>>> +			  size_t period_len,
>>> +			  enum dma_transfer_direction direction,
>>> +			  unsigned long flags)
>>>  {
>>>  	struct tegra_dma_channel *tdc =3D to_tegra_dma_chan(dc);
>>> -	struct tegra_dma_desc *dma_desc =3D NULL;
>>>  	struct tegra_dma_sg_req *sg_req =3D NULL;
>>> -	unsigned long csr, ahb_seq, apb_ptr, apb_seq;
>>> -	int len;
>>> -	size_t remain_len;
>>> -	dma_addr_t mem =3D buf_addr;
>>> -	u32 burst_size;
>>> +	u32 csr, ahb_seq, apb_ptr, apb_seq;
>>>  	enum dma_slave_buswidth slave_bw;
>>> +	struct tegra_dma_desc *dma_desc;
>>> +	dma_addr_t mem =3D buf_addr;
>>> +	unsigned int burst_size;
>>> +	size_t len, remain_len;
>>> =20
>>>  	if (!buf_len || !period_len) {
>>>  		dev_err(tdc2dev(tdc), "Invalid buffer/period len\n");
>>> @@ -1173,13 +1188,13 @@ static struct dma_async_tx_descriptor *tegra_dm=
a_prep_dma_cyclic(
>>> =20
>>>  	len =3D period_len;
>>>  	if ((len & 3) || (buf_addr & 3) ||
>>> -			(len > tdc->tdma->chip_data->max_dma_count)) {
>>> +	    len > tdc->tdma->chip_data->max_dma_count) {
>>>  		dev_err(tdc2dev(tdc), "Req len/mem address is not correct\n");
>>>  		return NULL;
>>>  	}
>>> =20
>>>  	if (get_transfer_param(tdc, direction, &apb_ptr, &apb_seq, &csr,
>>> -				&burst_size, &slave_bw) < 0)
>>> +			       &burst_size, &slave_bw) < 0)
>>>  		return NULL;
>>> =20
>>>  	ahb_seq =3D TEGRA_APBDMA_AHBSEQ_INTR_ENB;
>>> @@ -1269,7 +1284,6 @@ static int tegra_dma_alloc_chan_resources(struct =
dma_chan *dc)
>>>  	int ret;
>>> =20
>>>  	dma_cookie_init(&tdc->dma_chan);
>>> -	tdc->config_init =3D false;
>>
>> Why is this removed? Does not seem to belong in this patch.
>=20
> Because initially, on driver's probe, the tdc->config_init is false for
> all channels and then tegra_dma_free_chan_resources() also sets it to
> false. Thus there is no need to re-initilize the already initialized
> variable. It's not a very good coding style if variables are
> unnecessarily initialized, you probably noticed that there are few other
> cases of removing the unneeded initializations of local variables in
> this patch.

OK, but I don't really consider this coding-style and would prefer a
separate patch for this.

Jon

--=20
nvpublic
