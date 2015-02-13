From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: DSI panel not working on -next
Date: Fri, 13 Feb 2015 19:18:11 +0900
Message-ID: <54DDCF63.7040208@nvidia.com>
References: <54DD99B5.2080504@nvidia.com> <20150213095516.GA17888@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150213095516.GA17888-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/13/2015 06:55 PM, Thierry Reding wrote:
> On Fri, Feb 13, 2015 at 03:29:09PM +0900, Alexandre Courbot wrote:
>> Hi Thierry,
>>
>> I noticed that the DSI panel of SHIELD (tegra114-roth) was not brought up on
>> -next. I have bisected the following commit as introducing that behavior:
>>
>> commit f4c5cf88fbd50e4779042268947b2e2f90c20484
>> Author: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Date:   Thu Dec 18 15:29:14 2014 +0100
>>
>>      gpu: host1x: Provide a proper struct bus_type
>>
>>
>> With and without this patch, the DSI panel is probed, but the stack trace in
>> the probe() function is different:
>
> This shouldn't make much of a difference, really, since we're attaching
> to the panel only during mipi_dsi_host_register() anyway. And the panel
> device can't exist earlier than that because mipi_dsi_host_register()
> will instantiate it. Still...
>
>> i.e. with f4c5cf88fbd, the panel is not probed from tegra_dsi_probe()
>> anymore, which means DSI remains without a valid connector:
>>
>> [    1.378513] [drm] Initialized drm 1.1.0 20060810
>> [    1.384564] 54300000.dsi supply avdd-dsi-csi not found, using dummy
>> regulator
>> [    1.396394] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
>> [    1.403021] [drm] No driver support for vblank timestamp query.
>> [    1.409080] drm drm: No connectors reported connected with modes
>> [    1.415128] [drm] Cannot find any crtc or sizes - going 1024x768
>
> ... the failing log here does indicate that there is no panel, so I'll
> need to investigate why that's happening.
>
>> Are you aware of this? Does it affect other DSI panels? Does SHIELD's DT
>> need an update of some sort?
>
> I'm almost certain that I've tested this on at least Dalmore and I don't
> see any differences that could be causing this. I'll look into it.

Thanks - please don't hesitate to ask me to run some more tests (or just 
to try and fix it by myself) if this can save you time.
