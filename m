From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: xhci: remove the code build warning
Date: Tue, 5 Jun 2018 10:40:19 +0200
Message-ID: <20180605084019.GA8665@kroah.com>
References: <1528216500-14172-1-git-send-email-gengdongjiu@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1528216500-14172-1-git-send-email-gengdongjiu@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dongjiu Geng <gengdongjiu@huawei.com>
Cc: mathias.nyman@intel.com, thierry.reding@gmail.com, jonathanh@nvidia.com, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 06, 2018 at 12:35:00AM +0800, Dongjiu Geng wrote:
> Initialize the 'err' variate to remove the build warning,
> the warning is shown as below:
> 
> drivers/usb/host/xhci-tegra.c: In function ‘tegra_xusb_mbox_thread’:
> drivers/usb/host/xhci-tegra.c:552:6: warning: ‘err’ may be used uninitialized in this function [-Wuninitialized]
> drivers/usb/host/xhci-tegra.c:482:6: note: ‘err’ was declared here
> 
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---

Any hint as to what commit caused this warning to show up?

thanks,

greg k-h
