From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 2/2] USB: ehci-tegra: fix inefficient copy of unaligned
 buffers
Date: Tue, 7 Apr 2015 11:30:15 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1504071127210.1430-100000@iolanthe.rowland.org>
References: <1428400012-7563-3-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1428400012-7563-3-git-send-email-johan@kernel.org>
Sender: stable-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org, stable <stable@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 7 Apr 2015, Johan Hovold wrote:

> Make sure only to copy any actual data rather than the whole buffer,
> when releasing the temporary buffer used for unaligned transfer buffers.
> 
> Note that the corresponding fix of musb also fixes a lockup on
> disconnect, where repeated failed transfers would starve the hub
> workqueue from processing the disconnect, which would have prevented the
> urbs from being resubmitted. In this case there is no data to forward,
> but the full buffer length was being copied nonetheless.

This is wrong for isochronous transfers, because the transfer data
generally isn't contiguous in memory.

It would be okay to do this for other transfer types, though.

Alan Stern
