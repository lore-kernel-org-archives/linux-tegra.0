From: Wei Ni <wni@nvidia.com>
Subject: Re: [PATCH v1 4/4] thermal: tegra: fix coverity defect
Date: Fri, 9 Nov 2018 14:44:01 +0800
Message-ID: <fea5b5d3-83f0-17b3-9d2d-1f2b7a266b4f@nvidia.com>
References: <1541410354-19090-1-git-send-email-wni@nvidia.com>
 <1541410354-19090-5-git-send-email-wni@nvidia.com>
 <20181108123709.GC1340@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181108123709.GC1340@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org, rui.zhang@intel.com, edubezval@gmail.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 8/11/2018 8:37 PM, Thierry Reding wrote:
> On Mon, Nov 05, 2018 at 05:32:34PM +0800, Wei Ni wrote:
>> Fix dereference dev before null check.
>>
>> Signed-off-by: Wei Ni <wni@nvidia.com>
>> ---
>>  drivers/thermal/tegra/soctherm.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
>> index 3042837364e8..96527df91f2a 100644
>> --- a/drivers/thermal/tegra/soctherm.c
>> +++ b/drivers/thermal/tegra/soctherm.c
>> @@ -397,7 +397,7 @@ static int throttrip_program(struct device *dev,
>>  			     struct soctherm_throt_cfg *stc,
>>  			     int trip_temp)
>>  {
>> -	struct tegra_soctherm *ts = dev_get_drvdata(dev);
>> +	struct tegra_soctherm *ts;
>>  	int temp, cpu_throt, gpu_throt;
>>  	unsigned int throt;
>>  	u32 r, reg_off;
>> @@ -405,6 +405,8 @@ static int throttrip_program(struct device *dev,
>>  	if (!sg || !stc || !stc->init)
>>  		return -EINVAL;
>>  
>> +	ts = dev_get_drvdata(dev);
> 
> I think coverity is wrong. How is dev ever going to be NULL in this
> case? We allocate all of these struct tegra_thermctl_zone structures in
> tegra_soctherm_probe() and assign zone->dev = &pdev->dev, which can
> never be NULL.
> 
> And even if it could, the code would've crashed earlier in
> tegra_soctherm_probe() already.
> 
> Furthermore, I fail to see how your patch would fix the defect. None of
> the checks in the conditional above actually check the dev value.
> 
Yes, you are right, we doesn't need this change. The driver would not
pass null dev in any case.
And this driver already had a change "1fba81cc09bd thermal: tegra:
remove null check for dev pointer" which remove this "dev" checking.

Thank.
Wei.

> Thierry
> 
