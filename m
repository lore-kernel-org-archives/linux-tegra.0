Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A79B3C3448;
	Fri,  8 May 2026 10:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778235846; cv=none; b=gDeJb9WQZvK+n+UTYaQ5VTRDxBVmAm5eRj2UPbJgd0MNTUJpPhjJdfemLyIxz2Ekdom/UtKNRmVUlFErx5LXaDsSRprIhYtQmB2/SE3KyENJeY3CxCQ1fygOObaHB28LRuoImmOVlBDNIhKdNFr/gnTjZBmVw9GzoIzjYWseefk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778235846; c=relaxed/simple;
	bh=tLbGCaMW7HS2+Ed/xbt8mxA3kcVWU4kqWs83F+SLhDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3znKAnWmKBHKBhhXL2+w5baFKtqY+VC23FpAoApKYbCBC1C7NLbXtsqIGFSxIAucRXyLO3RHRsKQmVFsd1lQlR80xI82H3TFu1xTT+H5e0ZNsW3PlWR832gz42fN4gyoehldEaAtLupSzTYGktmqtLGi+llHsSBb90lxI0ve4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TPzekmsG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPzekmsG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B312C2BCB8;
	Fri,  8 May 2026 10:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778235845;
	bh=tLbGCaMW7HS2+Ed/xbt8mxA3kcVWU4kqWs83F+SLhDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TPzekmsGM75H7czsrKkPP9QYX9wFITvRgAisdd2I2rtu65TMN7lzlps+QUMs32xa5
	 gfBjm0ho+WxwlZJ9nkKzuLSnJWL9SEEvWGc2py9M6Ky5Wh/DlBxfeO1aKKXr1M6/J+
	 ct7aATl99TYy+Dve6BVDL7qvLMJTu5HRPJk0Q1HUNgfGlsI1H8tHMYyXAbZFMmVBtb
	 oj4A9d3cU9dmOkXL15Y2rTZA0sf5RzaLxSfN2ARP6WpkFrWETyNMsiHGg9EQdzYtvA
	 QR2ATWr9brnYD6PCYD+ntqKDFyNYzQVBW2w+nWQwdNCAOwo+wLiluN66Vp6z23Ag7Z
	 25CpDlsapxr9g==
Date: Fri, 8 May 2026 12:24:02 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Saurav Sachidanand <sauravsc@amazon.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Akhil R <akhilrajeev@nvidia.com>, Kartik Rajput <kkartik@nvidia.com>, 
	Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: tegra: make tegra_i2c_mutex_unlock() return
 void
Message-ID: <af24ztuMvHkdyAx3@orome>
References: <20260506195319.44810-1-sauravsc@amazon.com>
 <20260507221145.62183-1-sauravsc@amazon.com>
 <20260507221145.62183-3-sauravsc@amazon.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fanibai5f4hjr2fx"
Content-Disposition: inline
In-Reply-To: <20260507221145.62183-3-sauravsc@amazon.com>


--fanibai5f4hjr2fx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] i2c: tegra: make tegra_i2c_mutex_unlock() return
 void
MIME-Version: 1.0

On Thu, May 07, 2026 at 10:11:45PM +0000, Saurav Sachidanand wrote:
> tegra_i2c_mutex_unlock() returning an error that overwrites the transfer
> result causes silent loss of I2C transfer errors. If the transfer failed
> but the unlock succeeded, the error was lost and the function incorrectly
> reported success.
>=20
> Rather than propagating the unlock error (which is not actionable by the
> caller - the I2C message may have been sent regardless), convert the
> function to return void and WARN on the unexpected condition. If the
> unlock fails, subsequent lock attempts will fail anyway, making the error
> visible on the next transfer.

Technically I don't think it's guaranteed that a subsequent lock attempt
will fail. For example, if the SW mutex was somehow held by some other
owner while trying to unlock, by the time we try to lock later on that
owner might have released the SW mutex again.

Obviously if we've managed to lock the SW mutex but fail to unlock
because somebody else was holding it, it means that the other party did
not respect the SW mutex protocol, in which case anything goes.

Anyway, this looks good to me, so:

Acked-by: Thierry Reding <treding@nvidia.com>

--fanibai5f4hjr2fx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmn9ucAACgkQ3SOs138+
s6HqYA/8DeUcRvmUFCv0lt/fI7UyBsRfmZxiHpdO0u9qySfmLKFULYKYKWRRmztx
4KXWsxo09gornmPydTuk7ce8Xta/ru50kWkQ3Pwj0UqYemgYPS4OPRwautaKSGsL
N8E6+b13h8+Rz1vTx3BbI9k/NDKF/evF1LxYcpuZ/JuFIRenwAZYt7QAYqlSfUn7
ZbxxY9sXixZQrfKC+p/Ak7dMpUtyMHELLPxoppNyqbaLrjzCPRjXSbfQt15g46j8
C6SdHKofs8cfjihbGoLSWyI6vXNQ+ud8VtdAiBv85fAk39npxffd+5BI1N8O5rp/
7XHbx/MGPgSspJ3uV90EK6IUdSR2OlEzO0us4Zr5/IQWiRln7+zbvoIJF7NBWoyx
ehuX7sdUzeNono61xsopyBG023BRBnJZkSq2L9zY14/OlYjLEDKDQ9qKEIvOdLlO
H8dUoSitVyx3X7lXKx84SjKfZrBixa/wboYe17jp17+hXGlakt6VFBkhBcObTIlC
zAEsp4caYNOZXLRp8tmYSCQlX5vMeJrvDg/obQ7TVF8MUR7wH+ls3lTiQZvcklNi
T4CQHog8RnUgEetsn+MZ5Tf2aUq0cqkRqcuXNXKlB5ed/QODmxLHmAShtU2nUzie
gTP8//gYJE9pZsDj/V6Q/8CYn/LL2/Ao298eV7g1qwqWGkmBl+M=
=DPJs
-----END PGP SIGNATURE-----

--fanibai5f4hjr2fx--
