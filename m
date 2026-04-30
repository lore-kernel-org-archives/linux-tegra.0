Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2876A3D8112
	for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 23:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593312; cv=none; b=PRC5YJP3b2VrJfhOQ2W8Zax7OlyujtNZ+gHNAaTgXFa/LnazZNQOY5P/oF3FRF6DIqj8WqI5TxqKO2mK1hFVQcuOcwsR3P5YScrX+vSJQpOiNflJ8EOdXB7kqWAhKeijB0key6YtH1JOgSK+rm8C2NrWWlpoSfqikuDL/XfRsfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593312; c=relaxed/simple;
	bh=1iYFrQZWmKEVWrScCekgHrk90TTezLU+zo9EhcJOGkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TmzItPGA7hKvtNcBRHaqZrIwUbfwaznQ2ibhHAx44WJpkLZlFZDHkoNyEZaAFaKa+S1so0bC1un4JoHf0WdMwPqrqU76Oi9Wae9oiB5v8bP9G/yQn95daN/bJQk+oMJMNdD+I+VTnXWGMDARFaRNDtYgDIP8i680IBJDh1Aw32E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y/lynezG; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y/lynezG"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6788838d543so2673240a12.1
        for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 16:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593308; x=1778198108; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+mZxHBvv1WgYnS9amllda9wyu/ABf+laADAiAQpVXA=;
        b=Y/lynezGFGTNjZvriwDiHoh0sNcrX76kjWnitv/HoELICB4FzL0gERyVIp2rHgVeiE
         lyFis2/ad/SLAFtiB0ryu4cCOi3u3zBtGWVX/XBMgE8cm9p5LvcRismzP8AVmduWtEoZ
         xCow/xR5HdOJ76sFUM7etTtymYgUhKoIvojrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593308; x=1778198108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6+mZxHBvv1WgYnS9amllda9wyu/ABf+laADAiAQpVXA=;
        b=BZb+liGWmv+5bkzfsVO3JRz4T2Nq7dRdD/qS9Wfsl95qxyXYeNvonSnyAX4utkfpxU
         qPP/7mH3w6wYiipJvAiAoL+4uTbPv33tY8arbSqSeEcfx48+M0wPX8p9q0fAgR0BDEzd
         J6gwvnXIKUXx/kW/8Is/5ZGYyjMq7caVWbm0wGDlzhgtiruQqYzvdQ5i8TsG9IJrawc3
         AdhEXqERHyIx/w21f8a5Xp9LNHmaguE9WRnZO6sxE7VaErZ44rp5Zhq/Zig/O1lLoOKa
         877AHkQAcczCRvjXPw5hh6AXXzULN9uUoFICnHSgpn5F+G7GUL8nWIzmKTTMdKTJORWB
         QImg==
X-Forwarded-Encrypted: i=1; AFNElJ9ZvXO8IsH//eruJac9RGoJIzYRXoJy2U5jvCSJisWh1j9IuLINs/cNETtWnnb2Xd7OmXlTmC4nmeBy8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo0RjHUcaVGPxnEtr71yKoYIBmRmkIEXyhnlkP949xanzyK6aF
	EciNrkL77cQe24SLCnVFnhe38vNUaW9DS9fOWAZuyQFH42BwLIi68yDRd5Sei7QvzMjB29Z0HS0
	JnnA3Wg==
X-Gm-Gg: AeBDietcUJUzwbvGKNC7e+JJYuwA2H69rKtN4wp5BP5efBUa51Dcac3fqzzT2pFWWjq
	d5OmElsDQngMk+zspGXJizaACXG79IPY4KXT5BytHUQlBCAJGHD96UyC5ocMurv00hU0KwLE7rD
	0kn50QVc49P8n3p+ewDgrubYowcJBu7lEeBHwxofeYpSdMpaGNv9QOGsEM9TN4ZnqZNK47t4uvJ
	aZZt/brwer5hSoYXztBFcRP2YWECHLb46ztE7/5mZZ7XmH3AMCjUblEOtr7eYdliwD4igKMZlaf
	/NTrvRlVQNS43C9UPZNyNBmlzStr8FR/fu08jOqGtZGX+RzpD1FjK2CAPtjMVbRapngkh/YS1L8
	fGM4ggEPH3Kn3V4F2VQR2MdkjrcwSxG5G/7UI1cqEhGaeMpEq0l3Wd4t0KdHDq8MkB3VjhsmfQ0
	zi528tX8So93fbTH2ZnhLOC71GKcP34JsC31bdIMVsjpjQl0zEPW4WKgy29joctQhOa93zOHYZ2
	EzNJDxTFWU=
X-Received: by 2002:a17:907:1b16:b0:bb7:e6a1:e09 with SMTP id a640c23a62f3a-bbac53de1aamr313891866b.19.1777593308386;
        Thu, 30 Apr 2026 16:55:08 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe69f6bac7sm51211666b.11.2026.04.30.16.55.01
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:55:01 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so14128265e9.2
        for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 16:55:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+hujQFxXtWwaRUuZDTN0cgLUtOBXdTn27ZhGLv1hoviAjIzBUAJO8biL68T8TpMDS7uy5qTzcXcQmwBw==@vger.kernel.org
X-Received: by 2002:a05:600c:8483:b0:487:2671:fb8f with SMTP id
 5b1f17b1804b1-48a83d73324mr83882365e9.8.1777593300707; Thu, 30 Apr 2026
 16:55:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-7-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-7-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Whp6JADcVOZ11Jr=5THGrCe9cWZhX0ye54wQ84GtUOwg@mail.gmail.com>
X-Gm-Features: AVHnY4Jn8yjvVDQMrk9sfxS2s1IXmKHM3MKByZAYOfzP-smNW0WjILYj0XY4G5A
Message-ID: <CAD=FV=Whp6JADcVOZ11Jr=5THGrCe9cWZhX0ye54wQ84GtUOwg@mail.gmail.com>
Subject: Re: [PATCH 6/7] arm64: dts: nvidia: Add #{address,size}-cells to
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
>  arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 5 +++++
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts  | 5 +++++
>  2 files changed, 10 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
