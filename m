Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7574E313549
	for <linux-tegra@vger.kernel.org>; Fri, 23 Jan 2026 13:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769174941; cv=none; b=DeGRlC2y4AzKPIOpR8eph6pMH4IvBqTdRRz8PM2xoRinBU2t6h6juKMpPq8O7WGMWw9adX61FHnqQameSgckO4moQJNryOc7maXr4QDd37cCueq/yYRq8r2S3HUVCaSpKSf/8SzNfTqly4v5Rl+5O16N/pNs7iU9KLeXy6jz9p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769174941; c=relaxed/simple;
	bh=XOKhg51YAQQBLJz+iDYs40wy3Y89L9H1D+aBjSmMLU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBD2Mh1W/Lmfvh2wK4wYiEjR34U09ujD1mPVSJLcmmQSrTGiUoNFUcSRajSobZ2dmZTysIIZgDdy7udTZXRPp6B5yjgUQRnzeXrElRPQyjC2UiWLOkINv/Hxj//jAYRp2Cz36pFRzSXxLtzd9bWFF4IK5pKORQ6gwnKHhswOZ18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J82pqcGe; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OlYPiSWq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J82pqcGe";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OlYPiSWq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769174935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ffNID3lES/rvD/wRrz1/dUM8poewF7Ay9LgcS6R1JVY=;
	b=J82pqcGet3/R17KrWpciHq/BU4C/SAnQGDKKKKv+j6nJX45eG2WQCcEV8X73HI98TLdUii
	XrEzSIFF/h7FeszACZjTLSqXkIDbLNwKM6a4+e02siaFpRhQVMryv4/q3u5zBFrq2iu0ou
	UyyRtPxKVk/tXRd6OTLwbXOH03/E0E0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-rNawqIzGP9irdFM2Cfqhsw-1; Fri, 23 Jan 2026 08:28:53 -0500
X-MC-Unique: rNawqIzGP9irdFM2Cfqhsw-1
X-Mimecast-MFC-AGG-ID: rNawqIzGP9irdFM2Cfqhsw_1769174932
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47d62cc05daso21216245e9.3
        for <linux-tegra@vger.kernel.org>; Fri, 23 Jan 2026 05:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769174932; x=1769779732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ffNID3lES/rvD/wRrz1/dUM8poewF7Ay9LgcS6R1JVY=;
        b=OlYPiSWqf78NmVSyrGVGYSW6GwW9uN0ySxtYLJjN6PpMTMG/NgLO/NR+KCCRLz1+yo
         0NdVMbE9SH/etGzuL3OQaFJuvE2y3RCLz5qUYctrNhIaiGSRMsQyAuiq2S7emYfAbKfN
         PF6pSAG3HjwlzjkEPX0oRGlEVB9GI6s3zDXAGjckyfapbqkm1HQ5iA5r/RWbyzMF29u/
         5KmEi0PbEv2XODU3aKOs4fEH/cBuYamtRdlsXLykbChKMK/gzxBv7wihYHTmbo3e6E3i
         aVGq6RH1saFguYteGibcqLAFpvXQzPGT8aATppzzsYrmqAT3t021e9gOmjTJW0i57RGR
         6Xdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769174932; x=1769779732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffNID3lES/rvD/wRrz1/dUM8poewF7Ay9LgcS6R1JVY=;
        b=t+xA4DyVrdfZpEjquUYYrtvHUGawN619iwo172FgucwZ2P/9qaRi7UwtEn8mJYIE60
         Z1ZucVjPwa3z2DRvAa85M9TtSCKkugecakAegn+S57PsReEwAwc+1R6LzDoIWC4N3t6m
         M49JBfILDuK/HkidkHBabgI59i3zmSh4LxU8AozJaYKM734rYvkckW2zG9Y2WgiQgjPU
         BLwD+s3xg+tcmjD0J75x6i4ahAfZs0ADpict5NkWUhrkoL2c5qIWM45OX4UconYAFGDO
         Gp5a1vXfONQh/baDXC4x8MG8wFzEltunFusyd7//kPsIvWponY6+D51d1rXbha27yyQ0
         WTZA==
