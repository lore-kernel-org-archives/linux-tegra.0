From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm: tegra: dts: Kill off "simple-panel" compatibles
Date: Fri, 17 Apr 2020 09:07:55 +0200
Message-ID: <20200417070755.GA1573554@ulmo>
References: <20200117230855.25567-1-robh@kernel.org>
 <CAL_JsqLDsoJteGC6BRMFvPZ0pekOU71eUNQUqh74we_BB7RZ_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLDsoJteGC6BRMFvPZ0pekOU71eUNQUqh74we_BB7RZ_g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2020 at 04:02:58PM -0500, Rob Herring wrote:
> On Fri, Jan 17, 2020 at 5:08 PM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >
> > "simple-panel" is a Linux driver and has never been an accepted upstream
> > compatible string, so remove it.
> >
> > Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>=20
> Ping. This never got picked up.

Indeed, I somehow missed this. Applied now, thanks.

I did take the liberty of splitting up the patch for 32-bit ARM and
64-bit ARM but reused the same commit message and authorship, so I hope
you don't mind.

Thierry

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6ZVckACgkQ3SOs138+
s6G7ig//Sa5UUxsU1rQzbWSzOABzwUMTFWwoEOr17cFjrHwxV06b/jUYICr3yKDn
Qdyr4e4PNRYiDZUWwM5FpY6/Xa0tmqKY+zCv8/Q0KE2RhB1lZFFTkjLSiZ4Eg25A
ge8urVNALc4Z8pCJElYGFL7LCcDPEXcOsNFjCjrUaie4Jivd62A0rQsjb1Ib7VSf
QF/156ZMz67iURk7ssKHy0jOdoimXX7e9se96TghvL9CH10RBcJehU/lWnls3S0X
HhcEt/scIk9CYePhxb+XxdJgy79PJoCImqf17tmsRWq00405BA9PL/lbqmLYlJha
7A9wXu1pHcU8W5SPNtefWCTT0QBTbE8vx4mqa51pnjDvKzntz7WTaiQsMot1SoKO
g4WP4QFLqLRK4dEA4nZU9Yer+jnubOYy9LEV+R8Xtcp4gX5YEEBHd1ZZpSxBPTX3
lZtaaIsNCCwMYfwCaWK/MA13sJPBK8aIga3EE4Nc+QYuWig0vdrfyEcg0kAxPpeL
1MG+oYdU5COwgxxeGVv+LbTLWGMJ8KQR7jBuYGviaxPEd5trk6KolT4bK3ALIRsY
LD1AZB6GdWEjEXc109WmB8yu8av3IpKl879JDl3rK0SuuyvKHOlAr20yuoS1GPdG
qkO7AUVbe4YbXsrTsH2hVyYjPIF6VK694bc6NvJlQIimqxtkqT4=
=pkFW
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
