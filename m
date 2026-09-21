Received: from mail-m12784.qiye.163.com (mail-m12784.qiye.163.com [115.236.127.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938B5371043;
	Mon, 21 Sep 2026 06:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789972828; cv=none; b=TMTUZOHAHWKtlGHdAtg0JSccLLhwkrl8YKJCS3lCccqg3Q5NpfkKnRr6qF65s3GtL6ntJNECBFNDH587i9z9xLMgR6e0mSv9lDAdcBwmfae8AK4R5MM6KzEGZnnRyKsqo9fFvFmGli9PpRWQU5xrjIi9eUBHQU4lJUXX4Hs8o/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789972828; c=relaxed/simple;
	bh=zogB3eIaVFO5Hr0oK5SvadmLRtsVFE2O34heUjlZQ/c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Pg4yGT+GR2MdTakO4KG7FTxHGxxtobPWrlujkIBr+XwGLzL1jQAcLybiDyaOVuhNEc8JK+oKJsG6Wc9c0SrKka+4JT+KfDdAFOJC543ZKnaYfg5NniP7VsV6vfPmrqsWI68PO/z26SAcKcx+jCrF1GoRHT2POILHNx/av9YSXJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=ZHOwku2D; arc=none smtp.client-ip=115.236.127.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="ZHOwku2D"
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4e87d7a93;
	Mon, 21 Sep 2026 14:34:59 +0800 (GMT+08:00)
Message-ID: <96882735-091f-49c6-a47b-5da8be711818@rock-chips.com>
Date: Mon, 21 Sep 2026 14:34:57 +0800
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/19] drm/bridge: analogix_dp: don't create a
 panel_bridge
From: Damon Ding <damon.ding@rock-chips.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Paul Kocialkowski <paulk@sys-base.io>, Linus Walleij <linusw@kernel.org>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Sean Paul <sean@poorly.run>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>
Cc: Albert Esteve <aesteve@redhat.com>, Anusha Srivatsa
 <asrivats@redhat.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, asahi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
 <20260916-drm-bridge-every-panel-v3-19-83afb4f1a707@bootlin.com>
 <975a4d45-9a61-4858-b498-8bc0a1e44746@rock-chips.com>
Content-Language: en-US
In-Reply-To: <975a4d45-9a61-4858-b498-8bc0a1e44746@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0c2acc9e403a8kunm657b9e77980220
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZQx9KVh9PGB9MT0kfGB1ITFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ZHOwku2DSYkcme2HF6miD3tsHrohcDCgQN32pWRYnUFFJhMdcqTLpQQOBt1nASCVshzWCK1Rf2jUBn74aj5YAYiAlPuBMp3c1pQ2RZPJiSymLL/avNTAW5fYkrdsl8AUfIfftyZEjxzoezMDLxmwH2o4F6DAq4wXT1lyFhMzJFI=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=TrLtgz6x2U7PEO6IDlWwEQdJyY8ByiWJ0svyu3eBk3I=;
	h=date:mime-version:subject:message-id:from;

On 9/21/2026 11:07 AM, Damon Ding wrote:
> Hi Luca,
> 
> On 9/16/2026 9:45 PM, Luca Ceresoli wrote:
>> Now a panel_bridge is automatically created for every drm_panel and the
>> panel-bridge API is just a deprecated wrapper to access it.
>>
>> Update and simplify the code by just getting a reference to the
>> already-existing bridge using of_drm_get_bridge_by_endpoint().
>>
>> As of_drm_get_bridge_by_endpoint() returns a refcounted bridge, take care
>> of putting the bridge reference. This is not easily done in the remove 
>> path
>> due to the different probe paths of the user drivers, so add a devm 
>> action
>> to ensure the reference is put only when it was taken.
>>
>> Assisted-by: opencode:deepseek-v4-flash-0731
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> ---
>>   drivers/gpu/drm/bridge/analogix/Kconfig            |  1 -
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 40 ++++++++++++ 
>> +---------
>>   drivers/gpu/drm/exynos/exynos_dp.c                 | 36 + 
>> +-----------------
>>   drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |  9 -----
>>   include/drm/bridge/analogix_dp.h                   |  1 -
>>   5 files changed, 25 insertions(+), 62 deletions(-)
>>

[snip]

>> @@ -488,14 +487,6 @@ static void rockchip_dp_remove(struct 
>> platform_device *pdev)
>>   {
>>       struct rockchip_dp_device *dp = platform_get_drvdata(pdev);

The above unused &rockchip_dp_device could be also remved.

>> -    /*
>> -     * Release the probe-time reference from of_drm_find_panel(). If 
>> bind
>> -     * ran, the panel_bridge holds a second reference that devm cleanup
>> -     * will release when the bridge is destroyed after remove() returns.
>> -     */
>> -    if (dp->plat_data.panel)
>> -        drm_panel_put(dp->plat_data.panel);
>> -
>>       component_del(&pdev->dev, &rockchip_dp_component_ops);
>>   }
>> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/ 
>> analogix_dp.h
>> index 0e0b87abee59..6033137b651e 100644
>> --- a/include/drm/bridge/analogix_dp.h
>> +++ b/include/drm/bridge/analogix_dp.h
>> @@ -35,7 +35,6 @@ static inline bool analogix_dp_is_rockchip(enum 
>> analogix_dp_devtype type)
>>   struct analogix_dp_plat_data {
>>       enum analogix_dp_devtype dev_type;
>> -    struct drm_panel *panel;
>>       struct drm_bridge *next_bridge;
>>       struct drm_encoder *encoder;
>>       struct drm_connector *connector;
>>
> 
> I apply this patch series with the related one[0], and the eDP work well 
> on my RK3576 board.
> 
> Tested-by: Damon Ding <damon.ding@rock-chips.com>
> 
> In my patch series for Analogix DP HPD support, Heiko also pointed out 
> that devm_drm_of_get_bridge()(deprecated now) can be used to get the 
> panel bridge directly, and the redundant &analogix_dp_plat_data.panel 
> can be removed[1]. Since your patch series already contains these 
> optimizations, I will rebase my patch series on top of yours for 
> subsequent updates.
> 
> Reviewed-by: Damon Ding <damon.ding@rock-chips.com>
> 
> [0] https://lore.kernel.org/all/20260915-drm-bridge-drm_panel-cleanup- 
> v4-0-30401d9406f3@bootlin.com/
> [1] https://lore.kernel.org/all/5609825.iZASKD2KPV@diego/
> 

Best regards,
Damon

