From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: stable request: 5.4.y: SUNRPC: Avoid RPC delays when exiting
 suspend
Date: Mon, 9 Dec 2019 10:47:05 +0100
Message-ID: <20191209094705.GC932866@kroah.com>
References: <370ef599-8164-170c-8ba0-f8a9082578c4@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <370ef599-8164-170c-8ba0-f8a9082578c4@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: stable@vger.kernel.org, Trond Myklebust <trondmy@hammerspace.com>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Dec 09, 2019 at 08:46:24AM +0000, Jon Hunter wrote:
> Hi Greg,
> 
> Please can you include the following for 5.4.y. This fixes long delays
> exiting suspend when using NFS and was causing one of our suspend tests
> to fail.
> 
> commit 66eb3add452aa1be65ad536da99fac4b8f620b74
> Author: Trond Myklebust <trond.myklebust@hammerspace.com>
> Date:   Tue Nov 5 09:10:54 2019 -0500
> 
>     SUNRPC: Avoid RPC delays when exiting suspend

Now queued up, thanks!

greg k-h
