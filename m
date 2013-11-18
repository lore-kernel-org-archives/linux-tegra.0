From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 17/31] ASoC: tegra: call pm_runtime APIs around register
 accesses
Date: Mon, 18 Nov 2013 18:39:47 +0000
Message-ID: <20131118183947.GS2674@sirena.org.uk>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-18-git-send-email-swarren@wwwdotorg.org>
 <20131116100205.GG15393@sirena.org.uk>
 <528A4D9A.10809@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H88uUF932U8Oj0a6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <528A4D9A.10809-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--H88uUF932U8Oj0a6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 18, 2013 at 10:25:46AM -0700, Stephen Warren wrote:
> On 11/16/2013 03:02 AM, Mark Brown wrote:

> > Or alternatively should the driver be making the device
> > cache only when runtime PM is disabled?

> The regmap is already cache-only when runtime-suspended. However the
> registers don't get flushed during resume. I suppose that would require
> only adding one extra call to the PM resume function?

Yup, should probably do that anyway since that's going to bite someone
otherwise.  We probably want a single operation to flush and enable
writes now I think about it, it's the common case.

> For some reason, my gut prefers this current solution, but I could be
> persuaded.

I'm not dead set against doing it this way, it's just that it feels like
if it's required something's not working as well as it should.

--H88uUF932U8Oj0a6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSil7wAAoJELSic+t+oim9yyAP/1V3yQAqbXTbrnQmmdxLW6xh
uvKUTl3bACiksAZPoFCfMPjWeY7vVtb4zfn0J7lbD7B74sGRIS/s93DAxsjn9KjF
8Kqq53IwhHbFdFgP1If58RmSlvS450l+pubt+yckGxYgPHJg73KOnkx+9lX9Yiir
PlU+CrMKL7FlmraU/BASAtCHlmGwcykHNR3xD2RKbYdaCEBPeJnGBY4Oumswk8HL
xl2ZNuiqL97dP86rYDMBSyPiSPEe4mTM5EGoBmRoC/x0DFR56FD6398HGmnBojhF
rF9GmhEYSsHqb/h+7RCNlOWUbdfNbh5eD4sPHQLS0KPj4CQDPrl9KVpoVAt5QM7a
32+i2A8i3dN+DZcJgJkeCOJqhmPyGLZaMUdaqZuoAmfAcFmEbsR+xfEkjOEWD6ro
klzxkZKMzu5/bDqU2K35ZIRgEHbRZhmA/iF7wNdOAR6OOf+kNPpqS2mFxt//u6KC
Y0DOjaRbPTQEKWFGeDTtxbOOVb0/SCx5sbFy0mx3cVbeml+0+J9edqPQ3Sh90kWt
XwNEmHDCtREt/WvZa94pSKKMjsoJfFgo2xUzPwUpjIWzMgjX647zy2Tjh/yYXAs/
SU2bQq8cxxLN+B3UyBP7QRQ0cK6m3t9/9gUrIwKBV5iC12J4xgXdrd2MDsiM7SGk
mHUOkZPQqL1C0fQVd9Aa
=DvO8
-----END PGP SIGNATURE-----

--H88uUF932U8Oj0a6--
