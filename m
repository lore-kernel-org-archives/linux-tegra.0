From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v4 02/14] dmaengine: tegra-apb: Implement synchronization
 callback
Date: Wed, 15 Jan 2020 10:25:45 +0000
Message-ID: <d07d3d64-8abd-e3d7-ca1c-01ab8607b8c2@nvidia.com>
References: <20200112173006.29863-1-digetx@gmail.com>
 <20200112173006.29863-3-digetx@gmail.com>
 <c225399c-f032-8001-e67b-b807dcda748c@nvidia.com>
 <627f996c-1487-1b9a-e953-f5737f3ad32a@gmail.com>
 <34ec4c18-f082-def6-8544-0d15a109d7f8@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <34ec4c18-f082-def6-8544-0d15a109d7f8@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 15/01/2020 09:18, Jon Hunter wrote:
>=20
> On 14/01/2020 21:02, Dmitry Osipenko wrote:
>> 14.01.2020 18:15, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>
>>> On 12/01/2020 17:29, Dmitry Osipenko wrote:
>>>> The ISR tasklet could be kept scheduled after DMA transfer termination=
,
>>>> let's add synchronization callback which blocks until tasklet is finis=
hed.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>>  drivers/dma/tegra20-apb-dma.c | 8 ++++++++
>>>>  1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-d=
ma.c
>>>> index 319f31d27014..664e9c5df3ba 100644
>>>> --- a/drivers/dma/tegra20-apb-dma.c
>>>> +++ b/drivers/dma/tegra20-apb-dma.c
>>>> @@ -798,6 +798,13 @@ static int tegra_dma_terminate_all(struct dma_cha=
n *dc)
>>>>  	return 0;
>>>>  }
>>>> =20
>>>> +static void tegra_dma_synchronize(struct dma_chan *dc)
>>>> +{
>>>> +	struct tegra_dma_channel *tdc =3D to_tegra_dma_chan(dc);
>>>> +
>>>> +	tasklet_kill(&tdc->tasklet);
>>>> +}
>>>> +
>>>
>>> Wouldn't there need to be some clean-up here? If the tasklet is
>>> scheduled, seems that there would be some other house-keeping that need=
s
>>> to be done after killing it.
>>
>> I'm not seeing anything to clean-up, could you please clarify?
>=20
> Clean-up with regard to the descriptors. I was concerned if you will the
> tasklet the necessary clean-up of the descriptors is not handled.

Ah I see that tasklet_kill, unlike tasklet_kill_immediate, does wait for
the tasklet to run if scheduled. OK, then this should be fine.

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

--=20
nvpublic
