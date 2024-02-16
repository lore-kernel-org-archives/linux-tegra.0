Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005FE23753
	for <linux-tegra@vger.kernel.org>; Fri, 16 Feb 2024 10:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708077748; cv=none; b=g0VrNIbnWYfQHRtk5b/U7nCBJ7Pq6+NN6t2MLHYXZh3k+93bNkyJQR+TYzNaGXlAUWKWRO27LahC950cqDKxBzCt8Ngjs0O6QNQP991HLqK97OKaVcex/t1822vdkXh4pIjAjR1xbROYdwebaxmbkTm2P4Vya53kP8vORKYs85A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708077748; c=relaxed/simple;
	bh=iFO97t62l4dHWavxp7224ZFX2qc0rq1M7lJ4Sv8dxJY=;
	h=Content-Type:Mime-Version:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=UD3HKyL1xPv5Sx0B0fpn8C4wE2ZWttsx/BSROwAiCJ546wa91c50j5VB09gImSm7dJl7FVJG4ksqaW+oWzpmAIWrSpuih2Wu752NrS1uf3Qs9ZxR6MRquHW77xXS55MYYZkIt5dhDRhF6Kc6ggJiEwKvPtPHWB1u3uzqKJeNH2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fTGqNzk1; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fTGqNzk1"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-563c403719cso1451398a12.2
        for <linux-tegra@vger.kernel.org>; Fri, 16 Feb 2024 02:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708077744; x=1708682544; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iFO97t62l4dHWavxp7224ZFX2qc0rq1M7lJ4Sv8dxJY=;
        b=fTGqNzk1A3mpJM7GEK1XuCSevXBXDB7cFLK4pWH6u3sqqZOYV9DoMi2cAg9kbql4HV
         4VG27qrRCO2eFM2NlcNsAMFywOx8VDfMlunnuOg63dkeozShmCHqf9z89GWbOBIN1jAC
         YdqVCnrsoft3r6EwoBPs5H+JfUdYvZvhIByo2TDDgGOqtp204vrQ2fd679XALlpC8n5k
         /gPug5hXIfo0X15ttsudnsqIkCkpTB5Z2jmB7is5dNAKdGGllhrNdvdDcHQrxPMFLuS5
         Wliw0Fdc1DDq/kjKn28V8S/AR4F+ASc33G8G/8hzqmVMjtOpxrVy+tVTq+9gNZfOs/dI
         ULXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708077744; x=1708682544;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFO97t62l4dHWavxp7224ZFX2qc0rq1M7lJ4Sv8dxJY=;
        b=jX/OucxkrHQzFfkew2i692jqhyDBduiheqzsk4VrakBG2pD+H11NuV8i2KOGCzn0C0
         vx6MKtCX6e2wopVYN6S852iKWXp3iHIjujs6+4RCnYHozBH3inQX5z3qqJE6Bhw+wZH5
         RKIzIpCTg6BYKbXW5vfYXEj3QGqc/c28am7odh0d7jIeJRd552/6U53end+Q5a5zhSAH
         A0cBulCeEjXMBxW5ohKlwGuHF07bLDqDWP7vP9tGYgZYPTkgIzANdFOB0kZ6zCPeIZCu
         sEuh70fJAYC48tr/bbtqizKfndeD4Ifn4PHfAdXtpGvj1uxSZgD2gO9PxSx+3AJUN+uM
         7oww==
X-Forwarded-Encrypted: i=1; AJvYcCUqmLjG8Euq7DCRM3KMk02vzAhMvVx3Wmuse080lpr/WuqjVc6iYy5rDeNonpRk/RG8G9PdjCmtuaG2GOpH8Knx+DKgsBZWLCP5XOI=
X-Gm-Message-State: AOJu0Yxwt8czBzmxx9982N+FzZyZhg8dj4yu47QCIEtLO5xVB8EoFV69
	vEf9xFOXPmQ4j2qq7IbENGrSt10Y4zK1sQAGgSt9aSS3AokvaLUN
