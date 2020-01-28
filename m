From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v4 11/14] dmaengine: tegra-apb: Clean up suspend-resume
Date: Tue, 28 Jan 2020 14:10:24 +0000
Message-ID: <831d5e28-72df-3175-bfb6-b33985d93a52@nvidia.com>
References: <20200112173006.29863-1-digetx@gmail.com>
 <20200112173006.29863-12-digetx@gmail.com>
 <7e0d2cfa-5570-93e6-e3dc-7d3f6902a528@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7e0d2cfa-5570-93e6-e3dc-7d3f6902a528@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 21/01/2020 21:23, Dmitry Osipenko wrote:
> 12.01.2020 20:30, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> It is enough to check whether hardware is busy on suspend and to reset
>> it across of suspend-resume because channel's configuration is fully
>> re-programmed on each DMA transaction anyways and because save-restore
>> of an active channel won't end up well without pausing transfer prior to
>> saving of the state (note that all channels shall be idling at the time =
of
>> suspend, so save-restore is not needed at all).
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/dma/tegra20-apb-dma.c | 131 +++++++++++++++++-----------------
>>  1 file changed, 67 insertions(+), 64 deletions(-)
>>
>> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma=
.c
>> index b9d8e57eaf54..398a0e1d6506 100644
>> --- a/drivers/dma/tegra20-apb-dma.c
>> +++ b/drivers/dma/tegra20-apb-dma.c
>> @@ -1392,6 +1392,36 @@ static const struct tegra_dma_chip_data tegra148_=
dma_chip_data =3D {
>>  	.support_separate_wcount_reg =3D true,
>>  };
>> =20
>> +static int tegra_dma_init_hw(struct tegra_dma *tdma)
>> +{
>> +	int err;
>> +
>> +	err =3D reset_control_assert(tdma->rst);
>> +	if (err) {
>> +		dev_err(tdma->dev, "failed to assert reset: %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	err =3D clk_enable(tdma->dma_clk);
>> +	if (err) {
>> +		dev_err(tdma->dev, "failed to enable clk: %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	/* reset DMA controller */
>> +	udelay(2);
>> +	reset_control_deassert(tdma->rst);
>> +
>> +	/* enable global DMA registers */
>> +	tdma_write(tdma, TEGRA_APBDMA_GENERAL, TEGRA_APBDMA_GENERAL_ENABLE);
>> +	tdma_write(tdma, TEGRA_APBDMA_CONTROL, 0);
>> +	tdma_write(tdma, TEGRA_APBDMA_IRQ_MASK_SET, 0xFFFFFFFF);
>> +
>> +	clk_disable(tdma->dma_clk);
>> +
>> +	return 0;
>> +}
>> +
>>  static int tegra_dma_probe(struct platform_device *pdev)
>>  {
>>  	const struct tegra_dma_chip_data *cdata;
>> @@ -1433,30 +1463,18 @@ static int tegra_dma_probe(struct platform_devic=
e *pdev)
>>  	if (ret)
>>  		return ret;
>> =20
>> +	ret =3D tegra_dma_init_hw(tdma);
>> +	if (ret)
>> +		goto err_clk_unprepare;
>> +
>>  	pm_runtime_irq_safe(&pdev->dev);
>>  	pm_runtime_enable(&pdev->dev);
>>  	if (!pm_runtime_enabled(&pdev->dev)) {
>>  		ret =3D tegra_dma_runtime_resume(&pdev->dev);
>>  		if (ret)
>>  			goto err_clk_unprepare;
>=20
> Jon, but isn't the RPM mandatory for all Tegra SoCs now and thus
> guaranteed to be enabled? Maybe we should start to remove handling the
> case of unavailable RPM from all Tegra drivers?

Yes that's true, even ARCH_TEGRA selects PM now

Cheers
Jon

--=20
nvpublic
