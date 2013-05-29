From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 09/12] tegra20-apb-dma: remove useless use of lock
Date: Wed, 29 May 2013 16:26:28 +0530
Message-ID: <51A5DEDC.4040606@nvidia.com>
References: <1369656882-25241-1-git-send-email-andriy.shevchenko@linux.intel.com> <1369656882-25241-10-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1369656882-25241-10-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <djbw@fb.com>, Stephen Warren <swarren@wwwdotorg.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Monday 27 May 2013 05:44 PM, Andy Shevchenko wrote:
> Accordingly to dma_cookie_status() description locking is not required.
>
I think we need lock here:
 From isr handler, we call dma_cookie_complete() which is in 
spin-locked. This function updates  tx->chan->completed_cookie = tx->cookie;
In tegra_dma_tx_status(), we check for dma_cookie_status() which access 
the chan->completed_cookie; and it decides status based on this

As the access of  chan->completed_cookie  are from different context, we 
need this locking.

But did not get why it is documented as locking is not require if shared 
variable is getting changed/access from different context simultaneously.
