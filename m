From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] remgap: Fix possible sleep-in-atomic in
 regmap_bulk_write()
Date: Tue, 18 Mar 2014 20:21:54 +0000
Message-ID: <20140318202154.GS11706@sirena.org.uk>
References: <1395143914-26929-1-git-send-email-tiwai@suse.de>
 <20140318122218.GQ11706@sirena.org.uk>
 <s5hr45zr7f1.wl%tiwai@suse.de>
 <20140318130426.GA11706@sirena.org.uk>
 <s5hob13r5l6.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/XX0ATCDKajGjg99"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <s5hob13r5l6.wl%tiwai-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--/XX0ATCDKajGjg99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2014 at 02:36:53PM +0100, Takashi Iwai wrote:
> Mark Brown wrote:

> > > I thought of that, too, but didn't take it because covering the lock
> > > there doesn't change the fact that it's still fundamentally racy.

> > I'm not sure what you mean here - what do you mean yb "covering the
> > lock"?

> I meant covering memcpy() and parse_inplace() & co in the lock.

Oh, right.  A fix is definitely needed and your fix is certainly good
=66rom a correctness point of view but since we're narrowing the locked
region we may as well make it as small as possible while we're at it
both for comprehensibility ("why is that locked?") and performance.

--/XX0ATCDKajGjg99
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTKKreAAoJELSic+t+oim9T/UP/3o9N7KX/+6qR1bC3ReIXeoP
1RXvqKiQbVgNiSEP9EKCqSSTi3unSmY+2SVvuZ4C1SbYdDVU+dmQDG4H5tTHkvB/
glpjZlHjVXu70U8Z7re8EElNt3aaRJrLNm1cDS6FXFmvweWJLJX35W9NwY3Pgjxg
YKbJm3bVuA4vErPqR3k/IUimx/4ASEFa6eMp48+UIt2IPEUd6HtIedbcp9m/p0Xe
PGzci7WGkoD1xgutF61oMfd3Ao1FoNw08xFUMKRZJg3uwsqkxHgcGsSjRFahufFz
Asz5R9sxQUwQHcOovqrZfLIK0L53fyp4j4NlMSaweS+XoHmdENMPeNnQWjPxSsm5
DLPffHkKTIRRTUCNWsFSt4EVbvThGr+lFTjrnGpMvyfFeV+mUClhEZrwLkwhJb3V
qMhz2nZc3aGZyXVMB0mFObf71PCytvZZw2EqxEr1cLNTPN2OLzXGHIM72thr7iD+
aMiIUgZb6LZXAn7pKJHNCJ1UU9/bfB7fY/94TjoxlYgPYtFIyUWdB/SholR5ThyA
RaDLe4/B3ADrS72EIs5yhykg0Eu8MMPPlWZXTL5dKlTKTmN+9OOGHPDPOidiudfz
dv/YHGlqhqmoWTvJr2qWHepIa/HE1cM07uLbQrnqX2kGQ7O4WeG0/UQw3NFopnqy
Ua7IFhJX90LaRLSESqzU
=rTcH
-----END PGP SIGNATURE-----

--/XX0ATCDKajGjg99--
