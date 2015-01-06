From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 4/4] ARM: tegra: remove wp-gpios from the generic nyan dtsi
Date: Tue, 6 Jan 2015 14:08:39 +0100
Message-ID: <20150106130838.GG31830@ulmo.nvidia.com>
References: <1420540653-14816-1-git-send-email-tomeu.vizoso@collabora.com>
 <1420540653-14816-5-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4899963192451004141=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1420540653-14816-5-git-send-email-tomeu.vizoso@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-tegra@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============4899963192451004141==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Cgrdyab2wu3Akvjd"
Content-Disposition: inline


--Cgrdyab2wu3Akvjd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2015 at 11:37:29AM +0100, Tomeu Vizoso wrote:
> As the nyan-blaze has a micro-sd slot, as opposed to nyan-big, which has =
a full SD
> slot.
>=20
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> ---
>  arch/arm/boot/dts/tegra124-nyan-big.dts | 4 ++++
>  arch/arm/boot/dts/tegra124-nyan.dtsi    | 1 -
>  2 files changed, 4 insertions(+), 1 deletion(-)

Shouldn't this be squashed into patch 2/4?

Thierry

--Cgrdyab2wu3Akvjd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUq95WAAoJEN0jrNd/PrOhGkUP/RVd0lzrU1Z9J2jgQ2K6olr9
ymDvixWY34FKUkcU6PDnKz+aJQU5lqYXHIqXcD1foHOeEJ2CDABlA8c82aG9EeIl
1JquIn4HafGniC1HJWj7YInbAmex9lRqhm0OMcE21F24bjo2QzW10gTc9OdEuYuM
f2veiGqGft7TNzktE+HjTPo1V3dvw1ZeJWzlyujMbrF4FkGQwYhrmD9M5UD9w1fu
blAaEXUAiycc0Sa0guQR+CrSH1+zxfIzMtaznAyhowv8SWb59adVBUGu9c65jvuM
vFHYPRqBvHllkiEcBtGZiT/aWnr8L4zySU6OFNKmKEEGlpXwlGYER/ewVdmhA6rk
Cq54D79/iGUgPCbIj+pVbq638p6JFRI6/uJ38+APHibCoOlg1SmTEexmrgex99yN
HOHL/DVAh2IRYsEKvYKCuNnyOBQ6HMr66HiiQODTEib90NZ3KA98fEOVqbumCocB
rSJNxNhEQvonD3/+9HUt0+Aoa9IGpmsseYME0kWrTsvor3PoYjXkpS3zmJy8XvQj
akqafP0IqhCqo7BZ0Jzpj6QRAMAKxhJXPrAVrA2j/9GNMWA7bw79znIrn/AcEnhF
jRhNnOiqspox3NNiM3wMp6S5jnWpXk6buhKfczmheWUxQfQ2aPlBit/glM7ch5Q0
Q7ZjT0neySd4RwxJEX2o
=Na4a
-----END PGP SIGNATURE-----

--Cgrdyab2wu3Akvjd--


--===============4899963192451004141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4899963192451004141==--
