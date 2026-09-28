Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABDE4EF130;
	Mon, 28 Sep 2026 16:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613540; cv=none; b=m17IWHhb5WPJMqcYxJ0hiEqfCwixxzghkKVaHSGBcl8/la5Drn0xicr69uwqi51Pjf3AwatW+rL7IBb7TiOlOlh3XM3LSip6pq3L45LLN2I/EXnQ59YQ9d8JzIl6UujriZE4AJj4iNHzc4QM6hgT9pgv3KZG5P0fLmZWCe3GvOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613540; c=relaxed/simple;
	bh=ZtFcD9dDy8Ns8wujRyXoCai7LHrcQP2Mng/vMzHQGYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0DmHTJVy6TmAioMU1AH/7fX+eolxfwymFDfIc9DruGBAiKWyvOoKCHTQO9FzWGh+OiY3NQ5i0oGL7etbk2tzoVmBfMrdRobNgkcomkpRXLIzEu0kxX+RTbeykWCFTKMg0Meaf7erjOo/b7f+dLvITHuzo1Cg3DVTPVSawnhX1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=go+gzpOp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="go+gzpOp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F26A1F000FF;
	Mon, 28 Sep 2026 16:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790613538;
	bh=ZtFcD9dDy8Ns8wujRyXoCai7LHrcQP2Mng/vMzHQGYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=go+gzpOpBvx1mGpjBYXWajUUizHF/j77bLG/W6wYn7pqtSJxctIALU3zYJdgC0QTs
	 awtGSRHrNOQm7rCDKIRA7z/3BErK0lw08NcRU3MsqJLuZUvaOeHHUIH5IeB9MvtRsC
	 Uyfgr3kbl+elnYZgCsCjCyha+G6I+NMM31VAYuAPUlvmrg6b361lfY7JnZ0OUmU4m4
	 ibSivyuWyJvNyhUYnQcV2bq6UB1CBq1zXWpOjaoYjy/YNTdIKatbwjJJShpZ1Hc8FV
	 lD4UvJN8Ks0odUDgGUcnrKNbPv60bfliFsp9my9ojZPz2kQMEfNkDUVZgO/F3kOSmI
	 iviD54rZUJfOg==
Date: Mon, 28 Sep 2026 17:38:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 2/2] dt-bindings: sound: tegra-ahub: Convert to
 json-schema
Message-ID: <3f5e8785-692d-449a-b1c6-6a2b8679239e@sirena.org.uk>
References: <20260928-as3722-bindings-v1-0-35f423a9f2b2@nvidia.com>
 <20260928-as3722-bindings-v1-2-35f423a9f2b2@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yXMPISHdeW+LmfrK"
Content-Disposition: inline
In-Reply-To: <20260928-as3722-bindings-v1-2-35f423a9f2b2@nvidia.com>
X-Cookie: All is fear in love and war.


--yXMPISHdeW+LmfrK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 06:24:41PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Convert Tegra AHUB bindings from the free-form text format to
> json-schema.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--yXMPISHdeW+LmfrK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq6mBkACgkQJNaLcl1U
h9BtmAf+MByjhamJChEoE4jSBrcxviNHKOCvYqv8inoXbjXe/SGDa013k4ogX4jK
Nk4r5FgtLey4RUm16rFcDbhvoyWoY1GKdhbOYOCAehrlsj1AKZ9W9dE1dwmyniGF
X/vK756vmpMTczkJnJNO246yw7hkGOWqY6jNYtoNRbjePKo0BaPGBeoyWoBtrdTv
mr5tTKOWR5CSIE2gUfZBDRYc9al7oR7y40j+yBV8fokKkEp1nKEGQypGr6uwWT+J
gLstLrC/Jl+2iO3q8B33LgaxRJQu3Ysdb4R+0NwoR9QXff3R1IPzVg5Znta2DJVf
V0wSVAPmhPnUu3jRsxFdtyIgnc92Ig==
=s+s/
-----END PGP SIGNATURE-----

--yXMPISHdeW+LmfrK--
