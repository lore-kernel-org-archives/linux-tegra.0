Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374B03DB640
	for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 23:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593309; cv=none; b=CQSCv5EHliaXbL7ZfJJK+AJMcYb3vsJIayjWCBF5k/dArn8+Jj0bcrAc93djVrXpEVqZh0/vdAQTHXUBkrKH0z5pIfb4/AQSXhoIxp7NveHfgmMQXIlPq63E7kUR2tuiOA9BRdRgLXQZD/NXLMWlVFb6Sc1qHksi94YpVVUS15Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593309; c=relaxed/simple;
	bh=sQxuhOfm4oyjjyHRHwYJHnDekKF9G661/WNU4U8f4VY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CjCuwwxnWn9PWBgMbf0GY+a/8uZTphgBhBE7oEB25EhufUmq2fZ3QQeU8ZyYM4/qOwL735vHIBs0uWUj3mrPbs5v+Q6JuvZXchuTzM1sDK7tjA3D+uhbIkJcE4Gnld80SEHaOsbY6vpQAK2gGIa62xuq2ORqPDjxbpBQdHbJEQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MhbpPeMV; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MhbpPeMV"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-676fec7e946so2293163a12.3
        for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 16:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593301; x=1778198101; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/X8TMTxizrgbcCVq8AAcQ8SrqTljyGddB0DA+TirOI=;
        b=MhbpPeMVFslCh3grgpvHva2pRt7BZmX6zRhcGG8ITYnTYAhvWLlO1Ym8eoLMAiOeKv
         pU129vMY/SAk3GGZ3WRoRKDFbnT5D70lDieMEQzROMhmstz8JymR+2+fK00oOmldbcGW
         MgRBhlQlh4IUFCS2Z4fJB4hTwNepeEoXA1FsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593301; x=1778198101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z/X8TMTxizrgbcCVq8AAcQ8SrqTljyGddB0DA+TirOI=;
        b=jwX5CfZqjONZ60HXEcQL4TZr0uS7otIBJGllf6mlAkWDP5gjPlCZCBD9sEk+ckhZbj
         +PbDjHgqvSQX3MY2qmu6rYW4F5LTNHo/h4NZG0NXnorPnyAfEsaRpRe+xSFu0xXRkpEJ
         rLehYZefBX+tJx7cFN86YoWejRZAgzJEg2LVjxoftXwMp2+aFTetLXBZ9/NxnnKTp1Ub
         4U8biTmzORvK4OkQh6rHt77+cSxFEncGOotHXe6JdBR/jye7BWd0jTf54skSmcxNJf/o
         Wrrew7nFb+fc9sTVWl5xr8nAnd55d20LYGzcCv04gruwBvuXUWAdd/ozW3S2QHu2FLaG
         kqmQ==
X-Forwarded-Encrypted: i=1; AFNElJ/GxPT61SSn9PmpsTLR5KpmHA1j5x3qTMnCEGqg6pj0deFGlr8OMEaeDu2RZ/r/uGc6N1VvRkNpHvzzAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXLJFnbKvxA+lHWawVbHUHD6+FkLk6daMG50uc6/UGoHT6zb1m
	MgGg1LswwhvPL216p4kXrcVWmgP46Vv9cry+j4kFRcDT66AuAK+iuwq0pEHZobgHxPnqVq9/66K
	GqTfqkw==
X-Gm-Gg: AeBDiesAOZzXNDHETvO0o/sT6cXNJHo/QJjSfuj54PoPEtAhTxg6S52BeaSQ1u4HibB
	g7jqbCNiuZK0qTBeWE7AIoGu4jXy6qXtUTUX/lKEd00xSyhqmURNybm5CGWSivtbeGyLcHerVJ+
	A3d7FrFpBcmE3EdEz8kcFndsjEXCDTeWQttviSKXIq2Bvi0iHZymqSfXny0wgzC1P/NxxTGWxrx
	eYouKty07smsQSlVv7roA/WELwvlW5VG0o+1pcpvTVY3CTOr2jhQU+kls1E9xZlfm+wXoVMXE8j
	gL/LZd6AmzbEWMJQm1Qqao6v8rv3L9zkEApgisY57CwG5zQ5PSRd5j3XdhpdKmN0BrIho8N0j0V
	FNQwGrmOvSA3c2lLUziN9W3T9obKIISlYsbve6GdKncQVESFdtmsFP3T+PjzJxtDd2Xg8adosW5
	KlYl10mZ0VEwGP7xrXwJ8xXw45WRTYWU0BVz/TiZqV5dosYMts/A90vGv3wiHgUjR9ACqqcXSk
X-Received: by 2002:a17:907:960e:b0:baa:6847:af9 with SMTP id a640c23a62f3a-bbac788f98fmr312861766b.28.1777593301264;
        Thu, 30 Apr 2026 16:55:01 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6d97e53bsm47685566b.50.2026.04.30.16.54.54
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:54:59 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso14629505e9.0
        for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 16:54:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/a5s/6pAZAa8+mb9JtmdnwpXtdAlSJxZ15f2bZ49sB4uHggEBLlGOw8jtOjNiyVEoAkyFfNdVyYt6Jxw==@vger.kernel.org
X-Received: by 2002:a05:6000:26cb:b0:43d:6fb7:fedb with SMTP id
 ffacd0b85a97d-4493ec61e55mr8612204f8f.36.1777593293572; Thu, 30 Apr 2026
 16:54:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-6-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-6-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UcDrakNVEZW24hCRizyh-VkgCGiZaPd3z+QyPoYzU=YA@mail.gmail.com>
X-Gm-Features: AVHnY4KLFGb62k1dRvCKyy7EF6W0tPNO3zKHC2HCyssJ_nJGpMzpFc_-TEUNEXc
Message-ID: <CAD=FV=UcDrakNVEZW24hCRizyh-VkgCGiZaPd3z+QyPoYzU=YA@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: mediatek: Add #{address,size}-cells to
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
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi     | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi   | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi  | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi  | 5 +++++
>  6 files changed, 30 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
