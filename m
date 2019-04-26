From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1] dmaengine: tegra: Use relaxed versions of readl/writel
Date: Fri, 26 Apr 2019 12:13:37 +0100
Message-ID: <bff59709-426b-32d2-08eb-d8f51cd7d5c1@nvidia.com>
References: <20190424231708.21219-1-digetx@gmail.com>
 <d789f1bc-44d1-abf6-a046-7cf835416e8f@nvidia.com>
 <4a315b63-bc71-3c3e-f1ae-8638bcf4033d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4a315b63-bc71-3c3e-f1ae-8638bcf4033d@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 26/04/2019 11:45, Dmitry Osipenko wrote:
> 26.04.2019 12:52, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>> On 25/04/2019 00:17, Dmitry Osipenko wrote:
>>> The readl/writel functions are inserting memory barrier in order to
>>> ensure that memory stores are completed. On Tegra20 and Tegra30 this
>>> results in L2 cache syncing which isn't a cheapest operation. The
>>> tegra20-apb-dma driver doesn't need to synchronize generic memory
>>> accesses, hence use the relaxed versions of the functions.
>>
>> Do you mean device-io accesses here as this is not generic memory?
>=20
> Yes. The IOMEM accesses within are always ordered and uncached, while
> generic memory accesses are out-of-order and cached.
>=20
>> Although there may not be any issues with this change, I think I need a
>> bit more convincing that we should do this given that we have had it
>> this way for sometime and I would not like to see us introduce any
>> regressions as this point without being 100% certain we would not.
>> Ideally, if I had some good extensive tests I could run to hammer the
>> DMA for all configurations with different combinations of channels
>> running simultaneously then we could test this, but right now I don't :-=
(
>>
>> Have you ...
>> 1. Tested both cyclic and scatter-gather transfers?
>> 2. Stress tested simultaneous transfers with various different
>>    configurations?
>> 3. Quantified the actual performance benefit of this change so we can
>>    understand how much of a performance boost this offers?
>=20
> Actually I found a case where this change causes a problem, I'm seeing
> I2C transfer timeout for touchscreen and it breaks the touch input.
> Indeed, I haven't tested this patch very well.
>=20
> And the fix is this:
>=20
> @@ -1592,6 +1592,8 @@ static int tegra_dma_runtime_suspend(struct device
> *dev)
>  						  TEGRA_APBDMA_CHAN_WCOUNT);
>  	}
>=20
> +	dsb();
> +
>  	clk_disable_unprepare(tdma->dma_clk);
>=20
>  	return 0;
>=20
>=20
> Apparently the problem is that CLK/DMA (PPSB/APB) accesses are
> incoherent and CPU disables clock before writes are reaching DMA controll=
er.
>=20
> I'd say that cyclic and scatter-gather transfers are now tested. I also
> made some more testing of simultaneous transfers.
>=20
> Quantifying performance probably won't be easy to make as the DMA
> read/writes are not on any kind of code's hot-path.

So why make the change?
> Jon, are you still insisting about to drop this patch or you will be
> fine with the v2 that will have the dsb() in place?

If we can't quantify the performance gain, then it is difficult to
justify the change. I would also be concerned if that is the only place
we need an explicit dsb.

Cheers
Jon

--=20
nvpublic
