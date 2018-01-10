From: Marc Dietrich <marvin24@gmx.de>
Subject: Re: [PATCH 2/3] ARM: tegra: paz00: drop nonstandard 'backlight-boot-off'
Date: Wed, 10 Jan 2018 12:31:31 +0100
Message-ID: <27065017.X8cFkIFnZg@fb07-iapwap2>
References: <20180106004757.8239-1-briannorris@chromium.org> <20180106004757.8239-2-briannorris@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2399094.HeAjPAVIu4"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180106004757.8239-2-briannorris@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <briannorris@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, Lin Huang <hl@rock-chips.com>
List-Id: linux-tegra@vger.kernel.org

--nextPart2399094.HeAjPAVIu4
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

Hi,

Am Samstag, 6. Januar 2018, 01:47:56 CET schrieb Brian Norris:
> This was used out-of-tree as a hack for resolving issues where some
> systems expect the backlight to turn on automatically at boot, while
> others expect to manage the backlight status via a DRM/panel driver.
> Those issues have since been fixed upstream in pwm_bl.c without device
> tree hacks, and so this un-documented property should no longer be
> useful.
> 
> Signed-off-by: Brian Norris <briannorris@chromium.org>

seems to work again. Thanks!

Reviewed-by: Marc Dietrich <marvin24@gmx.de>

> ---
>  arch/arm/boot/dts/tegra20-paz00.dts | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/tegra20-paz00.dts
> b/arch/arm/boot/dts/tegra20-paz00.dts index 30436969adc0..12c63b23ed5e
> 100644
> --- a/arch/arm/boot/dts/tegra20-paz00.dts
> +++ b/arch/arm/boot/dts/tegra20-paz00.dts
> @@ -504,8 +504,6 @@
> 
>  		brightness-levels = <0 16 32 48 64 80 96 112 128 144 160 176 192 208 224
> 240 255>; default-brightness-level = <10>;
> -
> -		backlight-boot-off;
>  	};
> 
>  	clocks {


--nextPart2399094.HeAjPAVIu4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEySF+t0C8+8jyqfBvrJ5Hf0cUG2gFAlpV+ZMACgkQrJ5Hf0cU
G2h0ywgAhPmeR2Lc4M0SYhpOv6r+s2TQoqfB55bqHyJT662DMi++jSMno7H/7zLo
kNdubWhadXe2mUcW0QfzaRdRFUMh5YHx0oeE0Rxln/CPywQHXOVHtFhull72beMQ
sAzctL+cDpLYeNI255QUKbvXwQ8yVk9AGinm3KgDo92b6xPITUcmUZdOCyWWiPml
fmJ1jcbU14X4FuwNrA3QCiuylZaB07dhglK9QpV/4TMAj7wZrV1pEAx5IcwL6S/U
O/7H2UmTK3SNmYjOAEZFa+N8Br8FEQTQNy78iCwMB6vbmnJtTHne6UQ3RRarOyNf
zgGNTlqgISpxq3V8QvcyO4jehoGkkg==
=gTu9
-----END PGP SIGNATURE-----

--nextPart2399094.HeAjPAVIu4--
