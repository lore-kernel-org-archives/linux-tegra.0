Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF681EB5B;
	Tue, 17 Feb 2026 10:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771323218; cv=none; b=jKVGDkze65vhxHtyzb681H57z8nKIeeB4RuVrO3+iey2NSaAjaMQiAUM1pf1w9HUSctaJnyuXeTO0N/+iJZoHJlMpIj5FaXvdaiS+zB/jrWr08lAwcAX19fKBnx60D8jrczvmTA6x6Joa5zc9TKkgsXsp/Q3TWz6AOia2tAh/pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771323218; c=relaxed/simple;
	bh=R36PQk8KyDr9x04rIC9BdVGjwABrAY+q1kN3Q0uXFL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UA2+ZZ/zK2D3NDmmutFjc4IkxQRBuWnLe5chuC59gcMcNjHJOkQQPWz+6kwYhnfowerIyjPCVmsLSrnPZOtkeX6yHtLx0s/+XNcmHvUNQUdCttaZb478p+ZgjMmVc4a2Pa9sVbIowTgksRGQZHLY3njgEQoNGuEorTtfXemMwOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQAnI2uv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQAnI2uv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 698C1C4CEF7;
	Tue, 17 Feb 2026 10:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771323217;
	bh=R36PQk8KyDr9x04rIC9BdVGjwABrAY+q1kN3Q0uXFL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hQAnI2uvRBc/dRyxJCCW1QFY8U59rFXk81Yepf+QcTtAYjzasqX1zRZt70YnPwE5J
	 SJN9YGww/I+sQQKg6HtA8MmNU4xgqQNzHMeeVzcW976P5jlxxeyH4/KIJtxcKXfefg
	 7XMctAWnI3aQZlLpPOG1VBcSRHzohNbz867AcbKwlTj6S1h8VvQvBQ7EzPq3xqiHyi
	 WQ1xAjtb+04IhABAIUQqWjBCYGqrU/GXAAt7utYE2vpODKA7P3GuwUqVKwVoeG0Jqd
	 Iy5rSIghxw6b/8iN/ymFhJxINtuhHGg9CEp4kwhX7c7w3KaNATJchFNwo4scPgmU9y
	 XAZdv667zZ26w==
Date: Tue, 17 Feb 2026 11:13:35 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Aaron Kling <webgeek1234@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Revert "arm64: tegra: Disable ISO SMMU for Tegra194"
Message-ID: <aZQ-cMn-3vI7UH7t@orome>
References: <20251101-tegra194-dc-mmu-v1-0-8401c45d8f13@gmail.com>
 <CALHNRZ-YQe7_7UGfFNsBe6pdvFjK+1sS0Sye7od6WF+yqAYttQ@mail.gmail.com>
 <5289895.R56niFO833@senjougahara>
 <6462154.GXAFRqVoOG@senjougahara>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fetqgeupq2ey7hvw"
Content-Disposition: inline
In-Reply-To: <6462154.GXAFRqVoOG@senjougahara>


--fetqgeupq2ey7hvw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] Revert "arm64: tegra: Disable ISO SMMU for Tegra194"
MIME-Version: 1.0

