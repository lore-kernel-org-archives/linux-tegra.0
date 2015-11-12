From: LABBE Corentin <montjoie.mailing@gmail.com>
Subject: Re: [PATCH] i2c: tegra: fix a possible NULL dereference
Date: Thu, 12 Nov 2015 13:54:22 +0100
Message-ID: <20151112125422.GA3758@Red>
References: <1447313163-23848-1-git-send-email-clabbe.montjoie@gmail.com>
 <20151112122923.GA31671@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151112122923.GA31671@ulmo>
Sender: linux-i2c-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>, gnurou@gmail.com, ldewangan@nvidia.com, swarren@wwwdotorg.org, wsa@the-dreams.de, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 12, 2015 at 01:29:23PM +0100, Thierry Reding wrote:
> On Thu, Nov 12, 2015 at 08:26:03AM +0100, LABBE Corentin wrote:
> > of_match_device could return NULL, and so cause a NULL pointer
> 
> No. There is no way that of_match_device() can ever fail. The driver
> core uses the same table to match the OF device to the driver, so the
> only case where of_match_device() would return NULL is if no match was
> found, in which case the tegra_i2c_probe() function would never have
> been called in the first place.
> 
> Thierry
> 

In a parallel thread for i2c-rcar, the conclusion was different.
https://lkml.org/lkml/2015/11/12/83

Regards
