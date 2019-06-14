From: Bitan Biswas <bbiswas@nvidia.com>
Subject: Re: [PATCH V1 1/2] mailbox: tegra: hsp: add noirq resume
Date: Fri, 14 Jun 2019 09:11:06 -0700
Message-ID: <ff0b9ae6-c964-4eed-3d06-40a11ec72415@nvidia.com>
References: <1560515734-2085-1-git-send-email-bbiswas@nvidia.com>
 <20190614155041.GB26922@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614155041.GB26922@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 6/14/19 8:50 AM, Thierry Reding wrote:
> On Fri, Jun 14, 2019 at 05:35:33AM -0700, Bitan Biswas wrote:
>> Add noirq resume instead of resume callback for Tegra HSP. Tegra HSP
>> resume needs tegra_hsp_doorbell_startup() call to fix timeout error for
>> tegra_bpmp_transfer() during genpd resume noirq on jetson-tx2.
> 
> s/jetson-tx2/Jetson TX2/?
I shall replace the string "jetson-tx2" in commit description with 
"Jetson TX2".

> 
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>   drivers/mailbox/tegra-hsp.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
>> index 91f1a0c..f147374 100644
>> --- a/drivers/mailbox/tegra-hsp.c
>> +++ b/drivers/mailbox/tegra-hsp.c
>> @@ -771,10 +771,16 @@ static int tegra_hsp_probe(struct platform_device *pdev)
>>   	return 0;
>>   }
>>   
>> -static int __maybe_unused tegra_hsp_resume(struct device *dev)
>> +static int __maybe_unused tegra_hsp_noirq_resume(struct device *dev)
> 
> Maybe call this tegra_hsp_resume_noirq() to match the naming of the
> dev_pm_ops callback?
I shall rename tegra_hsp_noirq_resume back to tegra_hsp_resume.

> 
>>   {
>>   	struct tegra_hsp *hsp = dev_get_drvdata(dev);
>>   	unsigned int i;
>> +	struct tegra_hsp_doorbell *db;
>> +
>> +	list_for_each_entry(db, &hsp->doorbells, list) {
>> +		if (db && db->channel.chan)
>> +			tegra_hsp_doorbell_startup(db->channel.chan);
>> +	}
>>   
>>   	for (i = 0; i < hsp->num_sm; i++) {
>>   		struct tegra_hsp_mailbox *mb = &hsp->mailboxes[i];
>> @@ -786,7 +792,9 @@ static int __maybe_unused tegra_hsp_resume(struct device *dev)
>>   	return 0;
>>   }
>>   
>> -static SIMPLE_DEV_PM_OPS(tegra_hsp_pm_ops, NULL, tegra_hsp_resume);
>> +static const struct dev_pm_ops tegra_hsp_pm_ops = {
>> +	.resume_noirq   = tegra_hsp_noirq_resume,
> 
> There seems to be two extra spaces before that =.
Missed extra spaces. Shall fix.

-Thanks,
  Bitan
