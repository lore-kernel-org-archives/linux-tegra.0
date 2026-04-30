Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815873D9DAA
	for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 23:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593260; cv=none; b=mIFVawqIFKGlAdl3Gs4UDD7IFdyXBVk/OQiVljEii+Y2skDcLhBNQ0MGyyFxp9Ad4Sh/nXgGI6p41zwnhlQufztGqr711/8JHKpPJBFshUt9ozSY6g0AY+2MXHoOzLUa+VQNPR260DR0dTK1xyEF8xCevWY7nQu6/mct4kMINlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593260; c=relaxed/simple;
	bh=K6HjmbNrmRNPQFoeUy4vXzHlo/g/A/oFQFErhjwT8ZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R4IjYmZLFOAmGjCO5CnBwiFMxGmHQU6FTKxjq6lDll0FQBeO0+hvHERL+mnRMP531OHljOTgKjZAiqLdYv5f+DEXQV9REAyFd/hxyOUNSSU5ICJTqul6WEQa9YNembQfsk2FHwlQH6STTBmqzZNlw3AbHYcV0/3EcmYwIY0Cmbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AM3+DA7a; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AM3+DA7a"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so2825417a12.2
        for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 16:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593257; x=1778198057; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9C1umI5D1atr9W6hfkEvQCrhMpTXSs9QJYfV/9UKu8=;
        b=AM3+DA7ayxN0ymayFdq1JUsZiwHZmV22XyjtLF4wlMD3IkMeEwiRoIxg1+2NRtfsdt
         6F/2NZIeV2HBAAGVctq2BC33ohoLKyGpBARNegdFWUQ1hb4YeQA/AZMZUuVH8DGc7ySi
         e5MyiQmn2n5dhONcjkY8lvwiy8ppxJwt7PSvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593257; x=1778198057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E9C1umI5D1atr9W6hfkEvQCrhMpTXSs9QJYfV/9UKu8=;
        b=j5x4TU/jo516EAZ8vQhAsuMxlwebyirnjjuqcxQAm8ji3C6SeluAoWA4E/dTvAZb+C
         hE9dQ99gLfrlGZkntUCcfxGHrIu/4dGURvf4JAf/B9O74qQ39BDeE7b1WMriJrjnF8kL
         4rlvidQ8Vk798QFnWF/Nx9CdFL5wrPs30EBLKoHWxm5XlG+KfdfbLLBAki/b0+7L6jYq
         6tM6m/q4mKH3SJGOHDJRlhXYf8AyEsoY0CKCKMT+aoobmHDTPSEhTxMoTfQTYtEMHjyd
         m1IM1REG40L5uu0paR5n5pwOTKAxGt7qlCqgNpQ39CmdqYJrrfpPxtNEd7XAEUIYvM7T
         VgFg==
X-Forwarded-Encrypted: i=1; AFNElJ8FPGWbUNhAGxNK8ycXmPPnRSp15WGKjPV28zuFJlR6jwbRenkNI9MIy0WRS+u3K3IW+Urp9xEodc4JAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YztN1cbve361+dCM1fC3AC16ZBY7snQ+fatJzGD8oTYjfm9nLuh
	v+Mop5B6oJvo2wfZhtvMyypjhH2gjQ/jfHt6pvCgZ2rZTwo1rYkIdVou1+Hlgk0mBs8yHmTWPjm
	LDbugBg==
