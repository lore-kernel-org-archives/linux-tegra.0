From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] arm/dt: tegra devicetree support
Date: Tue, 19 Jul 2011 16:56:46 -0700
Message-ID: <CAOesGMiy1t-98KZ_imFkGO-ify3S_00d_0XKc2vcLNRekxOvpw@mail.gmail.com>
References: <20110719234158.2779.15394.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110719234158.2779.15394.stgit@ponder>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Nice!


On Tue, Jul 19, 2011 at 4:43 PM, Grant Likely <grant.likely@secretlab.c=
a> wrote:
> Everything required to populate NVIDIA Tegra devices from the device
> tree. =A0This patch adds a new DT_MACHINE_DESC() which matches agains=
t
> a tegra20 device tree. =A0So far it only registers the on-chip device=
s,
> but it will be refined in follow on patches to configure clocks and
> pin IO from the device tree also.
>
> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org


Minor nit:

> +++ b/arch/arm/boot/dts/tegra20.dtsi
> @@ -0,0 +1,148 @@
> +/include/ "skeleton.dtsi"
> +
> +/ {
> + =A0 =A0 =A0 model =3D "NVIDIA Tegra 250";

NVIDIA Tegra2 or Tegra20 to be more in line with the recent 250->20
conversion (and Harmony)
