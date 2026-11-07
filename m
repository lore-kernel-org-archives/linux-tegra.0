Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794046690;
	b=PlOUEaFYxiqSiWZDJGaK+KGo5z736YiTkNDnySM9ssY2KsAvL7SD0OfxhyoHRFKHXxzI
	 GosPYHrW41sKCJcGaav8KpwSLmA16odEXx4nPHQflUIUAYJ10Qot2MgAW9ZmI0E0yT5JH
	 n7OgnZ/VNYECGd17dpNBckl2qhpXvepcjcNVsP8aQItlUq5lOVj1Mvh9zvfAhm9CT3fbE
	 nxo5ojb4aLda2roNicWjiYSd83VpwKqFwJMLXj7KL2m8k7vSDqgD3XMBhTlr3urb8kAun
	 0tJ7Ssy0MWtgmcLXRrfNIufBMhpmCJ2tyHLze5Smh2VobBtwgI3Z9iaLMg2DASH9wzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LlYZSnhhBhztP5IWsnPRPqtaO1fn+3H5U4xPBBTTlKI=;
	b=HTSer8clMM1umqlmQ4TbumamaxZdAWe0pjtAauR7ksGZQYgB9naU4cXEhhPPzs7k7HUK
	 sVQ3ZPpHdyk2W/ue5jkRjAIRGIh4HRjuUeWw79cMlm9hu3jUcZc713EwctdMXrbgDd5Gj
	 EO/T3Zl22zX8VoBeEIAscXrQAgWhYjoqRQv63gb+9wjNkjt+Xg5tKd0Npu12vqZFLi9ck
	 F+GhOYLlT8ZVcddchwBpRKp973W2AI95XttyQt9jub6NEa8ZoNvFuh4TTvqxNGS3BdibM
	 +9hwepfs/XwsJd9dWV8peh+m2g5I10zlTAlW5TBVhd7sOVahVPCzVXt+pWwqKReehsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lP7jVZlF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C77606A330
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 10:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5C77606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lP7jVZlF
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2377688eec.0
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 02:18:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794046689; cv=none;
        d=google.com; s=arc-20260327;
        b=d5dz9AKz1WCMv380zG77x0Gr54o9i9wUuIWfK2CJZ3LjmRyguMBbDXVuruJijmq57E
         aeKiCvp9fu4rlPXDR3DMz1Hkm8fGG4T56mI4HKoabV4KCA8XTokH/c85scuHvcPGovAA
         LeMOdhpVlZfsOXCeqcPYgdA4gglWb+UAICehFVFHQblhjPljm0dKwNMJwOpLknygf9f1
         KKB0ktNexXSZ+i3e76W9wcMje+Xk1AsdrV0CFu6/+77u97EULPhy04imcZb0ndsDZ7ry
         7/ToU4s7tAg98UCN4GM2LGoqg8eaHESBbXkv7T7CHfywWErmA5iwX4Dzzhbsp6qz3gsp
         JtvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LlYZSnhhBhztP5IWsnPRPqtaO1fn+3H5U4xPBBTTlKI=;
        fh=jeNM6b0KU5epbVxnffGzVD5IVbcyWzJOIVAj2dSnsr4=;
        b=SFQTWZ00zVwZzaR+6rchaC8KuEd6MeCY2o3fO/fw7owy1DUiYnWH7aGvfzKmngaTcM
         EodJTwcCKkeSYgEMFmfbqSjSYFL5gZn36FwozzEmwT/U17k7pFGxl853U4qphuQGrXqw
         8KLTIAWq9TUnfNI5K+6OuU1uR3J8wRx/hK1V5P/SLpsX/ADVtXmZ9Xzw143iUiIBIQmE
         MNklR3JqDCCXQMLXdjqT3RSb2VJI6y6EmN+C9Bj2sY/Yfp3CGUkiPLF1L+P6zTEcx0gu
         lyBhCjPh8sZZfRRJLKfdXE/Wm4ZXigq1FJ+GRlvzd81BGc3Wph/I2vwAxbeIvRy9zCKi
         +8Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046689; x=1794651489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LlYZSnhhBhztP5IWsnPRPqtaO1fn+3H5U4xPBBTTlKI=;
        b=lP7jVZlFvy1fTCONhPWDyL4pzmVoRjpo0Cd87RZmlWWt6Q7QRDEuDQkoFslzqtaodt
         1RI7cSRBMHm6M1e25Wg6HMmzjbbdiCgJvEBCN4ODyKT1RR34cQTfuxMTfsvSj5tsrWfi
         weR+zF8KcKUVMUaux8r4g/yNS5S0dOdnTM0HwsT4IgS829GvcVsdfjNkq1J9aCiDAof0
         iLntN44/aK+yT3bzsqtUFByFKhH6mt/ZProSDKGMNziLedQKVy6IuOtecDmcI3rHN+Gi
         PhakD0y9GvzTlClIc+8VbgPe9Gw+fWJfCW5NVAopvJqHPKCtinthbNzdF/WnMxqdFeQV
         zYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046689; x=1794651489;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LlYZSnhhBhztP5IWsnPRPqtaO1fn+3H5U4xPBBTTlKI=;
        b=y5nUSvvMFgkoSRVqasRr6d5zcv2zSioVAGHG+blHXiwJ5o5WYxjiWKC70XFF91s3+y
         HG6XZyaqz1QzuM8lGOdC1ndYSvARQWYJu54ZUU3TKc51m2qSewVk0Us1YerOvpcfknID
         4XQ9+nvrsuEieULJdR3kvoytWcdBss2YK0EXuNUmavcddF11j1FQGPR2zwgEH4WHJE6V
         3KC63pPiEiZxWklWp6QhUSKp4a02pqeVOY/KmlXWdudaK7j1DojW53TyczdjFC4e5Idc
         opjm9dWmUoJhI+QVaEmw8dmODTfWl+fo80zitN6b05UtUC8LsuZqY7jCI0pW/o0wk8Kd
         vo7g==
