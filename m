Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4516190068;
	Tue,  3 Jun 2025 04:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748925710; cv=none; b=b+edewXKXh+MmaeAQ8KnIpAinZJtxzzE28jAMeN911Yki17QPcXtBbHMYEkpDtiR/gscz3ufU3zuF3Klai23e8QJo+Ieyy/eNS46D9JwiL4Qy1t3V6YbvpUoUDuUerWBLZZ/I1M7uEMurDm4yVjDogEVCr4s0Rk3sSVdSQ2HKu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748925710; c=relaxed/simple;
	bh=BED0WVH0ui801+fOhuTnComAdNPJBDfJ7ZYmPTvoYyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wcmfan3bNLUACNPpJ3MkFVmEWx3xvfhkZNKLXImq4x7EVEKpz0KwxMSMnty1ZAQoB90DGt8D8QFiWD4abbI8wT1e6KAbn8ZcpTdjAY0GYQirxYp3Vehc/mXciJOKHuHgdbnyu7tiHOWv5W40cw1p0WKBrgH+Q9tcjqzqzIl4pTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3105ef2a08dso42637591fa.0;
        Mon, 02 Jun 2025 21:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748925705; x=1749530505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BED0WVH0ui801+fOhuTnComAdNPJBDfJ7ZYmPTvoYyA=;
        b=FDDxgwhtyhDogiBoT9bfjQ/ZYn/ZmQyxrO/JSH2VkB98zI7RmzdLZvhEkOKn7vpZXF
         gz9yfqE90LfGJUjuIH/r/3V+lRWkbWjOiO3ANma5Z1TPHP/0inWl/Tq5bRpggiA1CiKq
         UYf2PprsMDYRu0zPNF0KiJPcpdQc0hKyNhyFBjrTIW0NHPZGkijDZSP5LVqQHDi96/bs
         1ZTDuMK/GL6wCp6V0X2lygI1PKFVLounnChAMqggXYt/tO1UO17ObU9ByKPBN372UAJL
         iH56xek7rmRSBvW9+fo8S1k7uot+/oIN1pwWRY1xXz7sewGEQ4ZcwovG3dXnldr99MVS
         HpRA==
X-Forwarded-Encrypted: i=1; AJvYcCUICH54ZXlP91co8g7dmrmFVfNA5UEpcmgoujGP3ydQr8sNuFjReiBLGE7g4Dtw5nNqKduTZcu0pKyPCuU=@vger.kernel.org, AJvYcCX6lbDX/uKFSNW1uXpzTwXEO+mTb5KTRvxJVbptlCwaOjRmu9pX46xUDbnd4/hR2nAQiA564MOq2yvYneg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr0f4I7t2z48gWfen+L4YMDHL//vLXpw5KQq0hzj4eMvKqWh9V
	Ai1kX7KH5IfklNRjtJBVueP5vX/VrdnijNlca0uwqyADs4FVdc8LH/uIicPY1zue/z0=
X-Gm-Gg: ASbGncutAxz0+AjUEUezuaoKKTo6azMnaU2/Yh/ucGsfoitSxyknnpJfw+z3UKrVjKn
	d+QNv4I+RmVu+fRb8B7ncwWN2TNSBWVH5p/KpFxFOEUSuDRYVv4vxOr/NuCaLafbxV2nEJIpSJ0
	do28lXZR9QB9VztqTuizHHZ99p0kQWjkBgtXvXt1bC6B5NkV81UTvLkIjSjsdowE66Q5p9vKVGo
	JpsGc2MM45ercXrcfymBq19picRXjIEj28+kWimvWRJZJW12kLarxsSKO8LkPRBModLti2zam5n
	1wFqH5r2EdQcvzSbEFMpRlVU4rHZ+H1vytem7qEUnQj7XXWgmsMyCN38TV6oeFrbWI/mVrjFnFY
	EGGTaNLEl
X-Google-Smtp-Source: AGHT+IGgFpO75N47nbUbwh74cyP8vmUtPAl924Z67MsCs90Rc5Qz+koThhvs/XcVK6r2b2Q7km3eeg==
X-Received: by 2002:a05:651c:1989:b0:32a:7122:58d8 with SMTP id 38308e7fff4ca-32a9e99cf44mr30204881fa.8.1748925704781;
        Mon, 02 Jun 2025 21:41:44 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85bc5039sm16590981fa.65.2025.06.02.21.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 21:41:43 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32aa864e0e9so20770901fa.2;
        Mon, 02 Jun 2025 21:41:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX36jYqwrjjqjjaz8JQYMb5ry43jhQxPAvKMWv/rfBK/DUjLdj6WQ5+/uI3nH5Pm0pA1WdqpCeikCleZoo=@vger.kernel.org, AJvYcCXB6RYFo5vCGU9EzDnzShVKqyGO9U4JC0Y3tE6fEevedREL/puwt8W9DoWRR4BRDW12OmKkgn7w5JmHZ4A=@vger.kernel.org
X-Received: by 2002:a2e:bea5:0:b0:32a:8c7a:8350 with SMTP id
 38308e7fff4ca-32a9ea675f3mr36137841fa.30.1748925703708; Mon, 02 Jun 2025
 21:41:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org> <20250602151853.1942521-4-daniel.lezcano@linaro.org>
In-Reply-To: <20250602151853.1942521-4-daniel.lezcano@linaro.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 3 Jun 2025 12:41:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v67qHKVGdNDmg_mbT-bkhAmn=NxQBsRZMtGgpdOGh6Z37w@mail.gmail.com>
X-Gm-Features: AX0GCFsButCX6XOPdUHg9gMIjlAItX_YWWR5mtXZWLyYajpbu0GEJNOaxHVxyxs
Message-ID: <CAGb2v67qHKVGdNDmg_mbT-bkhAmn=NxQBsRZMtGgpdOGh6Z37w@mail.gmail.com>
Subject: Re: [PATCH v1 3/7] clocksource/drivers/sun5i: Add module owner
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, Jim Cromie <jim.cromie@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Marco Elver <elver@google.com>, Nam Cao <namcao@linutronix.de>, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, John Stulz <jstultz@google.com>, 
	Will McVicker <willmcvicker@google.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravan Kanna <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 11:19=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> The conversion to modules requires a correct handling of the module
> refcount in order to prevent to unload it if it is in use. That is
> especially true with the clockevents where there is no function to
> unregister them.
>
> The core time framework correctly handles the module refcount with the
> different clocksource and clockevents if the module owner is set.
>
> Add the module owner to make sure the core framework will prevent
> stupid things happening when the driver will be converted into a
> module.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
