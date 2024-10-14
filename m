Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030F8153812
	for <linux-tegra@vger.kernel.org>; Mon, 14 Oct 2024 08:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728894741; cv=none; b=KEW2R5SnCTdOhahFF9rjNAPR+3jSMPdK45PlzMqNz+XbvVFgB2U2HgxDwUaI6/lKY7FUDwvGmXIOyqWF+Ux+Ann6AYxoWxzScQ5GCqdJiSgzd+op1SENvhuz9SzGVT0XMbkDf386SwPlvSL7EdKvltO0oUfO3b2R9g7khX+14hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728894741; c=relaxed/simple;
	bh=cxIKPl7GKVQn98O/mrnEhVXAkE0uTRhk4Nnr0kHKm+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q/yIW7+VodY13zsZaSOB7Yn/u7XybW2Z5DsdwZ7yIfJ8bS6dQBH0slk0KVo+WuFzA4iE/4cFCNmIcFzqZdesFCuFNnDQovFY3ixDufBR9LX2rhi5u7Bp1OiCjIP13dHa9SqAvXrQHepgdBZUCtlyl+DElR/BTf+SBaEPR0oHeJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=foWIHP+e; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="foWIHP+e"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539e4b7409fso1809424e87.0
        for <linux-tegra@vger.kernel.org>; Mon, 14 Oct 2024 01:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728894738; x=1729499538; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGlKyhbFWxEFs+EN5AdJI/noF1CduIAszsysoTgRVic=;
        b=foWIHP+e/j4WPmc12XR+s0eqpaPeJAIew+yXe0dJrOL6Md0pWILKz1Fz6HqPmrhgHx
         41o0AplCjHehGfpTn0Uru2Nc4JxEvszJHZ223ylk+3VEhl0Y4xMmejQVa8LF0Fw6QYOZ
         rdNyE9LnsJcrN5ihhk8b+qIfJvkaxopFlrCVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728894738; x=1729499538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CGlKyhbFWxEFs+EN5AdJI/noF1CduIAszsysoTgRVic=;
        b=SkRM9RazMEj/LPGf2+421iTU2HSP9l4zh1Rjgk6zctCVifJpmwNKkxzIhLgSciR9Ad
         fmWD+enAV52hs7Cm7eePTVDuLyxAZhPTaubvYuqB+kZKwHTVdRePXcy9hhyWlEiEg07L
         z60XJXcAAeFgRmEtilVtem1LjrzGl1984P3n3CS555tXvxUL+XCccoAKZzfQD+bCygav
         s8NHkAG+lAgvw60Dd6BTSd/LV9AfRgNIegrfjzuBfRSsmjh8t277FGoLrxpEke8UtRpT
         PukRSwIPmFXyLbZaQ+eoZQDQvj3H7BcwBxOsAEHCE9AkyDLatSHZbRUbJ3H/tjpGSdyG
         i6nA==
X-Forwarded-Encrypted: i=1; AJvYcCU0mJR61P9y8RManEoAI/ewvRZrvO6zorpnBu+9afcqcuOUIcrsJ/XSfSitWWBI+TfZSFEFVRQUSGC+FQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrVLXpukyDSIc14amL1kPe68pkZsAB4IkAhAQcqpbR6RPe9enQ
	54zRaKwm+pYtkcUmztrwtJ1fWRC3JvAvjO+6QsvsoD1vtQ4NRl898fWWlGdMooxScOQMygROBak
	yDD/JYkxunqnExMZ8BZ7BYH3QeL5lFxVm5p1+
X-Google-Smtp-Source: AGHT+IF8yCwYVSblYBBqvyU6aaOkHAFhmYHymC9/n8uskosKRPRl9o+TsOQe+6xYXWvIN2tZjy8ERc+Cu1NL6JnlR2Y=
X-Received: by 2002:a05:6512:131d:b0:539:a2e0:4e94 with SMTP id
 2adb3069b0e04-539d6ef4d72mr2569999e87.30.1728894738003; Mon, 14 Oct 2024
 01:32:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010-b4-cleanup-h-of-node-put-thermal-v4-0-bfbe29ad81f4@linaro.org>
In-Reply-To: <20241010-b4-cleanup-h-of-node-put-thermal-v4-0-bfbe29ad81f4@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 14 Oct 2024 16:32:06 +0800
Message-ID: <CAGXv+5FgLQMG=tA6d_gT71j5ZxWPa56rW1UmfUgKot4uCj56+g@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] thermal: scope/cleanup.h improvements
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 2:06=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Changes in v4:
> - Patch 2: rewrite, significant change: kzalloc() also with
>   scoped-handling so the entire error handling could be removed.
>   Due to above, drop review-tags (Chen-Yu, Jonathan).
> - Add Rb tags for other patches.
> - Link to v3: https://lore.kernel.org/r/20241008-b4-cleanup-h-of-node-put=
-thermal-v3-0-825122398f71@linaro.org
>
> Changes in v3:
> - Rebase, because there was bigger rework in thermal code.
>   This made two patches obsolete, but brought new one:
>   1/6: thermal: of: Simplify thermal_of_should_bind with scoped for each =
OF child
> - Link to v2: https://lore.kernel.org/r/20240816-b4-cleanup-h-of-node-put=
-thermal-v2-0-cee9fc490478@linaro.org
>
> Changes in v2:
> - Drop left-over of_node_put in regular exit path (Chen-Yu)
> - Link to v1: https://lore.kernel.org/r/20240814-b4-cleanup-h-of-node-put=
-thermal-v1-0-7a1381e1627e@linaro.org
>
> Few code simplifications with scope/cleanup.h.
>
> Best regards,
> Krzysztof
>
> ---
> Krzysztof Kozlowski (6):
>       thermal: of: Simplify thermal_of_should_bind with scoped for each O=
F child

I couldn't find this in my inbox. But since I already reviewed all the othe=
r
patches, and I looked at this one on lore, consider the whole series is now

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

>       thermal: of: Use scoped memory and OF handling to simplify thermal_=
of_trips_init()
>       thermal: of: Use scoped device node handling to simplify of_thermal=
_zone_find()
>       thermal: qcom-spmi-adc-tm5: Simplify with scoped for each OF child =
loop
>       thermal: tegra: Simplify with scoped for each OF child loop
>       thermal: sun8i: Use scoped device node handling to simplify error p=
aths
>
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c |  7 ++---
>  drivers/thermal/sun8i_thermal.c          | 11 +++----
>  drivers/thermal/tegra/soctherm.c         |  5 ++-
>  drivers/thermal/thermal_of.c             | 54 ++++++++++----------------=
------
>  4 files changed, 25 insertions(+), 52 deletions(-)
> ---
> base-commit: 33ce24234fca4c083e6685a18b460a18ebb5d5c1
> change-id: 20240814-b4-cleanup-h-of-node-put-thermal-2268440cc6f7
>
> Best regards,
> --
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
