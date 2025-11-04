Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9591A2389
	for <linux-tegra@vger.kernel.org>; Tue,  4 Nov 2025 09:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762247648; cv=none; b=OcaiJSydppI0HvfHeBuW9urDxYLVCQ84ZOSgQ9YXynmYiyOR6l/REj3ejD44i2vtO7WCyi7uGvofSgOv7xvXo6Qeyg2C997De4rRjuumPMxUuADScnNiwaAP3V5iJWaOAIGdYUYkFTs/JmHtvQncbW42ZIAtfgHXE1cL/BKxypM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762247648; c=relaxed/simple;
	bh=NTI32YtO6boA3PFAR50owYzOohdk89mtdX8esBS+KQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDo3QoifXC4/i9DmX9w4SDtjCdY1M9cxGe37JjZawj3rh7tByChB8a+Or6nJ5qnu7qBGBl5kmjP3zYCpRwkR+DQ0nHJS+wcHiwfBCgPOvRm3+0EYICsm7Zg8n+ULDf0ADxH++HTiB62pPal70tQlXbrENyQRLPDKHfWtQaBtANI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPKzyHdG; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPKzyHdG"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47756a07b34so1250835e9.2
        for <linux-tegra@vger.kernel.org>; Tue, 04 Nov 2025 01:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762247644; x=1762852444; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pHpJf3YpGpHL64afQKbWAVrsw8giWZr/mzkQU6vPIk0=;
        b=SPKzyHdGuR+B1nYY0Xj8W0sdaGFDd7qKuPQvN4Q+Zw7D7xmgn+Ckn6H49OuRS5V30o
         8Ie4tffAm8+c5ujuvvi+yECq8BSwYOWwfsOEqAiTCj+5MtrwiM8ujJGZ3EBQC/0DS1Dx
         SqQtYoJNWmA1VPmtERSYMNmT2OAt7LtIc4Hgi4MIfDXlvcikPIr4zinyhJQ0REnfxSUp
         ZFm69g4bdlqe/QRk+gUtapCN7YFTkgtU/lauTt38wHHCutfGrcmjdeunjcChI8eXzei/
         HMMQKrovfKVjZYfmCmGH2UPKo+FO0bgwJNjC3y463eJphIbtVWXpYoOxXA2BZ+wfbTQ0
         t5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762247644; x=1762852444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHpJf3YpGpHL64afQKbWAVrsw8giWZr/mzkQU6vPIk0=;
        b=dxcivMJLmvXOgUyp7TDtfROnL4BrXGlHiciMObXab65ifqwIhdtxcxTf/zBrWr4CX0
         sZ/T2EVYtJaqmIGB2TGikSrWAkFUQRIWp1Ah+d2bA9Q6fyWbFrE5xSkNnt3OJrJfGEvb
         OSLlnYK1CTPiiaSuNClfpiF+H8KuieFCOvTh2wzgNYUoTGDeekROSFSfHAk/vniCebHj
         /xQpqcPZTcYI2U3nIf+m/kkvcK4St4zON+FUDpxddH+g0M03JNcnXU+3u9NJTH9aJBPf
         9N64PsMWWeffNkhvIcdi//DzPOLH0sdmoANGPWfPkwQghDCyK9JEbhFbVNxVd3kQN903
         jp9w==
X-Forwarded-Encrypted: i=1; AJvYcCUUdvDHXh2AOm8kvT55OPs37puZ5Ge7Yx5oEGgZTjJqvwj4Yd7nrnaCZDZ6kzLggjMWDNf6Y3NnUKB3gA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIMlUUJfiQ20oMEV+GctiSbTe+qxt5r2qcxaMLn8CPQeykMhPh
	3wrS3cM9OOOZCAEwBsh5+LL25lDdmpYwieQNKG6MBhT+wsE3pnSdnf/o
X-Gm-Gg: ASbGncuOD94OdiWJ6S7enQK3Fn74feripa1yPRdLX9Z7b4LgtZArW83QgvG/Z0qIqWI
	DD18vc1vtjztnt8lpHAWXYvRd8IBX9lUG7LVEVCxY9c/LzauyijfAxTarQRt3vlPA6WA+XIEuwF
	BWlXouhUXondRpZjH8PTqu84FzLknW4OyudOdpQC5geIwH8CbTATXHM68DIdRC7GEv5DaWQm0MQ
	WycEdWae7laITdI3AKes4sbHcCC/G2bY8CSVLLlp60xBVBGFnNcvoyxQxJFMjfyvhUQ4tpnBRh5
	qHDf4d4lcWOMZMKy2rDhSVCSWkeo2pO3T9MvUkQUFG66uDCAOmYr5+4XenJPt3ZCwSIY+1hH81f
	xAO554fPbJyRygJUaswtia5kCz2yIjQlZ9eUsi7+MBlvVMkprZWbM+MqoDogX+eVcT5+1DmSsCU
	oktUcW0AwlHh9ZUdpEY4Hs4jYZSHJyzLCJrdRurbA19YyXCAGcE8PctfpqPspN9QA=
X-Google-Smtp-Source: AGHT+IG8094rz/tIaPzHwYJZtt7A28OHv5lwMGE79saNMkPw8NLncRM6ZozuWAx3nCcLz6FMe+/v9w==
X-Received: by 2002:a05:600c:6212:b0:46e:432f:32ab with SMTP id 5b1f17b1804b1-477308a2638mr142682405e9.33.1762247643739;
        Tue, 04 Nov 2025 01:14:03 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm13607645e9.2.2025.11.04.01.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 01:14:02 -0800 (PST)