X-Gm-Gg: AeBDievGRytIDBs2UifirwGj2IOwu3tTbYmZsPsvAK2mVj/zJvkqJ+qntgfW4O/2s7b
	SFIcVJDlGy97pdG+f8Ft98XN0mu78xttWhXmqF+OLRmjFZ+NzIVsDJmGKun/YASa8aw+G9GS21c
	MWh/lEqIjKgO0WlJ97vUkf4GJwbFCdY2/fRx5JSmsB8ffGuJn8Tqgwf29eW/k/6bKgX7i1Z/PAr
	5zQqNDHpFm7+BoIqbNJVbxdeIg4bDnAK2ozIKnJqqHbVf7v7eBX/AJzOTlCVLLMv6TGXJJ9v26R
	aWsytBgUl0saTmYJHe+YBZapj0K3+dRKJVyo6A4g5L5IKDKUvc/cx5MtzTDETyh+Cz47xOa7hnU
	kL2ykItTnJmCb+YSMQUolHMxgZUJ01JK9zHImtPlZnTkeUoyPoXpSpJzOXH+33yrX0J+oAx9aw5
	VBq0+QIfDA9fCyRpdKDt9iMRCg9ZZo/V+8fL/3bLp6xIXYAUEIBttgv2PRuw3oeMMIlSpqw0il
X-Received: by 2002:a05:6402:11d4:b0:67b:4e46:f13c with SMTP id 4fb4d7f45d1cf-67b5d8490f5mr2660169a12.23.1777593256989;
        Thu, 30 Apr 2026 16:54:16 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b87dad926sm410010a12.20.2026.04.30.16.54.16
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:54:16 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d70b3e159so757132f8f.0
        for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 16:54:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+zJRRAu3d82E3dYVZZMuGAzg4zXxrzcOy2S7Wb4OCx8VTmx+xhs18vcI8zQBMRAi7FvH+7YvEll2rGvA==@vger.kernel.org
X-Received: by 2002:a05:6000:40e0:b0:43d:50c:6f18 with SMTP id
 ffacd0b85a97d-4493cc3fdadmr8678277f8f.11.1777593256152; Thu, 30 Apr 2026
 16:54:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-2-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-2-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WhtAz7WM+AsQ9yTwzQMv2B--c1ca27a=fpvVFccRVd6w@mail.gmail.com>
X-Gm-Features: AVHnY4ITNUkQNF1rYH2AzAfyi5kerkzeuZiwFrCYx_qZbGHsYv-60K7BAEKUu9M
Message-ID: <CAD=FV=WhtAz7WM+AsQ9yTwzQMv2B--c1ca27a=fpvVFccRVd6w@mail.gmail.com>
Subject: Re: [PATCH 1/7] arm64: dts: rockchip: Add #{address,size}-cells to
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
>   ## From a RK3399 Gru/Kevin Chromebook:
>   # find /sys/firmware/devicetree/base/firmware
>   /sys/firmware/devicetree/base/firmware
>   /sys/firmware/devicetree/base/firmware/coreboot
>   /sys/firmware/devicetree/base/firmware/coreboot/ram-code
>   /sys/firmware/devicetree/base/firmware/coreboot/compatible
>   /sys/firmware/devicetree/base/firmware/coreboot/board-id
>   /sys/firmware/devicetree/base/firmware/coreboot/reg
>   /sys/firmware/devicetree/base/firmware/coreboot/name
>   /sys/firmware/devicetree/base/firmware/chromeos
>   /sys/firmware/devicetree/base/firmware/chromeos/readonly-firmware-versi=
on
>   /sys/firmware/devicetree/base/firmware/chromeos/active-ec-firmware
>   /sys/firmware/devicetree/base/firmware/chromeos/firmware-version
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-sto=
rage
>   /sys/firmware/devicetree/base/firmware/chromeos/vboot-shared-data
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-siz=
e
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-off=
set
>   /sys/firmware/devicetree/base/firmware/chromeos/hardware-id
>   /sys/firmware/devicetree/base/firmware/chromeos/compatible
>   /sys/firmware/devicetree/base/firmware/chromeos/firmware-type
>   /sys/firmware/devicetree/base/firmware/chromeos/fmap-offset
>   /sys/firmware/devicetree/base/firmware/chromeos/name
>   /sys/firmware/devicetree/base/firmware/ranges
>   /sys/firmware/devicetree/base/firmware/name
>
> The /firmware node has an empty 'ranges', but does not have
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

Reviewed-by: Douglas Anderson <dianders@chromium.org>
