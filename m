From: Steev Klimaszewski <threeway@gmail.com>
Subject: Re: [PATCH] drm/tegra: dpaux: Fix transfers larger than 4 bytes
Date: Mon, 20 Jul 2015 02:39:36 -0500
Message-ID: <CAOvMTZiuq=qesVD9PYuePz2zAKqh_m-1FbBZwBa6S4CLHv7mvw@mail.gmail.com>
References: <1437374978-1330-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0346525708=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1437374978-1330-1-git-send-email-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

--===============0346525708==
Content-Type: multipart/alternative; boundary=001a1140f6e8ae4889051b49a338

--001a1140f6e8ae4889051b49a338
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 20, 2015 at 1:49 AM, Thierry Reding <thierry.reding@gmail.com>
wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> The DPAUX read/write FIFO registers aren't sequential in the register
> space, causing transfers larger than 4 bytes to cause accesses to non-
> existing FIFO registers.
>
> Fixes: 6b6b604215c6 ("drm/tegra: Add eDP support")
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/dpaux.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
> index d6b55e3e3716..a43a836e6f88 100644
> --- a/drivers/gpu/drm/tegra/dpaux.c
> +++ b/drivers/gpu/drm/tegra/dpaux.c
> @@ -72,34 +72,32 @@ static inline void tegra_dpaux_writel(struct
> tegra_dpaux *dpaux,
>  static void tegra_dpaux_write_fifo(struct tegra_dpaux *dpaux, const u8
> *buffer,
>                                    size_t size)
>  {
> -       unsigned long offset = DPAUX_DP_AUXDATA_WRITE(0);
>         size_t i, j;
>
> -       for (i = 0; i < size; i += 4) {
> -               size_t num = min_t(size_t, size - i, 4);
> +       for (i = 0; i < DIV_ROUND_UP(size, 4); i++) {
> +               size_t num = min_t(size_t, size - i * 4, 4);
>                 unsigned long value = 0;
>
>                 for (j = 0; j < num; j++)
> -                       value |= buffer[i + j] << (j * 8);
> +                       value |= buffer[i * 4 + j] << (j * 8);
>
> -               tegra_dpaux_writel(dpaux, value, offset++);
> +               tegra_dpaux_writel(dpaux, value,
> DPAUX_DP_AUXDATA_WRITE(i));
>         }
>  }
>
>  static void tegra_dpaux_read_fifo(struct tegra_dpaux *dpaux, u8 *buffer,
>                                   size_t size)
>  {
> -       unsigned long offset = DPAUX_DP_AUXDATA_READ(0);
>         size_t i, j;
>
> -       for (i = 0; i < size; i += 4) {
> -               size_t num = min_t(size_t, size - i, 4);
> +       for (i = 0; i < DIV_ROUND_UP(size, 4); i++) {
> +               size_t num = min_t(size_t, size - i * 4, 4);
>                 unsigned long value;
>
> -               value = tegra_dpaux_readl(dpaux, offset++);
> +               value = tegra_dpaux_readl(dpaux, DPAUX_DP_AUXDATA_READ(i));
>
>                 for (j = 0; j < num; j++)
> -                       buffer[i + j] = value >> (j * 8);
> +                       buffer[i * 4 + j] = value >> (j * 8);
>         }
>  }
>
> --
> 2.4.5
>
>

This fixes the issue that I reported earlier, so feel free to add my

Tested-by: Steev Klimaszewski <steev@gentoo.org>

--001a1140f6e8ae4889051b49a338
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Jul 20, 2015 at 1:49 AM, Thierry Reding <span dir=3D"ltr">&lt;<=
a href=3D"mailto:thierry.reding@gmail.com" target=3D"_blank">thierry.reding=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Th=
ierry Reding &lt;<a href=3D"mailto:treding@nvidia.com">treding@nvidia.com</=
a>&gt;<br>
<br>
The DPAUX read/write FIFO registers aren&#39;t sequential in the register<b=
r>
space, causing transfers larger than 4 bytes to cause accesses to non-<br>
existing FIFO registers.<br>
<br>
Fixes: 6b6b604215c6 (&quot;drm/tegra: Add eDP support&quot;)<br>
Signed-off-by: Thierry Reding &lt;<a href=3D"mailto:treding@nvidia.com">tre=
ding@nvidia.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/tegra/dpaux.c | 18 ++++++++----------<br>
=C2=A01 file changed, 8 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c<=
br>
index d6b55e3e3716..a43a836e6f88 100644<br>
--- a/drivers/gpu/drm/tegra/dpaux.c<br>
+++ b/drivers/gpu/drm/tegra/dpaux.c<br>
@@ -72,34 +72,32 @@ static inline void tegra_dpaux_writel(struct tegra_dpau=
x *dpaux,<br>
=C2=A0static void tegra_dpaux_write_fifo(struct tegra_dpaux *dpaux, const u=
8 *buffer,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t size)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long offset =3D DPAUX_DP_AUXDATA_WRITE=
(0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t i, j;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; size; i +=3D 4) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t num =3D min_=
t(size_t, size - i, 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; DIV_ROUND_UP(size, 4); i++=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t num =3D min_=
t(size_t, size - i * 4, 4);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long value=
 =3D 0;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (j =3D 0; j &lt=
; num; j++)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0value |=3D buffer[i + j] &lt;&lt; (j * 8);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0value |=3D buffer[i * 4 + j] &lt;&lt; (j * 8);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tegra_dpaux_writel(=
dpaux, value, offset++);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tegra_dpaux_writel(=
dpaux, value, DPAUX_DP_AUXDATA_WRITE(i));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0}<br>
<br>
=C2=A0static void tegra_dpaux_read_fifo(struct tegra_dpaux *dpaux, u8 *buff=
er,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t size)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long offset =3D DPAUX_DP_AUXDATA_READ(=
0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t i, j;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; size; i +=3D 4) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t num =3D min_=
t(size_t, size - i, 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; DIV_ROUND_UP(size, 4); i++=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t num =3D min_=
t(size_t, size - i * 4, 4);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long value=
;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value =3D tegra_dpa=
ux_readl(dpaux, offset++);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value =3D tegra_dpa=
ux_readl(dpaux, DPAUX_DP_AUXDATA_READ(i));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (j =3D 0; j &lt=
; num; j++)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0buffer[i + j] =3D value &gt;&gt; (j * 8);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0buffer[i * 4 + j] =3D value &gt;&gt; (j * 8);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0}<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.4.5<br>
<br>
</font></span></blockquote></div><br></div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">This fixes the issue that I reported earlie=
r, so feel free to add my</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Tested-by: Steev Klimaszewski &lt;<a href=3D"mailto:ste=
ev@gentoo.org">steev@gentoo.org</a>&gt;</div></div>

--001a1140f6e8ae4889051b49a338--

--===============0346525708==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0346525708==--
