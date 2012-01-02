From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: RE: [PATCH V1] regulator: Enable supply regulator if child rail is
 enabled.
Date: Mon, 2 Jan 2012 17:37:04 +0530
Message-ID: <96C9D994977DD0439FB6D3FE3B13DD907DBD3A9A78@BGMAIL01.nvidia.com>
References: <1325489925-5148-1-git-send-email-ldewangan@nvidia.com>
 <20120102113623.GC2899@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120102113623.GC2899@opensource.wolfsonmicro.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: "lrg@ti.com" <lrg@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

> From: Mark Brown [mailto:broonie@opensource.wolfsonmicro.com]
> Sent: Monday, January 02, 2012 5:06 PM
> > During regulator_register, the rail is set on the provided
> > machine constraints and if it is enabled then it is also
> > require to enable the supply regulator. This will make sure
> > that:
> >    1. Proper reference count for supply regulator to be maintain.
> >    2. Supply regulator should be enable when given rail is enabled.
> >
> > Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> 
> Applied, thanks.
> 
> > When given rail is registered and if it has machine constratins to
> > enable the rail then it is also require to enable the supply rail for
> > a given rail. This will make sure that given rail is enabled and
> > proper reference count is maintained for the supply rail to avoid
> > disable of supply rail even child rail is enabled.
> 
> Why is this not in the changelog?
I think this is in just different wording for explaining the change.
