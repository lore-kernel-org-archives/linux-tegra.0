Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504694D1789
	for <linux-tegra@vger.kernel.org>; Tue, 22 Sep 2026 06:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790058587; cv=pass; b=Qtj5hQCMBdL44X71G8q3AMLPqsTS0lobDkormeK5u8VuhdAoEQrGoFIk3rra9NU3Jo6NmiPMx+B892CjwbHUjzmrC9Jvpzi3KluyIovcfbPiKaiv5W/A9DLhsH05qZq8+ESqb0wpc1vo6Ou+LglPcSH2JYP3x6YOEJCARG10eiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790058587; c=relaxed/simple;
	bh=WMopLKvR/pUfd2YF3exYBV6b9DrcmKXGK/JBv+4BYaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kiMt8xif6tzq6bzIkqrC8V4hIumEEpNawuADFKwxzAUqGj9F3k16zEl46qKuAzzrzT7IhqKD803pQDspE+p6nuuQ0oJO9bgheuQN6EIrzgYCVlmNCyl0D6+Ruw83afpGp7AMTfV8UPas5gBPn3vKig73LXfyDQ+26JDRUQcLkrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ads0/kQN; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ads0/kQN"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2dso2175061a12.3
        for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2026 23:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790058584; cv=none;
        d=google.com; s=arc-20260327;
        b=l/Ofok0WoM99Qf15s7mzVcJo2O/YYjRv9ANPX7RtXRjTKdYX+Y+eq1QcIz88Ci0Mbm
         7iKZWFfIsouuCQkyBfTDh+eKn1E3JvYa9mpMzlwPDlGOhqcsJJE+p2N8XlIz/ln1XcYn
         YbOTUk6UwRHBjCHFruc6tmAK3XQ0+YPyQP0yLYk6MZITwzLoO+/0ovqKMhtr6rUQchl/
         la6ExOLlGsfHmsR9rih9M9gnswpphbLsLQExfSV+4M7+RaDJ4/g1+iYvztMdbgxaSzjC
         dEKB6ibMuS6WjtGDt5GHs4y/WaMA1v5zKRDK7oU7LML8re1WfMrdKGe81JB0ifA+zKAl
         fU0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ing5JC6tleS+Y5q+zrefvE9RUeGgTougjus6FkCTzfE=;
        fh=j6FdxP1heE0dso31YHPUmfAhypNN9iMBS4Xc0He6WjQ=;
        b=DbTAK+4OYAhG59TAmV5dA/ZEpdyx72hJJ7zcUoEclsnSAT1YLpUA9iZbEuL2HcpsGo
         OXhD9Ch0gnt22kTgtzKSDMrfUHBPMljpBi0jdVyX9MIdLTb/ylscVwPkopuXiRw3ORPp
         5b/C5wEKrHQ03RJH01eNDXnbLfGOcow+KR+M5QvwEUVaXxosHIqGuNlFHHyQXd1AEUFH
         NZpre2Q270Z5v0p6MlspJXMZ/NQHQYuQCvttiTjw/vv+dJ0Io+uIboP/U1C1KeJPMyOA
         SgnoLGPgxDLZstA/MaMlUMuMuoMvfdfZPHJU3T0KrXu67jllUPiNO74s64N1WoVWbKKU
         cTjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790058584; x=1790663384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ing5JC6tleS+Y5q+zrefvE9RUeGgTougjus6FkCTzfE=;
        b=Ads0/kQN2vtUwcoG8QLHfoFhrM+QXCLgy/bTVR2HYnnIY/tlRnZDMrR1g/ejfPLW0f
         XEqhj/WqZ802LJZ7RuAMIHTLdCiEJNP+LXRYmkbWZOMaxFtTgoULmZBaTBYU43qIMuRg
         eIb+208ZJcLaJM6BQWjPm4rByHAB2LYTJExPetdZDiuJJorlmnCl6CTfjmyXPUlr0JEI
         g6pnNgmi9NzUJcjyt9kcE9or1OD7eKBNnA/6qaOeMD5tkteCx4YYXwsTW0d+lKmvXFHu
         EMmjBDyFg2J6FBPAtik4LbD/e9XeMCrY/JgA2HCUq3fA+0ISgOx6eWz+1BkZYDjY1B6Z
         9icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790058584; x=1790663384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ing5JC6tleS+Y5q+zrefvE9RUeGgTougjus6FkCTzfE=;
        b=mBv4Lh0e6U1Ie1oaGSFseTYEqrQ+MPwZTWQ2XOvR5853e2zqHA/zUqer9buuAKulsi
         LqXgsUwHHvcHaEbwFGyfkQBTdrNyYfYwUTLmohWRNJobdPUde7leMfhbjH8ib18Alz/V
         9jYrvawhB0C8YXubr0aIGeL3Brob5B9ZgoNydd+q4S9Ud0CXSpcWNA/qtqQz+TzdfGbR
         p4Iggkb3oEvmMMtCm6yaf/a59pwSoSEqslkRJb8Gu8SmqeKg7WPt2qRwaBuQDFHGhc5E
         tQQgyBhd4aMtOApCSVmfX2UFWoYHfXDArPMpPzk7WUBBhOMBNuo1N8VLHWRKF7Qifc+B
         YVYw==
