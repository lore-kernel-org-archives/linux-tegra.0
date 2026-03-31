Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9249A3E557F
	for <linux-tegra@vger.kernel.org>; Tue, 31 Mar 2026 08:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946596; cv=none; b=FRjHmsmJOI8GeyW+UBoJzJF7DloYB+dOmtityBlyRb6j9PSWgDK2plgfEmIk5JByLv3kRHlAI2ODK1MpDUC3iD/g/NYg9CyFcDKtAzzqplcD72/J+WOICA6X9rKyqGGOkD97T6chGoGF6z5eO3k/uTzGxherr2LVy+lTOP96RFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946596; c=relaxed/simple;
	bh=5rouBpWCbG9UoNdZ2vpMLgofqK8ufoMoBBsc7BuxqyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHdxgmjxoeZQzik68RDsVia6FU+f/+Cr7NoU83pf6slH/7vkAi29IK4cwNzRoq3KYpDnFSA85CJQW0jI+X7/fYm1IJpgNQ2Nr5avQHfqqfTMdwF5CnxaZUp6R+/HsZxlxcRyd79QvRXDKu1diTwHVqffw5eBv18C9RaY+11qOks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JkDnYVFd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JkDnYVFd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC60C19423;
	Tue, 31 Mar 2026 08:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774946596;
	bh=5rouBpWCbG9UoNdZ2vpMLgofqK8ufoMoBBsc7BuxqyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JkDnYVFd9BXu6hp7sGrVjkTVKvXZyBIREQBbQFsGO1X9QHoFFrZYb8fVTXY/schZ2
	 5h1d0PpG0QmAMd/ZI/dKW+LlkeDvN9r2s63KsuJGSycdCWDfl62BLb7RlhNaJAG40r
	 gl3CW0cyl2KZpHsFplSbZD2cu1vVEPgGzm7wdE36Ftc0WRaF1Lf+RfiMwCbtssppfN
	 nFlbuoVSzX+zyFh9RHCeE8TuFCQPu4dg9+q5tIUpYpDALb/1XER8SxB6Q/xz44xWLf
	 jnQ4ZfyAJU449MFc3tmGaxhgiAJyMVAj3H1Cgod4Pfxrz/vQozTuqfBCSP4iagBdqC
	 9Edpt4J+vWgSg==
Date: Tue, 31 Mar 2026 10:43:13 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, 
	Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 6/7] arm64: tegra: Device tree changes for v7.1-rc1
Message-ID: <acuE-URAuRvmtd4u@orome>
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
 <20260329151045.1443133-6-thierry.reding@kernel.org>
 <7b9bc5d1-7a1d-456c-b280-5f4dc969609d@kernel.org>
 <act77WcvwYedN0Q8@orome>
 <e5327cd9-4aa1-4e26-b748-dd1af29e6fdb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="efltvkno4xbepiec"
Content-Disposition: inline
In-Reply-To: <e5327cd9-4aa1-4e26-b748-dd1af29e6fdb@kernel.org>


--efltvkno4xbepiec
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 6/7] arm64: tegra: Device tree changes for v7.1-rc1
MIME-Version: 1.0

On Tue, Mar 31, 2026 at 10:00:01AM +0200, Krzysztof Kozlowski wrote:
> On 31/03/2026 09:53, Thierry Reding wrote:
> > On Mon, Mar 30, 2026 at 01:45:24PM +0200, Krzysztof Kozlowski wrote:
> >> On 29/03/2026 17:10, Thierry Reding wrote:
> >>> From: Thierry Reding <thierry.reding@gmail.com>
> >>>
> >>> Hi ARM SoC maintainers,
> >>>
> >>> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5=
b5f27f:
> >>>
> >>>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/=
tegra-for-7.1-arm64-dt
> >>>
> >>> for you to fetch changes up to c70e6bc11d2008fbb19695394b69fd941ab390=
30:
> >>>
> >>>   arm64: tegra: Add Tegra264 GPIO controllers (2026-03-28 01:36:46 +0=
100)
> >>>
> >>> Thanks,
> >>> Thierry
> >>>
> >>> ----------------------------------------------------------------
> >>> arm64: tegra: Device tree changes for v7.1-rc1
> >>>
> >>> Various fixes and new additions across a number of devices. GPIO and =
PCI
> >>> are enabled on Tegra264 and the Jetson AGX Thor Developer Kit, allowi=
ng
> >>> it to boot via network and mass storage.
> >>>
> >>> ----------------------------------------------------------------
> >>> Diogo Ivo (1):
> >>>       arm64: tegra: smaug: Enable SPI-NOR flash
> >>>
> >>> Jon Hunter (1):
> >>>       arm64: tegra: Fix RTC aliases
> >>>
> >>> Prathamesh Shete (1):
> >>>       arm64: tegra: Add Tegra264 GPIO controllers
> >>>
> >>> Thierry Reding (6):
> >>>       dt-bindings: pci: Document the NVIDIA Tegra264 PCIe controller
> >>
> >>
> >> This is unreviewed/unacked binding where PCI maintainers had 1 day to
> >> react to your v3.
> >=20
> > Rob gave a reviewed-by on this about a week ago:
> >=20
> >   https://lore.kernel.org/linux-tegra/177440189257.2451552.181961018302=
35626115.robh@kernel.org/
>=20
> Rob, although knows a lot about PCI, is not a formally a PCI subsystem
> maintainer.
>=20
> >=20
> > In my experience the PCI maintainers typically defer review of the DT
> > bindings to DT maintainers, so I considered Rob's R-b sufficient.
>=20
> Sure and they acknowledge this, that review is done and patch can go
> other way, with "Ack".

