From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v6 03/10] arm/tegra: prepare clock code for multiple tegra
 variants
Date: Thu, 8 Dec 2011 10:25:53 -0800
Message-ID: <CAMbhsRT97Oq-=8f9++f6Jgg=YVaimKSz68xcDDNbDbvL+V5fJg@mail.gmail.com>
References: <1323348254-29072-1-git-send-email-pdeschrijver@nvidia.com>
 <1323348254-29072-4-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6851184201308245187=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1323348254-29072-4-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--===============6851184201308245187==
Content-Type: multipart/alternative; boundary=14dae93409917bc54704b398cc7c

--14dae93409917bc54704b398cc7c
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Dec 8, 2011 at 4:43 AM, Peter De Schrijver
<pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>wrote:

> Rework the tegra20 clock code to support multiple tegra variants :
>
>  * remove tegra2_periph_reset_assert/tegra2_periph_reset_deassert. This
>   functionality should be in clock.c.
>  * compile tegra_sdmmc_tap_delay only on tegra20 as this feature will not
>   be available in future variants.
>  * don't export clk_measure_input_freq as its functionality is also
> available
>   using clk_get_rate().
>
> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/mach-tegra/clock.c         |   12 +++++++-----
>  arch/arm/mach-tegra/clock.h         |    8 ++++----
>  arch/arm/mach-tegra/tegra2_clocks.c |   14 +-------------
>  arch/arm/mach-tegra/timer.c         |   12 ++++++++----
>  4 files changed, 20 insertions(+), 26 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/clock.c b/arch/arm/mach-tegra/clock.c
> index f8d41ff..f27bdcc 100644
> --- a/arch/arm/mach-tegra/clock.c
> +++ b/arch/arm/mach-tegra/clock.c
> @@ -387,13 +387,15 @@ EXPORT_SYMBOL(tegra_clk_init_from_table);
>
>  void tegra_periph_reset_deassert(struct clk *c)
>  {
> -       tegra2_periph_reset_deassert(c);
> +       BUG_ON(!c->ops->reset);
>
+       c->ops->reset(c, false);
>  }
>  EXPORT_SYMBOL(tegra_periph_reset_deassert);
>
>  void tegra_periph_reset_assert(struct clk *c)
>  {
> -       tegra2_periph_reset_assert(c);
> +       BUG_ON(!c->ops->reset);
> +       c->ops->reset(c, true);
>  }
>  EXPORT_SYMBOL(tegra_periph_reset_assert);
>
> @@ -403,9 +405,9 @@ void __init tegra_init_clock(void)
>  }
>
>  /*
> - * The SDMMC controllers have extra bits in the clock source register that
> - * adjust the delay between the clock and data to compenstate for delays
> - * on the PCB.
> + * The SDMMC controllers on tegra20 have extra bits in the clock source
> + * register that adjust the delay between the clock and data to
> compenstate
> + * for delays on the PCB.
>  */
>  void tegra_sdmmc_tap_delay(struct clk *c, int delay)
>  {
>

I created this wrapper around tegra2_sdmmc_tap_delay because I guessed the
same requirement would be present in tegra3.  If you don't expect this to
be required on anything but tegra2, you could drop the wrapper and just
have callers use tegra2_sdmmc_tap_delay.


> diff --git a/arch/arm/mach-tegra/clock.h b/arch/arm/mach-tegra/clock.h
> index 688316a..135bb5f 100644
> --- a/arch/arm/mach-tegra/clock.h
> +++ b/arch/arm/mach-tegra/clock.h
> @@ -146,15 +146,15 @@ struct tegra_clk_init_table {
>  };
>
>  void tegra2_init_clocks(void);
> -void tegra2_periph_reset_deassert(struct clk *c);
> -void tegra2_periph_reset_assert(struct clk *c);
>  void clk_init(struct clk *clk);
>  struct clk *tegra_get_clock_by_name(const char *name);
> -unsigned long clk_measure_input_freq(void);
>  int clk_reparent(struct clk *c, struct clk *parent);
>  void tegra_clk_init_from_table(struct tegra_clk_init_table *table);
>  unsigned long clk_get_rate_locked(struct clk *c);
>  int clk_set_rate_locked(struct clk *c, unsigned long rate);
> +#ifdef CONFIG_ARCH_TEGRA_2x_SOC
>  void tegra2_sdmmc_tap_delay(struct clk *c, int delay);
> -
> +#else
> +#define tegra2_sdmmc_tap_delay(c, d) do {} while(0);
>

It's more standard to use an empty static inline function here.

+#endif
>  #endif
> diff --git a/arch/arm/mach-tegra/tegra2_clocks.c
> b/arch/arm/mach-tegra/tegra2_clocks.c
> index 371869d..2ab18f6 100644
> --- a/arch/arm/mach-tegra/tegra2_clocks.c
> +++ b/arch/arm/mach-tegra/tegra2_clocks.c
> @@ -174,7 +174,7 @@ static int tegra_periph_clk_enable_refcount[3 * 32];
>  #define pmc_readl(reg) \
>        __raw_readl(reg_pmc_base + (reg))
>
> -unsigned long clk_measure_input_freq(void)
> +static unsigned long clk_measure_input_freq(void)
>  {
>        u32 clock_autodetect;
>        clk_writel(OSC_FREQ_DET_TRIG | 1, OSC_FREQ_DET);
> @@ -278,18 +278,6 @@ static struct clk_ops tegra_clk_m_ops = {
>        .disable        = tegra2_clk_m_disable,
>  };
>
> -void tegra2_periph_reset_assert(struct clk *c)
> -{
> -       BUG_ON(!c->ops->reset);
> -       c->ops->reset(c, true);
> -}
> -
> -void tegra2_periph_reset_deassert(struct clk *c)
> -{
> -       BUG_ON(!c->ops->reset);
> -       c->ops->reset(c, false);
> -}
> -
>  /* super clock functions */
>  /* "super clocks" on tegra have two-stage muxes and a clock skipping
>  * super divider.  We will ignore the clock skipping divider, since we
> diff --git a/arch/arm/mach-tegra/timer.c b/arch/arm/mach-tegra/timer.c
> index 2f1df47..6366654 100644
> --- a/arch/arm/mach-tegra/timer.c
> +++ b/arch/arm/mach-tegra/timer.c
> @@ -182,14 +182,18 @@ static struct irqaction tegra_timer_irq = {
>  static void __init tegra_init_timer(void)
>  {
>        struct clk *clk;
> -       unsigned long rate = clk_measure_input_freq();
> +       unsigned long rate;
>        int ret;
>
>        clk = clk_get_sys("timer", NULL);
> -       if (IS_ERR(clk))
> -               pr_warn("Unable to get timer clock\n");
> -       else
> +       if (IS_ERR(clk)) {
> +               pr_warn("Unable to get timer clock."
> +                       " Assuming 12Mhz input clock.\n");
> +               rate = 12000000;
> +       } else {
>                clk_enable(clk);
> +               rate = clk_get_rate(clk);
> +       }
>
>        /*
>         * rtc registers are used by read_persistent_clock, keep the rtc
> clock
>

This timer change should be a separate patch.


> --
> 1.7.7.rc0.72.g4b5ea.dirty
>
>

--14dae93409917bc54704b398cc7c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Dec 8, 2011 at 4:43 AM, Peter De Schrijv=
er <span dir=3D"ltr">&lt;<a href=3D"mailto:pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org">pdeschr=
ijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
Rework the tegra20 clock code to support multiple tegra variants :<br>
<br>
=A0* remove tegra2_periph_reset_assert/tegra2_periph_reset_deassert. This<b=
r>
 =A0 functionality should be in clock.c.<br>
=A0* compile tegra_sdmmc_tap_delay only on tegra20 as this feature will not=
<br>
 =A0 be available in future variants.<br>
=A0* don&#39;t export clk_measure_input_freq as its functionality is also a=
vailable<br>
 =A0 using clk_get_rate().<br>
<br>
Signed-off-by: Peter De Schrijver &lt;<a href=3D"mailto:pdeschrijver@nvidia=
.com">pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org</a>&gt;<br>
---<br>
=A0arch/arm/mach-tegra/clock.c =A0 =A0 =A0 =A0 | =A0 12 +++++++-----<br>
=A0arch/arm/mach-tegra/clock.h =A0 =A0 =A0 =A0 | =A0 =A08 ++++----<br>
=A0arch/arm/mach-tegra/tegra2_clocks.c | =A0 14 +-------------<br>
=A0arch/arm/mach-tegra/timer.c =A0 =A0 =A0 =A0 | =A0 12 ++++++++----<br>
=A04 files changed, 20 insertions(+), 26 deletions(-)<br>
<br>
diff --git a/arch/arm/mach-tegra/clock.c b/arch/arm/mach-tegra/clock.c<br>
index f8d41ff..f27bdcc 100644<br>
--- a/arch/arm/mach-tegra/clock.c<br>
+++ b/arch/arm/mach-tegra/clock.c<br>
@@ -387,13 +387,15 @@ EXPORT_SYMBOL(tegra_clk_init_from_table);<br>
<br>
=A0void tegra_periph_reset_deassert(struct clk *c)<br>
=A0{<br>
- =A0 =A0 =A0 tegra2_periph_reset_deassert(c);<br>
+ =A0 =A0 =A0 BUG_ON(!c-&gt;ops-&gt;reset);<br></blockquote><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex;">+ =A0 =A0 =A0 c-&gt;ops-&gt;reset(c, false);<br>
=A0}<br>
=A0EXPORT_SYMBOL(tegra_periph_reset_deassert);<br>
<br>
=A0void tegra_periph_reset_assert(struct clk *c)<br>
=A0{<br>
- =A0 =A0 =A0 tegra2_periph_reset_assert(c);<br>
+ =A0 =A0 =A0 BUG_ON(!c-&gt;ops-&gt;reset);<br>
+ =A0 =A0 =A0 c-&gt;ops-&gt;reset(c, true);<br>
=A0}<br>
=A0EXPORT_SYMBOL(tegra_periph_reset_assert);<br>
<br>
@@ -403,9 +405,9 @@ void __init tegra_init_clock(void)<br>
=A0}<br>
<br>
=A0/*<br>
- * The SDMMC controllers have extra bits in the clock source register that=
<br>
- * adjust the delay between the clock and data to compenstate for delays<b=
r>
- * on the PCB.<br>
+ * The SDMMC controllers on tegra20 have extra bits in the clock source<br=
>
+ * register that adjust the delay between the clock and data to compenstat=
e<br>
+ * for delays on the PCB.<br>
 =A0*/<br>
=A0void tegra_sdmmc_tap_delay(struct clk *c, int delay)<br>
=A0{<br></blockquote><div>=A0</div><div>I created this wrapper around tegra=
2_sdmmc_tap_delay because I guessed the same requirement would be present i=
n tegra3. =A0If you don&#39;t expect this to be required on anything but te=
gra2, you could drop the wrapper and just have callers use tegra2_sdmmc_tap=
_delay.</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex;">
diff --git a/arch/arm/mach-tegra/clock.h b/arch/arm/mach-tegra/clock.h<br>
index 688316a..135bb5f 100644<br>
--- a/arch/arm/mach-tegra/clock.h<br>
+++ b/arch/arm/mach-tegra/clock.h<br>
@@ -146,15 +146,15 @@ struct tegra_clk_init_table {<br>
=A0};<br>
<br>
=A0void tegra2_init_clocks(void);<br>
-void tegra2_periph_reset_deassert(struct clk *c);<br>
-void tegra2_periph_reset_assert(struct clk *c);<br>
=A0void clk_init(struct clk *clk);<br>
=A0struct clk *tegra_get_clock_by_name(const char *name);<br>
-unsigned long clk_measure_input_freq(void);<br>
=A0int clk_reparent(struct clk *c, struct clk *parent);<br>
=A0void tegra_clk_init_from_table(struct tegra_clk_init_table *table);<br>
=A0unsigned long clk_get_rate_locked(struct clk *c);<br>
=A0int clk_set_rate_locked(struct clk *c, unsigned long rate);<br>
+#ifdef CONFIG_ARCH_TEGRA_2x_SOC<br>
=A0void tegra2_sdmmc_tap_delay(struct clk *c, int delay);<br>
-<br>
+#else<br>
+#define tegra2_sdmmc_tap_delay(c, d) do {} while(0);<br></blockquote><div>=
=A0</div><div>It&#39;s more standard to use an empty static inline function=
 here.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">

+#endif<br>
=A0#endif<br>
diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/tegr=
a2_clocks.c<br>
index 371869d..2ab18f6 100644<br>
--- a/arch/arm/mach-tegra/tegra2_clocks.c<br>
+++ b/arch/arm/mach-tegra/tegra2_clocks.c<br>
@@ -174,7 +174,7 @@ static int tegra_periph_clk_enable_refcount[3 * 32];<br=
>
=A0#define pmc_readl(reg) \<br>
 =A0 =A0 =A0 =A0__raw_readl(reg_pmc_base + (reg))<br>
<br>
-unsigned long clk_measure_input_freq(void)<br>
+static unsigned long clk_measure_input_freq(void)<br>
=A0{<br>
 =A0 =A0 =A0 =A0u32 clock_autodetect;<br>
 =A0 =A0 =A0 =A0clk_writel(OSC_FREQ_DET_TRIG | 1, OSC_FREQ_DET);<br>
@@ -278,18 +278,6 @@ static struct clk_ops tegra_clk_m_ops =3D {<br>
 =A0 =A0 =A0 =A0.disable =A0 =A0 =A0 =A0=3D tegra2_clk_m_disable,<br>
=A0};<br>
<br>
-void tegra2_periph_reset_assert(struct clk *c)<br>
-{<br>
- =A0 =A0 =A0 BUG_ON(!c-&gt;ops-&gt;reset);<br>
- =A0 =A0 =A0 c-&gt;ops-&gt;reset(c, true);<br>
-}<br>
-<br>
-void tegra2_periph_reset_deassert(struct clk *c)<br>
-{<br>
- =A0 =A0 =A0 BUG_ON(!c-&gt;ops-&gt;reset);<br>
- =A0 =A0 =A0 c-&gt;ops-&gt;reset(c, false);<br>
-}<br>
-<br>
=A0/* super clock functions */<br>
=A0/* &quot;super clocks&quot; on tegra have two-stage muxes and a clock sk=
ipping<br>
 =A0* super divider. =A0We will ignore the clock skipping divider, since we=
<br>
diff --git a/arch/arm/mach-tegra/timer.c b/arch/arm/mach-tegra/timer.c<br>
index 2f1df47..6366654 100644<br>
--- a/arch/arm/mach-tegra/timer.c<br>
+++ b/arch/arm/mach-tegra/timer.c<br>
@@ -182,14 +182,18 @@ static struct irqaction tegra_timer_irq =3D {<br>
=A0static void __init tegra_init_timer(void)<br>
=A0{<br>
 =A0 =A0 =A0 =A0struct clk *clk;<br>
- =A0 =A0 =A0 unsigned long rate =3D clk_measure_input_freq();<br>
+ =A0 =A0 =A0 unsigned long rate;<br>
 =A0 =A0 =A0 =A0int ret;<br>
<br>
 =A0 =A0 =A0 =A0clk =3D clk_get_sys(&quot;timer&quot;, NULL);<br>
- =A0 =A0 =A0 if (IS_ERR(clk))<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_warn(&quot;Unable to get timer clock\n&quo=
t;);<br>
- =A0 =A0 =A0 else<br>
+ =A0 =A0 =A0 if (IS_ERR(clk)) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_warn(&quot;Unable to get timer clock.&quot=
;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &quot; Assuming 12Mhz input c=
lock.\n&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 rate =3D 12000000;<br>
+ =A0 =A0 =A0 } else {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0clk_enable(clk);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 rate =3D clk_get_rate(clk);<br>
+ =A0 =A0 =A0 }<br>
<br>
 =A0 =A0 =A0 =A0/*<br>
 =A0 =A0 =A0 =A0 * rtc registers are used by read_persistent_clock, keep th=
e rtc clock<br>
<span class=3D"HOEnZb"><font color=3D"#888888"></font></span></blockquote><=
div><br></div><div>This timer change should be a separate patch.</div><div>=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex;">
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.7.rc0.72.g4b5ea.dirty<br>
<br>
</font></span></blockquote></div><br>

--14dae93409917bc54704b398cc7c--

--===============6851184201308245187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6851184201308245187==--
