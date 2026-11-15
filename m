Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794757321;
	b=lIJP+t0jQIKHoXh3OP4QvKQKrKm9j1ScaK6pNwyB5qZRgh9BXnANhfDo+9eiekFeR2TA
	 KMpg7u5r3DH/3DNAdx+T5nzikZytHZXOXxk8pnfH+O68aibaILeR6XwS/LI5H7pUy5Oat
	 pvSn+UyCTO3c+ngEv6tESjeffUXiGCQBBWARvhpDtBtdNdFHdv8NvHTjCdgvN1yOUBXwH
	 KY4JDweV+/vzQ7ajqSASUrtK5zrroCsHVJa+CghVSOBxe1k6a1+p8/gCMsdE6IbNQmkmP
	 xKdg1g1gFRuXMOudBbke6tjlbZkYA/9eCO0FrPtEYYTHMw9/25yU+cMiLMmdreJW1/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Y0shGZ6hyhRZI7u9lKNPwzmsqe7OyakFksQ4HOiAHG4=;
	b=FQ3W4xhNguoFVSo6R27ZQL6kq/G3j0sR5QnAt/8eMg0HH94jdpxgDj7fN5gwL4NPR2lG
	 ikhhL6jv8e5M30NKS4NOUDxQ8k0ZMqKWofzBN1acYCcsDCS75qr7yARzQ/MCrC/ffrAKD
	 sReBDegGMMg7wmXhOBwNitFc1nomhALwfJ2i20rRDQ5hqAVR7uNpjeDzXy970dbXmWMBh
	 4LsqJMwGXrfjmH6Lw4WO2m1zriiM94KPU7xzI6UIbdv6ND/zLhsWd8Q3XHg2TYUjM78FB
	 LmOegpjwaf0T0wSAuE1qXtuBUO6qVYqWqYK63/YzbMAXaRwYWa7EM202WGZ+8K5SkDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u+Lw0+fG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E95606A323
	for <linux-tegra@vger.kernel.org>; Sun, 15 Nov 2026 15:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37E95606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u+Lw0+fG
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67be4f2f4d4so3072161d50.2
        for <linux-tegra@vger.kernel.org>; Sun, 15 Nov 2026 07:42:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794757320; cv=none;
        d=google.com; s=arc-20260327;
        b=Yldth349RwXbnYSIbYUUItV8sXHlkBOT0NtS3nhfmd1fjiJdlDmXKsqzdYNxLed9Qy
         d+gHgQgLs5RQ+GbGDEVl4z5L60Ati0NDjeoNxUAXMwyRRijO1H0+90pd99U7m7h6SDBK
         Oi7Ef44/CLqyhzZZ6PiAmbYDY3NuatDD42HmiEUyytriLJIMpyZjHXaMO4IXFwLKf8wE
         iBcu16POC9htvIRWp4jijDiwJrZ8lPPPKsw9SIU5Nghlwc4YfNeuNqlghcxz3q7DfxTm
         ZhR0ZQ+NqF+Q842OQOFTL+ldm0l+C8Wmm8/D4LrsTTKbQJvcQc0FBnP88P57lVMVHY2A
         atrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y0shGZ6hyhRZI7u9lKNPwzmsqe7OyakFksQ4HOiAHG4=;
        fh=U5toaxPH5VPF+A5q83VJO5eZIDGdXfuti8j5N9MQqcM=;
        b=bYjHCDEQguAmSXANtffMcD2y67JT+1y6Hgwxsx/wnzcgLuKWRlpsyFczU5TbjnROp4
         zIrmTli+F66++cFraQKW9uT53HwGZ70a0X0h4Rd7mUxqZixqBmL+dEDL0e14wWpG78r3
         9gxBXv6pimDBtAxICs7g1LzcgoG0H0+oHyxluutyiq1M/fLvwrNnuFlP4elDFrYwdqhF
         sbFqDgShujg+FRKrn87FFo6MMowmSiK2BnWXsmRsILRirzJkhB7E9ysCpQjwaAyyZdKB
         3l5fiwVNyX7njGhRFDiwfMOf5bDkLKRP3JVLVI6/Q1L4OzMmpjR4gFidFBbzUCP3CFR3
         HSIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794757320; x=1795362120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y0shGZ6hyhRZI7u9lKNPwzmsqe7OyakFksQ4HOiAHG4=;
        b=u+Lw0+fGEwnsMts5plO615IBT8mWkOZSG19nR+eOkB1ARvLDkFzNhwCHkTIk1uaLYN
         NxBVG223K6iHF5QqFD1WRsXx/u/f3GXhApT+6SIApEwIW/N/HI8o2RxWC/Eh5ByEaeQz
         oHzDBBcQaXmpug2I9j6SR5oFS2IU2WVQGT7/o0p1nVgtfTaI8oNYxJRzVZjLMcGx5saL
         o1y7TFOryoG4Z/zPF7xcXhxhJwUlle51sRjt4ohFJim3lGD0cWFGE4a/9Qa0VNwGfSi3
         sIaM2vyeso0PJSx5g8oGO10tsLpv4Apmf5i6arpUjnsOoFIbdkfw+mdWUjQ6o+nZMRyy
         XHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794757320; x=1795362120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y0shGZ6hyhRZI7u9lKNPwzmsqe7OyakFksQ4HOiAHG4=;
        b=B3PRh59/NLSqCeYjdh7MXSQi9bC+mEO8DqW4X5wTOXOxX3UrqMF6JpYyEtVGzrQBJg
         QyF3s9MVGIdsYPMPZrljCYqi2EmX1XFr4tjCZwutDKvDYkodSZHzUlGYxs+lET9F1qTI
         EHukc4ZWENupLrM9DDOR2mSDcnLw6z0uvgaXtnDP9MUKyvMgW3O3dHsTIl7ikEu63Tt9
         DNJxELvhD9nISgBMplprgwKdmphmoh+szPEdAIIhPVbN4aAdgFXs9XI2+HGetpOUDMBB
         nOHaXKIAAZZQnOTbSEgi3fF9qa0ioX9FcNhM+fDUnKUEAB9EYfK4iO0VdW4BjFfwXgGZ
         GBog==
