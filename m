Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C1D3BFAE7;
	Fri, 31 Jul 2026 08:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785485166; cv=none; b=j5vC1nv6VR0n7urBYafWp8Io2DRYWl05mMG2aq9rJQ7AWQ4LA1SyLbjCb15uMfR7dxVrttcc/U4W00w/WWo/CNwP+GsfsSEER4+lufUmPn0kxdybngFghiK6IB3L3E7ui39JBGqh2U2NwXVrDXH7o9dYcNbWvfcWb3CvaH+deXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785485166; c=relaxed/simple;
	bh=MOlTbE4hEy34g8RNe+LcisliDOqQjoDLJEiOxltqoBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ulXXoiCxNXaMz/g5swtn/MaWVyq0gxTudfN4kIt8XLQ03MVIE8Dlo8QABWCPiHfhgjknrbmQ/gcKvf/40tC7yFPuj9mX/i81tZi21+LunGNhixYoSmpEE9IpUp6h6k0vlEVyfHs0q5qNpmg8UFNE3x3cyyIxsB2gnIIyoZKWsoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qq0bplfa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qq0bplfa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E821F00A3A;
	Fri, 31 Jul 2026 08:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785485165;
	bh=cIjBkD7yCEKhRZ/Xal8jFs2t7PdXu7Ex415r/aPCl6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qq0bplfay3V+vLv7SvCoYco9ZyQZf7VyxSOI7hqfxBZhPK1gnuCsj5d9pt1h+dFAQ
	 M2cvZ0aAtSuxAtr5fUvCrz9L0hLNgk7YCp4i5armMKT2FpSgDkp+ONw74bRvqSBm7V
	 tBJo3UMVGiX03w9GGC4CHFd75ku3lX05rET83H3OyDpg9M9uR+77SShQJCHCIJ5XxJ
	 y03Wt9r9CW4gtpCMfk3i2c+Y5RQRqm+4mqws+2aBQ1Dhx95BMl46F9uWW0x4de8muP
	 7ZUk3Ph5LPYQaVsyURxS7RQCGp85ISfW/EWhBi+ZiQZ7GUJJtfPlT3unCfZqci3Qbg
	 GeYhdZfqtlvWw==
Date: Fri, 31 Jul 2026 10:06:02 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jonathanh@nvidia.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND V2 1/2] dt-bindings: pinctrl: tegra264: fix DAP2
 DIN/DOUT pin names
Message-ID: <amxXYyfyzeuudR1x@orome>
References: <20260727141121.772110-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iwpufnrdag23qqng"
Content-Disposition: inline
In-Reply-To: <20260727141121.772110-1-pshete@nvidia.com>


--iwpufnrdag23qqng
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RESEND V2 1/2] dt-bindings: pinctrl: tegra264: fix DAP2
 DIN/DOUT pin names
MIME-Version: 1.0

On Mon, Jul 27, 2026 at 02:11:20PM +0000, Prathamesh Shete wrote:
> The DAP2_DIN and DAP2_DOUT pins were listed with swapped ball suffixes:
> DAP2_DIN as PV7 and DAP2_DOUT as PW0. On silicon DAP2_DIN is on ball PW0
> and DAP2_DOUT is on ball PV7. Correct the pin and drive group names to
> dap2_din_pw0 and dap2_dout_pv7.
>=20
> Fixes: 30a9d5162f25 ("dt-bindings: pinctrl: Document Tegra264 pin control=
lers")
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
>  .../bindings/pinctrl/nvidia,tegra264-pinmux-main.yaml       | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--iwpufnrdag23qqng
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpsV2oACgkQ3SOs138+
s6HsiBAAhUFENwyzdD/kqOdTkHA1KoQDaV/ETaeKD4rCgAr3pQYnleWeQY4mnZlw
z33xvmg+dhO5lR6xdWzjIequlXZB3SfQDR8kWOS2lnoYTqXViQuVoNlC9GJo4DxR
vlnrDEVtfqVY4j/Aj6o+/sVTNb20hmJ2t5GzFBDoZI9rHGiZL2X2ng/LwWUyrZnR
DApc/2zWu4R9u+6PDOkFcxrvDqV++g2poURfaIMsGWsoYniukuJOkFXGRle6ZZ7n
q4jDS8JxhIENH0uCWvQzQrcf/aZa8A8K8oQEC+s5rnSyP8Ng/BVWkri0XoJC30Z6
PbSDEu0qoMhO0flON65E3I+WUOwUpsvtC5L7Ig4fWgMJEecAqRUMyMvIVbrZXkOH
K+F/1hRyLlT4JmK5rCEM3i39iD3ofqgbCcs1Ndz+Y9I7BKDyAkmmituexZv6rxZN
gI1q8mkxoB1V2GttPxnXX5GuAt/Lj5CzQTFUegB1Rz/OgvSIW3n+pV91iC4HthnZ
JHSmz5lOeJ6BAyTl4X0kpQv0+R4w/4Jt2mX9zSZuO7vOi80Q6GYv/vuyQh6YiPg9
U8g75m17+LgC/rme/uhDN38wu6dqbuJ/XgHd0tDFqGwSifvinz7eLsROJlJlxeWy
wciviEfBi944szIdCzZTdPIq4z2KoC1mEiKfj+V48ptap15F7ew=
=y9G7
-----END PGP SIGNATURE-----

--iwpufnrdag23qqng--
