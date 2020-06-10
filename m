From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [RFC PATCH v1 05/18] i2c: tegra: Fix runtime resume to re-init VI
 I2C
Date: Wed, 10 Jun 2020 09:58:28 -0700
Message-ID: <dc310c94-ae8d-fcf5-be9f-6236f3615dd7@nvidia.com>
References: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
 <1591768960-31648-6-git-send-email-skomatineni@nvidia.com>
 <fcced8cd-d80d-b09c-b657-cb413ec418f9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <fcced8cd-d80d-b09c-b657-cb413ec418f9@gmail.com>
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc: sboyd@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 6/10/20 6:14 AM, Dmitry Osipenko wrote:
> 10.06.2020 09:02, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> VI I2C is on host1x bus and is part of VE power domain.
>>
>> During suspend/resume VE power domain goes through power off/on.
>>
>> So, controller reset followed by i2c re-initialization is required
>> after the domain power up.
>>
>> This patch fixes it.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-teg=
ra.c
>> index dba38a5..650240d 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -293,6 +293,8 @@ struct tegra_i2c_dev {
>>   	bool is_curr_atomic_xfer;
>>   };
>>  =20
>> +static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reini=
t);
>> +
>>   static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
>>   		       unsigned long reg)
>>   {
>> @@ -679,8 +681,22 @@ static int __maybe_unused tegra_i2c_runtime_resume(=
struct device *dev)
>>   		goto disable_slow_clk;
>>   	}
>>  =20
>> +	/*
>> +	 * VI I2C device is attached to VE power domain which goes through
>> +	 * power ON/OFF during PM runtime resume/suspend. So, controller
>> +	 * should go through reset and need to re-initialize after power
>> +	 * domain ON.
>> +	 */
>> +	if (i2c_dev->is_vi) {
>> +		ret =3D tegra_i2c_init(i2c_dev, true);
>> +		if (ret)
>> +			goto disable_div_clk;
>> +	}
>> +
>>   	return 0;
>>  =20
>> +disable_div_clk:
>> +	clk_disable(i2c_dev->div_clk);
>>   disable_slow_clk:
>>   	if (i2c_dev->slow_clk)
>>   		clk_disable(i2c_dev->slow_clk);
>>
> The clk_disable() can cope with a NULL argument. Won't it be cleaner to
> remove the conditions?
will remove in v2
