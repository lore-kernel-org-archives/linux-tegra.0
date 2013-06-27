From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: dts: tegra20: Remove obsolete vbus-gpio
 properties
Date: Thu, 27 Jun 2013 09:49:11 +0300
Message-ID: <20130627064911.GI15455@arwen.pp.htv.fi>
References: <1372240781-1017-1-git-send-email-mperttunen@nvidia.com>
 <1372240781-1017-5-git-send-email-mperttunen@nvidia.com>
 <51CB22B1.2000903@wwwdotorg.org>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Li7ckgedzMh1NgdW"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51CB22B1.2000903-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, balbi-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--Li7ckgedzMh1NgdW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2013 at 11:19:45AM -0600, Stephen Warren wrote:
> On 06/26/2013 03:59 AM, Mikko Perttunen wrote:
> > USB VBUS regulators are now specified with the vbus-supply property
> > instead of vbus-gpio, so remove the obsolete properties.
>=20
> As far as patch scheduling goes, I might be simpler to send one series
> to convert the driver to the new properties, then once that has been
> merged into a kernel release, we can apply patches to remove all the
> legacy properties from DT in a later kernel release. That will save the
> requirement for any cross-subsystem merges.
>=20
> Although, if the USB maintainers are OK with doing it all at once, and
> we can make sure this series gets merged into a separate topic branch so
> that I can take it into the Tegra tree to resolve any merge conflicts
> with any other Tegra DT modifications if needed, then applying this all
> at once is fine.

I'd be fine with the merge from my side. It worked well in the previous
merge windows. Let's just not go crazy with it ;-)

--=20
balbi

--Li7ckgedzMh1NgdW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRy+BnAAoJEIaOsuA1yqRExS0P/R2wIs8alNyCBhedr1Cr5dfo
dZp1teWtmrC3JCI9Y6+IvqS2ZJGfAUhft+s4o2lNa07cKUAxou3LvM31hFvhjYrR
57wJzchznzzGTqnhtBnabs1mqOihGa/6hE0DnE8zoaUlKjV5gpPDwOarUB4oni+g
OPARHPUboL2qlBL/Jhh9lnLgqm98GpvFK95L3w8aoblS886MGeREWS7bd/3KIARL
whmGvJEPznQN9RgowMig6gO0gLhKpvun5m/9Edjba7SBmRxIEKoLdWkvuMDu20RK
Rq+c5PUG5FkUzysE6taH+6iJM48p803BiPRFoSKadfjb+R2Yt3z9TZcPopkrvPVW
Gymm9EIrVVSjFbw+TwUkBgEmN1klYy43nrPqVt6IN8iSx7er2mbsFA7Jds7+DTZ8
fSfcmtKjicmKsv8cDICBvyCJaanpYsvlRWh5ZZK1UqcL+P11y0TmjF0AasYsFs3V
j6yys8H/RJqy0dWDYrQjYRR5ZdsuHQWIEyr7yV/ZzEAAmCwsX3h2iAsFVTmn5KUR
Bgy4pfOf08ukgO2I2MUc7/N5tVwEmtiPjqERnHPVGP3s2xwI1H4zn+JHyxuxxJuv
L76g+W964czkkFZeF9+tp3ckidC+Ed1YPEeNGOgGA9BZDzMxQjvvdfd2hPq9EGD2
kEiKo1R/QCRipEo+YbUz
=m+fc
-----END PGP SIGNATURE-----

--Li7ckgedzMh1NgdW--
