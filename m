Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4BC331238;
	Fri, 27 Feb 2026 12:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772193810; cv=none; b=oVWl/jLT3YsNrrFa+mA2o70I5khR5Nj8b62UYVul49jvxEag88ajjtHgc7iJk4XfKdgSh8DX9gSHojyB6vQEpDoH9B/0AupKvJ1wM8REHezlRjRJzVRqOCHa8Co7EOV8tzYD+fuBnKGa+N0o1d6l17+zVQ96MYfdatNW/ODcVrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772193810; c=relaxed/simple;
	bh=YpNaloKbr3UUZsErz7VaMba9uf0tXCjATe67jN0sD5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctE/j3d7W5ov2TnU8JsMDLWgOVrdRwZVukEjfwWJg8iGFGo0CQ6KC7NNXnaY8JA2G693HgF/h6G9m1+pUM4lK1qez7CnWTfDLz5Nw2rq+Ey2B2UaA1AVR6oPUu06pUVAz25xq3qhBPB9NQsTDLrYbH6cTvSOITKb4daFUHZK0Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdzMFMKU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gdzMFMKU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 036DEC116C6;
	Fri, 27 Feb 2026 12:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772193809;
	bh=YpNaloKbr3UUZsErz7VaMba9uf0tXCjATe67jN0sD5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gdzMFMKUjV+Lj4sDvaE1Bn89regIDl13j5pf+y9pVog4rQ6l6Keq6wtIoitUefNGf
	 +STvIo0ipoTMbF8ftT7D0oXoOkcxKHRQFZH42XQnE+6VTcpDpXSQNQkvdfbZ7mqgeB
	 r/nqHYz3jbfl7PGvSJ8ZJsdOoar5WZEQrbOtWUSDCaF+AdxEnLj/IFP0XnbBjmrD1a
	 KvW1f19bWCnn8brT+HzbyFpEnd/g356Kq1cYOEBmKtDYm6LRrADvFyfBRlR0Voik4P
	 dUfrWMwMh+4gJfh3YNg/qddahVIjXX+Ke62R8T25tfzk/M+G/S1taCzwS0IH8cfuBV
	 prjOX6Au8eLSw==
Date: Fri, 27 Feb 2026 13:03:26 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 00/10] dt-bindings: Various cleanups for Tegra-related
 bindings
Message-ID: <aaGG3Yama_MjEAVI@orome>
References: <20260223143305.3771383-1-thierry.reding@kernel.org>
 <20260223171140.GA3992907-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="54grqkir2kpon4el"
Content-Disposition: inline
In-Reply-To: <20260223171140.GA3992907-robh@kernel.org>


--54grqkir2kpon4el
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 00/10] dt-bindings: Various cleanups for Tegra-related
 bindings
MIME-Version: 1.0

On Mon, Feb 23, 2026 at 11:11:40AM -0600, Rob Herring wrote:
> On Mon, Feb 23, 2026 at 03:32:55PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > This patch set contains a couple of cleanups and conversions for Tegra-
> > related bindings. In total, on top of next-20260220, these patches get
> > the number of DT validation issues down from 184 to just 88.

Hi Rob,

sorry for the late reply. I've recently switched to the kernel.org
address and for some reason these messages now don't show up in my
inbox and I only see them on the lore archives.

> Great! Really, you were at only 40 unique warnings (I strip the=20
> filenames to avoid multiple boards duplicating warnings). You're in 4th=
=20
> (to last) place:
>=20
> arch/arm64/boot/dts/hisilicon:116:74
> arch/arm64/boot/dts/mediatek:197:48
> arch/arm64/boot/dts/qcom:132:45
> arch/arm64/boot/dts/nvidia:184:40
> arch/arm64/boot/dts/rockchip:76:27
> arch/arm64/boot/dts/marvell:182:23
> arch/arm64/boot/dts/renesas:83:13
> arch/arm64/boot/dts/xilinx:16:6
> arch/arm64/boot/dts/microchip:22:6
> arch/arm64/boot/dts/broadcom:32:4
> arch/arm64/boot/dts/nuvoton:3:3
> arch/arm64/boot/dts/sprd:2:2
> arch/arm64/boot/dts/intel:2:2
> arch/arm64/boot/dts/apm:3:2
> arch/arm64/boot/dts/realtek:45:1
> arch/arm64/boot/dts/freescale:2:1
> arch/arm64/boot/dts/arm:1:1

\o/ ... I guess...

