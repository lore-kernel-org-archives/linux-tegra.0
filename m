From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Revert "ASoC: tegra: Allow 24bit and 32bit samples"
Date: Sat, 1 Feb 2020 11:27:37 +0000
Message-ID: <20200201112737.GS3897@sirena.org.uk>
References: <20200131091901.13014-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Wty5iWagpjJlozQq"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200131091901.13014-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Wty5iWagpjJlozQq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 31, 2020 at 09:19:01AM +0000, Jon Hunter wrote:
> Commit f3ee99087c8ca0ecfdd549ef5a94f557c42d5428 ("ASoC: tegra: Allow
> 24bit and 32bit samples") added 24-bit and 32-bit support for to the
> Tegra30 I2S driver. However, there are two additional commits that are

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--Wty5iWagpjJlozQq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl41YKgACgkQJNaLcl1U
h9C48wf/XDYc+rP2dIu/vZ21qwktMH3XJC7y6d0I2npbH96AkZTpWmJd1Xni6LMO
X9XDm6w29xXEQvMvkQ+p6n7q74ZdCwfwNgHdPujzyQNEY33uSWkQ+gFzFyDKrec7
EGgzNKoCogdGHBTu6SED3em04EGbLIulAi2qwOd5jJ8ZCXErpBqUvwvFBRx9qQmK
Fy2RivEzWysEXqYe/Icsn4wVgZ4Nm5vyNQDEDkiigGKISdDMYqS5Y3W2Yg43Mpx/
KfLeQqxI7JZ3rodqfkpksVuzzhdvT/nyWuU46TOXyri4WhQMI75HewY/ZFKzQ9R0
38NCD8W5/kRbbfv8Y8+x8j423SX3dA==
=yaIF
-----END PGP SIGNATURE-----

--Wty5iWagpjJlozQq--
