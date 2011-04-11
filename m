From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [alsa-devel] Tegra ASoC, multiple boards, platform data, and
 conditionals in machine driver
Date: Mon, 11 Apr 2011 10:57:06 -0700
Message-ID: <BANLkTike2LTyOb354-QVq9FieMmHs66TvQ@mail.gmail.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF0493EB3A50@HQMAIL01.nvidia.com>
	<20110409023057.GA3792@opensource.wolfsonmicro.com>
	<74CDBE0F657A3D45AFBB94109FB122FF0493EB3B5B@HQMAIL01.nvidia.com>
	<BANLkTikQhe1+ufvZWFKU1DT+XCS9=xE0Xw@mail.gmail.com>
	<20110411015809.GA23214@sirena.org.uk>
	<74CDBE0F657A3D45AFBB94109FB122FF0493EB3B8D@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF0493EB3B8D-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "Erik Gilling (konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org)" <konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "Colin Cross (ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org)" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Mon, Apr 11, 2011 at 8:27 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:

> Perhaps the best approach is to:
>
> * Keep a single machine driver (at least for Tegra+WM8903; as Mark no=
ted,
> =A0attempting to share any wider doesn't make sense)
>
> * Rename the driver e.g. tegra_wm8903.c rather than harmony.c since i=
t'll
> =A0be more generic. Rename the platform data structure and header lik=
ewise.
>
> * Expand the platform data structure used by that driver to add anyth=
ing
> =A0necessary for Seaboard and derivatives.
>
> * Expand the driver to handle optional/missing GPIO definitions in th=
e
> =A0platform data (i.e. Harmony/Ventana will fill in int/ext_mic_en, a=
nd
> =A0other boards will set it to -1. Only Kaen will fill in hp_mute GPI=
O,
> =A0etc.)
>
> That way, we can still avoid a proliferation in the number of platfor=
m
> headers, platform data types, and ASoC machine drivers.
>
> Does that sound like a plan?

Sounds good to me.


-Olof
