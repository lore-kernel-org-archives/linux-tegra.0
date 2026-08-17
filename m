Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C9D23D7DF
	for <linux-tegra@vger.kernel.org>; Mon, 17 Aug 2026 19:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786993886; cv=pass; b=o91E/FsBnPwM44JV2B4Q0h1cUbZyqJ95UrMr3vKEK1RCkhOw0DMETDTTAMjsx+Y0F9iggIn2kWu7v3Qv+Q4P9wMSMXMK71aQdpRxQSIGnBOXXVSKg08YvON5dDvoDSfSCaTb9L7w+FbzC9NuVBNgyUuF2bs/Cw98YE+B3AiI+/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786993886; c=relaxed/simple;
	bh=uTnougUIG5rsOStz0iODpKJHP4inO0xB8c6yl6xAlyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HibsnwrX9jiu/9oX04f259aTkGXMlSsCBSkSibVSOaDQ8xaXYYuSd59HriS2H5Y7odQOAxO+yU3ynQcaCPFvbwUDZu5vALNX4YccER6H3NXGg+jgGFRoSW1G9S8SOrqht0Vv1QKzla1JanMzIxPKnHsjWXBYY1zwPg8DzZsXQw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHxne63W; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHxne63W"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b14d1f9315so3158816e87.2
        for <linux-tegra@vger.kernel.org>; Mon, 17 Aug 2026 12:11:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786993883; cv=none;
        d=google.com; s=arc-20260327;
        b=pbypF5wVDSm1so9htgqjfnSMDHXm3t+PWxxmZSH0kCdyGt049K+gIYut571pxbXXwa
         hOTXIId+4FIIovtffEDb01a/NhN99v/+gJLDQKMJrpTpI0tImeDXaUzM7lkGpeR/T8e6
         Hu6CaWOilKba1C4cJjHpYXSWvA3wJSjSQgn259heZZQ5eHcwMfXPl62knQ3c5xkoZpwf
         o0cXdyiZTMbETxy9d8abY/bSGcil5F6VY2ZqjukMRlzZpBrEg+uxQp2G/hWiPUa1lAhb
         Uxk6xUQSCOVsrptA0VRh8r6ROpW9Trq9nzvNBBHRGogafdz5St5VyWMZgOBZ1mMVxkLf
         hWWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o9Xq57ZK871Bs82fmpBhlH3gJ0wVVRq6jr0byiqzgis=;
        fh=7NKefeC0M/ON1BbGmx+xq9HliJonDcEihLPb2Gh8yHo=;
        b=KHVqIsK2faSyKiXeDia12Bx4IrO6hfm86t2eB+p2myZU9ZS29MB80w3KiP2CVSHEQR
         F0ujAZSQBuEUpj0bCYH5kPM5CjsVXVWjp/3TR4tIeaSsLNEdchhZvNB9G0DL+w5hCpl9
         z91o8A7V9mF53NMLksODsq9zMcTxGl6zCS1C5dcit2DioYim8245ycWK8OVIK2PSfRdp
         ORYNoV2hT7Q9UdpGtSKX+frRZquSERXi8z87NdibSjPgaf2+s4L9TxKFU2EyoLXmgDo2
         E2J4IyeEmJtyAHQs/NJ4DbRnGiyGblVGNYj6BxWlLIhElaTr0ExWuzO6JTw3cOYd3XZm
         fQsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786993883; x=1787598683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o9Xq57ZK871Bs82fmpBhlH3gJ0wVVRq6jr0byiqzgis=;
        b=jHxne63W0n5Vz5scXxk67+eE/3f3mxoUPN/Kndvck5aKDlgma6uUbWOuMkyH7zdzUL
         GvNL6E7kVhx2gi1RnwbPevdGEvNwrxLwJz+XzBf/swzlCGy0yvpsKUgGiMj0FpM2qPPl
         C0grekBaUPzI0ESDFIm9ZGk4Yo3j3sy/7DHrtL0kr0kgdp4QU1+nmQ+rOkyYmDA+hxXB
         rQHGKbn02EggaRDrTsXr9RRI1rL7lhKvXVf4F2yscXU8HkTVrw2tiTVY4nBdUOycz08Q
         NOzaN+w3flboeNbTvBZfltZi53jdTFWSFI4T41I/TlXAcjAjJlUl+vNiosBdntoBIXow
         Wp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786993883; x=1787598683;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o9Xq57ZK871Bs82fmpBhlH3gJ0wVVRq6jr0byiqzgis=;
        b=raPqJEjQkEKsFVyf/LZjpAJPVbeTwyWBcOGiigo6/yKJfUFSfOx8PoBAEazGev/S9z
         Bj03VwVKg8uLJdBQddpouDbJM9W5Nj57cAaR0nK20qqgQDn0EOuj8RhwgF6k6iHkDCew
         fW3mREjD/0SSLcUILIo7AXQHjPJv8GIhhlQAnjcTRPXX5FrBCPyzoFQW3T5gMt5BbRzI
         CrCL0tZB6bO1SbolfDNW//7qH5YI3ME7D68vWkTjf37s/LB1CfrLLjWLrlFZ4h1sjIwT
         Vosvz2FF7ZXDqvtOugt0uHZlL2QHvFhlN6hk6zXr8Mo5+c37w6UWXUFwlcuHDIYSfEZw
         G+mw==
