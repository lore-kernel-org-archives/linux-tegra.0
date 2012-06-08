From: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 8/9] ASoC: tegra: add clk_prepare/clk_unprepare
Date: Fri, 8 Jun 2012 10:24:30 +0530
Message-ID: <1339131271.3800.12.camel@pgaikwad-dt2>
References: <1338870583-8704-1-git-send-email-pgaikwad@nvidia.com>
	 <1338870583-8704-9-git-send-email-pgaikwad@nvidia.com>
	 <CADTbHxr6+h23jBca+egnzuOCOaxRf_OkJsROz_qjrVS-=FZp5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CADTbHxr6+h23jBca+egnzuOCOaxRf_OkJsROz_qjrVS-=FZp5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pankaj Jangra <jangra.pankaj9-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "tiwai-l3A5Bk7waGM@public.gmane.org" <tiwai-l3A5Bk7waGM@public.gmane.org>, "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "perex-/Fr2/VpizcU@public.gmane.org" <perex-/Fr2/VpizcU@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Pankaj,

Thanks for pointing error. I will send another patch to fix the error
since this patch set is sent to multiple subsystems and I will have to
spam them for this fix.

Right now it won=E2=80=99t break anything since generic clock framework=
 for
Tegra is not enabled yet. I will make sure this gets fixed before that.

Thanks & Regards,
Prashant G

