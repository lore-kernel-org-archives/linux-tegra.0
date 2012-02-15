From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/2] i2c: tegra: Remove unnecessary clk_get
Date: Wed, 15 Feb 2012 10:43:41 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF178FACB8BA@HQMAIL01.nvidia.com>
References: <1328314217-16632-1-git-send-email-swarren@nvidia.com>
	<4F2D1400.5050907@nvidia.com>
	<74CDBE0F657A3D45AFBB94109FB122FF178E5D3162@HQMAIL01.nvidia.com>
 <CAPnjgZ2r1+tSiiKg0rHH_atrLVqn6h+7ueMdtcmaRYtkdXiTRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPnjgZ2r1+tSiiKg0rHH_atrLVqn6h+7ueMdtcmaRYtkdXiTRw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Simon Glass wrote at Saturday, February 04, 2012 11:03 PM:
> On Sat, Feb 4, 2012 at 9:51 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > Laxman Dewangan wrote at Saturday, February 04, 2012 4:18 AM
> >> On Saturday 04 February 2012 05:40 AM, Stephen Warren wrote:
> >> > From: Laxman Dewangan<ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> >
> >> > The clock table has just one entry for a given i2c controller.
> >> > Hence, the second clk_get is not required in the driver.
> >> >
> >> > Originally by Laxman Dewangan<ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, but S-o-b is
> >> > missing in our internal repo.
> >> >
> >> > [swarren: Reworded commit description, resolved merge issue when cherry-
> >> > picking to mainline]
> >> > Signed-off-by: Stephen Warren<swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > Ben, Wolfram. The two changes in this patch series are completely
> > independent. The 2nd patch is what I really care about, and can be
> > applied irrespective of the resolution of the discussion below.
> >
> >> The tegra i2c controller have two clock inputs i2c_div and i2c_fast_clk.
> >
> > Is this true on Tegra20 or just Tegra30? The Tegra20 TRM explicitly lists
> > the clock domains the I2C controller users, and doesn't mention anything
> > about this...
> 
> As I happened to be looking at this on Friday, it seems that Tegra20
> supports the fast I2C also. I couldn't quite see how to select the
> fast clock, but since I wasn't planning to support it I didn't mind.
> From what I could tell, the slow clock can switch between four options
> and the fast clock is fixed at 72MHz (based off PLLP), as below.

OK, I've found the location in the TRM that describes this additional
clock input to a few modules. It's in the CAR (Clock And Reset) controller
section in a couple places, e.g. Table 12 "PLL Clock Usage" and in a
section "Special PLL clock usage by certain peripheral" (in version v01p
at least).

So yes, let's not apply this one patch.

Simon, the upshot of this is that when you add the clocks property to
the I2C nodes, you'll need to add both the regular variable I2C clock
and this other clock to the list:

clocks = <&tegra_car 12> /* i2c1 */ <&tegra_car 124> /* pll_p_out3 */;

I suggest listing the regular clock first for simplicity in U-Boot's
parsing of the property (so the first clock is always the one with a
bit in the CLK_ENB registers) and these additional clocks after, as I
have above.

This appears to apply to modules lfsr, dsi, csi, i2c1/2/3, uart1/2/3/4/5,
but apparently not the DVC I2C controller according to the TRM. Laxman,
can you confirm that the DVC I2C controller doesn't take a clock from
pll_p_out3?

P.S. this patch I posted is in our downstream 2.6.39 and 3.1 kernels.
Given this thread, I assume it should be reverted there...

Thanks.

-- 
nvpublic
