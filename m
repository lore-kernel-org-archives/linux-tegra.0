From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC 25/42] drivers/staging/nvec: don't check resource with
 devm_ioremap_resource
Date: Fri, 10 May 2013 08:24:58 -0700
Message-ID: <20130510152458.GF11227@kroah.com>
References: <1368173847-5661-1-git-send-email-wsa@the-dreams.de>
 <1368173847-5661-26-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1368173847-5661-26-git-send-email-wsa@the-dreams.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org, linux-tegra@vger.kernel.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

On Fri, May 10, 2013 at 10:17:10AM +0200, Wolfram Sang wrote:
> devm_ioremap_resource does sanity checks on the given resource. No need to
> duplicate this in the driver.
> 
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
