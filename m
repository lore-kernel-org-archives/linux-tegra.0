From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v1 8/9] ARM: tegra: Enable UDC on AC100
Date: Thu, 6 Jul 2017 10:38:35 -0600
Message-ID: <402c57db-a01b-33eb-28d4-7f4b372351f2@wwwdotorg.org>
References: <cover.1499273075.git.digetx@gmail.com>
 <a0923f46a14c27afd7d2595dfb8878c2ebf02230.1499273075.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a0923f46a14c27afd7d2595dfb8878c2ebf02230.1499273075.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/05/2017 11:19 AM, Dmitry Osipenko wrote:
> Override the compatible string of the first USB controller to enable
> device mode.

> diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts

>   	usb@c5000000 {
> +		compatible = "nvidia,tegra20-udc";
>   		status = "okay";
> +		dr_mode = "otg";
>   	};

This port is the only external USB port on the AC100. I'm not sure it's 
a good idea to reconfigure it so it can only work in device mode, 
although given that display, keyboard, and mouse are built-in to this 
device, perhaps this change is merely unexpected rather than 
catastrophic to a user, since they can recover via the keyboard/display. 
Let's drop this patch until OTG mode is actually implemented.
