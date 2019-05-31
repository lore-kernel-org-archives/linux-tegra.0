From: Bitan Biswas <bbiswas@nvidia.com>
Subject: Re: [PATCH V1] i2c: busses: tegra: Add suspend-resume support
Date: Fri, 31 May 2019 01:50:29 -0700
Message-ID: <9142282b-ab76-53a0-13ce-c43b8adc575f@nvidia.com>
References: <1559195718-6693-1-git-send-email-bbiswas@nvidia.com>
 <c8bad04b-67ef-bcdf-04df-4aa61271e81c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c8bad04b-67ef-bcdf-04df-4aa61271e81c@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org



On 5/30/19 4:27 AM, Dmitry Osipenko wrote:
> 30.05.2019 8:55, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Post suspend I2C registers have power on reset values. Before any
>> transfer initialize I2C registers to prevent I2C transfer timeout
>> and implement suspend and resume callbacks needed. Fix below errors
>> post suspend:
>>
>> 1) Tegra I2C transfer timeout during jetson tx2 resume:
>>
>> [   27.520613] pca953x 1-0074: calling pca953x_resume+0x0/0x1b0 @ 2939, =
parent: i2c-1
>> [   27.633623] tegra-i2c 3160000.i2c: i2c transfer timed out
>> [   27.639162] pca953x 1-0074: Unable to sync registers 0x3-0x5. -110
>> [   27.645336] pca953x 1-0074: Failed to sync GPIO dir registers: -110
>> [   27.651596] PM: dpm_run_callback(): pca953x_resume+0x0/0x1b0 returns =
-110
>> [   27.658375] pca953x 1-0074: pca953x_resume+0x0/0x1b0 returned -110 af=
ter 127152 usecs
>> [   27.666194] PM: Device 1-0074 failed to resume: error -110
>>
>> 2) Tegra I2C transfer timeout error on jetson Xavier post resume.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-teg=
ra.c
>> index ebaa78d..f6a377f 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -1687,9 +1687,33 @@ static int tegra_i2c_remove(struct platform_devic=
e *pdev)
>>   }
>>  =20
>>   #ifdef CONFIG_PM_SLEEP
>> +static int tegra_i2c_suspend(struct device *dev)
>> +{
>> +	struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdata(dev);
>> +
>> +	i2c_mark_adapter_suspended(&i2c_dev->adapter);
>> +
>> +	return 0;
>> +}
>> +
>> +static int tegra_i2c_resume(struct device *dev)
>> +{
>> +	struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	i2c_lock_bus(&i2c_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
>> +	ret =3D tegra_i2c_init(i2c_dev, false);
>> +	i2c_unlock_bus(&i2c_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
>=20
> Why the locking is needed here?

async resume could result in stress test issues if some client accesses=20
the i2c instance. This ensures the i2c instance is locked till the=20
initialization is complete.

>=20
>> +	if (!ret)
>> +		i2c_mark_adapter_resumed(&i2c_dev->adapter);
>> +
>> +       return ret;
>=20
> A very minor nit.. will be a bit more straightforward to write this as:
>=20
> 	int err;
>=20
> 	err =3D tegra_i2c_init(i2c_dev, false);
> 	if (err)
> 		return err;
>=20
> 	i2c_mark_adapter_resumed(&i2c_dev->adapter);
>=20
> 	return 0;
>=20
> It is always cleaner to return 0 on success.
Thanks. I shall update the section in patch as per this suggestion.

-regards,
  Bitan
