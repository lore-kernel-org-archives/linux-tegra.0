From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/3] Expose more controls from
	tegra-max98090
Date: Sat, 21 Feb 2015 23:50:32 +0900
Message-ID: <20150221145031.GX6236@finisterre.sirena.org.uk>
References: <1423666200-32365-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6848528231171760507=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1423666200-32365-1-git-send-email-tomeu.vizoso@collabora.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>, Stephen Warren <swarren@wwwdotorg.org>, Pawel Moll <pawel.moll@arm.com>, devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, Liam Girdwood <lgirdwood@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Kumar Gala <galak@codeaurora.org>, linux-tegra@vger.kernel.org, Dylan Reid <dgreid@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-tegra@vger.kernel.org


--===============6848528231171760507==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0btr6/5+bhBdui6J"
Content-Disposition: inline


--0btr6/5+bhBdui6J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2015 at 03:49:51PM +0100, Tomeu Vizoso wrote:
> Hello,
>=20
> we need some more controls in userspace so policy can be applied at events
> such as microphone and headphone jacks being plugged in, to be used by
> Tegra-based Chromebooks.

I see that your "v2" which only added an ack was sent less than a day
after this initial posting.  Don't do that, it just adds to the mail
volume.  Only resend if it's been a while and there's been no review or
if you've got an actual change to make otherwise the mail isn't really
adding anything.

--0btr6/5+bhBdui6J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU6Js3AAoJECTWi3JdVIfQoFgH/3O/YE4FolWux6/rkCGubSQe
oesUD9BM/leyQ/Qf6Su2re2bRWCGVav4Fw+khRGtYBaV0QnG0pKal9WdM8MZrZGt
1rj+wmaaSI/GGCRjE7dTaW+sVpMDrMULrLBOQ3cAYYISbvSHl98Kq99Uh6mEPhp9
KXqF6N71CIr0yt6IzxjDbI69imo2+wKTQWxqz3Rs+HKGi2DOeynsztwwbYzAbjC/
pYaGIYAGLqRGNgXRSe+nOQegoKlfNOaymHMc5iHqTfKYWcauHttbCD/RYcNlf2Oh
olc9yvGTZqBKzBhW57q/PQ3/8OzGLPWdd3YluZjljkYy2E2QYHtS8Whe3+otCaM=
=ctjX
-----END PGP SIGNATURE-----

--0btr6/5+bhBdui6J--

--===============6848528231171760507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============6848528231171760507==--