No they don't. The vast majority of the PCI DT bindings patches are
indeed applied by the PCI maintainers, but for those that aren't (there
are, admittedly, only a handful over the last few years) there were no
Acked-bys from the PCI maintainers.

> Where is the Ack?

Again, this is where your rules start to fail to meet demands. As it is,
the only option that we have is to get DT and drivers merged, then wait
for an entire cycle before we can merge the DT parts, otherwise we break
DT validation.

> >=20
> >>                   Maybe they had more time for previous versions, but
> >> nevertheless it is also part of other patchset, so it will get into the
> >> kernel other tree and nothing on v3 posting:
> >> https://lore.kernel.org/all/20260326135855.2795149-4-thierry.reding@ke=
rnel.org/
> >> gives hints that there will be cross tree merge.
> >=20
> > Maybe look at the cover letter:
> >=20
> >   https://lore.kernel.org/all/20260326135855.2795149-1-thierry.reding@k=
ernel.org/
> >=20
> > I clearly pointed out the build dependencies and suggested a shared
> > branch to resolve them in both trees. Given that the bindings were
>=20
> No problem, that's a valid solution. Can you point me with a lore link
> to the shared branch posting (these tags/pull requests must be posted on
> the lists)? Or to an ack from PCI maintainers?
>=20
> The commit itself does not have an Ack, but maybe was just missed.

Yes, the DT bindings patch does not have an Acked-by, but again, I
didn't think that was necessary, especially since we were going to have
a cross-merge anyway.

Here's the PR for PCI:

	https://lore.kernel.org/linux-tegra/20260329155040.1448158-1-thierry.redin=
g@kernel.org/

Thierry

--efltvkno4xbepiec
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnLiR0ACgkQ3SOs138+
s6G4LBAAgGRxK+lFtOn4x21DEpRTkr34pM8znEkHgV4Cz3p3BWeDHApam1q3P1f5
+HAluqpvvDgbSK1xgAnYcChoB90//J4vmGmP5hVWNni+3lg5/LSfywTYLF8TaCbL
mn7grnLzl4EJiDyCsRGhFp89lWkDPXYu3WT3ZZqHoLovfNWhw4tl7PANDtwfhjnZ
fIg+b8Apg/jegTZTXuhA8AvB6mQquUgoBKDYhhoFX7657SL43ZYB/SPrTbPcIJu/
0TlOjOD+yd9aUCE8o3u10WdzQtCmeHAS2O+lG6UYpJBRQqzfWySMuL/Fkr2XsaEf
Dsmglp3t1HYv5ksIHklmDwP/Z1/0TpJxIIiEe8uVLaGmB9USIFE1QUwGIAtzFB4z
8aPJnCLqLtevCZiLK8LQiusxx2WOoykEZrTjQTu2wxJlOVF0NCEbHHCL+BDFpdoc
C9+KlFbfTfyYzXqY9j3i4sprlXjkBm3812lzCrf4StDGNI8uo+Z0TB6rY4qC0/Vn
5+wOpZqr7TvAUXark267/ZlZfwQgwETuDWYt/8SLMqLupYYSQ9qjNOSfx9UC4Wbr
rqjQuKtCguBpof8MQFcMh35okMBqAdyfqIQwbSraW5Fa+0y21bAjghiC183NFyVy
fMZStfxWvo3bYmUffoVnRYON9uXN6lSTCIdA20vx7lTVoQG9REI=
=RrIw
-----END PGP SIGNATURE-----

--efltvkno4xbepiec--
