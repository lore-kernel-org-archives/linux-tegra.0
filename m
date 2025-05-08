Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1470D284667;
	Thu,  8 May 2025 20:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746736585; cv=none; b=c8dTlDbFi8q1TZHGqyHPt35YU4MUsanl/vjCe5JKmiUH4AebJ7EMwPx19W4sgsTfribKCHbVDeZURoLhBNkCWqg6pRS+OwNq4UZdek42gXdtTqXnTTeuLs6LdAzdP31v8futPnTCxKs1LXoY6HczsXkbpUq7sH0SkPkNe5VF/HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746736585; c=relaxed/simple;
	bh=y5qpD0WZjHy4czi4j/Pprd0tD4v2dzq6OR/ERjY//9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RAcZnHhyaWlvTwzxpnVfYhSccZ2BSpdS+PBr8wbsrLBAelQYRHpkwv/QWyr2gfXnPzOOiDdz0CMBDKQG7b7cC7W+mk2W5wbsuRgq5QKwUPboSFE0rjuUb6zvmJYytVvzW752iTNR87Zz7cmdmUHdTNACspTXgYzNLPD2nK+tOeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hRzFpsqF; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hRzFpsqF"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ede096d73so10069385e9.2;
        Thu, 08 May 2025 13:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746736582; x=1747341382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/jT4JkIqIx5My4iacFXOf6IaBvNy4eUo5WLkXv0mfbI=;
        b=hRzFpsqFgFA9ZMB9RDwlHDdWlp9oln4OuuhNY+1m2AE7jzkkF+ojdSN36qB/i5u458
         +iaAK7rXVX2oRPpRBaOY69Lf+W/Sg34hYxMyTbhJiTXa+6SJ3QHh/fV3zpsew0q5/yIZ
         V/AdeltSiIOb2QDeYXmHTkwAaA5jPklEKN2HE2FYu16qhhwcw74MXlObhvydZvYiCiQ4
         5olhGdTl5sM2cMPaLyz5selaBZRYB0xtVQVpR4JU4ca1+NPWXOBgJN/xXsHAOHtnn8hl
         +vPrbqS9J8utual3vAsH2eRKvOTwzfjZD0hsPdS3E0iS7PFGO+ciDvVZKHtR1DpeYbIc
         Q06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746736582; x=1747341382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jT4JkIqIx5My4iacFXOf6IaBvNy4eUo5WLkXv0mfbI=;
        b=HY9UGlpZaMXO7a+W7Qy3PJRPoFMEjn3trJdlrvSR1cPM/M+iYLPdC2GeJqH3cWgobm
         SLQr/YXjg56EWGiameONqyko17i5CJwqDnuVqs4bbMRdKSBAftQePHWHoonu3TcZPi0I
         F0M1iTA1CJoylqKlYrx0HU91aarpWsmyBqoSQZ4F9/Ie4+ydapxGaHZMCFRGTvL4wnVj
         nC+0O9bvIewAVggcinGvX1BsuxBgG/9/pwStD5eOrFqRXSQ+73j9pbWBe3+Awg/BLcUn
         Q5fdXobdGYnBqWGj7FdYm0tkDbXuo/B6bOw0eA25XQAdwKQlXUgeukU8/h6iYSn068xD
         t2VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBNOfa8R/IMuMoBsYTu/yARbAS73hGNoMt/uwRU19RApWFoSvxjq5idnEke3wqmPFlbqbFgLudFFltGKDl@vger.kernel.org, AJvYcCUWs8QaEZkbP8dKXxMFNuPYwKvWyT1Efjjhwo8/lYmsxTMmfpt0Lp4rYOvt5aq8Iwj0/1rgbS7moL5m@vger.kernel.org, AJvYcCWB9FOphdui/sQLN1AosIJdhGf+3iSZUpVLyurJZdXOcH8nZ6glHOWdyJeuh6yxNDkpti0dhTL6jA1f4nY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx283mml4nQ/+A6EPeHHx53LClfwYr0zcgG/LtkfgsmXLU+g5tq
	a0bvHE1wXzR7mBdFAu+LL9qTkcWprA++GAUgQaspiR9SBETiFNbB
