Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795331564;
	b=EH/xAfM5oPEuYAEzWbI3QBUAEdoP+YfOoS7setD23Hmna+7MbcVXzm0cyFCDTj+DC++L
	 7vf3KYZLk9vjprBVJr6H+zx9MeVhmbch4acXxTOGo1qkmdyaphVNEy/K8U8QY3hPtOKCw
	 9V8aVIr5aDhs36juqV9bX5NBHyY6Ro5NvpgEnOODZ+QL+NL/Waw6U0OiHNkfrvHWv8TxR
	 Za+OD0okNSa8/oT9lexFqZLjRitynRi9d6LAEC48m/DV5ASkIojJftVuJHb67kEd5eWm4
	 UUby4wX3YkzluGmy5ZLGPvnkuCrrQvVnQOgwtB28pZUesg6e+nMcYhyeGfEPkJFCmIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795331564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3zVCA/hCaFTJ0zs7I3VxuYhc3vtPcxVWB5oZY5PyGJw=;
	b=TEoUDG6xZ7gChpcNvIGZ7FfsJhmbKcUYcS6culCvtRYI/S2FZgg8NKVM5CW+u26Kn67u
	 S73XrqVXe13ok/KZU+5b7JlSa0d25s7BSPdzAVyY/m+PaFcC/Y145iZXFboYDNBdxfE/8
	 GEPWFtkMuRG2Xr+X3hPza1ZjF2ThgS5bND8I0aSs0JcvUlXolBje0svSA5TkmOJ3CJBa7
	 x7RKhe+EqRhpiS1VeHhqP2nlGRlKH6cl229bjSnOipIpokIXocHbWFiqZNkc7AdR2WGGO
	 9O3U+AYkXdZ9bBICu/ul7tG9vJLRZd3d4jUASP+W5HlGWRUeZLKlt4+yLBT2AKqg93A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnnaOsuc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DC2606A320
	for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 07:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9DC2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnnaOsuc
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38692f62b22so3533456eec.0
        for <linux-tegra@vger.kernel.org>; Sat, 21 Nov 2026 23:12:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795331563; cv=none;
        d=google.com; s=arc-20260327;
        b=UHKuVZQDSuhH9Th/Fizpy3AyJSFW1w9ymp6mf77zTTYXDJITMnAg6YvRg36eprfRAt
         XXpUS8qwANTvGf5do3Nr4vTIiDYhlf6iO00I6qTEJ9TzInJh2FQ7ARHrXYHWrD/WFj0l
         looJd0CL+6lHquE7ddvNwFDcbzYUKqO3kyNjHcqgi4YYrnlQiL86b6z9Ai23L4m8cjSR
         5mP3VvA7rgOVcjiZFqW/sgaTl2huFKNp9C0NWMgZOKwndb+P8q8Cyf4MJ4M3aR6NNEtg
         EEGZaXwP6rKaTSgfNYE5bxlvGmQrXnQDB9WL6yBe/3UflSjr9ErYCYrwtiMftWZIA6KR
         v7qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3zVCA/hCaFTJ0zs7I3VxuYhc3vtPcxVWB5oZY5PyGJw=;
        fh=stw9Ti4TVB/ZjrfhWMBdupdmyrlrCnFOGKTUxC8Aikg=;
        b=mrJXGes6Ykh+w8Y72d71ZIxuRHHTAtkVFS1Uw2r+ExN/Zoy2Rl59c+chzf6FmOTRC4
         QCJIM4fjoRt/cW++00Y9sS2Y6gg3JnXDUohIXIonilhEhYwrDyjo1waL9yShb142faLL
         z+9qxSOF/7+pGMKNxYl007I1pSv/Dwtt68MmffvJw5YO5a/CSnt1GgFgj6SbWRxUXgR4
         y/OUpJGFf2UxJvPe8kaPNNCu9X140y+ZKV2CEsJlZsfV6ep8UpqIeYNWQ7Fnau45L4VL
         BaQx0GXuJLHIVlNlkVPcRxoPoDz8Bi9kvpE9e2NaBBdYQECYpyFl7qYWCDi4EVoRN+W0
         vLRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795331563; x=1795936363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3zVCA/hCaFTJ0zs7I3VxuYhc3vtPcxVWB5oZY5PyGJw=;
        b=ZnnaOsucVYX/DpYqsG0NMRxxNHndwpI3QP2ecJ1bAcia9LOdpB/4xgGkLKF3dCuFzi
         oOFMPUZa8JavQQfbnxRNuO2sgn9X1UT0P2VCoczxfqaGWxPcDo+7CmUmo45nbLDgo8xj
         27KbhSIgL2l36VDw3TXvTlHNcCBt8K6611DkLmiJ1d/stLjd7Qc39BWZvIjz5OfpOwEc
         ROgoAUtEQfi4Ic6SbCaeiWhG+ykCcw3+KB/ppdoxsKn8zPDrM8bE/yhoLf2s7UzGCUvY
         ZcEUsz9WRafKG6cqV+4sEbYzv4vMSQJkFj46CEeF2QwsObFOq84bcvSoEJNRJWc+LyX9
         /54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795331563; x=1795936363;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3zVCA/hCaFTJ0zs7I3VxuYhc3vtPcxVWB5oZY5PyGJw=;
        b=2Mn7SD0RWWjxUybeFJai930la5eIMdCcXQSsH3SSgPfS/iC4OInxKG+tSdY0ZMspsh
         EQvgitg3jNWorI+GvgTCAJBR4dLe7+Zrwce7ZSACZ4rcZDMCZWUsMvoGiJZRrno7lcrw
         alaRYJD2TEyi6sBHNIWVHx292qUQVPHz/pejImO+O/vBXUed7WlBDMd7LdTDDdk3YqEE
         W8UumEPJPVIskwiP7hq5dY92Nj2cKhNkBkdex6iFEBXISPokvMtDrheyyoa8/oU3SBNN
         KAB2rz32CVHeQyBN/mVublaa+W77mUgEiHW2xs5ZsEPrB2X71JG5QKptQjnpK3dWSYGZ
         oGDg==
