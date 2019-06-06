From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V1] i2c: busses: tegra: Add suspend-resume support
Date: Thu, 6 Jun 2019 14:52:24 +0300
Message-ID: <d5803f1d-0895-08b8-4851-cd8afad830c6@gmail.com>
References: <1559195718-6693-1-git-send-email-bbiswas@nvidia.com>
 <c8bad04b-67ef-bcdf-04df-4aa61271e81c@gmail.com>
 <9142282b-ab76-53a0-13ce-c43b8adc575f@nvidia.com>
 <4f14a218-332c-0263-c6c5-73a13b2446f0@gmail.com>
 <caa17a53-6f29-411b-9a84-58ff019752ff@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <caa17a53-6f29-411b-9a84-58ff019752ff@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bitan Biswas <bbiswas@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

06.06.2019 8:43, Bitan Biswas пишет:
> 
> 
> On 5/31/19 5:43 AM, Dmitry Osipenko wrote:
>> 31.05.2019 11:50, Bitan Biswas пишет:
>>>
>>>
>>> On 5/30/19 4:27 AM, Dmitry Osipenko wrote:
>>>> 30.05.2019 8:55, Bitan Biswas пишет:
>>>>> Post suspend I2C registers have power on reset values. Before any
>>>>> transfer initialize I2C registers to prevent I2C transfer timeout
>>>>> and implement suspend and resume callbacks needed. Fix below errors
>>>>> post suspend:
>>>>>
>>>>> 1) Tegra I2C transfer timeout during jetson tx2 resume:
>>>>>
>>>>> [   27.520613] pca953x 1-0074: calling pca953x_resume+0x0/0x1b0 @
>>>>> 2939, parent: i2c-1
>>>>> [   27.633623] tegra-i2c 3160000.i2c: i2c transfer timed out
>>>>> [   27.639162] pca953x 1-0074: Unable to sync registers 0x3-0x5. -110
>>>>> [   27.645336] pca953x 1-0074: Failed to sync GPIO dir registers: -110
>>>>> [   27.651596] PM: dpm_run_callback(): pca953x_resume+0x0/0x1b0
>>>>> returns -110
>>>>> [   27.658375] pca953x 1-0074: pca953x_resume+0x0/0x1b0 returned -110
>>>>> after 127152 usecs
>>>>> [   27.666194] PM: Device 1-0074 failed to resume: error -110
>>>>>
>>>>> 2) Tegra I2C transfer timeout error on jetson Xavier post resume.
>>>>>
>>>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>>>> ---
>>>>>    drivers/i2c/busses/i2c-tegra.c | 24 ++++++++++++++++++++++++
>>>>>    1 file changed, 24 insertions(+)
>>>>>
>>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c
>>>>> b/drivers/i2c/busses/i2c-tegra.c
>>>>> index ebaa78d..f6a377f 100644
>>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>>> @@ -1687,9 +1687,33 @@ static int tegra_i2c_remove(struct
>>>>> platform_device *pdev)
>>>>>    }
>>>>>      #ifdef CONFIG_PM_SLEEP
>>>>> +static int tegra_i2c_suspend(struct device *dev)
>>>>> +{
>>>>> +    struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>>>>> +
>>>>> +    i2c_mark_adapter_suspended(&i2c_dev->adapter);
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static int tegra_i2c_resume(struct device *dev)
>>>>> +{
>>>>> +    struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>>>>> +    int ret;
>>>>> +
>>>>> +    i2c_lock_bus(&i2c_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
>>>>> +    ret = tegra_i2c_init(i2c_dev, false);
>>>>> +    i2c_unlock_bus(&i2c_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
>>>>
>>>> Why the locking is needed here?
>>>
>>> async resume could result in stress test issues if some client accesses
>>> the i2c instance. This ensures the i2c instance is locked till the
>>> initialization is complete.
>>
>> 1) This doesn't make much sense.. if client could access I2C during of
>> tegra_i2c_init execution, then what stops it to perform the access
>> before the lock is taken?
> Client resumes will start after I2C instance resume because of driver
> dependency. Since lock is the first call in i2c-tegra I believe I2C
> calls of client will not start.

You're incorrectly assuming that client can start resuming in the middle
of the controller's resume process. I2C client's resume won't start
until tegra_i2c_resume() is finished completely. That is because child
drivers are resumed only after theirs parent is ready and this is
guaranteed by the drivers core.
