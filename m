Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C24737D11F
	for <linux-tegra@vger.kernel.org>; Tue, 25 Aug 2026 18:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787683203; cv=pass; b=XnK3ka4kT7qmUsXhy1agkDq2dWG0GV9mPgcxtZLgCiT5r+uw0EZklI86P2gBohl7DBMn40jqipUykqMTJ2Bxku4rI6iWKovREl5B2rlE27NJRRipaBTPm801eADydjstsUkhULsjfxn12OfwIe7E+a1AsOWN28uMqDwGUZEJfTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787683203; c=relaxed/simple;
	bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJRNvw1ta0SMid9Ow5nkcpcbodb7ySyCwVJDmvVMTMgUi3mR77r+3gPpKlSX+QYGEBENvCkoJL1GnuvTsgiuUL/Uej9p1vA++XodNBRnb774ZYPQeX6Spm5RkeQaKNgFR2u9LV+Ybf08cDPYqLpL35RUxwCxJ26fKZmLnuBskeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/WMQGl2; arc=pass smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/WMQGl2"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-45eddb6fdccso102142fac.2
        for <linux-tegra@vger.kernel.org>; Tue, 25 Aug 2026 11:40:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787683200; cv=none;
        d=google.com; s=arc-20260327;
        b=bt52iNfvtvcHI3zkwvKnkFUji6+izMMJ9mOgengW1RpeLaQeqX9RJFYKCX4uLxIpXH
         gtfE1XTJbxPD57CoRyp+W8lvtAoRYMu/uSlSS1WvSiWWb7SxSe1lMvH4Y22SEloMn7T5
         xYWEfGdxWyNfBtbBe2mfXtXvH4YmrhJN5gdFG0tBIsGm25d8pedI4FntjYFA2DfYFKX2
         2oRdJefjia7WnZoF7x6lf+0PbAqkI4AwpkGekn4juDRJ+XLRMNbqmEQoeptDYYVmHYtD
         P677HoRxTawO8LM2Oykyh3UaEteCRAK5awhd1+AdGkJwttPbe1h48HDFxZcP1oAVKCnS
         dHMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=;
        fh=iDFlPQeAeUAAIeMqObfw45xb4rxOrvctIEsl2M9TVi8=;
        b=c31zxve2JVE5tBy5DOCn5Spr5vM9lX4t6JXmkK2AWN23+B1U1g3OnjGSG/7YQ5JC8X
         JPPJIHizKfepJVksUNEZhG9bVZfWzFJtJIRKiyxhVpUQQFZd4KRLSkjSXUYCLdrOotsj
         afGvomeFgx/uTXigRnbwRgLz/08yAvl10LrXesbMdBDjaFJ56jZTmFtxohCaP+I9yOO4
         B4XADBNMp0R6lPMNt2gl+CMbw8mmEQwiojCaTwflylpVO1/b5jc3wdkFfNYUdPRVNJbo
         gFg9A3qprGZpTPYn5eUln/weY/dk89OXz3PyrVhKeCvDu2K3iWzamcYWk9kbeKublK/8
         kvuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787683200; x=1788288000; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=;
        b=K/WMQGl2ZdGLQuaSQqD9iQu02BHFLpl/p3H3OZdZxR/bBDGQp5KNu2iVpg36hNlfhg
         WoQEFDr8krOgQIpMU0V3j280JREazubY2O2YsEF6z+07m5w9CIaqAAjBnkdEYRlQu+y+
         pD/XRWpuHfeGLjDfmy9Ig9pH50RXIICyAOcdw9XFFVtDZZriIcDMJqBqzBEo78Yg+k9E
         MhhuGygE6O/X7SL+/HsL9VQ6F6OsRGK/97YA9rz8erSo/DNvgtudBgbpEEnZlI/8GUMX
         21CmXKNzOwECkSY1y9d0pN1/DCKPfXzELHF+QyZeBKWFEePIAzj6Y9UzjhBWJQkC+VKU
         eAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787683200; x=1788288000;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=;
        b=sw2AyEZdI1F9XjFEdsDhIvrwLik1fEwkH40nZwQw3hg7ewZlDYwYYBLk1XyXOkPQTt
         R/huAQqpwSOes3MzDenEfSEVbLsYZ9wGBufDq/8B8+toRmwK55Wis4kRGJe7Idmq88Em
         eXlaAzWHxf4InQD+TVJ4CwYRq55czDZEwoyWLrz5+eY+cM4HvdJDScm0s5aiGEx9qEeS
         Yp/62JS/ObvzYDevfWULj9gUb2MgdFEtQGQcF0bQbFz8M5JqFWawU6svHjfMnVRNHKjd
         jLDoyBJvhUd4vmV6gcOyJufRuV/K9mZYNZHgq3cDU6CQ9/aQEUNjgqicCWzOEsBzJ2+O
         JIfQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNnBJc1aRKZMhiaKHT1MGTVbUCJQIJT55wEV2VuaKOsW8+wgJ16GhuPLtEH0dEo3yLkCfZmk/Y4QKWew==@vger.kernel.org
X-Gm-Message-State: AFuF++l3Q9cF+loMg/utKJrlj3VgRvUOMiVg9oBG39yRS7p/T/4vrFph
	SrzmzSKAZT95RcbAlqDqaew7RttjExHoyzZwFov9fRmLG49ScC6P/JYSaWPGiK5fU2JM7ruolaG
	81a2vcEe8eCrDp/0khGBsFjUsdRD9qU0=
X-Gm-Gg: AR+sD13IE2eqw3LIcul11ogUHP4LzWdAcu3dHLlheXB0iQ6gIWg0ePs2msLyaD7uHk+
	qIozUj6Wkb8MsUORBQ3vvZMD7XlqIYDrX6WBMw9KsaMsI5EvlbNIoOokEgr608LZZUEevqJuDH7
	9fUoMkwpTf1HF/c3bNa0/HTPiPjxDYhoxTsib9nm7OWZVnVv7fL7tZ259BqcpfZ1kzxxfL/0ig/
	hbrcp47YNtAPPF74EWUPI5uQ7NZEiX8Qu4SEAu4HfNyEb2THhpzBligEp+c67Y9sXrs8Ta+Wq6A
	RV78ctPTEDPL8Pecy8iSPt0OjZJ1FYk7Fyu2Q0ft4VO5jQ==
X-Received: by 2002:a05:6870:f623:b0:435:16e9:f288 with SMTP id
 586e51a60fabf-4659bb24b93mr1602806fac.20.1787683200126; Tue, 25 Aug 2026
 11:40:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com> <e393996a-3ef1-4c43-b762-af8cd0f2a4b6@suse.de>
In-Reply-To: <e393996a-3ef1-4c43-b762-af8cd0f2a4b6@suse.de>
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Tue, 25 Aug 2026 20:39:49 +0200
X-Gm-Features: AcwNN1Va3aTr02pKhzBqoinFUkwxjfSbh2WQ-EpZwUvKwCIdS5rdnwq9NOj-ZWw
Message-ID: <CAJpoHp56yo+eQAYjvR3ez=HTSzapCd3dYppo=MdPx-Lm4J4DQg@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] drm/drm_simple: remove drm_simple_encoder_init
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, David Airlie <airlied@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hey,

> Diogo, do you want to send out another revision? Otherwise it's time to
> get these patches merged.

I would keep them as is, unless you see anything that should really be
improved before merging.

Best regards,
Diogo
