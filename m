From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/11] ARM: tegra: add function to control the GPU rail
 clamp
Date: Tue, 6 Jan 2015 12:15:40 +0100
Message-ID: <20150106111538.GB31830@ulmo.nvidia.com>
References: <1419331204-26679-1-git-send-email-vinceh@nvidia.com>
 <1419331204-26679-2-git-send-email-vinceh@nvidia.com>
 <1419426990.2179.7.camel@lynxeye.de>
 <549B7638.2010405@nvidia.com>
 <20150105150932.GG12010@ulmo.nvidia.com>
 <54AB445D.7010303@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4SFOXa2GPu3tIq4H"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54AB445D.7010303-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, martin.peres-GANU6spQydw@public.gmane.org, seven-FA6nBp6kBxZzu6KWmfFNGwC/G2K4zDHf@public.gmane.org, samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--4SFOXa2GPu3tIq4H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2015 at 10:11:41AM +0800, Vince Hsu wrote:
>=20
> On 01/05/2015 11:09 PM, Thierry Reding wrote:
> >* PGP Signed by an unknown key
> >
> >On Thu, Dec 25, 2014 at 10:28:08AM +0800, Vince Hsu wrote:
> >>On 12/24/2014 09:16 PM, Lucas Stach wrote:
> >>>Am Dienstag, den 23.12.2014, 18:39 +0800 schrieb Vince Hsu:
> >>>>The Tegra124 and later Tegra SoCs have a sepatate rail gating register
> >>>>to enable/disable the clamp. The original function
> >>>>tegra_powergate_remove_clamping() is not sufficient for the enable
> >>>>function. So add a new function which is dedicated to the GPU rail
> >>>>gating. Also don't refer to the powergate ID since the GPU ID makes no
> >>>>sense here.
> >>>>
> >>>>Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>To be honest I don't see the point of this patch.
> >>>You are bloating the PMC interface by introducing another exported
> >>>function that does nothing different than what the current function
> >>>already does.
> >>>
> >>>If you need a way to assert the clamp I would have expected you to
> >>>introduce a common function to do this for all power partitions.
> >>I thought about adding an tegra_powergate_assert_clamping(), but that
> >>doesn't make sense to all the power partitions except GPU. Note the
> >>difference in TRM. Any suggestion for the common function?
> >I don't think extending the powergate API is useful at this point. We've
> >long had an open TODO item to replace this with a generic API. I did
> >some prototyping a while ago to use generic power domains for this, that
> >way all the details and dependencies between the partitions could be
> >properly modeled.
> >
> >Can you take a look at my staging/powergate branch here:
> >
> >	https://github.com/thierryreding/linux/commits/staging/powergate
> >
> >and see if you can use that instead? The idea is to completely hide the
> >details of power partitions from drivers and use runtime PM instead.
> You generic power domains work is exactly what we want for powergate
> eventually. :) I recall we used your prototyping in somewhere internal tr=
ee.
> We have to add more to complete it though, e.g. power domain dependency, =
mc
> flush, and clamping register difference like this patch does.
>=20
> But I have a question here. Since the GK20A is not powered on/off by the =
PMC
> except the clamping control, and GK20A has its own power rail, do we real=
ly
> want to hide the power sequence in the generic powergate code? We still h=
ave
> to control the voltage level in the GK20A driver through the regulator
> framework. It seems weird to me if we put the regulator_{enable|disable}
> somewhere other than the GK20A driver.

I think we want both. The power domain to control the power partition
and the regulator in the gk20a driver for the voltage control.

Thierry

--4SFOXa2GPu3tIq4H
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUq8PaAAoJEN0jrNd/PrOhz0MP/1MgOKcz9Jo5DcFOCfC9muPc
BKcPvF+LI4YWBp4l/qKHik+CnYosK1QKAr/1D8AJ4ijyJaBiMIxn62TeKlXRJh6R
K2xZYKBC8cRP8U/omAarKkxsqmzp2jYuFsAc6qbRoysGtnvUGpvERRZv3nbPMqjt
giEy5XM1sctOu5+xk5gYmbnSXLIknr1jHKl10wpVfvfiFMWnIQXsL+DKBuxpbjPF
gYGF10gu91M0/NZdoBGxkrp2P/vFxIwcm7dLdTHbZ3mqXoOj5kyIaPkV/UfHjOp8
AF6iNV0THh+eQhYjLHwklrOQtSuOlxq1wim0f2QbCFCmadeS8SUEW1h/qRBa4O+A
s/Q/IwOsmPMlpnGcz3TFcQmmZB8ZgEe5fdKFv6epPZbS1EQqbUIjruMsP3NgAtuy
erK3VB0OsUjgF11U3QBJdackXmDighCmav8nBg8tX44DbGvmJY/IxV3QVeOFhvqj
FjlOA19Nw+LqIAdz1vMdu7qhV7ED8FKXZwZaONHKGKjRYRZy/uC6oh4CTtn161nv
RfRdYmjidmDZd8hh6aTGT0M0Akd3U9GAYnJruTxvbw4ALzeRn2yqFxtR5L1uBgor
+Tj0iteB2JIlGVgcvXhkrySWR3K31TUktwVcNG/oZIQkgADV0/sVpQuk704dH0Bm
VbLFTg1XXcbuthOtbZWM
=4+is
-----END PGP SIGNATURE-----

--4SFOXa2GPu3tIq4H--
