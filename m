From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: paz00: Add host1x support
Date: Fri, 16 Nov 2012 15:38:02 -0700
Message-ID: <50A6C04A.8090407@wwwdotorg.org>
References: <ae44d3c1f4ceecb0f6a486d569608eec3c892ba1.1353104179.git.marvin24@gmx.de> <20121116223510.GA21755@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121116223510.GA21755-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/16/2012 03:35 PM, Thierry Reding wrote:
> On Fri, Nov 16, 2012 at 11:20:55PM +0100, Marc Dietrich wrote:
>> This adds host1x support which includes HDMI and LVDS support.

>> diff --git a/arch/arm/boot/dts/tegra20-paz00.dts
>> b/arch/arm/boot/dts/tegra20-paz00.dts

>> -	i2c@7000c000 { +	lvds_ddc: i2c@7000c000 { status = "okay"; 
>> clock-frequency = <400000>;
> 
> You might want to change this to 100 kHz as well. I think some
> displays don't like fast mode. Then again, if you've verified that
> this works on AC100 I suppose it can just as well stay as is.
> 
> On a side-note, I've found that Tegra doesn't do proper 400 kHz
> either, but rather something like 375 kHz. Stephen, is this a known
> issue or is it actually supposed to be able to do exactly 400 kHz?

400KHz is the maximum clock per fast mode spec. The bus should work
anywhere down to 0Hz without issue. The fact we don't hit 400KHz is
most likely simply due to granularity of the clock divider for the I2C
block, combined with whatever rate the parent runs at.
