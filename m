From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dt: tegra: paz00: add regulators
Date: Mon, 25 Jun 2012 09:46:56 +0100
Message-ID: <20120625084656.GA4037@opensource.wolfsonmicro.com>
References: <1340406842-27135-1-git-send-email-swarren@wwwdotorg.org>
 <4127323.noaajNecru@ax5200p>
 <20120624123151.GZ4037@opensource.wolfsonmicro.com>
 <27366523.LjLfRK1TqH@ax5200p>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Sz/4MAOlM1c8JZ8/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <27366523.LjLfRK1TqH@ax5200p>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Sz/4MAOlM1c8JZ8/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 24, 2012 at 03:27:42PM +0200, Marc Dietrich wrote:
> On Sunday 24 June 2012 13:31:51 Mark Brown wrote:

> > > there should be some initial value, e.g. regulator-default-microvolt, as
> > > the original driver (from 2.6.32 ages) did. This way the maximum value
> > > can be set

> > That's *never* been in mainline, and nobody even bothered trying to
> > submit it.

> which was the best thing to do ;-)

Well, no - had there been some attempt to submit it it might've helped
stop people writing constaints like this.

--Sz/4MAOlM1c8JZ8/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP6CV2AAoJEBus8iNuMP3dNeYP/R0l+fOH2g/fpQXM4Ubpih/p
AgPHxAqwxngv6OcHwCG4Bl9vxgDx6OYFp2z/Oz1kvz2ytyeuqizFXA5sDyz35990
hAsMsp7a5HFYyZPIaPHgMdpZrXlhyod/nDG9+Igdl15X43HWM0Hg6chv6jUqVYG3
ceEciRBupTur/4Et7nqOITNIPQdMiqsSTjrvzoiQnvzyJOMS3ou2Oz6hiCmW3G9R
4yAgiXccN+RHtmidS8Gg3yCyb+eYFKCsY4h9Q8KiqchY9izv9ThK6KDsksUxNFdE
TqZ+Z5reTyYaOx5UjSBFWAlwRBZ69HRMJSPTlSE5Ipm8A6itXcs+S2/zli7+PCny
rbvHulR4cBucJdjuUYtXieH3c8LiDNDju7o3FG9OCdWm07djTRVSJwd5MOzAp1GT
VLbkTE0o/TH584R6xnoSFpxICcdEaPlFNtEPL4PhDA+gPXdxRCF7/oO+SdBvKr7z
8JG5HyzteHNVVe24QKdrEosZ4bP+iaH77KcnYJThzquj9/WxMyPmI8SgAXczlkrl
PdEjt4/RC/39XPM+HnxzUrNIhd+sk/XsQX6+UaYFTqsMbLMQ7C0JApPiJ60zt4u1
KOFyqClLtmaozqw96PWLF2Ehym//GZuAhBokUPDQmV3ALbId8fEEdZFeIz85E3zS
8QhTg97ojvM0N8LHGOYg
=Iy/f
-----END PGP SIGNATURE-----

--Sz/4MAOlM1c8JZ8/--
