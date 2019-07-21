From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH V6 02/21] pinctrl: tegra: Add suspend and resume support
Date: Sun, 21 Jul 2019 15:48:06 -0700
Message-ID: <ec373422-c1e0-6159-4f2d-4ced87bbb80e@nvidia.com>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-3-git-send-email-skomatineni@nvidia.com>
 <d837e4e0-947b-2b90-c680-ab913e70e587@gmail.com>
 <9c844d55-0bc0-471c-6c49-1febe799ebf2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9c844d55-0bc0-471c-6c49-1febe799ebf2@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 7/21/19 3:09 PM, Dmitry Osipenko wrote:
> 22.07.2019 1:03, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 21.07.2019 22:40, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> This patch adds support for Tegra pinctrl driver suspend and resume.
>>>
>>> During suspend, context of all pinctrl registers are stored and
>>> on resume they are all restored to have all the pinmux and pad
>>> configuration for normal operation.
>>>
>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>>   drivers/pinctrl/tegra/pinctrl-tegra.c | 59 ++++++++++++++++++++++++++=
+++++++++
>>>   drivers/pinctrl/tegra/pinctrl-tegra.h |  3 ++
>>>   2 files changed, 62 insertions(+)
>>>
>>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/te=
gra/pinctrl-tegra.c
>>> index 186ef98e7b2b..e3a237534281 100644
>>> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
>>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
>>> @@ -631,6 +631,58 @@ static void tegra_pinctrl_clear_parked_bits(struct=
 tegra_pmx *pmx)
>>>   	}
>>>   }
>>>  =20
>>> +static size_t tegra_pinctrl_get_bank_size(struct device *dev,
>>> +					  unsigned int bank_id)
>>> +{
>>> +	struct platform_device *pdev =3D to_platform_device(dev);
>>> +	struct resource *res;
>>> +
>>> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, bank_id);
>>> +
>>> +	return resource_size(res) / 4;
>>> +}
>>> +
>>> +static int tegra_pinctrl_suspend(struct device *dev)
>>> +{
>>> +	struct tegra_pmx *pmx =3D dev_get_drvdata(dev);
>>> +	u32 *backup_regs =3D pmx->backup_regs;
>>> +	u32 *regs;
>>> +	size_t bank_size;
>>> +	unsigned int i, k;
>>> +
>>> +	for (i =3D 0; i < pmx->nbanks; i++) {
>>> +		bank_size =3D tegra_pinctrl_get_bank_size(dev, i);
>>> +		regs =3D pmx->regs[i];
>>> +		for (k =3D 0; k < bank_size; k++)
>>> +			*backup_regs++ =3D readl_relaxed(regs++);
>>> +	}
>>> +
>>> +	return pinctrl_force_sleep(pmx->pctl);
>>> +}
>>> +
>>> +static int tegra_pinctrl_resume(struct device *dev)
>>> +{
>>> +	struct tegra_pmx *pmx =3D dev_get_drvdata(dev);
>>> +	u32 *backup_regs =3D pmx->backup_regs;
>>> +	u32 *regs;
>>> +	size_t bank_size;
>>> +	unsigned int i, k;
>>> +
>>> +	for (i =3D 0; i < pmx->nbanks; i++) {
>>> +		bank_size =3D tegra_pinctrl_get_bank_size(dev, i);
>>> +		regs =3D pmx->regs[i];
>>> +		for (k =3D 0; k < bank_size; k++)
>>> +			writel_relaxed(*backup_regs++, regs++);
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +const struct dev_pm_ops tegra_pinctrl_pm =3D {
>>> +	.suspend =3D &tegra_pinctrl_suspend,
>>> +	.resume =3D &tegra_pinctrl_resume
>>> +};
>>> +
>>>   static bool gpio_node_has_range(const char *compatible)
>>>   {
>>>   	struct device_node *np;
>>> @@ -655,6 +707,7 @@ int tegra_pinctrl_probe(struct platform_device *pde=
v,
>>>   	int i;
>>>   	const char **group_pins;
>>>   	int fn, gn, gfn;
>>> +	unsigned long backup_regs_size =3D 0;
>>>  =20
>>>   	pmx =3D devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
>>>   	if (!pmx)
>>> @@ -707,6 +760,7 @@ int tegra_pinctrl_probe(struct platform_device *pde=
v,
>>>   		res =3D platform_get_resource(pdev, IORESOURCE_MEM, i);
>>>   		if (!res)
>>>   			break;
>>> +		backup_regs_size +=3D resource_size(res);
>>>   	}
>>>   	pmx->nbanks =3D i;
>>>  =20
>>> @@ -715,6 +769,11 @@ int tegra_pinctrl_probe(struct platform_device *pd=
ev,
>>>   	if (!pmx->regs)
>>>   		return -ENOMEM;
>>>  =20
>>> +	pmx->backup_regs =3D devm_kzalloc(&pdev->dev, backup_regs_size,
>>> +					GFP_KERNEL);
>>> +	if (!pmx->backup_regs)
>>> +		return -ENOMEM;
>>> +
>>>   	for (i =3D 0; i < pmx->nbanks; i++) {
>>>   		res =3D platform_get_resource(pdev, IORESOURCE_MEM, i);
>>>   		pmx->regs[i] =3D devm_ioremap_resource(&pdev->dev, res);
>>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/te=
gra/pinctrl-tegra.h
>>> index 105309774079..0fc82eea9cf1 100644
>>> --- a/drivers/pinctrl/tegra/pinctrl-tegra.h
>>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
>>> @@ -17,6 +17,7 @@ struct tegra_pmx {
>>>  =20
>>>   	int nbanks;
>>>   	void __iomem **regs;
>>> +	u32 *backup_regs;
>>>   };
>>>  =20
>>>   enum tegra_pinconf_param {
>>> @@ -193,6 +194,8 @@ struct tegra_pinctrl_soc_data {
>>>   	bool drvtype_in_mux;
>>>   };
>>>  =20
>>> +extern const struct dev_pm_ops tegra_pinctrl_pm;
>>> +
>>>   int tegra_pinctrl_probe(struct platform_device *pdev,
>>>   			const struct tegra_pinctrl_soc_data *soc_data);
>>>   #endif
>>>
>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>>
> BTW, you should remove Thierry's ACK from all patches that were modified
> if he didn't re-ACK the new version.
>
> Also, it looks to me that you're manually adding versioning to the
> patches because git usually uses lowercase for 'v'. You could use "git
> format-patch -v6 ..".


ok, Reg. version I am using git format-patch --subject-prefix=3D'PATCH V6'

will change to lower case v