On Tue, Feb 17, 2026 at 12:53:54PM +0900, Mikko Perttunen wrote:
> On Thursday, January 22, 2026 7:22=E2=80=AFPM Mikko Perttunen wrote:
> > On Tuesday, December 9, 2025 1:21=E2=80=AFPM Aaron Kling wrote:
> > > On Mon, Nov 3, 2025 at 12:05=E2=80=AFPM Aaron Kling <webgeek1234@gmai=
l.com> wrote:
> > > >
> > > > On Mon, Nov 3, 2025 at 5:07=E2=80=AFAM Thierry Reding <thierry.redi=
ng@gmail.com> wrote:
> > > > >
> > > > > On Sat, Nov 01, 2025 at 06:13:26PM -0500, Aaron Kling wrote:
> > > > > > On Sat, Nov 1, 2025 at 6:01=E2=80=AFPM Aaron Kling via B4 Relay
> > > > > > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > > > > > >
> > > > > > > From: Aaron Kling <webgeek1234@gmail.com>
> > > > > > >
> > > > > > > This reverts commit ebea268ea583ba4970df425dfef8c8e21d0a4e12.
> > > > > > >
> > > > > > > Mmu is now being enabled for the display controllers.
> > > > > > >
> > > > > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > > > > ---
> > > > > > >  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
> > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/=
arm64/boot/dts/nvidia/tegra194.dtsi
> > > > > > > index 1399342f23e1c4f73b278adc66dfb948fc30d326..854ed6d46aa1d=
8eedcdfbae1fdde1374adf40337 100644
> > > > > > > --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > > > > > > +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > > > > > > @@ -1807,7 +1807,7 @@ iommu@10000000 {
> > > > > > >                         #iommu-cells =3D <1>;
> > > > > > >
> > > > > > >                         nvidia,memory-controller =3D <&mc>;
> > > > > > > -                       status =3D "disabled";
> > > > > > > +                       status =3D "okay";
> > > > > > >                 };
> > > > > > >
> > > > > > >                 smmu: iommu@12000000 {
> > > > > > >
> > > > > > > --
> > > > > > > 2.51.0
> > > > > > >
> > > > > > >
> > > > > >
> > > > > > Question for Jon as the author of the commit being reverted. The
> > > > > > commit message states "we do not have a way to pass frame-buffer
> > > > > > memory from the bootloader to the kernel". If I understand this
> > > > > > correctly, this is talking about seamless handoff. What does th=
is have
> > > > > > to do with enabling mmu on the display controllers? Seamless do=
es not
> > > > > > work on any tegra arch as far as I'm aware, but Tegra194 is the=
 only
> > > > > > one that doesn't have mmu enabled for the dc's. But enabling mmu
> > > > > > allows for better and faster memory allocation. My initial atte=
mpts to
> > > > > > enable this didn't work because I tried to attach them to the m=
ain mmu
> > > > > > unit, see the related freedesktop issue [0]. After noticing in =
the
> > > > > > downstream dt that the dc's are on a separate unit, I made it w=
ork.
> > > > > > And so far, it seems to work just as well as Tegra186. Then whe=
n I was
> > > > > > packaging up the change to submit, I found that this had been
> > > > > > explicitly disabled. But I'm not seeing why. Am I missing some
> > > > > > additional factors?
> > > > >
> > > > > This isn't seamless handoff to the Tegra DRM driver for display, =
but
> > > > > rather to simple-framebuffer. While this does technically work, i=
t also
> > > > > causes a spew of SMMU faults during early boot because the firmwa=
re does
> > > > > not properly pass the SMMU mapping information to the kernel.
> > > > >
> > > > > In a nutshell what happens is that the firmware sets up the displ=
ay
> > > > > controller to scan out from a reserved memory region, but it does=
 so
> > > > > without involving the SMMU, so it uses physical addresses directl=
y. When
> > > > > the kernel boots and the SMMU is enabled the continued accesses f=
rom
> > > > > display hardware cause SMMU faults (because there is no mapping f=
or the
> > > > > framebuffer addresses).
> > > > >
> > > > > That said, we did solve these issues and this may not be happening
> > > > > anymore with the most recent L4T releases, so it may be okay to r=
evert
> > > > > this now. We should find out exactly which release includes all t=
he
> > > > > needed changes so that it can be referenced in the commit message=
=2E I
> > > > > want to avoid people running new kernels with an old L4T release =
and
> > > > > then seeing these errors without any reference as to why that mig=
ht
> > > > > suddenly happen.
> > > >
> > > > For reference, I have rolled back my Android usecase to use the L4T
> > > > r32.7.6 bootloaders on T194 for a variety of reasons. So I am using
> > > > cboot as the final bootloader and not edk2 as in L4T r34/r35. I hav=
e a
> > > > pending cboot patch to support simple-framebuffer handoff, but have=
n't
> > > > fully verified it as tegra-drm is currently unable to takeover from
> > > > simplefb like openrm does for t234. But all that to say that since I
> > > > no longer use r35 for t194 I don't have the setup to easily verify
> > > > which point release works here and what doesn't.
> > >=20
> > > Any further thoughts on this patch?
> > >=20
> > > Aaron
> >=20
> > FWIW,
> >=20
> > looks like the edk2 patch to update iommu-addresses --
> >=20
> > commit 6071946461389221d2314cbbae0377610b5b1f6a
> > Author: Jan Bobek <jbobek@nvidia.com>
> > Date:   Tue Mar 21 00:15:27 2023 +0000
> >=20
> >     feat(NvDisplayControllerDxe): update FDT with framebuffer info
> >    =20
> >     On ready-to-boot and whenever FDT is installed, update FDT with
> >     framebuffer mode information, base address and size.
> >    =20
> >     Signed-off-by: Jan Bobek <jbobek@nvidia.com>
> >     Reviewed-by: Ashish Singhal <ashishsingha@nvidia.com>
> >=20
> > is in since r36.2
> >=20
> > $ git tag --contains 6071946461389221d2314cbbae0377610b5b1f6a | grep "^=
r"                                                                =20
> > r36.2
> > r36.3.0
> > r36.4.0
> > r36.4.3
> > r36.4.4
> > r36.4.5
> > r38.2
> > r38.4
> >=20
> > Not so good for T194 since r36 only supports Orin.
> >=20
> > I'll look into getting this cherry-picked to r35.
> >=20
> > Mikko
> >=20
> >=20
>=20
> I looked into this and it appears a version of this is in r35, but it
> only supports T234. However, I also found that at one point, L4T
> bootloader configuration has been modified to place the display
> controllers into SMMU bypass until otherwise configured by the kernel
> -- which the kernel does in tegra_mc_probe_device.
>=20
> I think that means there is still potential for an issue where the
> display continues to be on between tegra_mc_probe_device and tegradrm
> reconfiguring it. However, I cannot reproduce that happening -- most
> likely the display is being turned off before that because of a clock
> or power domain being turned off.
>=20
> In any case, this means that we no longer need to pass the
> framebuffer's information to the kernel. I think it would be good to
> have some clarity to ensure the issue described above cannot happen,
> but otherwise we should be able to enable IOMMU.

The problem would happen if you enable some sort of early framebuffer
support, such as simple-drm or simple-framebuffer. Maybe even efifb. I
think it'd still be worth getting the iommu-addresses code into r35 if
for nothing else but to have a bit more of a safety buffer for the
future.

If we don't and for some reason decide that we want early framebuffer
support, it might be too late to get UEFI updated for Tegra194. I recall
that the UEFI code for Tegra194 is different from the one for Tegra234,
so it is probably not as trivial as a simple cherry-pick, but I'll try
to do some digging and find the code that does this for Xavier.

Thierry

--fetqgeupq2ey7hvw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmmUP08ACgkQ3SOs138+
s6GFIQ//XG1Xz0l+YHGhvpD8IrLPSdzfmENzskMj3hFAcMeGg0ieOVSwcuodCJsw
ggJ2dOWI+NMp9zPILp/mUCzpo4RpR2GgLkeWwhgvgTTSXDSIV60hWTdTCUG8812r
zxJu9TbLHwvRFROTp1Y16AJDEWHw3bSritplZQf4bVCrJwUOyG/qQ7BBHnRzogPG
kVP6EBCVYQXtyBBhPAXuqdXwNpzB0j02116/AmIDJ21lGeNlBgXtla/uvDXVsNq7
zPP1feX7yvp5uZ2Kr/KxH/mHQq4sPZp9uso5O5ittm2XLkMzf4g0CTKjcZRKUXLn
xdipU2/FwWyi2tJEN7vYVhS652zeO5CzFEWUhYSsf9Nq2Kmg3HCQa2tfdwwWR+nM
4cr3F9JGCMtFwzkbfpq9zHYI3X1GbdTNPjNBEEQ28FkPXMhdXgQEiE2P5RSCGBD9
phzJ8Ra+nrEhaHQxJxEeeXpUIXSZfvNhYElZykjmyTCzFjoPo8ZjaU/EhQxXtdlr
JqaiEVHxWtIHALBELwT4+m0E+TYkr90mz7QKVMfIgVkuIX1z6cDKdwXIJ04YYXgj
TWO4BRMB5xXAro9Yt3oAI54tZDuD9hvk8ClMLHi/VDYNSdbQ8eqDvaFRH29QUJ0f
AYfR3K7nvKripzY0iCXyvrMrdFSuat+mzek/22ZXI4N9FZVg1rI=
=tagu
-----END PGP SIGNATURE-----

--fetqgeupq2ey7hvw--
