Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1B83C942E
	for <linux-tegra@vger.kernel.org>; Fri, 22 May 2026 10:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444909; cv=none; b=WgOTnEgvXBNeRt6jOkFIelJaKVz/xVI2ZOW5th9WNhAOIWrF2znG+Hv1IdLePt02XXmHwh3y5HEGYLGyyjcagJy6u+c7uhYouJsXR+YEV67Rpv4B9SRyialjXCpo6ON/pL05Z3Af5uGmWXKw+FHinGZIodnzjAcmEmnB7ZWZTV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444909; c=relaxed/simple;
	bh=/yxmDFswOx0w9wiVEewfyX6IVYQi4wAMBnDeD1IdRwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRAoJMyLGiFAKpMPSPa777ouoFf9bd581VzdX2I/CQvZkAKivXgQgxi+ADm2kzlhJOQLfJZ0hTROSfGPqLaMRfRqXB96h/BbHcGQoi+yzbnjywmsJ2w0FFEPppsv8aJlRRVFERSgi/dCGRd8tLVYfRmpYgD1ivNvSgGChTiL940=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOSPfDl2; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOSPfDl2"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43fe62837baso4235141f8f.3
        for <linux-tegra@vger.kernel.org>; Fri, 22 May 2026 03:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779444906; x=1780049706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yOAQCrLo3DVebScmr4gEaN7TLeXl7WWHrX8xDm80OJE=;
        b=eOSPfDl21QMVMgB3UaEPPQB/KvE3OGDey6qmYlv3p6eS1qzgwUBzFgzV/5PIMNWKgi
         BYhYeQItrLRI+ebhcv19R8dibcZabnkYKr5xZ56cdlk4vVFf7ELAVMFyCyEspmrqh+tH
         FCL8VDMUTaBc36zHp8VlkrLy1EAd7i9eOrgxNpputPS5tdHlIc/xijIDv6058dEfvBLR
         cQic8ydSWOZD965k001W6QaRRvBm6ZaAmdwEoVVTU1zXYMdgkW3gTfCqjq0m+Of5C4CI
         VQAYL5Jw52ntBS/D8s1iVeTyaHnwLzGXa648C3nyp5Q7SoIIJequLecuPWCQh4RpWIpY
         psRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444906; x=1780049706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOAQCrLo3DVebScmr4gEaN7TLeXl7WWHrX8xDm80OJE=;
        b=MLPco0TVIN1dulcvOakRZQcFPy8ED5JrPv22cDEnfB08nJX4Wh0McybySS3bSzhUFC
         9V/I3vlyZsYRYUJtXhTH5UhNoqAl+d0jhFYYrAq0EljAmM5cRGPD6Yh1YFy2B4h9awl3
         diKvWEniE+ptWgDMDbUrfTraHSDF0I81DytA3qD23lRwPS+r9Zy3LirviTCjp6mv5Wd6
         bxhSbqnrjR+xWBMozHSTbRPgr1PWelXFj+MDQSB/c5MBfujlKKkXVj8wUI8m31w1lBar
         BNunBBxBdhtimfThqlIgcjVsT8z48UAQVDP7fmbPmIwY0Kgs18eq9VUjhQIqlQzbQGST
         W60Q==
X-Forwarded-Encrypted: i=1; AFNElJ9mO3JWwPKI/WSz4IC6HImwzR5l2vHQ3YQEEF7bgQXE1O2L9Ul8O093WDrokE52HxP6IVH/I1McCV4jEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YznljquVCgFWmUwb1VXX/GQjJQnuOboLqR/k88ms3+CUHRBi9ye
	LwepBr0GfTEO4/THukQWIexZ6KV+I+1nxxV1ckKaKuPHlahCV9hZ4gCi
