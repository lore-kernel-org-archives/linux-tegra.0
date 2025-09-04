Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B5329B0;
	Thu,  4 Sep 2025 15:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756999863; cv=none; b=McaKyHEqIGIMpobJmjGPFCOe1nrV5KKN6vLUaSpc+3WTRkto1cPkLq9t4fikGbnQbNkYS7xmr5NRM+gIjoMp+8BgHG2clEbEiXxAx9H1eM4nHjonbRGfawZubJiVHMS+ybHeuDza15A/JzEG2SJd382LRYq9w8IEm41dr7r5i/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756999863; c=relaxed/simple;
	bh=1aKpEQb07K7bq0JI6ungYiw2uqCF7T5zoE0XrueT7NU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DN2ZjPteWtnt4G3KrUw9ee/XKHIz+WOfvca+RzTZW+BgypGAjntY3+0fmHzJ0+kdau7NrEVEMH/8bszuubC/C77c0zyuGOKIDSvXfdpUdBe/J0A4EKa28/FePSetGF7yjTRsYjHNwOm1uZGNg4GQUkI8AuJ3SoOgPSHyKac+auY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9Zxp4ZW; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9Zxp4ZW"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3df3be0e098so607245f8f.1;
        Thu, 04 Sep 2025 08:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756999859; x=1757604659; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8xE4rmjGRisIQDV5Gl3u0Fv0zsZRWzQtHGzTA13lIgs=;
        b=L9Zxp4ZWBnB0u7ckQTMmaejLYG8HjLQdi5I/1CGN1/Pq4P9DXTCGRxO3IaE0uwKXfM
         gXn4v7u91jdBBB5w3eRRW4s02KUEc4Z8Pl8zIeqwgKWuqZj5uaC1K8f8kG6y31T2mp1K
         91+InJWgtJEkNnlzHye15lICZRauK4J3xRBKTFv51cVb+ZJUmXlzcRr4i99ls34sLc3t
         Hr8FyS9Ktux5yVr+4xFKRL/4keP/IN7j8x/IY4+e8GB6a19qxHrSdk5PKDtegxrbjDC8
         ECcWgKvLdN5pMOvrI5liYwPqwUNYsbEDxnMoad7h69mAAhI3LiIpjHRS6urcZbbHFi8K
         Ntgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756999859; x=1757604659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xE4rmjGRisIQDV5Gl3u0Fv0zsZRWzQtHGzTA13lIgs=;
        b=LgAWSoGszRNBuBbQjZneiYAKlELie4uTdSOD8URwRRMJtB1L73hRFxg4LGWx6i1fuu
         4JB8UQvBESmcq42grZ6ehzTtdxA5H4F8o+yjoKq1QFUq6q2UjpNPA1CjwYKtMl9fHmgF
         x3IKEcl+IWuBNHz8GwMaQTSVKh590dkcptoW53FmDJ81fWOOqRDQotIClDKm6cfXW89k
         F/eObRqA1mYW+Ak8WCpBkGS2rbWr8awjdxrq+RkQuFtHSNsyR2NegYEZ016Jtrq+VIF8
         xF3tcO/B4x70veooYMZA+cuYjgPER0U+Kv+1+rhut+kReUHhAB87WZzb7waRXtuB1Adt
         0ybw==
X-Forwarded-Encrypted: i=1; AJvYcCVaQ43nDDOoZGD9l4rwaqv9OQo2QjOs3hoQj7z4bfL0iMrD2eb7PaoixtkljAtzmiX3uUZYDGHvSEs8@vger.kernel.org, AJvYcCVqRr+4O5m9UGOJHBIqwgdKDXsy0hC0wXb1i+CcsMwLjguNSPzp8lkIbpztOIXai3kSTn/XYHLu8TQmK9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLti4rb1MKxNefnCtlcyr6+aB7KN28A/TwNzXtzlKZE7wPhJ/r
	fQ7Nt2NSCJSaOlovH0EEN+V7KL1Mor4l8wWFKOtsCcQN5T7/RYVhCaxf
X-Gm-Gg: ASbGncubdd0VSpstJ/qtbL9oGIjBSd8WKz+v61Ah4Q9zbvbrWqx4iQo7NPQH00ej7vF
	jX+4Hupdca/J80Xogwb491+nbBw2j+gL2betzl00VKeRl+F69PZ8iQkzlnVfmKWFURN43y9Bb8I
	LUMy/3pID0dMSsZoSiFJWaRcSPsSTopoUMo9UqXTdoXTOkZ9DqcJJO3O0BpHOEXXx9+/O2h93v0
	2java+KDTOAInTC42GqgBiBi9chR27U+aJqwM9w9W9eRB6041wtYApP486emzYOuO8VgXHcmFvN
	S0qMwApnijqvbmO9d42f0oFJPOG3NOrkyvgGDZPJTjm5Q2OnS7bPKfeuoYAPXEl31hoPG5fNAyK
	D9kdonxqIAQiYPVoaLUhifFLsU5XUQ5RxPgtu3oZP+y5EBbJDzUz3Bk9y3zXWjTS7pOxW/DNfb1
	VI//wf0ZhI
X-Google-Smtp-Source: AGHT+IELB08VGh3VAq+KT32lgs3tsogmI3gmF9iQ69mvKEfdnKdejg4TzGBR9ruyPEVGthqdMWy/EA==
X-Received: by 2002:a5d:588b:0:b0:3dc:1473:18f3 with SMTP id ffacd0b85a97d-3dc14731977mr5762689f8f.41.1756999858759;
        Thu, 04 Sep 2025 08:30:58 -0700 (PDT)
