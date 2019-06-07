From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V1 5/6] i2c: tegra: fix msleep warning
Date: Fri, 7 Jun 2019 15:05:14 +0300
Message-ID: <8751e121-d329-20fd-e302-79654519c87b@gmail.com>
References: <1559908507-31192-1-git-send-email-bbiswas@nvidia.com>
 <1559908507-31192-5-git-send-email-bbiswas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559908507-31192-5-git-send-email-bbiswas@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bitan Biswas <bbiswas@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

07.06.2019 14:55, Bitan Biswas пишет:
> Fix checkpatch.pl WARNING for delay of approximately 1msec
> in flush i2c FIFO polling loop by using usleep_range(1000, 2000):
> WARNING: msleep < 20ms can sleep for up to 20ms; see ...
> Documentation/timers/timers-howto.txt
> +               msleep(1);
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index bececa6..4dfb4c1 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -476,7 +476,7 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
>  			dev_warn(i2c_dev->dev, "timeout waiting for fifo flush\n");
>  			return -ETIMEDOUT;
>  		}
> -		msleep(1);
> +		usleep_range(1000, 2000);
>  	}
>  	return 0;
>  }
> 

Awesome!

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
