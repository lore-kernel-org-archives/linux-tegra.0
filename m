From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: paz00: fix __initdata placement
Date: Mon, 23 Jan 2017 11:04:22 +0100
Message-ID: <4072003.S1IBmddlP7@fb07-iapwap2>
References: <20170123074347.GA29804@dtor-ws>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1515444.KbqjpeHriM"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170123074347.GA29804@dtor-ws>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--nextPart1515444.KbqjpeHriM
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello Dmitry,

Am Sonntag, 22. Januar 2017, 23:43:47 CET schrieb Dmitry Torokhov:
> To have expected effect the __initdata attribute should go after variable
> name and before initializer.`
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/mach-tegra/board-paz00.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-tegra/board-paz00.c
> b/arch/arm/mach-tegra/board-paz00.c index 7478f6fb3664..ea6bff404161 100644
> --- a/arch/arm/mach-tegra/board-paz00.c
> +++ b/arch/arm/mach-tegra/board-paz00.c
> @@ -23,7 +23,7 @@
> 
>  #include "board.h"
> 
> -static struct property_entry __initdata wifi_rfkill_prop[] = {
> +static struct property_entry wifi_rfkill_prop[] __initdata = {
>  	PROPERTY_ENTRY_STRING("name", "wifi_rfkill"),
>  	PROPERTY_ENTRY_STRING("type", "wlan"),
>  	{ },

you are right according to the documentation, but objdump -s always shows that 
it gets put into the .rodata section. So this patch has no effect, because 
result is always same (and wrong). It's also possible that I'm doing something 
wrong :-) Btw, there are hundreds of such __initdata misplacement in the 
kernel.

Marc

--nextPart1515444.KbqjpeHriM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEySF+t0C8+8jyqfBvrJ5Hf0cUG2gFAliF1SYACgkQrJ5Hf0cU
G2hfaQf/fsl3vXHhdUMFIA+As2aabIezAqCiNJ/D85q2+Ic5AEEzCc4EjVmpyyaS
u6l9jATYuGcl4u4dOL0bnmnUD6U8gVFb4zc7RckTDndQ7eNJA7Hr1OgV8odJojme
Soe93g4a6vOkCAZm6+RVwyOf8NykUX+qoPekasaLY3s3X6U7Ow5Ss8ulHhFQPBZT
QJrG29bV3Xzb/pPkSZX21SZcMe0SgaH4Yu3ozQBsq9fbUNUE7KOtQu3Nj+oFDR6J
YNZod7XsP/iF+g88GEnisZBUbWq+UeQ2hW3ituyFrs41dnbMidxpDJ51YnPQhXO9
mUOVwHnvQcJjt0UG3hbmUvrjYY7y3Q==
=WlhV
-----END PGP SIGNATURE-----

--nextPart1515444.KbqjpeHriM--
