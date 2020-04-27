From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Date: Mon, 27 Apr 2020 12:35:53 +0200
Message-ID: <20200427103553.GA24446@kunai>
References: <470b4de4-e98a-1bdc-049e-6259ad603507@nvidia.com>
 <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <20200427084424.GA28817@kunai>
 <820200ce-17f3-18c0-6f79-3e582f45492d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <820200ce-17f3-18c0-6f79-3e582f45492d@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Manikanta Maddireddy <mmaddireddy@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 27, 2020 at 12:07:19PM +0300, Dmitry Osipenko wrote:
> 27.04.2020 11:44, Wolfram Sang пишет:
> > 
> >> Wolfram, can you revert the following two patches for v5.7, please?
> >>
> >> 	8814044fe0fa i2c: tegra: Synchronize DMA before termination
> 
> This patch has nothing to do with your trouble, why do you want to
> revert it?

I'll wait some more before pushing out, so you can discuss it.
