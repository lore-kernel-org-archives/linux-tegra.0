From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V3 12/18] usb: gadget: tegra-xudc: support multiple
 device modes
Date: Tue, 28 Jan 2020 19:10:20 +0100
Message-ID: <20200128181020.GJ2293590@ulmo>
References: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
 <1577704195-2535-13-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1ou9v+QBCNysIXaH"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1577704195-2535-13-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--1ou9v+QBCNysIXaH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 30, 2019 at 04:39:49PM +0530, Nagarjuna Kristam wrote:
> This change supports limited multiple device modes by:
> - At most 4 ports contains OTG/Device capability.
> - One port run as device mode at a time.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
> V3:
>  - No changes in this version
> ---
> V2:
>  - Updated err variable on failure to get usbphy.
>  - Corrected identation after tegra_xudc_phy_get API call in tegra_xudc_p=
robe.
> ---
>  drivers/usb/gadget/udc/tegra-xudc.c | 228 ++++++++++++++++++++++++++----=
------
>  1 file changed, 167 insertions(+), 61 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc=
/tegra-xudc.c
> index 283c320..bf80fae 100644
> --- a/drivers/usb/gadget/udc/tegra-xudc.c
> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
> @@ -483,14 +483,15 @@ struct tegra_xudc {
>  	bool device_mode;
>  	struct work_struct usb_role_sw_work;
> =20
> -	struct phy *usb3_phy;
> -	struct phy *utmi_phy;
> +	struct phy **usb3_phy;
> +	struct phy **utmi_phy;
> =20
>  	struct tegra_xudc_save_regs saved_regs;
>  	bool suspended;
>  	bool powergated;
> =20
> -	struct usb_phy *usbphy;
> +	struct usb_phy **usbphy;
> +	int current_phy_index;

Can be unsigned int. It's also very long. It might be better to choose a
shorter name so that when you use it, the lines don't get excessively
long. Alternatively you could keep this field name and instead declare
local variables to reference the current PHY to make lines shorter.

Actually, looking at this a bit more, I don't see current_phy_index ever
used by itself (other than the assignment and one check to see if a PHY
has been selected). So why not just store a pointer to the current PHY
and avoid all the dereferencing?

Thierry

--1ou9v+QBCNysIXaH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4weQwACgkQ3SOs138+
s6FiDw/9FkKjqK/pE5MWAXa2YCYVvNyJ+tKDD6xQh1/co/QYHOLWNSNyrJL/ECmZ
GRJpJYS/BTn+9WPnbOYWEiDVXhoQ+3evAEYFiir3DF23endG5IN5ZA58pLRP7vQD
T0Z6z5JcltLVESbX3hitWHdJkPKfqJHLFqQYZXHQTUWmpUAVgOt2lNtiaew5bEmE
yYOb/CPUHOeJfzespeepeCiJh9aNkVhW6bTX8vsmmdgnmAA7WJeNlZiR5tVXKumJ
nCOk7bOUti9v3FGUJotCCYe1pB/YdVw9wQU3dHh12LBiOP7hUHfhQql6UqEkfkBj
su0GpKqOo15/c6vXVlW5+JaJGSPdpQ52KrsAhh8ckfa5hJbkYkKn60CucJ+0X09k
APKUjF4ZyTgx6aKTsWK8NfOUaaGUmpbtivtIhQJLobss5pA5Vd2KBPXn9BsU+X7o
jQrgBhauACy3YceIosSYm7furIYwE87/zG0p6bGoKcq1TOvRmNXjsvB9AQywsbCQ
UHXFM+PBi3n7w8hUldDvoLhCZgwKN/ivosMBfva/VOlWBKI15BBdv4Q6biu/ULGh
Y+WpJPap/Rb2uhjQOccr2j7ERlQJw/0iT+lJUGRNgDxccmLTrRbCjhKPhbVNN/69
+O7NOHvGHW9zu+aNHKFCKy7GLVVhNTBPocoOCSuk4gIaQeukQow=
=nZc6
-----END PGP SIGNATURE-----

--1ou9v+QBCNysIXaH--
