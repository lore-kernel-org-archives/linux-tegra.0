Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DFB3D9DB3
	for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 23:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593325; cv=none; b=Cb0i66DBBUYhsGxFGwIKjKcYMsjgfHKajR1/vs8LS9x79CzWoVbzutgo3/zcrqlv91SJ+nn5HyMHwLbfrkR4AxuTXjuzNTHvAgW7obsgkCizN72PMvFbHLEM9pHOBm2aij0iUcki0NvU/s88b2h4Tk092LaZop9m8M/wAkibv4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593325; c=relaxed/simple;
	bh=Po793qEB14FDeszlUgfCZzMNPlO0hdsx5m4i9+Am1UI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TWrGYPywCo9nQuXoKEZqMUhRR0r03x+xFQ41W0u7uWE63XK5F0bJQ3ATNfGtXPPSLuzd7BrknCmW0r8g1KA5B9vhxB0WA6X3dSzjko1YUPinpx68NGdY1rQqdMiwcxYg40SgKf07uhbo0qeA8Kcq5zybdnuRDFYlb8GVDbhADo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H85GzRHE; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H85GzRHE"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bbe539fc355so74375666b.2
        for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 16:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593320; x=1778198120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/stw2Li+z9zBw8IsGsJQTT0j6lAz8JjDjcZka6O6Bc=;
        b=H85GzRHEyNXOm+vNPL9yFnzHQpWHlxWlRNRsFbpzu2tcS5YYcbeDbMVHqAAp0Djv5k
         Um46vfmz+0f+FVvdek0HorypL42UZ+IdA6jg/PgF1NBa2TWx6kB5K9ALgtuvJwxLmI35
         gnL0ClGi3G6R2MffKvdzYk6V9CdNM2UjsBjIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593320; x=1778198120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L/stw2Li+z9zBw8IsGsJQTT0j6lAz8JjDjcZka6O6Bc=;
        b=lS3cC36z+v4m5/6X0K+Im2Vf9zjK/AZM3yopAJ6LCTuZOvqKcu8hkxk02pVdD0C4Ko
         Z+4je7y4xTVrKho7Y5jUa3EPKIk8+uuEDPm2gkO+8rCipEPYw6yoyNuipvj2Ulh6uT3Q
         7BnD4aphHsAYc3AhzOZec/n2bB4j9Lm0IPtcGfcnftO+ylTACU6BXFGXzq7pNjU/eGPO
         R6kpVBtF3aO0C8drnm+VFBZcfywFK7MN2BV/Y8s7tHosOIgReKe+1c5whYPgPXNTaWJY
         lCOkUORflw9DI9xlzjqJ8DeKK5m5ElTfyy8JpQdBYJnXpm/SEOrBCCsz/PPkPKSptEcT
         Smig==
X-Forwarded-Encrypted: i=1; AFNElJ92ij5k21afoo4+jDxDz8wI9vbmPuKaFRJlLwoN5cECtNxFUP0CT89zU4ysZV7/5rwAk8sbYYte6y4FKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYWCd1xL5kIzov0iO6Ag9ogKK0pLOgxiKWp1Zrj3gPnDCDt8rc
	cuO+TTl/F9k2VaRMTIC6POkHtCxgDIuusZnNSJ8ab4NI8896aKEOhQ+kSz94YggZD6BagzOpe07
	HYMDZkA==
X-Gm-Gg: AeBDietsHU0mFhZu+LQwPJmPT20+42LpEn+HYiY61jJ1VG3raUQMWbWQbHrMteI1eNJ
	Qa8GwqN3M3h6nLqOiaLAe7lk69ntVHTjZInHdNTYH7ZPrpVYuRWLiMplRnbSWRaxnJh5fPEdu9W
	7/3zkypTE3i1vsXii2VfUV/oWR/tb9hGfRy3wkPQEClKFzlga6HFBSNMVbmW/HB5H4JAmb8Dato
	PfTSgvQlr3Iu34cZwS7Z6/tNEtRWHRcVuIiIjXCx6eLp25QVfUmJ1B7td+719QBzib0TRzBIlDn
	8nBJPrmkEop47cda4ufw50OSFaZLvdMCnXSshqccGT3zwdoqxvNoeb/UkYCx+NmRns7F7hOT4t4
	dsOIBBiQA4Mml6rCoucprTWvaykI5hhraMdM0a6YRasUlbeJliTSSMqVfK83odS3B1vMxquc82f
	W8ks/jMNiaFhMeH6GI+f8meT56cAG7sAkVysBgtJGxpoyidoG3RNP1uCZZzmZhl+rBAelow1OJ
X-Received: by 2002:a17:906:dc90:b0:bac:4b83:aa20 with SMTP id a640c23a62f3a-bbebe51fc7fmr35652866b.6.1777593320283;
        Thu, 30 Apr 2026 16:55:20 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6da73509sm48290466b.53.2026.04.30.16.55.18
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:55:19 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so793452f8f.0
        for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 16:55:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9IoFnIjO5CcD6nW4d26YREWucgx29LEpz8+Olmz52lv7z4eLAW3dB+6k98/v6QYTxU5XbXKRiINwYO8w==@vger.kernel.org
X-Received: by 2002:a5d:5846:0:b0:447:55b5:d532 with SMTP id
 ffacd0b85a97d-44a87f60a32mr1080919f8f.37.1777593318187; Thu, 30 Apr 2026
 16:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-8-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-8-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V2H426VR8z5EEm4bWuK-Fvg_wr+mAkkaAfJrWcU0kV1g@mail.gmail.com>
X-Gm-Features: AVHnY4JV5Y3mu38iXutrpDHLS51XF8wv90SD0VK4jxBhsJoT2PtDnx5IHddvQ_U
Message-ID: <CAD=FV=V2H426VR8z5EEm4bWuK-Fvg_wr+mAkkaAfJrWcU0kV1g@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add #{address,size}-cells to
 Chromium-based /firmware
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, Julius Werner <jwerner@chromium.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 28, 2026 at 1:07=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
>
> / {
>         firmware {
>                 ranges;
>
>                 coreboot {
>                         compatible =3D "coreboot";
>                         reg =3D <...>;
>                         ...;
>                 };
>         };
> };
>
> Notably, the /firmware node has an empty 'ranges', but does not have
> address/size-cells.
>
> Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
> non-translatable addresses") started requiring #address-cells for a
> device's parent if we want to use the reg resource in a device node.
> This leads to errors like the following:
>
> [    7.763870] coreboot_table firmware:coreboot: probe with driver corebo=
ot_table failed with error -22
>
> Add appropriate #{address,size}-cells to work around the problem.
>
> Note that Google has also patched the Depthcharge bootloader source to
> add {address,size}-cells [1], but bootloader updates are typically
> delivered only via Google OS updates. Not all users install Google
> software updates, and even if they do, Google may not produce updated
> binaries for all/older devices.
>
> [1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
>     https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
>     #size-cells for firmware node")
>
> Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
> Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating no=
n-translatable addresses")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   | 5 +++++
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 5 +++++
>  2 files changed, 10 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
