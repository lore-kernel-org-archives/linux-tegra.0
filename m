From: Paul Walmsley <pwalmsley@nvidia.com>
Subject: Re: [PATCH] gpu: host1x: clk_round_rate() can return a zero upon
 error
Date: Wed, 11 Dec 2013 11:15:16 -0800
Message-ID: <alpine.DEB.2.02.1312111113050.1653@tamien>
References: <alpine.DEB.2.02.1312091746400.4127@tamien> <20131211151908.GC31617@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131211151908.GC31617@ulmo.nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, Arto Merilainen <amerilainen@nvidia.com>, Terje Bergstrom <tbergstrom@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org


On Wed, 11 Dec 2013, Thierry Reding wrote:

> Perhaps unsigned long long would be a better choice for future
> compatibility?

Yes - at this point am planning to go straight to u64.

- Paul
