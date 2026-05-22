Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAD83655D4
	for <linux-tegra@vger.kernel.org>; Fri, 22 May 2026 10:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444629; cv=none; b=QtIDBOzYohPOlUiQhzhS9PGOjrXEKvu38dq6qHb/B8DLwSWXvrTLqe4z9cmoXmo5IvmI1fv4j1lhr7wkw/QAx5aEszft0thTugj8lnScpGHoikOncmcY1z4X8sje+eBJpUDTRbeW7RVDezYYf8abOFK/I/q0dQdTAf84//SpQlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444629; c=relaxed/simple;
	bh=nUDx/Hx8QDCc2KH4E9IN4IE6QLtAgB3+QS3Q1sgq2N0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXd14OGt2vg/DkXjo54oDKok3ay9lRsLXxqpjEVesOYlUHkFZ6GVsEO/CLxdPu/u57NpD22Ly1a65+kdI1UAZsw5xZlOec8Zi1hldH3aGaRbY8qDHHhlqHGf8TGtdkAC13N882Q2USEIsJSDyy8PLcnJmInQrKb8dcwtTtQEhTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnpYdhy+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnpYdhy+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso51966805e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 22 May 2026 03:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779444627; x=1780049427; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ksYNE5DgGi8aj7hSjdkwqCdfXo+PZrlzO7PfP46SpzY=;
        b=RnpYdhy+bzbYrqzy6uw6pFfgsGKs7VZhW0Crea3JkSmhYM7lk0JGXr0IGa7GnRPPDg
         Kq+t4rD+gxncYSUw4bj6X0MJMQYZrvjfv/JK0/YeehEjzd7fbOwhAP8wf+BBjwCn2iTS
         xHgOpMrysrPabCsb7FvnVzz8fYB5GymHuwhEq5EE+o1KMZNRMzqhZzLjiQYs87+Jzf2k
         ecQsmUKZHGbNRjK1Y9QE8XeT3Fy79K+r4EBdNogP0c4dj7e7SVejHI/L6zLuQudrf71e
         kWP61PH5+rBtdsqelxde7DAlIQGJJDKNr0QTJutj+2eyJZ+mHOdukhdXBVjKi4AeikFv
         0z8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444627; x=1780049427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ksYNE5DgGi8aj7hSjdkwqCdfXo+PZrlzO7PfP46SpzY=;
        b=dmrIGmefb2FaCXCTLqMcdnoV4nMrQwTPhE2x8mmcqu0eU05DaSmoZ90CBpgXecAJ8T
         a0GPSqXiBveLuOWbdYg+lw5t+W2NR36LE370UuWtOWIn7tr3ewqmH8Bq0rogpKWMEdk/
         Bmuyu39fifdZznDyvUvKTwXGBEwmW3yAJexqQHOw4yVdLzwISCh8g16LOB15ewGpTTZ+
         UvQoPZtvrqgvx8/Qc83D3pMbcxO+vQpmELn4SZHWppgrc1AnZzhlMF5As6vFWbdmR+uA
         oNKvdiOYij89oJ46UG4i+vVKERX6w5lJhNCLIwsirgLRQauuD2/aaPi6rSQDg8F91V+q
         CcTw==
X-Forwarded-Encrypted: i=1; AFNElJ9iXIq5C+hSKI+EtyZGiJsfaZGiHbfB2L1IJFQ3VX+/v0Y/ONu1jBbxdmKkI6X3rE8sCLi6bzvSo5tQTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSSCcX3azcVPa7gtMyX/pqzNnERI6DHnbkfXwnqF+/qkL2DU8x
	ONlzSKdZw9Rpjnt6ajKveDFuOBM6Popg2M8IvD1gV5LGR+Nut2ElKXkb
