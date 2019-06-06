From: Bitan Biswas <bbiswas@nvidia.com>
Subject: Re: [PATCH V1] i2c: busses: tegra: Add suspend-resume support
Date: Thu, 6 Jun 2019 06:55:44 -0700
Message-ID: <c88b736e-47e0-43ca-b859-900936f94715@nvidia.com>
References: <1559195718-6693-1-git-send-email-bbiswas@nvidia.com>
 <c8bad04b-67ef-bcdf-04df-4aa61271e81c@gmail.com>
 <9142282b-ab76-53a0-13ce-c43b8adc575f@nvidia.com>
 <4f14a218-332c-0263-c6c5-73a13b2446f0@gmail.com>
 <caa17a53-6f29-411b-9a84-58ff019752ff@nvidia.com>
 <d5803f1d-0895-08b8-4851-cd8afad830c6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d5803f1d-0895-08b8-4851-cd8afad830c6@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org



On 6/6/19 4:52 AM, Dmitry Osipenko wrote:
> 06.06.2019 8:43, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>>
>> On 5/31/19 5:43 AM, Dmitry Osipenko wrote:
>>> 31.05.2019 11:50, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>
>>>>
>>>> On 5/30/19 4:27 AM, Dmitry Osipenko wrote:
>>>>> 30.05.2019 8:55, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>> Post suspend I2C registers have power on reset values. Before any
>>>>>> transfer initialize I2C registers to prevent I2C transfer timeout
>>>>>> and implement suspend and resume callbacks needed. Fix below errors
>>>>>> post suspend:
>>>>>>
>>>>>> 1) Tegra I2C transfer timeout during jetson tx2 resume:
>>>>>>
>>>>>> [=C2=A0=C2=A0 27.520613] pca953x 1-0074: calling pca953x_resume+0x0/=
0x1b0 @
>>>>>> 2939, parent: i2c-1
>>>>>> [=C2=A0=C2=A0 27.633623] tegra-i2c 3160000.i2c: i2c transfer timed o=
ut
>>>>>> [=C2=A0=C2=A0 27.639162] pca953x 1-0074: Unable to sync registers 0x=
3-0x5. -110
>>>>>> [=C2=A0=C2=A0 27.645336] pca953x 1-0074: Failed to sync GPIO dir reg=
isters: -110
>>>>>> [=C2=A0=C2=A0 27.651596] PM: dpm_run_callback(): pca953x_resume+0x0/=
0x1b0
>>>>>> returns -110
>>>>>> [=C2=A0=C2=A0 27.658375] pca953x 1-0074: pca953x_resume+0x0/0x1b0 re=
turned -110
>>>>>> after 127152 usecs
>>>>>> [=C2=A0=C2=A0 27.666194] PM: Device 1-0074 failed to resume: error -=
110
>>>>>>
>>>>>> 2) Tegra I2C transfer timeout error on jetson Xavier post resume.
>>>>>>
>>>>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>>>>> ---
>>>>>>  =C2=A0=C2=A0 drivers/i2c/busses/i2c-tegra.c | 24 ++++++++++++++++++=
++++++
>>>>>>  =C2=A0=C2=A0 1 file changed, 24 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c
>>>>>> b/drivers/i2c/busses/i2c-tegra.c
>>>>>> index ebaa78d..f6a377f 100644
>>>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>>>> @@ -1687,9 +1687,33 @@ static int tegra_i2c_remove(struct
>>>>>> platform_device *pdev)
>>>>>>  =C2=A0=C2=A0 }
>>>>>>  =C2=A0=C2=A0 =C2=A0 #ifdef CONFIG_PM_SLEEP
>>>>>> +static int tegra_i2c_suspend(struct device *dev)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdat=
a(dev);
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 i2c_mark_adapter_suspended(&i2c_dev->adapter);
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static int tegra_i2c_resume(struct device *dev)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdat=
a(dev);
>>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 i2c_lock_bus(&i2c_dev->adapter, I2C_LOCK_ROOT_AD=
APTER);
>>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D tegra_i2c_init(i2c_dev, false);
>>>>>> +=C2=A0=C2=A0=C2=A0 i2c_unlock_bus(&i2c_dev->adapter, I2C_LOCK_ROOT_=
ADAPTER);
>>>>>
>>>>> Why the locking is needed here?
>>>>
>>>> async resume could result in stress test issues if some client accesse=
s
>>>> the i2c instance. This ensures the i2c instance is locked till the
>>>> initialization is complete.
>>>
>>> 1) This doesn't make much sense.. if client could access I2C during of
>>> tegra_i2c_init execution, then what stops it to perform the access
>>> before the lock is taken?
>> Client resumes will start after I2C instance resume because of driver
>> dependency. Since lock is the first call in i2c-tegra I believe I2C
>> calls of client will not start.
>=20
> You're incorrectly assuming that client can start resuming in the middle
> of the controller's resume process. I2C client's resume won't start
> until tegra_i2c_resume() is finished completely. That is because child
> drivers are resumed only after theirs parent is ready and this is
> guaranteed by the drivers core.
>=20
Agreed.

-regards,
  Bitan
