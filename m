Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CA61F81B8;
	Thu, 24 Oct 2024 16:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729788652; cv=none; b=dQ86CYcUa2PRNsPgXz32RDdEb+9zXQpbItHZWezu/u5QHMh6K5By6l80T5dY1e4ct8Q4BmPUgUghtvYOZmm8siPGGfMsCpG15L9eInWSwDQTtCcn2KhTGxFmh7HoWl//e4E/Bik8ZhjneLAM59RGY6QwoHUhG6AhZylLzddxl88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729788652; c=relaxed/simple;
	bh=3RgXWL0YGy+4KDPWrL4/59X44OhiVVqjONQptRozfUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ESUpwGWBO7jHhERt8lO8VwxG3RzHbjWvmNGTdd1NH7M4+0w2C9qbQfCztVqcIX/pkGRABrQfGEib0MKfoTxGafA01a37jtigQy0bnuNH/YMRu5d662EAwCo5bMv/Aa7rDEvmaMTbnQWF2K6JLtbd0z1IqSax2OxxK6/qe5wAFzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/vidhEi; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/vidhEi"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9a68480164so145437466b.3;
        Thu, 24 Oct 2024 09:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729788648; x=1730393448; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qw3O9hodQBRp/DEbf4rfIGCtqNJfuZEI+i/CxdbGArM=;
        b=F/vidhEiHaBC389QMFzhpMwJWhzz6ShTKUPAUVsDTiMeV2ow5PVTasiVypjpONmVSG
         QFX/h80fhluPGTGwzflvDMxtsRYM3CPVV/ietRlc1/2iBQRwVCVLqGHoE6igHD3fT8fp
         7egM07qad/CdUvMsGEiqYCkAJ7dCClRm+2LdLnrxpbIRjRpnbT3Az42zI/sNmHeCdfUU
         joiu/pDDwMeDC3v/btwPIew036Whkg8TNmd9mP1CCZD7rSP06wCcwPUwe4I1Qv+M5llE
         90udHv8MoQyc9giKZFJVMjzF6+WNtKJ0oggMxI+PVOS+YFTNBeDndUzFoy70zbZUjuMp
         ItKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729788648; x=1730393448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qw3O9hodQBRp/DEbf4rfIGCtqNJfuZEI+i/CxdbGArM=;
        b=p9Ty/O4VRQH8jwtxTI431AhuuFFscTu1q7kqodJOsfg+LY0M4N6mY6I1xtPZb+q5Q2
         yZ/EEj27ynWCbZT9ZDkkaepiinghAaoDRczco/bQlvuRtMS7uc2igpSB0GinJF+AepDc
         HljGekn2J8eMaKnkKNX2pO/NloSwYocBDh61cFnlSIriFfbDZRRLTKa+0acRbimKR7U4
         rhBu3GCxdiOjYEyiqf8gcr7bD5yuG/nDSgPTCrXyVO+o0FqbdVoDX5AoxbIg9xKAq8Cf
         fuo+vjgYm9VYf2oltBxyC+blj3bXq3HC7+RVquny0ZCsXe6UUpGKz7/j7ql/Ju4bcNsh
         mcNw==
X-Forwarded-Encrypted: i=1; AJvYcCWGHaxRRZAzXJt+etGbVnuR9BV5s+QBWxBXKbHYxQsfrqAPjRM1xPQnruC4SBBw/yQ/k+wTIYZjcsusssPu@vger.kernel.org, AJvYcCX/Z7Bp5ir3X+cGuFhCyed6LXMkgd2Etwb+Rzm2m9H4VFONCl2qNBAtu3z157LOd86qejStlq3N4t2HokXX9Bw=@vger.kernel.org, AJvYcCXJEElI+y193V3Ltr+9JgNLw2mIlu9b2DKIM40CqM3gzlbzjbXWVQXsd033+1yxA7qKYw6MN9Ze87ys94Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGKqA8lDS+0v/vbS4JjJxrWq5qgdhj9VgB26kYoSBxKxDu7+8F
	YE+BBXXbDyfXGVkiFJsvC5GFHeHXtBRo/mdZenuCs/WLhDP07d1LkOxYtVks
X-Google-Smtp-Source: AGHT+IFdtBJB0hDClK2PASxfoljLwLQyf/nrZv9yVgbCfBzXcKYh5XyFC7uUTYw2p3ozGeP0RZZLIQ==
X-Received: by 2002:a17:907:3d88:b0:a99:f972:7544 with SMTP id a640c23a62f3a-a9ad27650a2mr256202666b.38.1729788647917;
        Thu, 24 Oct 2024 09:50:47 -0700 (PDT)
Received: from orome (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a9159a23csm637575566b.205.2024.10.24.09.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 09:50:47 -0700 (PDT)
Date: Thu, 24 Oct 2024 18:50:45 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/tegra: Fix NULL vs IS_ERR() check in probe()
Message-ID: <hwyc33hoo64ir4lljqehczycrl4bu2g2r74sdmbtssddpdywyz@6lyxnedoe6sy>
References: <ba31cf3a-af3d-4ff1-87a8-f05aaf8c780b@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m4ji5aso7m54wndw"
Content-Disposition: inline
In-Reply-To: <ba31cf3a-af3d-4ff1-87a8-f05aaf8c780b@stanley.mountain>


--m4ji5aso7m54wndw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH next] drm/tegra: Fix NULL vs IS_ERR() check in probe()
MIME-Version: 1.0

On Fri, Sep 13, 2024 at 05:34:54PM +0300, Dan Carpenter wrote:
> The iommu_paging_domain_alloc() function doesn't  return NULL pointers,
> it returns error pointers.  Update the check to match.
>=20
> Fixes: 45c690aea8ee ("drm/tegra: Use iommu_paging_domain_alloc()")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/tegra/drm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--m4ji5aso7m54wndw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmcaeuUACgkQ3SOs138+
s6HN3RAAvWRr0rls//7gnX2OCfl8oyYPo5mgZd5XMOV0spjX3OeyTFF0KLMJRclG
w5sHhaYFmmWnWs/6UE22ayu0SMjX3Ak28ZJDvY3ssT7uCWvZnAIBfsEjTVqD8eXJ
wp9UkIv8jNW3SEkdfKxVgN2eQ3CWPUm4VLNGG2KBbNoO3EcDODQmqhk2gTXgR2M5
dzhmYvg3rGh6RMElvnXUXD0Ekfj26sRAeNXv+uZdaa12Vox3/Rf+Qye/jBOwJSBX
TiZ9uSph8Fy1kFdFWelJpUA/yOtPBghTwyoYxvRU6nBrDJgnV54XaMoaKLAAAHhM
E8EjeMS1xJJrwnfV+1Xox9Vf5Gj6CD6rdxyNkidE1tpzLE2P/frdXhbmr+SX5xVP
+lqLogiN4EnK6DHsNKGP3blTjlqjoTI4sAwiq+K9dqlclGpTUqozrDvjKzkyiduc
6Yu14WfBsIbiN0jqtdqf085/kOEIqDpPaV0tnVzugeo/ip6QktlgkmJNMhvMAR8o
joL6U2zKAROIGRi/ulXDWmCx54TGDXs3UBW9Zd/EiWuluAFLdpfmB5Phh3199SEO
c6RIFtW6gs9/fDSTSow9k0cQ3J7cq+wMtPo4poK4q0kEJLuUS55zm+OoGvOl/tSM
vvtaUJcVKHdI4nP+tIy8qRng0aCreU0cmgBcJtVFs9wjuVmWcDA=
=8x7A
-----END PGP SIGNATURE-----

--m4ji5aso7m54wndw--
