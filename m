Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795331749;
	b=FxtX16ly6OA7Fj2sbnxBffGMm07xgA3zxwQtl7I+hOq+VP+tu/2dREzGMjyJn0kXbSEQ
	 QY90bRvXWOwbVY8buTOxP3pc+SCG7O6aVrWGd5NSQtkJUgHHwGyqm4AkHPA1+zdYqjwXr
	 Dh6LW7IMVEMbbPpEoPojP4NqrFJR4pUoOnYWMVUNpLBTLhdJka7mEQ2vxKC74gYeWxD5A
	 TRHZJ6XYvAeu1sqh8NvFR9PchlnVSC/kPI0ZNGo6x6YKPOGjEjlMH6dfC42lFLlDarpsZ
	 dTqipzFoAhVzpNTHRYtC8zPmGljgvOUu/kHqkM+csRExfwcoatZARlVvyWETe3yuiiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795331749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=l9vVVtNKbsfO1loptCZ6tnTCDjeM/wB8BwK7TcAw3O8=;
	b=xC5RFq8Smifs1qjXRZbQVYn5Cj0sIf9IEgz7ZjZsKNoPajdNVnjXt8bV4aIVHxM2PUlf
	 DNZxH2Z3iquvOt1ysG7Tx3VKE4eKuLz7OLswMeoYrz8U1R/pheEpfvHppE3qompD6Yz0W
	 Xkkx/7Vr8f/Yu4tT0a6IKGqV/ZCq6R7O2Z37fgyN2Z+OUi/UAjQnAInXBgCzdTWL6vFaO
	 l664PAztEbY50bmZSNi+agqC3g2t+tc13D3ZBopd5jm6UnIx60OgJ5SF51d2S1hk5NN6/
	 kMWp6Jv5uXXn7nV3nb+dQZ+xRYnh2ius38nO55eDc1dQwNviCqwcxbPPvn94u9BdxGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zgOydCgG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CE8606A32C
	for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 07:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60CE8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zgOydCgG
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5020354eec.0
        for <linux-tegra@vger.kernel.org>; Sat, 21 Nov 2026 23:15:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795331747; cv=none;
        d=google.com; s=arc-20260327;
        b=rN1rw5TUWvRde7rQVeAn0WSg2Lv/p5ZGOGSH45MeQq436Kn4dam2dDhi3+jvHo9XZ4
         UQ8HPxjVKmvQxqNXQr3nWeNnpU8RZTLjR2yWivCR1PDkhXwEWxSAwQHIFnh0Rw2nwz12
         X2uRaWia7R55eAtemXX6Uqcf7KUV0AHjIYe8iboV5dgLHOYN8yiWMiJMNIqMbZ8UYsOc
         3KOV/ILikmuPyLyoivG8/20jtt5xXJdqbeQmi+AiL2WlboKfrxdaLQ/mYQFT3SdifKxw
         MmSYV2neWQ2rxu6zkobAm0IDprg2q/Td3YLufLo7+jJmBm+AWsadLbXrWT3WKLbaYAYk
         sZWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l9vVVtNKbsfO1loptCZ6tnTCDjeM/wB8BwK7TcAw3O8=;
        fh=+eQSSGPKZgRsMIrbkjoPzyagfqvXPHmigUFn9xaPdFE=;
        b=ZjWOWm1whf5tDhK5nwYHb9P9jROSAowEDNzhUMmvheL91O5D+VVNolWE87YdjJ+AyV
         ANTMFgxEDFqZ3lTpdp6YlteJgSAD/jLfw1BH3ISQvFhyd0X3AXm5yJ7yol9+F3nk9HBV
         SNATHxDZO5CnguldR4Kmulzb5AQH5J7GqLQPGETY61jmMEQ1d2saubsDXdnkLx2AYiib
         K/pfpuZn4vwbJuketWwue95oGQkk5I02KiDDCQ9p4KNOq0sHFpbQHg5JrtfIxGkvY2gX
         ORCigGLBf4ClJ4nq2E1drJSfdBTXPZSCxpqRrDrUTuVh7N6X/OrbnEkClb2LaXFV+x64
         tOHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795331747; x=1795936547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l9vVVtNKbsfO1loptCZ6tnTCDjeM/wB8BwK7TcAw3O8=;
        b=zgOydCgGLvzBHGnrewiT47ZU8ehdUIjbWWf5N8uDJ69f4Vj091xIH3DxzcHRGMxAek
         HnC5elPU/gnZCscPtieK8HkhRL9dpaKv5HORB7OLuHwdaIpt4ELAQh7JXElTADKSoGpd
         y2XGih4LfJqzUM9FwpTmUiBZHLJ5SxfJpwZbdUM54QhvZPoAPGV1X4lffvEnL1MOTsei
         cG/QI43S7EYmYmewrMfu/gX81rOx7dGOA4YH6EnZSN5tER5GMg4WgQvR8k1AM0wMNOjd
         Tryyu6Xkm0N0hM6LG+d0/rkZ1mqF5MTG7JblsPGW+a/cvEJVCgZOCWvpYVYKnKOIYWke
         wY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795331747; x=1795936547;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l9vVVtNKbsfO1loptCZ6tnTCDjeM/wB8BwK7TcAw3O8=;
        b=desN4Yry6I4/6LKNo3ddAvW4+KUJc5J8jYI9cnZaWg/zxB20qLdglPalFGbJYDvMjW
         bwN22TdNA0y7ZJb0xRe/YPuFnxbaJZeTd6Y1H1WA7JPjyZGijQVAf/PcYAJPBANVV+jC
         EkdydAtfGnQ1a6zKW6xxlZRhUkSJTUnEBbFH83uE64IxKobFeVIfh9GrLyq7n/LQjPzI
         Zf/k9jq0wl0HOqDiE0o9NKJne7BDfmmsQAxtu9QvVT3eBaIxAbZQZZCFE37+fasRwxWG
         +9Weqwyfd7mK7BFrSC+vReakGGc42a0GAAUppd1wNctIIxFdaI8Eb0BjL4q2BjBmHeCs
         obYw==
