Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E3A1D6DA9
	for <linux-tegra@vger.kernel.org>; Fri,  1 May 2026 00:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593696; cv=none; b=ElRpc+egBEYdbUPGF5qWw61yudArQpzlQcneeg6EqoHU7Ln7Xf+1Vv7nnact2B6rxH0ZFUJ7VLqj8qn2HezJRaRGnR4QkDEJc87a492pL8tKBDGX/O8ya83QUvsE+R7sE2Reo07jr0fKtohrEQOMiLHbHP9Wd+7UsWlPH6F6bFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593696; c=relaxed/simple;
	bh=rWDl9l88s5smH4oJB25R8ZD9EUfLZO6b7a2lfjBov+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QSfr2N+b2BxxBKKkRgZ+CG73hDGjAcFfHtdd5wHHwLrCLWjK+Ia35kwOh/CN7Q7dzbrRa6/k8E2pwxG0KsFFAXULpri3aDjUxaCf3G7beidZ2GrdeSrQ8jjGDpL/hzk1sqUev8FuSCcZpAJ5oGYSzwuYbhJDnYDoZYVKPBW37rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QwpWFuIy; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QwpWFuIy"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-baa8c78ac7fso195353866b.0
        for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 17:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593693; x=1778198493; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6F0Zles587cKnPSm5xIL1UTxvPC2KivgOEAzPu9dSY=;
        b=QwpWFuIygISrHvrZkFfk+KE0RS/I2OMvWXgVnQojG+GK81DAkQES6zovBZiYBP1Fpn
         Zu5EEjcOCNzMqzCsREWvy5ty2lp6nnvT/TE5FxkEpg6wsRrP8u+Ca9WeK5g9Ha7v4ePp
         n2KkNK/sleNstrA9I2PWOH65ep5HryVV93Wos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593693; x=1778198493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o6F0Zles587cKnPSm5xIL1UTxvPC2KivgOEAzPu9dSY=;
        b=emfadBW67EtzzVr6esEmwGIbgH595EcQueBifrQ/dbI/RVFmzMDbywLh3qMgwgDGPD
         8H311L80GPX5YUROoknXZqCWqFOLPrZOenYaMwm5Ar99qE1McxD+c4ZegzxcOVNTYR+J
         LDU0PZsX5HPu7RlqtWrw/yL+2rjpVTxMBSUypVMHiyEtfZNuuZEBFeR0hvlVgkIaHwf1
         EnfDJ9sKQWsFbZLwmY/ypbiL0PtbrV/AkT74K+Ksu2o9rmuQWERmx2THY7PgMHdO3MRW
         DTn0PpQVnh9iXNdIzoNgedbw/aMbhuxMkMXA8rx7GZ0MWUDabGzYHjvmx1leN/4Tysf7
         H4jA==
X-Forwarded-Encrypted: i=1; AFNElJ+4+eBsA8CFY7aBVRCaUHiGJzGV3bRWNiAuIBjHDx6ojmURfYq/8fakLWGdsSex1Ana29mJVGxVsLWqag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu/QBuwIrGUuBf1K+dabkWg53wfBxSZ7AXLPXEaMPU85CIOC0b
	+KIbdfZ/CuRBBr29zQ6lAsgF11we7eY4A1SI2KpUoakWZsuXsECMG711pYafAOHvEwe3rkCzmpL
	DFIOw59Pi
X-Gm-Gg: AeBDieuIqesi9YfphXQZJ8cytB1tWXcN/FQGP5DUENmtHuMjHbPI0WzJofM2Hc9o0nQ
	YmM4/0AsMPVVqKZ1N87q4EMST2R/4m2Csku7WKxg6/h65c+BDUi21u5LyxnwhnBbZtJDCbXRr5L
	qW3sKVWS1Nrnagm+YaLwWyUzi9DGX5XDhgz+3etanFl56JkHZbPhiQ12COMMZF2y/Uvfyl9x75H
	39ShpJ2WNTxNnWGjg6/ALlk6jOO6qy9wq2PDtfnBSEeAfytH+WKZ25McC49OvncPXqwdIqid3Hl
	g3jh7C48j+y3Os+ix98YPzqw22sgRHEPWDI9oQIH0X1h66HfHlDY/OANInUcPkH+KIrXfPvSwjT
	EmqTszRxSCYx5lTK7DUO6iGObXpGniZHQF68sE0FKmuTTC96GETCSH9F5st6E4geFr3WmWHTskd
	yyPnhi5oCcfm/oghkTjRvHa4Wnfw5BAer9PDVqu7v8+moKnZbFyfIciBhVwwD6OWj7sKvqxq2C
X-Received: by 2002:a17:907:3e25:b0:bbe:4727:a7bb with SMTP id a640c23a62f3a-bbe4727a92amr139234366b.0.1777593693387;
        Thu, 30 Apr 2026 17:01:33 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6d06f3a4sm49548966b.32.2026.04.30.17.01.33
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 17:01:33 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bb962ce4dcfso245126366b.1
        for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 17:01:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8VLlY/hFKvWBM2CKRhHqipxca4BxBc328/Zu0Ik6ajOmmUdL/q+IcfRMBI7l6ci0hmvggyPHuXZUMmDw==@vger.kernel.org
X-Received: by 2002:a5d:584a:0:b0:43d:6a0c:9571 with SMTP id
 ffacd0b85a97d-4493dcd3c71mr8939823f8f.11.1777593275557; Thu, 30 Apr 2026
 16:54:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-3-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-3-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VFCEEBKYY8Wnt6JEK_N4NaUvvhWXYR1pbt6teLL=zYeA@mail.gmail.com>
X-Gm-Features: AVHnY4Kl-1ca-wbSwPcS9uBBAU6zbdhWLbd9Fj0fAjnpUI5H2rQOrfd8cK8P088
Message-ID: <CAD=FV=VFCEEBKYY8Wnt6JEK_N4NaUvvhWXYR1pbt6teLL=zYeA@mail.gmail.com>
Subject: Re: [PATCH 2/7] ARM: dts: rockchip: Add #{address,size}-cells to
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
>  arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
