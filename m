From: Shardar Mohammed <smohammed@nvidia.com>
Subject: RE: [PATCH v8 1/3] i2c: tegra: use readx_poll_timeout after
 config_load reg programmed
Date: Tue, 30 Aug 2016 19:16:57 +0000
Message-ID: <e02556b4de3b444c81ef55d3a4336616@bgmail102.nvidia.com>
References: <1464356224-10339-1-git-send-email-smohammed@nvidia.com>
 <20160619172136.GE2933@tetsubishi>
 <6d21b4bd199844e3a359cc52823045db@bgmail102.nvidia.com>
 <20160825193952.GC1614@katana>
 <362fc8af7f8d411c8af36b34c6165c1b@bgmail102.nvidia.com>
 <20160826155354.GC1608@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <20160826155354.GC1608@katana>
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "gnurou@gmail.com" <gnurou@gmail.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi Wolfram Sang,

I have pushed below changes:
PATCH v9 series with only taking care of review comment.

PATCH v10 series with rebasing on top of Jon's patch series  [PATCH V2 0/9] Some Tegra I2C Updates.

Please review.

Thanks,
Shardar

> -----Original Message-----
> From: Wolfram Sang [mailto:wsa@the-dreams.de]
> Sent: Friday, August 26, 2016 9:24 PM
> To: Shardar Mohammed
> Cc: Laxman Dewangan; swarren@wwwdotorg.org;
> thierry.reding@gmail.com; gnurou@gmail.com; linux-i2c@vger.kernel.org;
> linux-tegra@vger.kernel.org; linux-kernel@vger.kernel.org; Jonathan Hunter
> Subject: Re: [PATCH v8 1/3] i2c: tegra: use readx_poll_timeout after
> config_load reg programmed
> 
> * PGP Signed by an unknown key
> 
> > > Still interested? Should be an easy change, but I am reluctant to
> > > fix it here with no testing.
> > [Shardar] Will push the change by tomorrow.
> 
> Thanks. If possibe, could you rebase it on top of this series?
> 
> [PATCH V2 0/9] Some Tegra I2C Updates
> 
> Or is it easier to rebase Jon's series on top of yours?
> 
> CCing Jon, too...
> 
> 
> * Unknown Key
> * 0x14A029B6
