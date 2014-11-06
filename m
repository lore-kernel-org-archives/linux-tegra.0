From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH] documentation: pinctrl bindings: Fix trivial typo 'abitrary'
Date: Thu, 06 Nov 2014 18:31:58 +0100
Message-ID: <545BB08E.8070607@suse.de>
References: <1415288331-785-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415288331-785-1-git-send-email-soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Jiri Kosina <trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am 06.11.2014 um 16:38 schrieb Soren Brinkmann:
> A misspelled 'arbitrary' propagated to quite a few locations in the D=
T
> binding documentation for pin-controllers. Fixing by:
>   git grep abitrary | cut -f1 -d: | xargs sed -i 's/abitrary/arbitrar=
y/'
>=20
> Reported-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
> Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
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

Reviewed-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>

Thanks,
Andreas

--=20
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 21284 AG N=C3=
=BCrnberg
