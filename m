From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: Re: [PATCH] [v2] media: staging: tegra-vde: fix runtime pm
 imbalance on error
Date: Thu, 21 May 2020 15:03:45 +0300
Message-ID: <20200521120344.GH30374@kadam>
References: <20200521062746.6656-1-dinghao.liu@zju.edu.cn>
 <20200521112131.GG30374@kadam>
 <4b400526.bbc83.172370b23a0.Coremail.dinghao.liu@zju.edu.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4b400526.bbc83.172370b23a0.Coremail.dinghao.liu@zju.edu.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: dinghao.liu@zju.edu.cn
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kjlu@umn.edu, linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-pm@vger.kernel.org, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, May 21, 2020 at 07:42:56PM +0800, dinghao.liu@zju.edu.cn wrote:
> We need to make sure if pm_runtime_get_sync() is designed with
> such behavior before modifying it.  
> 
> I received a response from Rafael when I commited a similar patch:
> https://lkml.org/lkml/2020/5/20/1100
> It seems that this behavior is intentional and needs to be kept.

Yes.  This is why I have said twice or three times to not change
pm_runtime_get_sync() but instead to write a replacement.

A large percent of the callers are buggy.  The pm_runtime_get_sync() is
a -4 on Rusty's API scale.
http://sweng.the-davies.net/Home/rustys-api-design-manifesto
One could argue that anything above a -4 is really a 2 if you read
the implementation thouroughly enough...

regards,
dan carpenter
