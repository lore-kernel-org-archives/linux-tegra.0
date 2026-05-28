Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E8C2D978C;
	Thu, 28 May 2026 14:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779977346; cv=none; b=TuHKefBGn2GwQHxsh1iIiu4HjxNtyHaYsFEWPVM0hj46cHPswgPRiL97ohUdXAcT1xRJspsB5VIN5ArfVNJ8HPPFV4j29l9yLfGtywcH726e7PmX6hY9byrWmCekCHhI48Kq6d0Ta3L1RssveNgb0S2HrXPr8STJfwkMei4S03w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779977346; c=relaxed/simple;
	bh=X2+PSNWXhij2/J9UXYe1IqklZEdtu18OpE8J+ZsveTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7IXTOEKQH080lD5PmzDrVcLTy82xxgpQvq+xXK7aY2H7jcdv/wL8ukZUntukBdVqjxPEj8mSQUzb/Yq16rbCxe7gF4RG4eXwSERiMnoW1RHrEXRBAdXQgY2yk++wjocQYY97CfT1zHwxZpmu4sQgdeVdQIquZnQIw9YGzLcTXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISqWGSVN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISqWGSVN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 708B61F000E9;
	Thu, 28 May 2026 14:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779977345;
	bh=QNFMfMmMQ7Hbc1efk4o9sLuqoDvVVe5vWAt2TAD+cRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ISqWGSVNg0meYdbS99H0x06FlPHao6N5gMn4+GKUKYOIhwoBE1h0knTguGmQm22B0
	 LferAp3kxvAdKdg19flju3B79voVuZ2iEkYs+qHjZ/dDwGU4xh7hZxCCywWln7QZqm
	 ZcI0jbu289owc8oiM1SDZIbxQMoAmSoUVpJjK9N3wVOT5EeOnv2GQyayOT35Dg4Foc
	 SSQktuO+IwzkiAT/SKGMI+cVRWFNiW5N984oNhfxXgnXrw2C0+GB91EaGD7xlentnV
	 EQRVYgBxAEpDEwDbRofOekh5cVPfBCPQRPbei/IpcMGanU+UxzLwibZq7BYZjhHLxc
	 /K1N7GFcXJZpg==
Date: Thu, 28 May 2026 16:09:02 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: webgeek1234@gmail.com
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kurt Kiefer <kekiefer@gmail.com>, Jasper Korten <jja2000@gmail.com>
Subject: Re: [PATCH v4] drm/tegra: Enable cmu for Tegra186 and Tegra194
Message-ID: <ahhMdYWnjexOGoPV@orome>
References: <20260407-tegra-drm-cmu-v4-1-2fe95f305afd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5ammexysfx2yz2yn"
Content-Disposition: inline
In-Reply-To: <20260407-tegra-drm-cmu-v4-1-2fe95f305afd@gmail.com>


--5ammexysfx2yz2yn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4] drm/tegra: Enable cmu for Tegra186 and Tegra194
MIME-Version: 1.0

On Tue, Apr 07, 2026 at 02:09:37AM -0500, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> Without the cmu, nvdisplay will display colors that are notably darker
> than intended. The vendor bootloader and the downstream display driver
> enable the cmu and sets a sRGB table. Loading that table here results in
> the intended colors.
>=20
> Co-developed-by: Kurt Kiefer <kekiefer@gmail.com>
> Signed-off-by: Kurt Kiefer <kekiefer@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> Tested-by: Jasper Korten <jja2000@gmail.com>
> ---
> Changes in v4:
> - Add missing signoff
> - Rename cmu phys var to be more clear
> - Remove redundant lut null check
> - Link to v3: https://lore.kernel.org/r/20260406-tegra-drm-cmu-v3-1-dfcb1=
dda4ad6@gmail.com
>=20
> Changes in v3:
> - Remove improper IOVA null check
> - Use dmam_alloc_coherent instead of manually tracking memory
> - Address other review comments
> - Link to v2: https://lore.kernel.org/r/20260202-tegra-drm-cmu-v2-1-a1bcb=
37f3e85@gmail.com
>=20
> Changes in v2:
> - Several formatting changes per v1 review
> - Move cmu alloc/free to dc, where it can be handled in probe/remove
> - Enable cmu for displayport as well
> - Link to v1: https://lore.kernel.org/r/20251101-tegra-drm-cmu-v1-1-21179=
9755ab8@gmail.com
> ---
>  drivers/gpu/drm/tegra/dc.c  | 116 ++++++++++++++++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/tegra/dc.h  |  13 +++++
>  drivers/gpu/drm/tegra/sor.c |  25 ++++++++++
>  3 files changed, 154 insertions(+)

Applied, thanks.

Thierry

--5ammexysfx2yz2yn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoYTH4ACgkQ3SOs138+
s6HsJQ//U9xIqD8wQOS5timtZ0qmz56Nvv0NM0kZFQkpCUjfm/H8F9jPE8inGf6l
djxwQ5fWTalTbeGske/AApMVHkqj3P1mQY7R3yd/Vj+EgV+pX16KE4KfejstRORt
eZ+NByZPb8atHcTDB3QUmhv9xj3RXLqw4rkpBCjIHN05F9I2qrt/hBuZSAXUWuEM
TB07pf0ix7vAKzMV5afOql+NsbnQOe5S0j3YVAsgJ1hhM3K6pMCKQX0YHYhwW+kq
u5rVq2CU+7IGVlP4GHuF23C2IKw/1s6qkteIEL95yYx6JR4lTF2/cd/5uG127jRw
VTR7sXvvyaFrsxZVIDB22B0MLwVJFTID7TPWbF+uwN7a5qOYK/gEJV2Fw2Xsb0b0
kQTis33qv2X0WfDuflzZYIGgqtjwCWY/ZtkNzelMEtkAvAouR51QpOEe9MsX4KCq
Gu8nSlRbJ7v3AH9cHLp6/l1L6hMuiFnKEClaDtHcoIqBYKVa4Wqa0ykMTTW+tP5I
SPQ/DFbVZJo966wKzOOxFSsUmU5cVbbgWr0P/6T0o1ZVcEbghdyr+JLq6/3/IpVa
7pn83ALzoXttZAQQ8Uq1ebjGNCsHNQnFDFM9XDIjD5i0/f0c6MsXtq+p02uor+/0
CvAS2vVSR5auyKomZr0pUCdzOzXG4AnsYK2xXqYrwwkLvIZkVNA=
=Oydq
-----END PGP SIGNATURE-----

--5ammexysfx2yz2yn--
