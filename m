From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: core: Fix deferral of machine drivers
Date: Thu, 10 Jan 2019 16:48:35 +0000
Message-ID: <20190110164835.GF9541@sirena.org.uk>
References: <1546968494-22993-1-git-send-email-jonathanh@nvidia.com>
 <20190109183605.GH10405@sirena.org.uk>
 <44a64e6e-c9ec-8eba-60fe-eda092250d82@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0855239437687701733=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <44a64e6e-c9ec-8eba-60fe-eda092250d82@nvidia.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: alsa-devel@alsa-project.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Matthias Reichl <hias@horus.com>, Marcel Ziswiler <marcel@ziswiler.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============0855239437687701733==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="10jrOL3x2xqLmOsH"
Content-Disposition: inline


--10jrOL3x2xqLmOsH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 10, 2019 at 12:13:36PM +0000, Jon Hunter wrote:
> On 09/01/2019 18:36, Mark Brown wrote:
> > On Tue, Jan 08, 2019 at 05:28:14PM +0000, Jon Hunter wrote:

> >> -	struct snd_soc_dai_link_component *platform;
> >> +	struct snd_soc_dai_link_component platform;

> > This breaks the build for the SCU cards (and we needs a little rebase
> > against another fix I just merged, though I did do that when applying).

> Sorry I still don't see the build break, can you point me to it?

I'd need to find your patch again and fix the rebase issue.  It was
assigning a pointer to a platform IIRC.

> > I do think that this is going to be the safest thing to do for v5.0, it
> > can always be reverted later on when it's not needed but it seems clear
> > that a better fix is going to be way too invasive for the -rcs.  Can you
> > respin and retest please?

> Yes will do. I do wonder if we should be concerned about
> snd_soc_init_multicodec() as well? Looks like it could have a different
> problem if a machine driver already allocated the memory for the codec
> link component.

Since you appear to be volunteering to check...  :)

--10jrOL3x2xqLmOsH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlw3d2IACgkQJNaLcl1U
h9DRIQf+JTa0QWwNeGiaDov8b+Xc2LfAdLSzSdsprCtEif+8ZOdmk6Dym2bn702m
d57+QjxRH0ikzJAaEe6UEG+P0yt6SfL8Iu6mDeRskf8KXAbYWIhDUSWPumWoveq0
aYsYTFlh7Uz7+7KHLT/5lm9JQgEohzdRi1+29QG2vnDSzG3rhRRQZqOYABUyS9lE
mhTPyS+fmMU2JPonl+zSdBd6U+kE5BjaymUIiWaOiSYM5Pwa/mAQdSQOqpQoj9K6
sX7agMcf9Z7KyzffLIlCaaPtlInBLu6zCToqcOv+ZJozVgqpxkMhgHdyAlE/cP4N
FPZvOxU2RBOCDT6pWvIvcjN4klOQQQ==
=8T4V
-----END PGP SIGNATURE-----

--10jrOL3x2xqLmOsH--

--===============0855239437687701733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============0855239437687701733==--
