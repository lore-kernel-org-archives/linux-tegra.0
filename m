From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 3/3] i2c: tegra: Fix suspending in active runtime PM
 state
Date: Fri, 13 Dec 2019 17:04:20 +0300
Message-ID: <3c2b16c0-3e66-d809-b263-f27cf925e203@gmail.com>
References: <20191212233428.14648-1-digetx@gmail.com>
 <20191212233428.14648-4-digetx@gmail.com> <20191213134746.GA222809@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191213134746.GA222809@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Mikko Perttunen <cyndis@kapsi.fi>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

13.12.2019 16:47, Thierry Reding пишет:
> On Fri, Dec 13, 2019 at 02:34:28AM +0300, Dmitry Osipenko wrote:
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
> 
> I've recently discussed this with Rafael in the context of runtime PM
> support in the Tegra DRM driver and my understanding is that you're not
> supposed to force runtime PM suspension like this.
> 
> I had meant to send out an alternative patch to fix this, which I've
> done now:
> 
> 	http://patchwork.ozlabs.org/patch/1209148/
> 
> That's more in line with what Rafael and I had discussed in the other
> thread and should address the issue that you're seeing as well.

Well, either me or you are still having some misunderstanding of the
runtime PM :) To my knowledge there are a lot of drivers that enforce
suspension of the runtime PM during system's suspend, it should be a
right thing to do especially in a context of the Tegra I2C driver
because we're using asynchronous pm_runtime_put() and thus at the time
of system's suspending, the runtime PM could be ON (as I wrote in the
commit message) and then Terga's I2C driver manually disables the clock
on resume (woopsie).

By invoking pm_runtime_force_suspend() on systems's suspend, the runtime
PM executes tegra_i2c_runtime_suspend() if device is in active state. On
system resume, pm_runtime_force_resume() either keeps device in a
suspended state or resumes it, say if for userspace disabled the runtime
PM for the I2C controller.

Rafael, could you please clarify whether my patch is doing a wrong thing?

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
>>  
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
>> -- 
>> 2.24.0
>>