X-Gm-Gg: Acq92OEbBQ72ocEBQBTPbE/daCbT3np7oEvqzWPEm1rGh5nIwfGRwxWBor3CXIKRW0i
	qchoDfbHpOFbKVh4L/1Sb+mbN6N/gQeYcOEgAt9SWxFjRsfwDodHAA56AjxrIx/OSVRAlUW2QYT
	3Vw53FfrYHUazo0ibGf/I3gWQbVLbm2APr3ntyM6NoIioGakZGnKEZiz986LPVFVlI7fsF9fxpz
	gJkMB/tUImau+abRbSwd7V+Fndyz7G6dJ9C3iwFccP2k4BzMjxro15j6tLzl+jVzzZ+9VZift8X
	NKsSY82CgJLzIkxb3fWpl+iBiE8LZYTcmSYLGxCNteEpUdlRYk4GE9DDLViyeMMxj0qulYMLQEH
	NgrurmwJ5n7hv23oBtpOblvzt0uTmz4+V96lkJnPR99e9b2bvtk0YTI9DevCT++XT8vMAKBWaH8
	HI0cak7pb+oHjIEzFeiNtPQ7tXMFIerjJSFTgrSHAdHOGaTY0/NBLIR8v7RUxLV1Zzb56cV3vwt
	VaZ4ePMylX7Xw==
X-Received: by 2002:a05:600d:640f:10b0:490:3ff5:737f with SMTP id 5b1f17b1804b1-490426cefe0mr28149535e9.18.1779444626854;
        Fri, 22 May 2026 03:10:26 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d4850dsm2798642f8f.17.2026.05.22.03.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:10:25 -0700 (PDT)
Date: Fri, 22 May 2026 12:10:23 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 03/10] dt-bindings: dma: nvidia,tegra186-gpc-dma: Add
 iommu-map property
Message-ID: <ahArhz2rJrUx-3As@orome>
References: <20260331102303.33181-1-akhilrajeev@nvidia.com>
 <20260331102303.33181-4-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cfuujhnhen7f4kbw"
Content-Disposition: inline
In-Reply-To: <20260331102303.33181-4-akhilrajeev@nvidia.com>


--cfuujhnhen7f4kbw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 03/10] dt-bindings: dma: nvidia,tegra186-gpc-dma: Add
 iommu-map property
MIME-Version: 1.0

On Tue, Mar 31, 2026 at 03:52:56PM +0530, Akhil R wrote:
> Add iommu-map property to specify separate stream IDs for each DMA
> channel. This enables each channel to be in its own IOMMU domain,
> keeping memory isolated from other devices sharing the same DMA
> controller.
>=20
> Define the constraints such that if the channel and stream IDs are
> contiguous, a single entry can map all the channels, but if the
> channels or stream IDs are non-contiguous support multiple entries.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/dma/nvidia,tegra186-gpc-dma.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--cfuujhnhen7f4kbw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoQK48ACgkQ3SOs138+
s6GAew/+JcdwaY780zCzuK455YnQ+eLwg86S3a4AOS3x5iG0/m8f2Amil+VB72nZ
ci4+qK7+yV8+3+6uldI0g7LZDzGflpyZrUDNuQLCfj+vYmEb61o1JoZbNhoE9+ic
nag0sS5coucJKY2Gc3RD357norEY3DBhMNTr28tn58ydg442Uq2gx/6ZVK9GnYfF
XgK3rr80mq7WB2bVqK3GTiC814TPhlldNXxFxqRV8y4h/D764MMQ9qHocmgx2qW4
5I8InPisLbTCb8p8HBwRlA3h8YYMsMth3CHVUXXkmTb8NBEmjfQnoDWB4pxmIpf/
KzJb+/Qk9OTBOhy86/zUp+fCY4KZvNKcD8csC84lEIzPzUuRcIFv6ILoGvzUo4EO
YwuDJpsMrOf1K1K5hHm9qGugZ2DBSK4Vx4fOUBWoZIjGH2/TRCg7Pn6JBhJuT5o8
hThxuFO8909jWAoKMknu1oQD6ShIuVj+FbDWHhYAlbI5Dj+mT7QtQ1z750r0gtj0
2RkRveEDOOUuv+Zla1iw3NQkkSLogplGwIp/OVbyzkNCkxClBkWP/7/D2c9+ZdOU
orMrAVeNg3+t+xWUKNNsTIJs7UHY/Ijp9T+msaNIZnojc0XnIGHfcTHDJIWeXhnD
Ze6C+O9gJTwgdsYARNevxitPP2/O4tnp6JP22PWc6ueoyrvbSxA=
=xacF
-----END PGP SIGNATURE-----

--cfuujhnhen7f4kbw--
