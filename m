From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 1/3] ASoC: tegra: add tegra sgtl5000
	machine driver
Date: Tue, 7 Oct 2014 18:54:02 +0100
Message-ID: <20141007175402.GT4609@sirena.org.uk>
References: <cover.1412381377.git.marcel@ziswiler.com>
 <74ea4fe20e653d2da555c8d7dd1478746bccd529.1412381377.git.marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6502297671497960065=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <74ea4fe20e653d2da555c8d7dd1478746bccd529.1412381377.git.marcel@ziswiler.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux@arm.linux.org.uk, Stephen Warren <swarren@wwwdotorg.org>, Liam Girdwood <lgirdwood@gmail.com>, stefan@agner.ch, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============6502297671497960065==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Z1gw0Ba8VHj8Ap4r"
Content-Disposition: inline


--Z1gw0Ba8VHj8Ap4r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 04, 2014 at 02:15:43AM +0200, Marcel Ziswiler wrote:
> This binding and driver describe/support playback to headphones, and
> capture from line-in and microphone.
>=20
> This driver is useful for the Toradex Apalis T30 and Colibri T30 modules.
>=20
> Signed-off-by: Marcel Ziswiler <marcel@ziswiler.com>
> Reviewed-by: Stephen Warren <swarren@nvidia.com>
> ---
> Changes in v3:
> - Revert to not using simple-audio-card being incompatible with tegra.
> - Rebased to for-next.

I can't help but think that't there's still room for a Tegra simple card
here, there doesn't seem to be anything particularly CODEC specific
about the driver here - it *could* use simple-card were it not for the
CPU side.  This also seems like a specific example of the same problem
we see with supporting DPCM in simple-card, we need a way for CPUs to
be able to say that they need some general setup that covers the CPU
internal configuration.

--Z1gw0Ba8VHj8Ap4r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUNCi5AAoJECTWi3JdVIfQEAQH/i4sms+iNsBEGLCrkZmdPBR+
NdQBJrohsOUj0V4xeOOspSVUlM3PeR2PDEh7QxNInRnFRmi8+r8cqmgX49AOhFr5
vk3s+aIJY+vjhpctHG3uzwKvJC/4pdem+oV1qdgjSTs1EmZIMpiilRzavx/Etugu
ZYfVxeC7xNVsaYnBhIVSC+7mF4vDRaf+cPpfAGls7VkkuEw4X8eFs5hwKLMctY+r
RBxeiqQ6Qh7++Esj6nJE4Z9wFpxePhKnN4hfjcoka21U6oSfBaQkdp8VVEExEY8E
ms9B4g+ErcvtPJVoBnLaWXTcO9eXc5Dr49PmqDyvaUn5Q5tFcIEsvGqjBre63vg=
=ZNY2
-----END PGP SIGNATURE-----

--Z1gw0Ba8VHj8Ap4r--

--===============6502297671497960065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============6502297671497960065==--
