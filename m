From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu: Break insecure users by disabling
 bypass by default
Date: Thu, 2 May 2019 12:59:12 +0200
Message-ID: <20190502105912.GA943@ulmo>
References: <20190301192017.39770-1-dianders@chromium.org>
 <20190404145957.GA25912@fuggles.cambridge.arm.com>
 <4754bcf1-6423-f1fe-64d4-da4a35b164ad@free.fr>
 <20190424115231.GA14829@fuggles.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4118126348106361725=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190424115231.GA14829@fuggles.cambridge.arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Will Deacon <will.deacon@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>, Douglas Anderson <dianders@chromium.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>
List-Id: linux-tegra@vger.kernel.org


--===============4118126348106361725==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2019 at 12:52:31PM +0100, Will Deacon wrote:
> On Wed, Apr 24, 2019 at 01:36:58PM +0200, Marc Gonzalez wrote:
> > On 04/04/2019 17:00, Will Deacon wrote:
> >=20
> > > On Fri, Mar 01, 2019 at 11:20:17AM -0800, Douglas Anderson wrote:
> > >
> > >> If you're bisecting why your peripherals stopped working, it's
> > >> probably this CL.  Specifically if you see this in your dmesg:
> > >>   Unexpected global fault, this could be serious
> > >> ...then it's almost certainly this CL.
> > >>
> > >> Running your IOMMU-enabled peripherals with the IOMMU in bypass mode
> > >> is insecure and effectively disables the protection they provide.
> > >> There are few reasons to allow unmatched stream bypass, and even few=
er
> > >> good ones.
> > >>
> > >> This patch starts the transition over to make it much harder to run
> > >> your system insecurely.  Expected steps:
> > >>
> > >> 1. By default disable bypass (so anyone insecure will notice) but ma=
ke
> > >>    it easy for someone to re-enable bypass with just a KConfig chang=
e.
> > >>    That's this patch.
> > >>
> > >> 2. After people have had a little time to come to grips with the fact
> > >>    that they need to set their IOMMUs properly and have had time to
> > >>    dig into how to do this, the KConfig will be eliminated and bypass
> > >>    will simply be disabled.  Folks who are truly upset and still
> > >>    haven't fixed their system can either figure out how to add
> > >>    'arm-smmu.disable_bypass=3Dn' to their command line or revert the
> > >>    patch in their own private kernel.  Of course these folks will be
> > >>    less secure.
> > >>
> > >> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> > >> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > >> ---
> > >>
> > >> Changes in v2:
> > >> - Flipped default to 'yes' and changed comments a lot.
> > >>
> > >>  drivers/iommu/Kconfig    | 25 +++++++++++++++++++++++++
> > >>  drivers/iommu/arm-smmu.c |  3 ++-
> > >>  2 files changed, 27 insertions(+), 1 deletion(-)
> > >=20
> > > Cheers, I'll pick this one up for 5.2.
> >=20
> > Hello Will,
> >=20
> > You haven't pushed this patch out to linux-next AFAICT.
> >=20
> > Is that expected?
>=20
> It's on my branch for Joerg:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=3Df=
or-joerg/arm-smmu/updates
>=20
> which I'll send to him today. My SMMU stuff doesn't go directly into -nex=
t.

This made it to linux-next yesterday (less than a week before the merge
window opens) and deliberately breaks existing configurations. That's a
little rude.

At least give people a fair heads-up and a chance to fix things before
you start break things.

Thierry

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzKzXwACgkQ3SOs138+
s6FEuBAAi+xh5QKIWrVhomLbLNaWj3YIE8H1D7aTJIFFkif/lInhOMFC1x/6Quvp
jhtADzVX/1aAV426KGTnOFJzeMCCogGkQwBLDN8WDHU7qmyFFB+5IN7dwMe7MrKA
W5BYqRkduz7s9pOxdbnjoDA17C3dApCXo9sI+jG11TBZggdB3lKEG/Ho/OUyOR3W
hV7+LKY2Z2lufNDvQ5gtP28TTb3tJe6SLk0BtKSIsf4nBiUnWRXa6PI3x8cOhCG+
A8XlSDzSj+2jFFTNZ41OYPb51Urdqia9TQjb0CfTBpejUP4ZCcE9ixSfHVDhKyAF
vmBHOXk8lyU1OqQktejjoL6Zt9P0fletJ73tQpAmDked416OLQbeJo67q6E/WRdy
Tfq5W7pPnPkeyZzC2YJfwjrh/BG9CP0YTuvGiStNJ5zg/tDbPUGlneV0IqEAO049
113Ud9MYmP5v8numPj8ZfoIe0TgT1/oe99zefDCFtFHc3NGt/HRLyBFD01BrHWGP
qGkwwj/F/Ka8F11HMMZdnGZFdCRODC8pmi+djX0aIBapOhaZbxoDikZnAk/b9W/o
TZ/R75tuj9i9H8ZvWqFXP1gcCkHpeLIGQwNOfV5UKspw9+AyPWuB7O4BPGORWL4W
9PXpAPnwze9DTOQ4IxxLb0cVB9GECg2YkXamCMmexQ4HtGDB5uQ=
=XADm
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--


--===============4118126348106361725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4118126348106361725==--
