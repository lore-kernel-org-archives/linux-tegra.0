From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: NVIDIA Tegra DDX
Date: Mon, 10 Dec 2012 09:55:09 -0700
Message-ID: <50C613ED.4070401@wwwdotorg.org>
References: <20121210105627.GA7503@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121210105627.GA7503-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/10/2012 03:56 AM, Thierry Reding wrote:
...
> Aaron had some reservations about calling this xf86-video-tegra
> because it will clash with the binary tegra_drv.so provided by
> NVIDIA. However I couldn't come up with anything more creative.
> Distributions will have to deal with this in some way or another
> anyway and there really isn't a way of running both drivers on top
> of the same kernel currently, so I decided not to care.

Why not xf86-video-tegradrm, since tegradrm is the kernel driver it
talks to. It'd also help make it more obvious which user-space driver
to pick based on the kernel driver.
