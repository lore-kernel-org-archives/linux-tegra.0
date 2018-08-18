From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v2] ASoC: tegra: probe deferral error
	reporting
Date: Sat, 18 Aug 2018 15:02:31 +0200
Message-ID: <1edf4e289d6ede7d6bac43a6a9fdb613@agner.ch>
References: <20180814140145.12212-1-marcel@ziswiler.com>
 <930b05df-c502-192e-3cb9-9e1874701cce@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <930b05df-c502-192e-3cb9-9e1874701cce@nvidia.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Marcel Ziswiler <marcel@ziswiler.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 15.08.2018 18:02, Jon Hunter wrote:
> On 14/08/18 15:01, Marcel Ziswiler wrote:
>> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>>
>> Actually report the error codes from of_get_named_gpio() resp.
>> devm_gpio_request_one() upon trying to get the codec reset resp. sync
>> GPIOs unless it is just a probe deferral.
>>
>> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>>
>> ---
>>
>> Changes in v2:
>> - Silence probe deferral as suggested by Stefan.
>> - Fix line over 80 characters as reported by checkpatch.
>>
>>  sound/soc/tegra/tegra20_ac97.c | 19 ++++++++++++++++---
>>  1 file changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
>> index 682ef33afb5f..2ac6b2d73980 100644
>> --- a/sound/soc/tegra/tegra20_ac97.c
>> +++ b/sound/soc/tegra/tegra20_ac97.c
>> @@ -351,18 +351,31 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
>>  		ret = devm_gpio_request_one(&pdev->dev, ac97->reset_gpio,
>>  					    GPIOF_OUT_INIT_HIGH, "codec-reset");
>>  		if (ret) {
>> -			dev_err(&pdev->dev, "could not get codec-reset GPIO\n");
>> +			if (ret != -EPROBE_DEFER)
>> +				dev_err(&pdev->dev,
>> +					"could not get codec-reset GPIO: %d\n",
>> +					ret);
>> +
>>  			goto err_clk_put;
>>  		}
>>  	} else {
>> -		dev_err(&pdev->dev, "no codec-reset GPIO supplied\n");
>> +		ret = ac97->reset_gpio;
>> +		if (ret != -EPROBE_DEFER)
>> +			dev_err(&pdev->dev,
>> +				"no codec-reset GPIO supplied: %d\n",
>> +				ret);
>> +
>>  		goto err_clk_put;
>>  	}
>>
>>  	ac97->sync_gpio = of_get_named_gpio(pdev->dev.of_node,
>>  					    "nvidia,codec-sync-gpio", 0);
>>  	if (!gpio_is_valid(ac97->sync_gpio)) {
>> -		dev_err(&pdev->dev, "no codec-sync GPIO supplied\n");
>> +		ret = ac97->sync_gpio;
>> +		if (ret != -EPROBE_DEFER)
>> +			dev_err(&pdev->dev, "no codec-sync GPIO supplied: %d\n",
>> +				ret);
>> +
>>  		goto err_clk_put;
>>  	}
> 
> Thanks, looks good to me. However, I wonder why we don't request the
> 'sync_gpio' in the probe like we do for the reset? Otherwise ...

The comment in tegra20_ac97_codec_warm_reset() is probably the reason:

/*
 * although sync line is driven by the DAC pad group warm reset using
 * the controller cmd is not working, have to toggle sync line
 * manually.
 */

I guess the GPIO need to be freed so that the DAC pad group can use the
sync line?

> 
> Acked-by: Jon Hunter <jonathanh@nvidia.com>

Also looks good to me:

Reviewed-by: Stefan Agner <stefan@agner.ch>

--
Stefan