X-Forwarded-Encrypted: i=1; AL+hErHUBZpGVbaY2H2QdNL3bpdooIeynUhEqzAVFm+qTrGGLrhFiSZXMF9Wtw9OtrDU9doexYKyzEsjwKfrYA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9haVIKbkOwXCSbkwTBB6rP3AJAcgxxbmYn41F6kGovB9/MgC18
	FDd+DTq80sY2kPWZwxVvEr3uwKt1TA09rMMj731ZoKg3SpNqxYFDO7N8dV2pRCbywAGxG/6/Zls
	MumuuqpaH40DfX/oscTf+g/xZN8K4yZ0=
X-Gm-Gg: AZFdTZca+Rnks+EpnLaRHpUuwy6q8RAA4ParrucItKBgLcrze5iwKi+k6c77EEFRizy
	yL4BAsHs6Y5Z2eWiR0oh8k0N+hMCbCRifc+irhgHTai5SzpeUH8hIgamW4zkVvFwEEeLn+YJCuU
	C43cBfbpK9ZdfOMGSU+IKoAsSfvaz86hiqJ263ZHduPwotKK2rsWpofJFioqYp7sHKRQyJD8Q8g
	yFSW2DANtOx66PK4YFCn6saXMnUvxV9Y7fPowIXAdB1Tjl4QfuBjsPSFgEpo6ojLL+vq1CMy1Mr
	0Z6VW4+2gDkG41IKFoCm4dvL49aDRh7XwG8StiiH/zQo3Wtw6ab4uc3OtzY7C2sWvC8jvkqYrPY
	KP9y7ZCAMwaNVkXbC4Aj2HvkWi5021LCKS5p0fCFXtcyO0+bxFioC+2OlcF4LIp7YjNJQ7YvL2a
	73DrlNvhuQxMLoxyC0oafKf8c5fZqhR4U=
X-Received: by 2002:a05:7300:ce11:b0:381:a037:b060 with SMTP id
 5a478bee46e88-3856e63b3dfmr8855384eec.9.1795331562732; Sat, 21 Nov 2026
 23:12:42 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-b4-tegra-soctherm-shifted-cp-v1-1-528e3621226c@enser.io>
