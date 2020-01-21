From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] PCI: Add MCFG quirks for Tegra194 host controllers
Date: Tue, 21 Jan 2020 14:44:35 +0100
Message-ID: <20200121134435.GC899558@ulmo>
References: <20200103174935.5612-1-vidyas@nvidia.com>
 <CABhMZUUHGEEhsJ-+foSsodqtKXyX5ZNPkGgv_VzXz=Qv+NVcUA@mail.gmail.com>
 <9a767725-9671-6402-4e1c-a648f5a7860b@nvidia.com>
 <20200117121736.GA7072@e121166-lin.cambridge.arm.com>
 <20200120111042.GA203160@ulmo>
 <20200120151849.GA24402@e121166-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="S1BNGpv0yoYahz37"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200120151849.GA24402-LhTu/34fCX3ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, bjorn-vnFzb0PiAZFBDgjK7y7TUQ@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sagar.tv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--S1BNGpv0yoYahz37
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2020 at 03:18:49PM +0000, Lorenzo Pieralisi wrote:
> On Mon, Jan 20, 2020 at 12:10:42PM +0100, Thierry Reding wrote:
>=20
> [...]
>=20
> > > > Currently the BSP has the kernel booting through Device Tree mechan=
ism
> > > > and there is a plan to support UEFI based boot as well in the futur=
e software
> > > > releases for which we need this quirky way of handling ECAM.
> > > > Tegra194 is going to be the only and last chip with this issue and =
next chip
> > > > in line in Tegra SoC series will be fully compliant with ECAM.
> > >=20
> > > ACPI on ARM64 works on a standard subset of systems, defined by the
> > > ARM SBSA:
> > >=20
> > > http://infocenter.arm.com/help/topic/com.arm.doc.den0029c/Server_Base=
_System_Architecture_v6_0_ARM_DEN_0029C_SBSA_6_0.pdf
> >=20
> > I don't understand what you're saying here. Are you saying that you want
> > to prevent vendors from upstreaming code that they need to support their
> > ACPI based platforms? I understand that the lack of support for proper
> > ECAM means that a platform will not be SBSA compatible, but I wasn't
> > aware that lack of SBSA compatibility meant that a platform would be
> > prohibited from implementing ACPI support in an upstream kernel.
>=20
> ACPI on ARM64 requires a set of HW components described in the SBSA.
>=20
> If those HW requirements are not fulfilled you can't bootstrap an ARM64
> system with ACPI - it is as simple as that.

That's an odd statement. We do in fact have an ARM64 system that doesn't
fulfill the ECAM requirement and yet it successfully boots with ACPI.

>                                             It is not even appropriate
> to discuss this on a Linux mailing list anymore since it is HW
> requirements and it has been public information since ACPI on ARM64 was
> first enabled.

Erm... we're discussing Linux patches. Why would it be inappropriate to
discuss them on a Linux mailing list?

> > > These patches will have to be carried out of tree, the MCFG quirk
> > > mechanism (merged as Bjorn said more than three years ago) was suppos=
ed
> > > to be a temporary plaster to bootstrap server platforms with teething
> > > issues, the aim is to remove it eventually not to add more code to it
> > > indefinitely.
> >=20
> > Now, I fully agree that quirks are suboptimal and we'd all prefer if we
> > didn't have to deal with them. Unfortunately the reality is that
> > mistakes happen and hardware doesn't always work the way we want it to.
> > There's plenty of other quirk mechanisms in the kernel, and frankly this
> > one isn't really that bad in comparison.
>=20
> Because you don't have to maintain it ;) - I think I said what I had to
> say about the MCFG mechanism in the past - it has been three years
> and counting - it is time to remove it rather that adding to it.

What makes you think you can simply remove this without breaking support
for all of the devices that currently rely on the quirks?

> > > So I am afraid but this quirk (and any other coming our way) will not=
 be
> > > merged in an upstream kernel anymore - for any queries please put Nvi=
dia
> > > in touch.
> >=20
> > Again, I don't understand what you're trying to achieve here. You seem
> > to be saying that we categorically can't support this hardware because
> > it isn't fully SBSA compatible.
>=20
> I am not trying to achieve anything - I am just stating public
> information - let me repeat it again for interested readers: to
> bootstrap an ARM64 system with ACPI the platform HW design must follow
> the SBSA guidelines.

