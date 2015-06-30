From: Marc Dietrich <marvin24@gmx.de>
Subject: Re: [PATCH v2] ARM: tegra: paz00: use con_id's to refer GPIO's in gpiod_lookup table
Date: Tue, 30 Jun 2015 22:44:40 +0200
Message-ID: <3628722.nhXkFk5ghW@ax5200p>
References: <1435673759-11996-1-git-send-email-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart7599505.AiqW3ZIXxa"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1435673759-11996-1-git-send-email-digetx@gmail.com>
Sender: stable-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--nextPart7599505.AiqW3ZIXxa
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Dienstag 30 Juni 2015, 17:15:50 schrieb Dmitry Osipenko:
> Commit 72daceb9a10a ("net: rfkill: gpio: Add default GPIO driver mappings
> for ACPI") removed possibility to request GPIO by table index for non-ACPI
> platforms without changing it users. As result "shutdown" GPIO request
> will fail if request for "reset" GPIO succeeded or "reset" will be
> requested instead of "shutdown" if "reset" wasn't defined. Fix it by
> making gpiod_lookup_table use con_id's instead of indexes.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Fixes: 72daceb (net: rfkill: gpio: Add default GPIO driver mappings for
> ACPI) Cc: <stable@vger.kernel.org> # v3.19+
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>

beside a small typo in the commit message (is users -> its users) this looks 
good now. I can confirm that the gpio's are all available now.

Reviewed-by: Marc Dietrich <marvin24@gmx.de>

> ---
> 
> v2: s/GPIO_LOOKUP_IDX/GPIO_LOOKUP/, otherwise "shutdown" GPIO won't be
> requested
> 
>  arch/arm/mach-tegra/board-paz00.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-tegra/board-paz00.c
> b/arch/arm/mach-tegra/board-paz00.c index fbe74c6..49d1110 100644
> --- a/arch/arm/mach-tegra/board-paz00.c
> +++ b/arch/arm/mach-tegra/board-paz00.c
> @@ -39,8 +39,8 @@ static struct platform_device wifi_rfkill_device = {
>  static struct gpiod_lookup_table wifi_gpio_lookup = {
>  	.dev_id = "rfkill_gpio",
>  	.table = {
> -		GPIO_LOOKUP_IDX("tegra-gpio", 25, NULL, 0, 0),
> -		GPIO_LOOKUP_IDX("tegra-gpio", 85, NULL, 1, 0),
> +		GPIO_LOOKUP("tegra-gpio", 25, "reset", 0),
> +		GPIO_LOOKUP("tegra-gpio", 85, "shutdown", 0),
>  		{ },
>  	},
>  };

--nextPart7599505.AiqW3ZIXxa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAABAgAGBQJVkv+4AAoJEKyeR39HFBtoKT0H/jgxMMJlg4x39yMDSxDEDJ3x
jDH0Sqw5yT/c+UeUfLlHjcGB9JzMS2UiYW3qeBXKGeULm/265EPjnoXOMXJ7QGmF
DnvFpZmpZ43lzBsOopNnTc28AGFrMbJZqdG7WMsIjCUFg212M99iS5FSvURRNbjK
8VtY7+eD8FIv6YIs2DbzJ0iOF/bDyldVsVO769U9Aye1+ZJbZvvFH/Zy/Fopa8P9
IIM96kBiSVWzu6e4epp7JTp8MSXK9VxL3TT5y/0QrVzDqHJLUXMa2LBOZfobZHwq
RvoZOo8IcR90Ra2IwTom28wjwAEKLAO1e9TmujTiTEB7jekIAo7NAt8Ia5wkKbU=
=tPCQ
-----END PGP SIGNATURE-----

--nextPart7599505.AiqW3ZIXxa--
