Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B3A420E89;
	Mon, 27 Jul 2026 16:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785169449; cv=none; b=XdilAFB+XsToltd9+J0YEbN7qaxgro+gViI+xxN6e49Ce33m7zpCgRKUtV2fk8TwE3nasUDmYXd8wKY42KgCg5z5mm73QMnqtV/ikriwSFvO33tdxsvhpFT3WU0VPYhDqnfROqKwhmer2L94SYQETwdtjKGabvpQbLVsb88LzxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785169449; c=relaxed/simple;
	bh=hnlLaHHGgdJk9dJXwr/8Bp+o2gpo+EYxsAgavievH4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QtAnJtvKynWd3ebzjPND5cs1aFD/hAmee7oQ1iG4BYIWHzg3Sy2DNm1hogVuzkE/dDrERoEqyt6XgQD6I7s3zIsMgxVNxGbrxTp0eUrUzIGOu3dz9IpN9/BqQsNdN2NIcd5r94LO/UJv1/gifLUcHXUCuMSDWwqrfJOD+iUDhCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EB2oJyT3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EB2oJyT3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E6D1F000E9;
	Mon, 27 Jul 2026 16:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785169447;
	bh=RBXpZSTaERLmZOoaiMiejoT9Ba+oDRYLMpaF9aCISp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EB2oJyT3LVT0a8ODTVmDTPnMgaNxyeAPbteSR00cUoroP9S9lnpuqGO5aj9m8WaA4
	 9Bzjy6kuandWtV+tQDQBiy2NpUKkk+hHS5uv7HjhrXc0+hBXGfjQ9puvlY/6icN885
	 xOlGBkoiOpwj73y11STRzyng+kXVFL8R4Xu7Yn0YBlb+QdaLocXyQbAEF8c2ypNDBc
	 In6oxsckV7osHBnhuV6EMpmLoQjdSf3QgVE401Cv/3QdXNggF04s/vhlyE/8TFP1Pm
	 PraX/zqhBWeqhKt38Re0oVJL7izWdMDyE/uiVUlxXIubUyk2P3eAxPwsLopAjRzi9d
	 9ShDf5BWG0dXg==
Date: Mon, 27 Jul 2026 18:24:04 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Hao-Qun Huang <alvinhuang0603@gmail.com>, 
	Rob Herring <robh@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Osipenko <digetx@gmail.com>, linux-media@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH] staging: media: tegra-video: fix of_node_put() on VIP
 parse errors
Message-ID: <ameBr5oM8pp4PpiQ@orome>
References: <20260707150326.554689-1-alvinhuang0603@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b7pg45i72k7ky7mj"
Content-Disposition: inline
In-Reply-To: <20260707150326.554689-1-alvinhuang0603@gmail.com>


--b7pg45i72k7ky7mj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] staging: media: tegra-video: fix of_node_put() on VIP
 parse errors
MIME-Version: 1.0

On Tue, Jul 07, 2026 at 11:03:26PM +0800, Hao-Qun Huang wrote:
> tegra_vip_channel_of_parse() initializes np from dev->of_node without
> taking a reference, but its error paths drop one through the
> err_node_put label. This underflows the refcount of the VIP device's
> OF node when endpoint parsing fails on a malformed device tree.
>=20
> The only reference the function takes on np is the success-path
> of_node_get() stored in vip->chan.of_node, and that one is already
> released by the tegra_vip_init() error path and by tegra_vip_exit().
>=20
> Return errors directly instead of jumping to the bogus cleanup label.
>=20
> Fixes: e740d199cf0f ("staging: media: tegra-video: add support for Tegra2=
0 parallel input")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>

I suppose this is a common pattern, but isn't this technically broken?
If we were really pedantic I think we'd need to grab a reference to the
node very early in the function, like so:

	struct device_node *np =3D of_node_get(dev->of_node);

And then make sure to release it on error (and hold on to it on success
and release it on remove). For kobject/kref, unless you hold a reference
to them they can disappear at any time.

That said, of_node_get() doesn't fully support this, it seems. It would
need to do kobject_get_unless_zero() to be fully sure we get a valid OF
node.

Rob, I have seen these kinds of reference leak fixes a number of times
now but they just don't seem to be fully correct. I know that OF_DYNAMIC
probably isn't a very common configuration and so we might not run into
most of these issues. However, I wonder if there generally is a problem,
or if I just don't understand this correctly and there's some other
mechanism that makes sure these references stay around while the code
uses them without their own reference. I guess maybe as long as we run
code as part of probe we can rely on the struct device hanging on to its
reference?

Thierry

--b7pg45i72k7ky7mj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpnhiEACgkQ3SOs138+
s6ED7A//ay6tQPT9ljBJEqYAPmHVdyXLy3wsaIcFw5eev0a8Iz/xC4hJrWNZp0ix
2mmjA5Hek4YrPXUrNLDoH6lgkCj4SWISC+FZbh5vHaVIiv4tgGIaFiMuFCyPtkNR
urrYV74O1Sckk8+AXFVdlZIiIX60qpKtibX/n8ufny71vqsd+0n+85/LPeGuEJsJ
bNgBW8mYAziiKAPOm3/mJV9MRGX0E6qbf5oW+AGdDFkdI6yi+DEjbaQH9KZRDGr3
+d8vtA+jn9wt21lo2j5NwrLaclCiOyeZQe5QzoeCgIB2d2AlMykt1qbhtw7VXhRH
3KXzioJtA6S+Nywz7PLiIB7OjGgo8/3vwJuRV9mrLOW+LfWb2t7N7yTM6G9fTf2Q
4RKi8VTGZsg4IOsjJazOa2h0/Woqt/5XyovarYMwPK5Tgna0bQLoCuLraKjEpxOv
B6hOyFN++pS176nwTFtAwT3Srq78e3Hw46gvDIUnTgQOwpg0MFWPrFSCaULTC6cM
yyZTnQ4fd4L95jem2h2A2PGxjlkJVL2UnIN4JpZnYNGy7OzWsDVcE+eQNEN/uXBG
fvZxd3+SN+JUZktmZRyGg5GVQCxqcohHZ2iA3to4sCeTNWrsmzxqWLIh/sR/E87R
CZCCFRYo0rpS6WJqq8BcLLaUINXz3qEb76B5xlwoCt6ze/KrXhs=
=Z5zv
-----END PGP SIGNATURE-----

--b7pg45i72k7ky7mj--