X-Forwarded-Encrypted: i=1; AL+hErEcLjqQpDLgdV96bYsrzjpNEB13YR/zax2CCuJZPzC4e4blUI9q/6LoKbThVdhdwFc7lVECHBh7V2wKMA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8pdhje5a8zSdwUtIIvgaFPJoy8UjFBVTCbRewLptQmt0nUwX1I
	JhiP/tHo7/iD1lFlUZzYEG8IIcWOgAHY3hyENsNIma2i4JkRzoNwC/eYpUXCZD7H/w4Vg2rFgXV
	JL545fpgdnn/q3yqc89FDMW+G1rwTJuY=
X-Gm-Gg: AYBFou1lW/xiJakal5ypTOKIljdUH0OVcLkxlf96APxSI9wqyNqEo6Z3XveNbQlTZpX
	qt2u+DNqyR9mTrVURIit+josfIgurT2tGI5oz5O44/GDaqqE6tkK7e927iLns9E0e95uJ1RWvFg
	6y2wllK6jH1jVKwoCux7MvPAGSarcrECdP1lN4txrT4OBSD+tfuoZMp6FmGlBRttZwDDkj/j21P
	yOx2fIVARRD6+nfOyTnoxWx2lHQB0+X54RHsjRT3a+60etSpDdWvBiOe+JG2jJ6+u2sGqCqFvzp
	zpWfYnEVn4UQibNG76Eu9m+n0EE1VqxZkwb2253H5LOZn1Ulkzyl2ytA1EFPvIde+fj1u1qrJm6
	oCcqTBpH93Uv9D+lrn5CnGFlh6rvNabmTTqX0dDUK3+aF9d5G+kaqd1jGWQXYKoz7a6a/5nuKre
	kPCvAMGa380rh3MHZ7UT8ryL/kf6M7lg==
X-Received: by 2002:a05:7300:de07:b0:36a:1294:59e0 with SMTP id
 5a478bee46e88-36f75f2622fmr6160193eec.24.1794046688723; Sat, 07 Nov 2026
 02:18:08 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-upstream-soctherm-t114-v1-0-c875d1921084@tsv-stahl-riesa.de>
 <20261106-upstream-soctherm-t114-v1-2-c875d1921084@tsv-stahl-riesa.de>
In-Reply-To: <20261106-upstream-soctherm-t114-v1-2-c875d1921084@tsv-stahl-riesa.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 7 Nov 2026 12:17:55 +0200
X-Gm-Features: AclHuK_jIEdyr-up9S7mHl7KTEoo-13Z2jwrbx6ifXQMV0tTi0jUUh7MBAiai48
Message-ID: <CAPVz0n2jFCxCa=t=XaxE7S9YxbYyF3WGbwXqBvkkQHjmiErqdA@mail.gmail.com>
Subject: Re: [PATCH 2/2] thermal/drivers/tegra: Avoid SOC_THERM calculation
 overflow on Tegra114
