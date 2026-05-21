Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2EB396D09
	for <linux-tegra@vger.kernel.org>; Thu, 21 May 2026 07:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350356; cv=none; b=B35BDYws4j0gm//W//BsQ8vR6JDZT2C/rAWGMcm8jlySbLT4g+BhL9XMw4mqwoLUqeg29CevJgGqAEcmHE33y00ozc7iubOCYGavYY9WwNhwl59FeIorvtAocXqo022h1oc8Az5nMm0jlV5jGGDudnAZoqGvkkVDBLW6RtjuuJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350356; c=relaxed/simple;
	bh=/1x4coy+EhRxr4G74Byh3jOJGsE6QncBFV+p/Hi25m4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXIXQA3/ZP9cA/oQAYe5gH129q0rw876uudJNrBwB0z5KqCPI3ayaaaP/yJvMTg97+0F3dKFDlMPFcqKnuTa0OwMjOnnwJxgduY3rRa92N+xlw9uObsggUfHBN0sb1nMHmkbs2nDgpGtWRr4BRD30+MyU2d56DeDM1xPvk3TnPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tCpNOv5A; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCpNOv5A"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso60496975e9.3
        for <linux-tegra@vger.kernel.org>; Thu, 21 May 2026 00:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779350352; x=1779955152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RfHyghQkuGkWqA8eUzVzPKJ2kyI5blFU5Z3V4gExrrw=;
        b=tCpNOv5A8HdCnQTC2YO6ZmPUIap2OWuVg6KtEdVlpXcpKiO/YpeIEsNE09QOC0vPcp
         mbkj5o0ucQMdZBIgSSBrhyC/5QY7B47hG7LDVU9TFDXSzpHKknB4pvMZaTz13AtS7g8D
         BDej5suWOmQEY1V2jTm/nLuzsxDmemRcGY3F3BsoCEQm3TZqKL7//xBS/cYch4hNkR+L
         s3pr2Vw+4nE0uzPECzfz3ZBPiU7WNMyEj6Xu711+lGijH909MMqqhvwK7DJhjsS/BZfo
         9CNxpVPVl792FLvzHh6sTfal8LBre/LuucO8+uBxwPHGogDvoGMGQWWey9guSQZqvaI8
         OArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350352; x=1779955152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfHyghQkuGkWqA8eUzVzPKJ2kyI5blFU5Z3V4gExrrw=;
        b=cxqWUGpmdi7Of+wWIxBcd6fzw2B5YMTc0VMBgCjlpLhyB+ILoXP8x3AnI4VtQyL5gE
         Tr7xrte4jUpJE/hHwaix6JG4ycDcJMgCK2QiK7Cmsqh6AQX5w9icmGpsngjVH5/A0p3H
         wPIJTDPblOJqOoGmO1oLKtvNSkX4q3I8RjAeW5EnkTcDY9Gv/W+ljakFATS0MS3ptbTN
         U7AUr21SqACWKIv+ZlEwjDActZwbFxMS7DLVC6rdnTH8O/hZuSjJ9yp/VZieSWzcLiAv
         Q6upnxO0+WMI+gldwqY+dnrL32kQiYKKX3siE5gn3/HFD/JnhUIboZ3rTDXqvF6VAEQE
         FC+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9js0Hkj/2E8B4xdwEapF6Pw15hq1YEvNrfvsPGUZ7js5iW9f+gYBm9kMioumPUh1RNHgtDUuq0ZZqhrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbSTIsSB1X3ozoC1RREER2E0U1VMjsGM9MDztac6DTN3q5tMhz
	tnfwqg/CGLmWkyLfg2JhdEpGvfjsAynBiAF3T9uHlJvpNCGQ1Tiy7JOG
