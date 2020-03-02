From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v1] media: staging: tegra-vde: Use
 devm_platform_ioremap_resource_byname()
Date: Mon, 2 Mar 2020 11:04:56 +0300
Message-ID: <20200302080456.GD4140@kadam>
References: <20200227180915.9541-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200227180915.9541-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Feb 27, 2020 at 09:09:15PM +0300, Dmitry Osipenko wrote:
> This helps to make code cleaner a tad.

Please don't start the commit message in the middle of a sentence.
It looks like this for some of us:

https://marc.info/?l=linux-driver-devel&m=158282701430176&w=2

I generally read the subject or the full commit message but seldom
both.

Otherwise the patch looks very good.

regards,
dan carpenter
