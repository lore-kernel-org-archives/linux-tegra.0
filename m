From: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: Tegra: Add support of tegra boards
 basedon ALC5632 codec
Date: Sun, 27 Nov 2011 10:37:43 +0200
Message-ID: <CALq1K=L0BsMixa0DoPiA49th_aF0UiuxjZ8_MwjiNR4x5UJTqg@mail.gmail.com>
References: <1321906088-29964-1-git-send-email-leon@leon.nu>
 <2859567.Mz2G74lSW9@fb07-iapwap2> <CALq1K=Ka0JYut22FwovAyAcZSbqcQssjUPrk6rUU0Fq2iOZG_g@mail.gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF174F08C6FF@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF174F08C6FF-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 23, 2011 at 19:37, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrot=
e:
> Leon Romanovsky wrote at Wednesday, November 23, 2011 1:05 AM:
>> Marc Dietrich wrote:
>> > I still don't see how the hp gpio detect comes in. Can you explain=
 this?
>>
>> The detection itself is done via soc-jack interface.
>
> I think Marc wanted to know how the driver knows which GPIO to use, a=
nd
> where it sets up use of that GPIO. The Tegra+WM8903 machine driver do=
es
> the following, which I think is missing from this driver:
I removed it from our code before patch, because it didn't work as
expected. There is no reason to push the non-working parts.
Our main reason of this merge is to receive guidance from community on
"correct" way of implementing.

>
> tegra_wm8903_hp_jack_gpio.gpio =3D pdata->gpio_hp_det;
>
> (I hope to review your patch myself later today)
>
> --
> nvpublic
>
>



--=20
Leon Romanovsky | Independent Linux Consultant
=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0www.leon.nu=C2=A0| leon-2ukJVAZIZ/Y@public.gmane.org
