From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH] dma: tegra: assume CONFIG_OF
Date: Sun, 17 Feb 2013 20:37:35 +0530
Message-ID: <20130217150735.GK29960@intel.com>
References: <1360965237-14857-1-git-send-email-swarren@wwwdotorg.org>
 <CAA9_cme3e-VWFs+5o6g88dXmURsjojT08o9Cw+=r7=AfRKz5gQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAA9_cme3e-VWFs+5o6g88dXmURsjojT08o9Cw+=r7=AfRKz5gQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <djbw@fb.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 15, 2013 at 02:18:59PM -0800, Dan Williams wrote:
> On Fri, Feb 15, 2013 at 1:53 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> > From: Stephen Warren <swarren@nvidia.com>
> >
> > Tegra only supports, and always enables, device tree. Remove all ifdefs
> > and runtime checks for DT support from the driver.
> >
> > Signed-off-by: Stephen Warren <swarren@nvidia.com>
> 
> Acked-by: Dan Williams <djbw@fb.com>
> 
> ..adding Vinod.
I think it should assume CONFIG_DMA_OF?

--
~Vinod