X-Forwarded-Encrypted: i=1; AJvYcCXHgv4f0KAOoGK5bZ72ozIFSaL7Xsw+vxt7DLcrhZujjLQnvjbOgZjgxgwzAqMMLv3/rHOB+JoCCjvCKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YygOLGkN5Lssjo2++nKzYIrQn7+2yRKukZdfRMl+II/qWh/diX+
	X/KaPbCEP0s4z3iBN3Ug7ZZ/8hR1Ia9h0g09SPmDtrodzgmGVUr1PRrpUXe+ic/UqVQ/1wAZz1u
	9vUe0Xu7OTSQ6+60nbR2ejYjCdBeoZuPkUKFMa0B+qUpEltnKswNo+MoxU+r1209G
X-Gm-Gg: AZuq6aLj4ytXGyuMjwYRBb7f1z/52m/hFa5a6Q3vaYvYz6ydDB5E/lsNdsjI4IWOjH4
	BkqtO72LAcuB7clw1DsKk7z/HZt33zTlDx0vNEkbnxv9H+IG7zfKJyBwWguL6lN467puDjmAi/m
	LXAzQXqDgo3X4nMytrxKFpKvt0XbfonCTVrklh9wRYXybgcxr8f9gVdEwmK1iElEyzEFOljjeGo
	fIDZfM0bkupkvTIMcY1UjhYVrtRCOt0r0nTPCBhL4Q7wUQcJapJ17zSJ0ymmAOHVhsGhWLz0rOl
	f7Nn7oRD3wznvvanYThV2JYf9WiEXZ3LEQL4Dc95YFSBW4bPp2r2ORQZ8uEv6Q==
X-Received: by 2002:a05:600c:35cf:b0:47e:e952:86ca with SMTP id 5b1f17b1804b1-4804c94550emr57738075e9.2.1769174932365;
        Fri, 23 Jan 2026 05:28:52 -0800 (PST)
X-Received: by 2002:a05:600c:35cf:b0:47e:e952:86ca with SMTP id 5b1f17b1804b1-4804c94550emr57737405e9.2.1769174931899;
        Fri, 23 Jan 2026 05:28:51 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbe1fb8sm20935105e9.20.2026.01.23.05.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 05:28:51 -0800 (PST)
Date: Fri, 23 Jan 2026 14:28:50 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 07/10] arm64: tegra: Add VPR placeholder node on
 Tegra234
Message-ID: <20260123-slim-seal-of-luxury-bdb58b@houat>
References: <20260122161009.3865888-1-thierry.reding@kernel.org>
 <20260122161009.3865888-8-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="cj5dkpv3cmq4mgtz"
Content-Disposition: inline
In-Reply-To: <20260122161009.3865888-8-thierry.reding@kernel.org>


--cj5dkpv3cmq4mgtz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 07/10] arm64: tegra: Add VPR placeholder node on
 Tegra234
MIME-Version: 1.0

On Thu, Jan 22, 2026 at 05:10:06PM +0100, Thierry Reding wrote:
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
> index 850c473235e3..62a5dfde9e38 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -29,6 +29,40 @@ aliases {
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

The heap name doesn't follow the documented convention, see
https://docs.kernel.org/userspace-api/dma-buf-heaps.html#naming-convention

--cj5dkpv3cmq4mgtz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaXN3kgAKCRAnX84Zoj2+
dgbuAYCUCaHUWqJPUhpJEcWkq2uLIaAHUBUCBbdSNPF5dpiFWDp+QSk3hILjtrCJ
0RNZRFsBfRAntBAG5/xlnModxB1enPz3Z9TuAC/80PaW7OVoKyjeBvgxqbNMjc+5
iM/+K++lbw==
=V4o/
-----END PGP SIGNATURE-----

--cj5dkpv3cmq4mgtz--

