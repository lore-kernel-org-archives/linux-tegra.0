From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/6] clk: tegra: DT align parameter for CVB calculation
Date: Thu, 1 Feb 2018 10:54:15 +0000
Message-ID: <98da869b-e3b5-d703-c2bd-c34a081dfbc8@nvidia.com>
References: <1516797938-32044-1-git-send-email-pdeschrijver@nvidia.com>
 <1516797938-32044-4-git-send-email-pdeschrijver@nvidia.com>
 <7066d1ff-6da4-203d-57ea-cf179fea17be@nvidia.com>
 <20180201103002.GY7031@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180201103002.GY7031-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 01/02/18 10:30, Peter De Schrijver wrote:
> On Wed, Jan 31, 2018 at 10:43:04AM +0000, Jon Hunter wrote:
>>
>> On 24/01/18 12:45, Peter De Schrijver wrote:
>>> When using a PWM controlled regulator, the voltage step and offset are
>>> determined by the regulator IC in use. This is specified in DT rather
>>> than fixed in the CVB table. Hence pass this information to the CVB table
>>> calculation function. For backwards compatibility the table values are used
>>> if the corresponding parameter is 0.
>>>
>>> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>  drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 23 +++++++++++++++++++++--
>>>  drivers/clk/tegra/cvb.c                    | 18 ++++++++++++++----
>>>  drivers/clk/tegra/cvb.h                    |  5 +++--
>>>  3 files changed, 38 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
>>> index 440eb8d..6205ce1 100644
>>> --- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
>>> +++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
>>> @@ -111,6 +111,7 @@ static int tegra124_dfll_fcpu_probe(struct platform_device *pdev)
>>>  	struct tegra_dfll_soc_data *soc;
>>>  	const struct of_device_id *of_id;
>>>  	const struct dfll_fcpu_data *fcpu_data;
>>> +	struct rail_alignment align;
>>>  
>>>  	of_id = of_match_device(tegra124_dfll_fcpu_of_match, &pdev->dev);
>>>  	fcpu_data = of_id->data;
>>> @@ -135,12 +136,30 @@ static int tegra124_dfll_fcpu_probe(struct platform_device *pdev)
>>>  		return -ENODEV;
>>>  	}
>>>  
>>> +	err = of_property_read_u32(pdev->dev.of_node, "nvidia,align-offset-uv",
>>> +					&align.offset_uv);
>>> +	if (err < 0) {
>>> +		dev_err(&pdev->dev,
>>> +			"offset uv not found, default to table value\n");
>>> +		align.offset_uv = 0;
>>> +	}
>>> +
>>> +	err = of_property_read_u32(pdev->dev.of_node, "nvidia,align-step-uv",
>>> +					&align.step_uv);
>>> +	if (err < 0) {
>>> +		dev_err(&pdev->dev,
>>> +			"step uv not found, default to table value\n");
>>> +		align.step_uv = 0;
>>> +	}
>>> +
>>
>> I am a bit confused by this ...
>>
>> 1. Isn't this going to break Tegra124 DFLL support?
> 
> We fall back to the original behaviour in case the properties are missing, so
> it should work.

Ah yes. However, on Tegra124 now I see all this prints. Can't we only
read these properties if using PWM?

Cheers
Jon

-- 
nvpublic
