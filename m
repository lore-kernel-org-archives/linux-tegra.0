From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: unhandled interrupt from otg port
Date: Tue, 19 Feb 2013 10:03:47 -0700
Message-ID: <5123B073.7060005@wwwdotorg.org>
References: <1978166.seipGZS4QH@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1978166.seipGZS4QH@ax5200p>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/17/2013 04:48 AM, Marc Dietrich wrote:
> Hi,
> 
> I sometimes see unhandled irq from the otg port on my AC100 (kernel 3.8.0-rc7).
> This happens randomly when the a cable is pluged into the mini usb port. Seems
> the port generates an interrupt on probe which isn't handled.

Perhaps Venu can explain this; he is our USB expert.

> Any ideas?

I'm slightly confused by your description though; I assume this problem
happens when you boot with a USB cable already plugged in, not when you
first boot the system, then plug in a cable? Is the cable connected to a
host PC, or to a device?
