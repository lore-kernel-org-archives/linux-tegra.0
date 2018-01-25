From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v3 4/4] soc/tegra: pmc: apply MBIST work around fo
 Tegra210
Date: Thu, 25 Jan 2018 10:57:36 +0000
Message-ID: <fe422430-cb85-c28d-404b-98e7b87c15e0@nvidia.com>
References: <1516699369-3513-1-git-send-email-pdeschrijver@nvidia.com>
 <1516699369-3513-5-git-send-email-pdeschrijver@nvidia.com>
 <cf919367-4521-25b1-1f80-16e2b660045e@nvidia.com>
 <20180125100625.GL7031@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20180125100625.GL7031@tbergstrom-lnx.Nvidia.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 25/01/18 10:06, Peter De Schrijver wrote:
> On Wed, Jan 24, 2018 at 10:43:45PM +0000, Jon Hunter wrote:
>>
>> On 23/01/18 09:22, Peter De Schrijver wrote:
>>> Apply the memory built-in self test work around when ungating certain
>>> Tegra210 power domains.
>>
>> Nit-pick .. typo in $subject.
>>
>>> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
>>> ---
>>>  drivers/soc/tegra/pmc.c | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>>> index ce62a47..c4eff4b 100644
>>> --- a/drivers/soc/tegra/pmc.c
>>> +++ b/drivers/soc/tegra/pmc.c
>>> @@ -153,6 +153,7 @@ struct tegra_pmc_soc {
>>>  
>>>  	bool has_tsense_reset;
>>>  	bool has_gpu_clamps;
>>> +	bool needs_mbist_war;
>>>  
>>>  	const struct tegra_io_pad_soc *io_pads;
>>>  	unsigned int num_io_pads;
>>> @@ -431,6 +432,9 @@ static int tegra_powergate_power_up(struct tegra_powergate *pg,
>>>  
>>>  	usleep_range(10, 20);
>>>  
>>> +	if (pg->pmc->soc->needs_mbist_war)
>>> +		tegra210_clk_handle_mbist_war(pg->id);
>>> +
>>
>> Be good if we could return an error from the above function.
>>
> 
> We need to also undo whatever we did before then. 

I think it is fine if on error you 'goto disable_clks'.

Cheers
Jon

-- 
nvpublic
