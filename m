From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] drm: replace IS_ERR and PTR_ERR with PTR_ERR_OR_ZERO
Date: Tue, 7 Jan 2020 08:47:40 +0200
Message-ID: <ec4d34d6-7c58-ea1e-cc9c-c2df0baaf23b@ti.com>
References: <20191225132042.5491-1-yukuai3@huawei.com>
 <20191227115401.agumkfuiwexl2wmx@hendrix.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191227115401.agumkfuiwexl2wmx@hendrix.home>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: yu kuai <yukuai3@huawei.com>
Cc: jernej.skrabec@siol.net, yi.zhang@huawei.com, airlied@linux.ie, linux-kernel@vger.kernel.org, jonathanh@nvidia.com, zhengbin13@huawei.com, wens@csie.org, thierry.reding@gmail.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 27/12/2019 13:54, Maxime Ripard wrote:
> On Wed, Dec 25, 2019 at 09:20:42PM +0800, yu kuai wrote:
>> no functional change, just to make the code simpler
>>
>> Signed-off-by: yu kuai <yukuai3@huawei.com>
>> ---
>>   drivers/gpu/drm/omapdrm/dss/hdmi4.c         | 5 +----
>>   drivers/gpu/drm/omapdrm/dss/hdmi4_core.c    | 6 ++----
>>   drivers/gpu/drm/omapdrm/dss/hdmi5_core.c    | 4 +---
>>   drivers/gpu/drm/omapdrm/dss/hdmi_phy.c      | 4 +---
>>   drivers/gpu/drm/sun4i/sun4i_dotclock.c      | 4 +---
>>   drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c      | 4 +---
>>   drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c | 4 +---
>>   drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c  | 5 +----
>>   drivers/gpu/drm/tegra/drm.c                 | 4 +---
>>   drivers/gpu/drm/tegra/gem.c                 | 4 +---
>>   10 files changed, 11 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
>> index 0f557fad4513..eb71baedf19e 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
>> @@ -587,10 +587,7 @@ static int hdmi_audio_register(struct omap_hdmi *hdmi)
>>   		&hdmi->pdev->dev, "omap-hdmi-audio", PLATFORM_DEVID_AUTO,
>>   		&pdata, sizeof(pdata));
>>
>> -	if (IS_ERR(hdmi->audio_pdev))
>> -		return PTR_ERR(hdmi->audio_pdev);
>> -
>> -	return 0;
>> +	return PTR_ERR_OR_ZERO(hdmi->audio_pdev);
>>   }
>>
>>   /* -----------------------------------------------------------------------------
>> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c b/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
>> index ea5d5c228534..fdd73fb73653 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
>> @@ -924,8 +924,6 @@ int hdmi4_core_init(struct platform_device *pdev, struct hdmi_core_data *core)
>>
>>   	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
>>   	core->base = devm_ioremap_resource(&pdev->dev, res);
>> -	if (IS_ERR(core->base))
>> -		return PTR_ERR(core->base);
>> -
>> -	return 0;
>> +
>> +	return PTR_ERR_OR_ZERO(core->base);
>>   }
>> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
>> index ff4d35c8771f..30454bc9de78 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
>> @@ -908,8 +908,6 @@ int hdmi5_core_init(struct platform_device *pdev, struct hdmi_core_data *core)
>>
>>   	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
>>   	core->base = devm_ioremap_resource(&pdev->dev, res);
>> -	if (IS_ERR(core->base))
>> -		return PTR_ERR(core->base);
>>
>> -	return 0;
>> +	return PTR_ERR_OR_ZERO(core->base);
>>   }
>> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi_phy.c b/drivers/gpu/drm/omapdrm/dss/hdmi_phy.c
>> index 00bbf24488c1..bbc02d5aa8fb 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/hdmi_phy.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi_phy.c
>> @@ -191,8 +191,6 @@ int hdmi_phy_init(struct platform_device *pdev, struct hdmi_phy_data *phy,
>>
>>   	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "phy");
>>   	phy->base = devm_ioremap_resource(&pdev->dev, res);
>> -	if (IS_ERR(phy->base))
>> -		return PTR_ERR(phy->base);
>>
>> -	return 0;
>> +	return PTR_ERR_OR_ZERO(phy->base);
>>   }
>> diff --git a/drivers/gpu/drm/sun4i/sun4i_dotclock.c b/drivers/gpu/drm/sun4i/sun4i_dotclock.c
>> index 417ade3d2565..84c04d8192b3 100644
>> --- a/drivers/gpu/drm/sun4i/sun4i_dotclock.c
>> +++ b/drivers/gpu/drm/sun4i/sun4i_dotclock.c
>> @@ -191,10 +191,8 @@ int sun4i_dclk_create(struct device *dev, struct sun4i_tcon *tcon)
>>   	dclk->hw.init = &init;
>>
>>   	tcon->dclk = clk_register(dev, &dclk->hw);
>> -	if (IS_ERR(tcon->dclk))
>> -		return PTR_ERR(tcon->dclk);
>>
>> -	return 0;
>> +	return PTR_ERR_OR_ZERO(tcon->dclk);
> 
> This has been submitted a couple of times already. It's harder to
> maintain and not easier to read.
> 
> Please remove sun4i from your patch

Nack for the omapdrm parts too, for the same reasons.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