Received: from orome (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d0a1f807f9sm27264155f8f.38.2025.09.04.08.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 08:30:57 -0700 (PDT)
Date: Thu, 4 Sep 2025 17:30:55 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH 6/9] arm64: tegra: Add VPR placeholder node on Tegra234
Message-ID: <dzbefkymgrtyxfgfcdu4kq7rmgpa6khfqyhzz4a6y3qqonc4gj@yfafsqwnloia>
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
 <20250902154630.4032984-7-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4xtz2xrto4fsphdg"
Content-Disposition: inline
In-Reply-To: <20250902154630.4032984-7-thierry.reding@gmail.com>


--4xtz2xrto4fsphdg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 6/9] arm64: tegra: Add VPR placeholder node on Tegra234
MIME-Version: 1.0

On Tue, Sep 02, 2025 at 05:46:26PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> This node contains two sets of properties, one for the case where the
> VPR is resizable (in which case the VPR region will be dynamically
> allocated at boot time) and another case where the VPR is fixed in size
> and initialized by early firmware.
>=20
> The firmware running on the device is responsible for updating the node
> with the real physical address for the fixed VPR case and remove the
> properties needed only for resizable VPR. Similarly, if the VPR is
> resizable, the firmware should remove the "reg" property since it is no
> longer needed.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 34 ++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra234.dtsi
> index df034dbb8285..4d572f5fa0b1 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -28,6 +28,40 @@ aliases {
>  		i2c8 =3D &dp_aux_ch3_i2c;
>  	};
> =20
> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		vpr: video-protection-region@0 {
> +			compatible =3D "nvidia,tegra-video-protection-region";
> +			status =3D "disabled";
> +			no-map;
> +
> +			/*
> +			 * Two variants exist for this. For fixed VPR, the
> +			 * firmware is supposed to update the "reg" property
> +			 * with the fixed memory region configured as VPR.
> +			 *
> +			 * For resizable VPR we don't care about the exact
> +			 * address and instead want a reserved region to be
> +			 * allocated with a certain size and alignment at
> +			 * boot time.
> +			 *
> +			 * The firmware is responsible for removing the
> +			 * unused set of properties.
> +			 */
> +
> +			/* fixed VPR */
> +			reg =3D <0x0 0x0 0x0 0x0>;
> +
> +			/* resizable VPR */
> +			size =3D <0x0 0x70000000>;
> +			alignment =3D <0x0 0x100000>;
> +			reusable;
> +		};
> +	};

Hi DT maintainers,

I wanted to get some feedback on this type of placeholder DT node. This
doesn't actually validate properly because it contains properties for
both the fixed and resizable VPR variants, which are mutually exclusive.
However, the way that this currently works is that UEFI will remove and
update whatever properties need to change during boot, so the booted
kernel ends up with the correct, non-conflicting information.

The reason why it was done this way is because it simplifies the code in
UEFI to update this node. Also, without this being a placeholder I don't
know what to put into this. There's no "default" for this. One option is
to not have this in the DT at all and completely create it at boot time,
but then it becomes quite difficult to create the phandle references.

While at it, I'm not sure if I properly understand how to correctly name
a reserved-memory region that is dynamically allocated like in the case
of resizable VPR? It doesn't have a base address during boot and the
kernel will allocate memory where it sees fit. Do I just leave out the
unit-address in that case?

Thanks,
Thierry

--4xtz2xrto4fsphdg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmi5sKwACgkQ3SOs138+
s6EL1w/+O3vMzwflDNuAsOeJT5PO30EnSdPQtwSfs1kegW1Z0O7O+SxPDRbIOumH
ZtXCWjmHUA0x4A4tV1KHYusXEpLe8kdgMeaFYK3XECONFcW/xto7lbOk9ujNo4B0
RSBU+KmbKVeHe3JQ8ENftNYUpQqLHdBEi/FZVlgjZW8KLe+MuWHnvoZsutLTvLim
edJeSpS/ms98AYPqE+MACLkqG92b1y0jgGhsa3dymQhX6RYbJxLTzO3SCG9WKpFL
OkfgV5XwyRYgsBQDIkJnBu4+CtPOO2mJeUQGuHgvSlfv8Ulz6jYKIcPQj5hhJ8KZ
qtqV5vMoRauXf76f97vKenJ86SPlWymUWCj5/K88mqtDm9EUoTtMT0LfGhCsIfIX
TNBYgIz79w16UvFuZ/CmD2MEUPi00WpA5b2UyifcHKKnORwL08lBhLD0r5UWMf/H
qUqNt0qtK2EuPjOeUMwB8YN5VPZCP4oWEWoSVCF3cbjUitjx2ogJRMgeazsAZdmP
x1+CSVvTpQ1RqXIn3ezRgBkPLQ2d1KJIJdv+pdQn1zcFTuqd0nP5yFS52TiWsJ8/
cczmrWcs3r30Aoaw3e0rW3OQHghuXLaavcm6FmLVFGs4VDlpRbFnESuLbynzAbAk
7VfAJwgPBaLVqs2UqkC5ezADL7wV+VxmrcPUry4JBO+17jVwwBk=
=p0GH
-----END PGP SIGNATURE-----

--4xtz2xrto4fsphdg--
