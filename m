Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB96A3C661A
	for <linux-tegra@vger.kernel.org>; Wed, 20 May 2026 11:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779277569; cv=none; b=VXjQs2/heIftXz5QHI/l+GDmTWvryHPMr4PPkYM7vsajOOaBfSc3yCComH5UeWdoK12ciY4vrfAAKBy1M1nMBbQ8AjcZbVcMsApZ3f9FaDcQPJxlVwqYOOBWUdvhHYcYRrb1qpBVfRXUxLH92pUVwiBxnIL0uT+oBYqMGziEjj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779277569; c=relaxed/simple;
	bh=HAE4AMZu+Ss4rgWHRp2AaAfs0faAFaKNXX1OR54SzC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+8FPwYl8EoaxtFrTcfNXquKtF+SYepcnemP3Kk9urWPe6yGleyjtDKJf+bCFcIk6dRNrtos1pChviR7Vl2kf3A7pkplXkDUY8fDdJiK8uzAPxxRW2TSGwgYfokWOQ8/lwnQg1TVL+Z5OFdVPgGucdkWVwhcnKzOv7UY4EKbL3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=POb+qDAC; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="POb+qDAC"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so1750768f8f.2
        for <linux-tegra@vger.kernel.org>; Wed, 20 May 2026 04:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779277565; x=1779882365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z07VRMZi5fEjKXUJL6C9y8TRN1VH0M6Hd6W0kvKYQD8=;
        b=POb+qDACyQt5rJMZKtfxxxaof1honWrvTPwmHxt7Fw26D1ooC6JhyrEeJajCRaXMd6
         hcImVuCSq3krs4jroQHrOxQO0NfnKmhnOdeL7N+IF2vww0XoGhW8VvZ661lsEmNvqJkD
         VsYyWXF8T9kEo4SAVrj+DDqR3Qk5vZCyaCLXV54Ozh3hDGZkENYg8n74yqIKo9ZqwIB4
         ElEExP1ZoqF+EYmHodP1pMzEobFM783VAHHTYJJNVqBCrGhKMi+oDjQTiQ192PAvZx9f
         +5jXMPf2nKf9vcFQCvLNEbXKjdFeLVELv4RQr/y+xzOM0ETKnjZh7N1MKakfQg9mXl+b
         zQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779277565; x=1779882365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z07VRMZi5fEjKXUJL6C9y8TRN1VH0M6Hd6W0kvKYQD8=;
        b=EothKjJvqeCa7cNu7FoizzEELeoErvmsJRydePhVSH/9gbLOB7et25OUoj3kCH5jCg
         MEp5iiZ7W5gpN9NLb5UJG6aI+NXEz42slPlBJcvwxrdBCHFxGZtJXE+1/e7TbM5pKcXX
         d3ufRSh6S6vgbnzxUPr4+b9z1nq8wLBWfSEdVtmAVJ1Oe22jvTObzWnopFbTdMer2OS1
         5pIl0TWmGKVC7bcFSiN38KDCkfo0OMipTm3enHEiCVQAlAtZkuucYYNeGNXarG0zVJNm
         PJHEzjYwSx6QWnPo/o1zoFVcfEJEO/GuJAFwn5XcjgwZXLKCx4r6LqBr1j7ktcjoBwBt
         pqVg==
X-Forwarded-Encrypted: i=1; AFNElJ/iQH9VSa5/72/V7XMGiOF4mCP/rcNkz0d7thOBAenS5iKHvpMw8a0eDr87DLxLZBDy5vVZiXIemaIHCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxU/OsyBGRykcGzQlVUjC6U+0LNtPDBjIwwXVoJ12hJdi+jkpdY
	gbocV+QFaZPk5R9gGUBEvsIo8kZjGSu6tlK7dxr8gUDI+wB4RNeoAEfF
