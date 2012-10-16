From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Tegra DRM with HDMI support (\o/)
Date: Tue, 16 Oct 2012 10:03:56 -0600
Message-ID: <507D856C.1070708@wwwdotorg.org>
References: <20121011200705.GB27599@avionic-0098.mockup.avionic-design.de> <1350375538.2332.31.camel@markz-hp6200>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1350375538.2332.31.camel@markz-hp6200>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/16/2012 02:18 AM, Mark Zhang wrote:
> Hi, 
> 
> I've made this drm driver worked on Tegra 3(LVDS and HDMI both).
> But the code that Thierry
> hosts(git://gitorious.org/thierryreding/linux.git) doesn't work
> directly. If you build and run it, you'll get a white blank screen on
> Tegra 3. I didn't find the root cause but I think this is not caused by
> drm driver itself(maybe the PCIE codes?). The main symptom is: some
> regulators can't be inited all the time. I tried to build drm driver as
> kernel module, after kernel booted, modprobe the drm driver, and you'll
> find there are a lot of error prints like this:
> 
> =========================================================
> [   21.383529] reg-fixed-voltage 1.regulator: Failed to find supply vin
> [   21.390299] reg-fixed-voltage 1.regulator: Failed to register
> regulator: -517
> [   21.397645] platform 1.regulator: Driver reg-fixed-voltage requests
> probe deferral
> [   21.405604] platform 2.regulator: Driver reg-fixed-voltage requests
> probe deferral
> =========================================================

This is normal; it's probe deferral. You'll find that those regulators
initialize correctly later. Hopefully tegra-drm handles this correctly,
and passes that error code through as the result of its probe.
