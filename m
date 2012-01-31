From: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
Subject: Re: [PATCH 3/5] ASoC: Tegra+ALC5632 machine: Add device tree binding documentation
Date: Tue, 31 Jan 2012 13:51:43 +0200
Message-ID: <CALq1K=JbPspu2ShkfgcvQ_+cw6kxZNxe_zUdwrz3Sfn3YFv_rg@mail.gmail.com>
References: <1327995040-27152-1-git-send-email-leon@leon.nu> <20120131112706.GE18444@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120131112706.GE18444-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: lrg-l0cyMroinI0@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 31, 2012 at 13:27, Mark Brown
<broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
>
> On Tue, Jan 31, 2012 at 09:30:40AM +0200, Leon Romanovsky wrote:
> > Document device tree binding for the tegra board with ALC5632 codec
> > according to datasheet functional block description.
>
> If resending please send the documentation in the same patch as you a=
dd
> the binding (unless that patch is complex enough to need splitting).
>
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/tegra-audio-alc5632.t=
xt
> > @@ -0,0 +1,57 @@
> > +NVIDIA Tegra audio complex
>
> This should really be more detailed, mentioning the CODEC.
Can it be done in followup patch ? or do I need resend them all ?



--
Leon Romanovsky | Independent Linux Consultant
=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0www.leon.nu=C2=A0| leon-2ukJVAZIZ/Y@public.gmane.org
