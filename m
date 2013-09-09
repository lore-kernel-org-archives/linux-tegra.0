From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Enable DMA CMA support
Date: Mon, 9 Sep 2013 15:04:39 +0200
Message-ID: <20130909130438.GE22197@ulmo>
References: <1378195505-28753-1-git-send-email-treding@nvidia.com>
 <522621A4.1040308@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nHwqXXcoX0o6fKCv"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <522621A4.1040308-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--nHwqXXcoX0o6fKCv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 03, 2013 at 11:51:32AM -0600, Stephen Warren wrote:
> On 09/03/2013 02:05 AM, Thierry Reding wrote:
> > Commit f825c73 ("mm/cma: Move dma contiguous changes into a seperate
> > config") renamed the CMA option to DMA_CMA but didn't update any default
> > configurations.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > Note that this should be applied after 3.12-rc1, since the above patch
> > will presumably go into 3.12 during the merge window.
> >=20
> > Ideally this would've gone into the original commit and in fact digging
> > through some archives it turns out that an initial version of the patch
> > did modify the default configurations, but the hunks were dropped when
> > the patch was applied because of the potential for merge conflicts...
>=20
> I think you should take this up with the original author/committer of
> the problematic patch. If they rename something, they have to deal with
> the fallout of the rename. If this causes merge conflicts, this is
> something Linus wants to see.
>=20
> If not, feel free to forward this to arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org with my ack below at
> the appropriate time.
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I brought up the issue in the pull request that contained the commit and
Linus fixed it up during the merge, so we shouldn't have any breakage.

Thierry

--nHwqXXcoX0o6fKCv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSLcdmAAoJEN0jrNd/PrOh3HsP/Rp8zP4I2L9yBa2J6j4Fe0Uh
sMkHdtAkU51df/Tflz0mVBUVfrahyA9oA+a2C8H6eta1DdjasgjQXJ351HRXMNyN
VIrVD8PH4Pp/TDJpSYKVXzIQM8WdrgBg7z4WcUfBmBByqQEtue6PL7/WGv5tbp9Y
s/k7DB8SIJd4+9d5nCC4MgYYChSt8JErOIDjIZXvmwz8QGk7Zr3L9KvUAjXd9wqL
05Xw8PeQlfO5uvuEFEmhBDEUqxsrMLCooKxYtFIbRu5TgQDKR3qUY2Mk+XVxTYzQ
W3AUY+EVixS/qb6iRxw82rtIOtKEagsQpW65MLoxchmw6USZcJEoMEAUkT5Xa7qF
BrfHqF4C0X7TetC2mcaIRf/dN5LuAr8aBNYDMhBDfzNtgta1SenGSzbNumhAXtlO
DQ/CZMgCaTvuLCF/zvBSgjDX6EUvr1JlOJGOEV9mCvQVlOxd65t41PDUZMajK/f0
gVOePogCmUt18l0ERFplrTlt4Pf1xfuHQ0Ac7wunmmvts1utN62xwnISRRO0QJid
P8DbAWoK1NLhR5NNlyGfNYOCQBENB7nbxNRHT44b+/twzZE7lyUpxqbEzIAQJqSN
FtbiS9Su6d7/NWlH9dZY1IiYmZiIIIBfCjuCPX7yo09wrZGLwx55uZZ8Bh43d/XN
7bB6kh8gAEVozm7d1UJw
=nbj9
-----END PGP SIGNATURE-----

--nHwqXXcoX0o6fKCv--