Can you clarify for me where I can find this public information? What
I've been able to find suggests that that SBSA-compliant systems would
typically run ACPI, but I can't find anything about SBSA compliance
being a prerequisite for booting a system with ACPI.

I can understand why someone might *wish* for that to always be true,
but it seems to be a bit far removed from reality.

> > Do you have any alternative suggestions on how we can support this in an
> > upstream kernel?
>=20
> Booting with a device tree ?

We can already do that, but should that prevent us from making UEFI and
ACPI an alternative boot mechanism?

> > We realized a while ago that we cannot achieve proper ECAM on Tegra194
> > because of some issues with the hardware and we've provided this as
> > feedback to the hardware engineers. As a result, the next generation of
> > Tegra should no longer suffer from these issues.
>=20
> We will bootstrap next generation Tegra with ACPI then, there are
> SBSA tests available for compliancy - again, that's a matter for
> Nvidia and Arm to settle, not a mailing list discussion.

I don't understand why you keep insisting on this. The mailing lists are
where kernel patches are discussed, are they not?

> > As for Tegra194, that chip taped out two years ago and it isn't possible
> > to make it fully ECAM compliant other than by revising the chip, which,
> > frankly, isn't going to happen.
> >=20
> > So I see two options here: either we find a way of dealing with this, by
> > either merging this quirk or finding an alternative solution, or we make
> > the decision that some hardware just can't be supported.
> >=20
> > The former is fairly common, whereas I've never heard of the latter.
>=20
> What does this mean ? Should I wreck the upstream kernel to make it boot
> with ACPI on *any* ARM64 platform out there then ?

Heh... you must have a very low opinion of the upstream kernel if you
think merging these 100 lines of code is going to wreck it.

And if you look at the patch, the bulk (95/109 lines) is actually in the
Tegra194 PCIe driver and only 14/109 lines are added to the MCFG quirks.
That's hardly the kind of change that's going to wreck the kernel.

> My stance is clear above and the ACPI PCI programming model - inclusive
> of firmware - has been there since ACPI was deployed, if ACPI support
> is required HW must comply, either that or it is out of tree patches
> and I can't be blamed for that.

Looking at the existing quirks table, there's evidently a number of
people that didn't get the memo. The issue seems to be fairly common,
yet for some reason you're singling out Tegra194.

Thierry

--S1BNGpv0yoYahz37
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4nAEEACgkQ3SOs138+
s6G5DQ/9G0ZaDC8Mzmqe9WaV7CIEFGsBcaF8PeT7dmcnEc9yaR1hcFy255/cDsSA
IKNlJgD7GdhlSLKRqUOA1jpfMBhfGGRrZ62yG/Ba7Ha1IevQTlmQrvqW4lDbCAH4
My53v0C3pEsBu9SFsvUxG8PenzWwq6OWtFXOwSngmF/iVyXoNgENJCxjC1perYn6
mAWNINizszqjmlKyaOguNx4Pct/9awCESnrmATe6pnGkZ84r3SSU3TkzihizNpGc
4tbTBHfzAIkldohAJ/dskbXdRDlv2uFabwJMYt554Irb6tnmx8xPZ73SBXjJ6qFz
ljQf2d6c82KEfyVkfAODJaskWWvMLIhq9vVnpNDjtXQbQaRtXtYBD3TG4sRyDOFh
G4hCRYmNkunnr636vR/la/0yi5ld5K0dSJOlYfzLFbjmyZ3OSv0ppJw3QHcyYN9F
0H66WiZNYKHaVhhtGwSjEd3mYX0lH2xGgfNBHTekARi0BUbVfNT1kuwfaontTJYw
HXhrdMRc+rugMu4jZ5rFq3KrX31sY6pUw07Z0O//EYne4pGDtx8Fluqei2kMZwug
MmeO0ikMgXpXDloX5azoWn7wUvjMfhsAzVULVX8kahDmL8BgKttH/y5iSWDWFwao
bdNvSU81crFj9E37pnjfo1+tAQ9N9hLcF16frOywJnDhvAvvpAM=
=/1Qm
-----END PGP SIGNATURE-----

--S1BNGpv0yoYahz37--
