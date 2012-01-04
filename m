From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 4/9] arm/tegra: fuse: add functions to access chip revision
Date: Tue, 3 Jan 2012 19:46:17 -0800
Message-ID: <CAOesGMiyG63w5WH7m9ig8rp0p0Ug_D5kcoRLS76SxCTOHjQ=tg@mail.gmail.com>
References: <1324599468-12845-1-git-send-email-olof@lixom.net>
	<1324599468-12845-5-git-send-email-olof@lixom.net>
	<20111223104751.GA22157@rhein.zuhause.netz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111223104751.GA22157-RGm7CqJPa6S97g7+dlk11ZJjESxClBkh@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Henning Heinold <heinold-cPcqOTmdTlv31zTM6d8ziw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Fri, Dec 23, 2011 at 2:47 AM, Henning Heinold
<heinold-cPcqOTmdTlv31zTM6d8ziw@public.gmane.org> wrote:
> On Thu, Dec 22, 2011 at 04:17:43PM -0800, Olof Johansson wrote:
>> +static const char *tegra_revision_name[TEGRA_REVISION_MAX] =3D {
>> + =A0 =A0 [TEGRA_REVISION_UNKNOWN] =3D "unknown",
>> + =A0 =A0 [TEGRA_REVISION_A02] =A0 =A0 =3D "A02",
>> + =A0 =A0 [TEGRA_REVISION_A03] =A0 =A0 =3D "A03",
>> + =A0 =A0 [TEGRA_REVISION_A03p] =A0 =A0=3D "A03 prime",
>> + =A0 =A0 [TEGRA_REVISION_A04] =A0 =A0 =3D "A04",
>> +};
>> +
>
> Hi Olof,
>
> can you please add here [TEGRA_REVISION_A01] =3D "A01", too. It is us=
ed in the nvidia git tree and affects the new beta xorg
> driver.


How does it affect the xorg driver? Do you have hardware that is based
on A01? I wouldn't expect there to be any products out there with it
-- A01 has a handful of errata that is not handled in mainline, etc.


-Olof
