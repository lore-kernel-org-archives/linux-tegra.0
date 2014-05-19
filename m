From: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH 00/10] Tegra XHCI support
Date: Mon, 19 May 2014 16:38:17 +0300
Message-ID: <537A0949.1050509@nvidia.com>
References: <1400113986-339-1-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400113986-339-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: public-linux-tegra-u79uwXL29TY76Z2rM5mHXA-wOFGN7rlS/M9smdsby/KFg@public.gmane.org
List-Id: linux-tegra@vger.kernel.org




On 15/05/14 03:32, Andrew Bresticker wrote:
 > This is a first pass at the host and PHY drivers necessary for USB3.0
 > support on Tegra114 and Tegra124.  The Tegra XHCI host controller 
requires
 > external firmware [1] which must be loaded before using any USB ports 
owned
 > by the controller.  The XUSB PHY driver handles mapping and enabling of
 > the UTMI, HSIC, and SuperSpeed pads to the XHCI controller.
 >
 > Tested on a Venice2 with a variety of USB2.0 and USB3.0 memory sticks
 > and ethernet dongles.
 >

On Jetson-TK1 I can get USB2 devices to work but the USB3 device I 
tested (JMS539 SuperSpeed SATA II 3.0G  Bridge) just falls back to
USB2, I wonder if some additional configuration is needed there.

[   24.349565] usb 1-3: new high-speed USB device number 3 using xhci-hcd

-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
