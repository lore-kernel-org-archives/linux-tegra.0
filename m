From: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
Subject: Re: [PATCH 5/5] ASoC: tegra: Remove unused DAPM route structure.
Date: Wed, 1 Feb 2012 08:47:35 +0200
Message-ID: <CALq1K=J+GroRmHuXunjW=629bwfCOkLTSFZB3i_nNVMHeY-iHg@mail.gmail.com>
References: <1327995137-27237-1-git-send-email-leon@leon.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1327995137-27237-1-git-send-email-leon-2ukJVAZIZ/Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 31, 2012 at 09:32, Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org> wrote:
> All DAPM routes are configured via device tree, and there is no need =
in
> DAPM route structures in board file.
>
> Signed-off-by: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
> ---
> =C2=A0sound/soc/tegra/tegra_alc5632.c | =C2=A0 16 ----------------
> =C2=A01 files changed, 0 insertions(+), 16 deletions(-)
>
> diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_=
alc5632.c
> index 1794139..c000f51 100644
> --- a/sound/soc/tegra/tegra_alc5632.c
> +++ b/sound/soc/tegra/tegra_alc5632.c
> @@ -104,20 +104,6 @@ static const struct snd_soc_dapm_widget tegra_al=
c5632_dapm_widgets[] =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0SND_SOC_DAPM_MIC("Headset Mic", NULL),
> =C2=A0};
>
> -static const struct snd_soc_dapm_route tegra_alc5632_audio_map[] =3D=
 {
> - =C2=A0 =C2=A0 =C2=A0 /* Internal Speaker */
> - =C2=A0 =C2=A0 =C2=A0 {"Int Spk", NULL, "SPKOUT"},
> - =C2=A0 =C2=A0 =C2=A0 {"Int Spk", NULL, "SPKOUTN"},
> -
> - =C2=A0 =C2=A0 =C2=A0 /* Headset Mic */
> - =C2=A0 =C2=A0 =C2=A0 {"MIC1", NULL, "MICBIAS1"},
> - =C2=A0 =C2=A0 =C2=A0 {"MICBIAS1", NULL, "Headset Mic"},
> -
> - =C2=A0 =C2=A0 =C2=A0 /* Headset Stereophone */
> - =C2=A0 =C2=A0 =C2=A0 {"Headset Stereophone", NULL, "HPR"},
> - =C2=A0 =C2=A0 =C2=A0 {"Headset Stereophone", NULL, "HPL"},
> -};
> -
> =C2=A0static const struct snd_kcontrol_new tegra_alc5632_controls[] =3D=
 {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0SOC_DAPM_PIN_SWITCH("Int Spk"),
> =C2=A0};
> @@ -172,8 +158,6 @@ static struct snd_soc_card snd_soc_tegra_alc5632 =
=3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.num_controls =3D ARRAY_SIZE(tegra_alc5632=
_controls),
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.dapm_widgets =3D tegra_alc5632_dapm_widge=
ts,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.num_dapm_widgets =3D ARRAY_SIZE(tegra_alc=
5632_dapm_widgets),
> - =C2=A0 =C2=A0 =C2=A0 .dapm_routes =3D tegra_alc5632_audio_map,
> - =C2=A0 =C2=A0 =C2=A0 .num_dapm_routes =3D ARRAY_SIZE(tegra_alc5632_=
audio_map),
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.fully_routed =3D true,
> =C2=A0};
>
> --
> 1.7.3.4
>

Please don't apply it. I will resend it.



--=20
Leon Romanovsky | Independent Linux Consultant
=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0www.leon.nu=C2=A0| leon-2ukJVAZIZ/Y@public.gmane.org
