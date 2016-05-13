From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: beaver: allow SD card voltage to be changed
Date: Fri, 13 May 2016 19:27:04 +0200
Message-ID: <20160513172704.GA498@ulmo.ba.sec>
References: <1456779678-20173-1-git-send-email-dev@lynxeye.de>
 <1463124331.2459.0.camel@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1463124331.2459.0.camel-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 13, 2016 at 09:25:31AM +0200, Lucas Stach wrote:
> Am Montag, den 29.02.2016, 22:01 +0100 schrieb Lucas Stach:
> > This allows to switch the card signal voltage level to 1.8V,
> > which is needed for any ultra high speed modes to work.
> >=20
> > Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> > ---
> > This needs the SDMMC memcomp pad calibration patches I just
> > sent out to be applied, otherwise the card voltage change will
> > fail with a message in the kernel log and a fall back to
> > high speed operation.
>=20
> The patches this one depends on have been applied for some time now.
> Please pick up this patch.

My understanding is that UHS modes currently cause problems on Beaver.
What I don't understand about that is how it will even try those modes
if the voltage regulator can't be set to 1.8 V? Shouldn't that actively
prevent those modes from even being attempted?

Thierry

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXNg5iAAoJEN0jrNd/PrOhgF8QAJnU8SyfPvZ7NKKWBd4CxbqB
1NXyvHM3dk7REd3aBcF2D9ggN1tJ9G2CNbymqcOvec4fIqlXU3hMRsuNs04nozs0
e9T8OmLp3qpUqK8mv4ll+eiQ2ZmhM1wWvVcWaW67S2i01OdcM3tVFqJgxJyeJCfj
u767WnHBLIrkFMY4tPVlp2ajMqwMgHDjZY3JBMRImofGoE1ExGRV1JCZpeGth5Dp
EZLEmSSurWwWfnCmUWxESnx/MxBVMw03ECWOu4mlkaXzu6bFt5kcrdUy86hTrVBY
IlyzEZt309bUVkZY1aoIEflJR7xtw36AX+3wcV/1M4LeEbk0ukst9Id1mCajm5H4
0cctJ6FBBmQ8d/Mh9Q+rnJYd5p2Q6mLnEuZQyujCNFYmWAV0X9gI+n+Jotk9DHfe
+W+RUjElYGHJ/hrRxRAdMukIhMOqmPfrtVpbrr5QlHXvjsTIvQEY7o67c1bkvcfT
dLt0LNWhze37VIsp1r+jm/33D/gxAlpngxVKkfOmMdw2uiJI4LQalSYTG7FcmOk1
ZVQLgIXgTkEfdDtJ6xEg0tKzYWNQdOROILDHNIxrYfARUkqH6nuP27o8ZkEKjwmI
tmPM2VnRWzyMzNY0ZBu2TFVFDVKmQM7CVPpMOGqGFNBRDIXeehMLsXYpPfsVDg/V
IfGtLv9n8UNRfg5W/rFc
=+3Qf
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
