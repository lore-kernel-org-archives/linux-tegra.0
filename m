From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] drivers/thermal/tegra: fix a doule free devce node
Date: Mon, 13 Aug 2018 19:35:53 +0100
Message-ID: <88fb9427-9f3d-3ddb-c4cc-00b6e4de76ce@nvidia.com>
References: <1533822056-33930-1-git-send-email-zhongjiang@huawei.com>
 <312fcf2a-ab47-9aa4-3b1f-bca5f6a4d58c@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <312fcf2a-ab47-9aa4-3b1f-bca5f6a4d58c@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: zhong jiang <zhongjiang@huawei.com>, ezequiel@collabora.com, daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, edubezval@gmail.com, linux-kernel@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Adding linux-tegra ...

On 13/08/18 19:30, Jon Hunter wrote:
> 
> On 09/08/18 14:40, zhong jiang wrote:
>> Device node iterators will get the return node. Meawhile, It is
>> also put the previous device node. An explicit put will cause
>> a double put.
>>
>> Signed-off-by: zhong jiang <zhongjiang@huawei.com>
>> ---
>>  drivers/thermal/tegra/soctherm.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
>> index ed28110..3aa55c9 100644
>> --- a/drivers/thermal/tegra/soctherm.c
>> +++ b/drivers/thermal/tegra/soctherm.c
>> @@ -980,7 +980,6 @@ static void soctherm_init_hw_throt_cdev(struct platform_device *pdev)
>>  		tcd = thermal_of_cooling_device_register(np_stcc,
>>  							 (char *)name, ts,
>>  							 &throt_cooling_ops);
>> -		of_node_put(np_stcc);
>>  		if (IS_ERR_OR_NULL(tcd)) {
>>  			dev_err(dev,
>>  				"throttle-cfg: %s: failed to register cooling device\n",
>>
> 
> Thanks!
> 
> Acked-by: Jon Hunter <jonathanh@nvidia.com>

Just need to fix the typos in the subject and commit log.

Cheers
Jon

-- 
nvpublic
