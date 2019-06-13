From: Nathan Huckleberry <nhuck@google.com>
Subject: Cleanup of -Wunused-const-variable in drivers/usb/host/xhci-tegra.c
Date: Thu, 13 Jun 2019 11:38:38 -0700
Message-ID: <CAJkfWY4nKwyPDh=MuCURst2SZceceeR2v3qrT9UY=VbvLnEmFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: treding@nvidia.com, mathias.nyman@intel.com, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
List-Id: linux-tegra@vger.kernel.org

Hey all,

I'm looking into cleaning up ignored warnings in the kernel so we can
remove compiler flags to ignore warnings.

There's an unused variable ('mbox_cmd_name') in xhci-tegra.c. Looks
like it was intended for logging or debugging, but never used. Just
wanted to reach out to ask the best steps for cleaning this up.

If the variable is no longer needed I'd like to send a patch to remove it.

https://github.com/ClangBuiltLinux/linux/issues/533

Thanks,
Nathan Huckleberry
