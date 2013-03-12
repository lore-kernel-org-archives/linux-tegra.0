From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/1 v2] ARM: dt: tegra114: add PWM nodes
Date: Tue, 12 Mar 2013 12:29:24 -0600
Message-ID: <513F7404.10303@wwwdotorg.org>
References: <1363045695-28874-1-git-send-email-achew@nvidia.com> <20130312112340.6d624df5dfe28c4b5b8157f5@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130312112340.6d624df5dfe28c4b5b8157f5-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/12/2013 03:23 AM, Hiroshi Doyu wrote:
> Hi Andrew,
> 
> On Tue, 12 Mar 2013 00:48:15 +0100
> Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> 
>> This patch adds device tree nodes for the four PWM controllers present
>> on Tegra114.

>> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi

>> +	pwm0: pwm@7000a000 {
>> +		compatible = "nvidia,tegra114-pwm", "nvidia,tegra20-pwm";
>> +		reg = <0x7000a000 0x4>;
>> +		#pwm-cells = <2>;
>> +		clocks = <&tegra_car 17>;
> 
> FYI:
> I'm sending out the patch(v4) to replace car magic # with macro[1].
> Then you could replace the above magic #s with macro names.
> 
> [1] http://patchwork.ozlabs.org/patch/220680/

Since the ground-work for dtc+cpp usage isn't complete yet, and it's
progress has been a little slow, I'm going to have all new DT nodes use
the existing numeric scheme, and put them into Tegra's for-3.10/dt
branch. Then, if we actually end up being able to convert to using
dtc+cpp in 3.10, I'll create a new branch based on that for the
conversion itself. Both you and I will need to rebase our conversion
patches on top of all the other DT additions at that time.
