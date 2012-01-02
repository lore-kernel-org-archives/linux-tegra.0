From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V1] regulator: Enable supply regulator if child rail is
 enabled.
Date: Mon, 2 Jan 2012 11:36:23 +0000
Message-ID: <20120102113623.GC2899@opensource.wolfsonmicro.com>
References: <1325489925-5148-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1325489925-5148-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: lrg-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Jan 02, 2012 at 01:08:45PM +0530, Laxman Dewangan wrote:
> During regulator_register, the rail is set on the provided
> machine constraints and if it is enabled then it is also
> require to enable the supply regulator. This will make sure
> that:
>    1. Proper reference count for supply regulator to be maintain.
>    2. Supply regulator should be enable when given rail is enabled.
> 
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Applied, thanks.

> When given rail is registered and if it has machine constratins to
> enable the rail then it is also require to enable the supply rail for
> a given rail. This will make sure that given rail is enabled and
> proper reference count is maintained for the supply rail to avoid
> disable of supply rail even child rail is enabled.

Why is this not in the changelog?
