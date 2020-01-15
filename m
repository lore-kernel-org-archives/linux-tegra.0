From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 01/14] dmaengine: tegra-apb: Fix use-after-free
Date: Wed, 15 Jan 2020 09:00:51 +0000
Message-ID: <e39ef31d-4cff-838a-0fc1-73a39a8d6120@nvidia.com>
References: <20200112173006.29863-1-digetx@gmail.com>
 <20200112173006.29863-2-digetx@gmail.com>
 <4c1b9e48-5468-0c03-2108-158ee814eea8@nvidia.com>
 <1327bb21-0364-da26-e6ed-ff6c19df03e6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1327bb21-0364-da26-e6ed-ff6c19df03e6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 14/01/2020 20:33, Dmitry Osipenko wrote:
> 14.01.2020 18:09, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>> On 12/01/2020 17:29, Dmitry Osipenko wrote:
>>> I was doing some experiments with I2C and noticed that Tegra APB DMA
>>> driver crashes sometime after I2C DMA transfer termination. The crash
>>> happens because tegra_dma_terminate_all() bails out immediately if pend=
ing
>>> list is empty, thus it doesn't release the half-completed descriptors
>>> which are getting re-used before ISR tasklet kicks-in.
>>
>> Can you elaborate a bit more on how these are getting re-used? What is
>> the sequence of events which results in the panic? I believe that this
>> was also reported in the past [0] and so I don't doubt there is an issue
>> here, but would like to completely understand this.
>>
>> Thanks!
>> Jon
>>
>> [0] https://lore.kernel.org/patchwork/patch/675349/
>>
>=20
> In my case it happens in the touchscreen driver during of the
> touchscreen's interrupt handling (in a threaded IRQ handler) + CPU is
> under load and there is other interrupts activity. So what happens here
> is that the TS driver issues one I2C transfer, which fails with
> (apparently bogus) timeout (because DMA descriptor is completed and
> removed from the pending list, but tasklet not executed yet), and then
> TS immediately issues another I2C transfer that re-uses the
> yet-incompleted descriptor. That's my understanding.

OK, but what is the exact sequence that it allowing it to re-use the
incompleted descriptor?

Thanks
Jon

--=20
nvpublic
