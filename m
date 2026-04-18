Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F7F23D7CF
	for <linux-tegra@vger.kernel.org>; Sat, 18 Apr 2026 13:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776519439; cv=pass; b=ClpbhbYUYIbBzlotliztOc6i6nqZGS7mC77Ba2rkp0e7HhksspxOMoheTYiI2d9oRCIM1ohOnCSCcj10374wjHw5zuRSlAdaWxEh7eeIcEkjK4s5mYs2C2cLKre2w5zemRT0ZKzoagbM8ZVY/WyTzUQvSN2DA/ySTNfcQ0HuGpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776519439; c=relaxed/simple;
	bh=dcSMSl/WEq7yyaf5lQbkPA86KkCPPo3BDlgTDv3bCwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gy0YZe9nSExpWkES5Xju/tvsGOVJPZXCpl/hMP7Prbf1GeisFUtz8tRwkoyunuD9m68nFrxXVujL3wb37OfvYoh5WkC3SBLkPN0kKPH6pW8WPpy7nqaN0g9YF94wQziooePC920EFjAMJYCBYZRbJI++9b7JpXv338WqXHfHsB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zn0ohuAv; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zn0ohuAv"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a337552604so1673770e87.2
        for <linux-tegra@vger.kernel.org>; Sat, 18 Apr 2026 06:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776519436; cv=none;
        d=google.com; s=arc-20240605;
        b=O9nJXbVYci+kTowXFu4l2FNugOszPxdbeTQsUrwdJyiSqGRP47q7JMhgJw7lLpKuuy
         sAZkGRGrtUlR7F8aM3RKLz4DbUmIJgaNXDKiRfXQtybPyOVK2MY+C6+27+CJ1WE9Jw13
         4hjbIhzGluacMhV2wJd1JXF13M7mmDEv8xaKSoibI9aFBvRlHD44RENI3/Y56UiD1AaG
         hQn3dOEzI4wwQGDffbyOI+kGSTrTQnuGovWj08MCV/ZTiR477pglLlmv0lcQmsmKLW0T
         USeZXU8lJnVX/VU9tzzX1ruvaDLic2qxJXEyWvN5U3XwzvsuyVXUjYhNVwedHWGvSAG2
         ggAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ilQZAzlg/SXrVi5zNAVi40oN2cY80CKPwE8w12CH8oM=;
        fh=UUMfCSPMzPxaUe6GF93TiXU2K8o+casqKDxrZbrJnMU=;
        b=C7eWOsLXqOTdbQwoJU7DXWM4yw1QKjhtkruae2GQkvQmWW+4b5wT9Tdw4F3rpBdhhL
         gIOD6zYPb+dl32i/z8wVzo4tiCk8VGWZwfDesu8LXz7T3X8oguFMl7R2FlmsGUQ5NgeJ
         3ygHkqXBBgrI7Rfyonev1V9xSfFt6FeTq4cLq5cfKVoTa2NRXHD/+ergfES3bgM7sFrv
         gbR6A4WTm3VfeF5arFUYpBNyiJk1M5acczYfAF7nbT6O8ONCL31/y/vArmfi8CO9X6OX
         kENNmLaSv0ZnIJ/Z856MLP4xjNFsD45lmbUKRCzAGYpEN7bqHz7O76QZD+JWr7p6TxqE
         SSzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776519436; x=1777124236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilQZAzlg/SXrVi5zNAVi40oN2cY80CKPwE8w12CH8oM=;
        b=Zn0ohuAvY90ZU6BzrJTjfcE8tSayIb/ZnAoj8s/f2RnOeYHqLmf8v2Ref3M4mW/s3k
         pELHQvo5IqFJDQj3Xr08W8TDWAUIyVwpu8Sppt1dU+dGVj8zEuvExKHeTBMf2+snip/2
         jyJDnmpUN1HARxdngYyBCM1dmhX1hepqwyKQmYxsrUv+1+0YmMjyZC3oCCQpjplDgXDL
         F4/WbL40cbVETjMrGbjy3uDWewxrXrYoehv7T7oW/sYfkInbxHx7jzwGVvI+9tETVSRF
         HquB4eXaVvNFYGWYdwL7IW1PNf+PfAQteGh17zN+7LoEETx8fSmWbEFyzXHzyj8clu3Z
         MW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776519436; x=1777124236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ilQZAzlg/SXrVi5zNAVi40oN2cY80CKPwE8w12CH8oM=;
        b=qb30hJaTS0NzEkNEvid1wUd0/jrf1CVx8AHSSpt+EjARj3n8bXhw8UV7q/pYk5l/u6
         3ECCLPWDy257/+PC1zibE2arVeIac0reUPYbxuNYGvKdYYVeEY98EMWeC1MOxhBdTV5p
         30YqwwmVEJyIFD90++xfufssqNqzu4OElyEkeCI/ExRJOIfvuzYSYa13eDoNMBn31W9f
         7FP25afb2aoSsp+jNi4FLSRXY3U0o8Ey0jGjKul5PiyTVXWMQwPmOEEybHImry4cmiQI
         Rihe/Q8KfRaK8ZA1oGIpZZZTOtDK6COZUw/hx67lvkRCl3N9ava2HQDQqKfKnXXQRN1g
         mgHg==
