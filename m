From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: tegra: roth: add display DT node
Date: Thu, 3 Jul 2014 12:10:56 +0900
Message-ID: <53B4C9C0.4000605@nvidia.com>
References: <1404303560-32209-1-git-send-email-acourbot@nvidia.com> <1404303560-32209-5-git-send-email-acourbot@nvidia.com> <53B42B60.1000600@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53B42B60.1000600-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/03/2014 12:55 AM, Stephen Warren wrote:
> On 07/02/2014 06:19 AM, Alexandre Courbot wrote:
>> DSI support has been fixed to support continuous clock behavior that the
>> panel used on SHIELD requires, so finally add its device tree node since
>> it is functional.
>
>> diff --git a/arch/arm/boot/dts/tegra114-roth.dts b/arch/arm/boot/dts/tegra114-roth.dts
>
>> +	host1x@50000000 {
>> +		dsi@54300000 {
>
> That node looks fine, but I wonder why we need to mark a bunch of
> regulators as always-on? shouldn't the references to vdd-supply and
> power-supply from this node be enough? If not, perhaps the tree
> structure of the regulators isn't correct, or the DSI or panel bindings
> don't allow enough regulators to be referenced?

regulator-always-on is indeed not needed for vdd_lcd. I actually had a 
patch in my tree removing this line that I forgot to squash. Will post a 
v2 for this patch that fixes this, thanks.

vdd-2v8-display needs to remain always-on however. Here we may hit a 
limitation of the simple-panel driver, where only one power supply can 
be provided.