X-Forwarded-Encrypted: i=1; AL+hErFdFy14oorCAhB4xqmBFIjWZay+zRtacXQNIRID1PJOnYX1kCmD+fAC3l2bEA6aAsK+5vWoVackTGq2jw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9DRR9Y6dqrefWGmL4Jx4v+6whMsJkICjjBSzqYDe371dKci9Re
	CiqH93Sesus2zFgWTLj3ejSDLzGf9WNuOpVowdNIzRGPx+45Xl/OjNPKqWwYyeq36DWbKYCJTeI
	cXWku0aAHqXryYzseTdA8p+GMqEyQGpi4RtaeTjWQ+CxX
X-Gm-Gg: AYBFou3+JD0Mqf0gOgg/sWWtE7CQhYDjS+iFs08WVDJF185ElQZaNMN50xaWtlM//ee
	GiJnZ78WJ5bWK5t68LuRoGCruiP4TTnFY1WGemtPRizbOjWiVDLEW8MKITIr2cK/5H3QOShS4Vf
	/40JU1ectSvCVac3XXZar8AHq0Hga7/7Mk8oWRKK8xEHdJiVdMMJCadt+09LrnO7/a4Re+2g362
	kR4N0iKs5qiJtDOdcdQF4xLWSS0sMKb47PrtqxKfGmUaSMOT3rXHLinH0GbXJ5jmXJFG6yWkEN0
	bFWG5G7lNJwf3O/+m/SD0lexgE2EOXKkrbrQnlQ7edjDvMXPi8P0S3fghEPPknts2Q0yxF/72+m
	UiMYw75WI4W+JWn9+XZ+Vr/sKZey7ONECAB9M6VDwJdf9gdZW58f+AJQJEa4geyUBwZjFhpA=
