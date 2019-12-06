From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: stable request: 5.4.y: arm64: tegra: Fix 'active-low' warning
 for Jetson
Date: Fri, 6 Dec 2019 14:33:51 +0100
Message-ID: <20191206133351.GA2466@kroah.com>
References: <16724779-0514-ca92-58b2-95f4e244c6f7@nvidia.com>
 <20191206125334.GA1361962@kroah.com>
 <ee190492-5af8-7ef1-5524-4f260d64094d@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ee190492-5af8-7ef1-5524-4f260d64094d@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>
List-Id: linux-tegra@vger.kernel.org

On Fri, Dec 06, 2019 at 01:16:15PM +0000, Jon Hunter wrote:
> 
> On 06/12/2019 12:53, Greg Kroah-Hartman wrote:
> > On Fri, Dec 06, 2019 at 10:55:17AM +0000, Jon Hunter wrote:
> >> Hi Greg,
> >>
> >> Please can you include the following device-tree fixes for 5.4.y that
> >> are triggering some warnings on a couple of our Jetson platforms. This
> >> is currently causing one of our kernel warnings tests to fail. Both of
> >> these have now been merged into the mainline for v5.5-rc1.
> >>
> >> commit d440538e5f219900a9fc9d96fd10727b4d2b3c48
> >> Author: Jon Hunter <jonathanh@nvidia.com>
> >> Date:   Wed Sep 25 15:12:28 2019 +0100
> >>
> >>     arm64: tegra: Fix 'active-low' warning for Jetson Xavier regulator
> >>
> >> commit 1e5e929c009559bd7e898ac8e17a5d01037cb057
> >> Author: Jon Hunter <jonathanh@nvidia.com>
> >> Date:   Wed Sep 25 15:12:29 2019 +0100
> >>
> >>     arm64: tegra: Fix 'active-low' warning for Jetson TX1 regulator
> >>
> >> Thanks
> >> Jon
> > 
> > Now queued up, thanks.
> 
> Thanks. BTW were you also able to queue the following? This is another
> one that is needed for 5.4.y.
> 
> commit c745da8d4320c49e54662c0a8f7cb6b8204f44c4
> Author: Jon Hunter <jonathanh@nvidia.com>
> Date:   Fri Oct 11 09:34:59 2019 +0100
> 
>     mailbox: tegra: Fix superfluous IRQ error message

Now queued up, for some reason I thought I had done this already, sorry
about that.

greg k-h