Date: Tue, 4 Nov 2025 10:14:00 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: Enable cmu for Tegra186 and Tegra194
Message-ID: <72llskwvuwyllvz24zoex4ad6v6t5skiehmwylj7exoh7bmzjo@xq3v7vja5w62>
References: <20251101-tegra-drm-cmu-v1-1-211799755ab8@gmail.com>
 <pedxgtvzfrfzihoshhfvntin3hwwi3znleilbz4abjad74nowb@un33lgiaa26z>
 <CALHNRZ9-XrMUkQE0cwjq-HUYsy5uerhOQ9sNpirp23kKoaPuYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tilmmd6na7i5rkks"
Content-Disposition: inline
In-Reply-To: <CALHNRZ9-XrMUkQE0cwjq-HUYsy5uerhOQ9sNpirp23kKoaPuYw@mail.gmail.com>


--tilmmd6na7i5rkks
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tegra: Enable cmu for Tegra186 and Tegra194
MIME-Version: 1.0

On Mon, Nov 03, 2025 at 12:39:57PM -0600, Aaron Kling wrote:
> On Mon, Nov 3, 2025 at 5:54=E2=80=AFAM Thierry Reding <thierry.reding@gma=
il.com> wrote:
> >
> > On Sat, Nov 01, 2025 at 06:15:17PM -0500, Aaron Kling via B4 Relay wrot=
e:
> > > From: Aaron Kling <webgeek1234@gmail.com>
> > >
> > > Without the cmu, nvdisplay will display colors that are notably darker
> > > than intended. The vendor bootloader and the downstream display driver
> > > enable the cmu and sets a sRGB table. Loading that table here results=
 in
> > > the intended colors.
> > >
> > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > ---
> > >  drivers/gpu/drm/tegra/dc.h  |  13 +++
> > >  drivers/gpu/drm/tegra/sor.c | 206 ++++++++++++++++++++++++++++++++++=
++++++++++
> > >  2 files changed, 219 insertions(+)
> >
> > What does "darker than intended" mean? Who defines the intention? How do
> > we know what the intention is? What this patch ultimately seems to be
> > doing is define sRGB to be the default colorspace. Is that always the
> > right default choice? What if people want to specify a different
> > colorspace?
>=20
> I reported this issue almost a month ago. See kernel lore [0] and
> freedesktop issue [1]. The pictures in the latter show what nvdisplay
> looks like right now. It's nigh unusably dark. When booted into
> Android with a tv launcher that has a black background, as is default
> for LineageOS, it is really hard to read anything. Is it correct as a
> default? Well, cboot hardcodes this, so... presumably? It would be
> more ideal to expose this and csc to userspace, but I'm not sure if
> drm has a standardized interface for that or if tegra would have to
> make something vendor specific. I think that would be a separate
> change concept compared to setting this default, though.

The reason I'm asking is because I don't recall ever seeing "broken"
colors like you do. So I suspect that this may also be related to what
display is connected, or the mode that we're setting. It could perhaps
also be related to what infoframes we're sending and how these are
supported/interpreted by the attached display.

All of that is to say that maybe this looks broken on the particular
setup that you have but may works fine on other setups. Changing the
default may fix your setup and break others.

Thierry

--tilmmd6na7i5rkks
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkJw9UACgkQ3SOs138+
s6EMmRAAglAOI/iYg/7zZ5w3SflGxiqrOunGokK9cFTVNpvc9STnAdZW9h/T/8Lj
qcMh44GgzLS4tifB+uMp5P6QCCQrckjqeWF6krgR+1oJqBTF6JCwk36sVHJ0rwGv
4Fk+KXEvxacQj6NcSGD1f4gYlVfT1oNYW7tIUsS8NvWW4beXZlYKsDZsQnCZgTEE
Rwoz/jKiGnP8vrPT9ODZM9ds4tvS47ml9psh173DT6RvoC1Ur/mp0Looh6ugZZc8
bs9oo9rLI73ZUfU2BMy/qJgihBk/jPn4Ms1cXCu2CVciv4SYJkKboS4t7CREw/OG
p4qwK12rXlIc8eXr8KzsVHuLS9YdtfNyK6fmK3IJ/pjtEprkD0/atFOl2xpOdu4C
TbRQ7gn0O3STa03bsTp++zeOgryGOYayZMGi2vnl6qskbz8hG03SrEqqvPtVgoYQ
z3YsySjMpo4wk1eW9BL/9yehZXBRnhQN/xzLEXKe9f8oM9eafnXt9phKgAVNhcsK
e5KQZdP65PJLJ7uWSUX/yGU+473th48dbmFDK2rhfUgdvA4BrZ8MQ1XqxlYWNIkE
iVific+hwXOMGLOnC74VIgh6vZqHSAk99D1MMvzzWnEQ+L5njnqVqq4+in0lhKAN
g9+gsXqCPPnPnE+8R6e0CSif9fqfZafL+Vtoywt6m+CVyxSHyrs=
=rr3C
-----END PGP SIGNATURE-----

--tilmmd6na7i5rkks--
