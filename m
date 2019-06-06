From: Bitan Biswas <bbiswas@nvidia.com>
Subject: Re: [PATCH V1] i2c: busses: tegra: Add suspend-resume support
Date: Wed, 5 Jun 2019 22:43:36 -0700
Message-ID: <caa17a53-6f29-411b-9a84-58ff019752ff@nvidia.com>
References: <1559195718-6693-1-git-send-email-bbiswas@nvidia.com>
 <c8bad04b-67ef-bcdf-04df-4aa61271e81c@gmail.com>
 <9142282b-ab76-53a0-13ce-c43b8adc575f@nvidia.com>
 <4f14a218-332c-0263-c6c5-73a13b2446f0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4f14a218-332c-0263-c6c5-73a13b2446f0@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org



On 5/31/19 5:43 AM, Dmitry Osipenko wrote:
> 31.05.2019 11:50, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>>
>> On 5/30/19 4:27 AM, Dmitry Osipenko wrote:
>>> 30.05.2019 8:55, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> Post suspend I2C registers have power on reset values. Before any
>>>> transfer initialize I2C registers to prevent I2C transfer timeout
>>>> and implement suspend and resume callbacks needed. Fix below errors
>>>> post suspend:
>>>>
>>>> 1) Tegra I2C transfer timeout during jetson tx2 resume:
>>>>
>>>> [=C2=A0=C2=A0 27.520613] pca953x 1-0074: calling pca953x_resume+0x0/0x=
1b0 @
>>>> 2939, parent: i2c-1
>>>> [=C2=A0=C2=A0 27.633623] tegra-i2c 3160000.i2c: i2c transfer timed out
>>>> [=C2=A0=C2=A0 27.639162] pca953x 1-0074: Unable to sync registers 0x3-=
0x5. -110
>>>> [=C2=A0=C2=A0 27.645336] pca953x 1-0074: Failed to sync GPIO dir regis=
ters: -110
>>>> [=C2=A0=C2=A0 27.651596] PM: dpm_run_callback(): pca953x_resume+0x0/0x=
1b0
>>>> returns -110
>>>> [=C2=A0=C2=A0 27.658375] pca953x 1-0074: pca953x_resume+0x0/0x1b0 retu=
rned -110
>>>> after 127152 usecs
>>>> [=C2=A0=C2=A0 27.666194] PM: Device 1-0074 failed to resume: error -11=
0
>>>>
>>>> 2) Tegra I2C transfer timeout error on jetson Xavier post resume.
>>>>
>>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>>> ---
>>>>  =C2=A0 drivers/i2c/busses/i2c-tegra.c | 24 ++++++++++++++++++++++++
>>>>  =C2=A0 1 file changed, 24 insertions(+)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c
>>>> b/drivers/i2c/busses/i2c-tegra.c
>>>> index ebaa78d..f6a377f 100644
>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>> @@ -1687,9 +1687,33 @@ static int tegra_i2c_remove(struct
>>>> platform_device *pdev)
>>>>  =C2=A0 }
>>>>  =C2=A0 =C2=A0 #ifdef CONFIG_PM_SLEEP
>>>> +static int tegra_i2c_suspend(struct device *dev)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdata(=
dev);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 i2c_mark_adapter_suspended(&i2c_dev->adapter);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>> +}
>>>> +
>>>> +static int tegra_i2c_resume(struct device *dev)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdata(=
dev);
>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 i2c_lock_bus(&i2c_dev->adapter, I2C_LOCK_ROOT_ADAP=
TER);
>>>> +=C2=A0=C2=A0=C2=A0 ret =3D tegra_i2c_init(i2c_dev, false);
>>>> +=C2=A0=C2=A0=C2=A0 i2c_unlock_bus(&i2c_dev->adapter, I2C_LOCK_ROOT_AD=
APTER);
>>>
>>> Why the locking is needed here?
>>
>> async resume could result in stress test issues if some client accesses
>> the i2c instance. This ensures the i2c instance is locked till the
>> initialization is complete.
>=20
> 1) This doesn't make much sense.. if client could access I2C during of
> tegra_i2c_init execution, then what stops it to perform the access
> before the lock is taken?
Client resumes will start after I2C instance resume because of driver=20
dependency. Since lock is the first call in i2c-tegra I believe I2C=20
calls of client will not start.

>=20
> 2) The whole point of the i2c_mark_adapter_* API is to catch those
> faulty clients that have a broken suspend-resume sequence. Client will
> get a -ESHUTDOWN on trying to issue I2C transfer while controller is
> marked as suspended.
i2c lock bus calls were used in the resume callback implementation that=20
was reverted few months back. Hence, these were added in this patch=20
which should be more like a revert-of-revert .

But I feel probably your point also makes sense. Old resume callback did=20
not have i2c_mark_adapter_* calls. Based on the i2c_adapter_mark_* API=20
documentation it should be taking care that core i2c calls from client=20
are not started. I plan to update the patch and remove the lock-unlock=20
guards in resume callback.


>=20
> 3) Please don't use async suspend-resume where it doesn't make sense.
This is a system wide setting. /sys/power/pm_async by default is 1 and=20
there is no driver specific change in this patch to choose async=20
suspend-resume.

>=20
> Corollary: you should drop the locking because it doesn't do anything
> useful.
>=20
I did some basic suspend resume tests and do not see any problems=20
removing the i2c_lock_bus call you pointed out.

-Thanks,
  Bitan
