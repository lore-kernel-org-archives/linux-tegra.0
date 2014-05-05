From: Dylan Reid <dgreid-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: HDMi out on Venice2
Date: Mon, 5 May 2014 12:07:51 -0700
Message-ID: <CAEUnVG6TcgJ+TB6r11Rsp=LNCvuRawLNXNdfCspF0JpHx1=M4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

Did you have to make any user-space changes to test the HDMI output on
Venice2?  I've got your recent patch series and see the hdmi device
being probed but I haven't figured out how to get X to use it.  I'm
using the sample rootfs that was posted for the Jetson board.

My goal is to be able to test the hdmi audio changes on this as well
as our downstream kernel.

Thanks,

Dylan
