From: Greg KH <gregkh@suse.de>
Subject: Re: [PATCH 0/2] tty/serial: Add PORT_TEGRA, fix break handling for it
Date: Tue, 17 May 2011 12:38:36 -0700
Message-ID: <20110517193836.GA6912@suse.de>
References: <1305660466-4704-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-serial-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1305660466-4704-1-git-send-email-swarren@nvidia.com>
Sender: linux-serial-owner@vger.kernel.org
To: Stephen Warren <swarren@nvidia.com>
Cc: ldewangan@nvidia.com, linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, May 17, 2011 at 01:27:44PM -0600, Stephen Warren wrote:
> 8250.c needs a specific PORT_TEGRA type for two reasons:
> * RTOIE bit needs to be set, but UUE is reserved, so split RTOIE handling
>   out of PORT_XSCALE.
> * A WAR is needed for break reception.
> 
> I'd like to get the first of these two patches merged into the tegra
> arch for-next branch, so that I can modify the board files to explicitly
> request the new port type rather than relying on auto-detection. As such,
> could you please create a branch for that/these changes, then merge it
> into tty-2.6.git, so that the same branch can be merged into Tegra's
> for-next branch. Thanks.

No, I really don't want to create a separate branch for just 2 patches,
a whole 43 lines modified, that's pretty useless.

If Alan acks these, I'll be glad to take them through the serial tree as
normal, or you can take them through the tegra tree.

Either way, they need Alan's review first.

thanks,

greg k-h
