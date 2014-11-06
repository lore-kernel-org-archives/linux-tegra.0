From: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] documentation: pinctrl bindings: Fix trivial typo 'abitrary'
Date: Thu,  6 Nov 2014 07:38:51 -0800
Message-ID: <1415288331-785-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jiri Kosina <trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

A misspelled 'arbitrary' propagated to quite a few locations in the DT
binding documentation for pin-controllers. Fixing by:
  git grep abitrary | cut -f1 -d: | xargs sed -i 's/abitrary/arbitrary/=
'

Reported-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/pinctrl/img,tz1090-pdc-pinctrl.txt |=
 2 +-
 Documentation/devicetree/bindings/pinctrl/img,tz1090-pinctrl.txt     |=
 2 +-
 Documentation/devicetree/bindings/pinctrl/lantiq,falcon-pinumx.txt   |=
 2 +-
 Documentation/devicetree/bindings/pinctrl/lantiq,xway-pinumx.txt     |=
 2 +-
 Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.txt  |=
 2 +-
 Documentation/devicetree/bindings/pinctrl/pinctrl-sirf.txt           |=
 2 +-
 Documentation/devicetree/bindings/pinctrl/pinctrl_spear.txt          |=
 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt   |=
 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.txt   |=
 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt   |=
 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.txt   |=
 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.txt   |=
 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/img,tz1090-pdc-p=
inctrl.txt b/Documentation/devicetree/bindings/pinctrl/img,tz1090-pdc-p=
inctrl.txt
index a186181c402b..51b943cc9770 100644
--- a/Documentation/devicetree/bindings/pinctrl/img,tz1090-pdc-pinctrl.=
txt
+++ b/Documentation/devicetree/bindings/pinctrl/img,tz1090-pdc-pinctrl.=
txt
@@ -9,7 +9,7 @@ Please refer to pinctrl-bindings.txt in this directory =
for details of the
 common pinctrl bindings used by client devices, including the meaning =
of the
 phrase "pin configuration node".
=20
-TZ1090-PDC's pin configuration nodes act as a container for an abitrar=
y number
+TZ1090-PDC's pin configuration nodes act as a container for an arbitra=
ry number
 of subnodes. Each of these subnodes represents some desired configurat=
ion for a
 pin, a group, or a list of pins or groups. This configuration can incl=
ude the
 mux function to select on those pin(s)/group(s), and various pin confi=
guration
diff --git a/Documentation/devicetree/bindings/pinctrl/img,tz1090-pinct=
rl.txt b/Documentation/devicetree/bindings/pinctrl/img,tz1090-pinctrl.t=
xt
index 4b27c99f7f9d..49d0e6050940 100644
--- a/Documentation/devicetree/bindings/pinctrl/img,tz1090-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/img,tz1090-pinctrl.txt
@@ -9,7 +9,7 @@ Please refer to pinctrl-bindings.txt in this directory =
for details of the
 common pinctrl bindings used by client devices, including the meaning =
of the
 phrase "pin configuration node".
=20
-TZ1090's pin configuration nodes act as a container for an abitrary nu=
mber of
+TZ1090's pin configuration nodes act as a container for an arbitrary n=
umber of
 subnodes. Each of these subnodes represents some desired configuration=
 for a
 pin, a group, or a list of pins or groups. This configuration can incl=
ude the
 mux function to select on those pin(s)/group(s), and various pin confi=
guration
diff --git a/Documentation/devicetree/bindings/pinctrl/lantiq,falcon-pi=
numx.txt b/Documentation/devicetree/bindings/pinctrl/lantiq,falcon-pinu=
mx.txt
index daa768956069..ac4da9fe07bd 100644
--- a/Documentation/devicetree/bindings/pinctrl/lantiq,falcon-pinumx.tx=
t
+++ b/Documentation/devicetree/bindings/pinctrl/lantiq,falcon-pinumx.tx=
t
@@ -9,7 +9,7 @@ Please refer to pinctrl-bindings.txt in this directory =
for details of the
 common pinctrl bindings used by client devices, including the meaning =
of the
 phrase "pin configuration node".
=20
-Lantiq's pin configuration nodes act as a container for an abitrary nu=
mber of
+Lantiq's pin configuration nodes act as a container for an arbitrary n=
umber of
 subnodes. Each of these subnodes represents some desired configuration=
 for a
 pin, a group, or a list of pins or groups. This configuration can incl=
ude the
 mux function to select on those group(s), and two pin configuration pa=
rameters:
diff --git a/Documentation/devicetree/bindings/pinctrl/lantiq,xway-pinu=
mx.txt b/Documentation/devicetree/bindings/pinctrl/lantiq,xway-pinumx.t=
xt
index b5469db1d7ad..e89b4677567d 100644
--- a/Documentation/devicetree/bindings/pinctrl/lantiq,xway-pinumx.txt
+++ b/Documentation/devicetree/bindings/pinctrl/lantiq,xway-pinumx.txt
@@ -9,7 +9,7 @@ Please refer to pinctrl-bindings.txt in this directory =
for details of the
 common pinctrl bindings used by client devices, including the meaning =
of the
 phrase "pin configuration node".
=20
-Lantiq's pin configuration nodes act as a container for an abitrary nu=
mber of
+Lantiq's pin configuration nodes act as a container for an arbitrary n=
umber of
 subnodes. Each of these subnodes represents some desired configuration=
 for a
 pin, a group, or a list of pins or groups. This configuration can incl=
ude the
 mux function to select on those group(s), and two pin configuration pa=
