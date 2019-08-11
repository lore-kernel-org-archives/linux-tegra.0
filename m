From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v8 13/21] clk: tegra210: Use fence_udelay during PLLU init
Date: Sun, 11 Aug 2019 12:16:49 -0700
Message-ID: <af4dce78-5561-7078-1da7-cef01f187cf3@nvidia.com>
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
 <1565308020-31952-14-git-send-email-skomatineni@nvidia.com>
 <1d09a2c5-4973-340f-fdfc-d4e665c8b55d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1d09a2c5-4973-340f-fdfc-d4e665c8b55d@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 8/11/19 11:02 AM, Dmitry Osipenko wrote:
> 09.08.2019 2:46, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> This patch uses fence_udelay rather than udelay during PLLU
>> initialization to ensure writes to clock registers happens before
>> waiting for specified delay.
>>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/clk/tegra/clk-tegra210.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-te=
gra210.c
>> index 4721ee030d1c..998bf60b219a 100644
>> --- a/drivers/clk/tegra/clk-tegra210.c
>> +++ b/drivers/clk/tegra/clk-tegra210.c
>> @@ -2841,7 +2841,7 @@ static int tegra210_enable_pllu(void)
>>   	reg =3D readl_relaxed(clk_base + pllu.params->ext_misc_reg[0]);
>>   	reg &=3D ~BIT(pllu.params->iddq_bit_idx);
>>   	writel_relaxed(reg, clk_base + pllu.params->ext_misc_reg[0]);
>> -	udelay(5);
>> +	fence_udelay(5, clk_base);
>>  =20
>>   	reg =3D readl_relaxed(clk_base + PLLU_BASE);
>>   	reg &=3D ~GENMASK(20, 0);
>> @@ -2849,7 +2849,7 @@ static int tegra210_enable_pllu(void)
>>   	reg |=3D fentry->n << 8;
>>   	reg |=3D fentry->p << 16;
>>   	writel(reg, clk_base + PLLU_BASE);
>> -	udelay(1);
>> +	fence_udelay(1, clk_base);
>>   	reg |=3D PLL_ENABLE;
>>   	writel(reg, clk_base + PLLU_BASE);
>>  =20
>> @@ -2895,12 +2895,12 @@ static int tegra210_init_pllu(void)
>>   		reg =3D readl_relaxed(clk_base + XUSB_PLL_CFG0);
>>   		reg &=3D ~XUSB_PLL_CFG0_PLLU_LOCK_DLY_MASK;
>>   		writel_relaxed(reg, clk_base + XUSB_PLL_CFG0);
>> -		udelay(1);
>> +		fence_udelay(1, clk_base);
>>  =20
>>   		reg =3D readl_relaxed(clk_base + PLLU_HW_PWRDN_CFG0);
>>   		reg |=3D PLLU_HW_PWRDN_CFG0_SEQ_ENABLE;
>>   		writel_relaxed(reg, clk_base + PLLU_HW_PWRDN_CFG0);
>> -		udelay(1);
>> +		fence_udelay(1, clk_base);
>>  =20
>>   		reg =3D readl_relaxed(clk_base + PLLU_BASE);
>>   		reg &=3D ~PLLU_BASE_CLKENABLE_USB;
>>
> The clk_base corresponds to the RESET controller's part of Clock-and-Rese=
t hardware, is it
> okay to read-back the RST register and not the clock for the fencing?
Yes as both reset and clocks are all in same CAR