On Fri, 2012-06-08 at 10:13 +0530, Pankaj Jangra wrote:
> Hi Prashant,
>=20
> On Tue, Jun 5, 2012 at 9:59 AM, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org=
>
> wrote:
>         Use clk_prepare/clk_unprepare as required by the generic clk
>         framework.
>        =20
>         Signed-off-by: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>         ---
>         Please ignore previous versions. Updated commit message and
>         maintainers properly in this version. No other change.
>        =20
>         This patch should go through Tegra tree since other patches t=
o
>         port Tegra
>         to generic clock framework are dependent on it. Posting here
>         to get ack from
>         the maintainers.
>        =20
>          sound/soc/tegra/tegra20_i2s.c      |    4 ++--
>          sound/soc/tegra/tegra20_spdif.c    |    4 ++--
>          sound/soc/tegra/tegra30_ahub.c     |    8 ++++----
>          sound/soc/tegra/tegra30_i2s.c      |    4 ++--
>          sound/soc/tegra/tegra_asoc_utils.c |   12 ++++++------
>          5 files changed, 16 insertions(+), 16 deletions(-)
>        =20
>         diff --git a/sound/soc/tegra/tegra20_i2s.c
>         b/sound/soc/tegra/tegra20_i2s.c
>         index 0c7af63..1647dbf 100644
>         --- a/sound/soc/tegra/tegra20_i2s.c
>         +++ b/sound/soc/tegra/tegra20_i2s.c
>         @@ -62,7 +62,7 @@ static int
>         tegra20_i2s_runtime_suspend(struct device *dev)
>          {
>                struct tegra20_i2s *i2s =3D dev_get_drvdata(dev);
>        =20
>         -       clk_disable(i2s->clk_i2s);
>         +       clk_disable_unprepare(i2s->clk_i2s);
>        =20
>                return 0;
>          }
>         @@ -72,7 +72,7 @@ static int tegra20_i2s_runtime_resume(struc=
t
>         device *dev)
>                struct tegra20_i2s *i2s =3D dev_get_drvdata(dev);
>                int ret;
>        =20
>         -       ret =3D clk_enable(i2s->clk_i2s);
>         +       ret =3D clk_prepare_enable(i2s->clk_i2s);
>                if (ret) {
>                        dev_err(dev, "clk_enable failed: %d\n", ret);
>                        return ret;
>         diff --git a/sound/soc/tegra/tegra20_spdif.c
>         b/sound/soc/tegra/tegra20_spdif.c
>         index f9b5741..2262e4f 100644
>         --- a/sound/soc/tegra/tegra20_spdif.c
>         +++ b/sound/soc/tegra/tegra20_spdif.c
>         @@ -54,7 +54,7 @@ static int
>         tegra20_spdif_runtime_suspend(struct device *dev)
>          {
>                struct tegra20_spdif *spdif =3D dev_get_drvdata(dev);
>        =20
>         -       clk_disable(spdif->clk_spdif_out);
>         +       clk_disable_unprepare(spdif->clk_spdif_out);
>        =20
>                return 0;
>          }
>         @@ -64,7 +64,7 @@ static int
>         tegra20_spdif_runtime_resume(struct device *dev)
>                struct tegra20_spdif *spdif =3D dev_get_drvdata(dev);
>                int ret;
>        =20
>         -       ret =3D clk_enable(spdif->clk_spdif_out);
>         +       ret =3D clk_prepare_enable(spdif->clk_spdif_out);
>                if (ret) {
>                        dev_err(dev, "clk_enable failed: %d\n", ret);
>                        return ret;
>         diff --git a/sound/soc/tegra/tegra30_ahub.c
>         b/sound/soc/tegra/tegra30_ahub.c
>         index 57cd419..1efb822 100644
>         --- a/sound/soc/tegra/tegra30_ahub.c
>         +++ b/sound/soc/tegra/tegra30_ahub.c
>         @@ -56,8 +56,8 @@ static int
>         tegra30_ahub_runtime_suspend(struct device *dev)
>                regcache_cache_only(ahub->regmap_apbif, true);
>                regcache_cache_only(ahub->regmap_ahub, true);
>        =20
>         -       clk_disable(ahub->clk_apbif);
>         -       clk_disable(ahub->clk_d_audio);
>         +       clk_disable_unprepare(ahub->clk_apbif);
>         +       clk_disable_unprepare(ahub->clk_d_audio);
>        =20
>                return 0;
>          }
>         @@ -77,12 +77,12 @@ static int
>         tegra30_ahub_runtime_resume(struct device *dev)
>          {
>                int ret;
>        =20
>         -       ret =3D clk_enable(ahub->clk_d_audio);
>         +       ret =3D clk_prepare_enable(ahub->clk_d_audio);
>                if (ret) {
>                        dev_err(dev, "clk_enable d_audio failed: %d\n"=
,
>         ret);
>                        return ret;
>                }
>         -       ret =3D clk_enable(ahub->clk_apbif);
>         +       ret =3D clk_prepare_enable(ahub->clk_apbif);
>                if (ret) {
>                        dev_err(dev, "clk_enable apbif failed: %d\n",
>         ret);
>                        clk_disable(ahub->clk_d_audio);
> =20
> Don't you need to make change here to "clk_disable_unprepare" ??
> =20
>         diff --git a/sound/soc/tegra/tegra30_i2s.c
>         b/sound/soc/tegra/tegra30_i2s.c
>         index 8596032..d308faa 100644
>         --- a/sound/soc/tegra/tegra30_i2s.c
>         +++ b/sound/soc/tegra/tegra30_i2s.c
>         @@ -62,7 +62,7 @@ static int
>         tegra30_i2s_runtime_suspend(struct device *dev)
>        =20
>                regcache_cache_only(i2s->regmap, true);
>        =20
>         -       clk_disable(i2s->clk_i2s);
>         +       clk_disable_unprepare(i2s->clk_i2s);
>        =20
>                return 0;
>          }
>         @@ -72,7 +72,7 @@ static int tegra30_i2s_runtime_resume(struc=
t
>         device *dev)
>                struct tegra30_i2s *i2s =3D dev_get_drvdata(dev);
>                int ret;
>        =20
>         -       ret =3D clk_enable(i2s->clk_i2s);
>         +       ret =3D clk_prepare_enable(i2s->clk_i2s);
>                if (ret) {
>                        dev_err(dev, "clk_enable failed: %d\n", ret);
>                        return ret;
>         diff --git a/sound/soc/tegra/tegra_asoc_utils.c
>         b/sound/soc/tegra/tegra_asoc_utils.c
>         index 9515ce5..6872c77 100644
>         --- a/sound/soc/tegra/tegra_asoc_utils.c
>         +++ b/sound/soc/tegra/tegra_asoc_utils.c
>         @@ -69,9 +69,9 @@ int tegra_asoc_utils_set_rate(struct
>         tegra_asoc_utils_data *data, int srate,
>                data->set_baseclock =3D 0;
>                data->set_mclk =3D 0;
>        =20
>         -       clk_disable(data->clk_cdev1);
>         -       clk_disable(data->clk_pll_a_out0);
>         -       clk_disable(data->clk_pll_a);
>         +       clk_disable_unprepare(data->clk_cdev1);
>         +       clk_disable_unprepare(data->clk_pll_a_out0);
>         +       clk_disable_unprepare(data->clk_pll_a);
>        =20
>                err =3D clk_set_rate(data->clk_pll_a, new_baseclock);
>                if (err) {
>         @@ -87,19 +87,19 @@ int tegra_asoc_utils_set_rate(struct
>         tegra_asoc_utils_data *data, int srate,
>        =20
>                /* Don't set cdev1/extern1 rate; it's locked to
>         pll_a_out0 */
>        =20
>         -       err =3D clk_enable(data->clk_pll_a);
>         +       err =3D clk_prepare_enable(data->clk_pll_a);
>                if (err) {
>                        dev_err(data->dev, "Can't enable pll_a: %d\n",
>         err);
>                        return err;
>                }
>        =20
>         -       err =3D clk_enable(data->clk_pll_a_out0);
>         +       err =3D clk_prepare_enable(data->clk_pll_a_out0);
>                if (err) {
>                        dev_err(data->dev, "Can't enable pll_a_out0: %=
d
>         \n", err);
>                        return err;
>                }
>        =20
>         -       err =3D clk_enable(data->clk_cdev1);
>         +       err =3D clk_prepare_enable(data->clk_cdev1);
>                if (err) {
>                        dev_err(data->dev, "Can't enable cdev1: %d\n",
>         err);
>                        return err;
>         --
>         1.7.4.1
>        =20
>        =20
>         _______________________________________________
>         linux-arm-kernel mailing list
>         linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>         http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>=20