X-Forwarded-Encrypted: i=1; AHgh+RqDAfIdia0UCD0VAnqGJIEX59nahEM0raGQCVdqdkhqOv5VZuhSpMyO3VDwTtAqAoc2pKf/HsAVvFJ0sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeOLBB8/ekJhoPbf/Gt0YESbbobMaZIGZnCCKLtDXAm5ekvCMK
	aZvGMbe2NRwQaiNMAAT+tiRMoz2KT3Ob/Z12fT7iaGgfYrnVuz4D1qlWiFYxUu+ztwAs4nkherh
	Rd2kJT3QKfTZ9FstlOieJssZ6q3EFPFY=
X-Gm-Gg: AR+sD12eLJaBShsyvIPsCXTPPyRNltPrvOWpzbBbfvT3EV3/ZaEQfJ4a4TsNrxbDe/6
	JhpTUd4kzFMjO6CB4WQg8KlZkvlw4OTpo8UT+8EDVQg/HS/wo7pRJQIe4aSvQ3Y1jD5JRtbvI+A
	ujMfZLHiitUERLbbNvze3AYYl1s9JL9jCbLKKOEdPeglEhZo/dnIjGVUFo2hpLTrIDfbmMb0aHY
	uLnczbU+HugfyoCwrKEdzy1/yyrlqFWw9awLq7Uye2bV5NZpTGeudIMH4W9MNPjfsUQ/yKckC3g
	e5isDQhcaAm37fp5UsygG7Ide8GNvs0iNwZtYcQwd7S7ISno4S5y4P77abw8paAI0FpiE043Ukp
	/gg2FTE80Oafz1DjR2UJwEOWYr+G0Jw==
X-Received: by 2002:a05:6512:2382:b0:5b1:4e5e:559c with SMTP id
 2adb3069b0e04-5b47069e8a9mr442389e87.30.1786993882910; Mon, 17 Aug 2026
 12:11:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525-tegra194-qspi-iommu-v2-0-a11c53f804b2@gmail.com> <20260525-tegra194-qspi-iommu-v2-2-a11c53f804b2@gmail.com>
In-Reply-To: <20260525-tegra194-qspi-iommu-v2-2-a11c53f804b2@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 17 Aug 2026 14:11:11 -0500
X-Gm-Features: AcwNN1VtAz3TzQxDcDRv29ZIlK7LcvZGlrKziZlK_QH60cI6-b_6Gt0v_fcOAnw
Message-ID: <CALHNRZ8F85rJZ4+v+B_jsETeG9cUJWeWSe9vw77AVHcRMasw=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: tegra: Enable DMA Support on Tegra194 QSPI
To: webgeek1234@gmail.com
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Mark Brown <broonie@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-tegra@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 1:47=E2=80=AFAM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> From: Aaron Kling <webgeek1234@gmail.com>
>
> Without dma enabled pio mode is used and flash storage such as the one
> on the p3668 module times out and cannot complete any transfers. In some
> cases, these timeouts cause hangs and cbb faults.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra194.dtsi
> index 1d659454a6f9fe..e2ddbc6715d5e8 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -923,6 +923,8 @@ spi@3270000 {
>                                  <&bpmp TEGRA194_CLK_QSPI0_PM>;
>                         clock-names =3D "qspi", "qspi_out";
>                         resets =3D <&bpmp TEGRA194_RESET_QSPI0>;
> +                       dmas =3D <&gpcdma 5>, <&gpcdma 5>;
> +                       dma-names =3D "rx", "tx";
>                         status =3D "disabled";
>                 };
>
> @@ -1013,6 +1015,8 @@ spi@3300000 {
>                                  <&bpmp TEGRA194_CLK_QSPI1_PM>;
>                         clock-names =3D "qspi", "qspi_out";
>                         resets =3D <&bpmp TEGRA194_RESET_QSPI1>;
> +                       dmas =3D <&gpcdma 6>, <&gpcdma 6>;
> +                       dma-names =3D "rx", "tx";
>                         status =3D "disabled";
>                 };
>
>
> --
> 2.53.0
>
>

Thierry,

The driver change was picked up some time ago and is part of 7.2. Can
this be picked up for 7.3?

Aaron
