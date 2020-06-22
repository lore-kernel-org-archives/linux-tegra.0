From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH AUTOSEL 5.7 004/388] ASoC: tegra: tegra_wm8903: Support
 nvidia, headset property
Date: Mon, 22 Jun 2020 14:27:57 +0100
Message-ID: <20200622132757.GG4560@sirena.org.uk>
References: <20200618010805.600873-1-sashal@kernel.org>
 <20200618010805.600873-4-sashal@kernel.org>
 <20200618110023.GB5789@sirena.org.uk>
 <20200618143046.GT1931@sasha-vm>
 <20200618143930.GI5789@sirena.org.uk>
 <20200621233352.GA1931@sasha-vm>
 <20200622112321.GB4560@sirena.org.uk>
 <20200622123118.GF1931@sasha-vm>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GdbWtwDHkcXqP16f"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200622123118.GF1931@sasha-vm>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--GdbWtwDHkcXqP16f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 22, 2020 at 08:31:18AM -0400, Sasha Levin wrote:
> On Mon, Jun 22, 2020 at 12:23:21PM +0100, Mark Brown wrote:

> > That's concerning - please don't do this.  It's not what stable is
> > expected to be and there's no guarantee that you're getting all the
> > changes required to actually make things work.

> How come? This is one of the things stable rules explicitly call for:
> "New device IDs and quirks are also accepted".

I would expect that to be data only additions, I would not expect that
to be adding new code.

> If we're missing anything, the solution is to make sure we stop missing
> it rather than not take anything to begin with :)

It would be much better to not have to watch stable constantly like we
currently do - we're seeing people report breakage often enough to be a
concern as things are, we don't need to be trying to pile extra stuff in
there because there's some keywords in a changelog or whatever.  The
testing coverage for drivers is weak, increasing the change rate puts
more stress on that.

--GdbWtwDHkcXqP16f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7wsdwACgkQJNaLcl1U
h9DAWgf+LXkPTWA3Nc4TkIaUcPd+6AtboLQyyP/9/zEkyr2ajDpxQXLudemBDlSm
kHTVki/gUcoz35AYQ5Hz9grJOzflY0Md4GMge23a8MOKyI4vG/bPkDU1cB0Ui9nz
g6HpTo9KGjOtwUMrL8EOOukvy87Uq9UdfSbffIWDLo8o/RiicXsc+on+Oso9NXdZ
mTI5atdoy6lseE9eaYxGrgmetAytq7nmr79/UBBVIh2WMxgqZjNHE360hUJx8HSQ
O9TUmrx7VKViCZxIhSW0DnJz0ArHTqJ6E/kdsoy6OaM4PkGUGup9xqLe3eHoaFqp
OvEHOplFor4XKOgt1n2JicJP6G+Wrw==
=xyNh
-----END PGP SIGNATURE-----

--GdbWtwDHkcXqP16f--
