From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 9/9] ARM: defconfig: tegra: Enable ChipIdea UDC driver
Date: Thu, 6 Jul 2017 01:57:00 +0300
Message-ID: <a0cfddf8-91dd-a6d8-2ffc-9e57738dc2c4@gmail.com>
References: <cover.1499273075.git.digetx@gmail.com>
 <5eac9306f4049ba51ed8b7f53820d28f294725cb.1499273075.git.digetx@gmail.com>
 <3fe1b3b2-6473-399a-807e-f007a10c05cd@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3fe1b3b2-6473-399a-807e-f007a10c05cd-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05.07.2017 23:33, Stephen Warren wrote:
> On 07/05/2017 11:19 AM, Dmitry Osipenko wrote:
>> Since NVIDIA Tegra 20/30/40/TK1 are supported now by the ChipIdea driver,
>> let's enable this driver in tegra_defconfig.
> 
> Shouldn't this patch be earlier in the series so that we don't completely break
> USB support between the patch which switches a port to the UDC driver and the
> UDC driver actually being built?

I assume that host mode doesn't work at all on AC100 / TrimSlice. Otherwise this
patch should be earlier in the series only if we agree that it should be okay to
switch those devices to the UDC driver.

-- 
Dmitry
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
