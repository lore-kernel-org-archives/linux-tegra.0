From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v7 14/19] dmaengine: tegra-apb: Keep clock enabled only
 during of DMA transfer
Date: Thu, 6 Feb 2020 14:33:34 +0000
Message-ID: <422a3043-9674-9860-eb98-e7a8eac73c58@nvidia.com>
References: <20200202222854.18409-1-digetx@gmail.com>
 <20200202222854.18409-15-digetx@gmail.com>
 <ca0f71ef-ba16-73bc-d904-1f5351c69931@nvidia.com>
 <3133d4e3-7623-9342-f26c-5de8b4e6b8c6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3133d4e3-7623-9342-f26c-5de8b4e6b8c6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 06/02/2020 14:31, Dmitry Osipenko wrote:
> 06.02.2020 16:50, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>> On 02/02/2020 22:28, Dmitry Osipenko wrote:
>>> It's a bit impractical to enable hardware's clock at the time of DMA
>>> channel's allocation because most of DMA client drivers allocate DMA
>>> channel at the time of the driver's probing, and thus, DMA clock is kep=
t
>>> always-enabled in practice, defeating the whole purpose of runtime PM.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>  drivers/dma/tegra20-apb-dma.c | 35 ++++++++++++++++++++++++-----------
>>>  1 file changed, 24 insertions(+), 11 deletions(-)
>> What about something like ......
>> @@ -581,6 +582,7 @@ static bool handle_continuous_head_request(struct te=
gra_dma_channel *tdc,
>>  	hsgreq =3D list_first_entry(&tdc->pending_sg_req, typeof(*hsgreq), nod=
e);
>>  	if (!hsgreq->configured) {
>>  		tegra_dma_stop(tdc);
>> +		pm_runtime_put(tdc->tdma->dev);
>>  		dev_err(tdc2dev(tdc), "Error in DMA transfer, aborting DMA\n");
>>  		tegra_dma_abort_all(tdc);
>>  		return false;
>=20
> Yes, that it's what you suggested to do in the reply to v6.
>=20
> Alright, I'll drop v7 patch #13 and add the put to this patch #14.

Yes I was not sure if it was clear. However, this seems a bit of an
easier change and should keep the 'busy' status somewhat consistent with
the rpm state.

Jon

--=20
nvpublic
