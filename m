From: Pankaj Jangra <jangra.pankaj9@gmail.com>
Subject: Re: [PATCH v3 8/9] ASoC: tegra: add clk_prepare/clk_unprepare
Date: Fri, 8 Jun 2012 10:13:42 +0530
Message-ID: <CADTbHxr6+h23jBca+egnzuOCOaxRf_OkJsROz_qjrVS-=FZp5A@mail.gmail.com>
References: <1338870583-8704-1-git-send-email-pgaikwad@nvidia.com>
 <1338870583-8704-9-git-send-email-pgaikwad@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5147793129930025689=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1338870583-8704-9-git-send-email-pgaikwad@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: alsa-devel@alsa-project.org, linux@arm.linux.org.uk, swarren@wwwdotorg.org, tiwai@suse.de, broonie@opensource.wolfsonmicro.com, perex@perex.cz, olof@lixom.net, ccross@android.com, linux-tegra@vger.kernel.org, lrg@ti.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

--===============5147793129930025689==
Content-Type: multipart/alternative; boundary=20cf30207cd015000604c1eea5e5

--20cf30207cd015000604c1eea5e5
Content-Type: text/plain; charset=ISO-8859-1

Hi Prashant,

On Tue, Jun 5, 2012 at 9:59 AM, Prashant Gaikwad <pgaikwad@nvidia.com>wrote:

