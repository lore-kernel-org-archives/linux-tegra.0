From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: disable LP2 cpuidle state if PCIe is enabled
Date: Wed, 8 May 2013 12:56:19 +0200
Message-ID: <20130508105619.GA6682@avionic-0098.adnet.avionic-design.de>
References: <1367872744-25002-1-git-send-email-swarren@wwwdotorg.org>
 <20130507124849.GM7949@tbergstrom-lnx.Nvidia.com>
 <20130507130850.GA11202@avionic-0098.adnet.avionic-design.de>
 <518915A7.1020105@wwwdotorg.org>
 <20130508094004.GL7949@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130508094004.GL7949-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jay Agarwal <jagarwal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 08, 2013 at 12:40:04PM +0300, Peter De Schrijver wrote:
> On Tue, May 07, 2013 at 04:54:31PM +0200, Stephen Warren wrote:
> > On 05/07/2013 07:08 AM, Thierry Reding wrote:
> > > On Tue, May 07, 2013 at 03:48:49PM +0300, Peter De Schrijver
> > > wrote:
> > >> On Mon, May 06, 2013 at 10:39:04PM +0200, Stephen Warren wrote:
> > >>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >>>=20
> > >>> Tegra20 HW appears to have a bug such that PCIe device
> > >>> interrupts, whether they are legacy IRQs or MSI, are lost when
> > >>> LP2 is enabled. To work around this, simply disable LP2 if the
> > >>> PCI driver and DT node are both enabled.
> > >>>=20
> > >>=20
> > >> Wouldn't it make more sense to disable LP2 when we actually
> > >> detect a PCIe device?
> >=20
> > I did consider that, but rejected the idea for the reasons Thierry
> > mentioned.
> >=20
> > > I'm not sure a patch to do so would be as simple as this one. For
> > > one, the cpuidle framework will already have been initialized when
> > > PCIe enumeration completes. So some way of permanently disabling
> > > one state at runtime would be required and I don't think cpuidle
> > > provides an API to do so. I know the latter isn't really a good
> > > reason, but I don't think adding that kind of API just because
> > > Tegra20 seems to have a bug would be appropriate.
> >=20
> > There is a way to do this, since it can be done via sysfs, but I don't
> > think it's exposed as an API from cpuidle. I agree it seems a little
> > silly to expose it just to support this HW bug though.
> >=20
> > > Furthermore, it is quite likely that the PCIe controller will only
> > > be enabled in DT for devices that actually have a PCIe device
> > > hooked up.
> >=20
>=20
> That's not always true though. Eg Harmony has a miniPCIe slot, so it shou=
ld be
> listed in DT, but there is not necessarily a card present in the slot.

That's true. I suppose one could argue that Harmony is a development
board and more typical setups wouldn't have user-accessible slots.

Then again it seems like LP2 causes some more fallout like very slow
output on the serial console and a decrease in FPS for some 2D/3D use-
cases I've been playing around with. While these are only performance
issues they still indicate that something is seriously flawed with the
current LP2 implementation (at least on Tegra20). So maybe it would be
preferable to disable it altogether if it cannot be fixed otherwise.

I was able to mitigate the problems a bit on Tamonten by reducing the
value of the nvidia,cpu-pwr-good-time and nvidia,cpu-pwr-off-time from
5000 us to 500 and 100 us respectively. That gives much better
performance for the serial console and 2D/3D test-cases, but the 2D/3D
performance is still down by about 10% compared to runs with LP2
disabled.

Now the 2D and 3D test-cases aren't very complex and there's certainly
much that could be improved with regard to job submission and such, but
neither removes the fundamental issue that LP2 is causing a lot of
problems that it shouldn't.

Thierry

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRii9TAAoJEN0jrNd/PrOh9PQP/15tVoWOUf8b+55B5HbDVXCc
mNpz0QHrGWpR+Rplaj8yDhsuWJtM9J89IwOcFjl6pBh4aU0/IzMmWVGo7kMqvShX
/osly6Nut6EhyODWzO+A7X88DcwWeHqha4CvKi4LZJjKds6fKnjz7oeP94X2QNJK
1ws+jC4FBMXbKIB3y8mn8X6CBrCMEzLSzOS7j1kkJXU6g7BoXTaTWM5nTBSFd65I
riIV4tgksYjxuppxq74jxeadiS0rwZxyUgGMnBNUjCeVie1pqKdOkk3JyjR3M60c
9fRzbgLc5bqBJGDc/mzSfCP6wi1q+GwKsgcSkpkOrXfY6wsjIdkBV13PUZUo32pW
msEL0851ciVULLdWmNK1LjJV7AkQIAi4Ksg4nGuyFGf3WV4LPAQQnyg7VbOVNppU
QzOXsoxupon16bjfOJ3+cyW97uNPImut97gZJg10wMv5L85u+PZBs8DDaHHJmkiB
Re9xhKh2D0cWjJfr2gu9qadYIye7YEg8NHFMwt1mRT5lPW7oOdGjIqD79e2nBzRo
T1FSkjy8wmjqKfOGR8MRa2mogV8gsjvPb6hdQS0brGcwV41gLMr+LFf9UEy3dMK0
A/ZwGh4v8bTdNQ/nTG1X3JUg/z4/Ew9o2xBWYcLbxbSSHGBMqSiqF4fFc7trBgjz
BV+9pUb3xwVOATwIRDH8
=Gr7R
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
