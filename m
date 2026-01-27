Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769F42E6CA6
	for <linux-tegra@vger.kernel.org>; Tue, 27 Jan 2026 10:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508152; cv=none; b=Iv7fWFJ8tvJbkEfRcqE9sV3RSJOZNq3mDwBfV94Hmnphdx/IIxM7rQPuI9AIt0opPpOt0nnehhx0MGoDSSsa/ksWeZ2SmS4tsCEwoHgHto7PKfFHWq05/e4+z4GDy37Wcjof1+GO9t6cmoS76gNN/MD7iZ4k2FKc2I8JSEeP0wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508152; c=relaxed/simple;
	bh=HWNG6t4bLDI150f5FrT5PWxgTiyUBMXs8EoDIcMXM94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VN71+1z8LhuZMcKxIaLCen7JsQgoGf/cqbqhmHfC3rZ+JNEx40RFOXtuCPdF3uVTcLITyVm4fSIY938cPseRQLaI9VXvhPZXL2/E067ec7vhLoSVMU0EQ2havGY/3IPHhUHCm9nrqpnvEnGq78epouU1igpOY3IBgLBk/0FSfZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DLjZAn62; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DLjZAn62"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC902C116C6;
	Tue, 27 Jan 2026 10:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769508152;
	bh=HWNG6t4bLDI150f5FrT5PWxgTiyUBMXs8EoDIcMXM94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DLjZAn62EoTrUYXfPb3/szKLY14XSI7jYICGN+szXRBoI8LBYMyPjn63t75jStVAI
	 m3Ep9160QTR+/q3tNhOqfmOhuTzWdpWk/xxL3DIivngIBoHIp2aSj32tAUUVtzER/Y
	 7L13kalhXya2ouDBTnpCK9CKAJ3fFv5b6EkFkOzFBP/9i4vDAufQQvuYLcplMORMwH
	 VOkR8UoLubJJqwaeJF6i+or+6t1Gi7jjusQEWqr8PqOUhl3c6Tt7ogp9m2n4tthd0y
	 /NaktrbYcDvOPXtUpF6//YQn6hHXf+X17ukxVX/WbXeyn0jwLcoGm8n2YiQse4fLtX
	 TQcPctB8h8S+g==
Date: Tue, 27 Jan 2026 11:02:29 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, arm@kernel.org, 
	soc@kernel.org, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
Message-ID: <aXiK_37WeNBrB037@orome>
References: <20260118080304.2646387-1-thierry.reding@gmail.com>
 <53d3a98f-3ad8-43c0-9094-39f229a5b698@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="chtvw53wng52x7jg"
Content-Disposition: inline
In-Reply-To: <53d3a98f-3ad8-43c0-9094-39f229a5b698@kernel.org>


--chtvw53wng52x7jg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
MIME-Version: 1.0

On Fri, Jan 23, 2026 at 08:47:24AM +0100, Krzysztof Kozlowski wrote:
> On 18/01/2026 09:03, Thierry Reding wrote:
> > Hi ARM SoC maintainers,
> >=20
> > The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027c=
b1e8:
> >=20
> >   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> >=20
> > are available in the Git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/te=
gra-for-6.20-dt-bindings
> >=20
> > for you to fetch changes up to b2788f6320722d6059f849f35a77eb082608c627:
> >=20
> >   ASoC: dt-bindings: realtek,rt5640: Document port node (2026-01-17 01:=
58:18 +0100)
> >=20
> > Thanks,
> > Thierry
> >=20
> > ----------------------------------------------------------------
> > dt-bindings: Changes for v6.20-rc1
> >=20
> > This series updates various DT bindings for Tegra architecture,
> > primarily focusing on schema validation fixes and new feature
> > documentation for Tegra234 and Tegra264 SoCs. Key changes include
> > correcting realtek,rt5640 audio codec bindings (adding missing ports,
> > clocks, and jack-detect sources), converting Tegra20 NAND bindings to
> > YAML, and updating memory, DMA, and IOMMU definitions for Tegra264
> > (introducing CMDQV and DBB clock support). Additionally, it resolves
> > legacy warnings for Tegra30/132 display and VI interfaces.
> >=20
> > ----------------------------------------------------------------
> > Ashish Mhetre (1):
> >       dt-bindings: iommu: Add NVIDIA Tegra CMDQV support
> >=20
> > Charan Pedumuru (1):
> >       dt-bindings: mtd: nvidia,tegra20-nand: convert to DT schema
>=20
> This should go via MTD. I think Miquel is not ignoring bindings.

