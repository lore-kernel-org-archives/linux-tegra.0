From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 0/3] Tegra USB probe order issue fix
Date: Wed, 2 Jul 2014 10:02:32 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1407021001290.874-100000@iolanthe.rowland.org>
References: <1404248923-21086-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1404248923-21086-1-git-send-email-ttynkkynen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Warren <swarren@wwwdotorg.org>, Felipe Balbi <balbi@ti.com>, Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, tuomas.tynkkynen@iki.fi
List-Id: linux-tegra@vger.kernel.org

On Wed, 2 Jul 2014, Tuomas Tynkkynen wrote:

> Hi all,
> 
> This series fixes a probe order issue with the Tegra EHCI driver.
> Basically, the register area of the 1st USB controller contains some
> registers that are global to all of the controllers, but that are also
> cleared when reset is asserted to the 1st controller. So if (say) the
> 3rd controller would be the first one to finish probing successfully,
> then the reset that happens during the 1st controller's probe would
> result in broken USB. So the before doing anything with the USB HW,
> we should reset the 1st controller once, and then never ever reset
> it again.

This sounds very much like the sort of thing that ought to be described 
in DT.  It is a hardware dependence, and DT exists for the purpose of 
describing the hardware.

Alan Stern
