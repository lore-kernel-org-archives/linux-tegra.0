Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5950613C918
	for <linux-tegra@vger.kernel.org>; Wed, 29 Apr 2026 04:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436244; cv=pass; b=otlNlhcs3P+lDEbFfVJD2YS3rYGBSGaenhFSiQZNJ3zo3Mo50JQxd20pz1L5N625NI5UPpJOI3BwVX1LtOZerMftsGg71I4ZppopzlgEwugbtFes10OV52GBWhq43kqDSC1sJbbXoViZlrlg8+YCssjJaAcE1dLb9vD1UU1IfyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436244; c=relaxed/simple;
	bh=ucY3TNrWMvRb0oHVhltYdiDBL03lh8F0+Cv3NgZ1q9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EId41DTECxVnjng3AqYPdMYsa00dd3phJL/SxnMpZ7q2LRQQSoEoveaFk5NxPBmV+HsV1z6Vtaz9nmCFtX1o5xPKot6C2+lGvYmbX4GOLZXIuWpN0OolN1G/0GoFmFMvouB7rTm2/NHzYMVd5Md99jPnrqyPtauzvHSmxn8F6DE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dvDACpim; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dvDACpim"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a2c7427ad9so11859953e87.1
        for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 21:17:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777436241; cv=none;
        d=google.com; s=arc-20240605;
        b=dpoLTF0SgI7ZMYnZ5n3RV7Mv9MdxpDtB3ins8y7sF5840B1VP2j2J3ziBIcD5bIbOM
         X0U2UjpNoEblo61aC6lVElSJ70i9One9westpxFrDI/4Dl9vziemJz54RqJws1KF9d5v
         5+XmiZM9TeecbrQZZ5UmY/XEAe3L4shcWzR87b6KhzAP14FGWrSDofLsqn/0DlOtjV5p
         uR5fqjWMjk5BpOYVp6CMGrxbDjaiJT6e/17eYIlHj2S52FCQuFrS1Wqdg4XcOzYA9q8d
         U8LBR3/50hwxnjlhfNY5kxOszoClJpxy7ey4wmLeCsQTzRjAJd30K6mF86NFl0CoTS53
         9ImQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S+wgx278PuWohl1935Byl8WX7gkc8WHJmkUS4pGdFI4=;
        fh=su/PcUdZkJ5qmkQyoJscOeKsEq8kvCtYWdr4QlQDy0c=;
        b=Ersw0twd0CkmIOq6xAnu9Q1EhOgAen+brEEMrEWhSYMgUBlwreQzXSWl+VN9uMkWNz
         4Ej9bjMpWP4p40jE9eM83mmpjmwEEVRw0e8XLWAF0zJbMUr6Qo+2kXPaoJF3NzWcpOjn
         DA3yM6Z41OOkzLyC/JMD7WLrEHdD9h/wE8qza5yTyaZfb0YCUg4nAgzM84DSx95JdxHL
         Q86JJLdQvkvF77RoizpHT3/h9+LmldDxC9Dqva390thX4a610hV6UBtpEOwwykpKoA+r
         YyBeY3XSe8E94kpf/NnOYNaDk3Cf6GVrrJRGG/qA1uglOQr+LraG3B9JPOFHTO4cGNMm
         3G7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777436241; x=1778041041; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+wgx278PuWohl1935Byl8WX7gkc8WHJmkUS4pGdFI4=;
        b=dvDACpimEfz+lkjDu+p4DjT+fvQBqaJ38nt13vAj6O5Zjc3j5SRV7RVEUyAsHY5zDy
         k7SDY3R2RpdAJvuxg2G9SneYMEVqCzmGkqLfRFIYzTR0vB68T5h0PdGzttJYBLPSjwwp
         zysiSnFZUrxLZPQ4xUk/g5MimDPy32mTPkyA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436241; x=1778041041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S+wgx278PuWohl1935Byl8WX7gkc8WHJmkUS4pGdFI4=;
        b=mfyq/oiYEViJkdHfrcY3BcE6PqaqnBAxRyesjqLRFx+CnXEEXpbOncvk2C55JbG3Hh
         +yFmGHRe83slP9k1nq1U+cUf5GDR3AiA1jzU/dPbOdzQ1lHCntx+jJwN7WyQkjaGor43
         J8gkrKanJ4NaUliZm4H5j/pG5KD49s7K0SZ+x+duUcziRA7KvJlTSQcJfkB+8mSE/rrv
         jj+L+HdUi4+WPr9p5/h7ddaqyWrusfuQ8kahJB1OWOi7odXa0mYZ70iM/Lz0kxP5N/3M
         NpsoLT8GnKVP6nFsFQ/blZILZ6V3BUjf3PKVHFw58+a+oCyYGHFke/4YDfIBzoyOSAQQ
         GNyQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Y39HE6phSXyG6jLk9Gut27T+Kv/0uidwJHDBDobQHcsuZrWYyNejgObUXTYau6nLCmcpA/JGS1sTvrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb23KHmkxvvEoaO7StPjUKwk60EHV6j5w2ZoiSygplTX5XXVVV
	PGb+1qfRW7z8nDD4AMtKtLwAHxuWZRVvKuW5ami8hvY34inqfsIUrfW7mJ0fx2gkf7XAzb9Df3K
	bLj4MNk/ClBBl3j3now2/KNwaIyqbfhm4f0bbjFyVHUz0rTEIfTeVsw==
X-Gm-Gg: AeBDiesR3hDkWIxgusicV47rsP0ptqYqSISX56dww8wjiOBX+YGY2UVRk00TBRwk3UX
	fyQ9YtpsopQ9jG56N+TLORaPStGSHCa2s6EtOdosIgzrIeTCwI5EIVO/EwYOpJFe1Y1myeRZI+N
	SREYG+ml+UB2cUD4GF2E8FE/fokHhIhv9BOA56QQPflNgutdMfpjjU6pC5Cayb0X0qrQufblLwI
	MThmyD6uHum0QpsWpTJ1pLQYkhLJHWoagDgJxvxa6rtfXKrwwxWtHUGjSEeuhYho51XAQxOVNZt
	fYrgvyCAYvhkFAYAng==
X-Received: by 2002:a05:6512:3983:b0:5a2:836a:ca47 with SMTP id
 2adb3069b0e04-5a746623733mr2096698e87.20.1777436240634; Tue, 28 Apr 2026
 21:17:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-6-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-6-briannorris@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Apr 2026 13:17:09 +0900
X-Gm-Features: AVHnY4JUF2jGqzImUjvVT0R20VSVC4ANB99NMBVznnvWckelDQ9DcqAgZCUM5q8
Message-ID: <CAGXv+5FZ0kTqrqWEu8AX_1cxtEQD0urr=FJO=Van20h75_Z1Xw@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: mediatek: Add #{address,size}-cells to
 Chromium-based /firmware
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	Julius Werner <jwerner@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 1:12=E2=80=AFPM Brian Norris <briannorris@chromium.=
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

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
