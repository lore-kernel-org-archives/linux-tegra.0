From: Timur <timur.mehrvarz-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: ehci-tegra issue with deep sleep
Date: Tue, 11 Dec 2012 23:23:12 +0100
Message-ID: <50C7B250.7020409@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi. I discovered a problem with USB host mode on a Nexus 7 running 
Android 4.2.x: USB slave devices will become undetectable ("not 
accepting address xx, error -71") after the host goes through a deep 
sleep cycle (60+ seconds loss of external power; running on battery). In 
this situation the methods tegra_ehci_suspend() and tegra_ehci_resume() 
are being called. I am _not_ experiencing this issue at all, when the 
host only goes through a light sleep cycle (less than 20 seconds of 
power loss). During light sleep, the methods tegra_ehci_suspend() and 
tegra_ehci_resume() are _not_ being called.

The slave device (a USB DAC; many different products have been tested) 
is loosing power in both cases. But this does not seem to be the 
problem, because slave devices stays accessible, when the host (N7) only 
goes through light sleep.

Is anyone aware of this problem? Has it been fixed since 3.1.10?
Thank you.

Timur

Project on github:
http://mehrvarz.github.com/usb-host-mode-power-management-nexus7

Discussion: "Can you charge & USB Host mode simultaneously?"
http://rootzwiki.com/forum/512-nexus-7
