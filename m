From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] documentation: pinctrl bindings: Fix trivial typo 'abitrary'
Date: Tue, 18 Nov 2014 12:05:30 -0600
Message-ID: <CAL_JsqLiek8Cg-6ZJJvo7E74boOkzyo=ckgKGMxRMpN_3BpS4A@mail.gmail.com>
References: <1415288331-785-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415288331-785-1-git-send-email-soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Jiri Kosina <trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 6, 2014 at 9:38 AM, Soren Brinkmann
<soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> A misspelled 'arbitrary' propagated to quite a few locations in the D=
T
> binding documentation for pin-controllers. Fixing by:
>   git grep abitrary | cut -f1 -d: | xargs sed -i 's/abitrary/arbitrar=
y/'
>
> Reported-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
> Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

Applied, thanks.

Rob

> ---
>  Documentation/devicetree/bindings/pinctrl/img,tz1090-pdc-pinctrl.txt=
 | 2 +-
>  Documentation/devicetree/bindings/pinctrl/img,tz1090-pinctrl.txt    =
 | 2 +-
>  Documentation/devicetree/bindings/pinctrl/lantiq,falcon-pinumx.txt  =
 | 2 +-
>  Documentation/devicetree/bindings/pinctrl/lantiq,xway-pinumx.txt    =
 | 2 +-
>  Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.txt =
 | 2 +-
>  Documentation/devicetree/bindings/pinctrl/pinctrl-sirf.txt          =
 | 2 +-
>  Documentation/devicetree/bindings/pinctrl/pinctrl_spear.txt         =
 | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt  =
 | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.txt  =
 | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt  =
 | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.txt  =
 | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.txt  =
 | 2 +-
>  12 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/img,tz1090-pdc=
-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/img,tz1090-pdc=
-pinctrl.txt
> index a186181c402b..51b943cc9770 100644
> --- a/Documentation/devicetree/bindings/pinctrl/img,tz1090-pdc-pinctr=
l.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/img,tz1090-pdc-pinctr=
l.txt
> @@ -9,7 +9,7 @@ Please refer to pinctrl-bindings.txt in this director=
y for details of the
>  common pinctrl bindings used by client devices, including the meanin=
g of the
>  phrase "pin configuration node".
>
> -TZ1090-PDC's pin configuration nodes act as a container for an abitr=
ary number
> +TZ1090-PDC's pin configuration nodes act as a container for an arbit=
rary number
>  of subnodes. Each of these subnodes represents some desired configur=
ation for a
>  pin, a group, or a list of pins or groups. This configuration can in=
clude the
>  mux function to select on those pin(s)/group(s), and various pin con=
figuration
> diff --git a/Documentation/devicetree/bindings/pinctrl/img,tz1090-pin=
ctrl.txt b/Documentation/devicetree/bindings/pinctrl/img,tz1090-pinctrl=
=2Etxt
> index 4b27c99f7f9d..49d0e6050940 100644
> --- a/Documentation/devicetree/bindings/pinctrl/img,tz1090-pinctrl.tx=
t
> +++ b/Documentation/devicetree/bindings/pinctrl/img,tz1090-pinctrl.tx=
t
> @@ -9,7 +9,7 @@ Please refer to pinctrl-bindings.txt in this director=
y for details of the
>  common pinctrl bindings used by client devices, including the meanin=
g of the
>  phrase "pin configuration node".
>
> -TZ1090's pin configuration nodes act as a container for an abitrary =
number of
> +TZ1090's pin configuration nodes act as a container for an arbitrary=
 number of
