From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V3 0/8] Tegra XUSB charger detect support
Date: Thu, 14 May 2020 12:39:29 +0300
Message-ID: <87wo5e4zzi.fsf@kernel.org>
References: <1589437363-16727-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1589437363-16727-1-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> writes:

> This patch series adds charger detect support on XUSB hardware used in
> Tegra210 and Tegra186 SoCs.
>
> This patchset is composed with :
>  - dt bindings of XUSB Pad Controller
>  - Tegra XUSB device mode driver to add vbus_draw support=20
>  - Tegra PHY driver for charger detect support
>
> Tests done:
>  - Connect USB cable from ubuntu host to micro-B port of DUT to detect
>    SDP_TYPE charger
>  - Connect USB cable from external powered USB hub(which inturn connects
>    to ubuntu host) to micro-B port of DUT to detect CDP_TYPE charger.
>  - Connect USB cable from USB charger to micro-B port of DUT to detect
>    DCP_TYPE charger.
> DUT: Jetson-tx1, Jetson tx2.
>
> V3:
>  - Added ACKed-by details for PHY driver and DT changes.
>  - Functions and its arguments are aligned.
>  - Tabs are used for alignment of MACRO's
>  - For vbus_draw USDC callback, usb_phy set_power error is propogated.
>  - Fixed various comments given by thierry.
> V2:
>  - Added ACKed-by details for DT patches.
>  - All patches rebased.
>
> Nagarjuna Kristam (8):
>   dt-bindings: phy: tegra-xusb: Add charger-detect property
>   usb: gadget: tegra-xudc: Add vbus_draw support
>   phy: tegra: xusb: Add support for UTMI pad power control
>   phy: tegra: xusb: Add USB2 pad power control support for Tegra210
>   phy: tegra: xusb: Add soc ops API to enable UTMI PAD protection
>   phy: tegra: xusb: Add support for charger detect
>   phy: tegra: xusb: Enable charger detect for Tegra186
>   phy: tegra: xusb: Enable charger detect for Tegra210

Is there a hard-dependency between gadget and phy patches?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl69EdEACgkQzL64meEa
mQb8sA//arcV2sJenLAVwznTaumNZT/wFev4shUg+YBRJMGWcpGLvoSIDp1isgKF
RfHgWCgIywoyBulBpklhyz/aa1Z1g9ZAYMKnz08hbvmaTwrN3/YHArbi3nWhx1N4
nqM0M9D0qFvsuYUENE7vlaVRnKtEzjQHvDl0c8G4ACUYmT5A3RWuvo4JNvdkKPiE
52Apk0ccU/or8IGZIPO0DeYQR60KIr+hNjiBSPa7uY0RtyuRCvHJaiUrYw3PeIHg
rk+/6eNdKR1XFIuwoboS6vg8OMvcVg4Kozyr/v0duk0AzhB66o7LyV8XQbtoITVH
mizLxQvGas+dyi1PbcPOAuTuTjrrq1/Cpnwhkih/rZEDfJtBOUs5iud5ZQiz2+wz
+cvjKX5YF4UcfeFgAUi8536qnD+j5aKGgra9eWp+LgscTEYqOajZpK8QdvHqtcKK
o/hXvC6dM5MxFQKfj3xvSNeoDFf8/jMwhYHx/bnYIXP5IbgGuwQ7dmZbF0W6Snrn
zg8GEjjdjyzEB6aWVQ8EbybgqRoySodmDhXsNtbTzj9duGyc+I794FS2hsYw8Emy
HntxrKiyf58VTjwcRE4FTlHJizLnk+eGZFCOReYPx3rIxjZbint8pkm6s/nLwIyq
wJQezFji3PAJyJM8X1wB0iN1fA+QQKGuWeWmfcR3yivGaAgdJg0=
=DTUT
-----END PGP SIGNATURE-----
--=-=-=--
