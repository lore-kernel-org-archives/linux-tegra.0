From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra DRM with HDMI support (\o/)
Date: Thu, 18 Oct 2012 14:04:37 +0800
Message-ID: <507F9BF5.20002@nvidia.com>
References: <20121011200705.GB27599@avionic-0098.mockup.avionic-design.de> <1350375538.2332.31.camel@markz-hp6200> <507D856C.1070708@wwwdotorg.org> <20121017054224.GA21783@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121017054224.GA21783-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/17/2012 01:42 PM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Tue, Oct 16, 2012 at 10:03:56AM -0600, Stephen Warren wrote:
>> On 10/16/2012 02:18 AM, Mark Zhang wrote:
>>> Hi,
>>>
>>> I've made this drm driver worked on Tegra 3(LVDS and HDMI both).
>>> But the code that Thierry
>>> hosts(git://gitorious.org/thierryreding/linux.git) doesn't work
>>> directly. If you build and run it, you'll get a white blank screen on
>>> Tegra 3. I didn't find the root cause but I think this is not caused by
>>> drm driver itself(maybe the PCIE codes?). The main symptom is: some
>>> regulators can't be inited all the time. I tried to build drm driver as
>>> kernel module, after kernel booted, modprobe the drm driver, and you'll
>>> find there are a lot of error prints like this:
>>>
>>> =========================================================
>>> [   21.383529] reg-fixed-voltage 1.regulator: Failed to find supply vin
>>> [   21.390299] reg-fixed-voltage 1.regulator: Failed to register
>>> regulator: -517
>>> [   21.397645] platform 1.regulator: Driver reg-fixed-voltage requests
>>> probe deferral
>>> [   21.405604] platform 2.regulator: Driver reg-fixed-voltage requests
>>> probe deferral
>>> =========================================================
>>
>> This is normal; it's probe deferral. You'll find that those regulators
>> initialize correctly later. Hopefully tegra-drm handles this correctly,
>> and passes that error code through as the result of its probe.
>
> I presume those regulators are for the vdd and pll supplies of the HDMI
> output? Those should be properly handled by the tegra_hdmi_probe()
> function. Also the way tegra-drm works right now, unless all of the
> outputs are registered properly the DRM portion will never even be
> initialized.
>

Not exactly. In hdmi driver, if I try to get/enable vdd & pll regulators 
which HDMI needs, error occurs. So currently to make HDMI working on 
Tegra 3, we need to temporarily remove these codes.
In fact, there are a lot of this kind of errors, I just pasted some of 
them. So there is something in your changes which blocks these 
regulators correctly inited cause this issue doesn't exist in upstream 
codes.

> Thierry
>
> * Unknown Key
> * 0x7F3EB3A1
>