> Use clk_prepare/clk_unprepare as required by the generic clk framework.
>
> Signed-off-by: Prashant Gaikwad <pgaikwad@nvidia.com>
> ---
> Please ignore previous versions. Updated commit message and
> maintainers properly in this version. No other change.
>
> This patch should go through Tegra tree since other patches to port Tegra
> to generic clock framework are dependent on it. Posting here to get ack
> from
> the maintainers.
>
>  sound/soc/tegra/tegra20_i2s.c      |    4 ++--
>  sound/soc/tegra/tegra20_spdif.c    |    4 ++--
>  sound/soc/tegra/tegra30_ahub.c     |    8 ++++----
>  sound/soc/tegra/tegra30_i2s.c      |    4 ++--
>  sound/soc/tegra/tegra_asoc_utils.c |   12 ++++++------
>  5 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
> index 0c7af63..1647dbf 100644
> --- a/sound/soc/tegra/tegra20_i2s.c
> +++ b/sound/soc/tegra/tegra20_i2s.c
> @@ -62,7 +62,7 @@ static int tegra20_i2s_runtime_suspend(struct device
> *dev)
>  {
>        struct tegra20_i2s *i2s = dev_get_drvdata(dev);
>
> -       clk_disable(i2s->clk_i2s);
> +       clk_disable_unprepare(i2s->clk_i2s);
>
>        return 0;
>  }
> @@ -72,7 +72,7 @@ static int tegra20_i2s_runtime_resume(struct device *dev)
>        struct tegra20_i2s *i2s = dev_get_drvdata(dev);
>        int ret;
>
> -       ret = clk_enable(i2s->clk_i2s);
> +       ret = clk_prepare_enable(i2s->clk_i2s);
>        if (ret) {
>                dev_err(dev, "clk_enable failed: %d\n", ret);
>                return ret;
> diff --git a/sound/soc/tegra/tegra20_spdif.c
> b/sound/soc/tegra/tegra20_spdif.c
> index f9b5741..2262e4f 100644
> --- a/sound/soc/tegra/tegra20_spdif.c
> +++ b/sound/soc/tegra/tegra20_spdif.c
> @@ -54,7 +54,7 @@ static int tegra20_spdif_runtime_suspend(struct device
> *dev)
>  {
>        struct tegra20_spdif *spdif = dev_get_drvdata(dev);
>
> -       clk_disable(spdif->clk_spdif_out);
> +       clk_disable_unprepare(spdif->clk_spdif_out);
>
>        return 0;
>  }
> @@ -64,7 +64,7 @@ static int tegra20_spdif_runtime_resume(struct device
> *dev)
>        struct tegra20_spdif *spdif = dev_get_drvdata(dev);
>        int ret;
>
> -       ret = clk_enable(spdif->clk_spdif_out);
> +       ret = clk_prepare_enable(spdif->clk_spdif_out);
>        if (ret) {
>                dev_err(dev, "clk_enable failed: %d\n", ret);
>                return ret;
> diff --git a/sound/soc/tegra/tegra30_ahub.c
> b/sound/soc/tegra/tegra30_ahub.c
> index 57cd419..1efb822 100644
> --- a/sound/soc/tegra/tegra30_ahub.c
> +++ b/sound/soc/tegra/tegra30_ahub.c
> @@ -56,8 +56,8 @@ static int tegra30_ahub_runtime_suspend(struct device
> *dev)
>        regcache_cache_only(ahub->regmap_apbif, true);
>        regcache_cache_only(ahub->regmap_ahub, true);
>
> -       clk_disable(ahub->clk_apbif);
> -       clk_disable(ahub->clk_d_audio);
> +       clk_disable_unprepare(ahub->clk_apbif);
> +       clk_disable_unprepare(ahub->clk_d_audio);
>
>        return 0;
>  }
> @@ -77,12 +77,12 @@ static int tegra30_ahub_runtime_resume(struct device
> *dev)
>  {
>        int ret;
>
> -       ret = clk_enable(ahub->clk_d_audio);
> +       ret = clk_prepare_enable(ahub->clk_d_audio);
>        if (ret) {
>                dev_err(dev, "clk_enable d_audio failed: %d\n", ret);
>                return ret;
>        }
> -       ret = clk_enable(ahub->clk_apbif);
> +       ret = clk_prepare_enable(ahub->clk_apbif);
>        if (ret) {
>                dev_err(dev, "clk_enable apbif failed: %d\n", ret);
>                clk_disable(ahub->clk_d_audio);
>

Don't you need to make change here to "clk_disable_unprepare" ??


> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index 8596032..d308faa 100644
> --- a/sound/soc/tegra/tegra30_i2s.c
> +++ b/sound/soc/tegra/tegra30_i2s.c
> @@ -62,7 +62,7 @@ static int tegra30_i2s_runtime_suspend(struct device
> *dev)
>
>        regcache_cache_only(i2s->regmap, true);
>
> -       clk_disable(i2s->clk_i2s);
> +       clk_disable_unprepare(i2s->clk_i2s);
>
>        return 0;
>  }
> @@ -72,7 +72,7 @@ static int tegra30_i2s_runtime_resume(struct device *dev)
>        struct tegra30_i2s *i2s = dev_get_drvdata(dev);
>        int ret;
>
> -       ret = clk_enable(i2s->clk_i2s);
> +       ret = clk_prepare_enable(i2s->clk_i2s);
>        if (ret) {
>                dev_err(dev, "clk_enable failed: %d\n", ret);
>                return ret;
> diff --git a/sound/soc/tegra/tegra_asoc_utils.c
> b/sound/soc/tegra/tegra_asoc_utils.c
> index 9515ce5..6872c77 100644
> --- a/sound/soc/tegra/tegra_asoc_utils.c
> +++ b/sound/soc/tegra/tegra_asoc_utils.c
> @@ -69,9 +69,9 @@ int tegra_asoc_utils_set_rate(struct
> tegra_asoc_utils_data *data, int srate,
>        data->set_baseclock = 0;
>        data->set_mclk = 0;
>
> -       clk_disable(data->clk_cdev1);
> -       clk_disable(data->clk_pll_a_out0);
> -       clk_disable(data->clk_pll_a);
> +       clk_disable_unprepare(data->clk_cdev1);
> +       clk_disable_unprepare(data->clk_pll_a_out0);
> +       clk_disable_unprepare(data->clk_pll_a);
>
>        err = clk_set_rate(data->clk_pll_a, new_baseclock);
>        if (err) {
> @@ -87,19 +87,19 @@ int tegra_asoc_utils_set_rate(struct
> tegra_asoc_utils_data *data, int srate,
>
>        /* Don't set cdev1/extern1 rate; it's locked to pll_a_out0 */
>
> -       err = clk_enable(data->clk_pll_a);
> +       err = clk_prepare_enable(data->clk_pll_a);
>        if (err) {
>                dev_err(data->dev, "Can't enable pll_a: %d\n", err);
>                return err;
>        }
>
> -       err = clk_enable(data->clk_pll_a_out0);
> +       err = clk_prepare_enable(data->clk_pll_a_out0);
>        if (err) {
>                dev_err(data->dev, "Can't enable pll_a_out0: %d\n", err);
>                return err;
>        }
>
> -       err = clk_enable(data->clk_cdev1);
> +       err = clk_prepare_enable(data->clk_cdev1);
>        if (err) {
>                dev_err(data->dev, "Can't enable cdev1: %d\n", err);
>                return err;
> --
> 1.7.4.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

--20cf30207cd015000604c1eea5e5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Prashant,<br><br><div class=3D"gmail_quote">On Tue, Jun 5, 2012 at 9:59 =
AM, Prashant Gaikwad <span dir=3D"ltr">&lt;<a href=3D"mailto:pgaikwad@nvidi=
a.com" target=3D"_blank">pgaikwad@nvidia.com</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">
Use clk_prepare/clk_unprepare as required by the generic clk framework.<br>
<br>
Signed-off-by: Prashant Gaikwad &lt;<a href=3D"mailto:pgaikwad@nvidia.com">=
pgaikwad@nvidia.com</a>&gt;<br>
---<br>
Please ignore previous versions. Updated commit message and<br>
maintainers properly in this version. No other change.<br>
<br>
This patch should go through Tegra tree since other patches to port Tegra<b=
r>
to generic clock framework are dependent on it. Posting here to get ack fro=
m<br>
the maintainers.<br>
<br>
=A0sound/soc/tegra/tegra20_i2s.c =A0 =A0 =A0| =A0 =A04 ++--<br>
=A0sound/soc/tegra/tegra20_spdif.c =A0 =A0| =A0 =A04 ++--<br>
=A0sound/soc/tegra/tegra30_ahub.c =A0 =A0 | =A0 =A08 ++++----<br>
=A0sound/soc/tegra/tegra30_i2s.c =A0 =A0 =A0| =A0 =A04 ++--<br>
=A0sound/soc/tegra/tegra_asoc_utils.c | =A0 12 ++++++------<br>
=A05 files changed, 16 insertions(+), 16 deletions(-)<br>
<br>
diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c<=
br>
index 0c7af63..1647dbf 100644<br>
--- a/sound/soc/tegra/tegra20_i2s.c<br>
+++ b/sound/soc/tegra/tegra20_i2s.c<br>
@@ -62,7 +62,7 @@ static int tegra20_i2s_runtime_suspend(struct device *dev=
)<br>
=A0{<br>
 =A0 =A0 =A0 =A0struct tegra20_i2s *i2s =3D dev_get_drvdata(dev);<br>
<br>
- =A0 =A0 =A0 clk_disable(i2s-&gt;clk_i2s);<br>
+ =A0 =A0 =A0 clk_disable_unprepare(i2s-&gt;clk_i2s);<br>
<br>
 =A0 =A0 =A0 =A0return 0;<br>
=A0}<br>
@@ -72,7 +72,7 @@ static int tegra20_i2s_runtime_resume(struct device *dev)=
<br>
 =A0 =A0 =A0 =A0struct tegra20_i2s *i2s =3D dev_get_drvdata(dev);<br>
 =A0 =A0 =A0 =A0int ret;<br>
<br>
- =A0 =A0 =A0 ret =3D clk_enable(i2s-&gt;clk_i2s);<br>
+ =A0 =A0 =A0 ret =3D clk_prepare_enable(i2s-&gt;clk_i2s);<br>
 =A0 =A0 =A0 =A0if (ret) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(dev, &quot;clk_enable failed: %d\n&=
quot;, ret);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret;<br>
diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdi=
f.c<br>
index f9b5741..2262e4f 100644<br>
--- a/sound/soc/tegra/tegra20_spdif.c<br>
+++ b/sound/soc/tegra/tegra20_spdif.c<br>
@@ -54,7 +54,7 @@ static int tegra20_spdif_runtime_suspend(struct device *d=
ev)<br>
=A0{<br>
 =A0 =A0 =A0 =A0struct tegra20_spdif *spdif =3D dev_get_drvdata(dev);<br>
<br>
- =A0 =A0 =A0 clk_disable(spdif-&gt;clk_spdif_out);<br>
+ =A0 =A0 =A0 clk_disable_unprepare(spdif-&gt;clk_spdif_out);<br>
<br>
 =A0 =A0 =A0 =A0return 0;<br>
=A0}<br>
@@ -64,7 +64,7 @@ static int tegra20_spdif_runtime_resume(struct device *de=
v)<br>
 =A0 =A0 =A0 =A0struct tegra20_spdif *spdif =3D dev_get_drvdata(dev);<br>
 =A0 =A0 =A0 =A0int ret;<br>
<br>
- =A0 =A0 =A0 ret =3D clk_enable(spdif-&gt;clk_spdif_out);<br>
+ =A0 =A0 =A0 ret =3D clk_prepare_enable(spdif-&gt;clk_spdif_out);<br>
 =A0 =A0 =A0 =A0if (ret) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(dev, &quot;clk_enable failed: %d\n&=
quot;, ret);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret;<br>
diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.=
c<br>
index 57cd419..1efb822 100644<br>
--- a/sound/soc/tegra/tegra30_ahub.c<br>
+++ b/sound/soc/tegra/tegra30_ahub.c<br>
@@ -56,8 +56,8 @@ static int tegra30_ahub_runtime_suspend(struct device *de=
v)<br>
 =A0 =A0 =A0 =A0regcache_cache_only(ahub-&gt;regmap_apbif, true);<br>
 =A0 =A0 =A0 =A0regcache_cache_only(ahub-&gt;regmap_ahub, true);<br>
<br>
- =A0 =A0 =A0 clk_disable(ahub-&gt;clk_apbif);<br>
- =A0 =A0 =A0 clk_disable(ahub-&gt;clk_d_audio);<br>
+ =A0 =A0 =A0 clk_disable_unprepare(ahub-&gt;clk_apbif);<br>
+ =A0 =A0 =A0 clk_disable_unprepare(ahub-&gt;clk_d_audio);<br>
<br>
 =A0 =A0 =A0 =A0return 0;<br>
=A0}<br>
@@ -77,12 +77,12 @@ static int tegra30_ahub_runtime_resume(struct device *d=
ev)<br>
=A0{<br>
 =A0 =A0 =A0 =A0int ret;<br>
<br>
- =A0 =A0 =A0 ret =3D clk_enable(ahub-&gt;clk_d_audio);<br>
+ =A0 =A0 =A0 ret =3D clk_prepare_enable(ahub-&gt;clk_d_audio);<br>
 =A0 =A0 =A0 =A0if (ret) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(dev, &quot;clk_enable d_audio faile=
d: %d\n&quot;, ret);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret;<br>
 =A0 =A0 =A0 =A0}<br>
- =A0 =A0 =A0 ret =3D clk_enable(ahub-&gt;clk_apbif);<br>
+ =A0 =A0 =A0 ret =3D clk_prepare_enable(ahub-&gt;clk_apbif);<br>
 =A0 =A0 =A0 =A0if (ret) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(dev, &quot;clk_enable apbif failed:=
 %d\n&quot;, ret);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0clk_disable(ahub-&gt;clk_d_audio);<br></blo=
ckquote><div>=A0</div><div>Don&#39;t you need to make change here to &quot;=
clk_disable_unprepare&quot; ??</div><div>=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c<=
br>
index 8596032..d308faa 100644<br>
--- a/sound/soc/tegra/tegra30_i2s.c<br>
+++ b/sound/soc/tegra/tegra30_i2s.c<br>
@@ -62,7 +62,7 @@ static int tegra30_i2s_runtime_suspend(struct device *dev=
)<br>
<br>
 =A0 =A0 =A0 =A0regcache_cache_only(i2s-&gt;regmap, true);<br>
<br>
- =A0 =A0 =A0 clk_disable(i2s-&gt;clk_i2s);<br>
+ =A0 =A0 =A0 clk_disable_unprepare(i2s-&gt;clk_i2s);<br>
<br>
 =A0 =A0 =A0 =A0return 0;<br>
=A0}<br>
@@ -72,7 +72,7 @@ static int tegra30_i2s_runtime_resume(struct device *dev)=
<br>
 =A0 =A0 =A0 =A0struct tegra30_i2s *i2s =3D dev_get_drvdata(dev);<br>
 =A0 =A0 =A0 =A0int ret;<br>
<br>
- =A0 =A0 =A0 ret =3D clk_enable(i2s-&gt;clk_i2s);<br>
+ =A0 =A0 =A0 ret =3D clk_prepare_enable(i2s-&gt;clk_i2s);<br>
 =A0 =A0 =A0 =A0if (ret) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(dev, &quot;clk_enable failed: %d\n&=
quot;, ret);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret;<br>
diff --git a/sound/soc/tegra/tegra_asoc_utils.c b/sound/soc/tegra/tegra_aso=
c_utils.c<br>
index 9515ce5..6872c77 100644<br>
--- a/sound/soc/tegra/tegra_asoc_utils.c<br>
+++ b/sound/soc/tegra/tegra_asoc_utils.c<br>
@@ -69,9 +69,9 @@ int tegra_asoc_utils_set_rate(struct tegra_asoc_utils_dat=
a *data, int srate,<br>
 =A0 =A0 =A0 =A0data-&gt;set_baseclock =3D 0;<br>
 =A0 =A0 =A0 =A0data-&gt;set_mclk =3D 0;<br>
<br>
- =A0 =A0 =A0 clk_disable(data-&gt;clk_cdev1);<br>
- =A0 =A0 =A0 clk_disable(data-&gt;clk_pll_a_out0);<br>
- =A0 =A0 =A0 clk_disable(data-&gt;clk_pll_a);<br>
+ =A0 =A0 =A0 clk_disable_unprepare(data-&gt;clk_cdev1);<br>
+ =A0 =A0 =A0 clk_disable_unprepare(data-&gt;clk_pll_a_out0);<br>
+ =A0 =A0 =A0 clk_disable_unprepare(data-&gt;clk_pll_a);<br>
<br>
 =A0 =A0 =A0 =A0err =3D clk_set_rate(data-&gt;clk_pll_a, new_baseclock);<br=
>
 =A0 =A0 =A0 =A0if (err) {<br>
@@ -87,19 +87,19 @@ int tegra_asoc_utils_set_rate(struct tegra_asoc_utils_d=
ata *data, int srate,<br>
<br>
 =A0 =A0 =A0 =A0/* Don&#39;t set cdev1/extern1 rate; it&#39;s locked to pll=
_a_out0 */<br>
<br>
- =A0 =A0 =A0 err =3D clk_enable(data-&gt;clk_pll_a);<br>
+ =A0 =A0 =A0 err =3D clk_prepare_enable(data-&gt;clk_pll_a);<br>
 =A0 =A0 =A0 =A0if (err) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(data-&gt;dev, &quot;Can&#39;t enabl=
e pll_a: %d\n&quot;, err);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return err;<br>
 =A0 =A0 =A0 =A0}<br>
<br>
- =A0 =A0 =A0 err =3D clk_enable(data-&gt;clk_pll_a_out0);<br>
+ =A0 =A0 =A0 err =3D clk_prepare_enable(data-&gt;clk_pll_a_out0);<br>
 =A0 =A0 =A0 =A0if (err) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(data-&gt;dev, &quot;Can&#39;t enabl=
e pll_a_out0: %d\n&quot;, err);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return err;<br>
 =A0 =A0 =A0 =A0}<br>
<br>
- =A0 =A0 =A0 err =3D clk_enable(data-&gt;clk_cdev1);<br>
+ =A0 =A0 =A0 err =3D clk_prepare_enable(data-&gt;clk_cdev1);<br>
 =A0 =A0 =A0 =A0if (err) {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(data-&gt;dev, &quot;Can&#39;t enabl=
e cdev1: %d\n&quot;, err);<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return err;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.4.1<br>
<br>
<br>
_______________________________________________<br>
linux-arm-kernel mailing list<br>
<a href=3D"mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kernel@li=
sts.infradead.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kernel" ta=
rget=3D"_blank">http://lists.infradead.org/mailman/listinfo/linux-arm-kerne=
l</a><br>
</font></span></blockquote></div><br>

--20cf30207cd015000604c1eea5e5--


--===============5147793129930025689==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5147793129930025689==--
