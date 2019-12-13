From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 3/3] i2c: tegra: Fix suspending in active runtime PM
 state
Date: Fri, 13 Dec 2019 17:55:11 +0300
Message-ID: <ec7e11f6-2695-29c8-c9ed-98dc229b8aac@gmail.com>
References: <20191212233428.14648-1-digetx@gmail.com>
 <20191212233428.14648-4-digetx@gmail.com>
 <ae96db3a-0854-6e80-0469-e5fa6fd7bb8e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ae96db3a-0854-6e80-0469-e5fa6fd7bb8e@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>
List-Id: linux-tegra@vger.kernel.org

13.12.2019 17:29, Dmitry Osipenko пишет:
> 13.12.2019 02:34, Dmitry Osipenko пишет:
>> I noticed that sometime I2C clock is kept enabled during suspend-resume.
>> This happens because runtime PM defers dynamic suspension and thus it may
>> happen that runtime PM is in active state when system enters into suspend.
>> In particular I2C controller that is used for CPU's DVFS is often kept ON
>> during suspend because CPU's voltage scaling happens quite often.
>>
>> Note: we marked runtime PM as IRQ-safe during the driver's probe in the
>> "Support atomic transfers" patch, thus it's okay to enforce runtime PM
>> suspend/resume in the NOIRQ phase which is used for the system-level
>> suspend/resume of the driver.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-tegra.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index b3ecdd87e91f..d309a314f4d6 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -1790,9 +1790,14 @@ static int tegra_i2c_remove(struct platform_device *pdev)
>>  static int __maybe_unused tegra_i2c_suspend(struct device *dev)
>>  {
>>  	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>> +	int err;
>>  
>>  	i2c_mark_adapter_suspended(&i2c_dev->adapter);
> 
> I'm now in a doubt that it is correct to use NOIRQ level at all for the
> suspend because i2c_mark_adapter_suspended() uses mutex, thus I'm
> wondering what will happen if there is an asynchronous transfer
> happening during suspend..
> 
> The i2c_mark_adapter_suspended() will try to block and will never return?

Moreover, the I2C interrupt should be disabled during the NOIRQ phase.
So, yes.. looks like making use of NOIRQ level wasn't a correct
decision. On the other hand, I don't think that any I2C client driver
used by Tegra SoCs in the upstream kernel could cause the problem at the
moment, so it shouldn't be critical.

BTW: Jon, please CC me next time ;) [I'll try to find a better solution
for the PCIE problem]

>> +	err = pm_runtime_force_suspend(dev);
>> +	if (err < 0)
>> +		return err;
>> +
>>  	return 0;
>>  }
>>  
>> @@ -1813,6 +1818,10 @@ static int __maybe_unused tegra_i2c_resume(struct device *dev)
>>  	if (err)
>>  		return err;
>>  
>> +	err = pm_runtime_force_resume(dev);
>> +	if (err < 0)
>> +		return err;
>> +
>>  	i2c_mark_adapter_resumed(&i2c_dev->adapter);
>>  
>>  	return 0;
>>
> 