X-Forwarded-Encrypted: i=1; AKwUvBwCKunFJVUS8CeqZwubpls8yebAyQMS1WOj2jG0u04gO/CwtzLGh6rpwCguWP3I6cLVwUao8QExR23usQ==@vger.kernel.org
X-Gm-Message-State: AFuF++n+sFU+52y6XwzVxo7s30SHuKtSw6f/hCkoslAC2OPTP9IHJdq2
	SKk8P+C1xiUcXA/G9wRLW9H2h1c8f/6kWMBwiOfWDzAVPcSYmDoZqNkkEipT8EnlA7j0RkKNzLw
	oymz3s2DZ+wJluRS5mx/nWwMTTxegjG0=
X-Gm-Gg: AYBFou2Wg3HsmTXvirtEB60MfR6WT3uhQzZl4wZ2/QjMfm20Sst0HjNDxHLYukJjS7w
	vCZf76EPfyc4r0pe6Bla27NBE13KQ6BOOsqTPTrxasgsGoHKOdvvYWCaq3jbu7Zeh8AmoQ2lqUz
	+rHaQsKZSApDKkSvWJGcJdkQy+Sm3WRm9/WryYaTlW+I6uBqpppztyBHqj6srlWZbHQoo0MVijm
	oZA2zWATjm/r9VB2zdNbupg8wdIreT4P8Y7hhRUXEviPYS1jnU9jaEltE1AhjNHPZYQ13sowZhC
	b8n8ml/CAxPcjTRnxG/RXqSR5HSVB4njvRRpFUg4tLNWHR0RZYm3k7+v0fQ91J9HRloM8b+VuTN
	SA9/e6z2be+Zr
X-Received: by 2002:a17:90b:48ce:b0:3a0:4066:d3b0 with SMTP id
 98e67ed59e1d1-3a07327d177mr173825a91.59.1790058584580; Mon, 21 Sep 2026
 23:29:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921180250.3223545-dts-florian.krischer@fkr.dev>
In-Reply-To: <20260921180250.3223545-dts-florian.krischer@fkr.dev>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 22 Sep 2026 09:29:32 +0300
X-Gm-Features: AcwNN1VHLuPJpyDqBJ6Nhj2r3qY1EQ09O50v17uUs5s9CMRX1Up_T9siUpW14aM
Message-ID: <CAPVz0n1OrUwmwfhLEdMtfnQELMFyf-Br4itWTXin3b8pSSE1rQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: tegra: Add embedded controller to ASUS SL101
To: Florian Krischer <florian.krischer@fkr.dev>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 21 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 21:03 Flor=
ian Krischer <florian.krischer@fkr.dev> =D0=BF=D0=B8=D1=88=D0=B5:
>
> The ASUS Eee Pad Slider SL101 has an embedded controller for its
> built-in sliding keyboard.
>
> Describe the EC on the PTA/GEN2 I2C mux leg. The EC responds at 0x19,
> with DockRAM at 0x1b. AP_WAKE is GPIO S2 and EC_REQUEST is GPIO S3.
>
> The node has been tested on a physical SL101 with EC model
> ASUS-EP102-DOCK and firmware SL101-0202. With the ASUS Transformer EC
> MFD/serio driver and the SL101 event-protocol fixups, the built-in
> keyboard works through serio/atkbd.
>
> This patch depends on the ASUS Transformer EC binding that provides the
> "asus,sl101-ec-dock" compatible.
>
> Signed-off-by: Florian Krischer <florian.krischer@fkr.dev>
> ---
>  arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> --- a/arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dts
> @@ -59,3 +59,16 @@
>                 };
>         };
>  };
> +
> +&lvds_ddc {
> +       embedded-controller@19 {
> +               compatible =3D "asus,sl101-ec-dock";
> +               reg =3D <0x19>, <0x1b>;
> +               reg-names =3D "ec", "dockram";
> +
> +               interrupt-parent =3D <&gpio>;
> +               interrupts =3D <TEGRA_GPIO(S, 2) IRQ_TYPE_LEVEL_LOW>;
> +
> +               request-gpios =3D <&gpio TEGRA_GPIO(S, 3) GPIO_ACTIVE_LOW=
>;
> +       };
> +};
> --

Hello Florian!

This patch is fragmentary and should not be applied. I have prepared a
patch[1] that adds EC nodes to all supported generations of Tegra
based ASUS transformers, but I did not submit it yet, because until EC
is picked there is no sense in this. Patch will just hang and
eventually be lost.

[1] https://codeberg.org/clamor-s/linux/commit/5d7b9ca285781e0eac35e346a951=
d949a61a2f0c#diff-8ffbb7ecec9cab371ba8535ba3c046f01371afd3
