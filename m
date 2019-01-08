From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 3/3] ASoC: soc-core: fix platform name
 vs. of_node assignement
Date: Tue, 8 Jan 2019 15:33:12 +0000
Message-ID: <20190108153312.GE6590@sirena.org.uk>
References: <20181018111829.27056-1-marcel@ziswiler.com>
 <20181018111829.27056-4-marcel@ziswiler.com>
 <e25a7463-9ce0-d7f9-e77b-2bbaab2e0b25@nvidia.com>
 <20181021112301.GC8554@sirena.org.uk>
 <20181218174040.k7u26vnnoplllnwb@camel2.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3617532830565666072=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20181218174040.k7u26vnnoplllnwb@camel2.lan>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Matthias Reichl <hias@horus.com>, Jon Hunter <jonathanh@nvidia.com>, alsa-devel@alsa-project.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel@ziswiler.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============3617532830565666072==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ns7jmDPpOpCD+GE/"
Content-Disposition: inline


--Ns7jmDPpOpCD+GE/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 18, 2018 at 06:40:40PM +0100, Matthias Reichl wrote:
> On Sun, Oct 21, 2018 at 12:23:01PM +0100, Mark Brown wrote:
> > On Fri, Oct 19, 2018 at 11:22:46AM +0100, Jon Hunter wrote:

> > Indeed, this is a bit of a mess.  We probably shouldn't be modifying the
> > data that the drivers passed in, otherwise we get into trouble like
> > this.   That suggests that we should copy the data, probably all of it.
> > I will try to have a proper look at this next week.

> did you find the time to look into this?

No, the end of the year turned out to be really busy unfortunately.

--Ns7jmDPpOpCD+GE/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlw0wrcACgkQJNaLcl1U
h9B/2Qf+KYOyXhgkAUL6esq2OqmG/7tg94X4kIe8O7y9KJ0okLelfakouR0JGiuY
CKBUVkzfHLzKtX0qdTayVq9LfVqiISnO1jtkcjYmoxnOvKuINo/KtfNHmpJb0ZYb
sKP2rNx6++b7EsEBtaB1RmKk0IpjkJBsTYU0aSFpFPwbW7e9usRBmHxXGup0CKm2
XKoicn805BXwRzKtREilYua/5hHNiUGvrPo4jSRhiNUn13C40IrQELv5kj8txEO5
ZgnL4P0QNFc5MheXtbGhFB1x/5g9iCYxM4v6udIP5XRV/nFCX2qX3AjdAEaplOJf
M1mSFzv76wn5VwPKnULRpOPggVNH7A==
=SDSH
-----END PGP SIGNATURE-----

--Ns7jmDPpOpCD+GE/--

--===============3617532830565666072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============3617532830565666072==--
