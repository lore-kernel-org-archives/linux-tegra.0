From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v4 01/14] dmaengine: tegra-apb: Fix use-after-free
Date: Tue, 28 Jan 2020 14:02:38 +0000
Message-ID: <5bbe9e3e-a64f-53be-e7f6-63e36cbae77d@nvidia.com>
References: <20200112173006.29863-1-digetx@gmail.com>
 <20200112173006.29863-2-digetx@gmail.com>
 <4c1b9e48-5468-0c03-2108-158ee814eea8@nvidia.com>
 <1327bb21-0364-da26-e6ed-ff6c19df03e6@gmail.com>
 <e39ef31d-4cff-838a-0fc1-73a39a8d6120@nvidia.com>
 <b0c85ca7-d8ac-5f9d-2c57-79543c1f9b5d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b0c85ca7-d8ac-5f9d-2c57-79543c1f9b5d@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 16/01/2020 20:10, Dmitry Osipenko wrote:
> 15.01.2020 12:00, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>> On 14/01/2020 20:33, Dmitry Osipenko wrote:
>>> 14.01.2020 18:09, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>
>>>> On 12/01/2020 17:29, Dmitry Osipenko wrote:
>>>>> I was doing some experiments with I2C and noticed that Tegra APB DMA
>>>>> driver crashes sometime after I2C DMA transfer termination. The crash
>>>>> happens because tegra_dma_terminate_all() bails out immediately if pe=
nding
>>>>> list is empty, thus it doesn't release the half-completed descriptors
>>>>> which are getting re-used before ISR tasklet kicks-in.
>>>>
>>>> Can you elaborate a bit more on how these are getting re-used? What is
>>>> the sequence of events which results in the panic? I believe that this
>>>> was also reported in the past [0] and so I don't doubt there is an iss=
ue
>>>> here, but would like to completely understand this.
>>>>
>>>> Thanks!
>>>> Jon
>>>>
>>>> [0] https://lore.kernel.org/patchwork/patch/675349/
>>>>
>>>
>>> In my case it happens in the touchscreen driver during of the
>>> touchscreen's interrupt handling (in a threaded IRQ handler) + CPU is
>>> under load and there is other interrupts activity. So what happens here
>>> is that the TS driver issues one I2C transfer, which fails with
>>> (apparently bogus) timeout (because DMA descriptor is completed and
>>> removed from the pending list, but tasklet not executed yet), and then
>>> TS immediately issues another I2C transfer that re-uses the
>>> yet-incompleted descriptor. That's my understanding.
>>
>> OK, but what is the exact sequence that it allowing it to re-use the
>> incompleted descriptor?
>=20
>    TDMA driver                      DMA Client
>=20
> 1.
>                                     dmaengine_prep()
>=20
> 2.
>    tegra_dma_desc_get()
>    dma_desc =3D kzalloc()
>    ...
>    tegra_dma_prep_slave_sg()
>    INIT_LIST_HEAD(&dma_desc->tx_list);
>    INIT_LIST_HEAD(&dma_desc->cb_node);
>    list_add_tail(sgreq->node,
>                  dma_desc->tx_list)
>=20
> 3.
>                                     dma_async_issue_pending()
>=20
> 4.
>    tegra_dma_tx_submit()
>    list_splice_tail_init(dma_desc->tx_list,
>                          tdc->pending_sg_req)
>=20
> 5.
>    tegra_dma_isr()
>    ...
>    handle_once_dma_done()
>    ...
>    sgreq =3D list_first_entry(tdc->pending_sg_req)
>    list_del(sgreq->node);
>    ...
>    list_add_tail(dma_desc->cb_node,
>                  tdc->cb_desc);
>    list_add_tail(dma_desc->node,
>                  tdc->free_dma_desc);

Isn't this the problem here, that we have placed this on the free list
before we are actually done?

It seems to me that there could still be a potential race condition
between the ISR and the tasklet running.

Jon

--=20
nvpublic
