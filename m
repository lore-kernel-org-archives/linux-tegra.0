From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: stable request: 4.4.y: mfd: as3722 fixes
Date: Thu, 21 Feb 2019 13:25:54 +0100
Message-ID: <20190221122554.GC12382@kroah.com>
References: <73c4230f-d9dc-af2d-398c-15cdfaf8628e@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <73c4230f-d9dc-af2d-398c-15cdfaf8628e@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: stable@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee.jones@linaro.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 18, 2019 at 03:10:20PM +0000, Jon Hunter wrote:
> Hi Greg,
> 
> During suspend testing with stable v4.4.y on the Tegra124 Jetson TK1
> board, I was able to reproduce an issue with the as3722 PMIC that is
> fixed by the following commit ...
> 
> commit 35deff7eb212b661b32177b6043f674fde6314d7
> Author: Jon Hunter <jonathanh@nvidia.com>
> Date:   Fri Nov 20 10:51:00 2015 +0000
> 
>     mfd: as3722: Handle interrupts on suspend
> 
> 
> The above commit also requires the following commit from Arnd to fix a
> compiler warning (as noted by the fixes tag) ...
> 
> commit a7b956fd38dd217dd78e3058110929f5ac914df1
> Author: Arnd Bergmann <arnd@arndb.de>
> Date:   Tue Dec 8 16:21:05 2015 +0100
> 
>     mfd: as3722: Mark PM functions as __maybe_unused
> 
> 
> I have verified that these apply cleanly to the stable-v4.4 branch.
> Please can we include for the stable v4.4 branch?

Both now applied, thanks.

greg k-h
