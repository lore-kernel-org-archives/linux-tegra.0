From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 3/5] ARM: dt: tegra: add ADT7461 temperature sensor to
 paz00 device tree
Date: Wed, 1 Feb 2012 00:26:04 -0800
Message-ID: <20120201082604.GL7399@quad.lixom.net>
References: <cover.1327776641.git.marvin24@gmx.de>
 <58e24ac63a8388bb9de6be0e75cea26a1af99195.1327776641.git.marvin24@gmx.de>
 <74CDBE0F657A3D45AFBB94109FB122FF178E12414D@HQMAIL01.nvidia.com>
 <9421201.72pNsFM5zn@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9421201.72pNsFM5zn@ax5200p>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 31, 2012 at 07:53:21PM +0100, Marc Dietrich wrote:
> Add the ADT7461 temperature monitoring IC which is connected via
> the DVC controller.
> 
> Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra-paz00.dts |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/tegra-paz00.dts b/arch/arm/boot/dts/tegra-
> paz00.dts
> index f667343..81e1d30 100644
> --- a/arch/arm/boot/dts/tegra-paz00.dts
> +++ b/arch/arm/boot/dts/tegra-paz00.dts
> @@ -35,6 +35,11 @@
>  
>         i2c@7000d000 {
>                 clock-frequency = <400000>;
> +
> +               adt7461@4c {
> +                       compatible = "adi,adt7461";
> +                       reg = <0x4c>;
> +               };

It's common to name the device node temp-sensor (or temperature-sensor) instead
of the model of the actual chip. The name isn't significant for the binding,
but it's a practice that's been used on other platforms for a long time.

I'll just fix it up when applying, if ok with you. No need to respin just for
this.


-Olof
