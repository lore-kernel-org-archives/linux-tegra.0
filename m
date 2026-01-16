Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC45221DAD
	for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 12:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768567448; cv=none; b=dU2p9VdAA7t5oZFBy3ttkGYCuWzoqPF9xciPY00RmQtRYv5IeCcnbaafHmWC9wPdel47mmP8PdJ3U+azi21ldYpSgwAmwhK41NNdkWTXNYI0kr9ztTuSX9/RfI1LdjtOKO9/k5tN45+z+c4snhTzBM2FUzPV0HqIbWRv/dsGx2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768567448; c=relaxed/simple;
	bh=b+D73NJzR5tkQbyHArcS0qpplRGo9n9mhRHkUIUu64E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=paTw3YvIZWSvUF7oZx7UuXYRfxw9psT7tWnHFxQ4FSJHzYH1naz1qRUdm9N/f2Zqkay2H4Pk4SO2KAv3dUjz5hbjoumAiItlAIsl5SQNBA8MIX36kHI/M02GjPx8Y2FgoE4aAS29PVHMIkAHBZwyxaMymRZsUuYr1SCurXXry1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYVHhPOK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYVHhPOK"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4801c731d0aso9932975e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 04:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768567445; x=1769172245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZCf9q4Eq3f7Zk60HL0G320nGRoPqD1TASM4Kn6lCNs=;
        b=kYVHhPOKNpoMRPMgRXtPOiU/QprX21tHlx0cjalDns9a8fRHVZ7cO6He+X3EE0FmPx
         Ar53jGonXTVn/JSo55tIhu7OWjBZwhPMRnjRqZWi6+ueDnuiSt+u3aR127a/tAhFLJww
         XYOiwZc+kT+un4yOUf5XRzjCiB2BmeiUwu/X4lajFfQScEejTW3n1fOHhINkQYz6dXqZ
         Vv1bUAlJvlmAhWn62mxMtVM6iO2g7cpeEQRY0JJ8QoBr+WXr1FH3v/3R6hNoqj0+UxLh
         Z9XR1sfbTQmlEbam5M2cxt42wOLeUcxw6VMSmYzfT9o6+4hJPFBAxLchiP+v3pS4y5Ka
         wPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768567445; x=1769172245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ZCf9q4Eq3f7Zk60HL0G320nGRoPqD1TASM4Kn6lCNs=;
        b=TDTAi38A374O14XLN8Ea7bMw5IkOi4fwg5ymkUZ7Gfa8dWeSelNAARpRZ5MEX66e0m
         g6+fW73rrYg5LDsGZSedQyYxNqf4K1slXg6+U1LJ7PrYrJht4/016fDoAm5MNWV0Yc7T
         Tqo/hj67s46KycE841xjHr0XDdQwctr14SdQLCXobE/ZOw0PKr0QL5Rpz3fME8hgRU1L
         GygP9u4POPOO5NsijsJpyq9DOZn9RCBFEBfqSVo9yk2IZRHElh7zfN6SKIHWJyYazSqU
         IzRRnDGUeGT+WP/eRC9jAsCI8TqgjEVptS33PHCIqmPWX4erVHZK0eRUyTx4hipd6BEm
         fsEA==
X-Forwarded-Encrypted: i=1; AJvYcCW+Ydc5nkXLouFMPiQ8Z2xj46bAKbYqQwRQcckuPsoXrX8Y81Wq+z59nNf9WdYFQtOfY5wLAFXUGs2eJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgmh5ecPCh93kRf1GX3YuiEe2gq1xx4iOeVHYdJlHDPx4uGLjg
	vw60TkpstYXeq+HzXOHq7pDBPnfOtKWnX6fbbx7v+ZeJioh7UI37A8+g
X-Gm-Gg: AY/fxX5NWZAIzpWiBS32xCfnPvZjUJL6W0Pdv14s0gE3oA25Tg0McQgT/QWQo1yyYel
	SWU0tneVD0G5Cv0AqvYbSzqMjFL8DMzVlCzSHUQqSf5oJ1XOE2fLZRgT+DbvP+ll2p+AINa3X6T
	mqpUz8LTsa+BM5CXn6982qKJdxqFg9r+uw+31B/5umT1BeXPTXH3vznzRrltjwAuGOqagaPd13X
	udcvyN2x7qXHfT5DB4iOH8rgKaQAQFnV2YE1iSzAmt9tq4XjaC8gF8NffbCKMImZZ6POr+l9YXm
	MpEJwENgNxrfHPmscw+mHT8+BmJFbx+zidGxE3dAtdsAkloB0ZYipFk65Tozd8dSPWSMio5NdBH
	n+9tlOhFy6KoUKqTJhZwwQt66HLukFCLfDpbTPZIiEhxPpZD2GQ8dwA8cKfa5M0ZN+iX+LSsQWE
	cHnXfZx78l/qkVKFbQkdI5qTyIWx8/E15/JIL1ph0tFhiXizXU/YA9nvdymuQyeggOX+ystbgPk
	Q==
