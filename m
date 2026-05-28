Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A166737F00F;
	Thu, 28 May 2026 12:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779970167; cv=none; b=q9w/jxNmj7V8mL7rsZ0ofggttQWiW1ea1WOpUvYruWkFe9M8e0jcJq3SGK/8s4u7sHReKO6iKk7P5mmlH/AVSFwa96VzyMPDDVDlNpesXTYY739hhif087NPYz59mIgRClWoklTAy9hgtaB/64ojZgFKXIGyycvUtVCtN/u//XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779970167; c=relaxed/simple;
	bh=8bY/o/O10DMH1lKbmb5R8CQrxM/qm8tbdI4/wFtdzrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLB/VdkMwAbcBIpMzXeJ+DiZqrNb6RrNuUsVMozraZOoA2nFgzfHRTykS45hqddlcW9XpFd4zxSHDxeSjzxmIouy9x0TYOt5YuMWgNdIBOzx8IAb/E8dANkivVMzow++VLo6aETakud77r1aBVqaOa9+wJAe76r2t2EyMzGBxbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KbM4Fwjo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KbM4Fwjo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF12C1F000E9;
	Thu, 28 May 2026 12:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779970166;
	bh=6EsIe6+QcTk8dNWj4zK1Rd5fuD0TttLl9s4Yfx92BeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KbM4FwjoMr5keIYGy7CsRrRWFBXa+scPxzlVNJs90A9xACLh8MwMhWzi6xtDEerQt
	 4NWV6PEclMG36IGwGM/x41Wk26FbKE0kbplDFSdr76fyr9eoUfc+7k6Qpym+NHOkol
	 liT1jwgNPTbzBlKnmGMHLOytmecI77kC1dI7stKni+WeSxvojO1RW31gKNKWlpbWLH
	 Pm9+TjKfHZdLjS5It3cmbqpKgI0DdB/FNO9BvrG1Cxg0O+6qesFja9YfQ39KFew6DV
	 JzEW9XzIky+1PGhY1uHTKIKvCg7sg8rRBQ1yVVzDVXxNOTQ7HA+dr6kRkc+3BCCOco
	 Ip57rp+XdCr3Q==
Date: Thu, 28 May 2026 14:09:23 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/tegra: dp: use str_plural in
 drm_dp_link_train_{full,fast}
Message-ID: <ahgwaOX8TJlpZP0u@orome>
References: <20260521194658.366737-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tuovdn66hye2i6w4"
Content-Disposition: inline
In-Reply-To: <20260521194658.366737-3-thorsten.blum@linux.dev>


--tuovdn66hye2i6w4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] drm/tegra: dp: use str_plural in
 drm_dp_link_train_{full,fast}
MIME-Version: 1.0

On Thu, May 21, 2026 at 09:46:59PM +0200, Thorsten Blum wrote:
> Replace the manual ternary "s" pluralizations with str_plural() to
> simplify the code. This also corrects the "0 lanes" case.
>=20
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/gpu/drm/tegra/dp.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Both patches applied, thanks.

Thierry

--tuovdn66hye2i6w4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoYMHMACgkQ3SOs138+
s6GZ9A/+NK7XAH7VW4nq1/fYZDrFrMsV1SkeL33baIKmphllBPJBmTRkJuCsUMvs
Va9CAR+GT93IQy9EhiFuFqndHf/T5o6vSFi/E/fsxCXcU9ss5/0VhPaq3Sa56TI0
vE4+FZoKv1kfD4YcJX/sGTl2tJy/998vPjOWbt0pJYe5I7q6/+xkS59a6OwcqNNW
JSV8nSgwf7L3TyO9uAVPE4RXYZHdFEc0nhWoLWDHB/o3h46vfzHrf3Tz0QmgfRUS
wKtAJGibDKV5DUAEHfA41PYek16aVimm8NiRLQ2eDjeZDKBJOY4oBXtMn1dNb+qw
bB6qtI3A69pniQqIjU3sOW9neZUGz0QLpJygTShtQgyrAE9pEiSE0T80dQE8qUdy
EJm3PtLpcOkqolkxONuwwyJFiJBn5WN7n8aQMaCNSKVhKHcwHTD9VfqugONaidbk
9qKMYZ3m+5uet1p9SfaQY5k7H3/RyGBebdLIy2Whesqy9Xk3Z0s4kqxvghwC42Ql
AXEOC91Vk79scoXt3DY2aM9mPW7N8nolNAl4QWzRaHq+lrzWS/K/k0cYgi6C8M17
JmPtQmPUGacvNU2J4uHmLuzPoZD6YEAf+L/87Zr8itnGNUYxfjoj8OvbOs3d+6Ec
x9SzlHNQ0MnQRpWeuJxamDZQ72l5P2tfkrb3IEuky93QJeLV1TE=
=mIBc
-----END PGP SIGNATURE-----

--tuovdn66hye2i6w4--
