From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC 0/2] Enable USB support for Venice2
Date: Tue, 25 Feb 2014 15:23:34 -0700
Message-ID: <530D17E6.2000905@wwwdotorg.org>
References: <1393364160-28253-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393364160-28253-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/25/2014 02:35 PM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Hi,
> 
> These two patches add the USB controllers to Tegra124 and enable them on
> Venice2, wiring them up with the corresponding regulators.
> 
> Unfortunately the USB1 VBUS regulator seems to be causing problems once
> enabled, causing none of the USB ports to work properly. Commenting out
> the gpio property for that regulator fixes things for me and I can use
> the webcam connected to USB2 as well as any of the peripherals on USB3.
> 
> Since GPIO N.04 isn't connected to anything else, I don't understand how
> it could possibly influence any of the other USB busses. I wonder if
> perhaps this is caused by defect hardware, so it would be good if
> somebody could test this on a different Venice2.

I see the same behaviour as you.