rameters:
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-p=
inmux.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pi=
nmux.txt
index 61e73cde9ae9..3c8ce28baad6 100644
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.t=
xt
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.t=
xt
@@ -9,7 +9,7 @@ Please refer to pinctrl-bindings.txt in this directory =
for details of the
 common pinctrl bindings used by client devices, including the meaning =
of the
 phrase "pin configuration node".
=20
-Tegra's pin configuration nodes act as a container for an abitrary num=
ber of
+Tegra's pin configuration nodes act as a container for an arbitrary nu=
mber of
 subnodes. Each of these subnodes represents some desired configuration=
 for a
 pin, a group, or a list of pins or groups. This configuration can incl=
ude the
 mux function to select on those pin(s)/group(s), and various pin confi=
guration
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-sirf.txt=
 b/Documentation/devicetree/bindings/pinctrl/pinctrl-sirf.txt
index c596a6ad3285..5f55be59d914 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-sirf.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-sirf.txt
@@ -13,7 +13,7 @@ Optional properties:
 Please refer to pinctrl-bindings.txt in this directory for details of =
the common
 pinctrl bindings used by client devices.
=20
-SiRFprimaII's pinmux nodes act as a container for an abitrary number o=
f subnodes.
+SiRFprimaII's pinmux nodes act as a container for an arbitrary number =
of subnodes.
 Each of these subnodes represents some desired configuration for a gro=
up of pins.
=20
 Required subnode-properties:
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl_spear.tx=
t b/Documentation/devicetree/bindings/pinctrl/pinctrl_spear.txt
index b4480d5c3aca..458615596946 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl_spear.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl_spear.txt
@@ -32,7 +32,7 @@ Required properties:
 Please refer to pinctrl-bindings.txt in this directory for details of =
the common
 pinctrl bindings used by client devices.
=20
-SPEAr's pinmux nodes act as a container for an abitrary number of subn=
odes. Each
+SPEAr's pinmux nodes act as a container for an arbitrary number of sub=
nodes. Each
 of these subnodes represents muxing for a pin, a group, or a list of p=
ins or
 groups.
=20
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pin=
ctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinct=
rl.txt
index 2fb90b37aa09..a7bde64798c7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.tx=
t
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.tx=
t
@@ -18,7 +18,7 @@ Please refer to pinctrl-bindings.txt in this director=
y for details of the
 common pinctrl bindings used by client devices, including the meaning =
of the
 phrase "pin configuration node".
=20
-Qualcomm's pin configuration nodes act as a container for an abitrary =
number of
+Qualcomm's pin configuration nodes act as a container for an arbitrary=
 number of
 subnodes. Each of these subnodes represents some desired configuration=
 for a
 pin, a group, or a list of pins or groups. This configuration can incl=
ude the
 mux function to select on those pin(s)/group(s), and various pin confi=
guration
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pin=
ctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinct=
rl.txt
index ffafa1990a30..c4ea61ac56f2 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.tx=
t
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.tx=
t
@@ -47,7 +47,7 @@ Please refer to pinctrl-bindings.txt in this director=
y for details of the
 common pinctrl bindings used by client devices, including the meaning =
of the
 phrase "pin configuration node".
=20
-The pin configuration nodes act as a container for an abitrary number =
of
+The pin configuration nodes act as a container for an arbitrary number=
 of
 subnodes. Each of these subnodes represents some desired configuration=
 for a
 pin, a group, or a list of pins or groups. This configuration can incl=
ude the
 mux function to select on those pin(s)/group(s), and various pin confi=
guration
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pin=
ctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinct=
rl.txt
index e33e4dcdce79..6e88e91feb11 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.tx=
t
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.tx=
t
@@ -18,7 +18,7 @@ Please refer to pinctrl-bindings.txt in this director=
y for details of the
 common pinctrl bindings used by client devices, including the meaning =
of the
 phrase "pin configuration node".
=20
-Qualcomm's pin configuration nodes act as a container for an abitrary =
number of
+Qualcomm's pin configuration nodes act as a container for an arbitrary=
 number of
 subnodes. Each of these subnodes represents some desired configuration=
 for a
 pin, a group, or a list of pins or groups. This configuration can incl=
ude the
 mux function to select on those pin(s)/group(s), and various pin confi=
guration
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pin=
ctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinct=
rl.txt
index 93b7de91b9f6..eb8d8aa41f20 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.tx=
t
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.tx=
t
@@ -47,7 +47,7 @@ Please refer to pinctrl-bindings.txt in this director=
y for details of the
 common pinctrl bindings used by client devices, including the meaning =
of the
 phrase "pin configuration node".
=20
-The pin configuration nodes act as a container for an abitrary number =
of
+The pin configuration nodes act as a container for an arbitrary number=
 of
 subnodes. Each of these subnodes represents some desired configuration=
 for a
 pin, a group, or a list of pins or groups. This configuration can incl=
ude the
 mux function to select on those pin(s)/group(s), and various pin confi=
guration
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pin=
ctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinct=
rl.txt
index d2ea80dc43eb..e4d6a9d20f7d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.tx=
t
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.tx=
t
@@ -18,7 +18,7 @@ Please refer to pinctrl-bindings.txt in this director=
y for details of the
 common pinctrl bindings used by client devices, including the meaning =
of the
 phrase "pin configuration node".
=20
-Qualcomm's pin configuration nodes act as a container for an abitrary =
number of
+Qualcomm's pin configuration nodes act as a container for an arbitrary=
 number of
 subnodes. Each of these subnodes represents some desired configuration=
 for a
 pin, a group, or a list of pins or groups. This configuration can incl=
ude the
 mux function to select on those pin(s)/group(s), and various pin confi=
guration
--=20
2.1.3.1.ge241007

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
