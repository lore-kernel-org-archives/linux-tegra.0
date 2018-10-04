From: Timo Alho <talho@nvidia.com>
Subject: Re: [PATCH] firmware: tegra-bpmp: mark PM function as __maybe_unused
Date: Thu, 4 Oct 2018 18:11:10 +0300
Message-ID: <31707122-ae73-c608-e9f6-c114d6db2b25@nvidia.com>
References: <20181002212208.2971433-1-arnd@arndb.de>
 <64a99db8-85e4-52ab-d0fa-0faa5bb7187a@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <64a99db8-85e4-52ab-d0fa-0faa5bb7187a@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Hunter <jonathanh@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org



On 03.10.2018 11:26, Jonathan Hunter wrote:
> 
> On 02/10/18 22:21, Arnd Bergmann wrote:
>> The newly added tegra_bpmp_resume function is unused when CONFIG_PM
>> is disabled:
>>
>> drivers/firmware/tegra/bpmp.c:847:12: error: 'tegra_bpmp_resume' defined but not used [-Werror=unused-function]
>>   static int tegra_bpmp_resume(struct device *dev)
>>
>> Mark it as __maybe_unused to avoid the warning and let the compiler
>> drop it silently.
>>
>> Fixes: cd40f6ff124c ("firmware: tegra: bpmp: Implement suspend/resume support")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>   drivers/firmware/tegra/bpmp.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
>> index 41448ba78be9..a3d5b518c10e 100644
>> --- a/drivers/firmware/tegra/bpmp.c
>> +++ b/drivers/firmware/tegra/bpmp.c
>> @@ -844,7 +844,7 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
>>   	return err;
>>   }
>>   
>> -static int tegra_bpmp_resume(struct device *dev)
>> +static int __maybe_unused tegra_bpmp_resume(struct device *dev)
>>   {
>>   	struct tegra_bpmp *bpmp = dev_get_drvdata(dev);
>>   	unsigned int i;
> 
> Arnd, is this seen with 32-bit ARM configs?
> 
> Timo, does it make sense to make BPMP dependent on ARCH_TEGRA_186_SOC
> and ARCH_TEGRA_194_SOC instead of just ARCH_TEGRA? For 64-bit Tegra we
> have a dependency on PM so this should not be seen for 64-bit Tegra.

Jon, there will be eventually a BPMP driver for ARCH_TEGRA_210_SOC as 
well. So it is probably more appropriate to make BPMP dependent on ARM64 
& ARCH_TEGRA.

-Timo
