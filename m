From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2 2/3] USB: ehci-tegra: fix inefficient copy of unaligned
 buffers
Date: Thu, 23 Apr 2015 14:32:26 -0600
Message-ID: <553956DA.2090300@wwwdotorg.org>
References: <1429798012-21916-1-git-send-email-johan@kernel.org> <1429798012-21916-3-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429798012-21916-3-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04/23/2015 08:06 AM, Johan Hovold wrote:
> Make sure only to copy any actual data rather than the whole buffer,
> when releasing the temporary buffer used for unaligned non-isochronous
> transfers.
>
> Compile-tested only.

Tested-by: Stephen Warren <swarren@nvidia.com>

(Tested a USB network device attached to Jetson TK1, with a large 
download, and ping packets of various sizes from another host)
