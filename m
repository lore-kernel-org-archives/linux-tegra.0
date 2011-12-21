From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [RFC 6/7] pwm: Add Tegra2 SoC support
Date: Wed, 21 Dec 2011 08:19:27 +0100
Message-ID: <20111221071927.GA542@avionic-0098.mockup.avionic-design.de>
References: <1324377138-32129-1-git-send-email-thierry.reding@avionic-design.de>
 <1324377138-32129-7-git-send-email-thierry.reding@avionic-design.de>
 <CAOesGMibzg80rpeUMt-RTyz=0cffHtZmUe09XDdODNKwZmsX2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7260493061698139134=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAOesGMibzg80rpeUMt-RTyz=0cffHtZmUe09XDdODNKwZmsX2A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--===============7260493061698139134==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Olof Johansson wrote:
> Hi,
>=20
> On Tue, Dec 20, 2011 at 2:32 AM, Thierry Reding
> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> > Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
>=20
> If the code is copyright nvidia without a signed-off-by from them,
> then they at least deserve mentioning of original authorship in the
> change log.

Yes, I forgot to add a comment to that effect. Alternatively I could try to
get both Gary King (original author) and Simon Que (Chromium) to sign-off on
the current patch if that is preferable.

> It's also proving itself easier to do the driver and the device tree
> and board-dt update separately since they tend to have different merge
> paths.
>=20
> Care to split up as two patches, one for drivers/ and one for arch/arm/?

No problem. I will also address the other comments in the next version.

Thanks,
Thierry

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk7xiH8ACgkQZ+BJyKLjJp951QCbB/twfTrfNiUN7A7a+R0crCH6
poYAoJGju5UX3CTH4ILSkdXpQxJhP5Mc
=P608
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--

--===============7260493061698139134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7260493061698139134==--
