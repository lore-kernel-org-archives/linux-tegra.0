Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47440443C13;
	Fri,  2 Oct 2026 08:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929294; cv=none; b=UW1AUm0dZ8tbdnRqnmaURPz3AmhY6xl6LCQuUdnv5SbeZ/E4C432EipTfs1UQnhIeA699jLIMkJLHowPL7Z4q+83QEimYzdpz0wbVQ8n8+zL0CUjkTwHFQJxfQhnO/+YcCNYf/Jx9whpmUeXHTA81JiyKQyx0vZFbCFnZFIWP5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929294; c=relaxed/simple;
	bh=sBePC58/1nGIQTG/U0OECcc/vsriPHIVEWXQtkPb018=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N5K3AnjoPg3rr1ohbCvz0geua8DSLbeyJjhME6rCbdBXw36mxX9uDXG37DbwRKWNchftF8J+KqnMlV5185vYAHQtxMVHzljh5lDO9WstL+rRmDN/3rVch3OCpOOoA++BRzx9mMyZJ8NKnzidC55lZj8ysLZ86Er/yodS/iw8k6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a1Jo48x3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a1Jo48x3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4171F000FF;
	Fri,  2 Oct 2026 08:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790929292;
	bh=7eeSp1C4/hTG60Jp34wAdK2R8RaYhjX2x/k5gS4VDsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a1Jo48x3eK+3CwWMOkAhjll5meQzqEbqaTwc40gmqkzpON3plc8y9sWMEvUGQQDZy
	 H7B4D/eQz/4NDRF9QY+QzwFwaQJJ8LTz7+Y+p0Ns3BkQrVG/Ofy+idki3yGS/of7lr
	 lNaDNnbIx+yKGiZcS8ndFsYLmctBNf/QO/egtWxamOU5htqTOMlJqqpuR9tJbyovf3
	 ueWQJJFfle4C1oXjaW0ohBsvMqUr8vvPMuH7a3vaS8hXsOwk3QJ36KdasThxxCnhHP
	 KcrwugeZdIX8AIQk5KeuzjsLyrh5Rq4vqFerfQaMSVC4+Ze0yQ0EPdB8PutgJ8LhFI
	 Bz7Eqvygmqp6Q==
Date: Fri, 2 Oct 2026 10:21:30 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, 
	Prathamesh Shete <pshete@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] Enable PCIe WAKE# as a system wake source on
 Tegra234
Message-ID: <ar9pfNZstgn9pPXK@orome>
References: <20260907113134.2543273-1-mmaddireddy@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6gn3v7gdvmn6udrx"
Content-Disposition: inline
In-Reply-To: <20260907113134.2543273-1-mmaddireddy@nvidia.com>


--6gn3v7gdvmn6udrx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/2] Enable PCIe WAKE# as a system wake source on
 Tegra234
MIME-Version: 1.0

On Mon, Sep 07, 2026 at 05:01:32PM +0530, Manikanta Maddireddy wrote:
> The P3768 carrier board used by Jetson Orin NX and Orin Nano routes the
> PCIe WAKE# signal to Tegra234 main GPIO L.2. Nothing in the kernel
> currently describes that signal, so a suspended system cannot be woken
> by a PCIe endpoint.
>=20
> This series wires it up in two steps.
>=20
> Patch 1 adds the PMC wake event mapping for GPIO L.2. This is the piece
> that lets the GPIO interrupt be armed as a system wake source during
> suspend, rather than being treated as an ordinary interrupt that is
> masked along with the rest of the GPIO controller.
>=20
> Patch 2 describes the signal in device tree, on the root port of the C8
> controller. C8 is the controller with the onboard Ethernet NIC on this
> carrier, so describing WAKE# there is what makes wake-on-LAN usable.
> The property is consumed by the generic PCI core in
> pci_configure_of_wake_gpio(), which looks it up on the OF node of the
> PCI device itself, so no controller driver change is needed.
>=20
> The two patches touch different subsystems but are only useful together,
> so they are posted as one series. Patch 2 depends on patch 1 to have any
> effect.
>=20
> Testing:
>=20
>   - Verification:
>     - Verified suspend-to-RAM functionality with no spurious pending
>       wake sources observed.
>     - Verified wake up through GPIO L.2 using an Ethernet magic packet.
>     - Verified the reported wake source after resume.
>     - Verified that regular Ethernet traffic does not trigger an
>       unintended wake-up.
>     - Confirmed Ethernet connectivity and normal network operation
>       after resume.
>     - Repeated multiple suspend/resume cycles to verify consistent
>       behavior.
>   - make ARCH=3Darm64 CHECK_DTBS=3Dy is clean for the two affected boards,
>     tegra234-p3768-0000+p3767-0000 and -0005, with dtschema 2026.6.
>   - checkpatch --strict reports no issues on either patch.
>=20
> Note: the series is based on the linux-next 20260817 snapshot rather
> than a maintainer tree; see the base-commit trailer below. Happy to
> rebase onto whichever tree you prefer.
>=20
> Manikanta Maddireddy (2):
>   soc/tegra: pmc: Add PCIe wake event for Tegra234
>   arm64: tegra: Add PCIe wake GPIO for Jetson Orin NX/Nano
>=20
>  .../boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi     | 10 ++++++++++
>  drivers/soc/tegra/pmc.c                                |  1 +
>  2 files changed, 11 insertions(+)

Both patches applied, thanks.

Thierry

--6gn3v7gdvmn6udrx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmq/aYcACgkQ3SOs138+
s6FvNRAAhLIRO5DxfJQ6+4ddNyH5Bm2Rq6FcGZwFcUTz2Sx8Fhwv4eqkypaeD/lQ
DnTxudWMLRJexm0ByQOYO1VGWLG903f1kSgzC+pdyfkLt5WuS5oXXn7OLBh85nFU
lavG5luMTRjZJ7Cj5b3Go6fL+HLDZUW5rk8bl1RQbUmQRxnMOllHRpBBGDtIHm1R
pwk741DWD2rIqYkLw9L5RVmuSmeKEHEmiU+OxO+nWQGF1CH20K7/Hc3WavcHnMQf
7L+YXryvpe30LG1e3IXft0x2ruwEtlD369XZU1rDNNRvMeCUCzx04CpsVNODHXcI
pAJg3PyL+1iR15UuisUc0yDjToIp8q+NAOlSJBpb7AG5d+GLz50uFeb/GLQVA+/n
GDFec+i+JOe13EEu+liehZzN0viQpyRZX2i7aJ7l9NadGSKms0wN6nFnvn3AS0Qi
WK8g/CIuB3hOTfIIreIWYu2zwJZKUYog6tqZgsr1T/IUWpcWOeaqpz+1EBr0mAyZ
BtUrkDYKJNrcWQxpgRMkxVuXbfwJyLd0ErqwTDEPNRQRNLK2JntLYU8g05TIhk80
PxrGZclM/jLQx5pSr617dmVSAVC5wXe7oNQVmKY+AfJiqNjOTHzsuxqOl6Kj/+ah
PTfUz2Yvhhwfm00IL1NsSWo3jTSoPknr6+E0GJLzlbek4r7Ua8o=
=M3Rn
-----END PGP SIGNATURE-----

--6gn3v7gdvmn6udrx--
