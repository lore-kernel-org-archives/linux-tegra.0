From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v4 14/23] drm/tilcdc: Provide ddc symlink in connector
 sysfs directory
Date: Tue, 23 Jul 2019 14:44:50 +0200
Message-ID: <3ad60be5-49cf-4017-4b74-53a2d6272deb@collabora.com>
References: <cover.1562843413.git.andrzej.p@collabora.com>
 <d1d415022c598fb7acd033f0f322dd67250adaa9.1562843413.git.andrzej.p@collabora.com>
 <20190723090532.GA787@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190723090532.GA787@ravnborg.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Sean Paul <sean@poorly.run>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>, linux-ar
List-Id: linux-tegra@vger.kernel.org

Hi Sam,

W dniu 23.07.2019 o 11:05, Sam Ravnborg pisze:
> Hi Andrzej
> 
> On Thu, Jul 11, 2019 at 01:26:41PM +0200, Andrzej Pietrasiewicz wrote:
>> Use the ddc pointer provided by the generic connector.
>>
>> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>> ---
>>   drivers/gpu/drm/tilcdc/tilcdc_tfp410.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_tfp410.c b/drivers/gpu/drm/tilcdc/tilcdc_tfp410.c
>> index 62d014c20988..c373edb95666 100644
>> --- a/drivers/gpu/drm/tilcdc/tilcdc_tfp410.c
>> +++ b/drivers/gpu/drm/tilcdc/tilcdc_tfp410.c
>> @@ -219,6 +219,7 @@ static struct drm_connector *tfp410_connector_create(struct drm_device *dev,
>>   	tfp410_connector->mod = mod;
>>   
>>   	connector = &tfp410_connector->base;
>> +	connector->ddc = mod->i2c;
>>   
>>   	drm_connector_init(dev, connector, &tfp410_connector_funcs,
>>   			DRM_MODE_CONNECTOR_DVID);
> 
> When reading this code, it looks strange that we set connector->ddc
> *before* the call to init the connector.
> One could risk that drm_connector_init() used memset(..) to clear all
> fields or so, and it would break this order.

I verified the code of drm_connector_init() and cannot find any memset()
invocations there. What is your actual concern?

Andrzej
