Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE1A356A0D
	for <linux-tegra@vger.kernel.org>; Mon, 12 Jan 2026 13:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768224576; cv=none; b=vEGJJJFu5SkEYKR5s8kl+zWPvDy1mY31yjjss2wDMmmHRFO5uOG1SoHJ2QK9qqi1tQbTa0POo9MDrTeeuNa1bXJNABnRSPUJ9+W/Mgeoy+IFYE02qGMx5g8fkV60XNYywUjrHmgoNJXNusU5CtCoD351A7jsUK0/RxGX72EXO4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768224576; c=relaxed/simple;
	bh=UnoHFAAsyxcZK76/Pz8YXPQLsYp/3SiIe52PxWwTinw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6OC0W3+1jSVZqVgJpMhMcS6Zc2MH/cj4anXWPDpMWxu3rUsoNB53Cp2IXsYsyp1bvGETH9rjdYM8SADrp+yejKSGxVmCKTqVb8SYXKL2AD/Jm9kCBuw8/OGYvQ2SBoRpsm28efZ0h/nAN4MxW9QM2zTxlvkNDjhkmcjFWDvojA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N21M00Bc; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N21M00Bc"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so23653395e9.0
        for <linux-tegra@vger.kernel.org>; Mon, 12 Jan 2026 05:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768224574; x=1768829374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=11tnW2Tu+5Vy0qaV9drAREGNbIkjGiX7+rFQEfAeWHI=;
        b=N21M00BcR6ypsraJkOAmaGrgXk+PT2Iq8LE32zACuF7yQ9hgJOXzALCDuEt+mH5/h4
         /X1VD5OyAeiCfpfchJyp5j+nEuNR7/SutBE8m27wgIlDAfDF1mIEgtFqd8YLVvsl2peO
         zkhXThR3KsjOyHNzEKuWdwS33f+lZgafp+CtUiujJMhBVLAtVp+fTtTfoZR3JX8zoB4N
         NSbhlWZ9lgyBjp9xGo56pxlRSRtfl/zRaI5vMVrEZjAEVr8/lslBVeyZ33obMm4chDQP
         wvUGawyaw7l+bbVOYYZpPEZWbEHAC444M2KqOd1lKD3E/Rtd16sm7c2LCj64y2pjEV04
         KXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768224574; x=1768829374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11tnW2Tu+5Vy0qaV9drAREGNbIkjGiX7+rFQEfAeWHI=;
        b=BMgvJk1Y3JLFLCwUkywgLwpg+U0794qxnq5UHVEXNyZVm6ThQiN1Yq/gPYLSqokB0/
         6IF6aYuTgNLUFkA2Y/VbHJtpEKMmydCrLZwN45ZBoYq1Ciej6e9gf0dIWJyRDb5pNXkn
         0KsHNN6fNR1HhNYKuEl0EkVFz7R/zyaP3DtAqwSy6V7FP1bq3m+R/t935a4Pbgb7Y+Zu
         O/KyjDiZUiK8Y6+bhsTYsd4odRx1vCvKEb9B3ZyVIeCOLEL8QDAArrKHiLBBg3Lan3Oo
         wHxQPNOIqBD7mg03Go39isBOapRSDP/zLrDAQTsaDTvUx+GQkhrMEJWSUkikbcAZx7dL
         gJ6g==
X-Forwarded-Encrypted: i=1; AJvYcCW7Bc0BEcsrOIBCA48BqJuHXQp0TvK//FoSPQ+wyT0AxH3l2ewEGuhLgvLjowxU79hq5bvTCVWEjvA5gg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz0HYAnCd+kQq+Gh/319z2nG96Cy8qyvL+vpM5OQyuE2E1kPMf
	4F/w/u1NsrNL4fPj9wIh1LNVBZffUj59p3slXrgfCbe/7Hk7hTbACAxQ
X-Gm-Gg: AY/fxX7/g3Ocls0lHWaJMvk51jqdZbGtzA0ljmGN3iYWzBa6D9QrIKzAfqqGRSPZkCl
	20d6g0/PZPSJilXzxReIcnbHjL1iGD8zO4XwNwDgVADMbADWNX3A3Q5h2z5NBTNaQRPg8yOV2ri
	nuk4augCiPxeVyKX73wKHSqueSKhuSFi7Aj8f5JGm/3KD2YAYm7S6j83T860UeXSGeu+D/Xnf5r
	MxDfBGyBbj/mUwRpXHXtF3tt/dBxdc2PJRrdFFU7gZzH1OCrQI195U5VO4PqvJqA4DbR89f65ut
	4jbXqCxVJJ95PlmHEbZ7TUepmTDvY81e60SuQrVUBmgCw5XKqsjOzIyvBoSoZ0wFRjAwXuEQceX
	4N//+4wW66Ow6A33j5CRlBvftMJolJTddJSZXnRPgjLpGaR5es5Xgk7EiBD2CDflys3YoZv2Cl2
	PhhoHB8ypvp2gtgrBZQ2ZTj6cIvYLK/rt3HUUvgC5kI8MS7q+Q4YvqDCOFfm6DW3dgXG1v5JlBB
	rb7jYkWhCbG
