From: Tony Lindgren <tony@atomide.com>
Subject: Re: Regression: SUNRPC: Use poll() to fix up the socket requeue races
Date: Tue, 26 Feb 2019 16:31:02 -0800
Message-ID: <20190227003102.GF39872@atomide.com>
References: <95702994-6762-e42b-06ee-ae945c2137bd@nvidia.com>
 <ab485d7ba4f9603850b81e6c2242dc25026eabcb.camel@hammerspace.com>
 <88677895-7f89-ae1d-3060-819f4b04f530@nvidia.com>
 <9b9a6c5e34edea13b3ace42d39d97c27fd21c0db.camel@hammerspace.com>
 <20190226183340.GD39872@atomide.com>
 <eeb255aca46e9b1d9d030c5b917c663b83468bcb.camel@hammerspace.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <eeb255aca46e9b1d9d030c5b917c663b83468bcb.camel@hammerspace.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Trond Myklebust <trondmy@hammerspace.com>
Cc: "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

* Trond Myklebust <trondmy@hammerspace.com> [190226 20:40]:
> I've applied the following patch to my 'testing' branch: 
> http://git.linux-nfs.org/?p=trondmy/linux-nfs.git;a=patch;h=a73881c96d73ee72b7dbbd38a6eeef66182a8ef7
> 
> It has so far stood up to testing on my side, so I'm expecting to push
> it to linux-next this evening.

OK, works for me too based on a quick test of few NFSroot boots.

Thanks,

Tony
