Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE1725394C;
	Thu,  8 May 2025 09:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746695104; cv=none; b=Bye5VdoB67XeVZpYp6dfD0vmDkhDJeLaDgECt+Qb5WO0YMrM4dhFTrV9O2jS/qdP9U3UUc84kQvck4vXkYtMZorVy4wtNgU7kOHKyoMvP4QPToDXEivFI+hkqVLd4iv49ggNI9kdfwbzLgkfb8oIjf4wqgq1F+UVglfvHGi5EBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746695104; c=relaxed/simple;
	bh=rEPh7f+J10KPTUGLy/zWkhfF+tENEdRcngN5TQfTGHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qNUQ9fA++ZVXiptxeR4EB1p/jRycm9g+soUZH+gtPxra0v/Zd3rq+tf1CzkNfsUhzORuoWUuF893e9iTrclmur/I7PpKaHxttQbP2Tp1kyjSzL9ul/BK0LGDtOnhwdxpz/eevci6wqxkB9IWVvlFeoE8WmcpaH8qO/q4kh5Xzkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQC/B6rH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQC/B6rH"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso3738715e9.3;
        Thu, 08 May 2025 02:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746695100; x=1747299900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jMpmFs9yHrwvpCn9q4VKyxiOLgjk53pgVJePgrt1J7M=;
        b=NQC/B6rH5kTw9Rws4rlBEjqmo9mEEh+CeB5oAlzI5Koi/nxFQX36l1TXPIz5NVQXD4
         P7HFPxD5jlsS6MKlBLGHdZDdd6otk3Et60isNNmY3NO3E4nG0cej8ctlt+wB1dh4qdPQ
         t7zB/QlXUUMxjPzoDz1MvEIDYh0NPaqoH3vQcHOCSjV9YABOkuTgCt/0Sg0Re9TuGg59
         lSBThBUltDgMsHIQBRHzRPVC209OQUVhGawwhzPcXuoOpUUcP9fJtPm2yQNp9Oo6g9//
         N6Zx7pkKs+Ejtc69dxfzjqovFXvUzFFwSPGilAkU4JJK/TO7J8tE/pZPCrLgQvW7t1Zk
         YESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746695100; x=1747299900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMpmFs9yHrwvpCn9q4VKyxiOLgjk53pgVJePgrt1J7M=;
        b=e7tUYs5I5KbrYecoGT2hpciqgczydXcNbAX7P7fDaymLGM1w6NZkQRlB+1Dcos/NSW
         Vtom9nChE0XQR2ZQcWaGKE9Zha8/lotUucl6QJxuubZmr7cuObi+CcNkyjxauoHDcKAk
         5QO0B+YwI3K8AXdyL8K9iDVCu7N/BIp7+waB3KkbnJ0L9xDYg/SGUCn0jJEMAOutmfBH
         kL/8BoxHwUyUei9T94mL3qA2u3mKdpGrDTrZKXgb/B+g4Hli77jY6S1WR/DK1xyuGCtE
         nkdB4iXI8KqGfFfA5FxL5Lck79AiKLwqoIS3j0i1R8V2ZMul9KufBdVNnpj+Z6gO19jv
         2aLw==
X-Forwarded-Encrypted: i=1; AJvYcCUlBCFP6cf3kJ/chpkTJuUSnOm1Mo2evLEH/+OcH+3S/lXyEsPqwQIwrEZpn0bwLgcbWwMZhc3tfx9x@vger.kernel.org, AJvYcCVSGO78fPMeFR2PqnBSKPmZJS06glJSNGn6qDI7nogk+bSOXeeziEhVQAMHWYxA7i5YasRBfC0yGjp6M40=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI+9MLKnIS+v298aFruQ9N7CZdx3Waq3vhRZ+tPKPgZgKPBGGh
	yAUo320rZ/lPV+Zt+ycKOJVB8MXj9jO9poDhBLufnuQSxJx0kWGGo7bGEQ==
X-Gm-Gg: ASbGncsEgttInhSglwdcr8CetJaI4UCR4sUP5o3cUPHnqKeO1slu95RBeCxE/eL9HPT
	vFxNnzOb7wMSc0yczbxTvkMU0C9nkJc8AxI+4u3ox29g91dyAdMsrTxxrvQihGa0QuRugSRtZ/M
	6X60Vc1pNRmKXQtjPbPksfJlMRmABpgZVtj0MJMy5DAJ7K9w7/CmJMizmivGlfX+0LrJf0m6R04
	afLxQFWXb8TxFA4q4y2qVznaGLmcn88LEsuMsO7rzj/Wl/ITottIqhMGciwg1cxqCdObWU+IMhR
	sQvy06Rz5JQIOAT/2ZQIlpNF0HmuUmRbDNusgor26pojQHmumS/UvgOHfF7czqP7fhmfQxkfPE9
	Cu/g75SEhL+YP+H2WcND81Oa4Bng=
X-Google-Smtp-Source: AGHT+IE1u972oGQwOb9cGNOeMNv6MEsmM55l6qq0xnnj/vFXN8pi6pWawjcrWO3keTfAh1Rai4cqhw==
X-Received: by 2002:a05:600c:1d08:b0:43d:94:cfe6 with SMTP id 5b1f17b1804b1-441d44c7addmr64871425e9.16.1746695100108;
        Thu, 08 May 2025 02:05:00 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3809f2sm29850555e9.35.2025.05.08.02.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 02:04:57 -0700 (PDT)
