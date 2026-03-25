Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962633C4577;
	Wed, 25 Mar 2026 10:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436355; cv=none; b=KK4PUhW/57xsn6jkQlAqr0BwCmZc6cmKOBgbtzx7HKcssBnk2350i2FL9dxMqYYbiM8VwrQ70I3rj9ahV5d4dKXfkvyVt2+/zTwJwMYyfwrpqPWu85U3XEvliizoDbCnnR9QR01OH8YCW/fl7XlPqIYjCnUekgxWeQou/0j5rk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436355; c=relaxed/simple;
	bh=7Iwcz9s808z/mU1qSlilMROm/eIn+LB4PP0YpFUxbvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOBx9IhqfNcFPt6tRdd+gMnmHxo2UZBOFxC+eVYn6Ev4fi8B2H+yhkfWosXfjCj8rQmHz+2Bn2IAg1ResoF/zqxJv05wm8wVxxgZAE7WYZomdOxXJzqjcEorO6h2HuwMkdQN+39fs/t5V0ohoYLNgazR8SJG2q/nm/Oj8W44eHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bctRU6sn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bctRU6sn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9876EC4CEF7;
	Wed, 25 Mar 2026 10:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774436355;
	bh=7Iwcz9s808z/mU1qSlilMROm/eIn+LB4PP0YpFUxbvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bctRU6snoUqfa6o/jnqds7BJsGki8pA0AkWYXGknz4b15QHKcdTYuudUQc1dQmKxo
	 S7ndOaZBrMB+xZlvc7NM6uhPpb3nsBY8CVX6YCY/U4PYvW8CX+c9YEXl93MtmpBApx
	 K4d4yE4x2UoT+xVNEr5r2Vv/BZzYXhg5KGhe7xtdiLnQ2crx/JNmzT9AV0vR6wDSwq
	 gvhVkBMed83CB08ZLn9Qih2ER/37gllE3gsUXvzgblLwQT+kyfYbFtQXaN3E9QdFDH
	 8LQ+ESpArndkhF5d7ElWnywPVC/By0ZuoS+SF+rZN/3oznCDQFnsmG3IK8v4eOY8su
	 34+0Y0tIrwFqQ==
Date: Wed, 25 Mar 2026 11:59:12 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, 
	acpica-devel@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	ebiggers@kernel.org, fredrik.markstrom@est.tech, jonathanh@nvidia.com, 
	krzk@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux@roeck-us.net, lkp@intel.com, llvm@lists.linux.dev, 
	miquel.raynal@bootlin.com, oe-kbuild-all@lists.linux.dev, p.zabel@pengutronix.de, 
	rafael@kernel.org, robert.moore@intel.com, robh@kernel.org, smangipudi@nvidia.com
Subject: Re: [PATCH 04/12] i3c: master: Support ACPI enumeration
Message-ID: <acO_PUjS_VG07qcS@orome>
References: <202603240843279c9e8b90@mail.local>
 <20260324172215.31540-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ydnbwbmjnjsuvysj"
Content-Disposition: inline
In-Reply-To: <20260324172215.31540-1-akhilrajeev@nvidia.com>


--ydnbwbmjnjsuvysj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 04/12] i3c: master: Support ACPI enumeration
MIME-Version: 1.0

On Tue, Mar 24, 2026 at 10:52:15PM +0530, Akhil R wrote:
> On Tue, 24 Mar 2026 09:43:27 +0100, Alexandre Belloni wrote:
>=20
> ...
>=20
> >> #include <linux/acpi.h> is added in PATCH 03/12. The functions' protot=
ypes
> >> are present in acpi.h. I think the bot checked this patch individually,
> >> or did I miss something?
> >>=20
> >=20
> > #include <acpi/acpi_bus.h> is behind an #ifdef in acpi.h and your code
> > is not.
>=20
> Thanks for pointing Alexandre and Guenter. I also noticed that we do not
> have stub functions for a few of the acpi_* functions in #else.
>=20
> Looks like I will have to guard calls to these functions under
> #ifdef CONFIG_ACPI.

Alternatively it might make sense to add the stubs in a separate patch.
I don't know if they were purposefully left out or nobody's ever run
into the lack of these before.

Thierry

--ydnbwbmjnjsuvysj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnDv/0ACgkQ3SOs138+
s6G9+g/+LuZP8mpHvXnaAevACtJDkWGEheqiXMIkXddWa0UJAazqokRhVFFxWNqL
KiHVB2TKCmyKj+ID/r0+YQyLpsAJE5Vc0I6oqP70QyFtUpBsvtYESRHg7Kmg36Kl
YTj1voyogdqTiAfPjwI0T3b1cmUoJpB6H2qTG9sZYbbJJ1G8fySmR8JvNHeDkjjf
4QYzhRp+HWbT7uNjc9mOUo/e2bVCGcIrT+usgwGPXq2g9i2Lvfduk5pp1669JbZ9
SCxaYdNcq3aZMQ0G52cMSuOp/70zEpPhFOE0s1EHkVFge5pNoqTkymLAj5Pg1Wk8
PT+bzWX+W+ViFhV//9lQ3Yx0JXQo5ZlIjqGl8aG0rCrA3qg+PgYj9vRHuFv8QoPF
FeEWPSS+QzZPPuF/SktUCTI8/fgexXGg9IN9j1nalAEu218EqtIdw4pH566Zt0BN
FlUqJ0ibFMgyxEzO4JMdueb8Wd4TMsKpdxQZ2INphJmyEHoIMEq17JlOs7d0fDGa
CWdnSDBlNosjKX8oaUZj6rTrmcvDc1un6i7PWBjHbjN/zqfuAZQXiZkRp4Q3DJ4V
g/3464luFjrpt5XkJD3RsiFM+UuT53RKL7vIa0odHNBtt0SOZC4wrx9zhrKCQEh3
6ksFj9We1bqQm7sOxHFtFsfmvI/fnuc1w67aIdJCRevb++v3DCU=
=nNsB
-----END PGP SIGNATURE-----

--ydnbwbmjnjsuvysj--
