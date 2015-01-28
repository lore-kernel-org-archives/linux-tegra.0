From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 06/10] ASoC: tegra: Add a control for
 the headphone switch
Date: Wed, 28 Jan 2015 18:24:02 +0000
Message-ID: <20150128182402.GD21293@sirena.org.uk>
References: <1422442278-10405-1-git-send-email-tomeu.vizoso@collabora.com>
 <1422442278-10405-7-git-send-email-tomeu.vizoso@collabora.com>
 <20150128110230.GQ21293@sirena.org.uk>
 <CAEUnVG6tKmdTt455w8g9C2_+XXpKz5=TR7=V8Lo3uJ3DKrOvag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2870836410614839622=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <CAEUnVG6tKmdTt455w8g9C2_+XXpKz5=TR7=V8Lo3uJ3DKrOvag@mail.gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Dylan Reid <dgreid@chromium.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Lars-Peter Clausen <lars@metafoo.de>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Stephen Warren <swarren@wwwdotorg.org>, Andrew Bresticker <abrestic@chromium.org>, Simon Glass <sjg@chromium.org>, Wolfram Sang <wsa@the-dreams.de>, Liam Girdwood <lgirdwood@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.de>, Thierry Reding <thierry.reding@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-tegra@vger.kernel.org


--===============2870836410614839622==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CAghj3nbcHapFenH"
Content-Disposition: inline


--CAghj3nbcHapFenH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 28, 2015 at 09:46:27AM -0800, Dylan Reid wrote:
> On Wed, Jan 28, 2015 at 3:02 AM, Mark Brown <broonie@kernel.org> wrote:

> > Why is userspace doing this?  If this is supposed to be associated with
> > the jack detection I'd expect us to be doing this in kernel.

> This is only related to jack detection in that seeing a jack insert or
> removal can cause userspace to set or unset it depending on the
> current policy.

OK, better changelog please then.  Also, to repeat the advice I think I
gave last time: please don't post large sets of unrelated changes as a
single series, send logically separate bits separately.

--CAghj3nbcHapFenH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJUySlBAAoJECTWi3JdVIfQve8H/jKFLa4LlHC8P8Wi5zAQHGGN
YgSJwZeknu9+gDqghkvHfMrY6xt3dOWFFjKQsanqqgYGGRqzxDINurbzSd5Sk/IW
/j2YRfK75rwErqfR/RlgY+2p/TaSzOlvm9/ddNJYwAW5AjE85rHOiYOU8mDPwUyF
+Xz5hCpdifOE7WRxZ3IOuStQWi0cPZa46OlIV22ZN549FKltsYinBZDYe9J6U0O8
IKUMXB2znDihV6U1jKj12ZoazT+O/pol3ot55Nk7X67AdiwGRBR1/az9mjAO8h42
8HSqs/pOnZAA363lSusGm4zmQLUKaIe1xsPxGFhslGdJykZS+Y6l5viJyI08/5A=
=4Mn4
-----END PGP SIGNATURE-----

--CAghj3nbcHapFenH--

--===============2870836410614839622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============2870836410614839622==--