Date: Thu, 8 May 2025 11:04:55 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/8] dt-bindings: Add Tegra264 clock and reset definitions
Message-ID: <hndrlfzdmbg7fq4g4w7rlftcgyb3p3yphmyf7cejgbnxfyj4am@7w6x4s5kxqat>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-5-thierry.reding@gmail.com>
 <1ec7ed24-a4fe-450b-8f99-34aae6ed2c4d@kernel.org>
 <3gpirue4rr5hpgynzzadzlr6i2fvdhaugcutyqyfoeix2zf3fu@xpbdadb5nynu>
 <b20ad0cf-f49b-4c78-ab67-adf3a4c55cf0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2clf4e2raimg3bgd"
Content-Disposition: inline
In-Reply-To: <b20ad0cf-f49b-4c78-ab67-adf3a4c55cf0@kernel.org>


--2clf4e2raimg3bgd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/8] dt-bindings: Add Tegra264 clock and reset definitions
MIME-Version: 1.0

On Thu, May 08, 2025 at 10:42:33AM +0200, Krzysztof Kozlowski wrote:
> On 08/05/2025 09:53, Thierry Reding wrote:
> > On Thu, May 08, 2025 at 09:40:02AM +0200, Krzysztof Kozlowski wrote:
> >> On 07/05/2025 16:37, Thierry Reding wrote:
> >>> @@ -0,0 +1,9 @@
> >>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >>> +/* Copyright (c) 2022-2023, NVIDIA CORPORATION. All rights reserved.=
 */
> >>> +
> >>> +#ifndef DT_BINDINGS_CLOCK_TEGRA264_CLOCK_H
> >>> +#define DT_BINDINGS_CLOCK_TEGRA264_CLOCK_H
> >>> +
> >>> +#define TEGRA264_CLK_CLK_S			2U
> >>
> >> Abstract IDs start from 0 or 1, not 2. Also drop "U".
> >=20
> > These are not abstract IDs, they are defined by the BPMP ABI. We cannot
> > change them, otherwise it'll completely break.
>=20
>=20
> You mean from the firmware? Sure. You have entire commit msg to explain
> all unusual things here...

It's not unusual, though. This has been the convention for a number of
years now. But yeah, I guess I can be verbose and repeat all of these
details for each new generation...

>=20
> >=20
> > For similar reasons I'd like to keep the "U". These definitions are for
> > the most part directly imported from the BPMP ABI headers, though we do
> > try to be selective about what we add, to avoid adding hundreds of new
> > lines in one go, and several safety-checking tools run on these headers
> > that happen to require the "U" suffix to make sure these have a defined
> > type.
> >=20
> >>> +
> >>> +#endif /* DT_BINDINGS_CLOCK_TEGRA264_CLOCK_H */
> >>> diff --git a/include/dt-bindings/reset/tegra264-reset.h b/include/dt-=
bindings/reset/tegra264-reset.h
> >>> new file mode 100644
> >>> index 000000000000..31d89dcf62fa
> >>> --- /dev/null
> >>> +++ b/include/dt-bindings/reset/tegra264-reset.h
> >>> @@ -0,0 +1,7 @@
> >>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >>> +/* Copyright (c) 2022-2023, NVIDIA CORPORATION. All rights reserved.=
 */
> >>> +
> >>> +#ifndef DT_BINDINGS_RESET_TEGRA264_RESET_H
> >>> +#define DT_BINDINGS_RESET_TEGRA264_RESET_H
> >>> +
> >> This is empty, drop.
> >=20
> > We have three people currently working on additional drivers for this
> > SoC and they all need to add to these two files. Adding the empty file
> > here makes it a bit easier to coordinate things, making the resulting
> > conflicts trivial to resolve.
>=20
>=20
> Bindings are supposed to be complete (see writing bindings doc), this
> means also bindings headers. If the constants come from firmware, they
> are defined so I really do not understands why they cannot be published n=
ow.
>=20
> Unless you mean that this is a new SoC and the firmware is not yet
> fixed/finished, but all this must be explained in the commit msg.

These are fully defined, but they are also close to 500 IDs, most of
which we won't be using for a long time, so it seems wasteful to dump
them all in here at once.

But I don't care all that much, if you want all of them, then that's
what you'll get.

Thierry

--2clf4e2raimg3bgd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgcc7cACgkQ3SOs138+
s6FPfBAAhnb2gwUU4ZHYaDFUBgtXwCwDkJEn7vQHfLLDJ66fQANgj1Yy92wlPEBT
NYSoLWi4GeH4qpNNxp5KF/0HWgK57yX7AATvTQEVCSydzdBLKFhhFpEbtA+WFyPo
4L9UH07KMxZIO3L9U62c85m1htDkCgySHO4nY6lxp+kalE82dFaJ02ckudrWH0R5
1dp+c+onM833RPE+Q83Rx8VQGd1pT8dR+AnK5/fPwUIeRiLVCvxOg7ql71/L+vQg
BCG21GaYvPRNce8Kt4DRyvpMS/aSimr7/AZX4MzaysF7sBdGYi1LzvJvvQ8mkLoS
iF3+d5ieP88G0IrFfnr688OZUgH87uOPuBvPUOjv3aPcHS0O0Eh3fs5d4RenGCOJ
3boezcTxYltqBx116nuGWuibmlZpuIqnp08kz5SdXyUkB5AqO8LLDfeidXxJorfA
iurYvaZbjvw/LNiv+JBK1QAJuXBTpwOYahU7ZtXWRF56Gk1V8tf9WoEI7Lxr90Ec
Q4vLQ10mqazLSZC5s2pwPdd/i/aEMG3j9GI9V3df3xWV47kMfEt25NaaaL+o1gvD
lHT3MVsnuyE/ALPcAqxKe/zyNHezQVK+l0wMaBYvjjPIWD4K+yf8Hf9reTx5UgPL
2W+MC8MfwC7NxllLWdvUVJlPCA5oKWslCmDqk+Pqg4lWlcUrg2w=
=I6j+
-----END PGP SIGNATURE-----

--2clf4e2raimg3bgd--
