Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBB720F098;
	Wed,  7 May 2025 15:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632229; cv=none; b=Gcs8WT/7qI71mTm1VyfE8bHKiH8V1gYqadXfOdR4BTdxNSIk4e9Wq8ejt5B53wO6WsJe+pD97K6x8zRhuqNj+fpqEAzsbqG33mCoj0FZhdZ5Khanvdd0YoNRSij+Ej+CQH9UQzIl4v/tsWH7KLUozo0I2Cdn5sIUiE5zrpXCieQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632229; c=relaxed/simple;
	bh=YNGV3UrddmWkuurPhKZXzcW6pR94Ijzbe+6jtt3L84U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P3/B/kUHs8TD3F9V2Z5ub9Q8+bN8Wnd4hMbIl87ljxXZ4YFbs/DSppokJ9xgJdRETPk9Q16XBuM1T8LxWU8Ow3rP7xVbQ5JDnYuMfj+hzOkprSVkJwP9GX7US/y0Um50J5VuohX/WxP4wdFyzwTsmGHBSKVJNEzTdvf9yLWac9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R86sbaUP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R86sbaUP"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso130415e9.0;
        Wed, 07 May 2025 08:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746632226; x=1747237026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YNGV3UrddmWkuurPhKZXzcW6pR94Ijzbe+6jtt3L84U=;
        b=R86sbaUPTP8niNfJfwXvQ7xDiDgypjXOe92MYhf7PYMoBIXM8dB7u/mkLGMxD8sS3K
         lehuPyswm1Lo7NBeSEToL/ya9At4zvC4wpxULXWpPVbzeappXzPW8xwVWhu7UN5/y7OE
         9JpMA8Skrk/6f+LBX6wEgYPU+7T2nDTeMm8HsGuEbpBzKikATrrbnFOlFBSEyyni1rIB
         CLjFOXfaMtmmrjvuU0FG/jV83xg9vfMBY5DCZOknk/pZ/+12kAvA7W5zElrpg7apg7Qy
         Vh5lEa+0EBmMFB7dE9eNs9RKkYynGr51kSIlWThZQvcqS+YpZpfgeoMbd3DwYZG/aLhT
         37Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746632226; x=1747237026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNGV3UrddmWkuurPhKZXzcW6pR94Ijzbe+6jtt3L84U=;
        b=ABS1SX/cI5pZ8S8zXt5OoCKO7Grye3BghJFzyCUyDiTPdmAyReQLCXLsBtluyl89Td
         9gSzX3D77sDwRGOydU0XQm5uzF/ZHduk91bGeIz2Y+NgSazCTvAEHibEgNtr39BF/wOR
         FlZySZeCxTml/Zsf2lf6KqtZDpEA0Ko/wreOmuqtLVTK/045STlWhcc1UzsuV+kf0d0t
         1GpLkRl3dW9WLdDaABSa3S0zfCzd+KcBYw/1xYe373BzZGqnuSel5XrJGMDMd8hzasXA
         c889J9TtDJpQ2SYcXjDhufrFFzS3dKbQlZir8ISSXYkER62YUDDg4oADj8PBze39H6G3
         LNbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBQuAhXnVskUNupYh9Vf/v3Vk2FD5sHNYk4pG83GDEDoankjjfXhgDwMrz/6XF58WpHAtW2EKhsJOp@vger.kernel.org, AJvYcCWDIWkhT5ZEGZQRk2ea21GR9crknYPZqPNs+RhlP8C9veElIWqoUP9Z6gvdAf/N2+a3VdErdPdzVClInTro@vger.kernel.org, AJvYcCWpu8nYvppmCmgBkK93FboQbvSXP8eYd5lXnaNT3JCYPvo69suIJDvXqgNv2D3LClnt/5iKOJTFY2gC6dk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDnbLhBiiZYuk/WA3YP9Vme2GNU+4m5ey+cMZAukCJFVyhfjZO
	AfQgCFIOMb73/Ru/xOplJcjcxyIuggE4L4XvhyfaJdc8rponCrB3jpHyCw==
