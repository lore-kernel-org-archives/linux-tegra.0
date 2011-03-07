From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 3/3] ARM: tegra: enable new drivers in defconfig
Date: Mon, 7 Mar 2011 11:24:56 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF045687B8D7@HQMAIL01.nvidia.com>
References: <1299486399-21761-1-git-send-email-olof@lixom.net>
	<1299486399-21761-4-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF045687B863@HQMAIL01.nvidia.com>
 <AANLkTi=ca32_k+6f65RoxnhpC=yn19Ee2uN72z+pH27s@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=ca32_k+6f65RoxnhpC=yn19Ee2uN72z+pH27s-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Monday, March 07, 2011 12:19 PM:
> On Mon, Mar 7, 2011 at 9:34 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
> > Olof Johansson wrote at Monday, March 07, 2011 1:27 AM:
> >> Enable new platforms and tegra drivers in tegra_defconfig. Also en=
able
> >> some of the common devices several platforms, and GUID partition t=
ables
> >> to make it possible to boot a tegra_defconfig kernel with a Chromi=
umOS
> >> filesystem.
> >>
> >> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> >>...
> >> @@ -78,12 +81,21 @@ CONFIG_SERIAL_8250_CONSOLE=3Dy
> >> =A0# CONFIG_LEGACY_PTYS is not set
> >> =A0# CONFIG_HW_RANDOM is not set
> >> =A0CONFIG_I2C=3Dy
> >> -# CONFIG_HWMON is not set
> >> +# CONFIG_I2C_COMPAT is not set
> >> +# CONFIG_I2C_HELPER_AUTO is not set
> >> +CONFIG_I2C_TEGRA=3Dy
> >> +CONFIG_SENSORS_LM90=3Dy
> >
> > I'm not sure why the LM90 is needed?
>=20
> LM90 =3D=3D adt7461 temp sensor, registered and used on seaboard.

Ah, it's a compatible device. In that case,

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--=20
nvpublic

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
