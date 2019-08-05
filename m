From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v7 01/20] pinctrl: tegra: Add suspend and resume support
Date: Mon, 5 Aug 2019 11:06:02 -0700
Message-ID: <b45ca99a-188a-c695-3f3d-48d273808f9c@nvidia.com>
References: <1564607463-28802-1-git-send-email-skomatineni@nvidia.com>
 <1564607463-28802-2-git-send-email-skomatineni@nvidia.com>
 <6b1482f6-0578-f602-d8d1-541d86303ce2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6b1482f6-0578-f602-d8d1-541d86303ce2@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 8/5/19 3:50 AM, Dmitry Osipenko wrote:
> 01.08.2019 0:10, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> This patch adds support for Tegra pinctrl driver suspend and resume.
>>
>> During suspend, context of all pinctrl registers are stored and
>> on resume they are all restored to have all the pinmux and pad
>> configuration for normal operation.
>>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/pinctrl/tegra/pinctrl-tegra.c | 59 +++++++++++++++++++++++++++=
++++++++
>>   drivers/pinctrl/tegra/pinctrl-tegra.h |  3 ++
>>   2 files changed, 62 insertions(+)
>>
>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/teg=
ra/pinctrl-tegra.c
>> index 186ef98e7b2b..e3a237534281 100644
>> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
>> @@ -631,6 +631,58 @@ static void tegra_pinctrl_clear_parked_bits(struct =
tegra_pmx *pmx)
>>   	}
>>   }
>>  =20
>> +static size_t tegra_pinctrl_get_bank_size(struct device *dev,
>> +					  unsigned int bank_id)
>> +{
>> +	struct platform_device *pdev =3D to_platform_device(dev);
>> +	struct resource *res;
>> +
>> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, bank_id);
>> +
>> +	return resource_size(res) / 4;
>> +}
>> +
>> +static int tegra_pinctrl_suspend(struct device *dev)
>> +{
>> +	struct tegra_pmx *pmx =3D dev_get_drvdata(dev);
>> +	u32 *backup_regs =3D pmx->backup_regs;
>> +	u32 *regs;
>> +	size_t bank_size;
>> +	unsigned int i, k;
>> +
>> +	for (i =3D 0; i < pmx->nbanks; i++) {
>> +		bank_size =3D tegra_pinctrl_get_bank_size(dev, i);
>> +		regs =3D pmx->regs[i];
>> +		for (k =3D 0; k < bank_size; k++)
>> +			*backup_regs++ =3D readl_relaxed(regs++);
>> +	}
>> +
>> +	return pinctrl_force_sleep(pmx->pctl);
>> +}
>> +
>> +static int tegra_pinctrl_resume(struct device *dev)
>> +{
>> +	struct tegra_pmx *pmx =3D dev_get_drvdata(dev);
>> +	u32 *backup_regs =3D pmx->backup_regs;
>> +	u32 *regs;
>> +	size_t bank_size;
>> +	unsigned int i, k;
>> +
>> +	for (i =3D 0; i < pmx->nbanks; i++) {
>> +		bank_size =3D tegra_pinctrl_get_bank_size(dev, i);
>> +		regs =3D pmx->regs[i];
>> +		for (k =3D 0; k < bank_size; k++)
>> +			writel_relaxed(*backup_regs++, regs++);
>> +	}
> I'm now curious whether any kind of barrier is needed after the
> writings. The pmx_writel() doesn't insert a barrier after the write and
> seems it just misuses writel, which actually should be writel_relaxed()
> + barrier, IIUC.

pmx_writel uses writel and it has wmb before raw_write which complete=20
all writes initiated prior to this.

By misusing writel, you mean to have barrier after register write?

> It's also not obvious whether PINCTRL HW has any kind of write-FIFO and
> thus maybe read-back + rmb() is needed in order ensure that writes are
> actually completed.
I believe adding write barrier wmb after writel_relaxed should be good=20
rather than doing readback + rmb
>
> The last thing which is not obvious is when the new configuration
> actually takes into effect, does it happen immediately or maybe some
> delay is needed?
>
> [snip]

Based on internal design there is no internal delay and it all depends=20
on APB rate that it takes to write to register.

Pinmux value change to reflect internally might take couple of clock=20
cycles which is much faster than SW can read.
