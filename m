From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 00/10] usb: phy: cleanups to Kconfig and directories
Date: Thu, 7 Mar 2013 11:01:47 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1303071101190.1646-100000@iolanthe.rowland.org>
References: <1362648969-13737-1-git-send-email-balbi@ti.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1362648969-13737-1-git-send-email-balbi@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, cbou@mail.ru, dwmw2@infradead.org, swarren@wwwdotorg.org, arnd@arndb.de, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, 7 Mar 2013, Felipe Balbi wrote:

> Hi folks,
> 
> inspired by Paul's DWC2 patchset which added usb_otg_state_string()
> (a copy of otg_state_string()) I have now renamed otg_state_string()
> to usb_otg_state_string(), moved it to usb-common, then moved all
> phy drivers to drivers/usb/phy/ and completely deleted the otg directory.
> 
> We're also removing CONFIG_USB_OTG_UTILS since that has lots its
> meaning long ago.
> 
> I have compiled all patches with allyes, allno and allmod configs,
> but please make sure to test on your platforms to make sure we're
> not leaking any more problems to mainline.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

for the EHCI changes.

