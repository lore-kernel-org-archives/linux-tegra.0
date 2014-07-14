From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/12] Add NVIDIA Tegra FUSE driver
Date: Mon, 14 Jul 2014 08:57:57 +0200
Message-ID: <20140714065756.GG2081@ulmo>
References: <1405080971-7609-1-git-send-email-thierry.reding@gmail.com>
 <20140713063815.GA24843@quad.lixom.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ahP6B03r4gLOj5uD"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140713063815.GA24843-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ahP6B03r4gLOj5uD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 12, 2014 at 11:38:15PM -0700, Olof Johansson wrote:
> On Fri, Jul 11, 2014 at 02:15:59PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > This series is an extension of Peter's original series to add a proper
> > driver for the FUSE block on Tegra.
> >=20
> > Patches 1 and 2 are preparatory work that cleans up include lists and
> > introduces a function to query the Tegra chip ID rather than accessing
> > a simple variable. This is used by subsequent patches to allow us to
> > execute code when the variable is accessed to help in pin-pointing
> > locations where it's accessed before the driver had a chance to
> > initialize.
> >=20
> > Patches 3 through 8 are Peter's series with a fixup patch by Stephen. I
> > also moved the driver to drivers/soc/tegra/fuse as requested by Olof.
> >=20
> > Patches 9 and 10 defer usages of the tegra_get_chip_id() function to a
> > later stage (pure_initcall). This allows patch 11 to set up the early
> > FUSE support code from an early initcall. This has the advantage of not
> > requiring an explicit call from SoC setup code in arch/arm/mach-tegra
> > and will allow the code to be shared on 64-bit variants of Tegra.
> >=20
> > Patch 12 finally turns the PMC and powergate support code into a proper
> > driver which also sets up a minimal environment from an early initcall.
> > The driver isn't moved out of arch/arm/mach-tegra yet because people
> > have suggested drivers/power as a good home, but that whole directory
> > depends on the POWER_SUPPLY Kconfig symbol yet this driver doesn't have
> > anything to do with that. Once that debate has been settled the driver
> > can easily be moved out in a separate patch.
> >=20
> > Some of the patches in this series introduce diagnostic WARN() messages
> > if functions are called without setup having completed. I've booted the
> > v3.16-rc1 kernel with these changes on top on Tegra20 (TrimSlice),
> > Tegra30 (Beaver), Tegra114 (Dalmore) and Tegra124 (Jetson TK1) without
> > encountering any of the diagnostic warnings and without noticing any
> > breakage.
> >=20
> > Olof, this series should address the concerns you expressed after
> > reviewing Stephen's earlier pull request for Peter's FUSE driver series.
> > It would be great if you could take another look to see if this is more
> > according to your taste. I'll see if I can take this through linux-next
> > for a little and if you have no objections will submit another pull
> > request next week.
>=20
> I haven't looked at all the patches in detail yet, but I do like
> the approach in general. I've also applied and pushed them out for
> build+test here, but they're queued behind a couple of other builds
> so I won't have it until morning (you can poll for boot logs at
> arm-soc.lixom.net/bootlogs/misc/v3.16-rc4-371-g2c9d948 if you want to
> preempt me).

Looks like Tegra boards are all fine. Thanks for testing these.

> > Peter De Schrijver (5):
> >   ARM: tegra: export apb dma readl/writel
>=20
> I thought I saw a patch from Peter that moved the apbio read code to
> the fuse driver since there are no other consumers. I think that's a
> reasonable thing to do.

That's a later patch in this series:

	soc/tegra: fuse: move APB DMA into Tegra20 fuse driver

Thierry

--ahP6B03r4gLOj5uD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTw390AAoJEN0jrNd/PrOh6sUP/iOYkPVCU3DLjWCZUnI894ov
IZs40b4YzBmp+wtiOCGagUNjZBHdAdj8kxk6r9QBBHSvXon6nu2mVUDcW8z1iPZ5
H3STElyTL8JPabRJnu/7wvzpwJDmEeIqUPIyAvTS2yGeG55cY0Om3LZdtlGMEON1
EtF9VMYdM79XA21hjt0YfbjU0VVt9Tbi83ltrwjvEscJOS0rIVCdid/S5Cfh77go
+gQ/QhCZmPSxMOmlGOLRHl6A5TDfaT0HNT/U63ZpCvkngOTUsRVmkaaOjIdohciq
w/qi2GCQ/WSq2sVezzY5Mc29e2PAdNewxLo0AfgadlFBRBqwMfFjWdIGV5UuVQH3
vtk0JJ5usHZGBslbQoHRUJKicJhiE2LF0+HTnHmJqAAeYGi80SKUquTNfoJIOl48
uT4wA5MvT+HME9aN7ZfzvKyxrTxGcp4510gGaPm6pL5L8qf3DNhkrRG10EzCdqb0
bfx/DGIiOyrrpB8K0kAf0Lydeyho1ouCFRxFArlIoEjkk/3zk+QF5v5TPeQ3m57T
zaJmOD0LpMpjnvjA1HR2MNjL6n3iE/+1fDUGqodzVP0wuI1dQbMwhJvzMepL4zZ/
ke695F98rUPsTX4gPD1ddqoLKgtx4TKouI33nsp38ok4N5zEFgCBaHucNyJp6Lzf
pVEvY43icTrZ6zH9zYd+
=6deC
-----END PGP SIGNATURE-----

--ahP6B03r4gLOj5uD--