X-Gm-Gg: ASbGnct2mEPnK99PuRb1qvPelrpnJZBZrwCFFCpbIboQn6M8aVQP9WyrqSs4U+Un5wb
	Ckx7Fvl+dJbkyA8FDzbs3lpHS9P5dcFMoy4ZRFpCCcALiRO00JkfIb84uzWvOcmOttAfBOLzIcr
	iD1KCDGJAHgBZeypqWx0wiS/tT5ldAhf/KNGr+gny2WcVU4GFPA6fT/g9MwQa5F7dTKH57maZre
	pYTRmr7gloHdtDGcBdRBgccKVRcFYpsHsic3alMLz/OLm1va9OUzffFH/BCgRenkzOPkhg/Eo7P
	JuIYFfikZGV7Z/HHs/fVDaGfW1S9TcmghXyXkHE36uWVrBoAEJHCBS4sOfyBI80kP6/ypA5GkyR
	Nsny0GPx8BMPvf0IQgq8wFhcBAPM=
X-Google-Smtp-Source: AGHT+IFIkzQry8Hjhz41/L4p+b2+NdGa2UsYemZZKxxpwJR8bryywhVskPEzNfnmokI1ibLfpZ1v6A==
X-Received: by 2002:a05:6000:2406:b0:39c:1f04:bb4a with SMTP id ffacd0b85a97d-3a0b4a0338fmr3409815f8f.10.1746632226280;
        Wed, 07 May 2025 08:37:06 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b7d28e96sm955978f8f.9.2025.05.07.08.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 08:37:05 -0700 (PDT)
Date: Wed, 7 May 2025 17:37:03 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Bump #address-cells and #size-cells on
 Tegra186
Message-ID: <vegicz45jspxecpaitgju6ivvrefwoufg5yrzlvxudjatno7cr@rnvnqrmqofsk>
References: <20250419-tegra186-host1x-addr-size-v1-1-a7493882248d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aqhlt6wkguwp5ozr"
Content-Disposition: inline
In-Reply-To: <20250419-tegra186-host1x-addr-size-v1-1-a7493882248d@gmail.com>


--aqhlt6wkguwp5ozr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: tegra: Bump #address-cells and #size-cells on
 Tegra186
MIME-Version: 1.0

On Sat, Apr 19, 2025 at 10:30:31PM -0500, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> This was done for Tegra194 and Tegra234 in 2838cfd, but Tegra186 was not
> part of that change. The same reasoning for that commit also applies to
> Tegra186, plus keeping the archs as close to each other as possible makes
> it easier to compare between them and support features concurrently.

As explained in the commit that you referenced, the reason for making
these changes for Tegra194 and Tegra234 was so that the PCI and GPU
nodes could move back into the bus@0 node. This doesn't exist on
Tegra186, and the top-level already has #address-cells =3D <2> and
#size-cells =3D <2>.

Does this actually fix a bug? Just making this look more similar to
Tegra194/234 doesn't seem like the best of justifications for bloating
the DT.

Thierry

--aqhlt6wkguwp5ozr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgbfh8ACgkQ3SOs138+
s6EMaQ/+K0kOhNxNExbiLYvdYl6lyUBJTc/Cn7gkVe93UJ8LMvez6+ksUOWiGtgq
1Jj/9VTBOV157q7lW1Vgj3ipyubPfM+AihP071ujqkLbaL7DuX65gphyLu89RjM4
/81pTCIf451KJ5gjwv3k2nViGhDUyBQg4P5sMuzhKlNzFf/0FGa/+fd1jiGqNtmt
1R+8B1h2JDnSmDd46A7eUMIP5n9q85vmhCjDrJJbCvVl/rwGvhZXMlJNSBj5hD1l
aP+NxLvb9YaoafxYXCmtO+1Y9ZmxaS2z6YY0r1yKulxzlA9lGobiR/QzQvUo19Lt
QBJu5YRJDYK7Cm2+XBSnmGS1AsdvOcGEJkqfQlE5z61L+gMUGnf/cr08J8hdziVt
85XiIdPxCEgfLggucnVH8WT54SjfwCoAo1I+6H1kuLOTLMlqava88v5vOTthD8AQ
24jSLudtQLo1yq7NVEv7ftJJ9pdCv837QszBZ72OxLSbDLFLlKpdSr0pX9rpyIPy
B9lOo4tdpKs5c81FijFcwatj38eWP6jc6TUZ0dOE6MAPj1WUbXvTmJOccma9gWVt
pD6nQxFLGBJ/gk4kwMBVtBCq2xWVfHXp+8cpEqVy+51I22bOK3pPU1F9VrpTg/er
FtBmtNCs3YZPtSbIYVNApqP458Ab9milvfwq27Y3E/7/75cRVVw=
=jmWe
-----END PGP SIGNATURE-----

--aqhlt6wkguwp5ozr--
