Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA478255252;
	Thu,  6 Mar 2025 17:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741282942; cv=none; b=nZlWvr91/vsRTS46YGi2WvICLdrdleGmHcbOwNxvloBSl2cp1gFpcdHxllFdxTlVUckVnOikIWy//FKTHQ2xndHWmlZrXVSiL+KFvSqzO8Fw5ZI1TTVPImsbKOpA0njuEMm8qWZp6X1Qp6ZMYQm3Mo2hZu3j51zn3PcJvciERns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741282942; c=relaxed/simple;
	bh=k1OgkCcDsuByotWq07bIg4/JmZsVzSTkjjcqSsU5G7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=icOHuDuz2BiLz01IuMIcWceYg02P6Gxw4UxwgA3jNrDOV0+NPJN2D52eqIW4g2pbcVyN/LnESUwxeYqNah6HN2i5oIYkayWJQ2NXvA4rW3WNj6FJidIgTV+gNXzomjOyajqhhzaEIsturwap6Xd5hYRqYdsY57NfMgCkr+vjFII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QG9VPMFX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QG9VPMFX"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43bcbdf79cdso6379085e9.2;
        Thu, 06 Mar 2025 09:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741282939; x=1741887739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qj3LP5I42wpMQSJreNV9f6vwP9ghR9d3P0kbo/GRktc=;
        b=QG9VPMFXoRtuYHrvsRXBKR0T4u5O1+x9qWQefm8aNwVT5mhynzrUU72IiLFFEGJIyk
         gTJmrOag+OvH5K1xwXE8Ega65qKL6+Tf0BFs443p+qghLaTVOJKnymgvQslUzCoa57xC
         tzhWrEhvh7oK8k2qA9WSQZ7qrTwuUc+dhM/v0PEvQMg9VOsV29EGNO2UoyHbnQoxtwFT
         KPObmr6GM+cvruGCSql5jmSW+1W0IictgB3XH2w2JvQy8uMav0/GE91PEtXIHV0XkEUE
         oL3VdXl4yRjAFzlxiw9RB7GAPirjvNnPINK1nsnqOcDruZgEhUp/9fQ63h+zCTnyI3jX
         Xebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741282939; x=1741887739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qj3LP5I42wpMQSJreNV9f6vwP9ghR9d3P0kbo/GRktc=;
        b=PGZS4iXwkwBOdUkmSqV1Cny9x0THj4eRm7aFqqOH561ysnjuI/06ie1WnGw1DX3Qzn
         2j/rKgJCXocHf2BKpoliuTHbKPHtEiQSDlluv/Q4cZwvt2toVGqlwUQKdH5mPQ0mWQN+
         mPOE59IEaZeYW+DHLUG/xOzaGoECaUIWL9QAGcAsc4XTMKYiyidineaSRJcepQ9E4RA4
         yjb57m8K0Hj4dTOpZ4ndzs3b2VXyNOMOuFQjKI5FhZUgIuXTzNiA4kW4f2KxBcEBK/rE
         8t6ECZrw/Rg5WCZyBPtcmw3CNpBVjA+83b1QchjLiv80sRvUObklU6xq1BnpDgU8TEQ3
         GTcw==
X-Forwarded-Encrypted: i=1; AJvYcCU1TNO2jB9oR+5ssyvsGN664DUwPWq32nbbjD0n8OLyx/JZb2tRQl1OQ8Pnj16GwmxO9dIj6yKnjuh4@vger.kernel.org, AJvYcCVkVTij2nU+8VD3HGIbC+SQIrbk63n3i9s5UUFDyOcpX5uIy5F7St+ERTWoc1/ALJpl9buswx7aA+SoU1Vz@vger.kernel.org, AJvYcCWKtY+exvTuuheivqASKha8Y9WfgZMDTeGL77k/dzDAqS7UZpvz+qwvw5ULzGfyq+hCY5N22rVGkimuScs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4JjQaWMAG7zrqjo931C3H5Y2cfXSGlzZ6xdthPTslwcR0YNJl
	E5joiPq8hr0+EN0iEjlY763oZ3/Se77w4bknIxdpYCMM2VHmQwfD
