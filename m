Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA2E220F3E
	for <linux-tegra@vger.kernel.org>; Sat,  1 Nov 2025 23:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762039315; cv=none; b=Y286HXGvGQBANnjawl1d5iW02fFPQwLcm4x9d4ntBSuxX/NSwsy+b56C/m5jwu5R+UOCftHIWS1LSaTaYo30JvtdXlfAVaL1m4+t5bGWkFXphgOqiOQlNysCg8qsvhpzPX7TSUEYOEOPOdpSR7L8ozVJRrmo30/zXyxVVjNKfTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762039315; c=relaxed/simple;
	bh=Ih48fCgGxmcDC+rq9KAGCQ12b/6J7vEnVTVpSk2fSik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jMmt00pEeB/t2lqq12hQPtsS9soOQRNPyF/b6yGeuUDdKnK3tn51kkv2yvRFHnI2kDNJQO/SirsnwfrHt3p4sRe3nfk6tnZX5weJ80ewN4g0/RtbmafWVmxj5v0XKLCyWH4h/40NZyQ5Jp6Vt4mA4ieEAawf6o4zutm3qQ94lJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0PZvVRA; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0PZvVRA"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-591c74fd958so3586048e87.3
        for <linux-tegra@vger.kernel.org>; Sat, 01 Nov 2025 16:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762039312; x=1762644112; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tE6bLmNTkidBdeLhF+rPCfURMSNj/Z7BnksFHtpAFII=;
        b=U0PZvVRAaJghF9lBb+PWMgbKUg7C2NPU8N48ATqvPgt1KO3LekxPewU5fRWylIN631
         gQJ44UW3qe33Fyr74FW6h3owIj4pBa9uo59teMSPHfE8av/nyKL0m2kFHNrO5vaeD2PV
         e+jTaLeF+rNeWD18/OWkU0SKk/kAGBBI10Z8x1E35jnCuieoL8rhlfypbGZkTxGUR302
         HQ0dchYajVVl4AVYqjU+E5PU4PRNXrUZTzI15ZyVK1viX+OkZcpOL/czbHrQaKnJamiv
         DAmqH2TezMU9p3MG01nWbVKXpmdZ0XbVfwZwdrIYnih/kiIyX1norjXPsURzmTCEpdIM
         sobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762039312; x=1762644112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tE6bLmNTkidBdeLhF+rPCfURMSNj/Z7BnksFHtpAFII=;
        b=nq0WPkEoYT8WBTSBA+q0TuK4PDnAZfUwQy75TaoSeMrdL4tf2zMyM1TfEUCz7IKIp2
         PlVUr0rg3b77fB4FH5K7k8/a7CCRnV0k9k/DCiKnOUFG2jmTjFp/FCKecB3yPM32WwLj
         XXO2+TzSiRnjO+AGv0712dAmCo1iWNznpL0ww4ufL25JKVf3oGnf5bbaxewuqrPH+ZjI
         kB9JtokCXxDeGicwndLP4HTOuBQj9hmc0mldJKP310th+qptpJQVBisXN99Wv3Sz6FV6
         2T2Ylb8/ffUXbmcmE1M0dGhiZ1r3Fczua0uX0zPYMr7ZMrFde+m6t7dSZ/4hH+wsGssI
         Miog==
X-Forwarded-Encrypted: i=1; AJvYcCUbP3SGe+R8Fhw37nXtc1IvThSuI1EZ3gThJWgXj9x0ROwks4E0QyTSQ2PPXcKw7YL1JQtN3q6aMfXJxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUmA0et6Pnw1PlWaWFJXmwtLrTU19dtzYgxpDyXtgK7c16dcVb
	bsSgNbYDVGPMyVr3DAfVTb02F7//2ns5gePmSTBanInv2CrxBfQpyc/LnjT/lMgCWRYMjqrY+nI
	plKGrAeEi3kXOSwicMXUCThs76DfGc94=
X-Gm-Gg: ASbGncsauKHOUv/4qlilFI/Lbfu35GoYV6fKR6a15GeWar1OeZVmKq5c+1jMRvgAbDl
	QTjGTwsI4CDW88MvpThMa+8qaxR5+3kflXZMQl1fY79ZeQnn9hIEInC7SH9bHknnBl1J8L21iVL
	KKWVoiQxGrxGq6IWp8KzCT9tBnz0NRaLwiOxjDbWtkDazj1p9IggnTOrfTyVodD/YeIp9Dx1AGu
	kJ/OMFffy2V+rjn3svwJrEk6LK2wAVsHAufbwutzpghVy6nZfnj4xl/Onnq+QVDAHpgXlk=
X-Google-Smtp-Source: AGHT+IEvPRmi56xA8VSlKhoU4qy0ZWuJI01gXXRCxfZUpYfce2ybmegTH3BGaEdGz4/nTwnns4xZ4vmoZY61Tko8f6Q=
X-Received: by 2002:a05:6512:6ca:b0:571:8fad:ecee with SMTP id
 2adb3069b0e04-5941d50d172mr2275685e87.21.1762039311783; Sat, 01 Nov 2025
 16:21:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021-tegra186-icc-p3-v3-0-68184ee8a89c@gmail.com>
In-Reply-To: <20251021-tegra186-icc-p3-v3-0-68184ee8a89c@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Sat, 1 Nov 2025 18:21:40 -0500
X-Gm-Features: AWmQ_bmZzHSXWhAY2pY6BRtjObw17AvJtuzUsKcg8jYHF9w1YWeOmRl20FG9z7g
Message-ID: <CALHNRZ-uFJhMjyyV1vUS6ye3q-nNVPT7Ab4vuO41ziHqg8MOvA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] arm64: tegra: Add CPU OPP tables for Tegra186/Tegra194
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 8:13=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> Bindings Dependencies:
> - https://lore.kernel.org/r/20251021-tegra186-icc-p2-v3-0-1a50b526dd40@gm=
ail.com
>
> Logical Dependencies:
> - https://lore.kernel.org/r/20251021-tegra186-icc-p1-v3-1-7e6db3b070c4@gm=
ail.com
>
> Merge Strategy:
> - Merge all patches only after all dependencies are picked up
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v3:
> - Split series
> - Link to v2: https://lore.kernel.org/r/20250909-tegra186-icc-v2-0-094137=
24e781@gmail.com
>
> Changes in v2:
> - Use opp scoped free in patch 3
> - Cleanup as requested in patch 3
> - Move patch 3 to the start of the series to keep subsystems grouped
> - Link to v1: https://lore.kernel.org/r/20250831-tegra186-icc-v1-0-607ddc=
53b507@gmail.com
>
> ---
> Aaron Kling (2):
>       arm64: tegra: Add CPU OPP tables for Tegra186
>       arm64: tegra: Add CPU OPP tables for Tegra194
>
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 317 +++++++++++++++
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 636 +++++++++++++++++++++++++=
++++++
>  2 files changed, 953 insertions(+)
> ---
> base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
> change-id: 20251021-tegra186-icc-p3-3f6454da5ec4
>
> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>
>
>
All dependencies have been picked up, unblocking this.

Aaron
