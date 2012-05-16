From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: dt: tegra20.dtsi: Add Memory Controller(MC) nodes
Date: Tue, 15 May 2012 23:35:02 -0700
Message-ID: <CAOesGMiPvw72006zpSGLBNi-C12MTc_w2QmOPg6YTfXMW+ZSkQ@mail.gmail.com>
References: <1336635764-30597-1-git-send-email-hdoyu@nvidia.com>
	<1336635764-30597-2-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1336635764-30597-2-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

Tiny drive-by nit pick.

On Thu, May 10, 2012 at 12:42 AM, Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote=
:
> Add Tegra MC(Memory Controller) nodes for tegra20.dtsi.
>
> Signed-off-by: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> =A0arch/arm/boot/dts/tegra20.dtsi | =A0 =A07 +++++++
> =A01 files changed, 7 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra=
20.dtsi
> index 24129fb..548b42e 100644
> --- a/arch/arm/boot/dts/tegra20.dtsi
> +++ b/arch/arm/boot/dts/tegra20.dtsi
> @@ -211,5 +211,12 @@
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "nvidia,tegra20-ahb";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0x6000c004 0x10c>; /* AHB Arb=
itration + Gizmo Controller */
> =A0 =A0 =A0 =A0};
> +
> + =A0 =A0 =A0 mc {

It's common to use a more plain english name here, so
"memory-controller" would be a good name.



-Olof