X-Google-Smtp-Source: AGHT+IEz/wJEnu09A7NgVlTwkM0u3fayFM3dxi5OHXhkN24ctV9AENFpJBzOlKoI+IE+j9goQpNqwg==
X-Received: by 2002:a05:600c:3b05:b0:475:ddad:c3a9 with SMTP id 5b1f17b1804b1-47d84877e51mr219593065e9.13.1768224573780;
        Mon, 12 Jan 2026 05:29:33 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8636cb0dsm148209745e9.0.2026.01.12.05.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 05:29:32 -0800 (PST)
Date: Mon, 12 Jan 2026 14:29:30 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Ketan Patil <ketanp@nvidia.com>
Cc: krzk@kernel.org, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v5 1/4] memory: tegra: Group mc-err related registers
Message-ID: <aWTuW1ffEWFz5ChH@orome>
References: <20251219114354.2727906-1-ketanp@nvidia.com>
 <20251219114354.2727906-2-ketanp@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3v25t5ckiu6x4ero"
Content-Disposition: inline
In-Reply-To: <20251219114354.2727906-2-ketanp@nvidia.com>


--3v25t5ckiu6x4ero
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 1/4] memory: tegra: Group mc-err related registers
MIME-Version: 1.0

On Fri, Dec 19, 2025 at 11:43:51AM +0000, Ketan Patil wrote:
[...]
> diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
[...]
> @@ -168,6 +168,23 @@ struct tegra_mc_ops {
>  	int (*probe_device)(struct tegra_mc *mc, struct device *dev);
>  };
> =20
> +struct tegra_mc_regs {
> +	unsigned int mc_cfg_channel_enable;
> +	unsigned int mc_err_status;
> +	unsigned int mc_err_add;
> +	unsigned int mc_err_add_hi;
> +	unsigned int mc_err_vpr_status;
> +	unsigned int mc_err_vpr_add;
> +	unsigned int mc_err_sec_status;
> +	unsigned int mc_err_sec_add;
> +	unsigned int mc_err_mts_status;
> +	unsigned int mc_err_mts_add;
> +	unsigned int mc_err_gen_co_status;
> +	unsigned int mc_err_gen_co_add;
> +	unsigned int mc_err_route_status;
> +	unsigned int mc_err_route_add;

There's really no need for the mc_ prefix here since the structure is
already called tegra_mc_regs.

> +};
> +
>  struct tegra_mc_soc {
>  	const struct tegra_mc_client *clients;
>  	unsigned int num_clients;
> @@ -196,6 +213,7 @@ struct tegra_mc_soc {
> =20
>  	const struct tegra_mc_icc_ops *icc_ops;
>  	const struct tegra_mc_ops *ops;
> +	const struct tegra_mc_regs *mc_regs;
>  };

Similarly, there's only one "regs" structure, and it's embedded inside a
structure that is all about the MC, so the mc_ prefix can be omitted.

Thierry

--3v25t5ckiu6x4ero
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlk9zcACgkQ3SOs138+
s6GUUxAAvVJuzjvIPdUVv+yCKFzy9nxVZAIq9zSa/cqMuM2OtIlTYPUaQRfj5Yyw
GTjJ7Wz50tEjRVyIYWbHmm26Ziy/pEJCk9oFdpR/l43NsZ1PX2mKMyPPUYh/tW1n
pTl8HQezx981RFf+hoShAe/X3Z0oC3mAe681a4n0sHa/hZmuXWYy08ntmlALT3GY
opc+S3uZrsXxh+TKKOhL/RQxE9CSEYKxa8a1Q3y4lHVxwhhMq194JsYul+WkJXUI
rcowFS0ggCZM8wfA0NAwOXuHehIlHEB/HsnHhCY98HgBv41xuy3M+R0Z34JwBAxH
dYcYhlaql1EV8zWiRJJPvH+cuG1qMWoDg/x2xKmXpb+JL2mweTTb8lAwpVLKVrVn
UgF8D5bG2sBKCbUAEAMGLk5ylgDL33Wc65XNYfV2ux0RiK9sTdB7qFOQNNDvQlMz
uiqDyoi9iRLa3ZwZP86/ewc/odzX3PDtFrUNNdrEQKF4TPZCQa5KE3wj5/rW6mhQ
2MYa7gh2FIMmxNBZ+R1rNa6c/iNcDperzNg8gJza1mOh4CPW8/XYKpKfssgtAMEu
945YdRjEGG7oS1JsJ4BhDn4GQiJqS1mPH1hCFSCiTXmTFMXmDZrdCTqnxXJxbPhr
LMU5jUrncikOuKgVySFR4DNV1Of81m3QDZqDBz5iIN1HDpJ2+Dg=
=/X5x
-----END PGP SIGNATURE-----

--3v25t5ckiu6x4ero--