X-Received: by 2002:a05:690e:419c:b0:67c:443b:7437 with SMTP id
 956f58d0204a3-67d8972f769mr4176218d50.81.1794757320129; Sun, 15 Nov 2026
 07:42:00 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-nyan-wifi-32k-v1-1-311c6f2163d4@gmail.com>
In-Reply-To: <20261114-nyan-wifi-32k-v1-1-311c6f2163d4@gmail.com>
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
Date: Sun, 15 Nov 2026 15:41:49 +0000
X-Gm-Features: AclHuK9XI2phd4ElF0I4ZWo1qXh6X3hb82lItzI21-3DRYQCtspJfYTGO2-pD7I
Message-ID: <CAN1s30rP9jkTp8rmyFBjp9FtmZO9QTXNXqawpJ1nZbusFw59bw@mail.gmail.com>
Subject: Re: [PATCH] ARM: tegra: nyan: Enable the 32 kHz clock for the Wi-Fi module
To: volodymyrchapman@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear all,

In the interest of transparency, (and to meet the kernel AI policy
outlined in Documentation/process/generated-content.rst), I was
assisted by Claude Code (Anthropic) in creating the patch described.

It inspected the device tree and clock state of the device (HP
chromebook 14 G3: nyan-blaze), identified the missing 32 kHz PMC blink
clock and drafted the change and commit message. Warm reboots were
scripted by Claude over SSH and cold boots were performed by me. I
have reviewed the change, understand it and take full responsibility,
acknowledged through my sign-off.

My best wishes,
Volodymyr

On Sat, Nov 14, 2026 at 2:13=E2=80=AFPM Volodymyr Chapman via B4 Relay
<devnull+volodymyrchapman.gmail.com@kernel.org> wrote:
>
> From: Volodymyr Chapman <volodymyrchapman@gmail.com>
>
> The Marvell SD8897 Wi-Fi/Bluetooth module on the Nyan Chromebooks needs
> a 32.768 kHz sleep clock, which these boards take from the PMC blink
> output (CLK_32K_OUT_PA0). Nothing in the device tree requests that
> clock, so whether it is running when the SDIO card is brought up
> depends on the state the firmware left it in. On warm reboots it is
> usually off, and every attempt to bring up the card fails with:
>
>   mmc2: error -110 whilst initialising SDIO card
>
> leaving the system without Wi-Fi. Toggling the reset GPIO on each retry
> does not help.
>
> Describe the clock in the SDIO power sequence, as the Tegra30 Asus
> Transformer and Nexus 7 device trees already do for their Wi-Fi
> modules, so that mmc-pwrseq-simple enables it before releasing the
> module from reset.
>
> Tested on an HP Chromebook 14 G3 (nyan-blaze) running v6.6.144: with
> this change Wi-Fi came up on 8 out of 8 warm reboots, against 1 out of
> 22 before, and on 5 out of 5 cold boots (4 of them on battery), and
> the clock summary shows pmc_blink enabled by pwrseq-sdhci0 (ext_clock).
> nyan-big shares this file but was not tested.
>
> Signed-off-by: Volodymyr Chapman <volodymyrchapman@gmail.com>
> ---
>  arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi b/arch/arm/boot/=
dts/nvidia/tegra124-nyan.dtsi
> index 89a749c..c98de0d 100644
> --- a/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
> @@ -645,6 +645,9 @@
>         sdhci0_pwrseq: pwrseq-sdhci0 {
>                 compatible =3D "mmc-pwrseq-simple";
>
> +               clocks =3D <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
> +               clock-names =3D "ext_clock";
> +
>                 reset-gpios =3D <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_LOW>;
>         };
>
>
> ---
> base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
> change-id: 20261114-nyan-wifi-32k-9964d3513b7e
>
> Best regards,
> --
> Volodymyr Chapman <volodymyrchapman@gmail.com>
>
>
