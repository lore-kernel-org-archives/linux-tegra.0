From: Bitan Biswas <bbiswas@nvidia.com>
Subject: Re: [PATCH V1] firmware: tegra: early resume bpmp
Date: Fri, 14 Jun 2019 09:40:48 -0700
Message-ID: <577c405d-249b-00ce-221e-bff7cc9ed8b7@nvidia.com>
References: <1560515499-1015-1-git-send-email-bbiswas@nvidia.com>
 <20190614154827.GA26922@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614154827.GA26922@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Timo Alho <talho@nvidia.com>, Sivaram Nair <sivaramn@nvidia.com>, Allison Randal <allison@lohutok.net>, Thomas Gleixner <tglx@linutronix.de>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 6/14/19 8:48 AM, Thierry Reding wrote:
> On Fri, Jun 14, 2019 at 05:31:39AM -0700, Bitan Biswas wrote:
>> Early resume Tegra bpmp to fix Xavier clock rate error as follows:
>> [  159.017101] of_serial 3110000.serial: calling platform_pm_resume+0x0/0x58 @ 317, parent: cbb
>> [  159.025501] of_serial 3110000.serial: platform_pm_resume+0x0/0x58 returned 0 after 14 usecs
>> [  159.033694] tegra-i2c 31c0000.i2c: calling platform_pm_resume+0x0/0x58 @ 317, parent: cbb
>> [  159.042254] tegra-i2c 31c0000.i2c: failed changing clock rate: -22
>> [  159.048216] PM: dpm_run_callback(): platform_pm_resume+0x0/0x58 returns -22
>> [  159.055553] tegra-i2c 31c0000.i2c: platform_pm_resume+0x0/0x58 returned -22 after 13072 usecs
>> [  159.063875] PM: Device 31c0000.i2c failed to resume: error -22
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>   drivers/firmware/tegra/bpmp.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
>> index dd775e8..de09036 100644
>> --- a/drivers/firmware/tegra/bpmp.c
>> +++ b/drivers/firmware/tegra/bpmp.c
>> @@ -811,7 +811,9 @@ static int __maybe_unused tegra_bpmp_resume(struct device *dev)
>>   		return 0;
>>   }
>>   
>> -static SIMPLE_DEV_PM_OPS(tegra_bpmp_pm_ops, NULL, tegra_bpmp_resume);
>> +const struct dev_pm_ops tegra_bpmp_pm_ops = {
>> +	.resume_early = tegra_bpmp_resume
>> +};
> 
> I've changed this to be static while applying to for-5.3/firmware.
Is this patch already part of some other patch? In that case I can 
abandon the patch.

Else, I shall add static keyword.


-regards,
  Bitan