X-Gm-Gg: Acq92OHohxZhyZGN3BbVQAE1ELNN4NhzcfOeuHkBDlhlwB8Kiyx++JFXYR16GNz/+y2
	V/hX7Hkk2UpSEwfvYfxET8DKkItlTpVMRAEsI5OPe3EX2IYMQFC7zj+XdQbQNJ8lapbmaw+8jgE
	jPYmnYcQCbJ228CBjjuNJn1EB+2IVUwoIq2X9zV1G8TYY6EmKHGmvbWm0Lc03rH6toQNJJKCJbI
	CvHcAzST35SBt1DfBAeT9D1FgvznndUzG4t5B2xnoEOIs+BzdoW/TKywKmEiDDIvrgDqgscujKT
	uUdWcsAIVpSx9AL3BwgAbua11fK0D7Je9V1YQXCxKLBlgY+q/nwwvpEInvwIUxqhaSgT9zZdiDN
	gMfDq6/37ntBpgym+ZjiKItunfMWMHXzONFlCG9xzkP76NAkntoqJgf+YTW32ujdEHvKJcfhaqe
	FjccauN7LRRT+lnkjQytr37x03SEpFVhHUOzdn6qfBijpMTXHDL05993gAcj5c6zal21kIhjUY4
	htplou2tZ4F5Q==
X-Received: by 2002:a05:6000:22c1:b0:44f:f2d5:a401 with SMTP id ffacd0b85a97d-45e5c5a37e8mr39518728f8f.37.1779277565276;
        Wed, 20 May 2026 04:46:05 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767cb9sm51264332f8f.2.2026.05.20.04.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:46:03 -0700 (PDT)
Date: Wed, 20 May 2026 13:46:01 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: webgeek1234@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] spi: dt-bindings: tegra: Support dma-coherent
 property for QSPI
Message-ID: <ag2cgvlmEoTZSh0a@orome>
References: <20260515-tegra194-qspi-iommu-v1-0-57dfb63cd3d6@gmail.com>
 <20260515-tegra194-qspi-iommu-v1-2-57dfb63cd3d6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="keamvcfaghevywl2"
Content-Disposition: inline
In-Reply-To: <20260515-tegra194-qspi-iommu-v1-2-57dfb63cd3d6@gmail.com>


--keamvcfaghevywl2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] spi: dt-bindings: tegra: Support dma-coherent
 property for QSPI
MIME-Version: 1.0

On Fri, May 15, 2026 at 03:35:28PM -0500, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> DMA coherency is supported by at least the Tegra194 and Tegra234
> controllers.
>=20
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Similarly, DMA coherency does not apply on Tegra194 because the device
itself does not perform DMA. dma-coherent should go on the DMA
controller's DT node, which it already is.

Thierry

--keamvcfaghevywl2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoNnvYACgkQ3SOs138+
s6HkCQ//ZU4Novi/hVsF+UKJmabbv0LZlIUubNucwSd8K163a7ws6/dgNsvwKFYs
QkyCDwSuuqR6LLbIgQ+Qct1E6QQgjkVBOzt2mr+A3aijw4fKcLbRn+Az5Xo2SG1r
95J9N0e6BLguhFQCfwLnzXjLeq0DMk4V05oNAYukH+fqb/kHwwKUNJzoITV6uxIs
Evwzg/VLTyY5IdooYA/Ww/3ElzLMX5il4dFG0tsO/YpZi+d3/zxdis7meN+kMjwT
/LItAGXFGZAMScSripoV82leJnnxj/CUGxrsgYAsIbg3MKWDJAOoHIe6qDjKfgpg
rjtZz6C0DHVVB8R2Lzx/H29utqrkija0lOwfRLrxOwOKKdd0fmVYIb2igcW5IrgB
xTujgZcib/aJiL0Dp22upcNuM3EyFnufj+dQq5GHij++R9DUoosvyXKUbCoMKVs+
I+P/w76cFCY/SukEupqIewppDJAx8UMDugpxrUCR1xNjpq3Jl2yHMDZ3KB5Ws/kH
Jtij6UyVfxuB8L44/Qy+fVUEI7sWbdJizPZ4gsCB+KGlMYPDSaQvMcUJg6RajWEz
5RwCRTXo2ziLcuacISKyt+pLeNyn4nA4e+3KTsjHMTUHs9gGpeQPjFRVbfaAmnAd
Mxay1o8uSrHerhdMnklCTYe9ZfZIG6pvLk7at2MjL4r64MtRS3o=
=BP4N
-----END PGP SIGNATURE-----

--keamvcfaghevywl2--
