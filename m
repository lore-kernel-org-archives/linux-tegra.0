From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL] i2c: tegra: Changes for v5.8-rc1
Date: Sat, 16 May 2020 10:45:32 +0300
Message-ID: <314a292e-bcd9-bb30-4067-71dc7cc399d6@gmail.com>
References: <20200515143924.1579055-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200515143924.1579055-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

15.05.2020 17:39, Thierry Reding пишет:
> Hi,
> 
> The following changes since commit 0e698dfa282211e414076f9dc7e83c1c288314fd:
> 
>   Linux 5.7-rc4 (2020-05-03 14:56:04 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.8-i2c
> 
> for you to fetch changes up to c73178b93754edd8449dccd3faf05baafd4d3f0e:
> 
>   i2c: tegra: Add support for the VI I2C on Tegra210 (2020-05-12 22:47:52 +0200)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> i2c: tegra: Changes for v5.8-rc1
> 
> This includes a few improvements to make the Tegra I2C controller behave
> properly on suspend/resume, does a bit of cleanup and adds support for
> the VI-variant of the I2C controller that is used primarily for video
> capture purposes.
> 
> ----------------------------------------------------------------
> Dmitry Osipenko (2):
>       i2c: tegra: Better handle case where CPU0 is busy for a long time
>       i2c: tegra: Synchronize DMA before termination
> 
> Thierry Reding (5):
>       Revert "i2c: tegra: Fix suspending in active runtime PM state"

>       i2c: tegra: Restore pinmux on system resume

In general this series is good to me, although I have some concerns
about this patch. Could you please answer the review comments?

>       i2c: tegra: Keep IRQs enabled during suspend/resume
>       i2c: tegra: Use FIELD_PREP/FIELD_GET macros
>       i2c: tegra: Add support for the VI I2C on Tegra210
> 
>  drivers/i2c/busses/i2c-tegra.c | 248 +++++++++++++++++++++++++++++------------
>  1 file changed, 179 insertions(+), 69 deletions(-)
> 
