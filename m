From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 02/14] dmaengine: tegra-apb: Implement synchronization
 callback
Date: Wed, 15 Jan 2020 09:18:15 +0000
Message-ID: <34ec4c18-f082-def6-8544-0d15a109d7f8@nvidia.com>
References: <20200112173006.29863-1-digetx@gmail.com>
 <20200112173006.29863-3-digetx@gmail.com>
 <c225399c-f032-8001-e67b-b807dcda748c@nvidia.com>
 <627f996c-1487-1b9a-e953-f5737f3ad32a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <627f996c-1487-1b9a-e953-f5737f3ad32a-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 14/01/2020 21:02, Dmitry Osipenko wrote:
> 14.01.2020 18:15, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>> On 12/01/2020 17:29, Dmitry Osipenko wrote:
>>> The ISR tasklet could be kept scheduled after DMA transfer termination,
>>> let's add synchronization callback which blocks until tasklet is finish=
ed.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>  drivers/dma/tegra20-apb-dma.c | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dm=
a.c
>>> index 319f31d27014..664e9c5df3ba 100644
>>> --- a/drivers/dma/tegra20-apb-dma.c
>>> +++ b/drivers/dma/tegra20-apb-dma.c
>>> @@ -798,6 +798,13 @@ static int tegra_dma_terminate_all(struct dma_chan=
 *dc)
>>>  	return 0;
>>>  }
>>> =20
>>> +static void tegra_dma_synchronize(struct dma_chan *dc)
>>> +{
>>> +	struct tegra_dma_channel *tdc =3D to_tegra_dma_chan(dc);
>>> +
>>> +	tasklet_kill(&tdc->tasklet);
>>> +}
>>> +
>>
>> Wouldn't there need to be some clean-up here? If the tasklet is
>> scheduled, seems that there would be some other house-keeping that needs
>> to be done after killing it.
>=20
> I'm not seeing anything to clean-up, could you please clarify?

Clean-up with regard to the descriptors. I was concerned if you will the
tasklet the necessary clean-up of the descriptors is not handled.

Jon

--=20
nvpublic
