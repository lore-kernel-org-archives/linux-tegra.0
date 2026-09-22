Received: from mail-m12797.qiye.163.com (mail-m12797.qiye.163.com [115.236.127.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1B83EBF16;
	Tue, 22 Sep 2026 08:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067491; cv=none; b=DBlV5SmIw6zKroIwt3VlK7iEDQVxcxPahXcwV6/f+Yz9sVdKCbgTOXK/Fh+w9soF1yk9peVm3uprGDHBLu9S0MJpTuYIXP/QyZKmkEbHnts9r4f/ugkd1KLwSNC5ZbqdTC7X3EmmjyMX3OOYZys2/hraNpb4i3QcRj0KCz7uMBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067491; c=relaxed/simple;
	bh=RieBGaHaU4UNSLyYrCNfirmsir995WrGiAlhBti2/qU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DbiehfOcyYzXa6HJ8DSs9uKCqttCe1DWPh2+7KdkY2LI5/DJeUBk+IiRePD+PkmGHRJR+4J7rjUoOAJiO1kyKpnl5VdrAalv68rd+x12C571viWw8jBA6qHYC2KlE4Atav5msVxBK664QztaRIqLHETcpFdboxI8VAUEJ8avbek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=TNR/0Sot; arc=none smtp.client-ip=115.236.127.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="TNR/0Sot"
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4eb536cd9;
	Tue, 22 Sep 2026 16:57:55 +0800 (GMT+08:00)
Message-ID: <3bfb61d5-333d-4005-ad3b-2e8179c0e45e@rock-chips.com>
Date: Tue, 22 Sep 2026 16:57:54 +0800
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/19] drm/bridge: analogix_dp: don't create a
 panel_bridge
To: Heiko Stuebner <heiko@sntech.de>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
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
 linux-samsung-soc@vger.kernel.org
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
 <975a4d45-9a61-4858-b498-8bc0a1e44746@rock-chips.com>
 <DLLOZYM6YWJ3.6Q0LRD1WABGW@bootlin.com> <1889588.TLkxdtWsSY@phil>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <1889588.TLkxdtWsSY@phil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0c856048703a8kunm13843dd282f85
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTRhCVksYHh5IT0IaGRhKTlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5KVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=TNR/0SotamoVdJUJEBCwZjRW5KZCgNHWIy7B4TOS3SPVjThz6kkpecEQfCBm1hET0QLLrXnQiPdxL1/ZgQBcxH6Fgs4gwH89bNW1b35Mip8zJ7P9QGBceDdbWh0z3SX9ZKl3hyUCylvmgOVFto0lOSx+M5/QgWBF7muvoV2pXBE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=3BVvMws54RIF3ziE5nORoR5QOkw6Rpw6m98i1VFobSo=;
	h=date:mime-version:subject:message-id:from;

Hi Heiko,

On 9/22/2026 4:22 PM, Heiko Stuebner wrote:
> Hi Luca,
> 
> Am Dienstag, 22. September 2026, 10:12:41 Mitteleuropäische Sommerzeit schrieb Luca Ceresoli:
>> On Mon Sep 21, 2026 at 5:07 AM CEST, Damon Ding wrote:
>>> On 9/16/2026 9:45 PM, Luca Ceresoli wrote:
> 
> [...]
> 
>>>> @@ -163,18 +161,6 @@ static int exynos_dp_probe(struct platform_device *pdev)
>>>>    	 */
>>>>    	platform_set_drvdata(pdev, dp);
>>>>
>>>> -	/* This is for the backward compatibility. */
>>>> -	np = of_parse_phandle(dev->of_node, "panel", 0);
>>>> -	if (np) {
>>>> -		dp->plat_data.panel = of_drm_find_panel(np);
>>>> -
>>>> -		of_node_put(np);
>>>> -		if (IS_ERR(dp->plat_data.panel))
>>>> -			return PTR_ERR(dp->plat_data.panel);
>>>> -
>>>> -		goto out;
>>>> -	}
>>>> -
>>>
>>> TIP: In my WIP v3 patch series, I use of_drm_find_panel() together with
>>> devm_drm_panel_bridge_add() to maintain this backward compatibility. But
>>> I also think this old approach should be deprecated now. Shall we add
>>> some notes in the commit message to mention the deprecation of this method?
>>
>> What is the "WIP v3" series exactly? Do you have a link (to v2 in case v3
>> is not yet public)?
> 
> https://lore.kernel.org/linux-rockchip/20260804081717.741404-1-damon.ding@rock-chips.com/
> is the series in question.
> 
> 

Sorry for the confusion. I was discussing another separate series in 
this thread, which caused misunderstanding. I mentioned earlier that I 
will try to post its v3 update within this week.[0]

Best regards,
Damon

[0] 
https://lore.kernel.org/all/57f57f40-87ec-47a2-a8b9-cc8b1adc3b8f@rock-chips.com/