I've got a bunch more that I plan to flush out. Hopefully I can make a
bit quicker progress this time around.

> This and logs of all the warnings from next and Linus' trees can be=20
> retrieved with scripts here:
>=20
> https://gitlab.com/robherring/ci-jobs
>=20
>=20
> > Note that technically these are at different revisions because they had
> > been sent out separately a while ago, Some of these have already been
> > reviewed, but given that they are fairly old I wanted to send them out
> > in case there are new best practices that these don't include. I've run
> > all of these through dt_binding_check. Also I've verified that these do
> > not produce any new warnings/errors while eliminating old ones.
> >=20
> > Krzysztof, Rob, I know that you prefer DT binding changes to go through
> > driver trees, but given that these don't have any driver changes to go
> > with them, should we queue these via the Tegra tree (or devicetree tree)
> > once they've passed review?
>=20
> I prefer they go via subsystem trees still, but if you don't get a reply=
=20
> in reasonable time just take them. You can take the interrupt-controller=
=20
> one though as DT only changes don't tend to get picked up.

Is this an implied "Reviewed-by"? Some of these have been reviewed, but
some were either not sent out yet, or didn't get any response at the
time?

> > I plan to pick up the two DTS changes into the Tegra tree since they are
> > fairly trivial and unrelated to the bindings changes. I suppose they
> > could've just been a separate series, but I thought I'd post them along
> > with the other changes since this is all a concerted effort to get the
> > number of issues down.
> >=20
> > Thanks,
> > Thierry
> >=20
> > Thierry Reding (10):
> >   dt-bindings: phy: tegra-xusb: Document Type C support
> >   dt-bindings: pci: tegra: Convert to json-schema
> >   dt-bindings: clock: tegra124-dfll: Convert to json-schema
> >   dt-bindings: interrupt-controller: tegra: Fix reg entries
> >   dt-bindings: arm: tegra: Add missing compatible strings
> >   dt-bindings: phy: tegra: Document Tegra210 USB PHY
> >   dt-bindings: memory: Add Tegra210 memory controller bindings
> >   dt-bindings: memory: tegra210: Mark EMC as cooling device
> >   arm64: tegra: Fix snps,blen properties
> >   arm64: tegra: Drop redundant clock and reset names for TSEC
>=20
> arm64: dts: tegra: ...

How strong is the suggestion? We've used just "arm64: tegra:" since
basically forever. I can obviously switch at some point, but it'll be a
break in consistency. Although, looking at the logs for the last few
years, there have been occasional arm64: dts: tegra prefixes and a
(very) few outliers with totally butchered prefixes.

Thierry

--54grqkir2kpon4el
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmmhiA4ACgkQ3SOs138+
s6GG+g/+Onme3khS/9fUgq6VABTI32mJFpi1ubFL0feXCNWOv+gr72I4gl+83PAQ
tStKlb6bRFJXdTeYY9ZRcl/7mHwm1vpUnKKjYn86BmJpFIC4J3baMZJYpKrWsEu4
TgsAFdUD84TOr9jecEFjkbcZTeS5JGlYBAZiYL96vr4t7JP90ZRI+lHscNHnnICV
ISIdXaBIkqHFHOVxWss0TwAwdGrkVp+PVUaHo/silmvHJ/OjWC5xR6fMB0QXPOFJ
rMwAdYXSKjfi7wU9liGvSRbWWUvnKPHzm25oWhJjOXj+q5W2Et6CLOPcFSl30+L6
0fPTiCx1OACJK5AjjA0fsDpWNnAYxr6HmsW5j+rWyTAGw6q+9+0HJhR5ZcMfcPrG
tpgPP/J2O60Pl/hEMr9QkcjfftEB7WS8Mid0vm2yO6hxpfq+8mRuNoM5HIDzVBAu
qzLinfUJH499gX9cGL3alTA6COYdAwhK+X3cVqv5lGK1d9jzeQ9tBR8N62Ehs33X
gLsSIuqIWhThUVgU3u7IR3jf+v9u0S8Wv63tQQGdSVogpR75ZlEP8DFOaVLvStGy
Fr0dZLRaT8DBjiauJwFa33lVzryVF6A5V+6imr3cIjDltRqO4XvtE+Kg0+EAq0FG
VxqmrVZfdBhjsS82BjylepxlYT34dlLUpKl8uyMs1BZQtSKc6EQ=
=nyrC
-----END PGP SIGNATURE-----

--54grqkir2kpon4el--
