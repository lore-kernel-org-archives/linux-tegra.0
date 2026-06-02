Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2F83D5C0C;
	Tue,  2 Jun 2026 12:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780401711; cv=none; b=SQEEENuP6ywSmRamts3w603rf273QmsRojQoaDKwoeHiiN83u7pHWPmTp3G2kXZzVLdDN0IwlbnxU+pEy9+SXRarva6xmRlxZ4NGPi5ofBtsc8QaBJ+720xxo8x3h0NbFbd7WkywoN5OuWZDpUXWrbIS/npwqlFGLQZRb1mSqTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780401711; c=relaxed/simple;
	bh=Ztw6bJQRorBQ5C1ddcJR7+S4DjwTN7r34fRjokRX9KI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mfLWmTiRLSivJTfT00cogKqTBGOYzsvkEModnYJc6bdNcVBU/KngqyNVMjLYQ+Js1GWx3tUMB7hRcTFyeiVpi3keOUxOO34cSdf1xaiuM4779u817G6spK8j2lY2+bOjYaYP817lJ1UrgeJpLYQUe4fZrbnLcuahOE8rtQ4Pnxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nq7N7YyV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nq7N7YyV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF1741F00893;
	Tue,  2 Jun 2026 12:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780401709;
	bh=0WQjvheQqNfkhSEyJ+TWIIsGmJeZJhbd5i3NzXC6q78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Nq7N7YyVxZ0hDitwnGYzIZRzYj2FqtB6Kh4TpyOEXlyDU8oFQR08EOkNtKf3l3TtE
	 6YXwxlNqQ1zkHgpbL999bnu/G5RKFLhspWyIaZy2sja8zwpI15veyjb5Zb8X8rcBlv
	 9jTMaLVBZvf/GaTQvywsiPYv9tx1e3Ip++0KsK/k/SumIeHKrQy+0UMlnhp0AEQYGH
	 4WaViPmP9DBQVXofp7nfnZoSn4eY5rh2OHhTJlCzURZUBsjXmTIu1mT3/NsT4edC/l
	 7LVR6+ObtUduADozaXm8ghxe4T6yGoJ/yV/2J8GGVY+mlL7zfEEtcJHjOMmQVE41F1
	 gMBmHY66Y01Qw==
Date: Tue, 2 Jun 2026 14:01:46 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Timo Alho <talho@nvidia.com>
Subject: Re: [PATCH V2] clk: tegra: Support unique names for multi-socket
 platforms
Message-ID: <ah7F_QDw5hT2KdWB@orome>
References: <20260602084334.350895-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sdpaxvxqguigazve"
Content-Disposition: inline
In-Reply-To: <20260602084334.350895-1-jonathanh@nvidia.com>


--sdpaxvxqguigazve
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V2] clk: tegra: Support unique names for multi-socket
 platforms
MIME-Version: 1.0

On Tue, Jun 02, 2026 at 09:43:34AM +0100, Jon Hunter wrote:
> On multi-socket platforms each socket has its own BPMP which exposes the
> same clock names. Fix this by using the NUMA ID as a prefix for the
> clock names on multi-socket platforms.
>=20
> Use 'sizeof(info->name)' in the strscpy() and snprintf() functions to
> future proof against anyone changing the size of the 'name' array.
>=20
> Co-developed-by: Timo Alho <talho@nvidia.com>
> Signed-off-by: Timo Alho <talho@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> Changes since V1:
> - Use NUMA ID as a prefix and not a suffix for the clock name.
>=20
>  drivers/clk/tegra/clk-bpmp.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--sdpaxvxqguigazve
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoexioACgkQ3SOs138+
s6FX7Q/7B6njJe++FK2zlBoPX+GsgPxay8esyep+M/M4fVvEi0udlmOTZH59LKZD
HJPZC8iySP8IZS5pXexdOKT4taDzaMPxS76ps7sNxKIVuO86lwU+cxlmMypl5qG+
3/6oBAwkQwdYRSSVgc6FJR6d9X/DPqxXNBg6nqdg3dhxrBHH2v5AIDIIRZi3Xz7l
fzQCQHIXawPWW/W4C2W8/mUnFx+Usjzkq5Vep18qkhvnztE7Q2xyMtV+CZFbkATw
fNlGYfiD4Uw9ZQBQ0KUwhxsIsm0EfgFS2Iv3v83e20XR5Umq6LATuLxgKwKMMz/q
WDWL9hiJATeFKLFl6bvPOEJ7SsNc6sXNvWtHgkYBl2MI1bXVK82whrWOFKXBFMdF
wunlP3g436p4EDEEynhvfIX9bdz5v1O5ypx4UrCPk4cHBAJFOwt8TLaOxvc2ysVJ
dslf49T5iCl8/JvqBeDTeidj+bcjiCnBmO9Vi17a3s4rwMcLxDRA6eZQHbHLUZQS
icBAtd8yidgvt4N9GFjV2eAbSugCiTLdc+pSJeRDxCUq2oPi3BvYtBhF9jbFkIDY
xZQQXrE0Ve61gczmhqVBX63ZWWdnQvafmHB7LtqvQ6DFlnlaT2LacBqw8ZhPPwGz
PyDzFZXRCNaQpYh9S8g/AKdk7o4ZxKoXJbrthjbN94vT+UzuCwg=
=tvsi
-----END PGP SIGNATURE-----

--sdpaxvxqguigazve--
