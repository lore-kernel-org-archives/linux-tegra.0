Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153D5442FB2
	for <linux-tegra@vger.kernel.org>; Tue, 11 Aug 2026 12:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450578; cv=none; b=WjsbAfpoZlcCtxHPfJ68jsyNnsOJbIDMS7P79r0SwtTjwFhwQQ0fnFBMgWG09ofOVkjgZ5nd+am2Kx03cVI/h+/cQtBBxs9E8RJNLzQYAi/1lEFJJZE2uhpwm3Sy4t+caeo7YVuvA/Mw1O2oyGF1DH12maATu5szthg1GExyOUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450578; c=relaxed/simple;
	bh=jOz8/RKCdao82EWzssvpPQu6MldBuHaOzLydpj3dJ68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pW9q9m6cpbeaMrpBs/AdurGls+fiRuoCqTPKEcdlf0shGbe5vhJoGawhmpQEujXDT1XZEhD6/Z2Fu14QMSq6udT4mB9viktwPY/IPb58+mupx+SCViIMxqlcdysCsJRXGN2y4VcmX7DQucAc0lKvu3ZtFDzAV+08tsBchVFUdUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ceaf8a1265so45621085ad.2
        for <linux-tegra@vger.kernel.org>; Tue, 11 Aug 2026 05:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450576; x=1787055376;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uoVTJmbd8yKwYcWWlgS08ZgHIJGke3bvkQlHT1fmSY4=;
        b=PUgdi9EAChVRmbDAUJFkzQvX5tzGzSx21gqQbR20+Dayia10yUYV6bIH9YiYEoAW57
         j3L5ZRS7c+OWZSuncOSo9hTUEakwlYOoEercPH4xFJTKZDsLX1GomNcVZ56nITzBe7Y3
         HlBhIjs/XhbtwcwhJDBZi0hSJI2CzIMSe96V7yjlZnt/oJjEb7JPKahoG3GSn+ED4Qqr
         h7NMTmLjXELCnjCgQR3SnRR08bFpxChrNDY0p1IE/+ttaaL5bGjdxA2p/yX29vE9WkAW
         kGWCD0aRGSMOJu+iALYOI6vXXIdpg3Ks3SlLMXb/GpwlZs4Kguy668+jaRPjgWCzZOTY
         zv9w==
X-Forwarded-Encrypted: i=1; AHgh+RrgpTCIL9E79F6JMQOjqsWKGiNQ6+2TQlzkHPo2VXyXjiXX5F5OOpvMGJzF6DghNzFbePuo7JhW0bj83g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEM0YqTFk42BIH4n+heQfzt6MstQM1AQy5ZVRygSBx6FSLUu2+
	TRJqR1eXWhBSMKX/otE0hxYFmO8lNmbLl6jBgH9qGbQt9Yujb6PhENMwziMI+2Ot
X-Gm-Gg: AR+sD13EYHmcEAw018bFk2lT8INEvsgED9M4MXA4aMabVG6E6ckazefwoVh+wvbaCw/
	5naN728RfzRgTAo1nIDh2EmJZ2kLm+uN+D0GCkZQE0nFVepWZA/sVVXRNQ3tIL441QzX3/rjjAX
	wecRe6VjG5tGl1xgj1c94chX6R12+/o3C+ihUsRHemkYPx88Ck6ypgjP3ZVgHYHmLT+Nd+UlYL/
	1rwA4c4orD+4J6w2yg4VRZk5QYwi2w6tHgN03EMhRvXi+TZDMX09ALKRTRGslGkaIdEb8ZG2jzj
	a984Y0FFbA7nncbgJADesV45Nii3guM34Nsyyc5GsOxIM3FElRpTexGwQPs7JwRPBG18kKm1yah
	KdVhOh8cM3NNrS/tnHafbw+rcWFFi1s3ASt/Xi6gW/auTf8bTLEGHm7Iilyl91KnuiUhhIdl9fm
	A/o3bxUsOdSRAKLJb5MiL7p8kwZIs8sxZZO6oW8t/ItzCboUQu5WyH+h+izt7Ed2Am+fDxPlDJW
	Zn7ayew0HJIkK7GkgQvdA8quqQN8w==
X-Received: by 2002:a17:903:2406:b0:2d1:1d3d:97b2 with SMTP id d9443c01a7336-2d31791a668mr35665945ad.11.1786450576316;
        Tue, 11 Aug 2026 05:16:16 -0700 (PDT)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com. [209.85.214.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f2d74csm6792605ad.21.2026.08.11.05.16.15
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 05:16:16 -0700 (PDT)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d032846c95so37712815ad.1
        for <linux-tegra@vger.kernel.org>; Tue, 11 Aug 2026 05:16:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoYIkpZC2gF+L9LdR1W0VUNaVk2f9mch8dmhaj21Bn9ObKfBXGGiKlfsNs8/T5lUkxzB1k0mAKGQiiP8A==@vger.kernel.org
X-Received: by 2002:a05:6102:15a3:b0:738:cdc6:f59a with SMTP id
 ada2fe7eead31-76b573b9e9amr650405137.9.1786450174738; Tue, 11 Aug 2026
 05:09:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
 <20260724-clk-provider-simple-clean-v2-3-56f306156d25@baylibre.com>
In-Reply-To: <20260724-clk-provider-simple-clean-v2-3-56f306156d25@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Aug 2026 14:09:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW15QrpUhbra1Jg1_8rQWf8CE5TQiE5SUAsqvz5YmEwpQ@mail.gmail.com>
X-Gm-Features: AUfX_mxAADqzKHeccKVpUAgUM-G2gOwUTpW15Dago95Bl-ey6AOZpFlGkzHgs7Y
Message-ID: <CAMuHMdW15QrpUhbra1Jg1_8rQWf8CE5TQiE5SUAsqvz5YmEwpQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] clk: renesas: clean-up simple provider misuse of
 the consumer API
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Bjorn Andersson <andersson@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Tero Kristo <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Jul 2026 at 11:04, Jerome Brunet <jbrunet@baylibre.com> wrote:
> Clock provider should not be using the consumer interface.
> In other words, a provider should not be dealing with struct clk.
>
> This change targets occurrences for which the provider uses the
> consumer interface and corresponding clk_hw interface exist.
>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
