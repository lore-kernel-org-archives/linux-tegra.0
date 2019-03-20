From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 2/5] reset: Add acquired flag to
 of_reset_control_array_get()
Date: Wed, 20 Mar 2019 11:27:16 +0100
Message-ID: <1553077636.7071.3.camel@pengutronix.de>
References: <20190221152557.8534-1-thierry.reding@gmail.com>
         <20190221152557.8534-2-thierry.reding@gmail.com>
         <1553013476.6482.6.camel@pengutronix.de> <87tvfyujgp.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87tvfyujgp.fsf@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, 2019-03-20 at 08:51 +0200, Felipe Balbi wrote:
> Philipp Zabel <p.zabel@pengutronix.de> writes:
[...]
> > Felipe, could I get your acked-by to merge this through the reset tree?
> > 
> > dwc3-of-simple is a bit of a special case because it calls
> > of_reset_control_array_get directly instead of through the
> > of_reset_control_array_get_shared/exclusive wrappers.
> 
> Sure thing:
> 
> Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>

Thank you, I've added patches 1-3 to reset/next and named a stable
branch that could be used as a dependency for patches 4-5:

  git://git.pengutronix.de/pza/linux reset/acquire

regards
Philipp
