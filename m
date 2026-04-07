Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773AE3921DC;
	Tue,  7 Apr 2026 08:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775549769; cv=none; b=OUMJ0+jR+hcie8K/GcFNFGm50a9NEhVguehaXx5NsqZGtJefdCDYG15YLwhOZaCO9IYSRxCnWaMPafk+NXYdGTsvV5+w2rwRnUpY+SXnpslhqMz1PZd5QpaCFGrCVW+1u6/ksMFVzk6yuHJmQHuvgvCcB4hS8YlVoe9cpt9A6II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775549769; c=relaxed/simple;
	bh=5HIYMlPMzc1D8yI5x7y+asm01gDTP/B7NyU9igNS70g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CH4AhIwQmfHleuFOB6aLghgUD3fu3N5dyi3MV41FPrMs4uQ/Q2Ma4nPLqcLKF1M6eNRC9Jf1LsMqZArsMjf3HswN59Jo0aTnEmbrzLZ3DCLU8xqXzAgBnQpjHCaRCqPVuj8VCMWGvKq+SuKOZys7B1RLOvqkHyB7L9o0jZImKWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nk/LXM+h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nk/LXM+h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F34C116C6;
	Tue,  7 Apr 2026 08:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775549769;
	bh=5HIYMlPMzc1D8yI5x7y+asm01gDTP/B7NyU9igNS70g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nk/LXM+hc618EZxGgjdkWgrAQIPNL89/e4bX1OKWv0EZWpU539EgnbI7c4wBIZCnt
	 5x5wjYRHC28mD2J7QAOSQrSz29cAEFMneU43zaOOwo8CcKKMd8VrG9zCpXiKyGkV7c
	 r6yohn5Np6Svzj3yqVjBAInHiVquHnnqwXXaEzLvzPIR/fbmwcc6cDuEcCzyjgkqMY
	 VRqTzEdg+oCHuDQDCHbOqDuQEklkqQo8MOtU4b5AKmasHWghLNqWWEAf82o+N7XXvl
	 MrHZHtPQAumLBkNNYOFb9DEFSML9p2KHPhjW1m20GWwsgo0LMgcMABXVjSIrw3aYmI
	 GFympVDm0ceNQ==
Date: Tue, 7 Apr 2026 10:16:06 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Aaron Kling <webgeek1234@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Revert "arm64: tegra: Disable ISO SMMU for Tegra194"
Message-ID: <adS8piKaT7YsiEbp@orome>
References: <20251101-tegra194-dc-mmu-v1-0-8401c45d8f13@gmail.com>
 <aZQ-cMn-3vI7UH7t@orome>
 <CALHNRZ8Zs2Zp80OgoU6R54=n76JgiYGbMvWD2iP9HpUFYO2big@mail.gmail.com>
 <oPjOdaRsQES6O8jgrehMZw@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k4yffoddqzcqqleg"
Content-Disposition: inline
In-Reply-To: <oPjOdaRsQES6O8jgrehMZw@nvidia.com>


--k4yffoddqzcqqleg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] Revert "arm64: tegra: Disable ISO SMMU for Tegra194"
MIME-Version: 1.0

On Tue, Apr 07, 2026 at 01:09:10PM +0900, Mikko Perttunen wrote:
> On Monday, April 6, 2026 4:49=E2=80=AFPM Aaron Kling wrote:
> > On Tue, Feb 17, 2026 at 4:13=E2=80=AFAM Thierry Reding
> > <thierry.reding@kernel.org> wrote:
> > >
> > > On Tue, Feb 17, 2026 at 12:53:54PM +0900, Mikko Perttunen wrote:
> > > > On Thursday, January 22, 2026 7:22=E2=80=AFPM Mikko Perttunen wrote:
> > > > > On Tuesday, December 9, 2025 1:21=E2=80=AFPM Aaron Kling wrote:
> > > > > > On Mon, Nov 3, 2025 at 12:05=E2=80=AFPM Aaron Kling <webgeek123=
4@gmail.com> wrote:
> > > > > > >
> > > > > > > On Mon, Nov 3, 2025 at 5:07=E2=80=AFAM Thierry Reding <thierr=
y.reding@gmail.com> wrote:
> > > > > > > >
> > > > > > > > On Sat, Nov 01, 2025 at 06:13:26PM -0500, Aaron Kling wrote:
> > > > > > > > > On Sat, Nov 1, 2025 at 6:01=E2=80=AFPM Aaron Kling via B4=
 Relay
> > > > > > > > > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > > > > > > > > >
> > > > > > > > > > From: Aaron Kling <webgeek1234@gmail.com>
> > > > > > > > > >
> > > > > > > > > > This reverts commit ebea268ea583ba4970df425dfef8c8e21d0=
a4e12.
> > > > > > > > > >
> > > > > > > > > > Mmu is now being enabled for the display controllers.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > > > > > > > ---
> > > > > > > > > >  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
> > > > > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > > > > >
> > > > > > > > > > diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b=
/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > > > > > > > > > index 1399342f23e1c4f73b278adc66dfb948fc30d326..854ed6d=
46aa1d8eedcdfbae1fdde1374adf40337 100644
> > > > > > > > > > --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > > > > > > > > > +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > > > > > > > > > @@ -1807,7 +1807,7 @@ iommu@10000000 {
> > > > > > > > > >                         #iommu-cells =3D <1>;
> > > > > > > > > >
> > > > > > > > > >                         nvidia,memory-controller =3D <&=
mc>;
> > > > > > > > > > -                       status =3D "disabled";
> > > > > > > > > > +                       status =3D "okay";
> > > > > > > > > >                 };
> > > > > > > > > >
> > > > > > > > > >                 smmu: iommu@12000000 {
> > > > > > > > > >
> > > > > > > > > > --
> > > > > > > > > > 2.51.0
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > Question for Jon as the author of the commit being revert=
ed. The
> > > > > > > > > commit message states "we do not have a way to pass frame=
-buffer
> > > > > > > > > memory from the bootloader to the kernel". If I understan=
d this
> > > > > > > > > correctly, this is talking about seamless handoff. What d=
oes this have
> > > > > > > > > to do with enabling mmu on the display controllers? Seaml=
ess does not
> > > > > > > > > work on any tegra arch as far as I'm aware, but Tegra194 =
is the only
> > > > > > > > > one that doesn't have mmu enabled for the dc's. But enabl=
ing mmu
> > > > > > > > > allows for better and faster memory allocation. My initia=
l attempts to
> > > > > > > > > enable this didn't work because I tried to attach them to=
 the main mmu
> > > > > > > > > unit, see the related freedesktop issue [0]. After notici=
ng in the
> > > > > > > > > downstream dt that the dc's are on a separate unit, I mad=
e it work.
> > > > > > > > > And so far, it seems to work just as well as Tegra186. Th=
en when I was
> > > > > > > > > packaging up the change to submit, I found that this had =
been
> > > > > > > > > explicitly disabled. But I'm not seeing why. Am I missing=
 some
> > > > > > > > > additional factors?
> > > > > > > >
> > > > > > > > This isn't seamless handoff to the Tegra DRM driver for dis=
play, but
> > > > > > > > rather to simple-framebuffer. While this does technically w=
ork, it also
> > > > > > > > causes a spew of SMMU faults during early boot because the =
firmware does
> > > > > > > > not properly pass the SMMU mapping information to the kerne=
l.
> > > > > > > >
> > > > > > > > In a nutshell what happens is that the firmware sets up the=
 display
> > > > > > > > controller to scan out from a reserved memory region, but i=
t does so
> > > > > > > > without involving the SMMU, so it uses physical addresses d=
irectly. When
> > > > > > > > the kernel boots and the SMMU is enabled the continued acce=
sses from
> > > > > > > > display hardware cause SMMU faults (because there is no map=
ping for the
> > > > > > > > framebuffer addresses).
> > > > > > > >
> > > > > > > > That said, we did solve these issues and this may not be ha=
ppening
> > > > > > > > anymore with the most recent L4T releases, so it may be oka=
y to revert
> > > > > > > > this now. We should find out exactly which release includes=
 all the
> > > > > > > > needed changes so that it can be referenced in the commit m=
essage. I
> > > > > > > > want to avoid people running new kernels with an old L4T re=
lease and
> > > > > > > > then seeing these errors without any reference as to why th=
at might
> > > > > > > > suddenly happen.
> > > > > > >
> > > > > > > For reference, I have rolled back my Android usecase to use t=
he L4T
> > > > > > > r32.7.6 bootloaders on T194 for a variety of reasons. So I am=
 using
> > > > > > > cboot as the final bootloader and not edk2 as in L4T r34/r35.=
 I have a
> > > > > > > pending cboot patch to support simple-framebuffer handoff, bu=
t haven't
> > > > > > > fully verified it as tegra-drm is currently unable to takeove=
r from
> > > > > > > simplefb like openrm does for t234. But all that to say that =
since I
> > > > > > > no longer use r35 for t194 I don't have the setup to easily v=
erify
> > > > > > > which point release works here and what doesn't.
> > > > > >
> > > > > > Any further thoughts on this patch?
> > > > > >
> > > > > > Aaron
> > > > >
> > > > > FWIW,
> > > > >
> > > > > looks like the edk2 patch to update iommu-addresses --
> > > > >
> > > > > commit 6071946461389221d2314cbbae0377610b5b1f6a
> > > > > Author: Jan Bobek <jbobek@nvidia.com>
> > > > > Date:   Tue Mar 21 00:15:27 2023 +0000
> > > > >
> > > > >     feat(NvDisplayControllerDxe): update FDT with framebuffer info
> > > > >
> > > > >     On ready-to-boot and whenever FDT is installed, update FDT wi=
th
> > > > >     framebuffer mode information, base address and size.
> > > > >
> > > > >     Signed-off-by: Jan Bobek <jbobek@nvidia.com>
> > > > >     Reviewed-by: Ashish Singhal <ashishsingha@nvidia.com>
> > > > >
> > > > > is in since r36.2
> > > > >
> > > > > $ git tag --contains 6071946461389221d2314cbbae0377610b5b1f6a | g=
rep "^r"
> > > > > r36.2
> > > > > r36.3.0
> > > > > r36.4.0
> > > > > r36.4.3
> > > > > r36.4.4
> > > > > r36.4.5
> > > > > r38.2
> > > > > r38.4
> > > > >
> > > > > Not so good for T194 since r36 only supports Orin.
> > > > >
> > > > > I'll look into getting this cherry-picked to r35.
> > > > >
> > > > > Mikko
> > > > >
> > > > >
> > > >
> > > > I looked into this and it appears a version of this is in r35, but =
it
> > > > only supports T234. However, I also found that at one point, L4T
> > > > bootloader configuration has been modified to place the display
> > > > controllers into SMMU bypass until otherwise configured by the kern=
el
> > > > -- which the kernel does in tegra_mc_probe_device.
> > > >
> > > > I think that means there is still potential for an issue where the
> > > > display continues to be on between tegra_mc_probe_device and tegrad=
rm
> > > > reconfiguring it. However, I cannot reproduce that happening -- most
> > > > likely the display is being turned off before that because of a clo=
ck
> > > > or power domain being turned off.
> > > >
> > > > In any case, this means that we no longer need to pass the
> > > > framebuffer's information to the kernel. I think it would be good to
> > > > have some clarity to ensure the issue described above cannot happen,
> > > > but otherwise we should be able to enable IOMMU.
> > >
> > > The problem would happen if you enable some sort of early framebuffer
> > > support, such as simple-drm or simple-framebuffer. Maybe even efifb. I
> > > think it'd still be worth getting the iommu-addresses code into r35 if
> > > for nothing else but to have a bit more of a safety buffer for the
> > > future.
> > >
> > > If we don't and for some reason decide that we want early framebuffer
> > > support, it might be too late to get UEFI updated for Tegra194. I rec=
all
> > > that the UEFI code for Tegra194 is different from the one for Tegra23=
4,
> > > so it is probably not as trivial as a simple cherry-pick, but I'll try
> > > to do some digging and find the code that does this for Xavier.
> >=20
> > Any updates on this?
>=20
> FWIW, in my testing with L4T versions with UEFI firmware, I'm not seeing=
=20
> any issues even if efifb is enabled. My inclination would be to merge,=20
> and we can work on issues related to early framebuffer separately.
>=20
> Outside adding support to r35, one option is to make it so TegraDRM has=
=20
> to explicitly call tegra_mc_probe_device (not necessarily directly) when=
=20
> it has quiesced the hardware during probe. This would not allow seamless=
=20
> early framebuffer transition, but otherwise it should work. Implementing=
=20
> this for tegra-smmu would also allow us to get rid of the IOMMU API=20
> paths in TegraDRM and Host1x, which would be a great boon.

I did most of this work a long time ago and L4T just wasn't ready yet to
make use of all this cleanup potential. We can probably go find most of
the code and it might still be largely applicable.

It's a bit disappointing that this didn't go anywhere for the longest
time and all of a sudden most of it just seems to be irrelevant.

Thierry

--k4yffoddqzcqqleg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnUvUYACgkQ3SOs138+
s6HMzg//eKAsPanj1nmFH4tfFeQEC1uIC6b/p7FF7aYK6m9/yLWwyzACBfsqS9oT
XKn1Hjhd2nNs8RYcYRtZB68hfNSfvCd/oM7GehPEXzPsNBuMxuVb+grkZKmaOcF+
X052YLMv13DGe7LJB1kXMK2kvIcOHDt5+IjT+bGVZau6tGrN5SbFlWUCI76EX/72
4Sh2OakCO3p0oTDsQIPS0uDDv+h5GPKl+s798MuzJf1uCfkQqpPe5EU7fB40T4eI
LxrUdrizSCcHPxhSyIajF4piSooxa4EYFDTEnIUpGi2tb8VmPf/4+0oef3Qaw5yH
3ZFGCFqOQTpOLVBlpUz3S5s12vBe6uLqb5mYpKJFqqo7DozoiCcv10yrkhc+S4nu
xPWSlnxzLCh19MHkyLAiF3qxgAP8NqiKXRxqgHN/TRMGky+pVpo66B4U8tU+30rr
USduKdgc8LZMkjOH3EvlbDd1euQWYYgUrJZsYbgNfsZaCn1dpKDl4wNW6eX8yRSh
UF6kOub8fxS52gXt6FMU0wJUd3GdShu+FN5J6tZcpXjVDQyw5rH+KaxA3UPkgbXn
lxGH1RTCOPpziaWqpS61J3oSfCSC/7o9BcQE7IciwQt1AVawrtKLPA5VJHNgTCUV
9G3ROX0waZspOXRGXsqh6L26geb9mdJpmNFlWL+YqT77q9IIe38=
=LoxX
-----END PGP SIGNATURE-----

--k4yffoddqzcqqleg--
