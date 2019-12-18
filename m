From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v4 13/19] ASoC: tegra: Add fallback implementation for
 audio mclk
Date: Tue, 17 Dec 2019 23:14:46 -0800
Message-ID: <66a28f8a-82e8-5b12-464c-4c91441d1511@nvidia.com>
References: <1576613046-17159-1-git-send-email-skomatineni@nvidia.com>
 <1576613046-17159-14-git-send-email-skomatineni@nvidia.com>
 <e2f96102-33fa-cbe5-f488-666b7b7ffb06@gmail.com>
 <7e49fef8-112c-1694-9316-7a23db8a01a4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7e49fef8-112c-1694-9316-7a23db8a01a4@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 12/17/19 11:01 PM, Dmitry Osipenko wrote:
> 18.12.2019 09:59, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 17.12.2019 23:04, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> mclk is from clk_out_1 which is part of Tegra PMC block and pmc clocks
>>> are moved to Tegra PMC driver with pmc as clock provider and using pmc
>>> clock ids.
>>>
>>> New device tree uses clk_out_1 from pmc clock provider.
>>>
>>> So, this patch adds implementation for mclk fallback to extern1 when
>>> retrieving mclk returns -ENOENT to be backward compatible of new device
>>> tree with older kernels.
>>>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>>   sound/soc/tegra/tegra_asoc_utils.c | 11 ++++++++++-
>>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/sound/soc/tegra/tegra_asoc_utils.c b/sound/soc/tegra/tegra=
_asoc_utils.c
>>> index fe9ca8acd0fb..1b88c6043082 100644
>>> --- a/sound/soc/tegra/tegra_asoc_utils.c
>>> +++ b/sound/soc/tegra/tegra_asoc_utils.c
>>> @@ -191,7 +191,16 @@ int tegra_asoc_utils_init(struct tegra_asoc_utils_=
data *data,
>>>   	data->clk_cdev1 =3D devm_clk_get(dev, "mclk");
>>>   	if (IS_ERR(data->clk_cdev1)) {
>>>   		dev_err(data->dev, "Can't retrieve clk cdev1\n");
>>> -		return PTR_ERR(data->clk_cdev1);
>>> +		if (PTR_ERR(data->clk_cdev1) !=3D -ENOENT)
>>> +			return PTR_ERR(data->clk_cdev1);
>>> +		/* Fall back to extern1 */
>>> +		data->clk_cdev1 =3D devm_clk_get(dev, "extern1");
>>> +		if (IS_ERR(data->clk_cdev1)) {
>>> +			dev_err(data->dev, "Can't retrieve clk extern1\n");
>>> +			return PTR_ERR(data->clk_cdev1);
>>> +		}
>>> +
>>> +		dev_err(data->dev, "Falling back to extern1\n");
>>>   	}
>>>  =20
>>>   	/*
>>>
>> [    1.769091] ------------[ cut here ]------------
>> [    1.769249] WARNING: CPU: 2 PID: 1 at drivers/clk/clk.c:954
>> clk_core_disable+0xa5/0x1d4
>> [    1.769330] clk_out_1 already disabled
>> [    1.769459] Modules linked in:
>> [    1.769541] CPU: 2 PID: 1 Comm: swapper/0 Not tainted
>> 5.5.0-rc1-next-20191213-00167-g6b9fbcdac8f3-dirty #266
>> [    1.769676] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
>> [    1.769775] [<c010e4bd>] (unwind_backtrace) from [<c010a0fd>]
>> (show_stack+0x11/0x14)
>> [    1.769918] [<c010a0fd>] (show_stack) from [<c09a37b1>]
>> (dump_stack+0x85/0x94)
>> [    1.770061] [<c09a37b1>] (dump_stack) from [<c011f3d1>]
>> (__warn+0xc1/0xc4)
>> [    1.770144] [<c011f3d1>] (__warn) from [<c011f691>]
>> (warn_slowpath_fmt+0x61/0x78)
>> [    1.770285] [<c011f691>] (warn_slowpath_fmt) from [<c04a0e7d>]
>> (clk_core_disable+0xa5/0x1d4)
>> [    1.770427] [<c04a0e7d>] (clk_core_disable) from [<c04a0fc3>]
>> (clk_core_disable_lock+0x17/0x20)
>> [    1.770516] [<c04a0fc3>] (clk_core_disable_lock) from [<c07792bb>]
>> (tegra_asoc_utils_set_rate+0x53/0x208)
>> [    1.770662] [<c07792bb>] (tegra_asoc_utils_set_rate) from
>> [<c077b8c5>] (tegra_rt5640_probe+0xd5/0x128)
>> [    1.770808] [<c077b8c5>] (tegra_rt5640_probe) from [<c0555eb7>]
>> (platform_drv_probe+0x33/0x68)
>> [    1.770958] [<c0555eb7>] (platform_drv_probe) from [<c055471d>]
>> (really_probe+0x14d/0x240)
>> [    1.771099] [<c055471d>] (really_probe) from [<c055493f>]
>> (driver_probe_device+0x43/0x11c)
>> [    1.771187] [<c055493f>] (driver_probe_device) from [<c0554b25>]
>> (device_driver_attach+0x3d/0x40)
>> [    1.771328] [<c0554b25>] (device_driver_attach) from [<c0554b5f>]
>> (__driver_attach+0x37/0x78)
>> [    1.771469] [<c0554b5f>] (__driver_attach) from [<c05532fb>]
>> (bus_for_each_dev+0x43/0x6c)
>> [    1.771609] [<c05532fb>] (bus_for_each_dev) from [<c0553e0f>]
>> (bus_add_driver+0xe3/0x148)
>> [    1.771692] [<c0553e0f>] (bus_add_driver) from [<c055531d>]
>> (driver_register+0x39/0xa0)
>> [    1.771833] [<c055531d>] (driver_register) from [<c0102c2f>]
>> (do_one_initcall+0x43/0x1bc)
>> [    1.771979] [<c0102c2f>] (do_one_initcall) from [<c1000ce5>]
>> (kernel_init_freeable+0x121/0x194)
>> [    1.772129] [<c1000ce5>] (kernel_init_freeable) from [<c09b40e9>]
>> (kernel_init+0xd/0xd0)
>> [    1.772215] [<c09b40e9>] (kernel_init) from [<c01010bd>]
>> (ret_from_fork+0x11/0x34)
>> [    1.772349] Exception stack(0xde907fb0 to 0xde907ff8)
>>
> Although, that's probably related to the "ASoC: tegra: Add initial
> parent configuration for audio mclk".
>
Actually I see these warnings of already unprepared and already disabled=20
for pll_a, pll_a_out0, and clk_out_1 even without this whole patch=20
series as well.

I think its from tegra_asoc_utils_set_rate() doing clk_disable_unprepare=20
and these clocks are already unprepared and disabled so its just warning=20
from clk_core_unprepare and clk_core_disable.
