From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra DRM with HDMI support (\o/)
Date: Wed, 17 Oct 2012 09:32:49 +0800
Message-ID: <507E0AC1.8020001@nvidia.com>
References: <20121011200705.GB27599@avionic-0098.mockup.avionic-design.de> <1350375538.2332.31.camel@markz-hp6200> <507D856C.1070708@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <507D856C.1070708-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/17/2012 12:03 AM, Stephen Warren wrote:
> On 10/16/2012 02:18 AM, Mark Zhang wrote:
>> Hi,
>>
>> I've made this drm driver worked on Tegra 3(LVDS and HDMI both).
>> But the code that Thierry
>> hosts(git://gitorious.org/thierryreding/linux.git) doesn't work
>> directly. If you build and run it, you'll get a white blank screen on
>> Tegra 3. I didn't find the root cause but I think this is not caused by
>> drm driver itself(maybe the PCIE codes?). The main symptom is: some
>> regulators can't be inited all the time. I tried to build drm driver as
>> kernel module, after kernel booted, modprobe the drm driver, and you'll
>> find there are a lot of error prints like this:
>>
>> =========================================================
>> [   21.383529] reg-fixed-voltage 1.regulator: Failed to find supply vin
>> [   21.390299] reg-fixed-voltage 1.regulator: Failed to register
>> regulator: -517
>> [   21.397645] platform 1.regulator: Driver reg-fixed-voltage requests
>> probe deferral
>> [   21.405604] platform 2.regulator: Driver reg-fixed-voltage requests
>> probe deferral
>> =========================================================
>
> This is normal; it's probe deferral. You'll find that those regulators
> initialize correctly later. Hopefully tegra-drm handles this correctly,
> and passes that error code through as the result of its probe.
>

I don't think so. In normal scenario, the regulator will be inited 
correctly finally. But in the scenario I described above, these 
regulators will not be inited correctly all the time. Just as I 
mentioned above, I tried to build drm driver as kernel module, that 
means I will load drm driver after kernel booting finished. Besides, 
during the loading of drm driver, these regulator probe error were still 
be printed out. And I'm sure this is not the normal case.
