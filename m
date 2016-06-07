From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH] gpio: tegra: Make lockdep class file-scoped
Date: Tue, 7 Jun 2016 11:34:10 +0530
Message-ID: <575663DA.7040609@nvidia.com>
References: <20160606165627.32676-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160606165627.32676-1-thierry.reding@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On Monday 06 June 2016 10:26 PM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>
> Commit b546be0db955 ("gpio: tegra: Get rid of all file scoped global
> variables") moved all file scoped variables into the driver-private
> structure to allow potentially multiple instances of the driver. The
> change also included turning the lockdep class into a driver-private
> field, which doesn't work and produces error messages such as this:
>
> 	[    0.142310] BUG: key ffff8000fb3f7ab0 not in .data!
>
> Make the lockdep class file-scoped again to fix this issue.
>

When I tested on T210, I did not get this issue. Want to know that how 
did you get this issue so that I can add that part on my testing.



