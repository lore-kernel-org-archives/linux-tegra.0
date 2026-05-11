Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9895F3A8736
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 07:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485854; cv=pass; b=WPcWwWyO8gLPmGdqP0H1R/GfzuoVLbqKqXxW0/NgZrCjs8wVEi4PO0PEhFoDetvXjnHN96gXWuHC8Wrimc4oukmSd4iJh1a4vM3IUGfoXVYVITYtC1gzgfTb/HIl12OnAI3IL599Hhl2J2ftfJA3u8LfrK7eC9UmocRFrdbIzlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485854; c=relaxed/simple;
	bh=re94KlHHKVD5VQwjuk/UtyqmSoROW0QE/hNcCoTSgaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UhPUK8MZT3QbUnICBVqSTFTgL6ohhma5PYkbB4RUX+q0PBajKgqmJjE6YaxXfp6uWyyxtdiwNOMiPHezE11CAX6FHCHp116w9VutDWAujzTUhYfvIcwVPzJFY7q9tiJdhzcYUAlnn4In7QiFiceMb7jh1bD5HmsaX3P4gwqsoiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dg+rOw3S; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dg+rOw3S"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ef38cf04f0so5924669eec.1
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 00:50:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778485845; cv=none;
        d=google.com; s=arc-20240605;
        b=ZDsz5yG/ZXH3erGFlAQs28EZxU3QIiy6fdFW/UwbMD7/XKbb8wQxFrNf6ALNpJ/EdZ
         8W4peR1smxhTH20Vbe9UWUf6Qy5lwYTB2SMlT4NU5nZ0UPA/fIClC4LCvmV/lfAorisG
         lRx5dQ83587Pbyah62kk8CwhOTo+jMs18BXlBJJiRzW+HQlcbGCwZQUjX61q5EjU5spP
         TtuY4QX4chNGph/bvfCxXjDrADBgwp2Y/02UD1vPWCSfR5fZpOwRHOg5mqPudHykA7Qx
         O8QrWu7J1w/vJwCylb7iCDilbO5Xgav8XwXrhWWc7MOdUrHYOgw6DrTFOoJDmc/FNEQi
         ocRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7SyAk4iVepITB2rBUej8UdXxBx9zKqBP0ZKuTVk+m9M=;
        fh=+ajjVqmKC2J1YwOvJK+ywkCiiburMFjP6BQWcvDqMNg=;
        b=HitnDU+DbGrYYLA2qm5ii4t2ON8IJI1C2vYZUTx5LWBKZ6jb2nxDylgjoQ2/uRO6BB
         s71pGCwByhfANw0DKu2jqINI/WTFH9ulnjZOnAuOi2XslCv0XazSP5mNWnEJHxNC3upN
         7uEknRw6yja3GG/mNjccjg7Z2T14wFHVaR+uYCVcHj3fM+bJ1z/Agf/0u4i4BJqhbbVa
         zGhY17tm0d9AMJ+ILfh1gOMOEhTGnZSEIk3tdmqYVKvXd+8zOpggZhxBDCsEVrl32PAT
         nUUML41vR6XBBzaROPZfnWJs1R6MBdw50ti1IacncRaqa6zIuI3SRM/Cp3xp83NoZm41
         o7gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485845; x=1779090645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SyAk4iVepITB2rBUej8UdXxBx9zKqBP0ZKuTVk+m9M=;
        b=Dg+rOw3SpzsgV+gPI/bp/Sy8qO5za3AWGoUZuvLuFHnHvlbXcr0QxEgiVBwIYEM3dS
         S/HfR04gFriuZx8MZSOsAXKXSryx2ptgdsE4QB4EG1L5GSooPHzLvczrmWxp9+CfWHrw
         Gkm6qWZ00mZB2WMIuYxwEEuYr1IT2dzGn914YCrunkYpiWM8ctC8eZHZJquorPPCj0CB
         +/ll/Is+6Iwpa798tdmJVzHVWZFP5CorGAFW9zVTnpkWuTxcVKGgVpdgyFT9DJIhkdKl
         6nsfpiTD8TNJb5LzMxVZGAPan1iraDG/foK3582K1lSo/ONMnrqB2Hr07L0FcbQgkQmM
         qOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485845; x=1779090645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7SyAk4iVepITB2rBUej8UdXxBx9zKqBP0ZKuTVk+m9M=;
        b=sBzOKP+QyT0/FfC7VOYVh3RG9yKUEdQJ/QRlKhN+u21S3LvFe5BdR0qxSC8+1+N4L+
         n0rEDwJjh1FZsOdg4cWinV5j2XaGHLA2JrS+l9Z6/nIUZfmHgD+x5jhjdN48lFxKdBrs
         sBAInZOS/TBdmQR7rdPcwRKgoJkDHSe/4fKU3TxYZbRYy2+2JvQcYycB9KD5fZY4rMav
         Et5rFuWOeslDuzk1+ne2yT6H1gTYTPLzf0Ax6jZJA72cvmV4W51P92dV8KAntylUVRB5
         oiUsb5CaYBIxUmh1s8TDOJSD2T8JWWwKPM0S/8klkYBDwlI46uceFVbsmOFPYrjQ5MMk
         NjcA==
