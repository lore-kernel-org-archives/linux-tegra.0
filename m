From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 0/9] ARM: dts: tegra: last minute fixes
Date: Wed, 17 Oct 2018 12:44:56 +0100
Message-ID: <20181017114456.GD24097@sirena.org.uk>
References: <20181016104730.4598-1-marcel@ziswiler.com>
 <20181016115852.GE7449@sirena.org.uk>
 <1539773488.6233.22.camel@toradex.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0039936423086879032=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1539773488.6233.22.camel@toradex.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============0039936423086879032==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3Gf/FFewwPeBMqCJ"
Content-Disposition: inline


--3Gf/FFewwPeBMqCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 17, 2018 at 10:51:30AM +0000, Marcel Ziswiler wrote:
> On Tue, 2018-10-16 at 12:58 +0100, Mark Brown wrote:

> > These ASoC patches appear to have absolutely no relationship with the
> > rest of the series.  Is that the case or is there some dependency I'm
> > missing?

> Not outside of all being Tegra specific stuff, no. If you prefer I may
> send them as a separate series.

It's fine this time but do try to avoid doing that please - if things
aren't related just send them separately.  Bundling them up into a
series creates confusion about dependencis and can result in things
getting held up due to problems in the unrelated bits of the series.

--3Gf/FFewwPeBMqCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvHILgACgkQJNaLcl1U
h9Dlnwf9Hvnm9dwWcAvUbfoH4cnxb+vYi5ve2/b/BwWLnNBVP1U/Ri4IWtMRjtdp
j01Y22pkqYROWXj3IPlPW2D4gBZNwFCL+JqxpJhE4JjEeSplUf0LaZHOUAxJ9Wja
co27D6T/C5Jd4bX8Bo70FaVRFic2F5Gw9PAy50MeWMVPLmH7JS37BU51FZCv4yzl
TNhFFX/BkUOxEZCtp7s4yWJewuUQL55/2QvyD15EVvmWglYWNvF+3DkJigvZ9pqy
Dm50cnpeKZPg2u7gAQ4bYuylmlcBAJav+0s4hJZv6pTVVxZW/NVEmODb8Dk1CE1B
saKQisMyB9gRbUGvzWB1K95XcHgk1Q==
=14T+
-----END PGP SIGNATURE-----

--3Gf/FFewwPeBMqCJ--

--===============0039936423086879032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============0039936423086879032==--
