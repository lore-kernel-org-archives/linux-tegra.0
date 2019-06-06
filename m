From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V2] i2c: busses: tegra: Add suspend-resume support
Date: Thu, 6 Jun 2019 18:34:55 +0300
Message-ID: <3d4ea007-e289-6b52-5321-68a7399e62d7@gmail.com>
References: <1559800475-5446-1-git-send-email-bbiswas@nvidia.com>
 <bf93e88f-cbed-3bb0-223a-74ad0b08aa9e@gmail.com>
 <5871f51b-11d4-8bc9-6f40-4a91f2aab8f8@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5871f51b-11d4-8bc9-6f40-4a91f2aab8f8@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bitan Biswas <bbiswas@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

06.06.2019 16:58, Bitan Biswas пишет:
> 
> 
> On 6/6/19 5:06 AM, Dmitry Osipenko wrote:
>> 06.06.2019 8:54, Bitan Biswas пишет:
>>> Post suspend I2C registers have power on reset values. Before any
>>> transfer initialize I2C registers to prevent I2C transfer timeout
>>> and implement suspend and resume callbacks needed. Fix below errors
>>> post suspend:
>>>
>>> 1) Tegra I2C transfer timeout during jetson tx2 resume:
>>>
>>> [   27.520613] pca953x 1-0074: calling pca953x_resume+0x0/0x1b0 @
>>> 2939, parent: i2c-1
>>> [   27.633623] tegra-i2c 3160000.i2c: i2c transfer timed out
>>> [   27.639162] pca953x 1-0074: Unable to sync registers 0x3-0x5. -110
>>> [   27.645336] pca953x 1-0074: Failed to sync GPIO dir registers: -110
>>> [   27.651596] PM: dpm_run_callback(): pca953x_resume+0x0/0x1b0
>>> returns -110
>>> [   27.658375] pca953x 1-0074: pca953x_resume+0x0/0x1b0 returned -110
>>> after 127152 usecs
>>> [   27.666194] PM: Device 1-0074 failed to resume: error -110
>>>
>>> 2) Tegra I2C transfer timeout error on jetson Xavier post resume.
>>>
>>> Remove i2c bus lock-unlock calls in resume callback as
>>> i2c_mark_adapter_*
>>> (suspended-resumed) help ensure i2c core calls from client are not
>>> executed before i2c-tegra resume.
>>>
>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>> ---
>>>   drivers/i2c/busses/i2c-tegra.c | 23 +++++++++++++++++++++++
>>>   1 file changed, 23 insertions(+)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-tegra.c
>>> b/drivers/i2c/busses/i2c-tegra.c
>>> index ebaa78d..76b7926 100644
>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>> @@ -1687,7 +1687,30 @@ static int tegra_i2c_remove(struct
>>> platform_device *pdev)
>>>   }
>>>     #ifdef CONFIG_PM_SLEEP
>>> +static int tegra_i2c_suspend(struct device *dev)
>>> +{
>>> +    struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>>> +
>>> +    i2c_mark_adapter_suspended(&i2c_dev->adapter);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int tegra_i2c_resume(struct device *dev)
>>> +{
>>> +    struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>>> +    int ret;
>>> +
>>> +    ret = tegra_i2c_init(i2c_dev, false);
>>> +    if (ret)
>>> +        return ret;
>>
>> We're expecting that tegra_i2c_init returns a error code on a failure
>> and nothing else, hence it will be a bit more expressive to name the
>> returned variable as "err". There is nothing wrong with yours variant,
>> this is just a very minor recommendation from me. Please note that a bit
>> more wise choice of the names makes easier to follow the code for other
>> people and hence results in a cleaner code.
> Agreed.
> 
>>
>>> +
>>> +    i2c_mark_adapter_resumed(&i2c_dev->adapter);
>>
>> Please add a blank line here for a better readability and to make the
>> patch consistent. You added the blank line in a similar case of
>> tegra_i2c_suspend() and this makes it inconsistent.
>>
> OK.
> 
>>> +    return 0;
>>> +}
>>> +
>>>   static const struct dev_pm_ops tegra_i2c_pm = {
>>> +    SET_SYSTEM_SLEEP_PM_OPS(tegra_i2c_suspend, tegra_i2c_resume)
>>>       SET_RUNTIME_PM_OPS(tegra_i2c_runtime_suspend,
>>> tegra_i2c_runtime_resume,
>>>                  NULL)
>>>   };
>>>
> I shall send updated patch with suggested changes.

Yes, please.