X-Gm-Gg: ASbGncsBT7l5RCPchKg9RqYHWH9V2IF9QlG1Bc+croQmWC6GuwRUqhvsFBBlIXGWREc
	e15XF9Rr9oGMf+zPkYAZ6V0MPfpIw770tb8nXgDBrQKyLRzPpQw3gTKkAY/SQkmeJ4w39RinyzZ
	Zjfj2Zmxm+x+srBUUxmCEI8yzFlxYt6EZg74+8gbzyKjVSIrAZPRTNiGMS78EHtYMorpVWcVJfu
	Q1yzjnOY0ETHQLHslTtEkwWFwiTF8y+l0tSyAVyAiBY4Q5/+WwN7b/9MzaeiRLFFThJv5RWebA9
	+muu8om0Vmam2wVjzoasm4xa4M0awlyiM1tW/qbRYkz3imT0yOsSv24Zuice40zEB+os36HzOI+
	XLBFV22dRNe+NQzAA2WEt10X+htw=
X-Google-Smtp-Source: AGHT+IE9IVJ/+Y7bFweK0mC5d/S8uiZG+i9UXMe+MVPRn+AtDvGGo7IX/Cuv92JdPjJjkOShumnaLg==
X-Received: by 2002:a05:6000:22c5:b0:3a0:b1de:1bc0 with SMTP id ffacd0b85a97d-3a1f6431082mr772656f8f.13.1746736582122;
        Thu, 08 May 2025 13:36:22 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5e1sm943801f8f.89.2025.05.08.13.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 13:36:21 -0700 (PDT)
Date: Thu, 8 May 2025 22:36:19 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 nvidia,tegra20-ictlr to DT schema
Message-ID: <vmnlnlmfytv6rl7xsujediawseodlc2eh4wy6so5grjhpupp5d@sks5jmzoxjiz>
References: <20250505144759.1291261-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d2ya6maaqycavkeu"
Content-Disposition: inline
In-Reply-To: <20250505144759.1291261-1-robh@kernel.org>


--d2ya6maaqycavkeu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 nvidia,tegra20-ictlr to DT schema
MIME-Version: 1.0

On Mon, May 05, 2025 at 09:47:58AM -0500, Rob Herring (Arm) wrote:
> Convert the NVIDIA Legacy interrupt controller binding to schema
> format. It's a straight-forward conversion of the typical interrupt
> controller.
>=20
> All the possible compatibles were not documented, so add the ones in
> use.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../nvidia,tegra20-ictlr.txt                  | 41 ----------
>  .../nvidia,tegra20-ictlr.yaml                 | 82 +++++++++++++++++++
>  2 files changed, 82 insertions(+), 41 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/nvidia,tegra20-ictlr.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/nvidia,tegra20-ictlr.yaml

Applied, thanks.

Thierry

--d2ya6maaqycavkeu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgdFcMACgkQ3SOs138+
s6H76A/+OK6/TMmuXvVhh6Ng0nGehpKKXevkK9pTTKBCwWtQ40u8h3PZnYiWYJ6+
7IAx2nfsuR2CsrSc6zMhZZAZLCKo0S2x6786mcKW5lFK0kJcvMvEk6PQ60wXSt9U
eDIbqvGjeu/fCwPVPQ1hzhl9UsRtGMkKLjZfdQV0jH3xhg7w/HmmsJ3WixoiU712
RV9nUuSfjnbQ8XLNuyB/SaaGajehJa+acRf+nzH35GsX7B3yPji1ZkH0ghAFJvM5
4I/ad08PN/m5I4tUA8YWBtX7x0uLTlUT9aKhH14pbkWb63fQayhM1CR3Jm68W2X1
4KJHk0bQXhnTNia/1U5HzQi9xwbQbN6G92sPadtbfToFcGvtmmmu3BgS1NMNh2pf
lPnXGcEyFwne9xC/TX/TxWQBGiMXvfA81Yry+kGfuFeRONZNzk9NeTW71whtiiP9
+Q2SQFx+m4to8eG76BaRlEfn6tBKJoKklbkrnNUKUfUZHyFSIbUAdOBbkSHc8Mtj
gNOCJ76d1IKyRyHo7G5YhSY4erRwqG+5v0Eyhih9cUuz4R/wlJ5/ffCnUgNHqDe3
6h5gkYixMOBHz7/oyHcFM0Ie3kmO1brIMYje5GvakAp/o76sdDAeQUhR+581wJzS
zIOTJpECm3T0+k0rxHo/HlqLnd5JpGy9n8g4yxId+Q83dyDh5TM=
=cZ7j
-----END PGP SIGNATURE-----

--d2ya6maaqycavkeu--
