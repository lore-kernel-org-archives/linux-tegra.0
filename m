From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 9/9] clk: tegra210: Initialize PLL_D2 to a sane rate
Date: Wed, 13 Jan 2016 18:28:56 +0100
Message-ID: <20160113172856.GT2588@ulmo>
References: <1452278714-10751-1-git-send-email-rklein@nvidia.com>
 <1452278714-10751-10-git-send-email-rklein@nvidia.com>
 <20160113140309.GB15782@ulmo>
 <56967ADD.8090904@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="owPIoVL9FiqC4k42"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56967ADD.8090904-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--owPIoVL9FiqC4k42
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2016 at 11:27:09AM -0500, Rhyland Klein wrote:
> On 1/13/2016 9:03 AM, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Fri, Jan 08, 2016 at 01:45:14PM -0500, Rhyland Klein wrote:
> >> Initialize PLL_D2 to a sane rate at the start of the day.
> >>
> >> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> ---
> >>  drivers/clk/tegra/clk-tegra210.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >=20
> > There are a lot of assumptions in this commit message. I'm asking myself
> > why does it need to be initialized to any rate at all? Isn't it up to
> > the user driver to set the PLL to whatever it knows to be a sane rate?
> > Why is 594 MHz a sane rate?
> >=20
> > A good commit message should answer those questions.
> >=20
>=20
> Thanks. This patch came about in response to some work with
> suspend/resume logic in the ChromeOS kernel. In the suspend/resume patch
> there, it reads all clk rates and caches them in suspend, then re-sets
> them on resume. We hadn't been using pll_d2 at all, and its rate (when
> read in suspend()) came back as 0. Then in resume, we would tr to set
> it, clk_set_rate(pll_d2, 0) and would generate a warning/error that 0
> wasn't a valid rate.
>=20
> As for the specific rate I chose, I simply took one off the table of
> supported frequencies in the clk-tegra210 code, so that it was non-zero.
>=20
> Since we don't support suspend/resume right now in the clk drivers, I
> don't think its urgent to merge this patch. I can drop in in the next
> rev if thats easier.

Yes, that would be my preference as well. Once suspend/resume support
gets added we should run into this again. Setting the rate so some sane
value (the meaning of which is highly dependent on the use-case) sounds
to me more like a workaround rather than a real fix.

pll_d2 is used for display, so I don't quite understand why we'd have
to restore the rate on resume, since DRM/KMS would set it to whatever
it needs at a higher level anyway. Perhaps this will turn out to be a
non-issue upstream.

Thierry

--owPIoVL9FiqC4k42
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWlolYAAoJEN0jrNd/PrOhF2kP/15C3am/AlBMXROEY3y0JQYr
uSQY22y0IWmlgGr6a2pB3NMI3jep8lx2Iq1Xfd/Ha+ku0D5zbi9OuQtFxnlSNSW4
oWhWOhAZsxZ3jaVS70GIViwD20AR3xU1fxCBAmHzjTmTOwlPdV5oYZSiyb5/kKD9
D2Sjhy1HP9+KdeCC5bXwdfQpG3t+SBw9i1bH57LiaRglJZpy3/qB95Wz4UpDYv4Q
vyF+zx+IKQHiNbJm4Uz8RT7AfQbxjjhIyQAWGOac9AN8a0Np0y9ivmB5u4Rj3NKY
9KBEIZs2k5P0w9RMeEf5jblQp8QoVwdO2F5GFmqTSpvGVVFLb+omXG7+UBR4iiA3
Ax8D0aVtV11R5IL4mBXx8zZmSyUZmkXAXXNnBO7oDvS0lzp93e9bRU5PxR1ULn87
K1DtLQ6M93ubZxxoCFlhsSipkbRNIL4pncmnTk1YjXcY3/6o13zxjIQ3WqDAHTSL
+JklaAXbFJxwj9P+7H+Rp9KCM1R9e7UN4BuCjUeht23gqpEREvpt951MfpWXDY2s
bzZW9XQPKcPw1heaudzEO4DASeA7v+bpe9vdrGOTBkRPzRuN+rmeK4TMRUVJVrsz
i6Z8JMNFODlb4DLzQp6UfmL4pd5vfiyZgkTZLSzMybLAHUs66xSwsvaMGQEfNJ/o
Se6XpNdZQ4Ujut8IYc0R
=IrGt
-----END PGP SIGNATURE-----

--owPIoVL9FiqC4k42--
