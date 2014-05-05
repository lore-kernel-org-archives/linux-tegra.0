From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: HDMi out on Venice2
Date: Mon, 05 May 2014 15:16:07 -0600
Message-ID: <5367FF97.7030405@wwwdotorg.org>
References: <CAEUnVG6TcgJ+TB6r11Rsp=LNCvuRawLNXNdfCspF0JpHx1=M4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAEUnVG6TcgJ+TB6r11Rsp=LNCvuRawLNXNdfCspF0JpHx1=M4g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dylan Reid <dgreid-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/05/2014 01:07 PM, Dylan Reid wrote:
> Hi Thierry,
> 
> Did you have to make any user-space changes to test the HDMI output on
> Venice2?  I've got your recent patch series and see the hdmi device
> being probed but I haven't figured out how to get X to use it.  I'm
> using the sample rootfs that was posted for the Jetson board.

Personally, I would always suggest starting with ubuntu-core and then
installing extra packages (such as X) from the upstream Ubuntu repositories.