X-Forwarded-Encrypted: i=1; AFNElJ9V9ri9PJCQ8OR7EEYJxktLDK5lnvB+UDZ0k8y1DhaAJ/P+XOlZWWuBjZj4qyD9YUNcdV2cxShcGXFBAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YznmO1axrpHZRDO4ecNvzP2Y6DtoXPOwBS0ihRBUP7MANhrznPN
	P4/7H6do80YxN2D2kwwq8rhV7LWdRZwg2yMsvP/va0+96X6ATqRjbpUE9DX3G6j8tkbAvJMrtOx
	rwQpKOW/H531L8Xos1/m0WQYVEZDY57U=
X-Gm-Gg: AeBDieuHCH0eGiovj5DwjZQ5VEa/rpV+8CSBOCsD5IhrJFX3fSy9+g+kqh8EHsoRh/l
	XmbslpP6xJgMRn2fQ0pKjGB/cHPGuNVZhEUbs1jwxG7TiBoYL3VXquEPdiibxSxCslzjiU3XJ+7
	G5N4cNIuOhHJowrclE+t2MuJ7K58gxzcXdeduLvRxIQFs145lfceBLqq8q3MaMhjUctP4iB4hz1
	IK826qK3sQ49oKFuFLr7DnwDrVf5vScZc9rITvYVf9nTt1uz1iBwJELGvciDO71VTSiF2355uPx
	MqRFXLxE13CpFttllLN+BMwzj10DZwG9VvsicUgJrkkQhOrVxPBhZsR1ekpaWc0L0+U7IgSDDte
	mCQk=
X-Received: by 2002:a05:6512:234c:b0:5a4:1672:59d6 with SMTP id
 2adb3069b0e04-5a4172c74d0mr2164468e87.15.1776519435667; Sat, 18 Apr 2026
 06:37:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410200530.171323-1-piyushpatle228@gmail.com>
In-Reply-To: <20260410200530.171323-1-piyushpatle228@gmail.com>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Sat, 18 Apr 2026 19:06:36 +0530
X-Gm-Features: AQROBzBW9jKpnnpm-uXKP34lAFjICEdCoA6cruit9Z_tuBzWU5Tej3ZknrtJJyQ
Message-ID: <CAMB+xkYZZprxmBMWnypYc3kfVa8ZN+WWrTOT9TpZqcQGOAyjVg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] ASoC: tegra210: simplify ADX/AMX byte map get/put logic
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sheetal <sheetal@nvidia.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2026 at 1:35=E2=80=AFAM Piyush Patle <piyushpatle228@gmail.=
com> wrote:
>
> The Tegra210 ADX and AMX drivers both keep their "Byte Map N" ALSA
> control state as a byte-packed u32 map[] array along with a separate
> byte_mask[] bitmap. This is because the control range exposed to
> userspace is [0, 256], where 256 is the "disabled" sentinel and
> does not fit in a byte, so the two arrays have to be cross-checked
> on every get()/put().
>
> This series stores each slot as a u16 holding the user-visible
> value directly, turning get_byte_map() into a direct return and
> put_byte_map() into a compare-and-store. The hardware-facing packed
> RAM word and the IN_BYTE_EN / OUT_BYTE_EN enable masks are computed
> on the fly inside each write_map_ram() callback, which is the only
> place that needs to know the hardware layout. The byte_mask[] field
> is kept in the driver struct but allocated dynamically in probe()
> using devm_kcalloc() with soc_data->byte_mask_size, and zeroed +
> recomputed on each write_map_ram() call.
>
> There is no userspace-visible ABI change. Control declarations,
> ranges, initial values and handling of out-of-range writes is
> preserved by treating values outside [0, 255] as disabled (256),
> matching previous behavior. As a side effect each patch also fixes
> a latent bug in put_byte_map() where an enabled-to-enabled value
> change was not persisted.
>
> The packed RAM word construction is also updated to ensure the shift
> operates on a u32 value, avoiding potential undefined behavior due
> to signed integer promotion.
>
> Addresses TODO comments left in tegra210_{adx,amx}_get_byte_map().
>
> Changes since v2:
>  - Move byte_mask allocation back to probe() with devm_kcalloc()
>    using soc_data->byte_mask_size; revert write_map_ram() to void
>    and runtime_resume() to returning 0. Suggested by Jon Hunter.
>  - Fix bits_per_mask: use BITS_PER_TYPE(*byte_mask) instead of the
>    incorrect BITS_PER_TYPE(*map) * BITS_PER_BYTE. Reported by
>    Mark Brown.
>  - Drop <linux/slab.h> include (no longer needed without kfree).
>
> Changes since v1:
>  - Use dynamic sizing via soc_data->byte_mask_size instead of
>    chip-specific constants. Suggested by Sheetal.
>  - Replace magic numbers with TEGRA_{ADX,AMX}_SLOTS_PER_WORD
>    and use BITS_PER_BYTE / BITS_PER_TYPE(). Suggested by Sheetal.
>  - Add <linux/bits.h> include.
>
> Patch 1/2: ASoC: tegra210_adx: simplify byte map get/put logic
> Patch 2/2: ASoC: tegra210_amx: simplify byte map get/put logic
>
> Piyush Patle (2):
>   ASoC: tegra210_adx: simplify byte map get/put logic
>   ASoC: tegra210_amx: simplify byte map get/put logic
>
>  sound/soc/tegra/tegra210_adx.c | 85 ++++++++++++++++++----------------
>  sound/soc/tegra/tegra210_adx.h |  5 +-
>  sound/soc/tegra/tegra210_amx.c | 82 ++++++++++++++++----------------
>  sound/soc/tegra/tegra210_amx.h |  5 +-
>  4 files changed, 96 insertions(+), 81 deletions(-)
>
> --
> 2.43.0
>

Hey
Just a gentle ping on this patch series.

Regards,
Piyush
