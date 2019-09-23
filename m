From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v4 1/2] soc/tegra: pmc: Query PCLK clock rate at probe
 time
Date: Mon, 23 Sep 2019 14:01:02 +0100
Message-ID: <c5a5a059-c949-1a25-c7ac-59d88ad9a026@nvidia.com>
References: <20190804202927.15014-1-digetx@gmail.com>
 <23856887-06b0-66a8-1df2-ef4d7b48dc68@nvidia.com>
 <854c90c4-9e42-2020-5fa7-8711203f56a5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <854c90c4-9e42-2020-5fa7-8711203f56a5@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 23/09/2019 13:49, Dmitry Osipenko wrote:
> 23.09.2019 13:56, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>>
>> On 04/08/2019 21:29, Dmitry Osipenko wrote:
>>> It is possible to get a lockup if kernel decides to enter LP2 cpuidle
>>> from some clk-notifier, in that case CCF's "prepare" mutex is kept lock=
ed
>>> and thus clk_get_rate(pclk) blocks on the same mutex with interrupts be=
ing
>>> disabled.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>
>>> Changelog:
>>>
>>> v4: Added clk-notifier to track PCLK rate-changes, which may become use=
ful
>>>     in the future. That's done in response to v3 review comment from Pe=
ter
>>>     De Schrijver.
>>>
>>>     Now properly handling case where clk pointer is intentionally NULL =
on
>>>     the driver's probe.
>>>
>>> v3: Changed commit's message because I actually recalled what was the
>>>     initial reason for the patch, since the problem reoccurred once aga=
in.
>>>
>>> v2: Addressed review comments that were made by Jon Hunter to v1 by
>>>     not moving the memory barrier, replacing one missed clk_get_rate()
>>>     with pmc->rate, handling possible clk_get_rate() error on probe and
>>>     slightly adjusting the commits message.
>>>
>>>  drivers/soc/tegra/pmc.c | 71 ++++++++++++++++++++++++++++++-----------
>>>  1 file changed, 53 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>>> index 9f9c1c677cf4..4e44943d0b26 100644
>>> --- a/drivers/soc/tegra/pmc.c
>>> +++ b/drivers/soc/tegra/pmc.c
>>> @@ -309,6 +309,7 @@ static const char * const tegra210_reset_sources[] =
=3D {
>>>   * @pctl_dev: pin controller exposed by the PMC
>>>   * @domain: IRQ domain provided by the PMC
>>>   * @irq: chip implementation for the IRQ domain
>>> + * @clk_nb: pclk clock changes handler
>>>   */
>>>  struct tegra_pmc {
>>>  	struct device *dev;
>>> @@ -344,6 +345,8 @@ struct tegra_pmc {
>>> =20
>>>  	struct irq_domain *domain;
>>>  	struct irq_chip irq;
>>> +
>>> +	struct notifier_block clk_nb;
>>>  };
>>> =20
>>>  static struct tegra_pmc *pmc =3D &(struct tegra_pmc) {
>>> @@ -1192,7 +1195,7 @@ static int tegra_io_pad_prepare(struct tegra_pmc =
*pmc, enum tegra_io_pad id,
>>>  		return err;
>>> =20
>>>  	if (pmc->clk) {
>>> -		rate =3D clk_get_rate(pmc->clk);
>>> +		rate =3D pmc->rate;
>>>  		if (!rate) {
>>>  			dev_err(pmc->dev, "failed to get clock rate\n");
>>>  			return -ENODEV;
>>
>> So this error should never happen now, right? Assuming that rate is
>> never set to 0. But ...
>=20
> Good catch!
>=20
>>> @@ -1433,6 +1436,7 @@ void tegra_pmc_set_suspend_mode(enum tegra_suspen=
d_mode mode)
>>>  void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
>>>  {
>>>  	unsigned long long rate =3D 0;
>>> +	u64 ticks;
>>>  	u32 value;
>>> =20
>>>  	switch (mode) {
>>> @@ -1441,31 +1445,22 @@ void tegra_pmc_enter_suspend_mode(enum tegra_su=
spend_mode mode)
>>>  		break;
>>> =20
>>>  	case TEGRA_SUSPEND_LP2:
>>> -		rate =3D clk_get_rate(pmc->clk);
>>> +		rate =3D pmc->rate;
>>>  		break;
>>> =20
>>>  	default:
>>>  		break;
>>>  	}
>>> =20
>>> -	if (WARN_ON_ONCE(rate =3D=3D 0))
>>> -		rate =3D 100000000;
>>> -
>>> -	if (rate !=3D pmc->rate) {
>>> -		u64 ticks;
>>> -
>>> -		ticks =3D pmc->cpu_good_time * rate + USEC_PER_SEC - 1;
>>> -		do_div(ticks, USEC_PER_SEC);
>>> -		tegra_pmc_writel(pmc, ticks, PMC_CPUPWRGOOD_TIMER);
>>> +	ticks =3D pmc->cpu_good_time * rate + USEC_PER_SEC - 1;
>>> +	do_div(ticks, USEC_PER_SEC);
>>> +	tegra_pmc_writel(pmc, ticks, PMC_CPUPWRGOOD_TIMER);
>>> =20
>>> -		ticks =3D pmc->cpu_off_time * rate + USEC_PER_SEC - 1;
>>> -		do_div(ticks, USEC_PER_SEC);
>>> -		tegra_pmc_writel(pmc, ticks, PMC_CPUPWROFF_TIMER);
>>> +	ticks =3D pmc->cpu_off_time * rate + USEC_PER_SEC - 1;
>>> +	do_div(ticks, USEC_PER_SEC);
>>> +	tegra_pmc_writel(pmc, ticks, PMC_CPUPWROFF_TIMER);
>>> =20
>>> -		wmb();
>>> -
>>> -		pmc->rate =3D rate;
>>> -	}
>>> +	wmb();
>>> =20
>>>  	value =3D tegra_pmc_readl(pmc, PMC_CNTRL);
>>>  	value &=3D ~PMC_CNTRL_SIDE_EFFECT_LP0;
>>> @@ -2019,6 +2014,20 @@ static int tegra_pmc_irq_init(struct tegra_pmc *=
pmc)
>>>  	return 0;
>>>  }
>>> =20
>>> +static int tegra_pmc_clk_notify_cb(struct notifier_block *nb,
>>> +				   unsigned long action, void *ptr)
>>> +{
>>> +	struct clk_notifier_data *data =3D ptr;
>>> +	struct tegra_pmc *pmc;
>>> +
>>> +	if (action =3D=3D POST_RATE_CHANGE) {
>>> +		pmc =3D container_of(nb, struct tegra_pmc, clk_nb);
>>> +		pmc->rate =3D data->new_rate;
>>> +	}
>>> +
>>> +	return NOTIFY_OK;
>>> +}
>>> +
>>>  static int tegra_pmc_probe(struct platform_device *pdev)
>>>  {
>>>  	void __iomem *base;
>>> @@ -2082,6 +2091,30 @@ static int tegra_pmc_probe(struct platform_devic=
e *pdev)
>>>  		pmc->clk =3D NULL;
>>>  	}
>>> =20
>>> +	/*
>>> +	 * PCLK clock rate can't be retrieved using CLK API because it
>>> +	 * causes lockup if CPU enters LP2 idle state from some other
>>> +	 * CLK notifier, hence we're caching the rate's value locally.
>>> +	 */
>>> +	if (pmc->clk) {
>>> +		pmc->clk_nb.notifier_call =3D tegra_pmc_clk_notify_cb;
>>> +		err =3D clk_notifier_register(pmc->clk, &pmc->clk_nb);
>>> +		if (err) {
>>> +			dev_err(&pdev->dev,
>>> +				"failed to register clk notifier\n");
>>> +			return err;
>>> +		}
>>> +
>>> +		pmc->rate =3D clk_get_rate(pmc->clk);
>>> +	}
>>> +
>>> +	if (!pmc->rate) {
>>> +		if (pmc->clk)
>>> +			dev_err(&pdev->dev, "failed to get pclk rate\n");
>>> +
>>> +		pmc->rate =3D 100000000;
>>
>> I wonder if we should just let this fail. Or set to 0 so that if the
>> rate is not set we will never suspend or configure the IO pads? I could
>> run some quick tests to see if there are any problems by failing here.
>=20
> Do you mean to fail the PMC driver to probe? I guess that will be fatal
> and system won't be in a useful state, from a user perspective that
> should be equal to a hang on boot with a black screen. On the other
> hand, it seems that failing tegra_io_pad_prepare() should have similar
> fatal result.
>=20
> I'm wondering whether that IO PAD misconfiguration could be harmful. If
> not, then looks like falling back to 100Mhz should be good enough. In
> practice clk_get_rate() shouldn't ever fail unless there is some serious
> bug in clk/. What do you think?

Exactly. I think that if clk_get_rate() is failing then something bad is
happening. I can see if this causes any obvious problems across the
different boards we test, but it would be great to get rid of this
100MHz value (unless Peter knows of a good reason to keep it).

Jon

--=20
nvpublic
