From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/2] arm/dt: add basic usb nodes to tegra device trees
Date: Fri, 4 Nov 2011 10:26:23 -0400
Message-ID: <CACxGe6ugjvc-y=BBTejM7bvObfLeLB2NCBEEVGgeT+i7WOGN0g@mail.gmail.com>
References: <1320377174-28047-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2188351392353738106=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1320377174-28047-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--===============2188351392353738106==
Content-Type: multipart/alternative; boundary=0016363ba04e63dced04b0e97d29

--0016363ba04e63dced04b0e97d29
Content-Type: text/plain; charset=ISO-8859-1

On Nov 3, 2011 11:26 PM, "Olof Johansson" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
>
> For now they are a minimal binding. It needs to be amended with
> vendor-specific settings for phy setup and link tuning, etc.
>
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>

Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

> ---
>  arch/arm/boot/dts/tegra-seaboard.dts |    4 ++++
>  arch/arm/boot/dts/tegra20.dtsi       |   18 ++++++++++++++++++
>  2 files changed, 22 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/boot/dts/tegra-seaboard.dts
b/arch/arm/boot/dts/tegra-seaboard.dts
> index a72299b..88c682a 100644
> --- a/arch/arm/boot/dts/tegra-seaboard.dts
> +++ b/arch/arm/boot/dts/tegra-seaboard.dts
> @@ -29,4 +29,8 @@
>        sdhci@c8000600 {
>                support-8bit;
>        };
> +
> +       usb@c5000000 {
> +               nvidia,vbus-gpio = <&gpio 24 0>; /* PD0 */
> +       };
>  };
> diff --git a/arch/arm/boot/dts/tegra20.dtsi
b/arch/arm/boot/dts/tegra20.dtsi
> index 65d7e6a..2ad1107 100644
> --- a/arch/arm/boot/dts/tegra20.dtsi
> +++ b/arch/arm/boot/dts/tegra20.dtsi
> @@ -143,5 +143,23 @@
>                reg = <0xc8000600 0x200>;
>                interrupts = < 63 >;
>        };
> +
> +       usb@c5000000 {
> +               compatible = "nvidia,tegra20-ehci", "usb-ehci";
> +               reg = <0xc5000000 0x4000>;
> +               interrupts = < 52 >;
> +       };
> +
> +       usb@c5004000 {
> +               compatible = "nvidia,tegra20-ehci", "usb-ehci";
> +               reg = <0xc5004000 0x4000>;
> +               interrupts = < 53 >;
> +       };
> +
> +       usb@c5008000 {
> +               compatible = "nvidia,tegra20-ehci", "usb-ehci";
> +               reg = <0xc5008000 0x4000>;
> +               interrupts = < 129 >;
> +       };
>  };
>
> --
> 1.7.4.1
>

--0016363ba04e63dced04b0e97d29
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p><br>
On Nov 3, 2011 11:26 PM, &quot;Olof Johansson&quot; &lt;<a href=3D"mailto:o=
lof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org">olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org</a>&gt; wrote:<br>
&gt;<br>
&gt; For now they are a minimal binding. It needs to be amended with<br>
&gt; vendor-specific settings for phy setup and link tuning, etc.<br>
&gt;<br>
&gt; Signed-off-by: Olof Johansson &lt;<a href=3D"mailto:olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org">ol=
of-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org</a>&gt;</p>
<p>Acked-by: Grant Likely &lt;<a href=3D"mailto:grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org">=
grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org</a>&gt;</p>
<p>&gt; ---<br>
&gt; =A0arch/arm/boot/dts/tegra-seaboard.dts | =A0 =A04 ++++<br>
&gt; =A0arch/arm/boot/dts/tegra20.dtsi =A0 =A0 =A0 | =A0 18 +++++++++++++++=
+++<br>
&gt; =A02 files changed, 22 insertions(+), 0 deletions(-)<br>
&gt;<br>
&gt; diff --git a/arch/arm/boot/dts/tegra-seaboard.dts b/arch/arm/boot/dts/=
tegra-seaboard.dts<br>
&gt; index a72299b..88c682a 100644<br>
&gt; --- a/arch/arm/boot/dts/tegra-seaboard.dts<br>
&gt; +++ b/arch/arm/boot/dts/tegra-seaboard.dts<br>
&gt; @@ -29,4 +29,8 @@<br>
&gt; =A0 =A0 =A0 =A0sdhci@c8000600 {<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0support-8bit;<br>
&gt; =A0 =A0 =A0 =A0};<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 usb@c5000000 {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,vbus-gpio =3D &lt;&amp;gpio 24 0&=
gt;; /* PD0 */<br>
&gt; + =A0 =A0 =A0 };<br>
&gt; =A0};<br>
&gt; diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra2=
0.dtsi<br>
&gt; index 65d7e6a..2ad1107 100644<br>
&gt; --- a/arch/arm/boot/dts/tegra20.dtsi<br>
&gt; +++ b/arch/arm/boot/dts/tegra20.dtsi<br>
&gt; @@ -143,5 +143,23 @@<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D &lt;0xc8000600 0x200&gt;;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0interrupts =3D &lt; 63 &gt;;<br>
&gt; =A0 =A0 =A0 =A0};<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 usb@c5000000 {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &quot;nvidia,tegra20-ehci=
&quot;, &quot;usb-ehci&quot;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0xc5000000 0x4000&gt;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D &lt; 52 &gt;;<br>
&gt; + =A0 =A0 =A0 };<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 usb@c5004000 {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &quot;nvidia,tegra20-ehci=
&quot;, &quot;usb-ehci&quot;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0xc5004000 0x4000&gt;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D &lt; 53 &gt;;<br>
&gt; + =A0 =A0 =A0 };<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 usb@c5008000 {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &quot;nvidia,tegra20-ehci=
&quot;, &quot;usb-ehci&quot;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0xc5008000 0x4000&gt;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D &lt; 129 &gt;;<br>
&gt; + =A0 =A0 =A0 };<br>
&gt; =A0};<br>
&gt;<br>
&gt; --<br>
&gt; 1.7.4.1<br>
&gt;<br>
</p>

--0016363ba04e63dced04b0e97d29--

--===============2188351392353738106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2188351392353738106==--