I think this was standalone and hadn't seen any response from MTD, so I
vacuumed it up like I usually do.

> >=20
> > Jon Hunter (4):
> >       dt-bindings: tegra: pmc: Update aotag as an optional aperture
>=20
> ...
>=20
> >       ASoC: dt-bindings: realtek,rt5640: Document mclk
> >       ASoC: dt-bindings: realtek,rt5640: Update jack-detect
> >       ASoC: dt-bindings: realtek,rt5640: Document port node
>=20
> No, Mark always promptly picks up bindings patches, so I do not
> understand why these are here. These should go via subsystem maintainer.

There's no clear pattern amongst subsystem maintainers, and given that I
make a final pass towards the end of the -rc5 week, I will usually look
at what patches haven't been picked up yet and apply them, provided that
they have a Reviewed-by/Acked-by from a DT maintainer.

In this case I missed Mark's reply since it was posted to the cover
letter and therefore didn't show up in Patchwork (I don't know if newer
versions of patchwork track this somehow, the instance on ozlabs
certainly doesn't). I'll work on a way to better track this.

> > Svyatoslav Ryhel (2):
> >       dt-bindings: display: tegra: document Tegra132 MIPI calibration d=
evice
> >       dt-bindings: display: tegra: document Tegra30 VI and VIP
> >=20
> > Thierry Reding (1):
> >       dt-bindings: memory: tegra: Document DBB clock for Tegra264
>=20
> And this one was never publicly acknowledged that you applied it and
> lead to ACTUAL warning/review comment from my side postponing your other
> patch.

Sometimes I forget to send out acknowledgements. I haven't found a good
and reliable way to automate this.

> If you took this patch for DTS, then it must be on the DTS branch BEFORE
> the DTS uses it. There is explicit rule about this in writing bindings.
> You even sent it like that, look:
> https://lore.kernel.org/all/176856655186.139432.6919318227218814446.b4-ty=
@nvidia.com/
> 1/3: DT binding
> 2/3: driver
> 3/3: DTS
>=20
> so why a correct posting you would disorganize and break the
> bisectability rule by applying binding separate?

As I explained earlier, I usually do exactly that, except that I keep
the branch separate and pull the dt-bindings branch into the DTS branch
as a dependency. I might have missed the dependency this time.

>=20
> >=20
> > sheetal (1):
> >       dt-bindings: dma: Update ADMA bindings for tegra264
>=20
> Vinod also picks up such bindings. If this is for DTS then should be in
> DTS branch.

Same as for the MTD patch, there were no related DTS or driver changes,
and there was no message that this was applied, so I picked it up while
I was going over the list of pending patches.

Thierry

--chtvw53wng52x7jg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAml4jTIACgkQ3SOs138+
s6GOuA//Z7nPcCe2ob7LORQw5yKFtcUUnwdDMBeVFsCE1a3KEHFowGkX54Mu1HSp
NP3w3HlXWRrLz/a1/qWJ8A3bHN8l8oMM/ygXx2HfWJKLSyb+nA3eI2WoMVO8OBLe
Kbl7h+Kaq2opo35jKxFwTGqIz4+UWWFl4nb41DqRv1RMSH/07+7Vu2PtPDoLYs4P
3PsAp2nGNyLTpmzJ5HhKiM8srRybBUDxMc9mfHQ3qfWRyZIasupVMcJzAqJ85t6y
ERxQmiR3Bc31IM//SgPd4UMsAu4+h/aZiZs6dLC0O3p/p2pTHpcFYIR+4VCjKboZ
RyVWARDqCN1o7X+h4QOQry6INnfYRYVv8ijxeCafkss6d8PPtmnJuX3bQ9VYWSp9
xDq8TpYPvaW/3l6FqhOdyWqLWuY0HW2vW0b6xmiMEk8uApV34k6i5vRXt50CiBNV
uIS+FyCtZgoYhcfVFW4KU917ZnzybZ+oeF9R6JBaRqf2idxPpp2P0PK/NA6e+xYo
aml4iH3DNlqcoEbbF0Tb+lI3/M5aSzBTXSOo7HoI1OMiGTDET88FEWUcozfSXPq/
yVrAEm8MaXKHvbrEt8Oow1xNY+VZWJvSZ+fiivPqza955sehlypypmtKL8jLCkYR
ehoM5cykwJAXRw8ZtAnLT4R65dbMUSPUO/ESUubark3uruhXXoc=
=qz6T
-----END PGP SIGNATURE-----

--chtvw53wng52x7jg--