X-Received: by 2002:a05:600c:8b56:b0:477:79f8:daa8 with SMTP id 5b1f17b1804b1-4801e34307emr39892975e9.17.1768567445526;
        Fri, 16 Jan 2026 04:44:05 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e886834sm42518255e9.7.2026.01.16.04.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 04:44:04 -0800 (PST)
Date: Fri, 16 Jan 2026 13:44:02 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nicolinc@nvidia.com, 
	jonathanh@nvidia.com, vdumpa@nvidia.com, jgg@ziepe.ca, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH V8 3/4] dt-bindings: iommu: Add NVIDIA Tegra CMDQV support
Message-ID: <aWoyh0e2ncSsNW9y@orome>
References: <20260113054935.1945785-1-amhetre@nvidia.com>
 <20260113054935.1945785-4-amhetre@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uf7gopu5xawojzkn"
Content-Disposition: inline
In-Reply-To: <20260113054935.1945785-4-amhetre@nvidia.com>


--uf7gopu5xawojzkn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V8 3/4] dt-bindings: iommu: Add NVIDIA Tegra CMDQV support
MIME-Version: 1.0

On Tue, Jan 13, 2026 at 05:49:34AM +0000, Ashish Mhetre wrote:
> The Command Queue Virtualization (CMDQV) hardware is part of the
> SMMUv3 implementation on NVIDIA Tegra SoCs. It assists in
> virtualizing the command queue for the SMMU.
>=20
> Add a new device tree binding document for nvidia,tegra264-cmdqv.
>=20
> Also update the arm,smmu-v3 binding to include an optional nvidia,cmdqv
> property. This property is a phandle to the CMDQV device node, allowing
> the SMMU driver to associate with its corresponding CMDQV instance.
> Restrict this property usage to Nvidia Tegra264 only.
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>  .../bindings/iommu/arm,smmu-v3.yaml           | 27 +++++++++++-
>  .../bindings/iommu/nvidia,tegra264-cmdqv.yaml | 42 +++++++++++++++++++
>  2 files changed, 68 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/iommu/nvidia,tegra2=
64-cmdqv.yaml

Applied, thanks.

Thierry

--uf7gopu5xawojzkn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlqMpIACgkQ3SOs138+
s6F4CRAAs/LaZnTRigpuhM/Lhm5MOiVhksuu5bLPcQ++2uSJQtflBIADQkopKC3r
xfOY31m01LUKx75CeQGi7ekB6+wgtvMbIpX1Hr1caTIH3MLxrkgOumZJHKyclrYZ
vl3Ztc2CdmzUwSOXvNxtH/HwIzTXPOfMme+eBDZjT2iV2BxNMJc2KPuFI0HruduH
B/QqVO8FLcmIvPGqtneO8oaXtF/xrxiUojjxPdJmVNxUvdl/EIDf+VvQcEnhR+P0
YYFgMfEk493Vhi/XMhXAg9zKwm+1yhoC7vXdklGW8IMezknR79HxrzjXx/Z9DUK6
YFhItt0501jfhq+dqNWl7NaYDQtm/b2GxXHQ//cN2N+jEUSJDxbEec8YRPFJVlTL
+dlwu3GYvSatPHYP9tRzGuq13EK8EXtH9y5XYxl7+K314jo1kfv1YE/Acjva2hwu
kycXUDVl3ryPFeJuZX41H5jDGtbkh+cWdfm2hDdhwR93xBl4gMfQ96krMNwmfCJn
g1aIIQJDGg91F+17Bc4TkCIEscdp9026BmBJ8XzismHOM/uFw0hB+K4+dAX1TpvL
7uNCBSgP8MoXEN1i0tCaSq8N9zXvzp59DoCM99F8tpg8JLHR/oD3nYfqNS7rNwQn
JI9Gam81/Bg1MWrwgwqtKlN+oi3k0OvZfFyIEzEyavI45jDBk4k=
=ntP8
-----END PGP SIGNATURE-----

--uf7gopu5xawojzkn--
