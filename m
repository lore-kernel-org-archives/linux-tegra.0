From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: Convert to managed resources
Date: Mon, 17 Aug 2015 22:15:55 -0700
Message-ID: <20150818051555.GG10748@sirena.org.uk>
References: <20150813072920.GA17181@localhost>
 <CAAVeFuKT1st8E1fxcDM5CV_OzUcTmvFw8UuU5oh15J1PiFJ0vA@mail.gmail.com>
 <CAK-LDbJwfuqU6ekRudms=YfjVxWf1BOREBwCnCh4v-YWY9hA_w@mail.gmail.com>
 <20150817204751.GD10748@sirena.org.uk>
 <CAK-LDbLCvdUiNZ17oxWwuUhC=hwtpuGeYdxXj=0Y3q48gkbzRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rDr66iUNdD59gODe"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAK-LDbLCvdUiNZ17oxWwuUhC=hwtpuGeYdxXj=0Y3q48gkbzRw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vaishali Thakkar <vthakkar1994-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--rDr66iUNdD59gODe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 18, 2015 at 08:15:35AM +0530, Vaishali Thakkar wrote:

> I think yes may be code was good before this. But devm_clk_put part should work
> fine as call of it is before PM stuff. So, can I send a patch
> reverting the change
> of component part or do you want me to send a patch reverting whole change?

Just fixing the problematic part is fine.

--rDr66iUNdD59gODe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV0r+KAAoJECTWi3JdVIfQeYsH/ROZ7tusJahnwHEEbgIqvvXn
Lkz1aSX935eYCQQfFnvnXD9B/2F9cZ1g13KUXSdyqd5gfbKXgSdbxFbLQm0HbZBD
CG5KrSTN1729feAl/Mq6iqmFYfUxf/85ts3RVtjZQUy3YR3ynBlOZymJNh+hFUHa
7ofBeGjsg1TdsfrhWEVXhF6mePgMNCXNOq8140dciPEUgXQsj41Cyhz8HzM2mAbN
S2o8XBndPST0eEcYg0/OmRBYBUQZ7drJsMpvpiOWEGoD7+Vw7z0HrFbNUN7ah/ff
Vs5c9zBrj+yRzFmOq1SW30XxifGd4VGjCydYpjjAE/6IbDxQeLkxFZgRXLMlYQU=
=c/zY
-----END PGP SIGNATURE-----

--rDr66iUNdD59gODe--
