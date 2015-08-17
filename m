From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: tegra: Convert to managed resources
Date: Mon, 17 Aug 2015 13:47:51 -0700
Message-ID: <20150817204751.GD10748@sirena.org.uk>
References: <20150813072920.GA17181@localhost>
 <CAAVeFuKT1st8E1fxcDM5CV_OzUcTmvFw8UuU5oh15J1PiFJ0vA@mail.gmail.com>
 <CAK-LDbJwfuqU6ekRudms=YfjVxWf1BOREBwCnCh4v-YWY9hA_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6916679773762117797=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <CAK-LDbJwfuqU6ekRudms=YfjVxWf1BOREBwCnCh4v-YWY9hA_w@mail.gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Vaishali Thakkar <vthakkar1994@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Stephen Warren <swarren@wwwdotorg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--===============6916679773762117797==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BM/1i/1Z34LY4Oq9"
Content-Disposition: inline


--BM/1i/1Z34LY4Oq9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 17, 2015 at 03:02:29PM +0530, Vaishali Thakkar wrote:

> I think you are right. I missed that. But now thing is , this patch is already
> applied here:
> https://git.kernel.org/cgit/linux/kernel/git/broonie/sound.git/commit/?h=topic/tegra

> I am not sure if now I can change version 2 with the changes you suggested
> or not. Although I will not be able to test it  after changing 'goto
> err_suspend'
> as I don't have hardware but may be someone else can test it.

You can send an incremental update on top of what's there, or it may be
more sensible to just discard the change entirely.  I suspect we're safe
with either PM vs component ordering though since we should support !PM
configurations anyway.

--BM/1i/1Z34LY4Oq9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV0kh2AAoJECTWi3JdVIfQqGMH/jHQxOKyEchzt4Sf61eVxGSz
fPWiwQLpRsnYM9Oh2diRNrFayzosaHQmUX26Yw6KPa5xOoVfc6NU0qY2yIZ1GJIQ
qoymgena/rF9hPLHw4/daXfhaiv11cEnjTSUulQNbYCkv/6Wop8u17rLxkmNSI9r
hSq8kL6/CrGurS5aFo8LHaMwyu/bKhTIxDZhyegSXSh7RjOLSHnHb/HQPIdtqOwz
qxlpWsBKemW857Iy+ifn63pYeQWRmfu+GUgUo2qXfXHKGqqszMXkbXDkzjI2T5Zm
9CL8b1KmtrCckGURTbpTc297hyHJDeQnFr70yV+Sl4w+5vWfnTDwEp1VJP4tJG4=
=eBt/
-----END PGP SIGNATURE-----

--BM/1i/1Z34LY4Oq9--

--===============6916679773762117797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============6916679773762117797==--