To: admin@tsv-stahl-riesa.de
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, linux-pm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:32=
 Patrick Fischer via B4 Relay
<devnull+admin.tsv-stahl-riesa.de@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Patrick Fischer <admin@tsv-stahl-riesa.de>
>
> SOC_THERM calculates each sensor temperature in units of 0.5 C as
> THERMA * capture / 2^13 + THERMB. On Tegra114 the intermediate product
> THERMA * capture has to stay below 2^24. Above that the hardware sets
> TCALC_OVER in SENSOR_CONFIG0, clears TEMP_VALID in SENSOR_STATUS1 and
> the sensor drops out of its group. On a Tegra Note 7, 80 out of 80
> samples matched this rule: TEMP_VALID was set exactly when
> THERMA * capture < 2^24 (largest valid product 16747731, smallest
> invalid one 16877718).
>
> The fuse calibration itself is fine. As Mikko pointed out in the review
> of the Tegra114 series, the fuse corrections are in 0.5 C units on
> Tegra114 just as on Tegra124 and Tegra210, and
> 2 * NOMINAL_CALIB_XX + shifted_xx is correct. This patch keeps it that
> way. The problem is the range: with T in C,
> THERMA * capture =3D (2 * T - THERMB) * 2^13, so a sensor only gives a
> valid result for T < (2048 + THERMB) / 2. On Tegra114 THERMB is close
> to -2000 (between -2117 and -1812 on the chip tested), which leaves
> almost no headroom. On that chip the sensors were valid only up to
> 45 C (cpu2), 53 C (pllx) and 32 C (gpu), and cpu0, cpu1 and cpu3 not
> even at room temperature. The gpu zone therefore always reads 0 C, the
> cpu zone stops following the CPU at about 45 C, and neither the
> throttle levels nor thermtrip ever see the temperatures they are
> programmed for.
>
> NVIDIA's downstream driver runs Tegra114 in "lower precision" mode for
> this reason (tegra11_soctherm.c: "We must use lower precision (0) due
> to cp_fuse corrections"): the sensors count in 1 C units, the readback
> is scaled by two and all thresholds are in 2 C steps.
>
> Do the same with a lower_precision flag in the SoC data:
>
> - keep the fuse calibration in 0.5 C units and halve THERMA and THERMB
>   only in the final rounding step, so THERMA * capture stays around
>   2^23 and the sensors report the same temperatures at half the
>   resolution,
> - double the readback in translate_temp(),
> - use a threshold grain of 2000 so that thermtrip, the throttle levels
>   and the trip interrupts are programmed in 2 C steps.
>
> The use_lower_precision option in v3 of the Tegra114 series and the
> downstream driver halve the calibration temperatures before the
> calculation instead, which applies fuse_corr_beta at twice its weight.
> Here the result is exactly the current calibration divided by two. The
> PLLX hotspot offsets are left as they are, as in the downstream driver.
> Tegra124, Tegra132 and Tegra210 are unchanged.
>
> Tested on an NVIDIA Tegra Note 7 (P1640) together with the shifted_cp
> fix: THERMA * capture now stays between 7.7 and 9.2 million, and all
> eight sensors report TEMP_VALID in idle and after 60 s of load on all
> four cores at 1.12 GHz. The zones read cpu 43, gpu 39, pllx 43, mem
> 39 C in idle (board thermistor 34 C) and cpu 63, gpu 55, pllx 62, mem
> 53 C under load. Before, the gpu zone read 0 C and the cpu zone stopped
> at about 45 C. The thermtrip, throttle and trip thresholds are
> programmed as 51, 50 and 45, i.e. 102, 100 and 90 C.
>
> Fixes: 9d522a877b6f ("thermal/drivers/tegra: Add Tegra114 specific SOCTHE=
RM driver")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/all/22816196.EfDdHjke4D@senjougahara/
> Signed-off-by: Patrick Fischer <admin@tsv-stahl-riesa.de>
> ---
>  drivers/thermal/tegra/soctherm-fuse.c     | 15 ++++++++++++---
>  drivers/thermal/tegra/soctherm.c          | 21 +++++++++++++--------
>  drivers/thermal/tegra/soctherm.h          |  6 ++++++
>  drivers/thermal/tegra/tegra114-soctherm.c |  4 +++-
>  4 files changed, 34 insertions(+), 12 deletions(-)
>

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab (P1988)
and ASUS TF701T
