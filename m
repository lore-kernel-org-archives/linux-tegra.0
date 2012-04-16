From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v6 17/17] pwm: Take over maintainership of the PWM
 subsystem
Date: Mon, 16 Apr 2012 07:50:12 +0200
Message-ID: <20120416055012.GA3037@avionic-0098.adnet.avionic-design.de>
References: <1334070400-25013-1-git-send-email-thierry.reding@avionic-design.de>
 <201204101951.44198.arnd@arndb.de>
 <20120412072206.GB18252@avionic-0098.mockup.avionic-design.de>
 <201204121134.24892.arnd@arndb.de>
 <20120412122740.GB5353@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0106663471268619490=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120412122740.GB5353-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Bernhard Walle <walle-pDveNdigDaDu9UdzE1sIFA@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--===============0106663471268619490==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Thierry Reding wrote:
> * Arnd Bergmann wrote:
> > On Thursday 12 April 2012, Thierry Reding wrote:
> > >   * Arnd Bergmann wrote:
> > > > On Tuesday 10 April 2012, Thierry Reding wrote:
> > > > > I'm taking over the maintainership of the PWM subsystem. This com=
mit
> > > > > also adds the URLs to the gitorious project and repository as wel=
l as
> > > > > any missing files related to the PWM subsystem.
> > > > >=20
> > > > > Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> > > > > ---
> > > > > Note: I guess this patch in particular could use some Acked-by, m=
aybe from
> > > > > Arnd and Sascha so that people will know this happens with their =
blessing.
> > > >=20
> > > > Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > >=20
> > > As far as I can tell the series is in pretty good shape. I've integra=
ted
> > > Shawn's latest comments and I think we could get this into 3.5. Does =
it make
> > > sense to take the PWM tree through Linux next before having it pulled=
 into
> > > mainline during the next merge window?
> >=20
> > Yes, that's the way to go. Just ask Stephen Rothwell to include it right
> > away if you are sufficiently happy with the contents and believe that t=
hey
> > don't break stuff.
>=20
> I just saw that there's been some discussion to remove IS_ENABLED() and
> replace it by something else. So maybe I should wait another day or two
> until those changes settle in next.

Seems like this issue is resolved, but something else came up. In the !OF
builds, of_pwm_request() no longer builds because of_property_match_string()
and of_parse_phandle_with_args() have no dummies for !OF. I've posted patch=
es
for these on Friday and they need to go in before the PWM subsystem. I could
also revert the IS_ENABLED() parts and go back to a #ifdef CONFIG_OF but I'd
rather not.

Thierry

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+LsxQACgkQZ+BJyKLjJp9AsgCgjl97vBcId8HYSpNRgFK86sre
DhMAn3FTqo+ROCRNLytdaRYboGM2q52e
=BqD/
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--

--===============0106663471268619490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0106663471268619490==--
