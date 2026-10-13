Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9B251FCAC;
	Tue, 13 Oct 2026 15:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905864; cv=none; b=udMZceOfGYeKz3xHrpJGuLZfjhmxOQsBEtSjeUJZ/g7milqdvbin3tF8Af+S8SUd2XKmwi3fl5ymzy/iX12hQGlly8TWFyG8RmaFE5BJCF0+WZjp8DInBCRXrfQsOijPXYr08YVRcnOMyHLS/KK/3TOWZQI2XKYr0kTwqL8Ap0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905864; c=relaxed/simple;
	bh=s2Da4iTD1ly0nZXSDUZrt1T6ZdRWfAW3P8ALaKGjJKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYOSNGkWVBbjEM/pULD7KyKVzP15etU44fgDoaffAZ7VJHBi5oUQTY6NbYcS1UOwNAdMOSO4/JeAH+3nGsf1feUlOhlnwfwpmTRPS3YXySxNnAaXkUhUEWF2ofhaViAE07cTfI5UiqcjX8OTS59SBcYZ+wm8EGfXWpMko18Y5nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ibMAGARp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ibMAGARp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFA71F000FF;
	Tue, 13 Oct 2026 15:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791905863;
	bh=g0v0j3GPIoV5WBVJgFz4OFgpQ37qSKo1OS4tG1mcDzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ibMAGARpuyRzxeZsfJ1ZxatPqrJ3ScinioYonSVO9G5Y+ttiP1lSQUS8Coty6Tyd5
	 eJp5DjdFsuoH1CXveQT4IrIh0t7I5bl/cPngZlGH/t54AIs+g2l1WwHG4ogDOACwL9
	 qFRoS6CizbEWrMgHp6cTJxLN2dEjLFdT9WlSKO6ma8ihv7gQX4t2TfvG88A5PXX5u7
	 UqozSzgAu1Svpn0Eo3v2QDv3uia6CvR2umW5sl7jnJIm3ufv4F1U+2IBc5NcIjkBXR
	 weGjUF++il9ye/LPhsfISms3ysDQkvRqh7c48xaTMjImIZ9z/PXo/WL2dVOkPrQjar
	 7EUE45XGUsP/Q==
Date: Tue, 13 Oct 2026 17:37:40 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Aaron Kling <webgeek1234@gmail.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: tegra: Add the fuse clock to the Tegra210 GPU
Message-ID: <as5QBASu4BxhZfdK@orome>
References: <20261013145210.103565-1-sashal@kernel.org>
 <20261013145210.103565-2-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rpi2rmgxu3mrx2a6"
Content-Disposition: inline
In-Reply-To: <20261013145210.103565-2-sashal@kernel.org>


--rpi2rmgxu3mrx2a6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] arm64: tegra: Add the fuse clock to the Tegra210 GPU
MIME-Version: 1.0

On Tue, Oct 13, 2026 at 10:52:09AM -0400, Sasha Levin wrote:
> The GM20B GPU on Tegra210 needs the fuse clock running while it is
> powered. Describe it so that the GPU driver can keep it enabled.
>=20
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

We already have that FUSE clock in Tegra194, but since this is now
needed on older models as well, I think we need to add this as far back
as Tegra124, since it likely has the exact same requirements.

Thierry

--rpi2rmgxu3mrx2a6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrOUEQACgkQ3SOs138+
s6FLiQ//UlzHqdcmdtoM754i3mPSyncNcmwBSxfIHSasCUhBfrQLOYpvkc/c9CWX
RkWIx6MjZCZ2ryapXPPcMUQbt0C2fp8y+CClREKndIsiUadLSxSctfW/oDlmp8Iq
mozxwUjxr8LIHbRfhrgrL+MFQ7BPr2CQkj3hAJR6SsW6G4GycHp31Ctxsyl6BeRb
lUKjXI7zM/mvJJ/GLiMvWWct2195NueigYugWT+U4/co7CuekhyxltODj3zQ3DnC
UaFmi48VYOSTdXvcJH1AeSG4d56JUK22NkUmI06/d8N78B7bdAF/xJcW9Lb0G69k
536QVNX+vb4M36sxRKU1A36/Z1aIdDz0uvtTuU/AxqOzp95fPw7SHC2VaoHhGD/S
OaxXKVxvAwFH0kZ5E/6hZ9H8SPfVTxeBmlF5xivct+X1xm+3Mt0c0NYGYOpEiEv4
v20HR+wxs3JFpSIRhg3HoUgPkeJ8F42XTcrmYxUNee7gfYpjoMn6b2mLNtbPf93R
NifsPLgSAfwigv8UgGQGVWbEbwKr7D8vmG7tNWiGxlz1VGhEMQxOYEB4W1ORyaEI
Sn/nyHHRWVoMCLVVLADlOYHBy+1RLu3lye517qiozoDiF5cMUSSQrk0cTEXDG8nV
rHKdk2aVlW757CtgPzhTGuDoWr38eAix5qFBOpK8NKpR7XTtz5A=
=mQbV
-----END PGP SIGNATURE-----

--rpi2rmgxu3mrx2a6--
