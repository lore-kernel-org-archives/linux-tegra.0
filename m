From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: Re: [PATCH] drm/tegra: vic: add NULL check on of_match_device()
 return value
Date: Mon, 10 Jul 2017 14:29:34 -0500
Message-ID: <20170710142934.Horde.C0p-TxoXKsaCnNgMwoIsfTu@gator4166.hostgator.com>
References: <20170707061626.GA14016@embeddedgus>
 <20170707092551.GB15652@ulmo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170707092551.GB15652@ulmo.fritz.box>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

Quoting Thierry Reding <thierry.reding@gmail.com>:

> On Fri, Jul 07, 2017 at 01:16:26AM -0500, Gustavo A. R. Silva wrote:
>> Check return value from call to of_match_device()
>> in order to prevent a NULL pointer dereference.
>>
>> In case of NULL print error message and return.
>>
>> Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
>> ---
>>  drivers/gpu/drm/tegra/vic.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
>> index 47cb1aa..7e11825 100644
>> --- a/drivers/gpu/drm/tegra/vic.c
>> +++ b/drivers/gpu/drm/tegra/vic.c
>> @@ -283,6 +283,11 @@ static int vic_probe(struct platform_device *pdev)
>>  	int err;
>>
>>  	match = of_match_device(vic_match, dev);
>> +	if (!match) {
>> +		dev_err(&pdev->dev, "failed to match device\n");
>> +		return -ENODEV;
>> +	}
>
> Someone would have to go to great lengths to trigger this condition,
> might as well let it crash as a warning that they've done something
> wrong.
>

Thanks for clarifying.
--
Gustavo A. R. Silva
