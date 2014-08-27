From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add PCIe-related pins to the Jetson TK1
 pinmux tables
Date: Wed, 27 Aug 2014 07:52:48 +0200
Message-ID: <20140827055247.GC15640@ulmo>
References: <1408742308-18004-1-git-send-email-swarren@wwwdotorg.org>
 <53FB10B8.3010408@suse.de>
 <53FB160F.6000700@nvidia.com>
 <53FB27AB.8010608@nvidia.com>
 <53FD0980.2010803@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WfZ7S8PLGjBY9Voh"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53FD0980.2010803-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--WfZ7S8PLGjBY9Voh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2014 at 12:26:08AM +0200, Andreas F=C3=A4rber wrote:
> Am 25.08.2014 14:10, schrieb Mikko Perttunen:
> > On 25/08/14 13:55, Mikko Perttunen wrote:
> >> On 25/08/14 13:32, Andreas F=C3=A4rber wrote:
> >>> Am 22.08.2014 23:18, schrieb Stephen Warren:
> >>>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>>
> >>>> This pinmux tables currently omit any configuration for PCIe clk_req,
> >>>> wake, and rst pins, which in turn causes intermittent failures in
> >>>> U-Boot's PCIe support. Import an updated version of the pinmux tables
> >>>> which rectifies this.
> >>>>
> >>>> (While I'm still hoping to remove the pinmux tables from DTs for
> >>>> Tegra124+ devices, while they're still here, they may as well be
> >>>> complete and correct).
> >>>>
> >>>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>> ---
> >>>>   arch/arm/boot/dts/tegra124-jetson-tk1.dts | 35
> >>>> +++++++++++++++++++++++++++++++
> >>>>   1 file changed, 35 insertions(+)
> >>>
> >>> I've tested this patch on both -rc1 and yesterday's torvalds/linux.git
> >>> with tegra_defconfig: Both with or without this patch I get empty lsp=
ci
> >>> output.
> >>>
> >>> There doesn't seem to be a tegra/linux.git for-next branch based on -=
rc1
> >>> yet - are patches from other subsystem trees needed to get the on-boa=
rd
> >>> Ethernet detected or maybe some config option?
> >>
> >> git://gitorious.org/thierryreding/linux.git staging/pci
> >
> > .. and apparently the device tree patches are in staging/tegra.
>=20
> Thanks for the URLs. I tested yesterday's staging/master, but booting
> from SD seemed broked, sdhci-tegra probe kept deferring. Is that a known
> issue?

Yes, this is a known issue. The root is that currently there's no way to
allow deferred probing if an IOMMU hasn't been probed, so a driver needs
to continue without IOMMU support even if the IOMMU would come up later
in the boot process. The staging/iommu branch contains a patch to fix it
but it looks as if that won't be merged.

I've since removed the code that registers the Tegra SMMU with the code
that I introduced but haven't removed the registry patch yet, which will
cause the SMMU never to show up and therefore indefinitely deferring
probe. You can easily solve this by removing the iommus property from
the sdhci nodes in DTS or by removing the calls to iommu_attach() and
iommu_detach() from the SDHCI driver (reverting "mmc: sdhci-tegra: Add
IOMMU support").

I'll see if I can find the time today to fix up the branches.

Thierry

--WfZ7S8PLGjBY9Voh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT/XIvAAoJEN0jrNd/PrOh0doP/RnHAHyI4mb4vlYjLj7eC7JN
LO3KRlzv5juUeeUVenjjezwS6ehfTYdtuIQ4fRoZei9gr7Hr1WgDlUHp9Uco6sP9
L9HaRKdHVUBxkcuhEmNtM0neq0MpPHYf12eP1/te6U6pPrn1EK0TWb12187MJDo6
PCbOCT8tfbjz+ybElc77WoZ+QTuI6y4ZbSHdEq8bqXJPKsR+ZN9hlsAFjXLqsnCf
WUPgA8+Sxh8wGgQcAbveOKbj4OYX+ANGfDtsdJ4TlNUbsUMgg4GCHEutuHIhlZlh
sIk2ojbQvdKn9ib+0lWBxeYAF6CL7g/snE8fUclwPPwCLaRUumLwn+HtPtzut5zc
xCGbpZHHIOE/rwA+3zOMhpDNndYet1EskCKOfB1ur38kabFm6ku235T/0yw310cI
j12xeRLlsfVnWSFoW2r2QY1TANPbQK0xpFYEW94fcljaUzGfq/QUmH6pTwhvtFu4
tgDnzWOUlWejHFBIFL6eP+6rEa0aecD6PKmOQJNgNxoR78SMkQTHQB9nnbzoVJnY
khVfdMLxlJ69Gcs16h83UGMJesird6ub7HRlUnsRU5aY2fC/Tpnekbd4+PQv2Cz7
sz4N9Lywwr3LFktYjQsvubU15hmI713V4Q777aPYXVn6Dp/ldPlkQTBXWhhQnwGJ
6a/EiTYD0YPtshdVadOx
=kcM0
-----END PGP SIGNATURE-----

--WfZ7S8PLGjBY9Voh--