X-Google-Smtp-Source: AGHT+IHa5Y3wDSOPXWF8stpIoWaFLTHIB/MTDLHOIw6lBxwbSFE0Av6QFb+fAEy2Ph7nHwK1+2s7CA==
X-Received: by 2002:aa7:d812:0:b0:562:117d:2297 with SMTP id v18-20020aa7d812000000b00562117d2297mr3223763edq.36.1708077743770;
        Fri, 16 Feb 2024 02:02:23 -0800 (PST)
Received: from localhost (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id d22-20020a50cd56000000b0056387e8b63csm1419698edj.90.2024.02.16.02.02.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 02:02:22 -0800 (PST)
Content-Type: multipart/signed;
 boundary=8798a49b6ecd34086d9a3ce9a9c124c00e8a431a4b0a170c89df5b98d57d;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Fri, 16 Feb 2024 11:02:22 +0100
Message-Id: <CZ6F0Y2S635X.1X4B2G0KT43NX@gmail.com>
Cc: "Mikko Perttunen" <mperttunen@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] gpu: host1x: Skip reset assert on Tegra186
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Mikko Perttunen" <cyndis@kapsi.fi>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240214114049.1421463-1-cyndis@kapsi.fi>
In-Reply-To: <20240214114049.1421463-1-cyndis@kapsi.fi>

--8798a49b6ecd34086d9a3ce9a9c124c00e8a431a4b0a170c89df5b98d57d
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Feb 14, 2024 at 12:40 PM CET, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
>
> On Tegra186, other software components may rely on the kernel to
> keep Host1x operational even during suspend. As such, as a quirk,
> skip asserting Host1x's reset on Tegra186.

This all sounds a bit vague. What other software components rely on the
kernel to keep host1x operational during suspend? And why do they do so?
Why is this not a problem elsewhere?

Thierry

--8798a49b6ecd34086d9a3ce9a9c124c00e8a431a4b0a170c89df5b98d57d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXPMq4ACgkQ3SOs138+
s6FJLA//TLmO7NhFzAZ5dGJ0Bn9d0CzblHYDum0AOY9ZnoFl6kMUt60JGVUGPuan
2zum7+GKTW7R0z2EgBdkmqoPmF7usat9CUBTfQ/7SXjh8ZU/QUtZ6fvkICdf1X/E
ke/3n89axIXrXYicaC6BFaxdp1UiYL43NFouf7EjeXlm6Th5BplNNKhsjcK7OFeM
jpxMC9MPFI6kpfU1P26zi69sPU0Pi2wn5O2/7zyR4hWeQQ36cuRn7oEWsW9ANtEk
H30WgDoKKkqNcllqaxozbII0cRg+pPrRh79o1fXQn9TRqfqeTO665BWBvTAuvLQH
9wWLPMaBNYMr9RGZdYA7hYB4CfbFMJ2/vMgCpgZuhg4rB5Vd+2AG9b39gl1tk9cT
x2Oj3hf8ueHREHSuiz9AFRKyJwAxjrQeer5iImexTE1eUXqewZkq8X9eAySFQhYm
eO+vaO8/xJXDWCMw9a1UN+zyJjgm3mq1ZJa0uWf1IVT9Pcc42I1htDSkvB+ACvn3
NIPOd9MFuCsOchdzQm8R+M/hSjm5loG5lYH65NXi/L7Awl9cZgrR1znJCiMfU1IA
VTZlVt8fTS4mMxzom6o/N9k46gzdGOoaQaomYuRLWiY+so0UcMbAy0AvW0y0ecMm
cjUexxqJEHYHxD/r/rfkLzYcsQighTFidW8+VgEdjtfF7XF+jfI=
=/lsH
-----END PGP SIGNATURE-----

--8798a49b6ecd34086d9a3ce9a9c124c00e8a431a4b0a170c89df5b98d57d--
