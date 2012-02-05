From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/2] i2c: tegra: Remove unnecessary clk_get
Date: Sat, 4 Feb 2012 22:02:41 -0800
Message-ID: <CAPnjgZ2r1+tSiiKg0rHH_atrLVqn6h+7ueMdtcmaRYtkdXiTRw@mail.gmail.com>
References: <1328314217-16632-1-git-send-email-swarren@nvidia.com>
	<4F2D1400.5050907@nvidia.com>
	<74CDBE0F657A3D45AFBB94109FB122FF178E5D3162@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF178E5D3162-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

On Sat, Feb 4, 2012 at 9:51 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:
> Laxman Dewangan wrote at Saturday, February 04, 2012 4:18 AM
>> On Saturday 04 February 2012 05:40 AM, Stephen Warren wrote:
>> > From: Laxman Dewangan<ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> >
>> > The clock table has just one entry for a given i2c controller.
>> > Hence, the second clk_get is not required in the driver.
>> >
>> > Originally by Laxman Dewangan<ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, but S-o-b is
>> > missing in our internal repo.
>> >
>> > [swarren: Reworded commit description, resolved merge issue when c=
herry-
>> > picking to mainline]
>> > Signed-off-by: Stephen Warren<swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Ben, Wolfram. The two changes in this patch series are completely
> independent. The 2nd patch is what I really care about, and can be
> applied irrespective of the resolution of the discussion below.
>
>> The tegra i2c controller have two clock inputs i2c_div and i2c_fast_=
clk.
>
> Is this true on Tegra20 or just Tegra30? The Tegra20 TRM explicitly l=
ists
> the clock domains the I2C controller users, and doesn't mention anyth=
ing
> about this...

As I happened to be looking at this on Friday, it seems that Tegra20
supports the fast I2C also. I couldn't quite see how to select the
fast clock, but since I wasn't planning to support it I didn't mind.
=46rom what I could tell, the slow clock can switch between four option=
s
and the fast clock is fixed at 72MHz (based off PLLP), as below.

>
>> There is way to select the clock source for i2c_div clock but
>> i2c_fast_clk is fixed to PLLP_OUT3 clock source.
>> Both clocks are needed to proper functionality. This change assume t=
hat
>> fast-clk (pllp_out3) is always be ON which is wrong assumption. For
>
> That's not something this change assumes; the assumption was already
> there. The two clk_get() calls in the I2C driver today end up getting
> the same clock I believe, since there is only a single clock listed i=
n
> tegra2_clock.c for the I2C controller.
>
>> aggressive power management, if there is no client for pllp_out3, it
>> will be turned off. And so this is require.
>>
>> However, the code enable fast_clk always once it is registered which=
 is
>> also not correct. The div_clk and fast_clk should be enable together=
 and
>> diable together and so driver need to call the clk_enable(div_clk) a=
nd
>> clk_enable(fast_clk) for enabling clock. We have fixed this in our
>> internal tree (K3.1). Let me know if I can help here.:
>
> The K3.1 tree is where I got this change from, although I did notice
> that there were some other changes in that tree to implement the more
> aggressive clock management you described.
>
> If I'm not making sense, We should probably continue this discussion
> off-list (just between ourselves) so as to avoid spamming the mailing
> list; I can summarize any results for the list archive later.


Regards,
Simon

>
> --
> nvpublic
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