In-Reply-To: <20261122-b4-tegra-soctherm-shifted-cp-v1-1-528e3621226c@enser.io>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 22 Nov 2026 09:12:29 +0200
X-Gm-Features: Aa3M54oEQYrdYNxdmGboCbVhjm2_VcZfJC2F9W-WuGPrYliNjD9ZCNd6ydzWpMw
Message-ID: <CAPVz0n1wm2jNu5n0DXMea70mw1Z1uSrQQLVDA1PLHYbh+-h4Ng@mail.gmail.com>
Subject: Re: [PATCH] thermal/drivers/tegra: Sign-extend the extracted shifted_cp
To: emcp@enser.io
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Wei Ni <wni@nvidia.com>, 
	linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 22 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 07:1=
2 EMCP333 via B4 Relay
<devnull+emcp.enser.io@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: EMCP333 <emcp@enser.io>
>
> tegra_calc_shared_calib() extracts shifted_cp from its mask and shift,
> then throws that value away on the next line and sign-extends the raw
> fuse word instead:
>
>         shifted_cp =3D (val & tfuse->fuse_shift_cp_mask) >>
>                      tfuse->fuse_shift_cp_shift;
>         shifted_cp =3D sign_extend32(val, 5);
>
> shifted_ft, two lines above, is sign-extended from the extracted value,
> which shows the intent.
>
> This was harmless while every supported SoC placed the field at bit 0:
> tegra124, tegra132 and tegra210 all have fuse_shift_cp_shift =3D 0, so th=
e
> masked extraction and sign_extend32(val, 5) name the same bits. Tegra114
> has fuse_shift_cp_mask =3D 0x3f << 10 and fuse_shift_cp_shift =3D 10, so =
it
> reads bits [5:0] of FUSE_VSENSOR_CALIB instead, which belong to base_cp.
> actual_temp_cp, and with it the THERMA/THERMB coefficients programmed int=
o
> SENSOR_CONFIG2, come out wrong. The hardware then flags most conversions
> as overflowed and never publishes them.
>
> On a Tegra Note 7 (Tegra114) seven of the eight sensors report an
> overflow with TEMP_VALID =3D 0, their thermctl group registers stay at
> zero, and cpu-thermal, gpu-thermal and pllx-thermal read 0 in sysfs. Only
> mem-thermal reads a temperature. cpu-thermal carries the passive trip and
> the cpufreq cooling device, so software throttling never engages. The
> hardware thermtrip compares against the sensors directly and is not
> affected.
>
> With this change all four zones read plausible, distinct and moving
> temperatures (cpu 32.5-33.5, gpu 30.5-31, pllx 34-35.5, mem 31-31.5 C on
> an idle unit).
>
> The code and this changelog were prepared with the help of an AI coding
> assistant. The submitter has reviewed both and takes responsibility for
> them.
>
> Fixes: 65b6d57c24ed ("thermal: tegra: split tegra_soctherm driver")
> Signed-off-by: EMCP333 <emcp@enser.io>
> ---
>  drivers/thermal/tegra/soctherm-fuse.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/thermal/tegra/soctherm-fuse.c b/drivers/thermal/tegr=
a/soctherm-fuse.c
> index 8d37cd8c91..2de1d0cb67 100644
> --- a/drivers/thermal/tegra/soctherm-fuse.c
> +++ b/drivers/thermal/tegra/soctherm-fuse.c
> @@ -102,7 +102,7 @@ int tegra_calc_shared_calib(const struct tegra_socthe=
rm_fuse *tfuse,
>
>         shifted_cp =3D (val & tfuse->fuse_shift_cp_mask) >>
>                      tfuse->fuse_shift_cp_shift;
> -       shifted_cp =3D sign_extend32(val, 5);
> +       shifted_cp =3D sign_extend32(shifted_cp, 5);
>
>         shared->actual_temp_cp =3D 2 * NOMINAL_CALIB_CP + shifted_cp;
>         shared->actual_temp_ft =3D 2 * tfuse->nominal_calib_ft + shifted_=
ft;
>
> ---
> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> change-id: 20261122-b4-tegra-soctherm-shifted-cp-a3b27f666f1d
>
> Best regards,
> --
> EMCP333 <emcp@enser.io>
>
>

I wonder if this is AI slopped, or straight up stolen?

Existing patch sent 6th of Nov 2026:
https://lore.kernel.org/lkml/20261106-upstream-soctherm-t114-v1-1-c875d1921=
084@tsv-stahl-riesa.de/