X-Forwarded-Encrypted: i=1; AFNElJ8KUtZsjJLne/zWdJ4gC6DGjpJ/+9HhW1YxKPi3/hm6EgKgsDMRm7oLJvBggugff/cpc3d4Bw0ADeVVGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqqPjzk8RK0kkPK2F03bn9fQYsLNT2SeZAYemcJQW+KLuSszun
	tIrjsbn41lRZzz5I5OqtyI92suxHoRewS1Te6x+2iMsrbVXvCh16v4kbUrw1fLqZlPwkJWvwace
	Q2bErB19fP1WoA44gNqILYHBiCXyZmGk=
X-Gm-Gg: Acq92OGDhjfNRnFcg7DG99/MFZKYeO+CUb3dL5CrOj5WLghlDT138SEwohWZStYsM1g
	ptbSiDBYny+xaBjAz1OhfnniqxLgI3dV+0k5Z3atq0hObocpbmiIBNQDHLJwiEy2CSciUq59Wb8
	fFHRAPatxuUygr5QVGeH5DmuaNVDDaqwAAoErguWTA4JEAs1eNZP4FaDKuMvcgj08m4krEZ21rZ
	+ut3Xv9cMLFJihH7FK/jLtJEmr4zLik7VWM9w+vKEWepcnBtU6aF551UrES/HCo9XJkrKt4GkBY
	LdNiIrfGxvEHFFmmN3s=
X-Received: by 2002:a05:7301:1008:b0:2d9:b466:5e19 with SMTP id
 5a478bee46e88-2fb4b733d76mr3944062eec.21.1778485844839; Mon, 11 May 2026
 00:50:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511074752.24745-1-clamor95@gmail.com>
In-Reply-To: <20260511074752.24745-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 11 May 2026 10:50:33 +0300
X-Gm-Features: AVHnY4LhmDvsZ_CnFuECqUjDQDEyzCnSTnfQlaiMCmcaCZvop0DASzNSUfWKOkI
Message-ID: <CAPVz0n3Dh+Rjxo3_2zvfp_R97cHrSqRNTW7MCQhu950HGT0wdg@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] gpu/drm: tegra: add DSI support for Tegra20/Tegra30
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Svyatoslav Ryhel <clamor95@gmail.com>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 11 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 10:4=
8 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Tegra20/Tegra30 DSI is quite similar to Tegra114+ apart MIPI calibration
> logic and clocks. With a few minor tweaks, existing tegra DSI driver
> should work on Tegra20/Tegra30 devices just fine. Tested on
> Motorola Atrix 4G (T20) and ASUS VivoTab RT TF600T (T30).
>
> Svyatoslav Ryhel (5):
>   dt-bindings: display: tegra: document MIPI calibration for
>     Tegra20/Tegra30
>   clk: tegra20: reparent dsi clock to pll_d_out0
>   gpu/drm: host1x: mipi: add Tegra20/Tegra30 MIPI calibration logic
>   gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
>   ARM: tegra: add MIPI calibration binding for Tegra20/Tegra30
>
>  .../display/tegra/nvidia,tegra114-mipi.yaml   | 41 ++++++++--
>  arch/arm/boot/dts/nvidia/tegra20.dtsi         | 14 ++++
>  arch/arm/boot/dts/nvidia/tegra30.dtsi         | 18 ++++
>  drivers/clk/tegra/clk-tegra20.c               |  5 +-
>  drivers/gpu/drm/tegra/drm.c                   |  2 +
>  drivers/gpu/drm/tegra/dsi.c                   | 69 ++++++++++------
>  drivers/gpu/drm/tegra/dsi.h                   | 10 +++
>  drivers/gpu/host1x/mipi.c                     | 82 +++++++++++++++++++
>  8 files changed, 206 insertions(+), 35 deletions(-)
>
> --
> 2.48.1
>

Please ignore this. This patch was send by mistake. Sorry for inconvenience=
.