X-Gm-Gg: ASbGncumhKFC2cO0++9CiVeL30ZZEzSBHI4ubtCos9zoHkcD1MWfK4nR/BzvN0T9EAC
	UYS4hvQ1x4s1Suvhc0PeQn8G8gACTtpWMHkGN5Ws65Xqveci6FoAuxZJ5lrgTi87eutmRbK8NmV
	NGXioXt2BYR5AzTxVAjZbiAHrIU4/0nWvVPViaT53OUkwgzuyp1TmvMH2YXpxVnOknEMVycit6h
	8Tntf1spowkFSvBn6iU6pOf/g3eK75whcPzV+ASeAcHtZEDW6jf8cYzBcm1axQqKeW/z9/66jln
	vUc8/jPCWqve1SKCXfETXj6rzw6qUWUcOzy5RPRIOW0U31WANh6481ClYrxnWtlT+7tvcOywLDO
	Iq1whAxAov51W1p6yLWfTbVQKMnmmriA=
X-Google-Smtp-Source: AGHT+IGf5AVYXcgkFwUcbb0pBR+vGf+iMNhe8uR43b7pSWm9ZflRaD1pwe1OkBsFCnN2+6iqVIcxqA==
X-Received: by 2002:a5d:6483:0:b0:391:2a9f:2fcb with SMTP id ffacd0b85a97d-39132dd6c47mr5472f8f.36.1741282938871;
        Thu, 06 Mar 2025 09:42:18 -0800 (PST)
Received: from orome (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0e2f39sm2649083f8f.80.2025.03.06.09.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:42:17 -0800 (PST)
Date: Thu, 6 Mar 2025 18:42:15 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/6] ARM: tegra114: complete HOST1X devices binding
Message-ID: <hs62xcv5t6dupjelauzhytvjyosyjy2pmpk2cf53dmastma7d4@clug3pqdi734>
References: <20250226105615.61087-1-clamor95@gmail.com>
 <20250226105615.61087-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="snxyk2kcj2hxvwcy"
Content-Disposition: inline
In-Reply-To: <20250226105615.61087-2-clamor95@gmail.com>


--snxyk2kcj2hxvwcy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/6] ARM: tegra114: complete HOST1X devices binding
MIME-Version: 1.0

On Wed, Feb 26, 2025 at 12:56:10PM +0200, Svyatoslav Ryhel wrote:
> Add nodes for devices on the HOST1X bus: VI, EPP, ISP, MSENC and TSEC.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  arch/arm/boot/dts/nvidia/tegra114.dtsi | 65 ++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)

It looks like we're missing device tree bindings for ISP, MSENC and
TSEC. I didn't see those posted anywhere. Can you add them?

Thanks,
Thierry

--snxyk2kcj2hxvwcy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfJ3ncACgkQ3SOs138+
s6FrkQ/+NhQD+ofCH6nOOzZBZWhuJgnTlY2EaiBLPwZsnBZRewhgr3EGaUob1TsY
Dcftc0tC2bI6qRTdkMb69v+jtAFVmDVmskJE1m89t8oGHMxJJqsAI/ZZR+SgdoPQ
+dx3np3Qak68lIlfFGr6o7bsIY72RT8fwLLNLt44lQsmq5QKdyYyaIxIb20zU05O
8OZBR1H01Fha32EhI+H43zmhMNUsinkUTv9Q7oOKXN6AVcMlpKvYvzPCQaflC05X
cxaGuPRRCljcWjpyBeAYb7f5Gwloq12Fh+wT3RogWD3WZGxVHfTBkVLxqvSjMHrf
KctI/A51n79a02NQ36E2QJQVcXnkXqbNrcuaIHwzgkIH2ecpcBk7YBnLAeAt0nkh
uxCZGCkJIPSsQB85A9OMSi4uq0dI21OWQOYL5iqqLYIUMAawVNSLj903GAcHJnJw
TH9T+XCB+4aLrdQULs6TGo/Jrw9dWoPLQxKvdT4d1qrvvbqyC1h95/YnRpUi00l8
ueGQrVa8V9zrBdlFvyLs4iRW0ZyOOvX+L2+Z33bN82BqTR15xqbvTi0MBeVM3Sdh
kyNV4qssV0axcY32EjiiCLy55N4IB+J2mMQ3xtcqU1jD1188srkd8B4iDI17V2h6
Cmd4Z51nKpdRexInUYQ99o3Ao8kJjT58zUoRpmX1zlj6IC/R1ss=
=Zby1
-----END PGP SIGNATURE-----

--snxyk2kcj2hxvwcy--
