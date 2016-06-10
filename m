From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: fix missing include <soc/tegra/cpuidle.h>
Date: Fri, 10 Jun 2016 16:55:20 +0200
Message-ID: <20160610145520.GP27142@ulmo.ba.sec>
References: <1465404897-16654-1-git-send-email-ben.dooks@codethink.co.uk>
 <20160610142210.GN27142@ulmo.ba.sec>
 <575ACFB5.4070706@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NDuspjMMC1Ui5ypn"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <575ACFB5.4070706-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--NDuspjMMC1Ui5ypn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 10, 2016 at 03:33:25PM +0100, Jon Hunter wrote:
>=20
> On 10/06/16 15:22, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Wed, Jun 08, 2016 at 05:54:57PM +0100, Ben Dooks wrote:
> >> The prototype of tegra_cpuidle_pcie_irqs_in_use() is missing
> >> from the cpuidle.c file, it is defined in <soc/tegra/cpuidle.h>
> >> so add that include to avoid the following warning:
> >>
> >> arch/arm/mach-tegra/cpuidle.c:51:6: warning: symbol 'tegra_cpuidle_pci=
e_irqs_in_use' was not declared. Should it be static?
> >>
> >> Signed-off-by: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
> >> ---
> >> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> >> Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> >> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >> ---
> >>  arch/arm/mach-tegra/cpuidle.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >=20
> > I've been carrying a set of patches to fix these, and a couple of other
> > sparse warnings, in my tree locally, but never sent them out because
> > they were so trivial. I probably should've to avoid the duplication of
> > effort. Sorry about that.
>=20
> I think you did send them out ;-)
>=20
> http://patchwork.ozlabs.org/patch/616249/
> http://patchwork.ozlabs.org/patch/616250/
> http://patchwork.ozlabs.org/patch/616251/
> http://patchwork.ozlabs.org/patch/616252/

Hah! Excellent. No more guilty conscience for me. =3D)

I've pulled those patches into the Tegra tree now.

Thanks,
Thierry

--NDuspjMMC1Ui5ypn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXWtTYAAoJEN0jrNd/PrOh9IwP/RMQ03M5Rh1PxvN9Y0CF6CGG
bEIQ6BWva923Dbwna4aljutJl3gMq8AZyLod8A8lbmrPBR1LkZZ+K5UNr1+mIhv5
/Ad2myRWQMNsDVZdpvbKK9tU7OFSxUezgYMG9WTXSqYUtGeeItS0isd79RSwf6rA
svjJFnKBEIbUX3GLQlKDBNzagk3jzuCpNvIoe8dwmkMSg5Fb3XbkczOJVJcls3+I
N9QKwSBOCHnr7JmcSS1BHATvlfpKnCBVjaRy30Loc4GkPOcagczTtIv38uPAVQJz
uVZ2sO3Ehww5qwXoTXaB/5Q951iFd93vUt1k4wG3w+9td2M80MQxVnTca64MKjhr
K4jQVhIouHZQkIxpVoMPm/3ZcpoWCtkWJWcMMnnUBQJe/6BDpURUi8iBLSXZuvPO
/tu8T1vJ6/qFpR/BqRwHw4Mhu62mguFBUxwt6DUctqw2REvjttcyXFTgM8U5uzPm
/gyn6OPL70oRW4dRfhDN5sL91Bvh3ROXssRTzoGY2A03Tk4y3XPhvxWJXg3GeFfx
5AFzo01gnLaztHxt31AKfCdqir9LX93RbcVhVE1iNVoLinS46xTigpx9TJUOX+7N
M6X++JKf55mPy+3+0fNdfwwp44IO8Ohhq/LQnne9fdTw8wfC3vhBH+zg/9nBicc7
Rom+TteesSrQGssabpvv
=DeIK
-----END PGP SIGNATURE-----

--NDuspjMMC1Ui5ypn--
