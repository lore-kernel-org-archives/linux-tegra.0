From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: Question about "missing" tegra features
Date: Thu, 03 Jul 2014 09:41:16 +0200
Message-ID: <1438574.hj9VjvJZ8S@fb07-iapwap2>
References: <c3a33a3d722302b1f4d877649d485d2f@webmail-alfa3028.alfahosting-server.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c3a33a3d722302b1f4d877649d485d2f-n3SY6/QrmYUdxdNa7N5bz2CGZHFJa5fA29i0knmqyyNx9qoA87EPLA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Leitner <me-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Richard,

Am Donnerstag, 3. Juli 2014, 09:11:39 schrieben Sie:
> Hello folks,
> I've a general question regarding the linux-tegra development:
> Why are there tegra features which are available in NVIDIA's kernel tree
> [1], but not included in mainline (or at least your tegra tree)?
> I've just noticed that for the USB device controller
> (drivers/usb/gadget/tegra_udc.{c,h}), but it seems there are more such
> "cases".

without being a NV fellow, I guess it's just a lag of developer resources. My 
feeling is that NV releases new SoC versions faster than they can add mainline 
support for it, especially for hw blocks which are seldom used.

On the other hand, you are free to forward port drivers you miss and submit 
them here. But still then someone has to maintain them.

> Is there any documentation on what is supported/included in mainline
> already and what not?

Maybe it's time to add this information to some wiki, e.g. 
http://elinux.org/Tegra

Marc
