From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [GIT PULL] ARM: tegra: DT-related fixes needed by the USB tree
Date: Wed, 29 May 2013 20:55:08 +0300
Message-ID: <20130529175508.GF21290@arwen.pp.htv.fi>
References: <1368831045-19105-1-git-send-email-swarren@wwwdotorg.org>
 <51A4E62D.7020206@wwwdotorg.org>
 <20130528174704.GH15794@arwen.pp.htv.fi>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f61P+fpdnY2FZS1u"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130528174704.GH15794-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--f61P+fpdnY2FZS1u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 28, 2013 at 08:47:04PM +0300, Felipe Balbi wrote:
> On Tue, May 28, 2013 at 11:15:25AM -0600, Stephen Warren wrote:
> > On 05/17/2013 04:50 PM, Stephen Warren wrote:
> > > Felipe, (and Alan, Greg),
> > >=20
> > > These are the changes from the Tegra tree that need to be merged
> > > before the Tegra USB driver patches 4-8 from Venu can be applied. Rec=
all
> > > that we had previously agreed on this approach for v3.9, but Venu's
> > > patches didn't end up being ready until now, unfortunately. I note
> > > that Venu's patches affect both the Tegra USB and PHY drivers.
> >=20
> > Felipe, do you know when you plan to pull this into the USB tree, and
> > apply Venu's patches? Thanks.
>=20
> got 35 commits testing right now. This pull is in my list for tomorrow.
>=20
> sorry for the delay, have been on a trip for the last 3 weeks and now
> I'm catching up with emails during my vacations (next 2 weeks).

the tag is not pushed to where you pointed me to. Please make sure to
git push it.

$ git fetch git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-teg=
ra.git tag tegra-for-3.11-deps-for-usb
fatal: Couldn't find remote ref refs/tags/tegra-for-3.11-deps-for-usb

--=20
balbi

--f61P+fpdnY2FZS1u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRpkD8AAoJEIaOsuA1yqREjV8P/29HQE7s3fUETDggN8qbig8T
Gflj4q0EN7nynAIKq4i1SM6BIoOi5GYRrOug5814rjVnC1ISVeakUcn5RV4IYZv1
UAO/m03gVCxWdjMwbui4830e5Z8vsDjvC/Y52cayV2Xb5K5Ci8Q2/mDZ7tAdi9Sg
ul14gDqkIi+tz0RwSo+3d2JOfDKP8XkktcGFa36CVEb+I3dVrQZ1T4Gr5FuSG8HF
5BoRmHXoIH5O9KlWIbg09tdyzXq9XkeotOpwD33TbZzKcGkKBbT3Hx8xBD6RIy0H
sxpcSuigyhj7vEmK/RSM1uNie9BGr8RBzal6puM8JqyODiZo54C6Uhk1zVgosBMw
nuQ8vcEMFG/EkEdgekEsRHQOquMjZJ4aTJudIS+2qb1h5e37slJhlUoWVPcFZpyb
qaLX5wg5NLo8Qp5Zcrs69fIwAAJnkYEfSxKLFPAcNk9QhWW/5zf4AKPBaEyEDUQH
0+w2U5+v4Lpnsn9vSBMXxtfhD9dzWcGZbbQEnBq6x/Xw5t5huXjhCZTSUj4iWTZL
elp1KOGWhWDPfU8tA6A8quYe7L5H0YECPrNOfqI+1NuVDfIUdOSzgHchjcQPY/bh
cJ11sI5QXwmanP8vnChWpIXlk467wm9IbgUd7ViGgShzPOW48mrignh/NXgER1jg
Nx9jpUViphXnYgTzfTBu
=jBq8
-----END PGP SIGNATURE-----

--f61P+fpdnY2FZS1u--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
