From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Cleanup of -Wunused-const-variable in
 drivers/usb/host/xhci-tegra.c
Date: Thu, 13 Jun 2019 20:44:50 +0200
Message-ID: <20190613184450.GA896@kroah.com>
References: <CAJkfWY4nKwyPDh=MuCURst2SZceceeR2v3qrT9UY=VbvLnEmFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJkfWY4nKwyPDh=MuCURst2SZceceeR2v3qrT9UY=VbvLnEmFg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Huckleberry <nhuck@google.com>
Cc: treding@nvidia.com, mathias.nyman@intel.com, thierry.reding@gmail.com, jonathanh@nvidia.com, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
List-Id: linux-tegra@vger.kernel.org

On Thu, Jun 13, 2019 at 11:38:38AM -0700, Nathan Huckleberry wrote:
> Hey all,
> 
> I'm looking into cleaning up ignored warnings in the kernel so we can
> remove compiler flags to ignore warnings.
> 
> There's an unused variable ('mbox_cmd_name') in xhci-tegra.c. Looks
> like it was intended for logging or debugging, but never used. Just
> wanted to reach out to ask the best steps for cleaning this up.
> 
> If the variable is no longer needed I'd like to send a patch to remove it.

You never have to ask permission to send a patch :)