X-Forwarded-Encrypted: i=1; AL+hErGP6gynuVjIAdUw1Q2wp8Mntu/sfv/pcMpsblFuYByeGJjXNKt65Q4eIopWGlwkEHsZw1c3vB4dcrA6dA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Lw61nDItAQE3Ug3yq3+wSuWsSXThUW82dO/sChTGtF4qZPv4Q
	KF5oco5TqzzAzjIzfdqkGv1jh8RszLjI3/Homv0QSzx77AXnD772f2Qoqy1KSwJ5cvnqABhqS6o
	Au6cv7I3b7kuJIcCWzbhQKyAUCklMAYDtnDqy
X-Gm-Gg: AZFdTZdoNM613eREGsckdSujsU0kqxfe/OZ/GDkj8je557LoAZUdN1Ol+WOFkAuj/1n
	KRIkn0Ym2xIp2HT1EqIT6UXf3s2jXcMW8Goi2Ov3UGzXb8iIYWsq6E8SOSQgqicHyzjHQMHmyzI
	Qm13C5cVMe6kGi57Gx6s8xuIMCH8d7GVknn01fz+bhsK5lnPfLLBMBxZCBZkme5vVAeFuhnqYdU
	goDDHOgi4z1IO6r2lyIFbtHOmU9JLpEir3zSHhFKbCx/CCLClbmiozm5aF0ONhZPZMeaaQ39jSP
	wyozBoaGsA/zaNe26IpSZeMz41rKoDNMWHgGKZ2WOI/iHv3LaAkE7PDQZJpMMZPIug8wJ17BEd1
	N1CCOXtlF/bNDWIW6YVHgrIchNTll5sbnKI2Z8IfVzA219YU7VbeITuPva+PhklAA0SKP5j+dnN
	uWJmUJ0gSLh+S92Xlv6qx3T0EhIP3bRQ==
X-Received: by 2002:a05:7301:160e:b0:384:c1bd:aa5d with SMTP id
 5a478bee46e88-386a87f00a6mr1177313eec.30.1795331747418; Sat, 21 Nov 2026
 23:15:47 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-b4-host1x-mipi-clk-leak-v1-1-c14ac933945a@enser.io>
In-Reply-To: <20261122-b4-host1x-mipi-clk-leak-v1-1-c14ac933945a@enser.io>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 22 Nov 2026 09:15:36 +0200
X-Gm-Features: Aa3M54qHH4yO8CRWw6s4odlh_SwLNi-dJlAJG3IGVZ6eeuCgoP84FoSy-vDiSHQ
Message-ID: <CAPVz0n2GVmhrR7nuNLrX5n_1Ka4_r0D2kZ3dYxNHjTiQAnzanw@mail.gmail.com>
Subject: Re: [PATCH] gpu: host1x: mipi: Disable the clock tegra114_mipi_power_down()
 enables
To: emcp@enser.io
Cc: Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 22 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 07:1=
2 EMCP333 via B4 Relay
<devnull+emcp.enser.io@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: EMCP333 <emcp@enser.io>
>
> tegra114_mipi_power_down() enables the MIPI calibration clock to write
> the bias pad registers and never disables it. tegra114_mipi_power_up()
> pairs the same clk_enable() with a clk_disable(). Every DSI power-down
> (each DPMS off, each suspend) therefore leaves one more enable behind,
> and the clock never gates again.
>
> On a Tegra Note 7 (Tegra114) the mipi-cal enable count is 0 at boot and
> 4 after four DPMS-offs, with the clock still running while the display
> is off.
>
> No register access follows the new clk_disable(), and every other access
> in this driver takes the clock itself, so nothing depends on the leaked
> enable.
>
> Tested on that board: the mipi-cal enable count stays at 0 across three
> DSI power-down/power-up cycles.
>
> The code and this changelog were prepared with the help of an AI coding
> assistant. The submitter has reviewed both and takes responsibility for
> them.
>
> Fixes: 15372d4be7f0 ("gpu: host1x: mipi: Power down regulators when unuse=
d")
> Signed-off-by: EMCP333 <emcp@enser.io>
> ---
>  drivers/gpu/host1x/tegra114-mipi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/host1x/tegra114-mipi.c b/drivers/gpu/host1x/tegr=
a114-mipi.c
> index 49ed05d1a6..06130d453b 100644
> --- a/drivers/gpu/host1x/tegra114-mipi.c
> +++ b/drivers/gpu/host1x/tegra114-mipi.c
> @@ -197,6 +197,8 @@ static int tegra114_mipi_power_down(struct tegra_mipi=
 *mipi)
>         value |=3D MIPI_CAL_BIAS_PAD_PDVCLAMP;
>         tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
>
> +       clk_disable(mipi->clk);
> +
>         return 0;
>  }
>
>
> ---
> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> change-id: 20261122-b4-host1x-mipi-clk-leak-ebf2c34b1640
>
> Best regards,
> --
> EMCP333 <emcp@enser.io>
>
>

NAK

I wonder if this is AI slopped, or straight up stolen? Or maybe both?

Existing patch sent 25th of Oct 2026:
https://lore.kernel.org/lkml/20261025-upstream-host1x-mipi-clk-v1-1-6bc6e75=
5b4cb@tsv-stahl-riesa.de/

Reviewed by me and Mikko.
