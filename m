From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] usb: chipidea: tegra: fix hardlock with invalid dr mode
Date: Mon, 27 Jan 2020 08:17:58 +0100
Message-ID: <20200127071758.GD279449@kroah.com>
References: <20200127023548.27107-1-pgwipeout@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200127023548.27107-1-pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Jan 26, 2020 at 09:35:48PM -0500, Peter Geis wrote:
> The ci_hdrc_tegra driver does not currently support dual role mode, but
> it does not explicitly prevent its use.
> Certain devices support dual role mode, but not automatic role switch.
> This can cause the device to lock up during initialization of the
> driver.
> 
> Detect this state by checking for the extcon phandle when dual role mode
> is set to otg.
> If it doesn't exist request the driver to only enable manual role
> switching.
> 
> Fixes: dfebb5f ("usb: chipidea: Add support for Tegra20/30/114/124")

Please use 12 digits for kernel sha1 values, this should be:
Fixes: dfebb5f43a78 ("usb: chipidea: Add support for Tegra20/30/114/124")

As proof of the need of this, just using the values you gave here causes
git to complain:

$ git show dfebb5f
error: short SHA1 dfebb5f is ambiguous
hint: The candidates are:
hint:   dfebb5f43a78 commit 2017-08-16 - usb: chipidea: Add support for Tegra20/30/114/124
hint:   dfebb5fec744 tree
fatal: ambiguous argument 'dfebb5f': unknown revision or path not in the working tree.

thanks,

greg k-h
