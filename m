From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 02/10] pwm: Allow chips to support multiple PWMs.
Date: Wed, 8 Feb 2012 11:31:20 +0100
Message-ID: <20120208103119.GA17615@avionic-0098.mockup.avionic-design.de>
References: <1328541585-24642-1-git-send-email-thierry.reding@avionic-design.de>
 <1328541585-24642-3-git-send-email-thierry.reding@avionic-design.de>
 <4F31AB63.3020301@gmail.com>
 <20120208081508.GA6673@avionic-0098.mockup.avionic-design.de>
 <20120208091720.GI889@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120208091720.GI889-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Russell King - ARM Linux wrote:
> On Wed, Feb 08, 2012 at 09:15:08AM +0100, Thierry Reding wrote:
> > * Ryan Mallon wrote:
> > > On 07/02/12 02:19, Thierry Reding wrote:
> > > > The total maximum number of PWM devices is currently fixed to 64, b=
ut
> > > > can easily be made configurable via Kconfig.
> > >=20
> > > It would be better to make the code handle arbitrary numbers of PWMs.=
 A
> > > Kconfig knob becomes annoying when you have more than one platform
> > > configured into the kernel.
> >=20
> > AFAICT handling an arbitrary number of PWMs will only be possible once =
we get
> > rid of the global namespace and therefore should be postponed for later=
=2E I
> > may be wrong, though, so if anybody can point me in the right direction=
 I'm
> > perfectly happy to change that in this series.
>=20
> One solution would be to look at how genirq handles this.  Eg, it uses a
> radix tree to store the irqdescs rather than an array, and a bitmap
> showing which global numbers are allocated.

That's exactly the solution implemented by this second version of the serie=
s.
In fact I did turn to genirq for inspiration at the time I wrote the code.
My understanding was that Ryan proposed to get rid of the bitmap altogether
because it arbitrarily limits the number of PWMs. How that can be achieved
with a global namespace I don't know. Thus my proposal to keep it as-is for
now and get rid of it once per-chip indexing is implemented.

Thierry

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk8yTvcACgkQZ+BJyKLjJp8PbwCgrCBbVZUCMReek2/gDUDQIDOh
dU0An0TcaUMDNUOIgsNJxcaoTLyWo5eB
=K7Ve
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
