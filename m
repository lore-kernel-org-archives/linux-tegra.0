From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: tegra: enable new drivers in defconfig
Date: Mon, 7 Mar 2011 11:18:50 -0800
Message-ID: <AANLkTi=ca32_k+6f65RoxnhpC=yn19Ee2uN72z+pH27s@mail.gmail.com>
References: <1299486399-21761-1-git-send-email-olof@lixom.net>
	<1299486399-21761-4-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF045687B863@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF045687B863-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Mar 7, 2011 at 9:34 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:
> Olof Johansson wrote at Monday, March 07, 2011 1:27 AM:
>> Enable new platforms and tegra drivers in tegra_defconfig. Also enab=
le
>> some of the common devices several platforms, and GUID partition tab=
les
>> to make it possible to boot a tegra_defconfig kernel with a Chromium=
OS
>> filesystem.
>>
>> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
>>...
>> @@ -78,12 +81,21 @@ CONFIG_SERIAL_8250_CONSOLE=3Dy
>> =A0# CONFIG_LEGACY_PTYS is not set
>> =A0# CONFIG_HW_RANDOM is not set
>> =A0CONFIG_I2C=3Dy
>> -# CONFIG_HWMON is not set
>> +# CONFIG_I2C_COMPAT is not set
>> +# CONFIG_I2C_HELPER_AUTO is not set
>> +CONFIG_I2C_TEGRA=3Dy
>> +CONFIG_SENSORS_LM90=3Dy
>
> I'm not sure why the LM90 is needed?

LM90 =3D=3D adt7461 temp sensor, registered and used on seaboard.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