X-Gm-Gg: Acq92OFfD39GE3B6yw+Nq+iLd7m24bIgpm4mNU8+TqPSCKnjdmGOyfpTpLNgVp2x5uG
	Yc9a50txFc2DcqxkO3b+WjkQ8SZN95PBLJNbKGL96IPQxbj+QDDapV/DNO6R414w0qi886GUHwM
	jINH9gvi/zJrxxL2Iu81lnvfmmKBea4Ozewz5saCVRWjSnNyjx9CNomCZh/+VItVbApdDsMrqoC
	tMQIiEOpwZmWTpAm578KPH9V48gbaAgppJcX2RQOSfMMThFc+SgshvhD30fG1VRrqrVvhmbesDO
	cMLPPE5FK3HbIEK0Q8vWTpvIUSbarRzzYpoOaxHeVDxjrY1G7pwT8qUajet3ZgolqzdQwGg9u5R
	Voru3ZFlKljFy+I8YkKpV06Vfl3G3JrDEZbUqSD71QC0FjZlR0RI81VM31mWBq3hwzqc5dUenCC
	Q+lAD0ii/WkR7tIe3J1LUKFGm5yxQ6EE7PM5sSSAoCDLQxoFrSZKiFtNxn8yeDwvEqIzv3/bphw
	BNgSKZ81ZbzGQ==
X-Received: by 2002:a05:600c:30d3:b0:48f:d612:3c59 with SMTP id 5b1f17b1804b1-4903605d86bmr12514805e9.9.1779350351689;
        Thu, 21 May 2026 00:59:11 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490387d16basm5521255e9.35.2026.05.21.00.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:59:09 -0700 (PDT)
Date: Thu, 21 May 2026 09:59:06 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org, linux-usb@vger.kernel.org, 
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 6/9] usb: xhci: tegra: Explicitly specify PMC instance to
 use
Message-ID: <ag67FStKnQcvNOrP@orome>
References: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
 <20260506-pmc-v1-6-a6de5da7216b@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o4bqtknoba4e2ooc"
Content-Disposition: inline
In-Reply-To: <20260506-pmc-v1-6-a6de5da7216b@nvidia.com>


--o4bqtknoba4e2ooc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 6/9] usb: xhci: tegra: Explicitly specify PMC instance to
 use
MIME-Version: 1.0

On Wed, May 06, 2026 at 03:41:57PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Currently the kernel relies on a global variable to reference the PMC
> context. Use an explicit lookup for the PMC and pass that to the public
> PMC APIs.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/usb/host/xhci-tegra.c | 38 ++++++++++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 12 deletions(-)

Mathias, Greg,

can you ack this so I can pick it up into the Tegra tree for simple
dependency resolution?

Thanks,
Thierry

--o4bqtknoba4e2ooc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoOu0oACgkQ3SOs138+
s6HRkRAAqo5/UZ1fUVfF67PnLxU9m4v7JcLF4Ytf/Z7v087AEjfB1FXekO/SfEUl
dvex3+uqG9CIaSIQtQ8rxWgfEyOZeFirJloIENzJtaXACdsld465AHpQKBNbI5xU
/euNFiOwGTIgOHGhhxAIurS7F5Ag0WgWOTDN2uBlYGiDeuZShkW3Ek3M1WHSF2ey
Ai6uDC6tf03sgZla9uXS+eOZHkVaTx9pRDE1oxxHHLMtwgfkkl9BEHKxJ4ZqTYk8
6G5Bdz88LVtn4VWK2v/B+E6LiY5FJWuS2bM0PeRI2KpkB3F1jUy0rnC3OjdcMBjE
zyezSJsdMXkgODfA1zpIjGaAWjJ/wkU3ptsQ2EHq2+uTAji5OBUP/fquL+uOI+xH
WIHngd8r7BaBvygQpvVPl3YAC26qyRDmRqptWTXY/uISmcwmRZ6BaQTBsx1WOPmM
mFdZE0rVwRSfMws0GpPu6Atz++gerVHz/2EAFKPrntor6zUjSTbF3B42XCtIwpyO
T1Wmpfdvpt02fe1SjJvhkFCHzCv2sHvUqshC79KoN0gavq9732DOpJdn8aN8YTfe
GK4ekoKpjRZr5MUhTWGmRL0wrDNysBgOur97daSMrtrJNs+s8wlXA+9CP9nyICzs
2bbPfHWWQ78FiSSH8IOW/xAAFxM7aEh2UcHuajcX9pBLFwOnveo=
=ByYw
-----END PGP SIGNATURE-----

--o4bqtknoba4e2ooc--
