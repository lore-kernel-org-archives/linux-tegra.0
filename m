From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: tegra: support a Mic Jack in the
 Tegra+RT5640 machine driver
Date: Thu, 15 Aug 2013 11:08:44 +0100
Message-ID: <20130815100844.GW2401@sirena.org.uk>
References: <1376511989-28187-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8979461654543251955=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1376511989-28187-1-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Stephen Warren <swarren@nvidia.com>, Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <rob.herring@calxeda.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============8979461654543251955==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W1uEbMXJ1Mj4g6TI"
Content-Disposition: inline


--W1uEbMXJ1Mj4g6TI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2013 at 02:26:29PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
>=20
> Add a Mic Jack widget to the Tegra+RT5640 machine driver, and document
> this in the DT binding. This enables the DT to include the Mic Jack in
> the audio routing table, and hence enables capture of audio, in addition
> to the previously-working playback.

Applied, thanks.

--W1uEbMXJ1Mj4g6TI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSDKipAAoJELSic+t+oim9GdwQAIEWQKsjWjiLLlorg06uhL4H
r37wuL1pCosg3IrNe7BNZ3oKxRDEwK92XU8LWKpLt7KVdYs7mIoSNPadoJxJWsPB
iGHDeXxKR4+kfE9D7SsVdhM7ZbYyJnkR08LjTLzVBqIhJzsZq7+JLRa68U0fIIJW
QK66befmUlyHzqIFeU0f6KjYCSsUemm91a+hYwbEixtYJ4Azve8wf/dAifHKESzM
oFayPGNj+YVj5bdq+o1i6IaD+PodL+u99nQcY2FcQlsOOUf7c9zcUuJ0DMJT4Dv1
F/eYfP2KqQMGIhhclaTsLTXEiQWcSaeHGpnocDkzC4PWnmXkfY0w+RV6ERqRb88I
doWBErxmMVsxiwvgA0la61jgTv2phL+IrtCF9X6SG2rKmE3WuJOPQ4wuelYRH6Fr
0pJiGH1yKGrPYCKW+OqPWYN+9iKiq7h9Ej4OSzGLQTsvXdpow1w57OkHuOeoVUoE
Du0oeDIEHs0EoUuSIhfN74FWL5bDOXsjSw2MUIx+bswEqmP8IoEwpLnPW+4iW0f6
OH68zy0d75n6PKMNRWSbFQvd4BzkObATJJ+4fYAaTvjaI5HsYFscWR1NaNCiY7y9
vok3qDVi4Ynij2U4ACJbVFIT//9psAJfZ6vW2p4rPvbvTjf10q5kBcoMajx0ZnYs
uYbawE7xa+pMIofFDKnp
=I1np
-----END PGP SIGNATURE-----

--W1uEbMXJ1Mj4g6TI--

--===============8979461654543251955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============8979461654543251955==--
