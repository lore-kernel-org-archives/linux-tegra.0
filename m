From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v1 9/9] ARM: defconfig: tegra: Enable ChipIdea UDC driver
Date: Wed, 5 Jul 2017 14:33:03 -0600
Message-ID: <3fe1b3b2-6473-399a-807e-f007a10c05cd@wwwdotorg.org>
References: <cover.1499273075.git.digetx@gmail.com>
 <5eac9306f4049ba51ed8b7f53820d28f294725cb.1499273075.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5eac9306f4049ba51ed8b7f53820d28f294725cb.1499273075.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-GB
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/05/2017 11:19 AM, Dmitry Osipenko wrote:
> Since NVIDIA Tegra 20/30/40/TK1 are supported now by the ChipIdea driver,
> let's enable this driver in tegra_defconfig.

Shouldn't this patch be earlier in the series so that we don't 
completely break USB support between the patch which switches a port to 
the UDC driver and the UDC driver actually being built?
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