>  subnodes. Each of these subnodes represents some desired configurati=
on for a
>  pin, a group, or a list of pins or groups. This configuration can in=
clude the
>  mux function to select on those pin(s)/group(s), and various pin con=
figuration
> diff --git a/Documentation/devicetree/bindings/pinctrl/lantiq,falcon-=
pinumx.txt b/Documentation/devicetree/bindings/pinctrl/lantiq,falcon-pi=
numx.txt
> index daa768956069..ac4da9fe07bd 100644
> --- a/Documentation/devicetree/bindings/pinctrl/lantiq,falcon-pinumx.=
txt
> +++ b/Documentation/devicetree/bindings/pinctrl/lantiq,falcon-pinumx.=
txt
> @@ -9,7 +9,7 @@ Please refer to pinctrl-bindings.txt in this director=
y for details of the
>  common pinctrl bindings used by client devices, including the meanin=
g of the
>  phrase "pin configuration node".
>
> -Lantiq's pin configuration nodes act as a container for an abitrary =
number of
> +Lantiq's pin configuration nodes act as a container for an arbitrary=
 number of
>  subnodes. Each of these subnodes represents some desired configurati=
on for a
>  pin, a group, or a list of pins or groups. This configuration can in=
clude the
>  mux function to select on those group(s), and two pin configuration =
parameters:
> diff --git a/Documentation/devicetree/bindings/pinctrl/lantiq,xway-pi=
numx.txt b/Documentation/devicetree/bindings/pinctrl/lantiq,xway-pinumx=
=2Etxt
> index b5469db1d7ad..e89b4677567d 100644
> --- a/Documentation/devicetree/bindings/pinctrl/lantiq,xway-pinumx.tx=
t
> +++ b/Documentation/devicetree/bindings/pinctrl/lantiq,xway-pinumx.tx=
t
> @@ -9,7 +9,7 @@ Please refer to pinctrl-bindings.txt in this director=
y for details of the
>  common pinctrl bindings used by client devices, including the meanin=
g of the
>  phrase "pin configuration node".
>
> -Lantiq's pin configuration nodes act as a container for an abitrary =
number of
> +Lantiq's pin configuration nodes act as a container for an arbitrary=
 number of
>  subnodes. Each of these subnodes represents some desired configurati=
on for a
>  pin, a group, or a list of pins or groups. This configuration can in=
clude the
>  mux function to select on those group(s), and two pin configuration =
parameters:
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra20=
-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-=
pinmux.txt
> index 61e73cde9ae9..3c8ce28baad6 100644
> --- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux=
=2Etxt
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux=
=2Etxt
> @@ -9,7 +9,7 @@ Please refer to pinctrl-bindings.txt in this director=
y for details of the
>  common pinctrl bindings used by client devices, including the meanin=
g of the
>  phrase "pin configuration node".
>
> -Tegra's pin configuration nodes act as a container for an abitrary n=
umber of
> +Tegra's pin configuration nodes act as a container for an arbitrary =
number of
>  subnodes. Each of these subnodes represents some desired configurati=
on for a
>  pin, a group, or a list of pins or groups. This configuration can in=
clude the
>  mux function to select on those pin(s)/group(s), and various pin con=
figuration
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-sirf.t=
xt b/Documentation/devicetree/bindings/pinctrl/pinctrl-sirf.txt
> index c596a6ad3285..5f55be59d914 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-sirf.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-sirf.txt
> @@ -13,7 +13,7 @@ Optional properties:
>  Please refer to pinctrl-bindings.txt in this directory for details o=
f the common
>  pinctrl bindings used by client devices.
>
> -SiRFprimaII's pinmux nodes act as a container for an abitrary number=
 of subnodes.
> +SiRFprimaII's pinmux nodes act as a container for an arbitrary numbe=
r of subnodes.
>  Each of these subnodes represents some desired configuration for a g=
roup of pins.
>
>  Required subnode-properties:
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl_spear.=
txt b/Documentation/devicetree/bindings/pinctrl/pinctrl_spear.txt
> index b4480d5c3aca..458615596946 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl_spear.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl_spear.txt
> @@ -32,7 +32,7 @@ Required properties:
>  Please refer to pinctrl-bindings.txt in this directory for details o=
f the common
>  pinctrl bindings used by client devices.
>
> -SPEAr's pinmux nodes act as a container for an abitrary number of su=
bnodes. Each
> +SPEAr's pinmux nodes act as a container for an arbitrary number of s=
ubnodes. Each
>  of these subnodes represents muxing for a pin, a group, or a list of=
 pins or