X-Gm-Gg: Acq92OGrk5+wSo6FRlflR9X7mxQaxE/n29K40xA5JvUenF/HXpt96tq49iDqR3wIIG6
	RzJy/uN5TuU7NaAWTvC5oi2MW2nWQax+gyhKEtrk9r7p5Rpw41SPIoRy1LhWICnenHJnZ/QUfik
	Sj7ZCPBO+0twvcc9oWaEboebTKORX8txaKh7I1iiBhCC4jGns+9zn6b3qmj1rgCEEqCKebfq5qK
	ytZd8AT2Ft4Zkj4gmhFTepOQFN+CHIbgUhXYVJxiFlIX97iOVeb8t1ct/0wQP9CtCK2Jy/HHffF
	g95KA7kMMinLarm+F4v7hLm9OS0u0/25z9KHrVxPu/6fYnQQ0w8wN7CJXxgGWVi9WoxTgrUNOyN
	Pda6YTBBO5N016IuON+rdXn0YQB+FAyqJc2Oxc26DQ7ugO3ZmJeZ1pQ262b9/r6nrjrgoK4uaLP
	kWHjbDxx5ZPjnE1oMlBK/vPhNm4zkbLA7/pfmkh3Qe0PLqJCEZaybwqrSd8gi0kv1qTKOgl9G+q
	tvwrto7njDDJA==
X-Received: by 2002:a05:600c:4510:b0:48f:e230:72fc with SMTP id 5b1f17b1804b1-490428ee268mr34911935e9.33.1779444905920;
        Fri, 22 May 2026 03:15:05 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904561f2dfsm29695065e9.12.2026.05.22.03.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:15:02 -0700 (PDT)
Date: Fri, 22 May 2026 12:15:00 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v6 05/10] dmaengine: tegra: Use struct for register
 offsets
Message-ID: <ahAsEhzuLFyhhOBT@orome>
References: <20260331102303.33181-1-akhilrajeev@nvidia.com>
 <20260331102303.33181-6-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="imzmnmclq2alqm7o"
Content-Disposition: inline
In-Reply-To: <20260331102303.33181-6-akhilrajeev@nvidia.com>


--imzmnmclq2alqm7o
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v6 05/10] dmaengine: tegra: Use struct for register
 offsets
MIME-Version: 1.0

On Tue, Mar 31, 2026 at 03:52:58PM +0530, Akhil R wrote:
[...]
> diff --git a/drivers/dma/tegra186-gpc-dma.c b/drivers/dma/tegra186-gpc-dma.c
[...]
> @@ -181,18 +149,24 @@ struct tegra_dma_chip_data {
>  	unsigned int nr_channels;
>  	unsigned int channel_reg_size;
>  	unsigned int max_dma_count;
> +	const struct tegra_dma_channel_regs *channel_regs;

Odd. I would've thought you'd have to predeclare the structure, but if
this builds fine, I suppose it's okay this way, too:

Acked-by: Thierry Reding <treding@nvidia.com>

--imzmnmclq2alqm7o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoQLKQACgkQ3SOs138+
s6Fm9A//TpPiDRyGRX5S+DREIyuLzv0q+Fts53fWV69V2cKAdllYUgvBAaGN6kiu
0x7UYLj+83kly4h8EYq3tFWWbk9CZneS/6dURNSzUlSzo5Cdl/zzXfeXeJriWTHP
mgdbVh3oFdl/l0ITQPFG/dvFoEB30eST3qWCPImXLl3upt2IuHYoGPUuwlZSwOWs
TIKRQp84R096p6Y/axdNeevLjJ3x24AF6OvcdF/Bp0hUhHdBVUN29vQ3BwUVOIeO
RYeT0uF8Ns3TpiQSZbvKROOZZRoJYm4jiEu0dLUPxr7TBOtzNxZrmRYcKFc+uPvq
/gqfMZ6jQM72h0yLBw5SEU09XHh1uTzkbnemIjA8VHYaIBofhSFPxysZDdMNY1nf
YyaMBPtDX+cj7wEjcFAp8r+7X9vYd+eojs5a2j1j6hj2ZGncDVj6ES6p9NoNUKIe
YGBTKKM1J1CDtUa5Ty1IMcpaMjV/o3Xe89mmNAJ85w0S+ga0c5lP0DDR418jRIpP
lJOsuBG1ulxLVB74o6UX3HAKPblhpe9lawyH/Wx9UvwIYvtyH/CmTx05VgJeA/p8
wgVchLEGPT222TJmmH3SAWRswoVc72wxxoAzn4URbRTXATh7lO9yEpKSG7TefOhV
iroH1+Ob5vi8gkoLBKz5uyA4UCCpGxVi2um4oBXXf5nennrswY8=
=Kkfg
-----END PGP SIGNATURE-----

--imzmnmclq2alqm7o--
