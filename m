From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 4/4] soc/tegra: pmc: apply MBIST work around fo
 Tegra210
Date: Thu, 21 Dec 2017 11:08:07 +0000
Message-ID: <dcd2616f-a4e2-a797-97d0-e1dc4379bf0a@nvidia.com>
References: <1510842542-16451-1-git-send-email-pdeschrijver@nvidia.com>
 <1510842542-16451-5-git-send-email-pdeschrijver@nvidia.com>
 <678c0758-fa91-6819-ae21-3ae1015279c1@nvidia.com>
 <20171221090537.GU29417@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20171221090537.GU29417@tbergstrom-lnx.Nvidia.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 21/12/17 09:05, Peter De Schrijver wrote:
> On Wed, Dec 20, 2017 at 10:06:13AM +0000, Jon Hunter wrote:
>>
>> On 16/11/17 14:29, Peter De Schrijver wrote:
>>> Apply the memory built-in self test work around when ungating certain
>>> Tegra210 power domains.
>>>
>>> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
>>> ---
>>>  drivers/soc/tegra/pmc.c | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>>> index 0453ff6..4c0582d 100644
>>> --- a/drivers/soc/tegra/pmc.c
>>> +++ b/drivers/soc/tegra/pmc.c
>>> @@ -142,6 +142,7 @@ struct tegra_pmc_soc {
>>>  
>>>  	bool has_tsense_reset;
>>>  	bool has_gpu_clamps;
>>> +	bool needs_mbist_war;
>>>  
>>>  	const struct tegra_io_pad_soc *io_pads;
>>>  	unsigned int num_io_pads;
>>> @@ -411,6 +412,9 @@ static int tegra_powergate_power_up(struct tegra_powergate *pg,
>>>  
>>>  	usleep_range(10, 20);
>>>  
>>> +	if (pg->pmc->soc->needs_mbist_war)
>>> +		tegra210_handle_mbist_war(pg->id);
>>> +
>>>  	if (disable_clocks)
>>>  		tegra_powergate_disable_clocks(pg);
>>>  
>>> @@ -1712,6 +1716,7 @@ static int tegra_pmc_resume(struct device *dev)
>>>  	.cpu_powergates = tegra210_cpu_powergates,
>>>  	.has_tsense_reset = true,
>>>  	.has_gpu_clamps = true,
>>> +	.needs_mbist_war = true,
>>>  	.num_io_pads = ARRAY_SIZE(tegra210_io_pads),
>>>  	.io_pads = tegra210_io_pads,
>>>  };
>>
>> After applying this series, tegra210-smaug no longer boots (no output
>> from the console). Reverting this patch allows it to boot again. So
>> something here is not working ...
>>
> 
> Annoyingly I don't have smaug, only jetson TX1.. Did you try earlycon?

I can take a look, but one difference between TX1 and Smaug is that for
TX1 if believe all power domains are enabled by default whereas for
Smaug they are not. There is a workaround in the pmc driver to turn on
the XUSB power domain if it is off and the xHCI driver is enabled (we
plan to remove this when we figure out how to properly manage the XUSB
powergates). So you could try manually disabling the XUSB power domains
on TX1 and booting.

Cheers
Jon

-- 
nvpublic