>  groups.
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-p=
inctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pin=
ctrl.txt
> index 2fb90b37aa09..a7bde64798c7 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.=
txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.=
txt
> @@ -18,7 +18,7 @@ Please refer to pinctrl-bindings.txt in this direct=
ory for details of the
>  common pinctrl bindings used by client devices, including the meanin=
g of the
>  phrase "pin configuration node".
>
> -Qualcomm's pin configuration nodes act as a container for an abitrar=
y number of
> +Qualcomm's pin configuration nodes act as a container for an arbitra=
ry number of
>  subnodes. Each of these subnodes represents some desired configurati=
on for a
>  pin, a group, or a list of pins or groups. This configuration can in=
clude the
>  mux function to select on those pin(s)/group(s), and various pin con=
figuration
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,apq8084-p=
inctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pin=
ctrl.txt
> index ffafa1990a30..c4ea61ac56f2 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.=
txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.=
txt
> @@ -47,7 +47,7 @@ Please refer to pinctrl-bindings.txt in this direct=
ory for details of the
>  common pinctrl bindings used by client devices, including the meanin=
g of the
>  phrase "pin configuration node".
>
> -The pin configuration nodes act as a container for an abitrary numbe=
r of
> +The pin configuration nodes act as a container for an arbitrary numb=
er of
>  subnodes. Each of these subnodes represents some desired configurati=
on for a
>  pin, a group, or a list of pins or groups. This configuration can in=
clude the
>  mux function to select on those pin(s)/group(s), and various pin con=
figuration
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-p=
inctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pin=
ctrl.txt
> index e33e4dcdce79..6e88e91feb11 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.=
txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.=
txt
> @@ -18,7 +18,7 @@ Please refer to pinctrl-bindings.txt in this direct=
ory for details of the
>  common pinctrl bindings used by client devices, including the meanin=
g of the
>  phrase "pin configuration node".
>
> -Qualcomm's pin configuration nodes act as a container for an abitrar=
y number of
> +Qualcomm's pin configuration nodes act as a container for an arbitra=
ry number of
>  subnodes. Each of these subnodes represents some desired configurati=
on for a
>  pin, a group, or a list of pins or groups. This configuration can in=
clude the
>  mux function to select on those pin(s)/group(s), and various pin con=
figuration
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-p=
inctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pin=
ctrl.txt
> index 93b7de91b9f6..eb8d8aa41f20 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.=
txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.=
txt
> @@ -47,7 +47,7 @@ Please refer to pinctrl-bindings.txt in this direct=
ory for details of the
>  common pinctrl bindings used by client devices, including the meanin=
g of the
>  phrase "pin configuration node".
>
> -The pin configuration nodes act as a container for an abitrary numbe=
r of
> +The pin configuration nodes act as a container for an arbitrary numb=
er of
>  subnodes. Each of these subnodes represents some desired configurati=
on for a
>  pin, a group, or a list of pins or groups. This configuration can in=
clude the
>  mux function to select on those pin(s)/group(s), and various pin con=
figuration
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-p=
inctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pin=
ctrl.txt
> index d2ea80dc43eb..e4d6a9d20f7d 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.=
txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.=
txt
> @@ -18,7 +18,7 @@ Please refer to pinctrl-bindings.txt in this direct=
ory for details of the
>  common pinctrl bindings used by client devices, including the meanin=
g of the
>  phrase "pin configuration node".
>
> -Qualcomm's pin configuration nodes act as a container for an abitrar=
y number of
> +Qualcomm's pin configuration nodes act as a container for an arbitra=
ry number of
>  subnodes. Each of these subnodes represents some desired configurati=
on for a
>  pin, a group, or a list of pins or groups. This configuration can in=
clude the
>  mux function to select on those pin(s)/group(s), and various pin con=
figuration
> --
> 2.1.3.1.ge241007
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
