From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm64: tegra210-smaug: Add gpio-key nodes
Date: Fri, 4 Mar 2016 09:47:29 +0100
Message-ID: <20160304084729.GB4038@ulmo>
References: <1457034865-17826-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1457034865-17826-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 03, 2016 at 02:54:25PM -0500, Rhyland Klein wrote:
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
[...]
> +		lid {
> +			label = "Lid";
> +			gpios = <&gpio TEGRA_GPIO(B, 4) GPIO_ACTIVE_LOW>;
> +			linux,input-type = <5>; /* EV_SW */
> +			linux,code = <0>; /* SW_LID */
> +			gpio-key,wakeup;
> +		};
> +
> +		tablet_mode {
> +			label = "Tablet Mode";
> +			gpios = <&gpio TEGRA_GPIO(Z, 2) GPIO_ACTIVE_HIGH>;
> +			linux,input-type = <5>; /* EV_SW */
> +			linux,code = <1>; /* SW_TABLET_MODE */
> +			gpio-key,wakeup;
> +		};

Is there a way to trigger these on a DVT device? Power and volume
controls work fine, but I haven't found a way to test these two.

Thierry

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJW2UufAAoJEN0jrNd/PrOhu8YP/iEgruJwbOOHmuQrjmctKT0K
R/1Gl4fTJ7E5t6nZd565YccpUcJyCMv5MmrPMdpcZEZdrU8zq0zDRaFTDrED8BL8
bLbk4ze0n30xtRhSGYtVhKoo1rIPRYeA5dnqbt74eIlyB2LJuIDIyFzc7WAm2qN2
4H8x70Sohs1uOj1EaH3XGg+QmJNWYg9KnxKmujRUe/K7zKURHIqxD+L+KKKUkw55
nzcRdVsE9xiSzqh50PjymeSapNscIhJKUvhLEZpNyyhxnCRr3QMr5rInTP6Fxp9h
vmfAa6W5bPIofo9HKjrVJlOHVNZWEBL+odtOcYxweIsejNlJBZMa4Qqnib/+G4ah
I/i3LDzr0StWObFax6wIt4dU0U5vAPJx5hhQSYBOtaj/RXTxcJsiflBEVbkq6RPl
ONx96joMN2sAPzqYoM2LZLSDBQX8cPK1N8qUmscKD1yuUTsdau407sSg8/AQ2qcP
cZ+DAFIkFVVx16LcR9hbVOZNwvre5r+xbz/OCCHbpI4ItCt9D8kSgN4T+h0ekYbf
aeRmyA7eGgbsYLUBRs3q05DUq5yRIKFcxdXcDguWTmzlRk740lgfbv4tCASp8JYc
lkgQZKgEzWQkS4Lt7421eaSoPvUeAN7sQRw1c8lNyrOA/EP623Glk51qjpwF5oyh
eh8As/Yz7eFqFw8acjPW
=vhfV
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--
